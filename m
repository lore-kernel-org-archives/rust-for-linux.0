Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793463483;
	b=2zLSUrFLdYP0ttDlClumixIUOdIZ7EvWITtIvgLvxrIqYE0hj+S8VW6A+VwzT4OPOCDa
	 QYyx4hTolp0kICLmwpIXrT3XYmCUGkdzEDFZyMLbztWvaq4PSHT/eX9t/HIb+NCKfJ47H
	 1tFPdKG+Dqjt8wXEdeajv3I3Ck3CVcI/ZRFDzYwAO7/N4FeXWidDhGMCkGdr+XBb1z3um
	 1Ctw/uSS5e+gjfFiKVJMYbnULMj52CkswyTwAc1KjFwO9k1HHu1+lIBfDCDIAzzBLJQjA
	 UWGccCih8e/hGrwiC0mKxas5C/hMyh4igz+ew3ySMN7b2S893ZQJdSoI5JatnCkzl4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
	b=x/+4ueFyu6G8FhexMNIOlkn8lCmsp9dF37pEeS/l72PCKKk62kneycpQtgUVUHb0h1Uh
	 mr2zqgkzlL9Wu7FuvyVK9Gsa1YYcwUKYkhuY/8kJpgxFc2ogL/enFe5q1d5PCw0WlGgJG
	 BFyjaDgwkqVG+s/NgvDGpqSTxYHl6dYyuz6BwgVeed0b/+i54d3pd/DBhVf9ztpprB0sq
	 btYpWJpWPaybrRgNXJXpzlgqp8Khm1C7LtxWaemxVw67o2/kjqPqj6B0ofGL6RXwwGcSc
	 syBGL1SI7Epc7lV1EPUDpJvwfivbp8ncVi5ewd2xPzYuBFlv3rJoq19BIzUizjqDdCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsyXfqZA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CD606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 16:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B7CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsyXfqZA
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d885929so1362041f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 09:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793463480; cv=none;
        d=google.com; s=arc-20260327;
        b=hfl1kTMh0OE0x6SpIJ2ywdhPHvHSQhLsGzgrp487sW5MK8InYwvl+iXCKUJLJDE2mg
         Y/0gKfIZ4Pu9573eRs5j2dGW7VBQDHwNMuyuhkDfPJ0CP9CTGxfdRQa6NuEbheSmVOFK
         gqXywJFlUzdsT3J/0I2oUUI1MX3l33do5bBw218TniQfhM0APaYtaOoC67Rp3nFbnH6S
         mK7Fk2aG9HErkbn7s8XW8RrA2AH2FuYkp+yHxjSpmwpOtkrBUPADWj72ilBGTe/DkuTp
         Z73HRPjoFdWWAYOd/aYAqI9fKxgEkhBsajbeUDTSy3XPw0hszKoB3rmy2rlpJHvSZeVY
         bIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        fh=sTf4YoXQzwuXWOErrkd2BgPnO31pYcyXEHM/QSkyxC4=;
        b=h4D0QbJeRK6iPSjrTPpSaS45DxHjeUWOKyJTrNhx0A/mE6MJdPGnSLT2BgVnqGz3q2
         jsYg7pviEM3G9jiqM9r5pUvPRqxf7U1PdlOllIOrprcUltCZpfwSa/O/CMbLQKpLzqj7
         X1Nrh2E8Ftt0oU2xGfE3Ul7Lh15BYkBQc2sXAOv5mYCBmKgA32Ws5AU2XF9ZRXN4Q2Ez
         Mb5cbA/UunEQlkn43R6lXyfjRXRjMvPGkOEKCvAs5CpyHTKV55gpC17kj77zO1lNpcdu
         XA3Dta6yqKOgMFJj9T3dNPZeFMl+e1smEr0D8OMwDjun3hB2DmNK/SyuCOQ+YfvKlsEw
         xzlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793463480; x=1794068280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        b=fsyXfqZAOV3CRH/Mk9W5qKH+QAuXRoVHQiFPt8VfTL/X/gLTEeSd1Qb6sMYxW/PGcj
         ABk+PV3TePzv/Oo7TcVxy/UrGmGXeTr+i3GA1OyofX0ufwDoBTn0a1Er4zpusI7iL/CF
         X70Hdx0DwSaRWKi9TR5ApQ0aK4fdqlaKgfQI5rHW+g/TwtDXUknu6BjSpM9IskBEJ+Ah
         7sySD6zZjlZevdA1iTi7bupNo2z7aFxGZytmH6JXu1Kw5UNetlKYpuoMLmeA+gqyZeyA
         BQ3fLoh6ru6sZxD51rFSuxz3JuwYFzeTlqJ4KHxeB8GjMh2UWFSGy3BLrGRT/BWEVItT
         dqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463480; x=1794068280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        b=wb/ZN6OyqQlULL+ixdGoqabW+noFNjFXW/iYmd0bF8O1bnz3SdtkQcFCK+tOgnLg8e
         TIHPk1obHHJRwmQ5ZdbDWUvrM3BkTWECsjl0/f+k6s9CReYpOSBXlWTKg2Uw5twSgLN3
         vZFA6w/BtnaBQFixxuBG20LkK6DvYs7qjrHeUIuTilriPIEciP6dtekyuc5g1glq9bKx
         9WYs274vHwduBrHVNL2rIQ1TUKUziWVlyp8k3riZ8BTo/iOnVmy5kizS9jkSPL2WkNsX
         1q/zFMbq8hSV+i4vJhaftc7kx7sfQiAXeUkKxhVqxbx5IqA4aqTrqvSdf6ToqaodqIvp
         2Okw==
X-Forwarded-Encrypted: i=1; AKwUvBxcz4NvkeMDQ6NQZEdAxzJXZ7Z3TNlc8cZP/+MbOdmVW93k73gBFl0Zk6ROabNCuUkIn6EIl1TgAOQuMrTF1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhBnNPW2Ofu37kgQXbV1D9fv4g8Me3Ikp/KLrmvM7p9lMlJpXI
	6J8aozVnWpy6QRcGZUZLpuRJjylTBuDKubkADviVDwuGjBZsnPiEW4bOvfUN2YzAfq+84VYc+nY
	Os5O4yEsbKAoBsZmAP+8V8xi+J1jwgmnio3+UfYEu
X-Gm-Gg: AYBFou0wD/oHXt0zdEhABcnxMNJwJZP4XOLzNftLmx4UuWflJm6pvSn/5SEhL9VMzhA
	lse2Rb69CafXUFzjL9YOSc/6ndpWYe491UqVDywjECtQIuqrMS90/iWFU3Wa9L34ryjNATHzqKT
	d6UD7MGwD0XkYuNgPcAxWK3ocmrtdnRIc8km8YHWOge129PlOr0js5t22A5X1qkVXwhpJGXLbLe
	wSVS+UmWwUPaQ5rYUkesRKU+uOePaOwHK4lejGncDjvQI8be5lCjCXJKvzsayeyV7DTslyqHBTU
	ZIwBSiro3c6jC5k93wKX7+J3orWYG6UVJWzZnxjuYLrC6lVn0NHp651TW1NxAaTUZ3yR7sefgWp
	cEFgv6wHnPwD1dHCBvaDyBOe9xMo+dJ6WSRXsKEXOfybIeFK1aPcaex6AAjMmJjYmwVyonKn7CX
	JOj3XgRNH5kdP1RI1thenA8HvxkEA81/ALB/1A
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-48e6e501911mr12571791f8f.43.1793463480123; Sat, 31 Oct 2026
 09:18:00 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:17:46 +0100
X-Gm-Features: AclHuK9l18-NBetzRhpu2rSGbrBFqOZ1yvwZnbwEAmvoiR_gPddFIoalS6dNMJQ
Message-ID: <CAH5fLgiSOae48jr65rv6ynLWUhT7xVCjjCEK=9oKXvSxKpdq6g@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> bindgen 0.73 emits the blob of some opaque types, such as ones aligned
> to more than 4 bytes, as a `__BindgenOpaqueArray` or
> `__BindgenOpaqueArray<align>` newtype instead of a plain array. The
> newtype only derives `PartialEq`, `Eq`, `Copy`, `Clone`, `Debug` and
> `Hash`, and the `MaybeZeroable` custom derive does not reach it, so a
> struct that embeds such an opaque type is no longer `Zeroable`.
>
> `spinlock` is opaque (see rust/bindgen_parameters), and with lockdep its
> blob becomes a `__BindgenOpaqueArray8<[u8; 72]>`. Commit 71ec3c7d6db8
> ("blk-mq: quiesce a queue that joins a quiesced tag set") added a
> `spinlock_t` to `struct blk_mq_tag_set`, so an allmodconfig build with
> bindgen 0.73 now fails:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49
>
> Which wrappers exist depends on the bindgen version and on the opaque
> types of the configuration, so they cannot be covered by unconditional
> impls in rust/bindings/lib.rs like `__BindgenBitfieldUnit` is. Derive
> `Zeroable` for each wrapper in the generated bindings instead. The
> pattern allows for the spacing of bindgen's output when rustfmt is not
> available.
>
> Fixes: 71ec3c7d6db8 ("blk-mq: quiesce a queue that joins a quiesced tag s=
et")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Is it possible to instead fix this by adding the impl of Zeroable in
rust/bindings/lib.rs, similar to this piece of code that we already
have:

unsafe impl<Storage> Zeroable for __BindgenBitfieldUnit<Storage> where
Storage: Zeroable {}

Alice
