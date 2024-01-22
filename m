Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96CB1DFE5
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705955614; cv=none; b=mVr1m2s0ZxPNHXStgeIcEtSUvpO17EI8aBh76s4EU52MDeWP6F/sPio6cTfG0FhUZpNg7WjOiPLtf+rTT/2Ud5SUVQT1lVIFdC3eisILKQjcvg87luWTkt3I48youZF1hI3beGYVo1FVMuPD/cWkTjIoTRJ1I7lo79NJOw3dCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705955614; c=relaxed/simple;
	bh=ZT4FQSI9743ALWbPooZX/Ri43WyPYGQ9VIf4iB1f3AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EutOKCcUStoRVWos89kGKtcHg+J2G4RRvl0Oc6vLqAr6hipsqu52vXJ3jx26lB8ym29qhoD+/Xpm+4wZdYS6IFZlj7b62HKA0GJvIT4us7ZFlk9nup0Smc2xU3N1tcyjugSV5Z8RUKWeTIpcSbjccOb8frxQBK2LSpe+tISlvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=NCNzQDWj; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="NCNzQDWj"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc223463ee4so2940493276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 12:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705955609; x=1706560409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqcqNN6YTTusZ7SvS5xqjdV+CWj0HCHCc0USv48MCb0=;
        b=NCNzQDWjV/6VVVPSfR+7kCVuKCPyOdeSko0nx2rHXV7DHNGRSaF4FfwDRPdRSlbh8F
         SAch6ZOEqXlfvgdlHHlG1OwfkSX5gOTiKf0pCuLZKmO386CG2yg2EhaGBtv3rZS5D1ev
         Y7hfsPU3f26VX1EPds9WtPQsBWM/N3syPMVGiQt6z96DetSYCjKY1xx68QVcJm68BDYA
         1Zbjt3q7jWKgTiaVySVrwAbvVvayhwrrxRxXIyN9Zvst5TfB8vXX0RqIycDdpWizpCwX
         6RahugxM8vX3SsXMZVTNOwo0hmolEnxxKx72GzhnjztB3Q5MbycP6PkQjU3NkcFusX+Q
         n/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705955609; x=1706560409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqcqNN6YTTusZ7SvS5xqjdV+CWj0HCHCc0USv48MCb0=;
        b=g6X1l+j9hBa+wEqpBe1MR8/JxuZDF/9MTjarDBe/DdioBR8bAwzSwgBUOtxbjuAxOk
         PtwBhjsZXyNQTAt9JIz9xSZaTo0R/FnyB/MreWCB+XwyvgVXAGymkyyoXLBtsrDgUAy7
         O9NfF7ixQAK1zS95JxJ2rzarfDjKlfy747SS7VMS0JqZnUI7ClaOsfm2ahqT/vwpjBzf
         Ucpo+jCg8l+7N2HqIxPcqOojbSVB63C6vfEdOYboy476X0TYkbNE9lnbgcKavVnCUZGU
         ZMOkEd0dzhAhauGer7KbiE6YhAAHorjy+paBJ283luFlwVlhYyRWg276IvdUcdDu5uD4
         fm2Q==
X-Gm-Message-State: AOJu0YzhDNhm7EjYxQngOEj23pWXdIsmYnJjzLAnQ0Mw/uQoRoYt8n2V
	F8NiwvwMzEngTr6PE9PuApuorjgZegcnmJMi6QpUApH8K3ZLqwDP6Um9pkhlAkTDEeBeJm3QtJU
	g22dGwTRu0NpQRPZKSsc6jBiplzYiDJY4cAlG5w==
X-Google-Smtp-Source: AGHT+IFcWbAzBhGIbfJ9lrn0Bx1V+ZBGPd5/UbN3gKtqO9ufReEF24Vw7qJjSQmoVZzg63yE6LlJlqMmRWm9Lu6ddik=
X-Received: by 2002:a25:84c9:0:b0:dc3:6f05:f3ed with SMTP id
 x9-20020a2584c9000000b00dc36f05f3edmr554774ybm.120.1705955609606; Mon, 22 Jan
 2024 12:33:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122162553.64610-1-linux@obei.io> <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
In-Reply-To: <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 14:33:18 -0600
Message-ID: <CALNs47v_2LxKnpWRYnM0Jcj+wdzPFQcfuaHyh_GnbLgNDXHLZw@mail.gmail.com>
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 2:11=E2=80=AFPM Obei Sideg <linux@obei.io> wrote:
>
> Currently `ForeignOwnable::from_foreign()` only
> works for non-null pointers for the existing
> impls (e.g. Box, Arc). It may create a few
> duplicate code like:

Minor nit: commit messages are wrapped to 72 characters, looks like this is=
 50.

> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   Some(unsafe { T::from_foreign(p) })
> }
> ``
>
> Link: Rust-for-Linux/linux#1059

You should link the issue
(https://github.com/Rust-for-Linux/linux/issues/1057) instead of or in
addition to the PR.

>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matt Gilbride <mattgilbride@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Obei Sideg <linux@obei.io>

Optional docs update below, in either case you may add:

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> ---
>  rust/kernel/types.rs | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index fdb778e65d79..946067cd9c00 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -46,6 +46,18 @@ pub trait ForeignOwnable: Sized {
>      /// Additionally, all instances (if any) of values returned by [`For=
eignOwnable::borrow`] for
>      /// this object must have been dropped.
>      unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self;
> +
> +    /// Tries to convert a foreign-owned object back to a Rust-owned one=
.
> +    ///
> +    /// Like [`from_foreign`], but returns [`None`] if `ptr` is null.

Maybe

    A convenience wrapper over [`from_foreign`] that returns [`None`]
if `ptr` is null.

Just to be clear that this introduces no additional functionality.

> +    /// # Safety
> +    ///
> +    /// `ptr` must have been returned by a previous call to [`ForeignOwn=
able::into_foreign`] for
> +    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn'=
t been called yet.
> +    /// Additionally, all instances (if any) of values returned by [`For=
eignOwnable::borrow`] for
> +    /// this object must have been dropped.
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<=
Self>;
>  }
>
>  impl<T: 'static> ForeignOwnable for Box<T> {
> @@ -68,6 +80,14 @@ unsafe fn from_foreign(ptr: *const core::ffi::c_void) =
-> Self {
>          // call to `Self::into_foreign`.
>          unsafe { Box::from_raw(ptr as _) }
>      }
> +
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<=
Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            Some(Self::from_foreign(ptr))
> +        }
> +    }
>  }
>
>  impl ForeignOwnable for () {
> --
> 2.39.2
>
>
>
