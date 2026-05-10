Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80F308F32;
	Sun, 10 May 2026 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778401354; cv=none; b=ayXSROxMY5V4K5vkBGgWnfBvIMNeKnSaR49Lmo9yxMD9biHuygo4lJkE29SWG/WIfW9KylYtnLUnQazFQXpPX/Vn/e629Qpdi48bI2B//XJKjX247epyhqP0THtBS0dw4pTPE5M0QsOyvCglL+hVGveFP4Im33BYObpV7itPi+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778401354; c=relaxed/simple;
	bh=nGirIVelIhIXE1e7YPnZwBAvvc0C0bXr+qBIytWRtjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EbOO2Vk/Y0mTMZ7zEVf2rLpk5xikTkrit3mU8V6193wWHRqd1G+hKBwS4tmUIuJN7IY26D6DIiYmxRKXROh4emfWepyq48a+3ldDIRns8HHXU3Hi1z+dTo1I5G2BpB/NPFKI57oxXla+BvcSIZQAuak/N4+i/cDA1Hft1mxuAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HPLmbQNV; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HPLmbQNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778401341; x=1778660541;
	bh=4563ECOSLs79Fnbpg9CehvZwiLkVFRfmVzuhwlzjHjk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HPLmbQNVduBzl9JWQC9vdAN5TZnvFUddZcb+CO3elpSnPy9IN17s77u7L75rnyx6w
	 MxLByzhhXJ4BLJ8sxfkG4Bg7LiBcznlVuBSDvAHH8hHpaMCbmzyE0fHml5XEcH+muP
	 k5Al9bvzCVlmGK/q4L1jPKVm5YFG6JPZlcgmQ9G8J5eFul6+5EQgSTQZeb24Bqtmq7
	 MSg95C2UkRHmMIwWMhe/ndMpV0b+/FupKqSn6u0ZhsGj2c4K++ZTk7m94lovRmwIjE
	 kwWLfBtkLS9mBVgKnzD1pwoIhZYCwgDHhptzQ1QFRLGUm8xguuaOehtP3qdtCppYd+
	 Ltmdg7fW7okqg==
X-Pm-Submission-Id: 4gCwng3nPbz2SccY
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
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1] rust: workqueue: add cancel_sync support
Date: Sun, 10 May 2026 11:21:57 +0300
Message-ID: <20260510082211.207450-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drivers can use this during teardown to cancel pending work and wait for
running work to finish before dropping related resources.

This is not implemented for Pin<KBox<T>> because queuing a boxed work
item transfers ownership of the box to the workqueue. There is therefore
no separate safe owner that can cancel the boxed work while it is pending.

The immediate motivation is the Tyr reset infrastructure [1], which needs
to cancel pending reset work and wait for any running reset work during
teardown before dropping the resources used by that work.

[1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.dev

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue.rs | 134 ++++++++++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..a10daa2763ac 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -442,23 +442,44 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
 ///
 /// # Safety
 ///
-/// Implementers must ensure that [`__enqueue`] uses a `work_struct` initialized with the [`run`]
-/// method of this trait as the function pointer.
+/// Implementers must ensure that [`__enqueue`] uses a `work_struct` initialized with [`run`] as
+/// its function pointer, and that [`from_raw_work`] rebuilds the exact ownership transferred by
+/// a successful [`__enqueue`] call.
 ///
 /// [`__enqueue`]: RawWorkItem::__enqueue
+/// [`from_raw_work`]: WorkItemPointer::from_raw_work
 /// [`run`]: WorkItemPointer::run
-pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
-    /// Run this work item.
+pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Sized {
+    /// The work item type containing the embedded `work_struct`.
+    type Item: WorkItem<ID, Pointer = Self> + ?Sized;
+
+    /// Rebuild this work item's pointer from its embedded `work_struct`.
     ///
     /// # Safety
     ///
-    /// The provided `work_struct` pointer must originate from a previous call to [`__enqueue`]
-    /// where the `queue_work_on` closure returned true, and the pointer must still be valid.
+    /// The provided `work_struct` pointer must originate from a previous call to
+    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure returned true
+    /// and the pointer must still be valid.
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
+
+    /// Run this work item.
     ///
-    /// [`__enqueue`]: RawWorkItem::__enqueue
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
+    /// # Safety
+    ///
+    /// The provided `work_struct` pointer must satisfy the same requirements as
+    /// [`WorkItemPointer::from_raw_work`].
+    #[inline]
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        <Self::Item as WorkItem<ID>>::run(
+            // SAFETY: The requirements for `run` are exactly those of `from_raw_work`.
+            unsafe { Self::from_raw_work(ptr) },
+        );
+    }
 }
 
+/// Marker for work item types that support cancellation.
+pub trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> {}
+
 /// Defines the method that should be called when this work item is executed.
 ///
 /// This trait is used when the `work_struct` field is defined using the [`Work`] helper.
@@ -523,6 +544,32 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
         })
     }
 
+    /// Cancels this work item if it is pending and waits for any running execution to finish.
+    ///
+    /// On return, the work item is guaranteed to not be pending or executing as long as there are
+    /// no racing re-enqueues.
+    ///
+    /// # Note
+    ///
+    /// Should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn cancel_sync(&self) -> Option<T::Pointer>
+    where
+        T: WorkItem<ID>,
+        T::Pointer: SupportsCancelling<ID>,
+    {
+        let ptr = self.work.get();
+        // SAFETY: `ptr` is a valid embedded `work_struct`.
+        if unsafe { bindings::cancel_work_sync(ptr) } {
+            // SAFETY: A `true` return means the work was pending and got canceled, so the queued
+            // ownership transfer performed by `__enqueue` is reclaimed here.
+            Some(unsafe { T::Pointer::from_raw_work(ptr) })
+        } else {
+            None
+        }
+    }
+
     /// Get a pointer to the inner `work_struct`.
     ///
     /// # Safety
@@ -709,6 +756,34 @@ pub fn new(
         })
     }
 
+    /// Cancels this delayed work item if it is pending and waits for any running execution to
+    /// finish.
+    ///
+    /// On return, the work item is guaranteed to not be pending or executing as long as there are
+    /// no racing re-enqueues.
+    ///
+    /// # Note
+    ///
+    /// Should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn cancel_sync(&self) -> Option<T::Pointer>
+    where
+        T: WorkItem<ID>,
+        T::Pointer: SupportsCancelling<ID>,
+    {
+        let ptr = self.dwork.get();
+
+        // SAFETY: `ptr` is a valid embedded `delayed_work`.
+        if unsafe { bindings::cancel_delayed_work_sync(ptr) } {
+            // SAFETY: A `true` return means the work was pending and got canceled, so the queued
+            // ownership transfer performed by `__enqueue` is reclaimed here.
+            Some(unsafe { T::Pointer::from_raw_work(core::ptr::addr_of_mut!((*ptr).work)) })
+        } else {
+            None
+        }
+    }
+
     /// Get a pointer to the inner `delayed_work`.
     ///
     /// # Safety
@@ -824,25 +899,32 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+    type Item = T;
+
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
         // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
-        let arc = unsafe { Arc::from_raw(ptr) };
-
-        T::run(arc)
+        unsafe { Arc::from_raw(ptr) }
     }
 }
 
+impl<T, const ID: u64> SupportsCancelling<ID> for Arc<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+}
+
 // SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
 // the closure because we get it from an `Arc`, which means that the ref count will be at least 1,
 // and we don't drop the `Arc` ourselves. If `queue_work_on` returns true, it is further guaranteed
 // to be valid until a call to the function pointer in `work_struct` because we leak the memory it
 // points to, and only reclaim it if the closure returns false, or in `WorkItemPointer::run`, which
 // is what the function pointer in the `work_struct` must be pointing to, according to the safety
-// requirements of `WorkItemPointer`.
+// requirements of `WorkItemPointer`, or after a successful cancellation.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Arc<T>
 where
     T: WorkItem<ID, Pointer = Self>,
@@ -887,7 +969,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+    type Item = T;
+
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
         // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
@@ -895,9 +979,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
-        let pinned = unsafe { Pin::new_unchecked(boxed) };
-
-        T::run(pinned)
+        unsafe { Pin::new_unchecked(boxed) }
     }
 }
 
@@ -958,7 +1040,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+    type Item = T;
+
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
 
@@ -972,19 +1056,25 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
 
         // SAFETY: This pointer comes from `ARef::into_raw` and we've been given
         // back ownership.
-        let aref = unsafe { ARef::from_raw(ptr) };
-
-        T::run(aref)
+        unsafe { ARef::from_raw(ptr) }
     }
 }
 
+impl<T, const ID: u64> SupportsCancelling<ID> for ARef<T>
+where
+    T: AlwaysRefCounted,
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+}
+
 // SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
 // the closure because we get it from an `ARef`, which means that the ref count will be at least 1,
 // and we don't drop the `ARef` ourselves. If `queue_work_on` returns true, it is further guaranteed
 // to be valid until a call to the function pointer in `work_struct` because we leak the memory it
 // points to, and only reclaim it if the closure returns false, or in `WorkItemPointer::run`, which
 // is what the function pointer in the `work_struct` must be pointing to, according to the safety
-// requirements of `WorkItemPointer`.
+// requirements of `WorkItemPointer`, or after a successful cancellation.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for ARef<T>
 where
     T: AlwaysRefCounted,
-- 
2.51.2

