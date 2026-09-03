Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85135289E13
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476687; cv=pass; b=R40jFNIbT9B5JOYpvb6LWZ1WQ2IYySfUXWmPD71w6b0cKfMo0m0DQKLY0aasx4qpH1q2DM9wTG72oqtQMsqxYKgsPclGAonxrPG9CqCV/c9RmeI96Q95/7wHc5IUyhQ+z53AvWHi9YUKvyOdy0bBXu0qgZ5On47hqoUCdBRv+n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476687; c=relaxed/simple;
	bh=pogpfGLRbc8pFVw8T9oRRZ9VzHI74RwYUpxF7mDhYvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFWguCVHPdXlk3uVAOmPQ915MrCSmOfIWvBf0c17lFFQv5tQhEhNlhV5M3rdSWhomMGhoueA0gVSyhTgObN1h97oER00T7hCLzncE0BqxUOzJ1IUXzaNm5kOVwnVd6WiESTvobd5wIvTKv88tqOzGOp65W+gmtdf8MzEYjORt2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iF2APi0o; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iF2APi0o"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b1c184ec7so38994a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 16:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476686; cv=none;
        d=google.com; s=arc-20260327;
        b=gsOr0dpzYOSp7rKRW4SbbD7os0pTKwraBtVrSjP7/jCt70GpsvJ/mZw6NGyH0wmQ12
         fjv+poK26gMSbE+CybJ7d4L5HSj424FjWnLkIFeIMnmib0lHWnH6vFsZRqLL0wEvpTWc
         NRVoBoPyDQukyEk6VdqvmYAdSzXam5fgjh/oPX8TZANhCY4H46UrowXs1se0Zlwobuvk
         ELyU7J6dJdfuSzj52dS+8CacFlTaGmxu0SSy/7+CjY5Wxhwefwzx1EVdLcBuf7UOVoW7
         PkQVTHaQQBkHVLAF6+x6rVOlcfy8bhaGz5qIWbYLtEmRE7/m/3MXaHLRfMd6gBx3iWaB
         mkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        fh=+k9JaCt7VuzpBIm0xZ92sJvWyIK4kFkw0U6alqsmpFA=;
        b=eSehuoKrRrA3PEvh2PAEGqjdbursxxEUZpbouhwFjpcBfLoImKgLSOARd2suqagl2L
         qvPpIaPDO7kKyK5/WeEkxt+882jfmMwdK4IdjaiwXOI2poQSe67X++6KNbnU/IRaGHGn
         6p6zLALFLXOEWu83wGNA1gKmO5Hgsm7OdpJJM8iREdbSrCWkxaiBaa6TMlUDYyveNUvy
         jcCFco54KO2po5zJ9K20GDfJiNHM6VQ2Cn4y0sf/ea51FQf8ioCY9V012jpFLR6dcm44
         GDwHkR4oFLAtCGMzoNEGSR0GrEhGLEJclMlhzlaPD2AEqv76j6YnfCWW0gMveHoG/tFf
         TSJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476686; x=1789081486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=iF2APi0o9wqWFAJvYmyyfAmB9qxIXaNYn4GT/1RuATUeiDcg2rF36B/U8hDaIBPByk
         i90VyeMXnNZztqP+UnpjVidptUOBez9MOAVOqPp2PazVJzgejTRWZJF8FUNu19r/muDw
         Z+2xIAQXUnXEYLbvYKNjYtkTSioD7sVg3GVjRgeQ9IyHdJtClmSYstArHQTxNP10XQZz
         siJae/1kpXyWdUgIFkSwx2qimq6/qfSy8G/dDYU4G6Fz6v6CImgHur4v425BXiFQKF7O
         BvUf/XKjRdrGzOelx26QZ+sc9p8RIxopZChDFR29viVgxAmntZP69rNlIlBSQPfbUce5
         VnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476686; x=1789081486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=khKmS7oGvwFEL5VT91ABfHJ1ibEP51iqe7hOgV5IMcab3zUqArEObhTZl05kQuPxzK
         wBVIBQAN0q2gAeLZG63VRmN2eRP54qWB1ePaTwTJJynvxDMIX6Yq0p50cm25KlYaYaOU
         E3XTsvAVBtoLYWRklyKrQGi8G0gl4VS3P1Y5Hi2IC3NV38WLlZ9ick72aDV5pFCxT/7g
         9RFzj1wPwmljQqT+xDTwIUx6yJFf8cF+OjHyL6GSW6Cg+hNtY7QvtI/pSGGsAkuhYeBK
         C0t62efggb6/1M3gs90pV/bpOKTb9M0+AQt7YSZi/P4b16zBEG7TvRuUG6y2L78hVcg/
         jojg==
X-Forwarded-Encrypted: i=1; AKwUvBxuLxSyzXuJtJB2gO6bvYEWH8pM7VT9va4XwaDpHhxwydKtle2Z6TMO9/usDYU0UwfPTqL2T3euhsJohCeWhA==@vger.kernel.org
X-Gm-Message-State: AFuF++mbUXEFgjG+4dnr90RXrZ+tQLncQ7uVQdmFbdwMIvWlnC7/nRn7
	o1vOc0yMZgamd8Mi4ez6mvNbMhiaULzWGsddvEAGawH0ad03+uOPPpxFZd8uitYsyUiNEwe3skY
	2VODzGb3a3tEcXycMrOrDQWfWO77PSSM=
X-Gm-Gg: AYBFou3lhtTcrkkZSm6tWwpnGx8VYIXqV1cMmXIp1fl9iIdjXDoX3V9KBmcUNpimbJC
	sW1o1ETeff2u3Yg04snxy9BiLHlk6rLaY5bu5pZ4DbNcUt9VWR16Q4te/Om5cO1IB4bDnzjvjom
	VS0IY+MUSXFlmFUCpxyda8UDjdPALHEDHu3GVhaiK/b2Np8KBmAshcYxobdLmpCpfKQ039nRjq7
	DhUxRqg2qWGog5JX/i0rilSr9K52/nyam0WvTNOxEfyNtHqeZgDFXTgCKvEvRzmt5T/A1QSG6TY
	pnnw1Vk86l6WacKJYFSU9oZjAOHCTWL4jQ/LvJ5S9E4ubNYZj/B/Go3s8i28/0n3o0zjXeqHtsw
	I2bXapQt6AfF4FMaOYOFKsm+tR0X89vmkQqL1rGN5gv7E4OJNVBXNVrZwbESK
X-Received: by 2002:a17:90b:2243:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-39b25edbf98mr1644924a91.0.1788476685819; Thu, 03 Sep 2026
 16:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
In-Reply-To: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 01:04:33 +0200
X-Gm-Features: AcwNN1WBHo70zP4o1hDHlopgVQa-be7SFUVqk9JfwqC4a4f9ZIU4Rbq4K5LMntU
Message-ID: <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
> for better allmodconfig support"), which allows Rust to be enabled for
> allmodconfig, ARCH=3Dloongarch allmodconfig starts failing with:
>
>   error: kernel-address sanitizer is not supported for this target
>
>   error: aborting due to 1 previous error
>
>   make[4]: *** [rust/Makefile:741: rust/core.o] Error 1
>
> For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
> HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN is
> enabled until the loongarch64-unknown-none-softfloat target in rustc
> supports KASAN.
>
> Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Sounds good to me -- if LoongArch gives their Acked-by, then I can
take it in the rust-fixes PR I will send soon; otherwise, this can go
through their tree or Kbuild's I guess.

Thanks!

Cheers,
Miguel
