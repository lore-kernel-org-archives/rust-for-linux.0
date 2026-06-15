Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0A4028C3
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536701; cv=pass; b=mILz8REDY56L4i9K7PMLraIfcMlNzhv1+WBsNINU8hq2yv5BSMzUWI6df/zTiwedI/u7u0PMIQhE2wIZeDwdTVdFxPduntYKR+FSzco31AvCeCgy8gq2stW4s4IpoUvvp7e82BBe4Qfsu6PoDnY8E5Z+yUN8Nmfz1ApMeyvbt4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536701; c=relaxed/simple;
	bh=+L2q32ym1Ls55gmGU/FbrxabrlkC927ToICUhLw9NUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHdyx6l8C4JuR9WNAQbtugjzanrX0123s1y71ObhHPVeYyf25jtOf4kOCXdv8CZCvE0I/7MDG625T1rWe+VyewO6sGybJY3kbBkfJOPcAUmFCAGqMWOmbghPgILEWaGIvnMDrpWCIy7S280RMJjQj4bu61WUnAd0Gri7VOUptns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XTRe7IF2; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XTRe7IF2"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30807ba471bso9856033eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 08:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781536699; cv=none;
        d=google.com; s=arc-20240605;
        b=C1AbDFcdcRP+ZdORAVTIoNowygCIvLzc+No/I0EjVT97+Oi0wy9DdFqiaHvZZHScTC
         3YOl9483FsAGfvcro5Lh5s/nLHR9emDy5edXLeFFhuzFV8i9Xe2wYg+7BAIY4Rv1s/Tt
         O+5Dm+TFWWrwf4FQc6Ac4slZj1upT45Iv3lbOG0gNX8punq0nxjxU5zJwvEO26ihrexA
         SXf1dmamaMCq/8HX1ntNxzzznXBdrOU7oLoAjln4wBfE28hy1FbdQyyE2/WG2D82rcVu
         mbJ403rv7XL4lecP7cOi7Fip0ECoaV+EYtWXjk7zhLnQ1prqirCEIkQg2/Ec/0p42Y3n
         mJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NRO/elbpz2J1L/9Rw+mfy0s1ugyankpJgu1mEdjQHtQ=;
        fh=oX64NSO9eHDpZloZYHqibThHYv5EJ/Q42HEevl/h4xc=;
        b=L+1s3bohjS/budU3RtzU4pSLO8vZEHTkRVnid8OZktEOiCsoHMJsJI1rAMgu70nf0Z
         bHi0MkqFHrXjtOLR01PJf87YyeTUlyuwLPBvurkkWwqiCuhio4LtYU+CYaYByK96xUDB
         LJTakeGnhRpT7MiOVgONWW90nhoQb/aezbA3t07jPYSmxQb6icPEMdXGRljxYyrC3L9P
         zoZeZwHYoHavhcYCtFQMoAv+0cSrMDDEOrLisYU+tokU96cLg520EbpLwZehJxCcYIVQ
         2ufPRyeDx/F/tfjB/yw9UNrlTAoxHKTelZt5XPx4fTyRy2Wh2P6ee2WW5d9WD1s6mnfF
         rE0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781536699; x=1782141499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRO/elbpz2J1L/9Rw+mfy0s1ugyankpJgu1mEdjQHtQ=;
        b=XTRe7IF2WiopdF3UpdtOKGb30mW5vN83eeE4Uf5FlMjLNkfWJaL0ohENqhCkFahYFS
         RPcUVfhlLFxwzMQBP5+xnoo1F85W1MoF4KmhrRpncFHjG/Sx/WAGYGvNNe/AlCbM67LM
         3017uNTSXteSD+agWRt8PpdA2t61RWeVohk2vEtYoagcK6snCXeq1vsN1yNxyKV51ylJ
         4jiyicJzHb1F/bezNwbsYeURFF7fknZXHwGqpY93QPM4XK5jU2G7DENCkRYIdnayzxz5
         ajHn7pIrYm/0Nnacgtk3eqbdslg/KABZXoh901xguJRkAZwDNrj328t/kQKSYSy740ft
         pq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536699; x=1782141499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRO/elbpz2J1L/9Rw+mfy0s1ugyankpJgu1mEdjQHtQ=;
        b=ZTZRT359Dn817LV5gCgt79TfZS+oyYnh2jif8oYJtkp0mOFN/0hh61t1b4hEWElWiP
         PZapBYjRrpVBhb/WpQYfnFiSYffRdIsuwkQ05FJoY/FV+am8yef8QXWV0D7HTrG3jtB/
         R3mo3mheyBWzQb8UZVDdRBGEIBI7jlOKANF0N/qRIfbOF4AGzUsykEbeoUMc6drGannG
         HLWDQYdNAfz/HZtIAC8bwnRVUKr/aRRsKbYwWiR+5ncmhL+Wb488iuGrB4wPFKA6EqTb
         FyHrBSgHl1k8GGZbvoMQQSmEApHRdIf+jx4Kd4lvmSfMZLPHpI55jgC547BtcXoXA8ri
         Jj4A==
X-Forwarded-Encrypted: i=1; AFNElJ8/Jt4eZMcGkKbijN8+44AcuP3A37LJd5Zh3g6BobONGDNCk5kNGZdULiJk7JPtsa92jjWa4S8KxXX6T10QFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNeOx361gacscUvkGzYHQY+zVZlTfNvWQdbF2PBOjANHN766NF
	WrSYk6Z82IExZB7tJ+tdgUgdktg0aN6y9CjjOdBZ01b9F1MXKC9+yKKUbOFBz31FrTS/C83kt8w
	7RL+YOEeQRfHj7rVyZA0j71CMn1C1bD+RX4Nc3QKi
X-Gm-Gg: Acq92OEvV9asepq00UBAJS2hS/kDvkwC8zudnIp3ZTgQQ1OWWzt2Z+ecEXpH2xbovhS
	QR9GyEpzhVETo9y313FLnHJ5A4njOTKCbrOJvk+5opZXvImDRV5DzCtNs97WXvm1seOuK67j684
	AGqhwcL8LcKxdcXtfWKIrrCPxXHzalyCndExeQOam5pJK7O4+v32u3uobic4JYgy8Xhml56/Xl2
	45g68r2TDi7q5j7nhKz4MLF7otjjAIxL81zq0mbykPr/sqYQywKSBID9++UKIcyLTSrrpza/vPf
	vR1jDK/0gThSWIw0f/cr3tnw54c76nRa01JrOA==
X-Received: by 2002:a05:7300:a10b:b0:2e7:c701:aa85 with SMTP id
 5a478bee46e88-30820054ddamr9157737eec.17.1781536697992; Mon, 15 Jun 2026
 08:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115626.871457-1-work@onurozkan.dev>
In-Reply-To: <20260615115626.871457-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 15 Jun 2026 17:18:02 +0200
X-Gm-Features: AVVi8Cco0IuKNDFpDgUYW6-kVGMio00siQ76PkEGRtNa5GyCfiWxsIgM7ch1Tmo
Message-ID: <CAH5fLggQDAQ02YLibAO=NpQF8xxj_0GCEz5+cVZh8LmYo+xXvw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: workqueue: add ScopedQueue for lifetime bound items
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	tj@kernel.org, jiangshanlai@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 1:56=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Add a workqueue wrapper for work items that are not 'static.
>
> Tyr reset work is queued from a handle that owns a Controller<'bound>
> where the work item holds references tied to the lifetime of the bound
> device and its mapped IO state. The existing API only accepts 'static
> work items which cannot express that relationship.
>
> Introduce ScopedQueue for this case. It owns the underlying workqueue
> and ties enqueued work to the queue lifetime so borrowed state cannot
> outlive the queue that may still run it.
>
> Construction is unsafe because the queue must not be leaked.
>
> `compile_fail` doc-tests are ignored for now as KUnit doesn't support
> that. Enabling those tests as regular code block would raise this error:
>
>     ERROR:root:error[E0597]: `data` does not live long enough
>          --> rust/doctests_kernel_generated.rs:22029:44
>           |
>     22027 |         let data =3D ();
>           |             ---- binding `data` declared here
>     22028 |         // SAFETY: Queue is not leaked.
>     22029 |         queue =3D unsafe { new_queue_with_lt(&data)? };
>           |                                            ^^^^^ borrowed val=
ue does not live long enough
>     22030 |     }
>           |     - `data` dropped here while still borrowed
>     ...
>     22034 | }
>           | - borrow might be used here, when `queue` is dropped and runs=
 the `Drop` code for type `ScopedQueue`
>           |
>           =3D note: values in a scope are dropped in the opposite order t=
hey are defined
>
> which is exactly the constraint ScopedQueue is meant to enforce.
>
> This series is based on Alice's "Creation of workqueues in Rust" [1]
> series.
>
> Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351=
c38f@google.com [1]
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/workqueue/mod.rs          |   3 +
>  rust/kernel/workqueue/scoped_queue.rs | 179 ++++++++++++++++++++++++++
>  2 files changed, 182 insertions(+)
>  create mode 100644 rust/kernel/workqueue/scoped_queue.rs
>
> diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
> index e30c21214a81..5e2baa84c143 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -212,6 +212,9 @@
>  mod builder;
>  pub use self::builder::Builder;
>
> +mod scoped_queue;
> +pub use self::scoped_queue::ScopedQueue;
> +
>  /// Creates a [`Work`] initialiser with the given name and a newly-creat=
ed lock class.
>  #[macro_export]
>  macro_rules! new_work {
> diff --git a/rust/kernel/workqueue/scoped_queue.rs b/rust/kernel/workqueu=
e/scoped_queue.rs
> new file mode 100644
> index 000000000000..e0457b521a19
> --- /dev/null
> +++ b/rust/kernel/workqueue/scoped_queue.rs
> @@ -0,0 +1,179 @@
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
> +//! unsafe fn new_queue_with_lt<'bound>(_: &'bound ()) -> Result<ScopedQ=
ueue<'bound>> {
> +//!     // SAFETY: Caller guarantees that the returned queue is not leak=
ed.
> +//!     unsafe { ScopedQueue::new_ordered_with_lt(c"scoped_queue") }
> +//! }
> +//!
> +//! fn queue_outlives_borrowed_data() -> Result {
> +//!     let queue;
> +//!
> +//!     {
> +//!         let data =3D ();
> +//!         // SAFETY: Queue is not leaked.
> +//!         queue =3D unsafe { new_queue_with_lt(&data)? };
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
> +//!     unsafe fn new_with_lt(data: &'bound ()) -> Result<Self> {
> +//!         Ok(Self {
> +//!             work: BorrowedWork::new(data)?,
> +//!             // SAFETY: Caller guarantees that the returned handle is=
 not leaked.
> +//!             wq: unsafe { ScopedQueue::new_ordered_with_lt(c"handle_w=
q")? },
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
> +//!         handle =3D unsafe { Handle::new_with_lt(&data)? };
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

I think this can be contra-variant:

_scope: PhantomData<fn(&'scope ())>,

Alice
