Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788AC28DEE9;
	Tue,  3 Feb 2026 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155759; cv=none; b=FEaSXYqkaLhnZ+iFk3I6dt/skRvgsU6HBHSu2mYIYWyYOMMqDmgI0S/3UYKRTMOLMGXY1daK5pcg6arftrcVEU8T9IsQ8z1UjYFWCfZPv+FJ5Mub+X8DYkZpg76n8nawlPPgnub1gHCK/ZjRzALJr1ckYPfhrxGLNm0uOJYzXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155759; c=relaxed/simple;
	bh=9fL2eXgKIaB4OA+z4Vgc+97K18HEnvlkGb7UrjUvBTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRxu9z3kdB2zoD8vy+UAL4fzmYQ0FgmheYl+2YwrYYzSSf/SGshVjc8uCgB3reNLm2ujoLI0FVMvpg7KiUUEBWvXtCfacwrFq0Rc4BPqjskYOzz37xBH51KRCWE45Lgo6zUo5Ys/KJDMcGXLwhwp3Nz1rnwrbR4AUC61dUtQyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=UsbYNRFn; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="UsbYNRFn"
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 777B120B7167; Tue,  3 Feb 2026 13:55:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 777B120B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770155757;
	bh=pC6lHroD7JyCDC87pwnE68DPXivF823eGIXzd8kq0uc=;
	h=From:To:Cc:Subject:Date:From;
	b=UsbYNRFnJPFYnZsIoRYW235o+kaT8JzznOr0X00RilsHKHwlQVQxAZ1Wi+oRq+3Mn
	 gQeF5D46gCR2jIOElMioxZZNchBV2An5zFsq5It5MRTRhkhCXiFplModBayn3U3AKJ
	 vUTAJTP7V8Ar6NC8BoiuuSxnm6F5Lzlm7hj1GpJY=
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Subject: [PATCH] workqueue: rust: add work item runtime modification support
Date: Tue,  3 Feb 2026 13:55:55 -0800
Message-ID: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This feature is required for our Hyper-V VMBus reimplementation effort.
As it provides the ability to modify the running state of work items at
runtime.

The design revolves around having
Queue::enqueue()/Queue::enqueue_delayed() return implementations of
WorkHandle which can then be used to enable/disable/cancel
the relevant work item.

Please see the example introduced at the top of the file for example
usage of work handles.

Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
---
 rust/kernel/workqueue.rs | 239 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..cbbd487ce8cb 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,7 +135,7 @@
 //!
 //! ```
 //! use kernel::sync::Arc;
-//! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem};
+//! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem, WorkHandle};
 //!
 //! #[pin_data]
 //! struct MyStruct {
@@ -179,8 +179,22 @@
 //! fn print_now(val: Arc<MyStruct>) {
 //!     let _ = workqueue::system().enqueue(val);
 //! }
+//!
+//! /// The returned WorkHandle can be used to cancel the work item before it gets executed.
+//! fn print_never(val: Arc<MyStruct>) {
+//!     let result = workqueue::system_bh().enqueue_delayed(val, 1000);
+//!
+//!     match result {
+//!         Ok(handle) => {
+//!             handle.cancel(true);
+//!         },
+//!         Err(_) => (),
+//!     }
+//! }
+//!
 //! # print_later(MyStruct::new(42).unwrap());
 //! # print_now(MyStruct::new(42).unwrap());
+//! # print_never(MyStruct::new(42).unwrap());
 //! ```
 //!
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
@@ -297,7 +311,7 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueDelayedOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {
@@ -317,7 +331,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
         // promises that the raw pointer will stay valid until we call the function pointer in the
         // `work_struct`, so the access is ok.
         unsafe {
-            w.__enqueue(move |work_ptr| {
+            w.__enqueue_delayed(move |work_ptr| {
                 bindings::queue_delayed_work_on(
                     bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
                     queue_ptr,
@@ -421,7 +435,15 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
 /// provided pointer must point at the `work` field of a valid `delayed_work`, and the guarantees
 /// that `__enqueue` provides about accessing the `work_struct` must also apply to the rest of the
 /// `delayed_work` struct.
-pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
+pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {
+    /// The return type of [`Queue::enqueue_delayed`].
+    type EnqueueDelayedOutput;
+
+    /// See [`RawWorkItem::__enqueue`], this method only differs in return type.
+    unsafe fn __enqueue_delayed<F>(self, queue_work_on: F) -> Self::EnqueueDelayedOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool;
+}
 
 /// Defines the method that should be called directly when a work item is executed.
 ///
@@ -530,6 +552,66 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Enable the current work item
+    #[inline]
+    pub unsafe fn raw_enable(this: *const Self) -> bool {
+        unsafe { bindings::enable_work(Self::raw_get(this)) }
+    }
+
+    /// Disable and cancel the current work item
+    #[inline]
+    pub unsafe fn raw_disable(this: *const Self) -> bool {
+        unsafe { bindings::disable_work(Self::raw_get(this)) }
+    }
+
+    #[inline]
+    unsafe fn raw_get_delayed(this: *const Self) -> *mut bindings::delayed_work {
+        let work_ptr = unsafe { Self::raw_get(this) };
+        unsafe { container_of!(work_ptr, bindings::delayed_work, work) }
+    }
+
+    /// Disable and cancel the current delayed work item
+    #[inline]
+    pub unsafe fn raw_disable_delayed(this: *const Self) -> bool {
+        unsafe { bindings::disable_delayed_work(Self::raw_get_delayed(this)) }
+    }
+
+    /// Disable and cancel the current work item and block until it's done
+    #[inline]
+    pub unsafe fn raw_disable_sync(this: *const Self) -> bool {
+        unsafe { bindings::disable_work_sync(Self::raw_get(this)) }
+    }
+
+    /// Disable and cancel the current delayed work item and block until it's done
+    #[inline]
+    pub unsafe fn raw_disable_delayed_sync(this: *const Self) -> bool {
+        unsafe { bindings::disable_delayed_work_sync(Self::raw_get_delayed(this)) }
+    }
+
+    /// Kill off the current work item
+    #[inline]
+    pub unsafe fn raw_cancel(this: *const Self) -> bool {
+        unsafe { bindings::cancel_work(Self::raw_get(this)) }
+    }
+
+    /// Kill off the current delayed work item
+    #[inline]
+    pub unsafe fn raw_cancel_delayed(this: *const Self) -> bool {
+        unsafe { bindings::cancel_delayed_work(Self::raw_get_delayed(this)) }
+    }
+
+    /// Kill off the current work item and block until it's done
+    #[inline]
+    pub unsafe fn raw_cancel_sync(this: *const Self) -> bool {
+        unsafe { bindings::cancel_work_sync(Self::raw_get(this)) }
+    }
+
+    /// Kill off the current delayed work item and block until it's done
+    #[inline]
+    pub unsafe fn raw_cancel_delayed_sync(this: *const Self) -> bool {
+        unsafe { bindings::cancel_delayed_work_sync(Self::raw_get_delayed(this)) }
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
@@ -578,6 +660,122 @@ pub unsafe trait HasWork<T, const ID: u64 = 0> {
     unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self;
 }
 
+/// A handle representing a potentially running work item.
+pub unsafe trait WorkHandle {
+    /// Enable a work item
+    ///
+    /// SAFETY: can be called from any context.
+    ///
+    /// Returns `true` only if the disable count reached 0.
+    fn enable(self) -> bool;
+
+    /// Disable and cancel a work item
+    ///
+    /// SAFETY: Can be called from any context if `sync` is set to `false`.
+    ///
+    /// If `sync` is set to true this method will block until the work item
+    /// has been cancelled.
+    ///
+    /// Returns `true` if the work item was pending.
+    fn disable(self, sync: bool) -> bool;
+
+    /// Cancel a work item
+    ///
+    /// SAFETY: Can be called from any context if `sync` is set to `false`.
+    ///
+    /// If `sync` is set to true this method will block until the work item
+    /// has been cancelled.
+    ///
+    /// Returns `true` if the work item was pending.
+    fn cancel(self, sync: bool) -> bool;
+}
+
+/// A handle for an `Arc<HasWork<T>>` returned by a call to
+/// [`RawWorkItem::__enqueue`]
+pub struct ArcWorkHandle<T, const ID: u64 = 0>
+where
+    T: HasWork<T, ID>,
+{
+    inner: Arc<T>,
+}
+
+unsafe impl<T, const ID: u64> WorkHandle for ArcWorkHandle<T, ID>
+where
+    T: HasWork<T, ID>,
+{
+    fn enable(self) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        unsafe { Work::<T, ID>::raw_enable(work_ptr) }
+    }
+
+    fn disable(self, sync: bool) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        if sync {
+            unsafe { Work::<T, ID>::raw_disable_sync(work_ptr) }
+        } else {
+            unsafe { Work::<T, ID>::raw_disable(work_ptr) }
+        }
+    }
+
+    fn cancel(self, sync: bool) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        if sync {
+            unsafe { Work::<T, ID>::raw_cancel_sync(work_ptr) }
+        } else {
+            unsafe { Work::<T, ID>::raw_cancel(work_ptr) }
+        }
+    }
+}
+
+/// A handle for an `Arc<HasDelayedWork<T>>` returned by a call to
+/// [`RawWorkItem::__enqueue_delayed`]
+pub struct ArcDelayedWorkHandle<T, const ID: u64 = 0>
+where
+    T: HasDelayedWork<T, ID>,
+{
+    inner: Arc<T>,
+}
+
+unsafe impl<T, const ID: u64> WorkHandle for ArcDelayedWorkHandle<T, ID>
+where
+    T: HasDelayedWork<T, ID>,
+{
+    fn enable(self) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        unsafe { Work::<T, ID>::raw_enable(work_ptr) }
+    }
+
+    fn disable(self, sync: bool) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        if sync {
+            unsafe { Work::<T, ID>::raw_disable_delayed_sync(work_ptr) }
+        } else {
+            unsafe { Work::<T, ID>::raw_disable_delayed(work_ptr) }
+        }
+    }
+
+    fn cancel(self, sync: bool) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner) as *mut T;
+        let work_ptr = unsafe { <T as HasWork<T, ID>>::raw_get_work(self_ptr) };
+
+        if sync {
+            unsafe { Work::<T, ID>::raw_cancel_delayed_sync(work_ptr) }
+        } else {
+            unsafe { Work::<T, ID>::raw_cancel_delayed(work_ptr) }
+        }
+    }
+}
+
 /// Used to safely implement the [`HasWork<T, ID>`] trait.
 ///
 /// # Examples
@@ -841,7 +1039,7 @@ unsafe impl<T, const ID: u64> RawWorkItem<ID> for Arc<T>
     T: WorkItem<ID, Pointer = Self>,
     T: HasWork<T, ID>,
 {
-    type EnqueueOutput = Result<(), Self>;
+    type EnqueueOutput = Result<ArcWorkHandle<T, ID>, Self>;
 
     unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     where
@@ -856,7 +1054,7 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
         let work_ptr = unsafe { Work::raw_get(work_ptr) };
 
         if queue_work_on(work_ptr) {
-            Ok(())
+            Ok(ArcWorkHandle { inner: unsafe { Arc::from_raw(ptr) } })
         } else {
             // SAFETY: The work queue has not taken ownership of the pointer.
             Err(unsafe { Arc::from_raw(ptr) })
@@ -872,6 +1070,27 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
     T: WorkItem<ID, Pointer = Self>,
     T: HasDelayedWork<T, ID>,
 {
+    type EnqueueDelayedOutput = Result<ArcDelayedWorkHandle<T, ID>, Self>;
+
+    unsafe fn __enqueue_delayed<F>(self, queue_work_on: F) -> Self::EnqueueDelayedOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        // Casting between const and mut is not a problem as long as the pointer is a raw pointer.
+        let ptr = Arc::into_raw(self).cast_mut();
+
+        // SAFETY: Pointers into an `Arc` point at a valid value.
+        let work_ptr = unsafe { T::raw_get_work(ptr) };
+        // SAFETY: `raw_get_work` returns a pointer to a valid value.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        if queue_work_on(work_ptr) {
+            Ok(ArcDelayedWorkHandle { inner: unsafe { Arc::from_raw(ptr) } })
+        } else {
+            // SAFETY: The work queue has not taken ownership of the pointer.
+            Err(unsafe { Arc::from_raw(ptr) })
+        }
+    }
 }
 
 // SAFETY: TODO.
@@ -932,6 +1151,14 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
     T: WorkItem<ID, Pointer = Self>,
     T: HasDelayedWork<T, ID>,
 {
+    type EnqueueDelayedOutput = ();
+
+    unsafe fn __enqueue_delayed<F>(self, queue_work_on: F) -> Self::EnqueueDelayedOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        unsafe { self.__enqueue(queue_work_on) }
+    }
 }
 
 /// Returns the system work queue (`system_wq`).
-- 
2.52.0

