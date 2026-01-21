Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9E190462
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965627; cv=none; b=MMPApkqLdtGsJw/sWkRlPRPa0XLanadbsJNH4enTe5rXpgXvEz8TXfiyYryJc/YbGn3jE7zFtj2/fBeFyAYftmjmoftlefFL8Pigum5hMt8ML/DonXJl5A6+gq8NhL2u+WvXxNHeqFb0HsYnkRY6ub68R423YIADCy9s/0+HB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965627; c=relaxed/simple;
	bh=jWQK8hz9bGTtCAsJhY5I94BjN1fB3IOX9lF9/VM4pro=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PDuE6NK7mkYQHNoUzf3RfRUXEcA9whXzkZocUSMQSqzSMFDvqsTIfIPgq3QEav7zLT9kiUB6nXZFobWw0snrvFXkP2/qErKX+W9WJ+M7ARwX71yrNSVI0O3f/5fbslR672L+rXxSeHP3Tw6ZPr5eXf846+z8pgrQwria4zmvhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhnyQWvy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhnyQWvy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07fac8aa1so45986995ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 19:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768965625; x=1769570425; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENJy6NtKsO9aQqhGsET5QqkuIFBDfe/xZv4HvwTdfk8=;
        b=FhnyQWvyp0sJLp6DjN71JV/w5dGbrGTTxw7XHxMT9mwoMrH9IMSAx1v1YEI1W+Kncb
         HHLBU3Km+I7nMoVLVUwZ3UXNWOW2AXzY/KJeTJ2vIkby+5olfHgOsvGYdWCbb8WtuAHk
         WCYuMcQpumwtQE2HoK2OeZzYLkEDa5nHF8X0GinXJ99pSiqCTHvhnRxA4otw/MUD/bPY
         JZ3TJ7vPkywzqyL+KVV9fvSCg2MNCLRc6xZHr7+COjNMDEKX5cK/RqEXlou45zuowzMN
         0PeTVCMljYHAOtHpB+W3lWhn2vbF5H9g0Q4NYjqWzFfQADFhflL81h8fl9Sbny/MQKSm
         RLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768965625; x=1769570425;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENJy6NtKsO9aQqhGsET5QqkuIFBDfe/xZv4HvwTdfk8=;
        b=U/YXeOuYYC5I2hDP61x25ceSCHu96O4jQhT+YvWIFTtwacVeAiXZkKyrCeudl1UYqK
         dU4/6relg8pljFK8shTjGsWoAYeRXyc0qPRV7Rwc6seURyq4ck6R5e9RCuH6iVwRnJB5
         iO5JavY6y9s+wd67dokPMQ5vVzJKeNx3vL3jMVtBZEGtlMrHvraRSIVVgaLtEeTH+qVu
         wDzWb34t1fVNQ9oUVSmlK6xbzBfmRuWmkpgixleXTrY7ecJjZtgZjILoGF253VV5zs8p
         GymYH1chPUu5/kz1jKORJwWVRt/g0qqeau9FijyWCvLjJ9Z5H4034aZxev7LOmdDrVW0
         Tx4A==
X-Forwarded-Encrypted: i=1; AJvYcCWnqaGb3TvXjPVyKgvGoqvprIaepknj1mZOYDh9wccFoz2S4EQwgpvBChneu8rOKj9tUL91nRNBfHZCHdva5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6nzsopbE08V8AtKy6eSU1WdQ/bkyUPMkQTN/BPLPz8nkKxEU
	SlrL2wutDhPHSn6O6bKUtoG/+0jxRJtctvbZF/OjvEhwrMNpm/nD39vr
X-Gm-Gg: AZuq6aKF4Wz1xdN4cclHIXe2lNtWQxJPxZNXUZV69FgL2W7rJz2CqC9eiVtmmeYNSNM
	vkMVcmHGS477Q6Y6mbRhQMhMhhsMGDGIvmllKrozSPGcswRK3pVRh2k/hs+bhQA3wcyjaPUMXx2
	UV65O5PZMXaGnAG4WgsmswNzRaQ/yqjWVu0McOs1dMM1Ongsx7CwyRl2WDA3zi0KZfy4I3jZa/M
	rGuiFAQDO3X3v18o6d4UUzOTxXGJNcVcSXBgh+jtVYpEiHm+9RuyfsddRY5nT9HXvbR3Vugfymd
	Q5loM8WzJ0DvoII91JhTyH//ZwMYy2T3LSKsB+zYXJD6HZxqE5qFcSL6GDsc+ugFc0kxmVCNFdT
	a1RKBai7F1oPfo3MQaXX5G3Y2FKswcitrJ3LaiYdeB9pkqRvc5oq6ePJUSlW54U72haVo3Lsyxo
	QlniTXCA==
X-Received: by 2002:a17:902:f689:b0:2a0:a92c:2cb6 with SMTP id d9443c01a7336-2a76ad6bb37mr36121375ad.36.1768965624996;
        Tue, 20 Jan 2026 19:20:24 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a773de1fe7sm28075635ad.82.2026.01.20.19.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 19:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 12:20:20 +0900
Message-Id: <DFTXZ7AN65B2.ZW0EK0VZFYT5@gmail.com>
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Benno Lossin" <lossin@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
 <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>
In-Reply-To: <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>

OK, let me reignite this series...

On Tue Dec 30, 2025 at 6:09 PM KST, Benno Lossin wrote:
> On Mon Dec 29, 2025 at 1:29 PM CET, Jesung Yang wrote:
>> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
[...]
>> To sum up, I see three options:
>>
>>     1. Drop support for `#[repr(C)]` enums entirely.
>>     2. Special-case `#[repr(C)]` enums: allow them to default to
>>        `isize`, otherwise require `#[repr({integer})]`.
>>     3. Permit missing `#[repr({integer})]` generally.
>>
>> I am personally leaning toward Option 3, since our existing
>> compile-time check provides a sufficient safety margin to allow this
>> flexibility.
>>
>> Thoughts on these?
>
> Looking at the nomicon documentation [1] again, I found the following:
>
>     repr(C) is equivalent to one of repr(u*) (see the next section) for
>     fieldless enums. The chosen size and sign is the default enum size
>     and sign for the target platform's C application binary interface
>     (ABI). Note that enum representation in C is implementation defined,
>     so this is really a "best guess". In particular, this may be
>     incorrect when the C code of interest is compiled with certain
>     flags.
>
> Which to me reads as "don't use `repr(C)`, if you want to know which
> repr the enum gets". Especially the last part is concerning to me, as
> the kernel uses lots of (bespoke) compiler flags. So I'm thinking we
> should just drop `repr(C)` enum support. Any thoughts from others?
>
> [1]: https://doc.rust-lang.org/nomicon/other-reprs.html

I think the last part you mentioned is less of a concern in this
context, as this series does not introduce new FFI boundaries;
`try_from` and `into` themselves live only on the Rust side and do not
interact with the C side. We are indeed relying on Rust's "best guess"
about the internal representation to perform compile-time checks, but
these trait implementations do not pass enums across the boundary to C
code.

Your concern is certainly valid for anyone introducing new `#[repr(C)]`
fieldless enums that interface with the C side (and we may want to
revisit any existing ones). In our case, however, it should be safe as we
ensure that discriminants do not overflow Rust's own internal
representation of `#[repr(C)]` enums.

Best regards,
Jesung
