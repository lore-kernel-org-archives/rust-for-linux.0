Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961948;
	b=EOpVu65cGpapPNl/0SrvLTmzuNJHr+g1G/FE4PE4nMCCdoIMABpZ3dkAoSFuga41uEIQ
	 MDHlxWR/9ZgXwA11szbStdRu30oylEVohN6uJrLYi1yi+nloQK3rvyptxgaM3n3zfg1l3
	 xYMPZVEV4GsCwqnKuHZIfcn/8RM6NzmeKOzknGJn1L0H4CqJ5PwY6IXHG5wxapwceQz7G
	 YP1nvDAIH/M/2/vh4yXcvW9xsffXHdi6Oh273nXnX/K4Elscv4r4L3m8UM100ipzgvKTa
	 PKdd9HlgKYch0LwvG7NYrNZD0D7XXyiYiAfTEUJF44u9bmA50PPaanfAeYYRagVibXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9d4zmqowzFyjpS1+CWDAo2gFvDOoR0tDmX9/Gr/o+TE=;
	b=4wFCuL8zVNfuObO9cbXdcbf8vtZzIbsoJysn6yN3N+ZJj6v3+Pw6ukt+NmOBnTO7SVCZ
	 r5xTRLDXdtHMV+v7yU17sJSinkuT1se/4ryR7Y0iNmguNjGcC4C48FXt1lYnwPkX/7mSA
	 HCpJNWyaYMsDeb+EetwNZdzeaOSnvwbmQCARn13v2fh5q5zxS1eZkd6rsYfmUiRbOBK1t
	 pCtzZ/FmK+vZWedM49pAAfgQDSs8g/Kca68W9LAGVShYgdiBmnobMy9uPHun+NLGuoSc6
	 /moK57qk6cvfteIp4f5SMGRGiPIGfvXNtRe1WFbDmgOsCdXeMzIIEcyh36fPBeKqxhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KFsoFxbm;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51566606A326
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 10:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51566606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KFsoFxbm
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b6ed7a9ffaso166745a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793961946; x=1794566746; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9d4zmqowzFyjpS1+CWDAo2gFvDOoR0tDmX9/Gr/o+TE=;
        b=KFsoFxbmSg5jZA5zlPMYhng49X5QiS/f2vRe9N5cbn8SAyS8ftNLN/yEbDeWRDzSsr
         boE5ssBINTSCH2JQA1dFQvMYotEHwHab7gurMySBUQUG9KtYmqtI4xzUz1mryg4Q5ZP6
         XyJb4YNV5n1Zd+3g18qYKvesUEnS3YDmS1X8g4KbzzkWJsFYfjm6OSSfleLKcpS5bdm1
         qpzhHgG/81nSyr2wAlrTJ2VcTZU2TwtSwzB36iCq7IKfxeZ1l5bblyD3yI5ApwMuNhiG
         pz1qLVLsKZxjmDsEUuR3YI9OkbDqPapjNAHvgfWq8h4wZLk95M9k1Y4dsPJEWnc8GYiA
         u+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961946; x=1794566746;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9d4zmqowzFyjpS1+CWDAo2gFvDOoR0tDmX9/Gr/o+TE=;
        b=q8kPBdJgLwKOWHj/0rL2P6QD3E+h/N2BK2mYS8duNO1hM/hYYOrLrj8KoKl0tl3uCr
         yc3tnSRsuW2ULKIY9J2ONtoAHijv2nvT7qhfYymKz7sxxqW1u5eVpvMWvWcHVKrvlPhk
         iSidc655K8GKq6lGKLY6zWurq+CokdjnpVqkC7pIUxaoH+q5WjY6UqXxGM2/+P6T26JB
         5AISx1FbOmxpMY91Jdp/669ISDoLvJO6qvgPpTpL+2Kj5ztfo+ei0p3DUhU1auNuCZpk
         9jd2/pXFu0UTucTO3Gyui1N+F8wMsAwZ1lvQZRBoq9UeAggTp9r+PDZvBWCAAO4wakHf
         f48g==
X-Forwarded-Encrypted: i=1; AKwUvBzlyvrpn+8cLMT0neGWhPA3jCtkK05/SUlaSFZJTxYOPjVaYS7K5gI4IFRSjYIP0gkVxaZUIkVaOJYZg4vP3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xQJMTjAzoGZ+RtbXgWRCcAmxdSZ3Z8zhCNES7GjlMbrN+STfU
	Q2c3NGW0YLRP7fYxOiZ9WeAdX7kMSambi0LI1Ym9QofDLHh3qlxzNWLzpBxraEKL2bKjHEeEKAq
	vjPLDXhgfWPBRfZv3Bg==
X-Received: from edqi22.prod.google.com ([2002:aa7:c716:0:b0:6b5:8cd9:f07f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4014:b0:6b1:ce0f:eb6b with SMTP id 4fb4d7f45d1cf-6b59780db99mr1761923a12.31.1793961945470;
 Fri, 06 Nov 2026 02:45:45 -0800 (PST)
Date: Fri,  6 Nov 2026 10:45:42 +0000
In-Reply-To: <20261106063745.87864-1-ojeda@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106063745.87864-1-ojeda@kernel.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261106104543.2297426-1-aliceryhl@google.com>
Subject: Re: [PATCH 6.18.y] rust: bitmap: fix intra-doc link
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Burak Emir <burak.emir@gmail.com>, stable@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 06, 2026 at 07:37:45AM +0100, Miguel Ojeda wrote:
> `BitmapVec::MAX_LEN` does not exist in 6.18.y, so `rustdoc` warns:
> 
>     warning: unresolved link to `BitmapVec::MAX_LEN`
>       --> rust/kernel/bitmap.rs:24:25
>        |
>     24 | /// This also matches [`BitmapVec::MAX_LEN`].
>        |                         ^^^^^^^^^^^^^^^^^^ the struct `BitmapVec` has no field or associated item named `MAX_LEN`
>        |
>        = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
> 
> Thus link to `BitmapVec::new()` instead.
> 
> Fixes: 37f45fe068e0 ("rust: bitmap: restrict bitmap length to at most i32::MAX")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Another option (cleaner but a bigger change) is to cherry-pick:
> 
>   f5535d78e126 ("rust: bitmap: add MAX_LEN and MAX_INLINE_LEN constants")

Both options (this one-liner fix or cherry-picking f5535d78e126) look good to
me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
