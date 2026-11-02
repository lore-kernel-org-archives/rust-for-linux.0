Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632091;
	b=hE3xfAOnHQPTodZ2O/gfbRy5vqPtUNFbeMLFT6H1MxM0ubrtc/WCCc3IkCk7cRqH6V/2
	 aZTfHedUOWM0PpeSF2nXgPS9BbO3z4+jNTfysHIkqiqDR7hySp/jBEOyUcrFHScLWjmLz
	 NcKsoQYMDoFTJtAtvJJT/vHmwdmgfqSI8zIEshwEgFYH/o8pDzdrWXGVB1jHMnSc84iiJ
	 sgG447w8c549YHHmyJHlsEjse748ztJnggBygSGKswFj02Rxb17l688PfQvfbhSw6bLk6
	 jqy15cKGWq9YByC/k7XfAicFpDnJlGdQ26O31myC5lciA0nutqEP5aCU3Ho3un/lcVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632091;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nrM/uUf4HdTSRJMfQyJdPJ//6muAeY8Jt8qA4ElcX4M=;
	b=REuQnvKqC4J8+Ubfl2FcQ//qXiry7ozu3CiY7BzWgKOFy5ZU6HPK/p2Gq+GcPOlwg1E9
	 ov9xSrzGD4H5NAV3/ew1KvQ7YvH7CekoVhPefXg3CDpeNt1XwYTA/cqKT092mVN4Fi/vq
	 SkmuQG6wq+1aagFjywZ8ej3aG1aqQAUOnb1bn31Bw6eD80fz56ecM7wPx6jSaCU40ktUa
	 aH3FsNcsayEBBz/b5MSsba7oDKLKI3Y9xm6G/VxXjcL9//m1OscH3yNXHRoF0J8d/nN54
	 5DVlrTz3phHPwHQMrBp+MuJ5fj1HbTPLA5vsLHrx/vK04nEHVvNtMvTsX7QdC/Y2BDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBRRGcw8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78C60A44ED;
	Mon,  2 Nov 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBRRGcw8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B30B1F00A18;
	Mon,  2 Nov 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632091;
	bh=nrM/uUf4HdTSRJMfQyJdPJ//6muAeY8Jt8qA4ElcX4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oBRRGcw8ROwqhrET8KcqKuAjekSVKjxNq9Q0Q751SFL+LSUrJpxsC913yy5VOwUXi
	 bdKiVpK9mZxauiFIwdUcDRbZIFP9OvJ9dyjD+Tglv5N2t5iGLI29Ay1L/Bq3DHVs5o
	 XAvycYvaGF8N5poqs68eHyLCLfiztRIU+ndpeFQT8WjtDdDrNMieh9PNCRgnjXrwVI
	 F++7JSqENNOsj+IuiSaWxFDvRby3VhBmPllhcuRHbt7Vun0AJi+JeLtjQyObSl7Iz4
	 9OTpDV3EeUJErTLY6313UhvMhpXmtLKHpq04j3nyRdu4kbeeEo1viU0hwy9Akmn/VK
	 iWKHKet3HOhkA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: DmaFence: Replace call_rcu() with synchronize_rcu()
Date: Mon,  2 Nov 2026 16:06:18 +0100
Message-ID: <20261102150617.527772-4-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102150617.527772-2-phasta@kernel.org>
References: <20261102150617.527772-2-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C dma_fence contract demands that a fence's data disappears no
earlier than 1 RCU grace period after the DriverFence was signaled.

So far, we achieved this with dropping the DriverFence's data in a
deferred manner with a manual, raw binding call to call_rcu().

However, this call_rcu() does not solve one problem: It is conceivable
that some driver data must not drop in atomic context; but call_rcu()'s
payload *can* be executed in atomic context.

Moreover, the current developments in drm::JobQueue, where a DriverFence
is always coupled 1:1 with a Job, allows for dropping job and fence
through a work item.

The undesirable blocking behavior of synchronize_rcu() would, thus, not
be annoying any thread anymore. The direct users of DmaFence could
achieve the same by dropping their DriverFences through work items.

The only conceivable other solution, queue_rcu_work(), would, for many
users, schedule a work_item from another work_item, which seems
undesirable.

Additionally, using the existing synchronize_rcu() abstraction has the
advantage of us getting rid of a raw bindings call.

Replace DriverFence::drop()'s call_rcu() with synchronize_rcu().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 89 ++++++++++----------------------
 1 file changed, 26 insertions(+), 63 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 3022bdb5f7c3..ad9cebf8428c 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -42,7 +42,10 @@
             Atomic,
             Relaxed, //
         },
-        rcu::rcu_barrier, //
+        rcu::{
+            rcu_barrier,
+            synchronize_rcu, //
+        }, //
     }, //
 };
 
@@ -65,7 +68,7 @@ pub struct FenceContext<T: FenceContextOps + Send + Sync> {
     /// The sequence number for the next fence created.
     seqno: Atomic<u64>,
     // The name parameters can be accessed by the dma_fence backend_ops. UAF
-    // errors are prevented by the `call_rcu()` in `drop_driver_fence_data()`.
+    // errors are prevented by the `synchronize_rcu()` in `drop_driver_fence_data()`.
     /// The name of the driver this FenceContext's fences belong to.
     driver_name: CString,
     /// The name of the timeline this FenceContext's fences belong to.
@@ -142,7 +145,6 @@ pub fn new_fence_allocation(
         data: T::FenceDataType,
     ) -> Result<DriverFenceAllocation<'_, T>> {
         let fence_data = DriverFenceData {
-            rcu_head: Default::default(),
             // `inner` remains uninitialized until a `DriverFence` takes over.
             inner: Fence {
                 inner: Opaque::uninit(),
@@ -600,8 +602,6 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
     // necessary so that the C backend can free the allocation (coming from our
     // Rust code) with kfree_rcu().
     inner: Fence,
-    /// Callback head for dropping this in a deferred manner through RCU.
-    rcu_head: bindings::callback_head,
     /// Reference to access the FenceContext.
     fctx: &'a FenceContext<T>,
     /// The API user's data. It is essential that the data only performs
@@ -644,6 +644,10 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 ///
 /// In the unlikely case of such violations, a panic is thrown.
 ///
+/// For requirements imposed by the C backend, a [`DriverFence`] might perform
+/// a call to [`rcu::synchronize_rcu`] when it drops. Thus, avoid dropping a
+/// [`DriverFence`] in atomic context.
+///
 /// # Examples
 ///
 /// ```
@@ -940,15 +944,15 @@ fn drop(&mut self) {
         // dma_fence_is_signaled_locked() because the C backend wants to get rid
         // of the latter.
 
-        // SAFETY: `guard` is valid until the `call_rcu()` below.
+        // SAFETY: `guard` is valid.
         let signaled: bool = unsafe { bindings::dma_fence_test_signaled_flag(guard.as_raw()) };
         if !signaled {
             pr_err!("DriverFence drops unsignaled. Danger of memory corruption!\n");
-            // SAFETY: `guard` is valid until the `call_rcu()` below. The fence
-            // must not have been signaled yet, which we check directly above.
+            // SAFETY: `guard` is valid. The fence must not have been signaled
+            // yet, which we check directly above.
             unsafe { bindings::dma_fence_set_error(guard.as_raw(), ECANCELED.to_errno()) };
-            // SAFETY: `guard` is valid until the `call_rcu()` below. The lock
-            // must be held, which we acquired above.
+            // SAFETY: `guard` is valid. The lock must be held, which we
+            // acquired above.
             unsafe { bindings::dma_fence_signal_locked(guard.as_raw()) };
 
             // SAFETY: `self.data` is valid because `self` is valid.
@@ -973,59 +977,18 @@ fn drop(&mut self) {
             return;
         }
 
-        // SAFETY: Valid because `self` is valid.
-        let rcu_head_ptr = unsafe { &raw mut (*self.data.as_ptr()).rcu_head };
+        // Make sure none of the fence backend_ops can access data anymore.
+        //
+        // TODO:
+        // This would not be necessary if the C dma_fence backend were using a
+        // spinlock to properly synchronize its signaled state. Fix it in C and
+        // then remove synchronize_rcu().
+        synchronize_rcu();
 
-        // SAFETY: `call_rcu()` is always safe to be called. `rcu_head_ptr` was
-        // created validly above. The module must perform a `synchronize_rcu()`
-        // or `rcu_barrier()` call to guard against module unload.
-        unsafe { bindings::call_rcu(rcu_head_ptr, Some(drop_driver_fence_data::<T>)) };
+        // SAFETY: Valid because `self` is valid.
+        unsafe { drop_in_place(&raw mut self.data) };
+
+        // SAFETY: The `synchronize_rcu()` above ensures all accessors are gone.
+        unsafe { bindings::dma_fence_put(self.as_raw()) };
     }
 }
-
-// TODO:
-// The entire call_rcu() mechanism in the drop above and the code below would be
-// unnecessary if C's dma_fence_signal() could be reworked in a way that after it
-// ran, the caller knows that no fence_ops callbacks can be running anymore.
-// In other words, if the dma_fence backend would use its spinlock for full
-// synchronization.
-//
-// Then we could move the drop_in_place() and dma_fence_put() upwards into the
-// drop() implementation and call it a day.
-
-/// Finally really drop this `DriverFence<T>`
-///
-/// # Safety
-///
-/// `head` references the `rcu_head` field of an `DriverFenceData<T>`. All
-/// accessors to that `DriverFenceData<T>` must be gone by now. This must be
-/// ensured by signalling the associated `DriverFence<T>` and then waiting
-/// for a grace period until calling this function here.
-unsafe extern "C" fn drop_driver_fence_data<T: Send + Sync + FenceContextOps>(
-    head: *mut bindings::callback_head,
-) {
-    // SAFETY: Caller provides a pointer to the `rcu_head` field of a `DriverFenceData<C>`.
-    let fence_data = unsafe { container_of!(head, DriverFenceData<'_, T>, rcu_head) };
-
-    // SAFETY: `fence_data` was created validly above. All the fence's data will
-    // only drop below, but the raw pointer to the raw C `dma_fence` remains
-    // valid because the reference count is only decremented at the end of the
-    // function.
-    let fence = unsafe { (*fence_data).inner.inner.get() };
-
-    // SAFETY: `fence_data` was created validly above. The user has already
-    // dropped the only conventional accessor to the user data, the `DriverFence`,
-    // one grace period ago. All accessors are gone now.
-    unsafe { drop_in_place(&raw mut (*fence_data).data) };
-
-    // The inner `Fence` explicitly does not get dropped because there may be
-    // many more users / consumers, each holding their own reference.
-
-    // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is valid
-    // and initialized. It is valid until the refcount drops to 0, which can
-    // earliest happen once we drop the `DriverFence`'s reference here.
-    unsafe { bindings::dma_fence_put(fence) };
-
-    // The actual memory the data associated with a `DriverFence` lives in
-    // gets freed by the C dma_fence backend once the fence's refcount reaches 0.
-}
-- 
2.56.0

