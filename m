Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86D32BF48
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023801; cv=none; b=riwBlCcin3X1YX8ah5HgqhSja9Fkxqi8sevkHlEcaGH0w51FRbcLCtwvUZK0lRY7mQNwsuuz2e0af06hDJgX1LciU/nUYLXsPzi8dfJSeAnkwodhUHcIIiqdWjYXwcsEOdsaBnBBtfzeNyr1Oqm3t0JY2H6pGxyzKFN15RwMCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023801; c=relaxed/simple;
	bh=QSHR/CLud5S3FlVTJp854OG9GuC1UTSSeunV/WylfYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpsmC18CjLlCz2+MyABZZd7BZyn332Hubz2ZnxxrvHoysdGjlhan84+nAmp7OhP4dj64p7Km1B8sZb7i8mmC4sVRVt5jMsyqxdpzU72660b/Gzjk65iJK0kK495Eg4lT8xLxxB3vzbvNUR0t5wPNnvVqLUs+FzAJr+08rJ4byQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUyGR4iN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUyGR4iN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37d056f5703so67880031fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767023797; x=1767628597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2j6DfFd+lJJq857Qi3PAx9XRX1L2KFlr8CW5kdHbfE=;
        b=CUyGR4iNfQROqi9g+pjXLquCcQXa8OuOL2E4lQjF93w4xIkEdG+jfQ27O5dXuOk1Of
         GheWClthLlW47UCKk7WYHc4awgEmJ4ysvrGHmPM7Kmo80O+ljRLKegU1YPE+OkKfCcIV
         yGlr+LSjCzdiF3497Ot+WHLTBmu3G1wMdF5qDQdqUBEqgruk9H80TBG7Kf1RpVHjFtie
         D7icLYtN6GvsrU7Ixtgc3RwuADCZIqjoptIVAGHor8CfICZG5b7treCqEePSzFpp9UPi
         yAxJcC9mJwHD0RALLCfdVVmXRJmxtTtURSpDY6RXANCBIvcsBlQAekk+1DvHPyATi4NZ
         H4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023797; x=1767628597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2j6DfFd+lJJq857Qi3PAx9XRX1L2KFlr8CW5kdHbfE=;
        b=wF1QCz8DiCb6C0T+YnRLSFJTAJQ0eO2pcD+YUjnrxvffX4z7XdKis6E+puvL4nySlF
         d0oDCbLF9gF3/lV6YzjD55aMIoNKz5AMguqT1qeh/h894B/iUIsz8nob0q6bzN0GBYYm
         0aHBfG1Q6k2R31S4dnCKfOm6T1fyridRC+5IkrI3qJhlVChXXwkrQ23ap0dDV/uS7Y5B
         bScwGtKl8n7aBlWoiZBXMX6I825ZK/yZew0LVuhGYqkkrVZeS/8jC1HvrBG+OnhASGzg
         E3H+1oSR4W8nS1SzpFFYRCwZKgSMFLV/ZaZISyCu1el08Qv2X/pcwvyCm4HB68f3VwSt
         iXzw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJ9FUSXr6Ai5NsYMQf/lonmMSmaNc59+j2v/17GqTDaKkCED7Lm9jR+ZQHWk83XbaCpP73kfc9X2nkZdG3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBDgZF+2cDwUc/XyqJq89nSDpyKNl0t3G4xxBvFyqMe3FrvBj
	oB50q/9BBXYGGADl6cSHyAj5QK4rm/WyGcdKKGCmIzDyWrdkuAzShWBJRfD6juAC+ZpfCSkh5JV
	t325b//DQ9E1nATLdmb4N7WSQpgKBQSg=
X-Gm-Gg: AY/fxX6alPR3fIz7oR/DCy0DSFcbCebPd6mL/b3ISvyEcOeKb5xuNgpzrPQ2WN/sS0N
	ABmLgmI+K0R8YU+liXW9pU3tO7mvHfvRxP76a/A9rHCOmJXlFDN4u7lj34oojeYHZDSLt1a7fu7
	Cjqv4p0KPZ2T2B/GcdLPRj4i/kJnKG2UL93saLt0xbTNxs5ksfR7A7s4MOQCrOp3gmsS3+FO/Ow
	zesI1BAqSL8vPrgWaOeW2OCyicRxJlYjm4b87TCesA3y1ePJFpO6gxM5ODWhB6XXvaHNtGc5iWl
	i9uC3v8RN3zUcldUP/auppFLCVPQAMbHvTy/nzQgft2bPnSpNiBDzUGIzmsTX/SkA53SVpQjFMY
	6pOZRu54IQbIVwNjVUMN5fE9VMo1KBYxfQsJ6bSgHFQ==
X-Google-Smtp-Source: AGHT+IF4t63Is4Qxl3jqFdYugCgFhUDzK3Kg08HTkDy+NTujdW26DGSK6umjyqnwoNEHN8GSYmggDSJENu5mx/1PZ/A=
X-Received: by 2002:a2e:be84:0:b0:37f:b6bc:e792 with SMTP id
 38308e7fff4ca-3812156a2b6mr113385211fa.7.1767023796667; Mon, 29 Dec 2025
 07:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 10:56:00 -0500
X-Gm-Features: AQt7F2rGmXWX-jdWr9AOmwDAZ3dPvi7nCatRxkYTkGiowWrt_azs0bHyRDD2cl8
Message-ID: <CAJ-ks9nZMwBsSPOR5N8Li37M0zDwTZRM4XOY9sqVgOiov_suag@mail.gmail.com>
Subject: Re: [PATCH 01/10] rust: xarray: minor formatting fixes
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:28=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Fix formatting in xarray module to comply with kernel coding
> guidelines:
>
> - Update use clauses to use vertical layout with each import on its
>   own line.
> - Add trailing empty comments to preserve formatting and prevent
>   rustfmt from collapsing imports.
> - Break long assert_eq! statement in documentation across multiple
>   lines for better readability.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a49d6db288458..88625c9abf4ef 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -4,14 +4,33 @@
>  //!
>  //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
>
> -use crate::{
> -    alloc, bindings, build_assert,
> -    error::{Error, Result},
> +use core::{
> +    iter,
> +    marker::PhantomData,
> +    pin::Pin,
> +    ptr::NonNull, //
> +};
> +use kernel::{
> +    alloc,
> +    bindings,
> +    build_assert, //
> +    error::{
> +        Error,
> +        Result, //
> +    },
>      ffi::c_void,
> -    types::{ForeignOwnable, NotThreadSafe, Opaque},
> +    types::{
> +        ForeignOwnable,
> +        NotThreadSafe,
> +        Opaque, //
> +    },
> +};
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    pinned_drop,
> +    PinInit, //
>  };
> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> -use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>
>  /// An array which efficiently maps sparse integer indices to owned obje=
cts.
>  ///
> @@ -44,7 +63,10 @@
>  /// *guard.get_mut(0).unwrap() =3D 0xffff;
>  /// assert_eq!(guard.get(0).copied(), Some(0xffff));
>  ///
> -/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), So=
me(0xffff));
> +/// assert_eq!(
> +///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
> +///     Some(0xffff)
> +/// );
>  /// assert_eq!(guard.get(0).copied(), Some(0xbeef));
>  ///
>  /// guard.remove(0);
>
> --
> 2.51.2
>
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
