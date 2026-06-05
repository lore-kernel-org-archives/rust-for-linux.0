Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA434C8FEB
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780660043; cv=none; b=MvZDJsS61Zg8VZk04lfGnnCUJvFs+G//Gz5v0ArhyReYxOO23tDtr+HgmoG/+UQblizi0htw37uqytuTlGUG+q8m/SveAv5b2sX84ONH7Pf8zaRHqXUmL1IXf/VmqOhY7+4g4tSPsjQqOoXRSXlDOVo/kRWHHtk90KqsKrsvsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780660043; c=relaxed/simple;
	bh=qu6oPUTWiu+uJkJrKNjo617jkpqWGB447ytNTjA2jv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CFJOY73YijK9e72HrmdqMKif6kjYn3o66u2sVr2A/En1wz8NBODCe99oFpWr0A8jJIcg8/xDa9BMNRXLGOWTHoWR5jQh4dJwa53wtrQM+9trXAMyzc3s+aM9N17Mg9UVe/wsCMbbzElrMFx0evHg9uYZ8W1FMwUrb7XgtIKo+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bUCKgm7q; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bUCKgm7q"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49048e21ea7so19377055e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 04:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780660040; x=1781264840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/IlIx044+gP0+18N3h3jc4/lRTkHNLG0jx4kZyUe48=;
        b=bUCKgm7qLmKJIdH4bf1GNoQ2w+VAgsN6Ea0lxFeYE6vsHmzp0zN8OlDQWRPw7L3sjn
         79mHnQAnPiwd/2prYOpQhwzBkbfn54Kw233zhgssVjMtGKHg310XIQSC6wLlEeJqmxZC
         ngcFzrnpKHE/Z/ph+MzxasjvShPNEnyk1kkWnzLAXgxnt3ww+cZL4cqkYAjhq0pm4AHv
         7J9GwL3c8PWhTE7iKt5isO/rttRCgH7CYQcvnwtSuG6oqlW6arBIfVz3imWBz3EhErvw
         7dRTTKu/Y3vzY4D5NjZTfwyY2s3tuFImZKAZ7koA9/lTHRCsQES6eqRnZA1+Psskf2/4
         uSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660040; x=1781264840;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/IlIx044+gP0+18N3h3jc4/lRTkHNLG0jx4kZyUe48=;
        b=AoZ840UtO0o5ACiYYQWVVwz85AjJyZVi41a0HnXO1UdUDWhH8SIy664eDSi0g6L5b+
         fYaKldLWIcsk2QhSLStcfzLIVpnpzNc7OxGGHswQE10fVs0CCsw/URZrco/Un7LvWMfJ
         hT01TwG93uL5i/Q97muZ0bEvUaZXCkZjcpU5JAX3R+3Zy+5Ywf/Z67N+88ZygOa5wfnq
         u1RuH6K4nbQ/qBvCs1vJKc9HAmnyEvcH52ZNRg9Eqh8BJzZgqgjnqaRYhADc26wRL2KC
         mhc3B21E3rRSQ6nwXU34XLCIavuURzrk6eZw21L12Z1kRGh0Uo7ByiNB9FxQb8Pq3JMY
         fPRg==
X-Forwarded-Encrypted: i=1; AFNElJ/pF3HTuR+gyzT7W8wles79yb0Scev3yzCSn3TAnV4S85sg3nALCzy0IoTPFUBKd9KjxsAglQ6IjWSFWRsqCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47aa2oZRLNeKSDpCFE1edO7i+OsuCgYfm+YvrHpv5ZOzEmszl
	u0AniVOaBGqlGXqyI42fQrX0KH1vP7r/ghMoEDuHNDq5SWLF/uV6OtMRNzd6+a0BC4ryALK/acK
	H6GTtKFqrtQdJcXcT+A==
X-Received: from wmat17.prod.google.com ([2002:a05:600c:6d11:b0:490:af39:1573])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6096:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-490c2d038e8mr32041095e9.12.1780660040223;
 Fri, 05 Jun 2026 04:47:20 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:47:19 +0000
In-Reply-To: <20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org>
Message-ID: <aiK3R1yRHj8zcGuh@google.com>
Subject: Re: [PATCH v2] rust: alloc: add per-task memalloc scope abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 12:54:41PM +0200, Andreas Hindborg wrote:
> Add an abstraction for the per-task allocation policies exposed by
> the kernel through paired save/restore helpers in `linux/sched/mm.h`:
> `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
> `memalloc_pin`. Each pair toggles a bit in `current->flags` and
> returns the prior state for a later restore. The pairing assumes
> strict LIFO nesting; restoring out of order corrupts the per-task
> state.
>=20
> Wrap the four pairs as a generic `Scope<K>` guard with a sealed
> `ScopeKind` trait. Tag types `NoIo`, `NoFs`, `NoReclaim` and
> `MemallocPin` select the underlying save/restore pair. `Scope` is
> `!Unpin`, `!Send` and `!Sync`, and is only constructed through the
> `memalloc_scope!` macro, which binds it via `core::pin::pin!` to a
> hidden stack slot and hands out a `Pin<&Scope<K>>`. Safe code
> therefore cannot move the guard across tasks, drop it ahead of its
> lexical scope or otherwise violate the LIFO save/restore discipline.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v2:
> - Rewrite the patch to use scoped allocation flags instead of exposing
>   a `GFP_NOIO` flag constant.
> - Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc49b=
44@kernel.org
>=20
> To: Miguel Ojeda <ojeda@kernel.org>
> To: Boqun Feng <boqun@kernel.org>
> To: Gary Guo <gary@garyguo.net>
> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> To: Benno Lossin <lossin@kernel.org>
> To: Andreas Hindborg <a.hindborg@kernel.org>
> To: Alice Ryhl <aliceryhl@google.com>
> To: Trevor Gross <tmgross@umich.edu>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Lorenzo Stoakes <ljs@kernel.org>
> To: "Liam R. Howlett" <liam@infradead.org>
> To: Vlastimil Babka <vbabka@kernel.org>
> To: Uladzislau Rezki <urezki@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: rust-for-linux@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/mm.c               |  40 +++++++
>  rust/kernel/alloc.rs            |   1 +
>  rust/kernel/alloc/scoped.rs     | 231 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 273 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 446dbeaf0866..1931b131345f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -83,6 +83,7 @@
>  #include <linux/refcount.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
> +#include <linux/sched/mm.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
> diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
> index b5540997bd20..b8e7492512e8 100644
> --- a/rust/helpers/mm.c
> +++ b/rust/helpers/mm.c
> @@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct vm_=
area_struct *vma)
>  {
>  	vma_end_read(vma);
>  }
> +
> +unsigned int rust_helper_memalloc_noio_save(void)
> +{
> +	return memalloc_noio_save();
> +}
> +
> +void rust_helper_memalloc_noio_restore(unsigned int flags)
> +{
> +	memalloc_noio_restore(flags);
> +}
> +
> +unsigned int rust_helper_memalloc_nofs_save(void)
> +{
> +	return memalloc_nofs_save();
> +}
> +
> +void rust_helper_memalloc_nofs_restore(unsigned int flags)
> +{
> +	memalloc_nofs_restore(flags);
> +}
> +
> +unsigned int rust_helper_memalloc_noreclaim_save(void)
> +{
> +	return memalloc_noreclaim_save();
> +}
> +
> +void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
> +{
> +	memalloc_noreclaim_restore(flags);
> +}
> +
> +unsigned int rust_helper_memalloc_pin_save(void)
> +{
> +	return memalloc_pin_save();
> +}
> +
> +void rust_helper_memalloc_pin_restore(unsigned int flags)
> +{
> +	memalloc_pin_restore(flags);
> +}
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index e38720349dcf..8ebb8c9f3e67 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -6,6 +6,7 @@
>  pub mod kbox;
>  pub mod kvec;
>  pub mod layout;
> +pub mod scoped;
> =20
>  pub use self::kbox::Box;
>  pub use self::kbox::KBox;
> diff --git a/rust/kernel/alloc/scoped.rs b/rust/kernel/alloc/scoped.rs
> new file mode 100644
> index 000000000000..0251792c9f3c
> --- /dev/null
> +++ b/rust/kernel/alloc/scoped.rs
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Scoped allocation policies for the current task.
> +//!
> +//! The kernel exposes several per-task allocation policies through
> +//! save/restore pairs in [`include/linux/sched/mm.h`]: `memalloc_noio`,
> +//! `memalloc_nofs`, `memalloc_noreclaim` and `memalloc_pin`. Each pair
> +//! sets a bit in `current->flags` and returns the prior state, which a
> +//! later call restores. The save/restore APIs assume strict LIFO
> +//! nesting; restoring out of order corrupts the per-task state.
> +//!
> +//! This module exposes the policies as a generic [`Scope<K>`] guard,
> +//! parameterized over a [`ScopeKind`] tag. The type is `!Unpin` and
> +//! constructed only through the [`memalloc_scope!`] macro, which binds
> +//! it to a hidden stack slot via [`core::pin::pin!`] and rebinds the
> +//! handle as a shared pinned reference. Safe code therefore has no path
> +//! to either move the guard or drop it ahead of its lexical scope, so
> +//! nested scopes always restore in LIFO order.

Your scope trick only works in normal fns, not in generators such as
async fn.

> +//! [`include/linux/sched/mm.h`]: srctree/include/linux/sched/mm.h
> +//!
> +//! # Examples
> +//!
> +//! ```ignore
> +//! use kernel::memalloc_scope;
> +//! use kernel::alloc::scoped::NoIo;
> +//!
> +//! fn process_io_request() {
> +//!     memalloc_scope!(let _noio: NoIo);

If we're not going to access this value, then I'd just do:

fn process_io_request() {
    memalloc_scope!(NoIo);
}

or

fn process_io_request() {
    memalloc_noio_scope!();
}

> +/// Selects which `memalloc_*` save/restore pair a [`Scope`] wraps.
> +///
> +/// Implemented only by the zero-sized tag types in this module
> +/// ([`NoIo`], [`NoFs`], [`NoReclaim`], [`MemallocPin`]). The trait is
> +/// sealed.
> +pub trait ScopeKind: private::Sealed {
> +    /// Begin a scope on the current task and return the prior state.
> +    #[doc(hidden)]
> +    fn save() -> c_uint;
> +
> +    /// End a scope on the current task.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `prev` must be the value returned by the matching [`save`] call,
> +    /// and the call must execute on the same task that ran [`save`].
> +    ///
> +    /// [`save`]: ScopeKind::save
> +    #[doc(hidden)]
> +    unsafe fn restore(prev: c_uint);
> +}

I think all this doc(hidden) + sealing + defining structs via macros is
unnecessary. Just make a normal trait. Or even just define four structs.

Alice
