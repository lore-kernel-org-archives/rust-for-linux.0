Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805332B105
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293612; cv=none; b=jWcKQLYrOI5OC/IlP3d24TKn68A8SwE8ywSrTeHN40CNv0x4dAMTJDPa2pAO138+Sbf1i2q1HcQkuDKi1v1eh/jwHJvaklWjBSrMKPQdhcPEzjd6jzyodiwmB7ofQdpjSmMqBwkvhVJkZiD+knFjFnrrm7ovvU5GqB1DuJwM5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293612; c=relaxed/simple;
	bh=10TJOJl+9SDXmeXGGdC0BrHmMqCbtmNHIzqUAiJNBWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozRZHR/NwfFOfiUJG5FDINRWc4Ueo6BwsXPjZzU8dWBSsr/TxgejKFWyGKUlBVddkYo0KXbRZ6MlvMfAqEk/aLTJRZv0+KSa5VJzPDw+4uVIS7jDQ3yMXch61wJP5TZ7BazdNZp+HtvfQToz6v4gR0AuZ7XRnmGojvYROg6Idz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=JBqZWLhq; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="JBqZWLhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781293605; x=1781552805;
	bh=yF+pSlHcJkDmIjs21f+9ignjqrVhe5dZ+8+xeRi7Kp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JBqZWLhqDG+Xdmn0dJF4BNnB+n7e7Mkv5euwmLr0N0JDHbe2Bewyh7aR6yBEvWtSR
	 JsaeGYxaNkEyk4z/eXQABdpbkxBpaXS6Lg5zSb0BUtmUpDY5FywEZqSmAmgJt8QMeq
	 /ITERyWlN2qQvQOxqSO0nbgTOqb0i0mSmN4vtatGZBJpKwQ/nwudT6FJ+5kHrMm5Vg
	 22Eet9WS7dVSYgmNrF/g9X6O0vtX8YjE3KE2XsvxImJ1Xy2428BdnD6AdnLfXL554w
	 x8pS5ytY3JIO7oUkLXOKn7CfStvc00hffyw1KiVucILr1BanG4GJ3uuvje4Zrn9Fg9
	 cCbZAZQF4RWYw==
X-Pm-Submission-Id: 4gcVQC0StPz1DDXZ
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
Subject: [PATCH v2 1/1] rust: workqueue: add cancel_sync support
Date: Fri, 12 Jun 2026 22:45:42 +0300
Message-ID: <20260612194633.350011-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260612194633.350011-1-work@onurozkan.dev>
References: <20260612194633.350011-1-work@onurozkan.dev>
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
 rust/kernel/workqueue.rs | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..4d61d7a10fae 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -471,6 +471,23 @@ pub trait WorkItem<const ID: u64 = 0> {
     fn run(this: Self::Pointer);
 }
 
+/// Work item pointers that support cancellation.
+///
+/// # Safety
+///
+/// Implementers must ensure that `from_raw_work` rebuilds the exact ownership transferred
+/// by a successful [`RawWorkItem::__enqueue`] call.
+pub unsafe trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> + Sized {
+    /// Rebuild this work item's pointer from its embedded `work_struct`.
+    ///
+    /// # Safety
+    ///
+    /// The provided `work_struct` pointer must originate from a previous call to
+    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure returned true
+    /// and the pointer must still be valid.
+    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
+}
+
 /// Links for a work item.
 ///
 /// This struct contains a function pointer to the [`run`] function from the [`WorkItemPointer`]
@@ -537,6 +554,32 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
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
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
@@ -725,6 +768,34 @@ pub unsafe fn raw_as_work(ptr: *const Self) -> *mut Work<T, ID> {
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
 }
 
 /// Declares that a type contains a [`DelayedWork<T, ID>`].
@@ -871,6 +942,24 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: `from_raw_work()` reconstructs exactly the `Arc<T>` ownership previously transferred by
+// `Arc::into_raw()` in `RawWorkItem::__enqueue`, using the same `Work<T, ID>` field selected by
+// `HasWork<T, ID>`.
+unsafe impl<T, const ID: u64> SupportsCancelling<ID> for Arc<T>
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
@@ -1013,6 +1102,33 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: `from_raw_work()` reconstructs exactly the `ARef<T>` ownership previously transferred by
+// `ARef::into_raw()` in `RawWorkItem::__enqueue`, using the same `Work<T, ID>` field selected by
+// `HasWork<T, ID>`.
+unsafe impl<T, const ID: u64> SupportsCancelling<ID> for ARef<T>
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

