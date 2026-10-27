Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111735;
	b=VtJc0yLwdKXQBf8T7YMukChHnUP2r9/qoZ5h0AANwkEM1iy6LqwMYKnctGGVFSWojK1G
	 F5sk8y1BWZNumEUswQlcCXvGjryqgwkRWu55HgiCEbw03Z6ItraICdTywXJuIyEVAXDvu
	 KFnlpxZBN3VYulgxxx++11Zy6MjcLi3gfRnbrml/uH0Y85wj1l5UjvDHXZglDzY/Xzx71
	 UlaxRmNpWTWcNH6W0RrsF1xO+8CI5MOwN9uwSktWVct3MOx2kzLx8mNEg3R+Ox2gUXRJ3
	 KnlTrknIrHTeopgqRVHFiNk2pmu3i1nF6/M4ivlpHH3d7lctOyl+jmpYJ245cjZwIzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
	b=Mb9xR36dy3o8ynfFnP3gX6URGOcmjyJZLLY24T61fvm6Q/ilxIN5jwp/QChCGuKxT8dY
	 k8OAZ+J+QOvgsAXHDQFgbIpb7k45ac651t5t/11B3K6s07mcpgMoqTNoj95MU9N8Cp60g
	 m7rZ0Ui5ULpJlFOerl1CjnWz0wn0sbtifpkja//Ue8da788uEVwZsQGgolEyn/hsM6Hw9
	 JEMZuUZheyzBBzTVvX0/9CZjNBrFsBjJwKuGb4MK+R+o9Z7adrOgsP3c+1u6XDqaI3aHl
	 WsdsbKrKkR7mY2nZjKszaAHwGHHqleb1JjHwHpRnc0KXULM6MWCeVq9iAs02UYGOfeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwWt9o8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01911606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 14:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01911606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwWt9o8Z
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso5877580a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 07:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111733; cv=none;
        d=google.com; s=arc-20260327;
        b=RudLvBzEyxmS//D93eCQTneMysAogkUMcA8ygY7gFBymodblh2RB8DvbJ4Uc8aCtC1
         neqnoYDBhZc4j0bbp2XO+K0cO2Tx77y3jzTIZ5kGD3N2LPg75e52aSC18l4Lm6S1RxnX
         F9nU7Ot2N2LimJ9hifZZGVHovZ5iidppnYPY5socA/w8DPfrzgAjmb4qyauNq5G/o2Vj
         ZwYj4Xu0rc67nNCHYKwYH6le0PDCpO/xb4q4w0JWqNOWkzvNdjaI4q1JhyOO9uuyA0y/
         VEYnB4yApGa1e1us+fS92EFSIa1f1l1kP4I5+82iwGq2UUizsx3cIeKPR+iSCMnZW4qf
         1ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        fh=dCeQ8siHCjU8iua5S+4hmd0kkrfxt7jNEmGOSmLbAa0=;
        b=bm/YhZUjIbWoLa25aOdtvSMHVHaceSKCrxASx43taQXxE9eRSF1fg4Dz+u4njubHA8
         E9Jl/os/mzSVNazTIrVtGVhA/jDc1HriviOJ9/8u4h7yA8pM7VgH1/loIpkc6XDoWVMa
         p4dfmL5OdWS4/5XfpbaSc4pTKkgmzoKOCUkMa5snp9pHKV/pScNoiu4tHTLZL8oSDnH0
         vL3xHcQYPTCNBv7ldEiWGZR5EhUIe0NHkzS6lmvA0Ky7KFa35yJlgiqSmrmd8MY7QbAK
         R2VTeWGagJ6uwWoAsqycTIFSaWFKaR6Z11MjjpNTwmiPA308MEwjGckTomwGbetWTpmN
         YPnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111733; x=1793716533; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        b=UwWt9o8ZezP5LeWGsoH8IS5Pner7sMD3rjIALXXVva+aYX0GxB3y7bKdOWStFLmazx
         avuMDRiQjd9PiV+n/3fHALJDHwPlZTfzFvaQvoRwk1zs6PbcVIg0Ph1Z6jVnHMGez22u
         ApISIBeOMpYJ8MRZdxWbpFMxHnJZ45XGhhZdyLqrpcks3sxzdo5qbpS1BJalBOtvNhBQ
         YbwC+04kBEjjbVfB42yblfiLCr/NhQRmn5cUkWcqS1gDSRk1MTn9eQVFm3uslPsAOpea
         bMLCUie3NhqBVTRrxn3xlNoc7xUV9/JbSMIhgnmuVkfLiYJCNmUOho0zseiVespNUnJR
         42HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111733; x=1793716533;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        b=sMpWVAvxBw4gSH9EfSrn69gt0gG25M1bV3E2qOg9tokcdzuusSWBH05EMgp3E3K3YG
         ZFVxSInJWfZgtkVapP9LCmXeFlZlHr4UYqVUWf3bKfuziSQMr003Ht81oPI0dED1ejf5
         IajZGNEM0NsRzI8tBjC6ssplj+q3vZ4lb7pQQws9LURuBwZtfavgVV7Tq6F/4kI4leBd
         UYa7eXWoMfAoJO2eZiDvJI8hmKgZdPUXXySJcxoJixyLm9Hgoffc21gCjO8Gi7YUMMDG
         a0ux/82myGZiEecPIjD2Z2ff6v71gIzg43ULkkgVi6jYwChWO8icjWShaNaUU/m/8HOP
         52QA==
X-Forwarded-Encrypted: i=1; AKwUvBxKkgRllUrur3lQmSj3+sLQALzRV8TTSKuVNqG/683JA4UVbkl02cT2kgPn20EjgR2hGK7vVtWddv/xr5PHlw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7xoeLnryl1Y+n32721jf+yaBS10ZDvEG4Q1RI/3gHynYNo0HY
	ECpKyr4W4QflFWg4hZymyUnCUaKOQLLwYyEPq8gXoJxJqHqIPnDsHhhH2o7D46HOfQCQV2bG+V5
	y10+QUb17PvgEpOJJqFcHRAfq3iXwt8U=
X-Gm-Gg: AYBFou0MWhrNnzdWdydK2IZ9FV5Fu0IFBjHceDnnGBgDEJEQqCZYMHxaBghhUKIq2Up
	Tq5c0+agauJfgNBJ4pNYk8w/bYhR4Dj+8NoP3q1/6om6CDnKnUoOyUaCndpblkzcOtJZ9jc4QcB
	Xvkpvaf96NyHzN0jGHXslzi6SwnPidQqKnZf53vn/OiypwdSKGIPPxn6yqwHGt4+znXn8CEGL3y
	rBGsY2zK6vFtxlMAx6y2DPFUq9r3kKUt6DAVe7BjL5xJ/RUjxOm2WwN6f83lgpK06Cu6obKU1eZ
	LfAVUW+GxfWsZdD4B/+5SaiVlOUhoi8htiAGUrPKc02n/lQObQq4bQA/3qlaBD2jALMw4JNgTpV
	mjfV/aY3dmMU8SmKOhoRHD+ihtn38ZP3Rt4/nGw==
X-Received: by 2002:aa7:d48c:0:b0:6b1:c7d9:b61e with SMTP id
 4fb4d7f45d1cf-6b442fe0840mr7297104a12.22.1793111733086; Tue, 27 Oct 2026
 07:35:33 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Agger <felipeaggger@gmail.com>
Date: Tue, 27 Oct 2026 11:35:21 -0300
X-Gm-Features: AclHuK-GHLEyqr6KB_kfCjwvu3tRikc3hEyilqurJguoavY6ZDCGH81xmKudJ-c
Message-ID: <CAETh984mtGx=sJciwk0Gdfa54FXpBgE1S-0XZ-eg=BHLDveFtg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add conversions for raw flag representations
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Felipe Agger <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felipe Agger <felipe_life@live.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

Thanks for pointing this out. I hadn't seen your patch when I was
working on this.

I will use your patch as a base and send a new version (v3) of my
patch set building on top of it,
adjusting the missing pieces.

Filipe
