Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F533FADF5;
	Tue, 28 Apr 2026 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373111; cv=none; b=HWZpnSAoLdyXKUKP+P7l4Gjhpcmoe1Lt5U0XPxmUW3t748Oti0Wo4GWZq63hqtt4/Jkd9SvEIbtdy43YFxd3SX5nyxtnq1oSwrwo78dsFJE3wCLiik3tuaw6fvBma0fQkPKbYnywXsRIu6igp1uIiIuBuYz2efzJld47UXBnOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373111; c=relaxed/simple;
	bh=zNdwomQCB0U/I75DdIELyiCEUqKZl6q8cM3w4iasPWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CF4UnKp4VTxn7hqcFAreJ1Ws/+4dwJeBIKwGL7lrd9ActjCF18N5iGVIgboB6aHa2UEFQ317sp6v2oIACaMIqTW9aypxdsc3P8LlsqYjBYnLIny5Cdl3S1U1cpIvO0Ger3ib/5EP46dhS9/78B2C+wUcCOSxEA/IymIVuaWlhKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hwJpSDBK; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hwJpSDBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777373107; x=1777632307;
	bh=KC2DR9QwtugfH/paFU7Cs1L87mhFareHELPa9+uuWR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hwJpSDBK5OAkdy2od0GEivtu9gpHKklFoiSz6vGeNcvlYx1PBm9UgP1D3WmW90RlA
	 DjMXoIyT3Vo59fZYwuV4Py+udHRDRcsxU9/c7O7BEPdqgVNEwnzsRYB7ci43jyldj4
	 4TCxxDTRRd6SAIVyp5ZSoXV2lPPPnnXX+3TOCFoWm/Gb+nyoqxXOaUv++KvJKY9Kdc
	 BGz2EC4Qi8vGPdOlEMpYmY1EEJZEwfOwpsfbfe3ox688iVxpvBCA8zfok8Ah+iTUlM
	 cGDLUgviLtc/6Rbb20ouFENr8K0/pMbraKt4ptc4JpS4RDRu+BB+tEj1y792RWoVg2
	 nVU7Ojnzq8eWg==
X-Pm-Submission-Id: 4g4cX12z8Wz1DDXd
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
Subject: [PATCH v1 1/1] rust: add Work::disable_sync
Date: Tue, 28 Apr 2026 13:44:59 +0300
Message-ID: <20260428104459.174602-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260428104459.174602-1-work@onurozkan.dev>
References: <20260428104459.174602-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds Work::disable_sync() as a safe wrapper for disable_work_sync().

Drivers can use this during teardown to stop new queueing and wait for
queued or running work to finish before dropping related resources.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue.rs | 102 +++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..443fc84dbeeb 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -442,21 +442,48 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
 ///
 /// # Safety
 ///
-/// Implementers must ensure that [`__enqueue`] uses a `work_struct` initialized with the [`run`]
-/// method of this trait as the function pointer.
-///
-/// [`__enqueue`]: RawWorkItem::__enqueue
-/// [`run`]: WorkItemPointer::run
-pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
+/// Implementers must ensure that [`WorkItemPointer::from_raw_work`] rebuilds the exact ownership
+/// transferred by a successful [`RawWorkItem::__enqueue`] call.
+pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Sized {
+    /// The work item type containing the embedded `work_struct`.
+    type Item: WorkItem<ID, Pointer = Self> + ?Sized;
+
+    /// Rebuild this work item's pointer from its embedded `work_struct`.
+    ///
+    /// # Safety
+    ///
+    /// The provided `work_struct` pointer must originate from a previous call to
+    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure returned true
+    /// and the pointer must still be valid.
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
+
     /// Run this work item.
     ///
     /// # Safety
     ///
-    /// The provided `work_struct` pointer must originate from a previous call to [`__enqueue`]
-    /// where the `queue_work_on` closure returned true, and the pointer must still be valid.
+    /// The provided `work_struct` pointer must satisfy the same requirements as
+    /// [`WorkItemPointer::from_raw_work`].
+    #[inline]
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        <Self::Item as WorkItem<ID>>::run(
+            // SAFETY: The requirements for `run` are exactly those of `from_raw_work`.
+            unsafe { Self::from_raw_work(ptr) },
+        );
+    }
+
+    /// Reclaim a previously enqueued work item that will no longer run.
+    ///
+    /// # Safety
     ///
-    /// [`__enqueue`]: RawWorkItem::__enqueue
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
+    /// The provided `work_struct` pointer must satisfy the same requirements as
+    /// [`WorkItemPointer::from_raw_work`].
+    #[inline]
+    unsafe fn cancel(ptr: *mut bindings::work_struct) {
+        drop(
+            // SAFETY: The requirements for `cancel` are exactly those of `from_raw_work`.
+            unsafe { Self::from_raw_work(ptr) },
+        );
+    }
 }
 
 /// Defines the method that should be called when this work item is executed.
@@ -537,6 +564,29 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Disables this work item and waits for queued/running executions to finish.
+    ///
+    /// # Note
+    ///
+    /// Should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn disable_sync(&self)
+    where
+        T: WorkItem<ID>,
+    {
+        let ptr: *const Self = self;
+        // SAFETY: `self` points to a valid initialized work.
+        let raw_work = unsafe { Self::raw_get(ptr) };
+        // SAFETY: `raw_work` is a valid embedded `work_struct`.
+        if unsafe { bindings::disable_work_sync(raw_work) } {
+            // SAFETY: A `true` return means the work was pending and got canceled, so the queued
+            // ownership transfer performed by `__enqueue` must be reclaimed here and the work
+            // item will not subsequently run.
+            unsafe { T::Pointer::cancel(raw_work) };
+        }
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
@@ -817,22 +867,22 @@ unsafe fn work_container_of(
 //   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
 //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field
 //     will be used because of the ID const generic bound. This makes sure that `T::raw_get_work`
-//     uses the correct offset for the `Work` field, and `Work::new` picks the correct
-//     implementation of `WorkItemPointer` for `Arc<T>`.
+//     uses the correct offset for the `Work` field, and `T::Pointer::from_raw_work` rebuilds the
+//     correct pointer type for `Arc<T>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
 where
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
 
@@ -887,7 +937,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
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
@@ -895,9 +947,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
-        let pinned = unsafe { Pin::new_unchecked(boxed) };
-
-        T::run(pinned)
+        unsafe { Pin::new_unchecked(boxed) }
     }
 }
 
@@ -950,15 +1000,17 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
 //   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
 //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field
 //     will be used because of the ID const generic bound. This makes sure that `T::raw_get_work`
-//     uses the correct offset for the `Work` field, and `Work::new` picks the correct
-//     implementation of `WorkItemPointer` for `ARef<T>`.
+//     uses the correct offset for the `Work` field, and `T::Pointer::from_raw_work` rebuilds the
+//     correct pointer type for `ARef<T>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
 where
     T: AlwaysRefCounted,
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+    type Item = T;
+
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
 
@@ -972,9 +1024,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
 
         // SAFETY: This pointer comes from `ARef::into_raw` and we've been given
         // back ownership.
-        let aref = unsafe { ARef::from_raw(ptr) };
-
-        T::run(aref)
+        unsafe { ARef::from_raw(ptr) }
     }
 }
 
-- 
2.51.2

