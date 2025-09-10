Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C02274B29
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499814; cv=none; b=jeMJddglzDajb2ElocM1P8+KtZCtdmgqZfo2hHi6fL0SbjMv0iJ1Qtx/5eo7YiTQPAbuo8oH6bBluqRjTqAx7Yxx9UEGftA2oDyeuQ8qMHXRfQyNh2ducRXVFnFO1Ir2KRnMZuBL1jeMoXkR5d6yHvPcTY1x6qxJ3o0gZAn+cDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499814; c=relaxed/simple;
	bh=PGttvBL9JFQtk+P9936QbIX5psM2HFw2fTKtEkCUi+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Osd0YcPr9eu9yNoUaa9mPfSZRUbPOwQDwz2BFj6vYiNC3AJVJ0o9nJyI6gZ8HLF2CUOn3bFea3yzOabBXaUf+mKhbCq4zxrw281vzaMn6eDzut5iQ7KUJXRjINqzSzVDzvsEHkx2Z7MiCj7lyU0XXh1OWahB1YfQ9hcnRSVsgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1nA5JWSX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1nA5JWSX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so28142565e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757499811; x=1758104611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tufP6z/2etbln4lUc4bR0WynCFYZ0JZvTvmDKR+ycI=;
        b=1nA5JWSXaVA+Ro3GqgR9d6dUMzrY1ad0fDc8uqggFlOQTLM2S2bcE0P4u/gQ2ysg3G
         edqYmnoWhvmViTERpGA6nDn8+otwSnyrfBRt69vxj2jQCyXQvUZM6QseQ8AOEvgAD/dO
         DWhCs0mglamnXxXqqmK5b4NDnYkihWS4dSnLeHBJBY//Gzj0eh1yIrhuCmk+rcK6PjJl
         Y6PNZ9VWi2Th+gZvGsOy3hXu9zLnEE1XKTnSo0ieWM/eH8MZ1wCwHnO8UZHqmMVFNJ5S
         CbKnN1+P00DPE7rkTZEccETW+VmI5DlO+z91ljunwxPYCdoPhGsPNO6N1ZD4djYDfL6s
         mVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757499811; x=1758104611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tufP6z/2etbln4lUc4bR0WynCFYZ0JZvTvmDKR+ycI=;
        b=KJ+Q5wasnO2jnbU8bTNF9quxrecTs5kORRedWOzRVzvTgITIT+esu1zSSGEQSRrsW3
         Y9rOWpBLNpEqa4ZweROHkPNgL6F145V+XRJNnTh4EbIh5WTAJ1z01pXw/8hareo0uop/
         ZHHua8RsRMiIPZPtMxREMIIP2sCnbkgYd3qwWxALy6xKaq/Yh6BPbgjAuOq+GjQlc5Wd
         p97VBSIo6GKhvohdW7jtYbGCalNHDHwKsIHa5zr3/l1UIPrCrLuHu9a2N12y1JzXBbLP
         XHoEPzMDs58z3a34AymWQQokG0KcqQaIV4XhRhbowCXInw7wpOEGxiUf7B88pKxSbWMR
         fkww==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZqGEMZUCCo7C5tblWcyQQlj7jWHbv37MQ1MhWhDtaTo+eHnhKYRwt+4K+U1zeidPxJTsEyMgx3RcbEMqAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0hUv5xSGCyjBxglvq1rdHqjmBtt/bauBGQVFFDyVEOc6UMxf
	/yaI8PeTnzEaliSsQ3dpRMUXkC0t7EA+WMjwu+o+AIQny8xRFjs5tuilVi4cJKXF2SWovfHjJvJ
	GcyEG/XJKTiw/3V/8l8ZBkvU3zhsImCzNGd/GXB0g
X-Gm-Gg: ASbGncsglDCNpDCJmX3w2K6fSqOObabJMWYg1AOyfisHdxeQpJrY037ORQoylQa0zBV
	3Uu3g/4VafpCYjiWWixRsmZ9odshK3jctlzS1agjZ/FLYMsw/QL3AXb4Q7WNG3RIbVuplVWaLkD
	nYzaCcEYIzRaxkfBE0aygH1lxH8TpjmRdJ3P7FEtJ0nmekCUCpSlT/4FLgsgtzpAKjfsntZrMn+
	jw79vbI3xq9VGUOCkNXnMTsQUnlLMs9rufCOc2iUeh8fqpbDx8sjDeeJA==
X-Google-Smtp-Source: AGHT+IFjEgYFGrcmPgggqL7SOlE8Cvi/8ijfclUwOksIktRtxum1JWy8VXL6gR6ObDPw404jEWbDXLTruwRGyXw9t5A=
X-Received: by 2002:a05:6000:420f:b0:3d1:e22d:df2f with SMTP id
 ffacd0b85a97d-3e641969ce2mr16378740f8f.23.1757499810745; Wed, 10 Sep 2025
 03:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905171209.944599-1-lossin@kernel.org> <20250905171209.944599-2-lossin@kernel.org>
In-Reply-To: <20250905171209.944599-2-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 10 Sep 2025 12:23:17 +0200
X-Gm-Features: AS18NWD6xYvlI13ABsfyCh0SoWvgFM4fz7y9hvPt5Zv6mWQjfHhmjU85KdCzgzg
Message-ID: <CAH5fLgjD+S0nBvDMuTfMYd6-o-3f=xGztk+jZQRhm1_vmNiHAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: pin-init: add pin projections to `#[pin_data]`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Alban Kurti <kurti@invicto.ai>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 7:12=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Make the `#[pin_data]` macro generate a `*Projection` struct that holds
> either `Pin<&mut Field>` or `&mut Field` for every field of the original
> struct. Which version is chosen depends on weather there is a `#[pin]`
> or not respectively. Access to this projected version is enabled through
> generating `fn project(self: Pin<&mut Self>) -> SelfProjection<'_>`.
>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/75/commits/2d698367=
d646c7ede90e01aa22842c1002d017b3
> [ Adapt workqueue to use the new projection instead of its own, custom
>   one - Benno ]
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/kernel/workqueue.rs    | 10 ++-----
>  rust/pin-init/src/macros.rs | 60 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+), 8 deletions(-)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index b9343d5bc00f..6ca14c629643 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -356,18 +356,12 @@ struct ClosureWork<T> {
>      func: Option<T>,
>  }
>
> -impl<T> ClosureWork<T> {
> -    fn project(self: Pin<&mut Self>) -> &mut Option<T> {
> -        // SAFETY: The `func` field is not structurally pinned.
> -        unsafe { &mut self.get_unchecked_mut().func }
> -    }
> -}
> -
>  impl<T: FnOnce()> WorkItem for ClosureWork<T> {
>      type Pointer =3D Pin<KBox<Self>>;
>
>      fn run(mut this: Pin<KBox<Self>>) {
> -        if let Some(func) =3D this.as_mut().project().take() {
> +        if let Some(func) =3D this.as_mut().project().func.take() {
> +            // if let Some(func) =3D this.as_mut().project_func().take()=
 {
>              (func)()
>          }
>      }
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 9ced630737b8..d225cc144904 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -831,6 +831,17 @@ macro_rules! __pin_data {
>              $($fields)*
>          }
>
> +        $crate::__pin_data!(make_pin_projections:
> +            @vis($vis),
> +            @name($name),
> +            @impl_generics($($impl_generics)*),
> +            @ty_generics($($ty_generics)*),
> +            @decl_generics($($decl_generics)*),
> +            @where($($whr)*),
> +            @pinned($($pinned)*),
> +            @not_pinned($($not_pinned)*),
> +        );
> +
>          // We put the rest into this const item, because it then will no=
t be accessible to anything
>          // outside.
>          const _: () =3D {
> @@ -980,6 +991,55 @@ fn drop(&mut self) {
>              stringify!($($rest)*),
>          );
>      };
> +    (make_pin_projections:
> +        @vis($vis:vis),
> +        @name($name:ident),
> +        @impl_generics($($impl_generics:tt)*),
> +        @ty_generics($($ty_generics:tt)*),
> +        @decl_generics($($decl_generics:tt)*),
> +        @where($($whr:tt)*),
> +        @pinned($($(#[$($p_attr:tt)*])* $pvis:vis $p_field:ident : $p_ty=
pe:ty),* $(,)?),
> +        @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type=
:ty),* $(,)?),
> +    ) =3D> {
> +        $crate::macros::paste! {
> +            #[doc(hidden)]
> +            $vis struct [< $name Projection >] <'__pin, $($decl_generics=
)*> {

I'm not sure we want $vis here. That's the visibility of the original
struct, but I don't think we want it to be pub just because the struct
is.

Otherwise looks reasonable.

Alice
