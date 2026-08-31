Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9D49E5CB
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198905; cv=pass; b=FZadkCCFjH7WAA6Iffh0ZKSHa62ncalqWDh1rCxtnQ39TQ15bxWxlUo5zknpSkc4xb317YiwE3Zv6uZHb7OD+sYHc+kQc8DkZOAxXqkhSRyWgSvChOfOwmzhscF2apve1dEK/eveDqxjWVcriZbr6iL7IHbZW1MexFGiVhNnTPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198905; c=relaxed/simple;
	bh=1kCMgVeNQvSiwIL3h/DRjr4qSjOvxImZtZcvTmwnYcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrrb5hkp5NkDlf+m0ULxDYUBpvrZoZ1FmDRvwMSABUvgJqSc0Iq0bkOXlX9GaRIH9xGzx5V2job+7n8ARklSUekJftrGjcetJgsx368JukYWFVMEbY4IcASc6xfcopm2poRBfzv8gIvUPxJvdJRPL0cL11W4B0u7i6n9dyrNoNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyxmnPxN; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyxmnPxN"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so296002a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 10:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788198903; cv=none;
        d=google.com; s=arc-20260327;
        b=HkPJvlposQKEytZ6WxQQWLFmhUP9L+GQW0qy/LO3xIfQT5Ngs70O04UtXF/NVbBMMt
         cFjsXjNP28HYcZvGIPj7o4R1klDHwah6U2/Lk2+ossbH/0asGwpUJJKzfCRtDKHkpkwt
         RfLEv7LMYMeltGUyxYOh6O3wiIomXA6qghbxbpfKGTL4RxI8mIHYx2cwy5Xj+Jl28aLV
         Omfqku6cJ9ylLJrw0AVEW3u+afyeqM42cCObLr5BVcTh8pSLnr7DzBf4ms2bYSERo9WF
         FSR+wNrNyoTKXvpZyk4+00RadHp+zKQgfquwP3svy5mC62bqBl8GeQGCU24t2Z4A21V9
         HH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/RETsztnDkAzUQrwJYe3M9VfKmr+8nyYXoQh9ATtTg=;
        fh=g4fsr6Q8yQYqi6DSZAmKspcKPOD8bXTbUf7nvlqB/ww=;
        b=bLyrUHlpJp5Shvdm4HhKOHlCmp5qQp9Rd0Bk/1QvzvON/5nY1IWSuT15G7irAxU3Zn
         PAucacB5EtUgWtTg1uP45E0jSo/zF/caS9V1MyyFdLSmZNxQ6kYNeeSu/n/nWD1q05jr
         zzn1wBv2pcEKJsWi6KQRv3Et0r1Y+SwPuyrNmryLsLFdPlDjU9dqTeVCTmfFcRZ4gluR
         IeO3xiX0S5pjmoNAxIE70LbLj0ZkxLCJnCPiTvlKoqr98CjwzgehuPmxziRTsf0dzWrs
         jsPTIx4Teq7M9bhiQ3yBxZ8XZRboWxLaAnI3+m+d3zuWJpQgf7cJ3PMH1iwTap03X7pa
         +PvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198903; x=1788803703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/RETsztnDkAzUQrwJYe3M9VfKmr+8nyYXoQh9ATtTg=;
        b=JyxmnPxN5h0vHaOvJhC5P6t8cXq+Wj0BtKDjm03KguwSvzW10EF6OmeMOflX7srlPA
         1S2OSYclK92wXtzQv+mVFjdhn1oSC77IY4Z7ThcPSoCZMVY24w3Jkx7oOW2do0CZqsRN
         INt3+vTKLAudaBycDwRJb4Gc1osw6zOyBrg2YRBdz74UlodTh2dN7pkO+d3V0caaGLE9
         o6h81epwGhDwWtk0KUKOWN7RZxPUHnI995fwxBqlwCqMyBDtXgrWFF15ea2gVdedGXqG
         C8xH8lzg3YsOXilevrGcyTYPGVkMk8kkh2y9I4HoMlFI2dIY+6Tn1T9Fr0MK8C9IsDvc
         Lsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198903; x=1788803703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/RETsztnDkAzUQrwJYe3M9VfKmr+8nyYXoQh9ATtTg=;
        b=Xqmnzn1KhfHxWtirbCJP1hrAcvO1kSFxIRLqGyj3Sj9yGP9T1aKoZi3rIch8P090Pi
         tUfV/82f56BsqQGT73AMxpi7x5Z2kbP7l2qFRbPKfWOleJMScXRgR5jg0E1QOKqS7Ciw
         W37kyyJteAR58XLGsOWbPjviNgzbpOPu1sZb55NLN0/AhLNQfTqeTnkvP3so8AA/RpGJ
         WgzTYDSccf1HjnhNZ6r7ISDsMmu/fMRdbmd9KuZoaOvs3FI3Df5nC6JIqZnLI5Tnn+Y6
         OkH9payqyfehyxePDB03lWhaGLf3ij8VSTVoyvf/5nRd8llkj8e/NwaFFdR3cSp9ORv0
         1vNg==
X-Forwarded-Encrypted: i=1; AKwUvBzcUhMyLnTAViM1Y6dBG3JIvJLXjiqy04nbYAiOLax0FxZufkJaww6DrnK1V74dYNSGnBgbjfwzGHVxleGi8A==@vger.kernel.org
X-Gm-Message-State: AFuF++kXmk7XdL9lCDZGYX+6yDdK8qUSvrSpZkbJ8bP34x3TFV01JDap
	pIrfH80RhHbzP4qjVokPrXSn55ozun4SUnxFM+z+/arGxDs78EeM5sP/bw2Vzuik0uZ7tHASygW
	8vZpSWDf8q4popV9+3enj5yAJ514NrmE=
X-Gm-Gg: AYBFou2+lV05sO1r3wlalYQUlxn57DBG91alg0vxYK4m9A91XMeadhnZcj35AOel6kH
	/5TJrnOjLys0hi7AczEm035XH1L0qZUZlEaVG5Vmge/hgdsFx+8byBNYr64uPJ6RE5B621lUWeD
	0MW89Bc0bEqKkrk1BTT9i63vItbZ8BevANeZiGiEWcm5+E8xj18vsRglIcBo8F/tq6DKipa+ClV
	0n1bMtoSm2cP87JIMq1aLaLdf3u+lWYs8JQ86IPf39LtmLRx7d5wiHDGJR2BInlO8Qh1Myorx8H
	mw3smPa358tocHM2+FnnsnQJFbJbuxrfgx+/FPEznHeQs769bjUuvGZd/vs8ngIkxaBWHc/VNIY
	hJ9+mhkGSqpmrd+r36+1lioGmMRJm6sTRpGxlT5TBlwvNt65Crg957ALG00c1
X-Received: by 2002:a17:90b:4b87:b0:396:463e:2eeb with SMTP id
 98e67ed59e1d1-398ba6dc4f0mr13662063a91.0.1788198902732; Mon, 31 Aug 2026
 10:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145642.43807-1-ojeda@kernel.org>
In-Reply-To: <20260826145642.43807-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 19:54:48 +0200
X-Gm-Features: AcwNN1UHVFX8Gn5Pcu2VxHXdKlDsBxvZVLchmQDGmj0obMMvoJmQt1OhITRIZ9g
Message-ID: <CANiq72=TjVOxDj631gCFMKAeXYbjycmZe74ChXL=rw4H53pQzA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: clean new `clippy::needless_range_loop` lint
 for Rust 1.100.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.100.0 (expected 2026-11-12), Clippy warns:
>
>     warning: the loop variable `i` is only used to index `self.decimals`
>        --> drivers/gpu/drm/drm_panic_qr.rs:410:18
>         |
>     410 |         for i in 0..len {
>         |                  ^^^^^^
>         |
>     note: for this index operation
>        --> drivers/gpu/drm/drm_panic_qr.rs:411:13
>         |
>     411 |             self.decimals[i] =3D (chunk % 10) as u8;
>         |             ^^^^^^^^^^^^^^^^
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/main/index.html#needless_range_loop
>         =3D note: `-W clippy::needless-range-loop` implied by `-W clippy:=
:all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::needl=
ess_range_loop)]`
>     help: consider using an iterator
>         |
>     410 -         for i in 0..len {
>     410 +         for <item> in self.decimals.iter_mut().take(len) {
>         |
>
> The lint did not trigger here before because it could not handle arrays
> behind a field access such as `self.decimals` -- Clippy was improved to
> catch those cases [1][2].
>
> Thus clean the warning by iterating over a slice rather than using
> `take()` so that an out-of-range `len` still triggers the same bounds
> check as the indexed loop.
>
> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.
> Link: https://github.com/rust-lang/rust-clippy/issues/16631 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/16634 [2]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> One may want to keep the loop in a shape similar to e.g. the one above,
> though.

Jocelyn: I will likely send another rust-fixes PR during this cycle,
so I can put this one there if you agree with it.

Thanks!

Cheers,
Miguel
