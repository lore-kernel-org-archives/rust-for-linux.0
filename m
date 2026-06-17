Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C1390CA9
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702263; cv=none; b=gCN0Ce4ncq0k2APgQ5OQhSnILN22sS5a612Wbh4mtaKbFZrQr7BFSTVc83tJRbUVXyLxS14BQZl7F1+IdqNc9OA9wPLyduhzAZBWG9heYTdngIXXtcNueryrtT2dT22aQVl1XmOmuiigfrY1NPBYY3Q39yHyNUDwbhRqdZOk6JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702263; c=relaxed/simple;
	bh=5ZOT7q+VZSyuoilbeVLYNjLhvLjxylDuZZ6cktv3VsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiy6ZxJ7OyZYzMGdikafiXcDqQk6rodTWD4uzMm02uSxbzI7cFMX5DhWhm9Xl2jmIlpV60TeXe2Fxp6QhTgjrcWHYvuxOJXdAjm/ctgP+Q5GgKg25gnsbGgDKCaoTVuS6S88LNi6HK4oq7oSop65hrSRRWvEAHtRaqRW5ILOm24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=aCK/vXRH; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="aCK/vXRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781702258; x=1781961458;
	bh=aQmq+320ZlrjUsbNl8Nlgeg1Ert4VlTMrQpwat09u0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aCK/vXRHTsNtJDIKo1DuOXwbcREyj4uPmp2RN8iFd0+3lfiDKI7VHph+qB4IrgAbU
	 +A0CknpaDwpXEEcL6An9hFL2WnVtsLrH+pTf/2Szkbrcmy78LhvKXVyVJstOua7LMA
	 QP1SwRaOzhmEzbx0FFYc6RxxQI96nTxppjRMDDoSN5vhYIW3C9QuF1ZI82cD9z7e8+
	 +D5BLe4W5Ntx+y4c9pMtV0uHjwyTcRxkxA/nFB7iTGqryCkzHG4S5aUDAiLXdV/Cy4
	 4Sm9k7eo58OcbeRSg7MCF49Lxxwz2TTRLP4L5JpF+wFYSxx7KCuwujwSMWH727FmFW
	 Lkg8vTz6aUEyQ==
X-Pm-Submission-Id: 4ggPXw0CV9z2ScqZ
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
Subject: [PATCH v3 1/1] rust: workqueue: add cancel_sync support
Date: Wed, 17 Jun 2026 16:17:20 +0300
Message-ID: <20260617131731.145337-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260617131731.145337-1-work@onurozkan.dev>
References: <20260617131731.145337-1-work@onurozkan.dev>
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

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue.rs | 113 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..f43822d5e673 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -471,6 +471,24 @@ pub trait WorkItem<const ID: u64 = 0> {
     fn run(this: Self::Pointer);
 }
 
+/// Work item pointers that support cancellation.
+///
+/// # Safety
+///
+/// Implementers must ensure that `from_raw_work` rebuilds the exact ownership transferred
+/// by a successful [`RawWorkItem::__enqueue`] call.
+pub unsafe trait SupportsCancel<const ID: u64>: WorkItemPointer<ID> + Sized {
+    /// Rebuild this work item's pointer from its embedded `work_struct`.
+    ///
+    /// # Safety
+    ///
+    /// The provided `work_struct` pointer must originate from a previous call to
+    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure returned true,
+    /// ownership of the enqueued work item must already have been transferred back
+    /// from the workqueue and the pointer must still be valid.
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
+}
+
 /// Links for a work item.
 ///
 /// This struct contains a function pointer to the [`run`] function from the [`WorkItemPointer`]
@@ -537,6 +555,30 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Cancels this work item if it is pending and waits for any running execution to finish.
+    ///
+    /// On return, the work item is guaranteed to not be pending or executing as long as there are
+    /// no racing re-enqueues.
+    ///
+    /// This should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn cancel_sync(&self) -> Option<T::Pointer>
+    where
+        T: WorkItem<ID>,
+        T::Pointer: SupportsCancel<ID>,
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
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
@@ -725,6 +767,32 @@ pub unsafe fn raw_as_work(ptr: *const Self) -> *mut Work<T, ID> {
         // CAST: Work and work_struct have compatible layouts.
         wrk.cast()
     }
+
+    /// Cancels this delayed work item if it is pending and waits for any running execution to
+    /// finish.
+    ///
+    /// On return, the work item is guaranteed to not be pending or executing as long as there are
+    /// no racing re-enqueues.
+    ///
+    /// This should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn cancel_sync(&self) -> Option<T::Pointer>
+    where
+        T: WorkItem<ID>,
+        T::Pointer: SupportsCancel<ID>,
+    {
+        let ptr = self.dwork.get();
+
+        // SAFETY: `ptr` is a valid embedded `delayed_work`.
+        if unsafe { bindings::cancel_delayed_work_sync(ptr) } {
+            // SAFETY: A `true` return means the work was pending and got canceled, so the queued
+            // ownership transfer performed by `__enqueue` is reclaimed here.
+            Some(unsafe { T::Pointer::from_raw_work(&raw mut (*ptr).work) })
+        } else {
+            None
+        }
+    }
 }
 
 /// Declares that a type contains a [`DelayedWork<T, ID>`].
@@ -871,6 +939,24 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: `from_raw_work()` reconstructs exactly the `Arc<T>` ownership previously transferred by
+// `Arc::into_raw()` in `RawWorkItem::__enqueue`, using the same `Work<T, ID>` field selected by
+// `HasWork<T, ID>`.
+unsafe impl<T, const ID: u64> SupportsCancel<ID> for Arc<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
+        // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
+        let ptr = ptr.cast::<Work<T, ID>>();
+        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        let ptr = unsafe { T::work_container_of(ptr) };
+        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        unsafe { Arc::from_raw(ptr) }
+    }
+}
+
 // SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
 // `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
 // the `delayed_work` has the same access rules as its `work` field.
@@ -1013,6 +1099,33 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: `from_raw_work()` reconstructs exactly the `ARef<T>` ownership previously transferred by
+// `ARef::into_raw()` in `RawWorkItem::__enqueue`, using the same `Work<T, ID>` field selected by
+// `HasWork<T, ID>`.
+unsafe impl<T, const ID: u64> SupportsCancel<ID> for ARef<T>
+where
+    T: AlwaysRefCounted,
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
+        // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
+        let ptr = ptr.cast::<Work<T, ID>>();
+
+        // SAFETY: This computes the pointer that `__enqueue` got from
+        // `ARef::into_raw`.
+        let ptr = unsafe { T::work_container_of(ptr) };
+
+        // SAFETY: The safety contract of `work_container_of` ensures that it
+        // returns a valid non-null pointer.
+        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+
+        // SAFETY: This pointer comes from `ARef::into_raw` and we've been given
+        // back ownership.
+        unsafe { ARef::from_raw(ptr) }
+    }
+}
+
 // SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
 // `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
 // the `delayed_work` has the same access rules as its `work` field.
-- 
2.51.2

