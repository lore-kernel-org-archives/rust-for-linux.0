Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C4436353;
	Wed,  4 Feb 2026 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237665; cv=none; b=JfTxsWB3AArElWIBtSO/ew0bOY9zGbbQmyr1gnepcyDHq5j9o37MezToLGpmUFo/Am7OYg8zqBgHjemGpR5+Kba2oIosK98su1MGKrNTQAJY5tLU0GRa/lq1PHnrANRDSTaNg7I/IBTvZ4zRbMQoWlr6erz0DRPVPLg5Z2nUQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237665; c=relaxed/simple;
	bh=qp1iKf391KY2mUCxLej6xprZ+WzxUPUnRVNWXA+uTRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFqm3wJmykRyMGitylODQKNPNxDkS+TCxESXv9L6/a7az8+PZSaksWfh8QJrjmG2pZD2i9aDeWLnSByJugYIaKCI1BC9BYA5xH32gMUyAv8005QvKTsVHLYY+19ClOAXOZmWhXh8fLgQxBvH7eF2t1HmARNbGixkM96malpAwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PphQE3pl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PphQE3pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770237663;
	bh=qp1iKf391KY2mUCxLej6xprZ+WzxUPUnRVNWXA+uTRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PphQE3pltqlvoHgT9xUP/+r7GsGFIrvNNTSfwVG38YRPU/0tG3/Q8cIRHQpZZ4ovJ
	 X6H3SFxcRaucCovzcSLaxgl+Kpv7ukr5bCi7q7MUwolBAVTdNyZn7ANtgK9H78Ax0f
	 HVtgh6DMWSAIteSGhCuSF+blqmdMkShDl/R1pdcKIJwuZjVyVkIj07t/9CWr51U0QW
	 xtDbCePDRmv2CqLWnlZVVcvWZLzujvhhhVszgZxZBEhYaQfSNTPExaCFReDtok9iCZ
	 XFs/5EZxtrfCqcB1p6Ii3TxnZfM902JBGfWSJp2xKx5955weKcogfVXfpiyN1cnxPm
	 RGz0lFEOQ259Q==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2181F17E1144;
	Wed,  4 Feb 2026 21:41:01 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 04 Feb 2026 17:40:39 -0300
Subject: [PATCH v2 1/4] rust: workqueue: add support for ARef<T>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-aref-workitem-v2-1-bec25b012d2a@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3

Add support for the ARef<T> smart pointer. This allows an instance of
ARef<T> to handle deferred work directly, which can be convenient or even
necessary at times, depending on the specifics of the driver or subsystem.

The implementation is similar to that of Arc<T>, and a subsequent patch
will implement support for drm::Device as the first user. This is notably
important for work items that need access to the drm device, as it was not
possible to enqueue work on a ARef<drm::Device<T>> previously without
failing the orphan rule.

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
2.52.0

