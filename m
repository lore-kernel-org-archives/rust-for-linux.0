Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3C2FFF8F
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399237; cv=pass; b=gXOfT1tepwSS/rHOT3wBM/dnnoiMLR9Z9bcQSg7sCm8sY+/HUr6Olhwi2KZ9KOnHbI1oKSyuM2szCd8GlpcE2xQcKmSho9yZXlETexvbPeJwKgmlRzePPCCD+t/QXyBhs18iMNyBXIEXtLJCbIOsh+cYR+beg1LbCkE7R7ecK0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399237; c=relaxed/simple;
	bh=AP41tUx195ng9TgT6uzGyVV7lbuXENWF5xVRR8LXTEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy5KLLz20IM7qGaSD9Z9PAQ5xcgB14BPtYfgLw3XkJBTrqIO1unSW+He9AE03tl7rr3vibZC3xpHnlJAgaFgAIK8CMGqIRmgynw+98v//PAwQPU2wYs4X1zZOJPYEu618orqC6ayMWGS4fVAvA/N/dHa19XLoUflpyo4O12svbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amMECZXx; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amMECZXx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38096590070so1409279a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 11:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784399235; cv=none;
        d=google.com; s=arc-20260327;
        b=ejfR/KA9T0/kzAQFntQC70YMD/ESoAnvCPV2nd/UJxLmVRE2z6pkcNWCm1CGYkPKjg
         k7QkALQct46b9IRKo5n8+DfW7mPoaK89ga1/NvEFfqhUYQmKLKXY+VzeM5Uhsi0V5IuP
         OWxhY6IaR9XTE5cGBX+DPSzY+U8Q2egwrYMLuB4kvBVSS5O7hsMxETPSKnuHVv2eWyaX
         M/AcWHokusZ3nOP0Yi/Fi8024gNj3YLdejXrVjm5CPxwg9tBB9T4i71L1P/fD3DPOjHt
         UeGvJIHuer4HeHhCb6kYWZSjJHQzIZ4B/QFdP9ioFIgMB9pB7dlYay5grFsJwLba+t2p
         jWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VF1UqndvD15BxTbg7z5vo4szg71VyV/aIRdaOO6x9SQ=;
        fh=d10vgpLJVXiHBfeTSZRgeEtamDA91QoSBG6jf3vG9OU=;
        b=IBmNznb9oXuV4TJQKrlvsr6H0BjLQK9V9X5q5jmrIxt57To1wd1U7orzOYFU2NDhwk
         UNqlzXQpfEkrXX87J7ofrTE1c784/CB3BlFC9/N21oIDhht5jYmGrhhywWF+MXfjqW0X
         caQzxzxQwZonSEQqq5X6pXWKSI9hk3VViTn+BhFXcTRPdUlEv/qqZdCKy59QFiNwN9VC
         fg/B/EdwNbZs0vnbFo5aFWHgPmTZ/oLS2T3ptTrJRy0ULDmAhhzYqjCnVzOLj78YDDMU
         FrVa60u01j3NQ0VdSrWYUQtalDjivsOVlHB+znONfLWRfkN4zTaD2VxBily0D8oIPDGJ
         2epA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784399235; x=1785004035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VF1UqndvD15BxTbg7z5vo4szg71VyV/aIRdaOO6x9SQ=;
        b=amMECZXxDcVI/tDclwfWEv91FERjCewoh7Xun9jiWjXpgvbeX1dsNB8a2RjP7RieJM
         ZQlHu2E1Ff95i2SPMjZPmsbICL2QdSTVeiEJexhYZjQ32QGUYbKi1k7fGDHGmECQtaW0
         9P56H3gCFeuxsNnpindCx45z6d770aIe4NQwOPVPUR5D1OeKXKOuy6CcD8NVUfn4t4Zb
         kg2fMhYVoCQjS7lwLfFEvDjeKWX5isCyxbdxsQprVQzk2c+1UcRs6xvoQke+9QkBM8kE
         JZlmtPYuZsXM0W+v7fvwdXoVKnrAmnCyEnSeGHdaIscl3SawQ8FwNh7347MWklrFJsb/
         pppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784399235; x=1785004035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF1UqndvD15BxTbg7z5vo4szg71VyV/aIRdaOO6x9SQ=;
        b=VZlsBZcrYuA2AvFndx+av5nfE5yDnyqdAemiHO+39pnqd2Nb4vt06KWXh0yvsU4Mix
         N0cDGUAcRqtLHK/ghDEQkzSwsgTpwdAWJH73uQ2Vma4NCgtNwc5B5fxvJuAl3E6YuJIB
         kQtxjaBX0eN8T6qxIj6CT9y1T1laehFTFKISjvOzQ+wnLXnNYpHOqYL5XZzGBv8sSPyy
         KTkzPaAih6Khmq1he2c91CmIW+/L1kssMZCmjqnFM08c8iKCuk0kK/7SK01/c7BZEeJw
         AzDSCbC3V+2J9+eBd0lSVzrSif5O01wc4ra26RyVB6eAauDX9qNZJZT0Ws5vM7qTIQxR
         uysQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp33CPpSvRC6JZOAUKnF9HLcHzc1D0Am+qLdp2YWwCWtnOgLohzN0Zk2r9DtUMx9YcGpIn1hSpTfuaJji+Rmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OfWy5mUo0jhRNZ66PmM2aZuVL6c/VvtpmQ6lBw6fv1xh+nRr
	BxClvzJ5IbxW/Ov0eakM1ZLc3kkgb4Bg5Z9fElzGiK6RPg8FWIgQbQOLQk191LaHfHbeAyuWTuW
	Iy1gflYBlF931vTGBDM9yp+Yq2UqEiJ4=
X-Gm-Gg: AfdE7cmn0/WJ6AZCwShVJs5WfKr87QQMlIcYLAx+VoKxuD20YP8TOliSCsuED3qgoSU
	DBN8DQjoojp+PK01s5ZD2xo4aiSvzn/UyI9aCYoV4+03foMVRt27ZOw6AnxZE5CuOtqXJK3FS8W
	5AVb55M1d06PtCvj8V+YJyPEHQZamEFkSPmet+s0EFGcqGoyVh/kRgReN/QQzFVcGdLVQkOhBQ2
	aufJRq+7QU0cmJOLqqSq1oo5Q+RgRD6RA4KKo9j+d4vMmN4RVXT+avoQKrDpb9lFzGsF8N7JZ6O
	fjLu/rsK9VmPepuqs9YDQzO7uuIlbw4/aY4d12fF3itAJ4O+qOaDPFsIxlWkHoL2tIExisPYfQ6
	FlQ==
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38e4b45428bmr5637614a91.1.1784399235381; Sat, 18 Jul 2026
 11:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718182323.107565-1-ojeda@kernel.org>
In-Reply-To: <20260718182323.107565-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jul 2026 20:27:02 +0200
X-Gm-Features: AUfX_mwJPjIV2cZCTnoVSTWE_fZLtIswk-O58QgDaLvdnhGdzF4gPg_mWdzIaoU
Message-ID: <CANiq72nLTuv2s71bNBVV85bTbWriiCdhG_O+-=t+1Ubv-sHFJw@mail.gmail.com>
Subject: Re: [PATCH 6.12.y] rust: block: `allow(deprecated)` for
 `fetch_update` for Rust >= 1.99.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Boqun Feng <boqun@kernel.org>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 8:23=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.99.0 (expected 2026-10-01), the
> `Atomic*::fetch_update` method is deprecated, with the compiler suggestin=
g
> the `try_update` alias instead:
>
>     error: use of deprecated method `core::sync::atomic::Atomic::<u64>::f=
etch_update`: renamed to `try_update` for consistency
>        --> rust/kernel/block/mq/request.rs:206:22
>         |
>     206 |     let old =3D target.fetch_update(Ordering::Relaxed, Ordering=
::Relaxed, |x| Some(op(x)));
>         |                      ^^^^^^^^^^^^
>         |
>         =3D note: `-D deprecated` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(deprecated)]`
>     help: replace the use of the deprecated method
>         |
>     206 -     let old =3D target.fetch_update(Ordering::Relaxed, Ordering=
::Relaxed, |x| Some(op(x)));
>     206 +     let old =3D target.try_update(Ordering::Relaxed, Ordering::=
Relaxed, |x| Some(op(x)));
>         |
>
> The deprecation was added in Rust 1.95.0 [1], but only triggers starting
> with Rust 1.99.0.
>
> However, we cannot use the alias since our minimum in 6.12.y is Rust
> 1.78.0 -- `try_update` was added in Rust 1.86.0 [2].
>
> Thus just allow the lint.
>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Link: https://github.com/rust-lang/rust/pull/148590 [1]
> Link: https://github.com/rust-lang/rust/pull/133829 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Warning: this is a 6.12.y-only patch -- I assume you prefer something
> local like this instead of backporting the commit that made this go away
> later with the move to `Refcount`.

Cc'ing stable here in the reply.

Cheers,
Miguel
