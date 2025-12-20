Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B445923ABAA
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766237219; cv=none; b=dZuBj/8K3kpamMpUd0GOEvl9tfVi6BABhdWQpHhoWy1yeQqNYX9L9LdeF2UH11bv+nRohkNaSEZrI6l/xnoyNdt8n2QcqqV7uBMWz6ab1aF4e0DThBmLoqn7TDpLEdj1N6I6WNorpF6VgQqyfuE6CN0THhzBpJQydlaMz65sEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766237219; c=relaxed/simple;
	bh=ZszcD9aZyqLmppNl6uOYsAZ/9RvyvzsZifB0jXA3f2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xh8HgC2gs0tiL3Vwp+vTzbgP44PgzvgPJjSEA8yvC6kwyQW19NNEKqNDT6hmToakBRn1aDuzKeEmI3YZ9+KHAow1LkW0Ei36XMVbQPUvys+urcjJG4tM1p27dIhkFjcEFricZG2mWb6t50dpy80ffhhwSJNIoe7OfrqRpgrmS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTHMbCBH; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTHMbCBH"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so2589516a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766237216; x=1766842016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0hMXtp/lfaKs61nOjhlRq2RZbYRAnfd/dUReiralVc=;
        b=hTHMbCBH4qr1vHUqXbStopOYeZi840obDA6drJtieldITnPh3RiywU5HGgMNzQjUnl
         nTskan3TloCayerovN+CZPVahOrwI7RUyZ71WxKwJqBR9ElPNOZSd7DRARHu6lvGBKut
         bJbHrnSb+r+Fp0fSMapd7RHrCHrkqly9eKJMMLDHmUVRNtovDSryf7cZ0MmGBlKA5JS8
         1sez7j9iKlOW3CnvB2RWzzBpCpYqFd8zRbW08I1QTz37vTvK1Ieq4TXBYtSBTHGt17rp
         3NkT97UUE9riKJ3A0ZpaHNa4ln/WxBcwavKq14zIAn98yxKdKqgQG9YLbY45OaNe9xnE
         VjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766237216; x=1766842016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0hMXtp/lfaKs61nOjhlRq2RZbYRAnfd/dUReiralVc=;
        b=TluwiYKGoiofuiRBUrPAxvkTLAo6D+fOOHOeDEE2/a95Xdg8ft00lrQwOCz5eVzXyQ
         P/1pjqG3G79ws5c20rj48RKiKfkH5Qfc0++NwrKK0v8KG8nXS7YKbt0wYaOnB3Qz9fbs
         QJsbNvty3gcbtw0SSjPjQWyZdfZwSLPUa1n7WPEPmFB7wEq4qH6ER5i3RdNSwNRUnRhD
         Q2TB0iXvGyYMJs//N3u1CZzkmCmXn1IIM89B5xsZKFu4ksa3FS7ZqVeCbBybxoqdlAZ9
         FbLqCpzHwfmaZFfuNtSDHizCX1y6YKdf2pkyiPGUytbr35EXNKBvhnSHtwtltznDkdnd
         DyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFMp6VXs9qd+2Rlxhh5RTUB5RxNrtMQAatSioS2T5EoXC4vVbLhCSlJK0r661i++R632C5HpLtB0V7GaW1Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqatw+Gy2zt9we7V4gNGs+CAh26uk68z+N8Ht9j9f09ODbSg9
	d94xKT1Aa4k9wjEi9/SVUJpFa2YyPkd/kgkDgt8CPFcrOWYApXEXwuDX
X-Gm-Gg: AY/fxX7nEMi9gjsAngP69WI4pFC0uf0FAoF67W7de6+y7/4K7UST23q1vDe6mNRaCq6
	7RfZeBR5A/hIsPB2uvbE+02KNiMdK0IbSEL1Im0nxpE8bH6Mg3tjikLwoepfWAI1XnwQMwhUz56
	K/Jtq0NhDJtT9OYJRTNt7wKDmRsMkbXq/UHP1XHeLV3UDs3qX2voVKlf5X3UHYpa89F9tZY6il3
	IN+0BMxhci42ID1y3hOlI92/y8jNDOHYhhvtEMiPKW1lBT45mykJjWTwrhtUUv4JjSH7jtbyRc+
	DigwkXWEEuokzt4cRRIdc58paYr9l3BL7EvQz+wcYH5wAnd7iIeyFweRMs3VjHcEhPtE4Zy4cJg
	SmcGEZHodBFZUjeX32oRKXpUIAUI3qa0FXIKpSuUpeIQQkMbZXMgno0e7vCPDQS3lwx530AOyCY
	41Klt9c/tLLJQGqsObc8yfAJbAxgZplFwdVknzeomqSRU26RJSH3M5gEtfkmv3mdxaEzYQ3WPXg
	R5NA9n6fRyT/oicu/wqKASZLer/t46ZfJ4/in+F3ZZuhQ==
X-Google-Smtp-Source: AGHT+IGQG9QpYLfU4h8xN3mNdzv5dB2m+jacD8KkbE346mRyFnogzecStI4R3a2FK5Ch18aosbwARA==
X-Received: by 2002:a17:907:c14:b0:b80:1309:aa09 with SMTP id a640c23a62f3a-b803718387cmr612957166b.47.1766237215643;
        Sat, 20 Dec 2025 05:26:55 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:6a92:2e3e:53e0:d832? (p200300dfbf2de3006a922e3e53e0d832.dip0.t-ipconnect.de. [2003:df:bf2d:e300:6a92:2e3e:53e0:d832])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm436626666b.34.2025.12.20.05.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 05:26:55 -0800 (PST)
Message-ID: <518143d5-b273-48df-94f0-664116358665@gmail.com>
Date: Sat, 20 Dec 2025 14:26:54 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: document safety requirements for fmt::Arguments
 dereference
To: Riccardo <riccioadami@gmail.com>, rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20251220130014.3961-1-riccioadami@gmail.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251220130014.3961-1-riccioadami@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Riccardo,

On 20.12.25 14:00, Riccardo wrote:
> From: Riccardo Adami <riccioadami@gmail.com>

If you configure your mail tool to use `Riccardo Adami
<riccioadami@gmail.com>` automatically in the `From: ...` (instead
of`Riccardo <riccioadami@gmail.com>` which is there at the moment)
there is no need to add this `From: ...` manually here.

> This patch documents the safety requirements for dereferencing
> `fmt::Arguments` in the kernel's `vsnprintf` formatting path. This
> clarifies why it is safe to perform the unsafe dereference in
> `rust_fmt_argument` and helps future maintainers understand the
> invariants, reducing the risk of incorrect modifications.

Empty line between the description and the Signed-off-by please.

> Signed-off-by: Riccardo <riccioadami@gmail.com>

Please use your "full" name here. Like you have done in the manually
added `From: ...` above: Riccardo Adami <riccioadami@gmail.com>

> ---

If you send newer versions of your patch please use some versioning
v2, v3 etc. This has to go into the subject e.g. `[PATCH v2] ...` and
needs a change log here below the `---` e.g.

v2: Add Signed-off-by ....

Maybe you like to have a look to existing patches like

https://lore.kernel.org/rust-for-linux/20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com/

>  rust/kernel/print.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 899bed9c08fd..5f54be97a6a0 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -25,10 +25,10 @@
>      // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
>      let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
>      //SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
> -// specifier during `vsnprintf` processing and always points to a valid
> -// `fmt::Arguments` value created by the caller. The value lives at least
> -// for the duration of this call and is only read here. It is not stored
> -// or accessed after returning, so dereferencing it is safe.
> +    // specifier during `vsnprintf` processing and always points to a valid
> +    // `fmt::Arguments` value created by the caller. The value lives at least
> +    // for the duration of this call and is only read here. It is not stored
> +    // or accessed after returning, so dereferencing it is safe.

I have some difficulties matching the description in the commit
message above with this change. For me it looks like you just fix the
indentation but haven't changed anything on the SAFETY comment itself?

Looking at the original file

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/print.rs?h=v6.19-rc1#n27

I wonder if in the end you want to update the `// SAFETY: TODO.`
there? What would match the commit description? But that isn't done
here. So if this is the case you might want to check if you sent an
intermediate version of you work?

Thanks for working on this!

Dirk
