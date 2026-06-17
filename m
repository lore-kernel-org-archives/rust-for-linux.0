Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2627A92D;
	Wed, 17 Jun 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700563; cv=none; b=gSPTJVwuR3mUvNwqajFy9pNrrW0ViHWD1kUNyB+L7Va9jc76CXVXTOoEf0jM7gJvtLCQsaoDwFSUN83DA1DcCZKUU5J+XGtwYSXuCU85/n44efrg7h/8uWwjHuGoBNQbSxf8peZMHSceljgKEVPAL/2wmmYlNXa02rIBXnDm0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700563; c=relaxed/simple;
	bh=WdqaRXxBTq+x4/+eQnowAM4kavcQPuh40r/TSehx4G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvkFq06egZm5aWLJhQXdxloc6J+gTaC4pIdw9+oAox0b0EOfi71/Er/6JdZ8CeKNgDS8ZGxBZXnzMj9oScLiSUpcLn0U1/38cOlgmTazgn3Hai5oWKjRkSfOSU2pwigehqH9/Ps5HRfCTBikDk5HQCex30sm+lspq6FK7VVKKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hhJguvz9; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hhJguvz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781700557; x=1781959757;
	bh=LXbB1E5SgFEQsFOW/YQ+VPucXKNc2DeikSXXpDCPX1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hhJguvz9r2BtYo9QiEk8KJ5r8xhySueHYG69qxlSfjH5ln3IXFYxZXnLMfz1O7vC6
	 sCbD6vIEhdjnkOg9oAlVHzxNN6uNAUV6b813zdXbQBXAQu/drm3eTKkv9H4/eynQ88
	 fGKUDkHDPfSvJzU+qFfQPYYzlDISupqWNHi4T2qhjMUUrYKKn27rYzgWzG1IrcWPQ8
	 5Qnyns13oihnFXpq8jWZPcPrlRvGRTXQd2wj/1jkVmwXXMHdJVoi1c8f+i0c8VwNil
	 77GlYdJznA2vtPgrSMLuuZLLTfo0dMT+vMIpsHouDbExBmNhYs8n0xGg5cDre2ZMRx
	 Ry4+s4P+FwWLA==
X-Pm-Submission-Id: 4ggNw94HbDz2ScD0
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	tj@kernel.org,
	jiangshanlai@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org
Subject: Re: [PATCH v1] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Wed, 17 Jun 2026 15:49:03 +0300
Message-ID: <20260617124911.90218-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CAH5fLggQDAQ02YLibAO=NpQF8xxj_0GCEz5+cVZh8LmYo+xXvw@mail.gmail.com>
References: <20260615115626.871457-1-work@onurozkan.dev> <CAH5fLggQDAQ02YLibAO=NpQF8xxj_0GCEz5+cVZh8LmYo+xXvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jun 2026 17:18:02 +0200=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Mon, Jun 15, 2026 at 1:56=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:=0D
> >=0D
> > Add a workqueue wrapper for work items that are not 'static.=0D
> >=0D
> > Tyr reset work is queued from a handle that owns a Controller<'bound>=0D
> > where the work item holds references tied to the lifetime of the bound=
=0D
> > device and its mapped IO state. The existing API only accepts 'static=0D
> > work items which cannot express that relationship.=0D
> >=0D
> > Introduce ScopedQueue for this case. It owns the underlying workqueue=0D
> > and ties enqueued work to the queue lifetime so borrowed state cannot=0D
> > outlive the queue that may still run it.=0D
> >=0D
> > Construction is unsafe because the queue must not be leaked.=0D
> >=0D
> > `compile_fail` doc-tests are ignored for now as KUnit doesn't support=0D
> > that. Enabling those tests as regular code block would raise this error=
:=0D
> >=0D
> >     ERROR:root:error[E0597]: `data` does not live long enough=0D
> >          --> rust/doctests_kernel_generated.rs:22029:44=0D
> >           |=0D
> >     22027 |         let data =3D ();=0D
> >           |             ---- binding `data` declared here=0D
> >     22028 |         // SAFETY: Queue is not leaked.=0D
> >     22029 |         queue =3D unsafe { new_queue_with_lt(&data)? };=0D
> >           |                                            ^^^^^ borrowed v=
alue does not live long enough=0D
> >     22030 |     }=0D
> >           |     - `data` dropped here while still borrowed=0D
> >     ...=0D
> >     22034 | }=0D
> >           | - borrow might be used here, when `queue` is dropped and ru=
ns the `Drop` code for type `ScopedQueue`=0D
> >           |=0D
> >           =3D note: values in a scope are dropped in the opposite order=
 they are defined=0D
> >=0D
> > which is exactly the constraint ScopedQueue is meant to enforce.=0D
> >=0D
> > This series is based on Alice's "Creation of workqueues in Rust" [1]=0D
> > series.=0D
> >=0D
> > Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c3=
51c38f@google.com [1]=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/workqueue/mod.rs          |   3 +=0D
> >  rust/kernel/workqueue/scoped_queue.rs | 179 ++++++++++++++++++++++++++=
=0D
> >  2 files changed, 182 insertions(+)=0D
> >  create mode 100644 rust/kernel/workqueue/scoped_queue.rs=0D
> >=0D
> > diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.r=
s=0D
> > index e30c21214a81..5e2baa84c143 100644=0D
> > --- a/rust/kernel/workqueue/mod.rs=0D
> > +++ b/rust/kernel/workqueue/mod.rs=0D
> > @@ -212,6 +212,9 @@=0D
> >  mod builder;=0D
> >  pub use self::builder::Builder;=0D
> >=0D
> > +mod scoped_queue;=0D
> > +pub use self::scoped_queue::ScopedQueue;=0D
> > +=0D
> >  /// Creates a [`Work`] initialiser with the given name and a newly-cre=
ated lock class.=0D
> >  #[macro_export]=0D
> >  macro_rules! new_work {=0D
> > diff --git a/rust/kernel/workqueue/scoped_queue.rs b/rust/kernel/workqu=
eue/scoped_queue.rs=0D
> > new file mode 100644=0D
> > index 000000000000..e0457b521a19=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/workqueue/scoped_queue.rs=0D
> > @@ -0,0 +1,179 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Lifetime-scoped workqueues.=0D
> > +//!=0D
> > +//! Provides [`ScopedQueue`] for work items that may borrow data with =
some=0D
> > +//! non-`'static` lifetime.=0D
> > +//!=0D
> > +//! Unlike [`Queue`] which only accepts `'static` work items, [`Scoped=
Queue`]=0D
> > +//! owns its underlying queue and relies on that queue being dropped t=
o drain=0D
> > +//! pending and running work before borrowed data can go out of scope.=
=0D
> > +//!=0D
> > +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-te=
sts.=0D
> > +//! ```compile_fail,ignore=0D
> > +//! use kernel::prelude::*;=0D
> > +//! use kernel::workqueue::ScopedQueue;=0D
> > +//!=0D
> > +//! /// # Safety=0D
> > +//! ///=0D
> > +//! /// Returned queue must not be leaked.=0D
> > +//! unsafe fn new_queue_with_lt<'bound>(_: &'bound ()) -> Result<Scope=
dQueue<'bound>> {=0D
> > +//!     // SAFETY: Caller guarantees that the returned queue is not le=
aked.=0D
> > +//!     unsafe { ScopedQueue::new_ordered_with_lt(c"scoped_queue") }=0D
> > +//! }=0D
> > +//!=0D
> > +//! fn queue_outlives_borrowed_data() -> Result {=0D
> > +//!     let queue;=0D
> > +//!=0D
> > +//!     {=0D
> > +//!         let data =3D ();=0D
> > +//!         // SAFETY: Queue is not leaked.=0D
> > +//!         queue =3D unsafe { new_queue_with_lt(&data)? };=0D
> > +//!     }=0D
> > +//!     // Here the `compile_fail` is fulfilled as `queue` would be dr=
opped=0D
> > +//!     // after `data`.=0D
> > +//!     Ok(())=0D
> > +//! }=0D
> > +//! ```=0D
> > +//!=0D
> > +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-te=
sts.=0D
> > +//! ```compile_fail,ignore=0D
> > +//! use kernel::prelude::*;=0D
> > +//! use kernel::sync::Arc;=0D
> > +//! use kernel::workqueue::{=0D
> > +//!     impl_has_work,=0D
> > +//!     new_work,=0D
> > +//!     ScopedQueue,=0D
> > +//!     Work,=0D
> > +//!     WorkItem,=0D
> > +//! };=0D
> > +//!=0D
> > +//! #[pin_data]=0D
> > +//! struct BorrowedWork<'bound> {=0D
> > +//!     data: &'bound (),=0D
> > +//!     #[pin]=0D
> > +//!     work: Work<BorrowedWork<'bound>>,=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl_has_work! {=0D
> > +//!     impl{'bound} HasWork<BorrowedWork<'bound>> for BorrowedWork<'b=
ound> { self.work }=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> WorkItem for BorrowedWork<'bound> {=0D
> > +//!     type Pointer =3D Arc<Self>;=0D
> > +//!=0D
> > +//!     fn run(_this: Arc<Self>) {}=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> BorrowedWork<'bound> {=0D
> > +//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {=0D
> > +//!         Arc::pin_init(=0D
> > +//!             pin_init!(Self {=0D
> > +//!                 data,=0D
> > +//!                 work <- new_work!("BorrowedWork::work"),=0D
> > +//!             }),=0D
> > +//!             GFP_KERNEL,=0D
> > +//!         )=0D
> > +//!     }=0D
> > +//! }=0D
> > +//!=0D
> > +//! struct Handle<'bound> {=0D
> > +//!     work: Arc<BorrowedWork<'bound>>,=0D
> > +//!     wq: ScopedQueue<'bound>,=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> Handle<'bound> {=0D
> > +//!     /// # Safety=0D
> > +//!     ///=0D
> > +//!     /// Returned handle must not be leaked.=0D
> > +//!     unsafe fn new_with_lt(data: &'bound ()) -> Result<Self> {=0D
> > +//!         Ok(Self {=0D
> > +//!             work: BorrowedWork::new(data)?,=0D
> > +//!             // SAFETY: Caller guarantees that the returned handle =
is not leaked.=0D
> > +//!             wq: unsafe { ScopedQueue::new_ordered_with_lt(c"handle=
_wq")? },=0D
> > +//!         })=0D
> > +//!     }=0D
> > +//! }=0D
> > +//!=0D
> > +//! fn handle_outlives_borrowed_data() -> Result {=0D
> > +//!     let handle;=0D
> > +//!=0D
> > +//!     {=0D
> > +//!         let data =3D ();=0D
> > +//!         // SAFETY: Handle is not leaked.=0D
> > +//!         handle =3D unsafe { Handle::new_with_lt(&data)? };=0D
> > +//!=0D
> > +//!         let _ =3D handle.wq.enqueue(handle.work.clone());=0D
> > +//!     }=0D
> > +//!     // Here the `compile_fail` is fulfilled as `handle` would be d=
ropped=0D
> > +//!     // after `data`.=0D
> > +//!     Ok(())=0D
> > +//! }=0D
> > +//! ```=0D
> > +=0D
> > +use super::{=0D
> > +    OwnedQueue,=0D
> > +    Queue,=0D
> > +    RawWorkItem, //=0D
> > +};=0D
> > +=0D
> > +use crate::{=0D
> > +    bindings,=0D
> > +    ffi,=0D
> > +    prelude::*, //=0D
> > +};=0D
> > +=0D
> > +use core::marker::PhantomData;=0D
> > +=0D
> > +/// An owned workqueue that can enqueue work items borrowing from `'sc=
ope`.=0D
> > +///=0D
> > +/// A `ScopedQueue` must not outlive data borrowed by its work items.=
=0D
> > +pub struct ScopedQueue<'scope> {=0D
> > +    inner: OwnedQueue,=0D
> > +    _scope: PhantomData<&'scope mut &'scope ()>,=0D
> =0D
> I think this can be contra-variant:=0D
> =0D
> _scope: PhantomData<fn(&'scope ())>,=0D
=0D
With that, lifetime of the queue is not restricted enough i.e. can live lon=
ger=0D
than expected.=0D
=0D
For instance, module doc-test should fail to compile when removing=0D
`compile_fail,ignore` but it doesn't with your suggestion.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Alice=0D
