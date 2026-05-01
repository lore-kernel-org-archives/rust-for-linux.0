Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFB53019A9
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777663047; cv=none; b=TPgbZyKp+SXYXxUV9PJZdVxH2r64AA9oQ581QLbY5SYIFYsJAOVR2bfPar+CrR6eansDLH1drWTAiKqn5iIFu0/JbEuD7x/BaXGbIvRMLDB4rQ3gIrCEdqTpPyG1qvcDpn6YE7tF9LQeWJpfncoMSl8zuVIRg/ZnRD5uwAgvc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777663047; c=relaxed/simple;
	bh=r82TbxgQvr8dhNc2jA7oa5nFOR4DLXyYnZsYOielrSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jnpCUNr/2TGSbcm3Np5ZTzv3S0y8aakgCI4n7iBaeMP3pHcujaQfW81ZROUeFvZAr9FtcCgXpCEm3t0AQQ8GXT7joT9vZxhsLPyDqUyS7LHRdz/3GWh8c9AyOuqEcbELAFjxceySqsKcqKQQ2Zrk9TfF+PMGylueL30tD/u9txM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=wWAVvPzR; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="wWAVvPzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777663035; x=1777922235;
	bh=DcVf5xvr2oGH5sZpOcgFkl1Lvr0otGMN/VcVMdWn0qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wWAVvPzRhH+7qpGmo3aLKODfTQmPXuVi5lZ3SpVtL3Bfl4OuNDkrAYqQlrji1DOoQ
	 35MLkhdyPsNZ8V6cOq7NI0zOjqVEATgr8nrnoGQz2GDRIQWOk3mLDLTkTX/V3hlzkK
	 7qukz0wiQGds0Vd7t38jWdH4anAYJScgK515mxRTMbE1IiYymy7aW3jYAzAkF7tsRZ
	 kaImArL49szISyeW5iFpuZCft8XmhwSlfWV1NutwxifWC7QL5mv090T++burdib1oN
	 inR3dsqtmOMsnC4YTdNl3xfcAJYa19udetSK1EIVM0U+SAK+ho9bayDlyO/VZQtFFV
	 aDKWWxaufQRLg==
X-Pm-Submission-Id: 4g6glY1ydGz2Scpp
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
Subject: [PATCH v2 1/1] rust: add Work::disable_sync
Date: Fri,  1 May 2026 22:11:22 +0300
Message-ID: <20260501191122.64311-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260501191122.64311-1-work@onurozkan.dev>
References: <20260501191122.64311-1-work@onurozkan.dev>
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
 rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..d0f9b4ba7f27 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue
 
     /// Enqueues a work item.
     ///
-    /// This may fail if the work item is already enqueued in a workqueue.
+    /// This may fail if the work item is already enqueued in a workqueue or disabled.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
     pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
@@ -276,8 +276,9 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     {
         let queue_ptr = self.0.get();
 
-        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
-        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue or
+        // disabled. The other `__enqueue` requirements are not relevant since `W` is `Send` and
+        // static.
         //
         // The call to `bindings::queue_work_on` will dereference the provided raw pointer, which
         // is ok because `__enqueue` guarantees that the pointer is valid for the duration of this
@@ -300,7 +301,7 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
 
     /// Enqueues a delayed work item.
     ///
-    /// This may fail if the work item is already enqueued in a workqueue.
+    /// This may fail if the work item is already enqueued in a workqueue or disabled.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
     pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
@@ -309,8 +310,9 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
     {
         let queue_ptr = self.0.get();
 
-        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
-        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue or
+        // disabled. The other `__enqueue` requirements are not relevant since `W` is `Send` and
+        // static.
         //
         // The call to `bindings::queue_delayed_work_on` will dereference the provided raw pointer,
         // which is ok because `__enqueue` guarantees that the pointer is valid for the duration of
@@ -347,7 +349,7 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
             func: Some(func),
         });
 
-        self.enqueue(KBox::pin_init(init, flags).map_err(|_| AllocError)?);
+        let _ = self.enqueue(KBox::pin_init(init, flags).map_err(|_| AllocError)?);
         Ok(())
     }
 }
@@ -407,7 +409,8 @@ pub unsafe trait RawWorkItem<const ID: u64> {
     ///
     /// # Safety
     ///
-    /// The provided closure may only return `false` if the `work_struct` is already in a workqueue.
+    /// The provided closure may only return `false` if the `work_struct` is already in a workqueue
+    /// or disabled.
     ///
     /// If the work item type is annotated with any lifetimes, then you must not call the function
     /// pointer after any such lifetime expires. (Never calling the function pointer is okay.)
@@ -442,21 +445,34 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
 ///
 /// # Safety
 ///
-/// Implementers must ensure that [`__enqueue`] uses a `work_struct` initialized with the [`run`]
-/// method of this trait as the function pointer.
-///
-/// [`__enqueue`]: RawWorkItem::__enqueue
-/// [`run`]: WorkItemPointer::run
-pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
-    /// Run this work item.
+/// Implementers must ensure that [`WorkItemPointer::from_raw_work`] rebuilds the exact ownership
+/// transferred by a successful [`RawWorkItem::__enqueue`] call.
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
+    ///
+    /// # Safety
     ///
-    /// [`__enqueue`]: RawWorkItem::__enqueue
-    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
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
 
 /// Defines the method that should be called when this work item is executed.
@@ -537,6 +553,28 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
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
+            // ownership transfer performed by `__enqueue` is reclaimed here.
+            drop(unsafe { T::Pointer::from_raw_work(raw_work) });
+        }
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
@@ -817,22 +855,22 @@ unsafe fn work_container_of(
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
 
@@ -887,7 +925,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
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
@@ -895,9 +935,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
-        let pinned = unsafe { Pin::new_unchecked(boxed) };
-
-        T::run(pinned)
+        unsafe { Pin::new_unchecked(boxed) }
     }
 }
 
@@ -907,7 +945,7 @@ unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    type EnqueueOutput = ();
+    type EnqueueOutput = Result<(), Self>;
 
     unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     where
@@ -923,10 +961,13 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
         // SAFETY: `raw_get_work` returns a pointer to a valid value.
         let work_ptr = unsafe { Work::raw_get(work_ptr) };
 
-        if !queue_work_on(work_ptr) {
-            // SAFETY: This method requires exclusive ownership of the box, so it cannot be in a
-            // workqueue.
-            unsafe { ::core::hint::unreachable_unchecked() }
+        if queue_work_on(work_ptr) {
+            Ok(())
+        } else {
+            // SAFETY: The work queue has not taken ownership of the pointer.
+            let boxed = unsafe { KBox::from_raw(ptr) };
+            // SAFETY: The box was pinned before this enqueue attempt.
+            Err(unsafe { Pin::new_unchecked(boxed) })
         }
     }
 }
@@ -950,15 +991,17 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
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
 
@@ -972,9 +1015,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
 
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

