Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E9A3859CE;
	Mon, 23 Mar 2026 23:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308469; cv=pass; b=QtNFLiVHzaYfqJkNAZ8nrcK4LoAZIPcuDWhpee6f7+x+MvfzbJfvW8ibKzkCEbvMnF7SGREMNJv8baRzVUVfmijdx51bD/vBnyNUR7TFkBRkcw3/ydAPOeIfXXcpYb3QlbMrJxnFxP4s2rvfgNpBRnWeSKJXut3TbFtaereI0Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308469; c=relaxed/simple;
	bh=N9pIP3J9v/KYTQ7V2ab4ajHsksHXVEDRS3BG143mpt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQqS/P+1JXBse5sp72tn7cLN3jsxRo8+47qmLFyEq+QI9AbWNVkdyVZpTKkZnt10mhxSJYq4bPAusJCqi0yVqXJTT1yx2xDKzaOBlsj7Kv0nsZtHslMBA4rvpG22gxF11cWICUNeJvH9/TJGa+5Ae9PJ1bHOUZbB+paqPZc4Wt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Eucbzzuq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Eucbzzuq"
ARC-Seal: i=1; a=rsa-sha256; t=1774308454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KplLHRyxu0/07fcnleHtLYzH1wPMZEwRry2qv1cAR4qMw2qbEGkb19AF7aSgATpszJWvr0kKVYK3nKzbEKTG+XrqvNlGGwQheZAnEvVTpz5br00eAKCGiwrgatKq4oy+ndlsmUjdOAlBtsqa5h568fEo1bG38DJ3qEMtWE7Ge6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774308454; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g02+ZHWVbm6SiDmmd6E8Xa6/nNUvtRdXGMGcO5ri3u4=; 
	b=AjEHaKpmA6GbERP6NombEcQ5NWmxL/e7VkspcOcGrW59u+ZncU8hoUGYTD+tfiyZf9G4Zy7YOvq1zqMWCzlSpITGNnbxVdJuKwsg79rhk57BkCC0MrXn2Aj8BmsMaP+nma9q29i2GTT4zTEQjxtuKm4Vs45+LIBLw7rqXlhBZ5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774308454;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=g02+ZHWVbm6SiDmmd6E8Xa6/nNUvtRdXGMGcO5ri3u4=;
	b=EucbzzuqsZN5xqJWoFAx7pa/SDBL+WqQYYsvAAFYlc4bE4E8FU6bO9LStGFA8vi/
	d9rRWW12Rv8QsmXqREMwgdpspBuiRbpo7DJS+YLfG++CdzQxEVFVLOWTNOsTiqlO0L0
	WDz7pGfMg3rDlV/4y05ATOZRTe8BmSPd5y9A+3BQ=
Received: by mx.zohomail.com with SMTPS id 177430845216628.097026727276216;
	Mon, 23 Mar 2026 16:27:32 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Mar 2026 20:26:59 -0300
Subject: [PATCH v3 1/4] rust: workqueue: add support for ARef<T>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-aref-workitem-v3-1-f59729b812aa@collabora.com>
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
In-Reply-To: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

Add support for the ARef<T> smart pointer. This allows an instance of
ARef<T> to handle deferred work directly, which can be convenient or even
necessary at times, depending on the specifics of the driver or subsystem.

The implementation is similar to that of Arc<T>, and a subsequent patch
will implement support for drm::Device as the first user. This is notably
important for work items that need access to the drm device, as it was not
possible to enqueue work on a ARef<drm::Device<T>> previously without
failing the orphan rule.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/workqueue.rs | 85 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..6ae7f3fb3496 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -192,9 +192,9 @@
     sync::Arc,
     sync::LockClassKey,
     time::Jiffies,
-    types::Opaque,
+    types::{ARef, AlwaysRefCounted, Opaque},
 };
-use core::marker::PhantomData;
+use core::{marker::PhantomData, ptr::NonNull};
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -425,10 +425,11 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
 
 /// Defines the method that should be called directly when a work item is executed.
 ///
-/// This trait is implemented by `Pin<KBox<T>>` and [`Arc<T>`], and is mainly intended to be
-/// implemented for smart pointer types. For your own structs, you would implement [`WorkItem`]
-/// instead. The [`run`] method on this trait will usually just perform the appropriate
-/// `container_of` translation and then call into the [`run`][WorkItem::run] method from the
+/// This trait is implemented by `Pin<KBox<T>>`, [`Arc<T>`] and [`ARef<T>`], and
+/// is mainly intended to be implemented for smart pointer types. For your own
+/// structs, you would implement [`WorkItem`] instead. The [`run`] method on
+/// this trait will usually just perform the appropriate `container_of`
+/// translation and then call into the [`run`][WorkItem::run] method from the
 /// [`WorkItem`] trait.
 ///
 /// This trait is used when the `work_struct` field is defined using the [`Work`] helper.
@@ -934,6 +935,78 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
 {
 }
 
+// SAFETY: Like the `Arc<T>` implementation, the `__enqueue` implementation for
+// `ARef<T>` obtains a `work_struct` from the `Work` field using
+// `T::raw_get_work`, so the same safety reasoning applies:
+//
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
+//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field
+//     will be used because of the ID const generic bound. This makes sure that `T::raw_get_work`
+//     uses the correct offset for the `Work` field, and `Work::new` picks the correct
+//     implementation of `WorkItemPointer` for `ARef<T>`.
+unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
+where
+    T: AlwaysRefCounted,
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
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
+        let aref = unsafe { ARef::from_raw(ptr) };
+
+        T::run(aref)
+    }
+}
+
+// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
+// the closure because we get it from an `ARef`, which means that the ref count will be at least 1,
+// and we don't drop the `ARef` ourselves. If `queue_work_on` returns true, it is further guaranteed
+// to be valid until a call to the function pointer in `work_struct` because we leak the memory it
+// points to, and only reclaim it if the closure returns false, or in `WorkItemPointer::run`, which
+// is what the function pointer in the `work_struct` must be pointing to, according to the safety
+// requirements of `WorkItemPointer`.
+unsafe impl<T, const ID: u64> RawWorkItem<ID> for ARef<T>
+where
+    T: AlwaysRefCounted,
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasWork<T, ID>,
+{
+    type EnqueueOutput = Result<(), Self>;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        let ptr = ARef::into_raw(self);
+
+        // SAFETY: Pointers from ARef::into_raw are valid and non-null.
+        let work_ptr = unsafe { T::raw_get_work(ptr.as_ptr()) };
+        // SAFETY: `raw_get_work` returns a pointer to a valid value.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        if queue_work_on(work_ptr) {
+            Ok(())
+        } else {
+            // SAFETY: The work queue has not taken ownership of the pointer.
+            Err(unsafe { ARef::from_raw(ptr) })
+        }
+    }
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are

-- 
2.53.0

