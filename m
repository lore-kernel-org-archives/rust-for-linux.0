Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E23A8734
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084880; cv=pass; b=dgHpS+D0hw4OfLxiDxRSLcDmjnIF77tehlMrMnNoQPblF5n3iD+0hx0jYD6q4UYKU2Z1wALMN423EEUC8Ryktt1iqiEMpvYUGd7n3g3NPIgFSWTgHUjX6AIWuM/VqanWaWT0GFogvcKpOIiRoT35CKOAxF+90nUrVKJB8sSbKzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084880; c=relaxed/simple;
	bh=WAqWJZAUb8ZVK4XJy10C2ADixl3jm2LehIxMP/7bG4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3DJM6ODZP2TL2NpCfQSidB4HIEZrPEeA5cZNj4bEyRLEO6HwF6UnJN9Bg7/YuCfeQRtxwDklZgXPSLd3Fvt+12juW4DOrk6swesYr9DkYCwSq21Q37hqKphshW6fYV+VAeFS5/f1ECkIPtUA2gUlwcQktf1iLh/+NolB7g4qRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij240XLx; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij240XLx"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304dc707bfbso210729eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 13:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780084879; cv=none;
        d=google.com; s=arc-20240605;
        b=U26EyauIcAIm10xW4NEXd1FzUrZR1GnCKHtloB5mPMsr3J4BOJnj4v7wH9jFg+xt6A
         vfVj8XRn38k1FJa1E4Dhm0BhgTqlMJvvgJATwki2pxPMHm7wQ7WnvPiuA4LVY8Y1cgTR
         oHYSTUnj5E8+4MtdKqaP5icSQ49DP0CReliPA0twU7d5WDPWk0APLoNu1R8aVpV2Qmvf
         iN1TwBKSAjjLTHQDh7edxH5mtcZNg9pVOw+D7tkAJg1LiaYHxTdGg3SMu9aBZVZjAtvY
         NZA6iKu/tmDoaPMtyiDtTXfX9h8KLZnC27AVcwF8XeHUuBcqkfPyKqO9iwftwitNE8z0
         i/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8vkaqpYvNud7y8KMYTCZTszv3lHuyhu6xumlwjXiuUY=;
        fh=gAawn5sma8pk8RF40Gvj+jyM+jyMstw+1tRprOSg7bc=;
        b=iQftARnOLco3+LrQrwg8kzMHmDyJ09gaPAIB0ucyP2tSiCM///laconsXVNqR/rAwm
         W7pPGqzO8cCz3/itLX5FWi3Ko1aWeax6SGi2e5vdU1iINcunVU/LwKZFhWemiu+ylwgW
         L6Yo1/r4P3/xRrvQf3pvPq7BTOmAs9x7tJmFj6ZfvaNFas0SbcTEmxYAFhFI3r1knbaZ
         w2rM+a/YVdHJiZxUkHsoTjeSnQ0hd7ZVJ7YOpK1UNmONlLAJaCkUxJcRDcQtyUp69dGY
         4cIhMUmmO5osTHYMEn04irNCZzAo5oFVp/cvtj2YHI8iL04jkpLuIFh/DbN2KouE2DDN
         GKZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780084879; x=1780689679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vkaqpYvNud7y8KMYTCZTszv3lHuyhu6xumlwjXiuUY=;
        b=Ij240XLxaLdOlyikA9a19vn4gS4B/f6TIH+2TyW0c4i7Kg3qrbAkP4DPlzgYM/EKe1
         ZHzYioQyB7XYf3RYz9BEB1yR8lFabXnbrAjl5WBFnJulT3pcQcYWsN/TSAgm3btvkRZg
         NpqUNxzW+sFX9FmfU4rRF+tAKOf/zAmoyFIHBWIYhheweN6BRYExwrJJifJQdcQgSMqZ
         YsuQv+8X0n4yXBQV3Xf83uBUihTz/213XHgwowEDIxMobPKCpF6xJEW8s8eBdtupfY6L
         7dugqzGKYIs+hmI5luLdKg4nLCi1Wn65jZafiNzOecV3jAkyu75SuFp3KU+0ZDahfvu4
         xCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084879; x=1780689679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8vkaqpYvNud7y8KMYTCZTszv3lHuyhu6xumlwjXiuUY=;
        b=WQhzIQPvlC/pSTNLCjdxQSeUW8ZcQYrUTbQXbh+Ex4E7epqerheVtS8zTXFoOGJDgD
         TA1JReyEtQB+jRoVKKuYXTi2Q1ZBMrxpg2uWnpL0tWYSEfZwkIaQ9Xsr/hsBdIU2lV47
         yLj+xNoAirMP1L8u3vySVcoZMzCjhQjiuzkA9FYakj2XkJ8ADoQigJCi/x0Zkm+uj9IT
         YAMTtdfdzYrww7ZOZojVHSyYPOZqH+ROhdEtwNjVTl2aj70EirzCVESO95ND+SNjefon
         CLr9qxbpHlRAX95gmlEZWF9hG0blDhIdvh+HJXXfxYrEGparSH/LdSK0DjtanEM328MT
         0Fnw==
X-Forwarded-Encrypted: i=1; AFNElJ90ixSIKHa5uv9GLfY5uJ68qyx+WiMdGmVT7Seuohqfey9JQ0oQWhq1GBcSPMHPskOFV07gaprg2SUb773OBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ocQetiYteeqoyfmKUj+UzfVCt49wlo8KbQvn4DOtkyLdgnVJ
	CrOn+jGOPFuTTiCwhFwYcOyODm2iz9QkFtvi1KJQPvheEEeobcLDi3Jx2zjelsifklQ13ZYeaRI
	b9/Zwm6KvD2iUO3UabWv77fPcE4NYp8M=
X-Gm-Gg: Acq92OFXDaK8SQ/jgiPIYf1s/I7u/Tu2GWsBAFo+RM0z9qnR2L96kQ0DjyCgi9rZpsR
	HaLhiDLM9g1mQvzELZ2InSSAu69HkFygr2p8EiZJhb2CvWwj3bPTEZLPchKHsvt75IZPy7tL7Hh
	MYzdbJjP2s76dr0GamAQ9c6H5c0Q9PDjuehAzHaELI8A2WBFlMw9icwwmtRJytfVYs3o7f5DnYo
	P3he6Q7a0TVn9nWCaiM2uDmCBXIQE2bVUsdR8guOsSOjZIpjXqG65cUM6MgQdJP18Yu/fMOkh+e
	VrKbgxUL06iEVb0p32Ec0Updzpdd2yYXtLm9o+Maph5BNo0A7/r5g4wQcR+cpvaigu/hj1y8stW
	uVD7dkZtqbvqbq9bX18zbAQe6aWuW3ODdVg==
X-Received: by 2002:a05:7300:a198:b0:304:8361:a8a7 with SMTP id
 5a478bee46e88-304fa65a384mr230358eec.4.1780084878730; Fri, 29 May 2026
 13:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-rust-hw_random-virtio-rng-v1-0-b3153dd90311@pitsidianak.is>
 <20260529-rust-hw_random-virtio-rng-v1-2-b3153dd90311@pitsidianak.is>
In-Reply-To: <20260529-rust-hw_random-virtio-rng-v1-2-b3153dd90311@pitsidianak.is>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 22:01:05 +0200
X-Gm-Features: AVHnY4Jfj_91jzMh-qh9topX7s7sVODf53cEMcX8mNsDRMgdtiN6qqERypjB-dw
Message-ID: <CANiq72nATB8rVvHEwS_GHoTP7a-gdsJZdvcu3stY6PpzCKih5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add hw_random module
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, manos.pitsidianakis@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manos,

Some quick doc nits I noticed while managing our list...

On Fri, May 29, 2026 at 5:50=E2=80=AFPM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> +//! # Example

"Examples" is the section name we use.

> +//!# fn no_run() {
> +//!# use kernel::hw_random::*;
> +//!# use kernel::str::CString;
> +//!# use kernel::prelude::*;

Missing indentation.

> +//!     fn read(&self, data: &mut Buffer<'_>, can_wait: bool) -> Result<=
()> {

-> Result

> +//!         // write zeroes - in your driver, this should write actual d=
ata from your hardware.

"Write"

> +//! let name =3D CString::try_from(c"example_hwrng").unwrap();

Could you avoid `unwrap()`s, perhaps using `?` etc.? It is not
critical, but good practice to try to show how "real code" would be
written.

> +        from_result,          //
> +        to_result,            //
> +        VTABLE_DEFAULT_ERROR, //

Please only use the slashes in the last one:

> +    },

...but add one here, since this level doesn't have it.

> +    /// Returns `true` if the buffer has been filled.

[`true`]

> +        // SAFETY: u8 and MaybeUninit<u8> have the same layout

Please use Markdown (but no intra-doc links needed) in comments too, e.g.

  `u8` ... `MaybeUninit<u8>`

There are other instances below.

> +/// [`struct hwrng`]: srctree/include/linux/hw_random.h

Is this reference used?

> +#[vtable]
> +/// Trait for the implementation of hardware RNGs.

Attributes after documentation.

Other instances below too.

> +    /// [`hwrng_unregister`]: srctree/include/linux/hw_random.h
> +    #[inline]
> +    #[doc(alias =3D "hwrng_unregister")]

Is this one for the alias? How does it behave when rendered?

> +    pub fn unregister(&self) {
> +        if self
> +            .registered
> +            .compare_exchange(true, false, Ordering::SeqCst, Ordering::A=
cquire)
> +            .is_ok()

We are starting to add `// ORDERING: ...` comments for things like
this, so it would be nice to have them here already.

> +        // SAFETY: we set `priv_` as the value of `*mut Self` when initi=
alizing.

Please start comments capitalized. Other instances elsewhere too.

Cheers,
Miguel
