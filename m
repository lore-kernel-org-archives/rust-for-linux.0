Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A343101A6
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707628; cv=none; b=cxbK2kcEbIqi7iJm1oDJoGEJob8yKPLp7SOG/gbiSrF9hOl1PKZF7kNnmm/mdnR9MoZ311IPrlbW3XkZ9Z7noS5rbGjh1Li7/56V6obY8UfGflyKiSCjrOMAJd83pF34/X0s+wdZhtGPe7Fo05ZFFB96jAyTk9wOla2AefovKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707628; c=relaxed/simple;
	bh=AIOF1XTJNUiU0ND7JuxPp8kYSZdIAtXGqy23PQ8ZToU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chhUNxBBKJ1CH14CQAkxYqRGYY2oz2Qn1Y1octXQiLRgj71Zb2ddPE5VpVA3ZOS11fJTf/OE443COMFIy6Zk1GeP6RDZZ9Mz8vl4tSumKqBctU4iBbrCVslZrhkLlcXjzrxdt0gNuORqfUyYfpSFRYjXSnf7MP3XE8NSAjmlcLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fN4PhD4o; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fN4PhD4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781707618; x=1781966818;
	bh=QpyGIfLTfesb0ihoF5DEL8tx4iqGHnCHojIjKNtaPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fN4PhD4o01Cyx13JkOhvY2tlpuQme4ST0gUydbX0j6oxbrua1nGbJ2qThO2gYv5f2
	 EE/H9o1hwWgvQipYaqklM3DHIaQAxU7Z7n/rF6+QmDTEDtYsFmAXQoZg/8yIqX48KD
	 PARInfr2N2nv/ZKCXmdxyJDBibpEoVlN7AsGMB9yo7G23r2HqIg7bwu91QyNqDV9KR
	 /95HRt0fq9R5nXaoUwbkL04szdVfI4XuinV0SfOzqOqOhjnv63ha2I2EpD9BJHx/bT
	 nXQhGGrl/6IUJxy6U0sDXz9BzkxvSUxH7Y0bb8vqxNkQ9+yUQkoiPAzwGJEgBo9Jyr
	 6iKI00ROp7sPw==
X-Pm-Submission-Id: 4ggRWw3MqSz2Scmn
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 1/1] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Wed, 17 Jun 2026 17:45:55 +0300
Message-ID: <20260617144645.253444-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260617144645.253444-1-work@onurozkan.dev>
References: <20260617144645.253444-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a workqueue wrapper for work items that are not 'static.

Tyr reset work is queued from a handle that owns a Controller<'bound>
where the work item holds references tied to the lifetime of the bound
device and its mapped IO state. The existing API only accepts 'static
work items which cannot express that relationship.

Introduce ScopedQueue for this case. It owns the underlying workqueue
and ties enqueued work to the queue lifetime so borrowed state cannot
outlive the queue that may still run it.

Construction is unsafe because the queue must not be leaked.

`compile_fail` doc-tests are ignored for now as KUnit doesn't support
that. Enabling those tests as regular code block would raise this error:

    ERROR:root:error[E0597]: `data` does not live long enough
	 --> rust/doctests_kernel_generated.rs:22029:44
	  |
    22027 |         let data = ();
	  |             ---- binding `data` declared here
    22028 |         // SAFETY: Queue is not leaked.
    22029 |         queue = unsafe { new_queue(&data)? };
	  |                                            ^^^^^ borrowed value does not live long enough
    22030 |     }
	  |     - `data` dropped here while still borrowed
    ...
    22034 | }
	  | - borrow might be used here, when `queue` is dropped and runs the `Drop` code for type `ScopedQueue`
	  |
	  = note: values in a scope are dropped in the opposite order they are defined

which is exactly the constraint ScopedQueue is meant to enforce.

This series is based on Alice's "Creation of workqueues in Rust" [1]
series.

Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com [1]
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue/mod.rs          |   3 +
 rust/kernel/workqueue/scoped_queue.rs | 187 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 rust/kernel/workqueue/scoped_queue.rs

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index e30c21214a81..5e2baa84c143 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -212,6 +212,9 @@
 mod builder;
 pub use self::builder::Builder;
 
+mod scoped_queue;
+pub use self::scoped_queue::ScopedQueue;
+
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
 macro_rules! new_work {
diff --git a/rust/kernel/workqueue/scoped_queue.rs b/rust/kernel/workqueue/scoped_queue.rs
new file mode 100644
index 000000000000..d4b9a03fd93c
--- /dev/null
+++ b/rust/kernel/workqueue/scoped_queue.rs
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Lifetime-scoped workqueues.
+//!
+//! Provides [`ScopedQueue`] for work items that may borrow data with some
+//! non-`'static` lifetime.
+//!
+//! Unlike [`Queue`] which only accepts `'static` work items, [`ScopedQueue`]
+//! owns its underlying queue and relies on that queue being dropped to drain
+//! pending and running work before borrowed data can go out of scope.
+//!
+//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-tests.
+//! ```compile_fail,ignore
+//! use kernel::prelude::*;
+//! use kernel::workqueue::ScopedQueue;
+//!
+//! /// # Safety
+//! ///
+//! /// Returned queue must not be leaked.
+//! unsafe fn new_queue<'bound>(_: &'bound ()) -> Result<ScopedQueue<'bound>> {
+//!     // SAFETY: Caller guarantees that the returned queue is not leaked.
+//!     unsafe { ScopedQueue::new(c"scoped_queue") }
+//! }
+//!
+//! fn queue_outlives_borrowed_data() -> Result {
+//!     let queue;
+//!
+//!     {
+//!         let data = ();
+//!         // SAFETY: Queue is not leaked.
+//!         queue = unsafe { new_queue(&data)? };
+//!     }
+//!     // Here the `compile_fail` is fulfilled as `queue` would be dropped
+//!     // after `data`.
+//!     Ok(())
+//! }
+//! ```
+//!
+//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-tests.
+//! ```compile_fail,ignore
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//! use kernel::workqueue::{
+//!     impl_has_work,
+//!     new_work,
+//!     ScopedQueue,
+//!     Work,
+//!     WorkItem,
+//! };
+//!
+//! #[pin_data]
+//! struct BorrowedWork<'bound> {
+//!     data: &'bound (),
+//!     #[pin]
+//!     work: Work<BorrowedWork<'bound>>,
+//! }
+//!
+//! impl_has_work! {
+//!     impl{'bound} HasWork<BorrowedWork<'bound>> for BorrowedWork<'bound> { self.work }
+//! }
+//!
+//! impl<'bound> WorkItem for BorrowedWork<'bound> {
+//!     type Pointer = Arc<Self>;
+//!
+//!     fn run(_this: Arc<Self>) {}
+//! }
+//!
+//! impl<'bound> BorrowedWork<'bound> {
+//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {
+//!         Arc::pin_init(
+//!             pin_init!(Self {
+//!                 data,
+//!                 work <- new_work!("BorrowedWork::work"),
+//!             }),
+//!             GFP_KERNEL,
+//!         )
+//!     }
+//! }
+//!
+//! struct Handle<'bound> {
+//!     work: Arc<BorrowedWork<'bound>>,
+//!     wq: ScopedQueue<'bound>,
+//! }
+//!
+//! impl<'bound> Handle<'bound> {
+//!     /// # Safety
+//!     ///
+//!     /// Returned handle must not be leaked.
+//!     unsafe fn new(data: &'bound ()) -> Result<Self> {
+//!         Ok(Self {
+//!             work: BorrowedWork::new(data)?,
+//!             // SAFETY: Caller guarantees that the returned handle is not leaked.
+//!             wq: unsafe { ScopedQueue::new(c"handle_wq")? },
+//!         })
+//!     }
+//! }
+//!
+//! fn handle_outlives_borrowed_data() -> Result {
+//!     let handle;
+//!
+//!     {
+//!         let data = ();
+//!         // SAFETY: Handle is not leaked.
+//!         handle = unsafe { Handle::new(&data)? };
+//!
+//!         let _ = handle.wq.enqueue(handle.work.clone());
+//!     }
+//!     // Here the `compile_fail` is fulfilled as `handle` would be dropped
+//!     // after `data`.
+//!     Ok(())
+//! }
+//! ```
+
+use super::{
+    OwnedQueue,
+    Queue,
+    RawWorkItem, //
+};
+
+use crate::{
+    bindings,
+    ffi,
+    prelude::*, //
+};
+
+use core::marker::PhantomData;
+
+/// An owned workqueue that can enqueue work items borrowing from `'scope`.
+///
+/// A `ScopedQueue` must not outlive data borrowed by its work items.
+pub struct ScopedQueue<'scope> {
+    inner: OwnedQueue,
+    _scope: PhantomData<&'scope mut &'scope ()>,
+}
+
+impl<'scope> ScopedQueue<'scope> {
+    /// Creates an ordered scoped workqueue.
+    ///
+    /// # Safety
+    ///
+    /// The caller must not leak the returned queue or otherwise prevent its
+    /// [`Drop`] implementation from running since dropping the queue drains
+    /// pending and running work that may borrow from `'scope`.
+    pub unsafe fn new(name: &'static CStr) -> Result<Self> {
+        Ok(Self {
+            inner: Queue::new_ordered().build(name)?,
+            _scope: PhantomData,
+        })
+    }
+
+    /// Enqueues a work item on this scoped queue.
+    pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send + 'scope,
+    {
+        let queue_ptr = self.inner.0.get();
+
+        // SAFETY:
+        // - Closure returns `false` only if `queue_work_on` returns `false`
+        //   and that means `work_ptr` is already in a workqueue.
+        //
+        // - `W: 'scope` and dropck keep borrowed data alive until this queue is
+        //   dropped. The constructor requires that the queue is not leaked and
+        //   dropping `inner` drains pending and running work so the function
+        //   pointer is not called after any lifetime in `W` expires.
+        //
+        // - The last requirement of `__enqueue` is not relevant here because `W`
+        //   is `Send`.
+        unsafe {
+            work.__enqueue(move |work_ptr| {
+                bindings::queue_work_on(
+                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
+                    queue_ptr,
+                    work_ptr,
+                )
+            })
+        }
+    }
+}
+
+impl Drop for ScopedQueue<'_> {
+    fn drop(&mut self) {
+        // This impl makes dropck require `'scope` to outlive `OwnedQueue`.
+        // See: https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking
+        let _ = &self._scope;
+    }
+}
-- 
2.51.2

