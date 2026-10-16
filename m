Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3D4503EA;
	Fri, 16 Oct 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141084; cv=none; b=GXkPPlF3jA+mOaiMPuaXb7/ckfGnGYJ1jfhClUbCz8jg52VH9DlENepIhk+CXYXnX4Qw1TFmmNOw7nX9pRwLyQxx9TgO5C/GiU2tzWUIEAa2WEjhxEY9Jz4T6yoya6ci40x5QU7H9Qdy2SpQsyvpn4xi3VDby1l8yqJ8IRIsdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141084; c=relaxed/simple;
	bh=s9fHDw2VA1HmQKr7pT0ANPGawPkHzm929vuO59ndImw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa2LiKkfvAXUp9fo77GkSMKG/SbnUBnDldlEYf26d+maK4+EIO6eYw5kTT6aBM3MCtiHoXnrAFulE42/veN1X08XVnO4PP4s5BxGaZ8Z0hdbSXzY8vSJhP666WYY8mmSQ210T/rkBSj3Se4WcBaSF1tnk4s6DOf2E7ZzbXSZFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGypqsPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGypqsPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAFF1F000C5;
	Fri, 16 Oct 2026 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141081;
	bh=nsFhFArVSApNLrpNf1/jwb6GlqV0YL8E71VJjLGvGJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dGypqsPCar3tj4T7GNdNUk7/wWk4K5bo2CD6pIqw5JjzMg7YlH8x4oymEFgmkydCA
	 OnoiD7TE37+Ctbk6JYY7dpYubi/mQ+gInyN4TpawXnpeoBLIt6UHR407OKxXtKGPUz
	 c24zolZpcOHQRpUjPwhtvEUSbT+IWxYiiNdoJK3FwsuVJihbhxltttVrDnJYScpAmf
	 NMqYY4GVxhf/hz9ZIEB1q5gX/38AVpNaqBNRIpya5gact9UiY+K2CfGZRRC6uSLp8b
	 toBR6bRlzjMfaGnN9i7GnwLIqICdnh1xGgHccrMcG+7oMDcmyfM2UyFhKYWKroRsy9
	 R7o9wUiZysGQA==
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	John.harrison@igalia.com,
	da.gomez@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v6 4/5] rust: DmaFence: Replace call_rcu() with synchronize_rcu()
Date: Fri, 16 Oct 2026 10:57:23 +0200
Message-ID: <20261016085724.1031766-6-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016085724.1031766-2-phasta@kernel.org>
References: <20261016085724.1031766-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
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
 rust/kernel/dma_buf/dma_fence.rs | 69 ++++++--------------------------
 1 file changed, 13 insertions(+), 56 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index b67121c7abd4..9efb84c00b6a 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -42,7 +42,8 @@
             Atomic,
             Relaxed, //
         },
-        rcu::rcu_barrier, //
+        rcu::rcu_barrier,
+        rcu::synchronize_rcu, //
     }, //
 };
 
@@ -150,7 +151,6 @@ pub fn new_fence_allocation(
         data: T::FenceDataType,
     ) -> Result<DriverFenceAllocation<'_, T>> {
         let fence_data = DriverFenceData {
-            rcu_head: Default::default(),
             // `inner` remains uninitialized until a `DriverFence` takes over.
             inner: Fence {
                 inner: Opaque::uninit(),
@@ -601,8 +601,6 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
     // necessary so that the C backend can free the allocation (coming from our
     // Rust code) with kfree_rcu().
     inner: Fence,
-    /// Callback head for dropping this in a deferred manner through RCU.
-    rcu_head: bindings::callback_head,
     /// Reference to access the FenceContext.
     fctx: &'a FenceContext<T>,
     /// The API user's data. It is essential that the data only performs
@@ -973,59 +971,18 @@ fn drop(&mut self) {
             return;
         }
 
+        // Make sure none of the fence backend_ops can access data anymore.
+        //
+        // TODO:
+        // This would not be necessary if the C dma_fence backend were using a
+        // spinlock to properly synchronize its signaled state. Fix it in C and
+        // then remove synchronize_rcu().
+        synchronize_rcu();
+
         // SAFETY: Valid because `self` is valid.
-        let rcu_head_ptr = unsafe { &raw mut (*self.data.as_ptr()).rcu_head };
+        unsafe { drop_in_place(&raw mut self.data) };
 
-        // SAFETY: `call_rcu()` is always safe to be called. `rcu_head_ptr` was
-        // created validly above. The module must perform a `synchronize_rcu()`
-        // or `rcu_barrier()` call to guard against module unload.
-        unsafe { bindings::call_rcu(rcu_head_ptr, Some(drop_driver_fence_data::<T>)) };
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
2.55.0

