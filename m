Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226525F994
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771165508; cv=none; b=NQK7aHFkVoMYN2LYUVMJBhArvxR57/ySkz12e4JhP+gNQ+MmHCV+CnL/1M/zTBxpHcNzYXKGSwgjG9PwMWHQv49A0WfO5U5K1Qu6P8nzggpf3YAZA0nnmodlOR/UR1IAqr7tzQXGa0dxpudS8L0qUPzZH8c2YgxHE+NwwlQSJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771165508; c=relaxed/simple;
	bh=OD7EPAbT4TwkkDwwqT5xbWvetxgMk57IgVw/lcbxWmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugfOHqMo1RPC6bbWlvKX+InhhomBogHPiK4NK4JWiak7JglZfpp+O7sGfWeB3DJJS4eVZR6EafUqZKgiOFwv8Kr6DBD6DiO8X1Md+OtwAMQf830ofNKQC+WZniLRtky2zn8N5W1YZ0/fNVGwYqJFemh6yh0gTNO1ZURNfaEUx74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9YLG53L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9YLG53L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908ADC19424
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 14:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771165507;
	bh=OD7EPAbT4TwkkDwwqT5xbWvetxgMk57IgVw/lcbxWmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V9YLG53LQ8R1NalgH5l//kpvJKZkkfUsGnbkg93E7EIxqRJOv0PQK/LyHkiyIPwqR
	 eIMXWUYujD74mmCYvOVIPnJwyHcfVqjeg6hsx0pCNt3bwkZX54cpCCkjDO0j6e2OXU
	 JuQdFiCdegYwGOuefECDuya9s4rf5Foog95Yc2yzxRBurRJuNCZ3b9hEoGXnUc7d5O
	 HTJQRPqaLxZXW4idsEdwAoZNVew1nGHgynRQlDw53bNi2DuXTw9vJxFgSR4spL4Tcx
	 ZngCc7Bqqdk/BLh4gerXt1E1DcMCtSqDKR340VwsYx3bUi80hBT5D55r8Xr154FEfo
	 XZtKFc2PBn1tA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso2766530e87.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 06:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDLglFunubBPz5s4K3497DZldWyBH/kJFyv/DYn/d0GRYsqqqJ7JHmuthoYHTKhu/yu0WCMC/XB6BErON+lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXE+awK/6hL46ij943T74a5AzJ76hojrU3BEXVvjZJPqBNN6kw
	OZ804DrMiVF/904njRw4IBKYIfpfXBBg/Vz7I23kmReaIbEt1qWzfVYWVIacWR28zc0ZgnT8ptz
	AkTou9QqqpmK60Du8W5Pngz7bFjTsli4=
X-Received: by 2002:a05:6512:3792:20b0:59f:691f:ed67 with SMTP id
 2adb3069b0e04-59f69c20c25mr2052046e87.3.1771165506294; Sun, 15 Feb 2026
 06:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215132232.1549861-1-lossin@kernel.org>
In-Reply-To: <20260215132232.1549861-1-lossin@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 15 Feb 2026 06:24:30 -0800
X-Gmail-Original-Message-ID: <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>
X-Gm-Features: AaiRm5162OokArm9fYA7HMS9wLltcHmdihk8HpkCki4kAqPKj2MSWQxDwYdETKE
Message-ID: <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 8:22=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
> warns about the `let_and_return` lint when a comment is placed between
> the let binding and the return expression. Nightly thus fails to build,
> because the expectation is no longer fulfilled.
>
> Thus replace the expectation with an `allow`.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/src/lib.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 49945fc07f25..fe4c85ae3f02 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Re=
sult<(), E> {
>  ///
>  /// - `*mut U` must be castable to `*mut T` and any value of type `T` wr=
itten through such a
>  ///   pointer must result in a valid `U`.
> -#[expect(clippy::let_and_return)]
>  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> =
impl PinInit<U, E> {
>      // SAFETY: initialization delegated to a valid initializer. Cast is =
valid by function safety
>      // requirements.
>      let res =3D unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinn=
ed_init(ptr.cast::<T>())) };
>      // FIXME: remove the let statement once the nightly-MSRV allows it (=
1.78 otherwise encounters a
>      // cycle when computing the type returned by this function)
> +    #[allow(clippy::let_and_return)]

Consider adding `reason =3D "..."`.

>      res
>  }
>
> @@ -1159,13 +1159,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Re=
sult<(), E> {
>  ///
>  /// - `*mut U` must be castable to `*mut T` and any value of type `T` wr=
itten through such a
>  ///   pointer must result in a valid `U`.
> -#[expect(clippy::let_and_return)]
>  pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl In=
it<U, E> {
>      // SAFETY: initialization delegated to a valid initializer. Cast is =
valid by function safety
>      // requirements.
>      let res =3D unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr=
.cast::<T>())) };
>      // FIXME: remove the let statement once the nightly-MSRV allows it (=
1.78 otherwise encounters a
>      // cycle when computing the type returned by this function)
> +    #[allow(clippy::let_and_return)]

Consider adding `reason =3D "..."`.

>      res
>  }
>
>
> base-commit: ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
> --
> 2.52.0
>
>
