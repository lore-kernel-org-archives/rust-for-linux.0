Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C918DF6E
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397144; cv=none; b=EKV26ZvASzypjG+Mr+THGx2omPVOqVBjnO6SUR35bId1KwcAVkGJ2CMSrxfneRBaT83elB+ubY3ZaAycTGpFG5AZSfRAlmIsz2ET35bjq+vpxY3GwwCcnB+g4aF6vA3J0KPvRfO3A5RgCBpnhLdG3NmbdSSRwLb5K6kWf9w6tSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397144; c=relaxed/simple;
	bh=1553c8GBH/4wfnZ0wT0Fw0LMf5ayYua+MW/Fu4QXArQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQftLr8KRpcgqfNRxRnh7zIZGAxbDP4UuDPAFBXV2hYfVWo/xnDaoXNxfYgn5lH+whuaBIUZktyJLl+5LRR5Zib8LS/QXsv2XQEtMDylJGgLEveLKOOCVdxjB5MHtauA9SCVbFGxerBScncD1zpaIOGEG7CxmyanldQrj5OqWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=aDG/IeYo; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="aDG/IeYo"
From: Fiona Behrens <finn@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1733396794; bh=t/tPblrv4YbP22txyJzf5WADhEAHpktb2m7vi7BZtII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aDG/IeYonUaNgNz8U+4SEqgFhYhd/VfHDJCE1nyPlmRNdirSbLmmD7ZMhpCE/R/Gk
	 rm8X2fyF0LGkQ+cc5CmK7Bf7iY7dRhTdWV3ietsgmiCk5uwJQrCINsHXBp0FU9444W
	 aoX3qBZoJtQ91jbAVjwqjByx1X8eNoiKR9meKewY=
To: Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 dingxiangfei2009@protonmail.ch
Subject: Re: [PATCH v2] rust: use derive(CoercePointee) on rustc >= 1.83.0
Date: Thu, 05 Dec 2024 12:06:33 +0100
Message-ID: <CC3F267E-55E2-446E-9926-E9D5BE37F410@kloenk.dev>
In-Reply-To: <20241203205050.679106-2-dingxiangfei2009@gmail.com>
References: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
 <20241203205050.679106-1-dingxiangfei2009@gmail.com>
 <20241203205050.679106-2-dingxiangfei2009@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 3 Dec 2024, at 21:47, Xiangfei Ding wrote:

> The kernel crate relies on both *coerce_unsized* and *dispatch_from_dyn=
*
> unstable features.
> Alice Ryhl has proposed [1] the introduction of the unstable macro
> `SmartPointer` to reduce such dependence, along with a RFC patch [2].
> Since Rust 1.81.0 this macro, later renamed to `CoercePointee` at
> Rust 1.83.0, has been fully implemented with the naming discussion
> resolved.
>
> This feature is now on track to stabilization in the language.
> In order to do so, we shall start using this macro in the kernel crate
> to prove the functionality and utility of the macro as the justificatio=
n
> of its stabilization.
>
> This patch makes this switch in such a way that the crate remains
> backward compatible with older Rust compiler versions,
> via the flag *RUST_COERCE_POINTEE*.
>
> A minimal demostration code is added to the
> *samples/rust/rust_print_main.rs* module.
>
> Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [=
1]
> Link: https://lore.kernel.org/all/20240823-derive-smart-pointer-v1-1-53=
769cd37239@google.com/ [2]
> Signed-off-by: Xiangfei Ding <dingxiangfei2009@gmail.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
> Changes in v2:
> - Apply the new name to the `kernel` crate
> - Reformat the commit message.
>
>  init/Kconfig                    |  3 +++
>  rust/kernel/alloc.rs            |  2 +-
>  rust/kernel/lib.rs              |  7 ++++---
>  rust/kernel/list/arc.rs         |  9 ++++++---
>  rust/kernel/sync/arc.rs         | 15 +++++++++++----
>  samples/rust/rust_print_main.rs | 15 +++++++++++++++
>  6 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a20e6efd3f0f..eb9b7e24e859 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1978,6 +1978,9 @@ config RUST
>
>  	  If unsure, say N.
>
> +config RUST_COERCE_POINTEE
> +	def_bool y if RUSTC_VERSION >=3D 108300
> +
>  config RUSTC_VERSION_TEXT
>  	string
>  	depends on RUST
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index f2f7f3a53d29..fc9c9c41cd79 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -123,7 +123,7 @@ pub mod flags {
>  /// [`Allocator`] is designed to be implemented as a ZST; [`Allocator`=
] functions do not operate on
>  /// an object instance.
>  ///
> -/// In order to be able to support `#[derive(SmartPointer)]` later on,=
 we need to avoid a design
> +/// In order to be able to support `#[derive(CoercePointee)]` later on=
, we need to avoid a design
>  /// that requires an `Allocator` to be instantiated, hence its functio=
ns must not contain any kind
>  /// of `self` parameter.
>  ///
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 04dbee70d3e6..b665a28d1c12 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -13,11 +13,12 @@
>
>  #![no_std]
>  #![feature(arbitrary_self_types)]
> -#![feature(coerce_unsized)]
> -#![feature(dispatch_from_dyn)]
> +#![cfg_attr(CONFIG_RUST_COERCE_POINTEE, feature(derive_coerce_pointee)=
)]
> +#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(coerce_unsized))]=

> +#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(dispatch_from_dyn=
))]
> +#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(unsize))]
>  #![feature(inline_const)]
>  #![feature(lint_reasons)]
> -#![feature(unsize)]
>
>  // Ensure conditional compilation based on the kernel configuration wo=
rks;
>  // otherwise we may silently break things like initcall handling.
> diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
> index 3483d8c232c4..f5b3a446eae2 100644
> --- a/rust/kernel/list/arc.rs
> +++ b/rust/kernel/list/arc.rs
> @@ -7,7 +7,7 @@
>  use crate::alloc::{AllocError, Flags};
>  use crate::prelude::*;
>  use crate::sync::{Arc, ArcBorrow, UniqueArc};
> -use core::marker::{PhantomPinned, Unsize};
> +use core::marker::PhantomPinned;
>  use core::ops::Deref;
>  use core::pin::Pin;
>  use core::sync::atomic::{AtomicBool, Ordering};
> @@ -159,6 +159,7 @@ fn try_new_list_arc(&self) -> bool {
>  ///
>  /// [`List`]: crate::list::List
>  #[repr(transparent)]
> +#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePoin=
tee))]
>  pub struct ListArc<T, const ID: u64 =3D 0>
>  where
>      T: ListArcSafe<ID> + ?Sized,
> @@ -443,18 +444,20 @@ fn as_ref(&self) -> &Arc<T> {
>
>  // This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` =
can be converted to the
>  // dynamically-sized type (DST) `U`.
> +#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
>  impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for=
 ListArc<T, ID>
>  where
> -    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
> +    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
>      U: ListArcSafe<ID> + ?Sized,
>  {
>  }
>
>  // This is to allow `ListArc<U>` to be dispatched on when `ListArc<T>`=
 can be coerced into
>  // `ListArc<U>`.
> +#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
>  impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> f=
or ListArc<T, ID>
>  where
> -    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
> +    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
>      U: ListArcSafe<ID> + ?Sized,
>  {
>  }
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index fa4509406ee9..bca3d1f1e1b6 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -26,7 +26,7 @@
>  use core::{
>      alloc::Layout,
>      fmt,
> -    marker::{PhantomData, Unsize},
> +    marker::PhantomData,
>      mem::{ManuallyDrop, MaybeUninit},
>      ops::{Deref, DerefMut},
>      pin::Pin,
> @@ -125,6 +125,8 @@
>  /// let coerced: Arc<dyn MyTrait> =3D obj;
>  /// # Ok::<(), Error>(())
>  /// ```
> +#[repr(transparent)]
> +#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePoin=
tee))]
>  pub struct Arc<T: ?Sized> {
>      ptr: NonNull<ArcInner<T>>,
>      _p: PhantomData<ArcInner<T>>,
> @@ -172,10 +174,12 @@ unsafe fn container_of(ptr: *const T) -> NonNull<=
ArcInner<T>> {
>
>  // This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be c=
onverted to the
>  // dynamically-sized type (DST) `U`.
> -impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>=
> for Arc<T> {}
> +#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
> +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::Coerce=
Unsized<Arc<U>> for Arc<T> {}
>
>  // This is to allow `Arc<U>` to be dispatched on when `Arc<T>` can be =
coerced into `Arc<U>`.
> -impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<=
U>> for Arc<T> {}
> +#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
> +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::Dispat=
chFromDyn<Arc<U>> for Arc<T> {}
>
>  // SAFETY: It is safe to send `Arc<T>` to another thread when the unde=
rlying `T` is `Sync` because
>  // it effectively means sharing `&T` (which is safe because `T` is `Sy=
nc`); additionally, it needs
> @@ -471,6 +475,8 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
>  /// obj.as_arc_borrow().use_reference();
>  /// # Ok::<(), Error>(())
>  /// ```
> +#[repr(transparent)]
> +#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePoin=
tee))]
>  pub struct ArcBorrow<'a, T: ?Sized + 'a> {
>      inner: NonNull<ArcInner<T>>,
>      _p: PhantomData<&'a ()>,
> @@ -478,7 +484,8 @@ pub struct ArcBorrow<'a, T: ?Sized + 'a> {
>
>  // This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow=
<T>` can be coerced into
>  // `ArcBorrow<U>`.
> -impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcB=
orrow<'_, U>>
> +#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
> +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::Dispat=
chFromDyn<ArcBorrow<'_, U>>
>      for ArcBorrow<'_, T>
>  {
>  }
> diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_=
main.rs
> index aed90a6feecf..87cf5321f492 100644
> --- a/samples/rust/rust_print_main.rs
> +++ b/samples/rust/rust_print_main.rs
> @@ -34,6 +34,21 @@ fn arc_print() -> Result {
>      // Uses `dbg` to print, will move `c` (for temporary debugging pur=
poses).
>      dbg!(c);
>
> +    {
> +        use core::fmt::Display;
> +        fn arc_dyn_print(arc: &Arc<dyn Display>) {
> +            pr_info!("Arc<dyn Display> says {arc}");
> +        }
> +        // `Arc` can be used to delegate dynamic dispatch and the foll=
owing is an example.
> +        // Both `i32` and `&str` implements `Display`.
> +        // This enables us to express a unified behaviour, contract or=
 protocol
> +        // on both `i32` and `&str` into a single `Arc` type `Arc<dyn =
Display>`.
> +        let a_i32_display: Arc<dyn Display> =3D Arc::new(42i32, GFP_KE=
RNEL)?;
> +        let a_str_display: Arc<dyn Display> =3D a.clone();
> +        arc_dyn_print(&a_i32_display);
> +        arc_dyn_print(&a_str_display);
> +    }
> +
>      // Pretty-prints the debug formatting with lower-case hexadecimal =
integers.
>      pr_info!("{:#x?}", a);
>
> -- =

> 2.47.1
