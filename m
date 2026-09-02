Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F44A2600
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360058; cv=none; b=KG3fJ0t43shPInUyWQfFAmn+vfOb8y7WK6VYlmFb5i33KdrKPZEjofsa0r1RozhBfuN4AeNXMkgONdMRVDhA4XLK9Idq+Tpq1wnq56yfW6F/Y3M4V9TwttvTIABUny8jbEfVDzvx/rHhcqSds1CRxsRucUAl8Emc3Bf047Hv2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360058; c=relaxed/simple;
	bh=UzT/3uQeCSHnZwUjwpX53oFYN/MwNlx1kqJL3RMuh4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NOT5lMEGSYWhygvJ053gdTfctRruRo7epqwunb2vUT6NTp1r7BEp4TULYOYCCMdJkHOUucertU2J7f3A85HMcLWgflCiWKiNaRig5gHmou6HG2bGSmhSRUvrO5XKSB1e3KfXY1N2AM5aDAVsfcP71Orka6CqX7AEzj8xPaaO8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UVSWNiVw; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UVSWNiVw"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15f4732dfaso95959266b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Sep 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788360053; x=1788964853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MBREmdqabQdFKTYGInQWVooRXHFWfy/jmV2KVy/Yvy4=;
        b=UVSWNiVwv3F5NYYBYjcgtAHAQrQRtc92c016duUxQcHDuikvekJjCZFu4PoUDsWWRY
         Hjmf6W9+zYdGMl2horB7iYOh5A6MfYtj5S0JVxoG4jIB5JP+mpTziJN+MrKIU7dmNUuq
         qQLhuIH8wi1yVPWPcWEga6X0qQRyAGr6KkjFipxrUTBW7c1W+4Xgw+UPCMiL/UuVr2GH
         ZoXmJ4RkGOh3+Ar3BHffMpFpTdhax+mtsb7/RlUpFSwi/VrLR38RswhJG7WDwy3JP9XB
         XEpvpU6kk9aPoanQl1XYUU3D5XN4cjsQCUQl2806/W1gumVbFUeJSCOV6JNcjb6sdWdc
         pDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360053; x=1788964853;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBREmdqabQdFKTYGInQWVooRXHFWfy/jmV2KVy/Yvy4=;
        b=GZ8hRg/AU0fWiwGEn3kKVxKCK4SbCpkauUDamqGO88NtSB9F/hNZhC+VysW0k5Wtkv
         1lssRq8FcjD/7xy/e8sRWjnpWHHtD9e1S/jIbgzgz95FdRqNaHcX9rmze3MhFDGGeeEs
         HmdrglaEQSfwqc4lLb+3UgRXoLedVm+mJxemBAFpq6KDURxKvfFvJO3IvDM2lVxs6+lF
         Ih9vDmHS0Lif8vjWAw6PgWgPU2vbFnLI0JEvZBBvz+soXCqnrRjpkM0SmM7/aVBN0pVy
         I5Tk73tUvU6kIVYy6x/G4U/rvejfCP0xmF4MT2Xz4AKMt8OJ9dtE/Yqc+YJZqc4YzKUh
         fJwg==
X-Forwarded-Encrypted: i=1; AKwUvBz6EXAhY6faktZ4hToTGpBhJbBbm/GjBx8sSMrIyb7woPaVWMB+YQ3EF/2QzdnRpIhsPUiZ5kXgVBmNO1ORqg==@vger.kernel.org
X-Gm-Message-State: AFuF++nNIH6+aAMpACggH0qlZ2xO2MfKV1Y8/uEU4/GTqcItwSfssjxB
	sxKrMvEcHByOCV0FcoovFLmNZ24i/9si7FfunOsB7WmJ1kVLKrVQCH8hhmWu+Yb9k36j9np/jI3
	YBbHGtyjhY59azXo6tg==
X-Received: from ejqf20.prod.google.com ([2002:a17:906:5614:b0:c21:94d3:ec7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id a640c23a62f3a-c25d53cd18bmr272268766b.7.1788360052881;
 Wed, 02 Sep 2026 07:40:52 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:40:51 +0000
In-Reply-To: <20260807165252.3849875-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807165252.3849875-1-dakr@kernel.org> <20260807165252.3849875-6-dakr@kernel.org>
Message-ID: <apg1c4GdVrhYDK1P@google.com>
Subject: Re: [PATCH v2 5/6] rust: workqueue: add ScopedQueue for lifetime
 bound items
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: tj@kernel.org, jiangshanlai@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 06:52:48PM +0200, Danilo Krummrich wrote:
> From: Onur =C3=96zkan <work@onurozkan.dev>
>=20
> Add a workqueue wrapper for work items that are not 'static.
>=20
> Tyr reset work is queued from a handle that owns a Controller<'bound>
> where the work item holds references tied to the lifetime of the bound
> device and its mapped IO state. The existing API only accepts 'static
> work items which cannot express that relationship.
>=20
> Introduce ScopedQueue for this case. It owns the underlying workqueue
> and ties enqueued work to the queue lifetime so borrowed state cannot
> outlive the queue that may still run it.
>=20
> Construction is unsafe because the queue must not be leaked.
>=20
> `compile_fail` doc-tests are ignored for now as KUnit doesn't support
> that. Enabling those tests as regular code block would raise this error:
>=20
>     ERROR:root:error[E0597]: `data` does not live long enough
> 	 --> rust/doctests_kernel_generated.rs:22029:44
> 	  |
>     22027 |         let data =3D ();
> 	  |             ---- binding `data` declared here
>     22028 |         // SAFETY: Queue is not leaked.
>     22029 |         queue =3D unsafe { new_queue(&data)? };
> 	  |                                            ^^^^^ borrowed value does=
 not live long enough
>     22030 |     }
> 	  |     - `data` dropped here while still borrowed
>     ...
>     22034 | }
> 	  | - borrow might be used here, when `queue` is dropped and runs the `D=
rop` code for type `ScopedQueue`
> 	  |
> 	  =3D note: values in a scope are dropped in the opposite order they are=
 defined

The '^^^^^' on the warning doesn't quite point at the right location.

>=20
> which is exactly the constraint ScopedQueue is meant to enforce.
>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> [ Move from scoped_queue.rs to scoped.rs, which can be shared with
>   ScopedWork; add missing inline annotations. - Danilo ]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/workqueue/mod.rs    |   3 +
>  rust/kernel/workqueue/scoped.rs | 190 ++++++++++++++++++++++++++++++++
>  2 files changed, 193 insertions(+)
>  create mode 100644 rust/kernel/workqueue/scoped.rs
>=20
> diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
> index 8eb2d037be83..551fa1401b85 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -212,6 +212,9 @@
>  mod builder;
>  pub use self::builder::Builder;
> =20
> +mod scoped;
> +pub use self::scoped::ScopedQueue;
> +
>  /// Creates a [`Work`] initialiser with the given name and a newly-creat=
ed lock class.
>  #[macro_export]
>  macro_rules! new_work {
> diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/scop=
ed.rs
> new file mode 100644
> index 000000000000..18a4b6f6cf18
> --- /dev/null
> +++ b/rust/kernel/workqueue/scoped.rs
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Lifetime-scoped workqueues.
> +//!
> +//! Provides [`ScopedQueue`] for work items that may borrow data with so=
me
> +//! non-`'static` lifetime.
> +//!
> +//! Unlike [`Queue`] which only accepts `'static` work items, [`ScopedQu=
eue`]
> +//! owns its underlying queue and relies on that queue being dropped to =
drain
> +//! pending and running work before borrowed data can go out of scope.
> +//!
> +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-test=
s.
> +//! ```compile_fail,ignore
> +//! use kernel::prelude::*;
> +//! use kernel::workqueue::ScopedQueue;
> +//!
> +//! /// # Safety
> +//! ///
> +//! /// Returned queue must not be leaked.
> +//! unsafe fn new_queue<'bound>(_: &'bound ()) -> Result<ScopedQueue<'bo=
und>> {
> +//!     // SAFETY: Caller guarantees that the returned queue is not leak=
ed.
> +//!     unsafe { ScopedQueue::new(c"scoped_queue") }
> +//! }
> +//!
> +//! fn queue_outlives_borrowed_data() -> Result {
> +//!     let queue;
> +//!
> +//!     {
> +//!         let data =3D ();
> +//!         // SAFETY: Queue is not leaked.
> +//!         queue =3D unsafe { new_queue(&data)? };
> +//!     }
> +//!     // Here the `compile_fail` is fulfilled as `queue` would be drop=
ped
> +//!     // after `data`.
> +//!     Ok(())
> +//! }
> +//! ```
> +//!
> +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-test=
s.
> +//! ```compile_fail,ignore
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//! use kernel::workqueue::{
> +//!     impl_has_work,
> +//!     new_work,
> +//!     ScopedQueue,
> +//!     Work,
> +//!     WorkItem,
> +//! };
> +//!
> +//! #[pin_data]
> +//! struct BorrowedWork<'bound> {
> +//!     data: &'bound (),
> +//!     #[pin]
> +//!     work: Work<BorrowedWork<'bound>>,
> +//! }
> +//!
> +//! impl_has_work! {
> +//!     impl{'bound} HasWork<BorrowedWork<'bound>> for BorrowedWork<'bou=
nd> { self.work }
> +//! }
> +//!
> +//! impl<'bound> WorkItem for BorrowedWork<'bound> {
> +//!     type Pointer =3D Arc<Self>;
> +//!
> +//!     fn run(_this: Arc<Self>) {}
> +//! }
> +//!
> +//! impl<'bound> BorrowedWork<'bound> {
> +//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {
> +//!         Arc::pin_init(
> +//!             pin_init!(Self {
> +//!                 data,
> +//!                 work <- new_work!("BorrowedWork::work"),
> +//!             }),
> +//!             GFP_KERNEL,
> +//!         )
> +//!     }
> +//! }
> +//!
> +//! struct Handle<'bound> {
> +//!     work: Arc<BorrowedWork<'bound>>,
> +//!     wq: ScopedQueue<'bound>,
> +//! }
> +//!
> +//! impl<'bound> Handle<'bound> {
> +//!     /// # Safety
> +//!     ///
> +//!     /// Returned handle must not be leaked.
> +//!     unsafe fn new(data: &'bound ()) -> Result<Self> {
> +//!         Ok(Self {
> +//!             work: BorrowedWork::new(data)?,
> +//!             // SAFETY: Caller guarantees that the returned handle is=
 not leaked.
> +//!             wq: unsafe { ScopedQueue::new(c"handle_wq")? },
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! fn handle_outlives_borrowed_data() -> Result {
> +//!     let handle;
> +//!
> +//!     {
> +//!         let data =3D ();
> +//!         // SAFETY: Handle is not leaked.
> +//!         handle =3D unsafe { Handle::new(&data)? };
> +//!
> +//!         let _ =3D handle.wq.enqueue(handle.work.clone());
> +//!     }
> +//!     // Here the `compile_fail` is fulfilled as `handle` would be dro=
pped
> +//!     // after `data`.
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +use super::{
> +    OwnedQueue,
> +    Queue,
> +    RawWorkItem, //
> +};
> +
> +use crate::{
> +    bindings,
> +    ffi,
> +    prelude::*, //
> +};
> +
> +use core::marker::PhantomData;
> +
> +/// An owned workqueue that can enqueue work items borrowing from `'scop=
e`.
> +///
> +/// A `ScopedQueue` must not outlive data borrowed by its work items.
> +pub struct ScopedQueue<'scope> {
> +    inner: OwnedQueue,
> +    _scope: PhantomData<&'scope mut &'scope ()>,
> +}

A Queue is the same as a ScopedQueue<'static>, so we don't necessarily
need a new type if we add a lifetime to Queue and add two constructors:

	fn new() -> Queue<'static>;
	unsafe fn new_scoped() -> Queue<'a>;

Alice
