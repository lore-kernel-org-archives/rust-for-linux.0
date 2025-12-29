Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1132E74C
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024311; cv=none; b=HopBreobsbxTSc5zellMUI9qdkqkB30xlk9M4GhivTObIkfNuvriNS7GILgmj5ELg+zN41NNTuDH6M9925ZIg1CK1KqJQBhTeWOA8/PciMwDmlLNTi3poSF5ZD1u71nlrJKp2o6ifgMUMxmmN0rRJ54OVjplBbzWOPBj8C6nqUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024311; c=relaxed/simple;
	bh=48hsPWEq256pRqAc57CzNNAa+rYEaX5VNF+4A8H72SM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfYS/7RgG1q9dFfAmElDbNn6RZdyQz7kDEeDCon+Boc8LW/OFs8KQDO76LnVTQ3E7G9pmpVJlFFU2h0yfqke5zslYY6DX/+pBjfBge7Ou2B+ddh1N5hQByVUXmZ8yEASM4C6WSP0jAYtFP0oaVpegeUzl0hvkbj+VsXmJSiG3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUqkcGBL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUqkcGBL"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b495ce059so69912101fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024308; x=1767629108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYLGhgGIPIGoYyVP/oj7pU+Mw+MERLFOAe2cdbdXL5Y=;
        b=IUqkcGBLZ169gViCdeBaRQjTWmGOrMi5p2nBGDozX+hWF3tG8ynEb81ScHCfM08/wQ
         RMEKDJ+CAizao9pSk5fNd63A+1zlCWqAy8wf6ovd8/8LfW49UKxGEL0fHjOQXKL2RDl1
         rW3exIcEBbt4yaFLIlxneLuJt12RMD6Hg46ED/9FxEjOEr6bbpXO+k7G0UhiEg2vew9y
         YyRnV3KUgIiSBhhUJEFuVqlURzr73xEGWMOo/sR1SKY1gv4KQ/3CzA6C1/hamyjUvaGb
         QAMMi1qlY53IbJCi55GJa07dG/O40OfMRf4vDMVcoFpP96/a/8YyLjquSORFnR1f/veL
         VgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024308; x=1767629108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYLGhgGIPIGoYyVP/oj7pU+Mw+MERLFOAe2cdbdXL5Y=;
        b=svBpsfdscfZgV/IPTn24Eoqd2lSi+lRya6Mg+20BE4ryZ/bH5m1uZQKRUNpfe9Hd6c
         4JGD0GP+9aaw3YpPJ4vEunksIXJs1CvRmyIndHO7vTb4/1c/zMLZUGkBsjts28z8+iHj
         Y7pZ6vxdA6Lgw8+SG6duZtll4owAEqWmwXsMFnM7fOWGObZkZu+FhGrrPt+xgCrQrqpa
         7ETSG0dGn5Zh85O96oXPsjxjAc6PD2n0feZ0GZ6RTQCoSEgTs1qy/pl20Y9EcOsLieFr
         fe1CV9fSgHcIy6XARcz/dKZ3SW54F9jsgNmTLUYVA8JJQ00lTSYF3poc4dxgA5c9r2oi
         cu3A==
X-Forwarded-Encrypted: i=1; AJvYcCVYr1R3ogotTuVGgAkFmaY6mZ41fT2mNQrkkU2yCOYQNpkVSa1uiEtYHyOXqy08BIw7jANPwxVpWjCfWIEBMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCLCgwMN3504jBFOpeR20jc/a0J8BcfkDPs5mLae5vH8LNYb+
	OXVmyd0TmEwQ+raDeSPGSNA9RUmNgeHi20MtN+FJst1WMdyXcI+QxWW97HKKjQvit5RufrssCFA
	VZu/CPofA84weaUwpZfWVdEM3Ha12WYaScQ==
X-Gm-Gg: AY/fxX6hf4+upQdlfn9a53I6bbu6EbvjBO01TTDiFyPqx6zxd6wiJIq7+QG266c5mRt
	wycEg4pyl4R83f07YZBBivSCHtEcE6HfWhbgP97fOHxyxmlpJEMEsfwAycBed21RWdMvFwHEkAD
	84mich2jx1sJBxPmQX3V0AGt0rpYsFpmCjK7NY9MxFeZ6Czy+PnJxhngTGjjS6xFGnQYPQfXwKf
	sFoL72rG8+HhXJtU96Qnp5H9m8ZekOYvp5z4qF8yyXXMcvOjxzAoXWiLIpb1d2rkxUzJ0gaYPRJ
	X/B+MgK+VkdP+y1E5+zG2muRZFkoBOzh4kH/sFn0DA4IX7jM7WERWwQ0fWq1rcWvlJaUIXdHmD5
	WWv/xxis0RCeuZD8wG/6kFoB21WAmz4csv2a0iHRg9g==
X-Google-Smtp-Source: AGHT+IHYXIWYaU4BMMTu2dB6sSui+mJMqlc0V9/kOwTZ4irELz9FPxEbywjEYZJ+2JgOVPP7fGkYxsRoLGTI5F7IZmo=
X-Received: by 2002:a2e:be1c:0:b0:37a:2c7d:2d69 with SMTP id
 38308e7fff4ca-38121645b1dmr114258961fa.40.1767024307386; Mon, 29 Dec 2025
 08:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-4-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-4-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:04:31 -0500
X-Gm-Features: AQt7F2pbNnPrQCRsI9ShJHxUZiVlk1eum95CqNTmUp_NTB72CuVXrF1PQczLEBc
Message-ID: <CAJ-ks9koBuQabEc7VKAPt1kSLbLyv21NuaNkBOb0FGvZ2hBLPA@mail.gmail.com>
Subject: Re: [PATCH 04/10] rust: xarray: add `XArrayState`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add `XArrayState` as internal state for XArray iteration and entry
> operations. This struct wraps the C `xa_state` structure and holds a
> reference to a `Guard` to ensure exclusive access to the XArray for the
> lifetime of the state object.
>
> The `XAS_RESTART` constant is also exposed through the bindings helper
> to properly initialize the `xa_node` field.
>
> The struct and its constructor are marked with `#[expect(dead_code)]` as
> there are no users yet. We will remove this annotation in a later patch.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/xarray.rs           | 41 +++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 2e43c66635a2c..86bca946faff0 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -109,6 +109,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_P=
RESENT;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>  const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;

Can we avoid casting it here? It's quite distant from the site of use
which makes it difficult to understand why it's necessary. It also
suffers from C casting rules being quite lax, which means a change in
the type on the C side would likely go unnoticed.

>
>  #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
>  #include "../../drivers/android/binder/rust_binder.h"
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index ede48b5e1dba3..f6e610b059625 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -8,7 +8,10 @@
>      iter,
>      marker::PhantomData,
>      pin::Pin,
> -    ptr::NonNull, //
> +    ptr::{
> +        null_mut,
> +        NonNull, //
> +    },
>  };
>  use kernel::{
>      alloc,
> @@ -319,6 +322,42 @@ pub fn store(
>      }
>  }
>
> +/// Internal state for XArray iteration and entry operations.
> +///
> +/// # Invariants
> +///
> +/// - `state` is always a valid `bindings::xa_state`.
> +#[expect(dead_code)]
> +pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
> +    /// Holds a reference to the lock guard to ensure the lock is not dr=
opped
> +    /// while `Self` is live.
> +    _access: &'b Guard<'a, T>,

Can this comment explain why this isn't a PhantomData? IIUC we just
need the lifetime, rather than the actual guard.

> +    state: bindings::xa_state,
> +}
> +
> +impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> +    #[expect(dead_code)]
> +    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
> +        let ptr =3D access.xa.xa.get();
> +        // INVARIANT: We initialize `self.state` to a valid value below.
> +        Self {
> +            _access: access,
> +            state: bindings::xa_state {
> +                xa: ptr,
> +                xa_index: index,
> +                xa_shift: 0,
> +                xa_sibs: 0,
> +                xa_offset: 0,
> +                xa_pad: 0,
> +                xa_node: bindings::XAS_RESTART as *mut bindings::xa_node=
,

Odd that we're casting it back to a pointer here.

> +                xa_alloc: null_mut(),
> +                xa_update: None,
> +                xa_lru: null_mut(),
> +            },
> +        }
> +    }
> +}
> +
>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `=
T` is `Send`.
>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
>
>
> --
> 2.51.2
>
>
