Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A9391E4E;
	Fri,  9 Oct 2026 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573288; cv=none; b=QXtK1AHkAmxgSpxtQx712d3s8iWIUHcOgD+frh/v2TTATEYSs8X9szl5x6EiMS6T9mwiZ/3mZRDPbjlQNS14t2gnJTL9/NZ37JsolaQ9o6VcC1TuhQFCtQX/zbHNfs+ZbRqB90zQH2Y5gs5tzn6paYVqc+7Jxk+//T/iGLAhZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573288; c=relaxed/simple;
	bh=KKoFvbyg0+9mjKL3sKF/IISp5MAsaiUTRhmFY0zc1so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbnLa6iWLLgxNIvScNXnbdXMkp8dsONPSTw198XUCDPtPbSFa+vlZbCsnCbTqqox1LX3nZDvTK7k2nnnD+VobgsWEmKH5nRDdDto0VyHDcebyhzMQbzjVudRmNlc81+2aJX0YKg7XauXbi40U29x7GaXedxkIwE9Xt5CLhzqvkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRpNgja6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRpNgja6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4901F000FF;
	Fri,  9 Oct 2026 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791573286;
	bh=OQVIkEMlfvanf7IyPaLdU1BLpFST40q6lx7MOgUSylg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZRpNgja6Gm1HIQ+/Fk9vQcuOC+TXVtS6rFFH7RkBXsuj+0yq5c7ApC5eqbNSg7cAL
	 fJwJx8M7xT1At5+bOsAWxSB0tbk98QHtGJPG+9VG2k5rEX+gdZkziUUYl/Em6TflpW
	 eCVzrrVT6VWUi9N2kvZRpx4hKw2vA5ih6mOlt0Ehfqy81JP1Dnb9J0fmzeUPtpqwfP
	 P6B61xHW4G6sUp0YdGPVUyUhU9kWtFEAnETZZ3jpaxtXvViiWNWYgjWMs9zOiXYgPL
	 maN+DgJ5GXH0Z+RQdLW4M6lTStKXOGDxa1apYZqLsTFMWpFl3BT7RjrbG6oOalVbMJ
	 L7dmb0+FpVMPg==
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
Subject: [RFC PATCH v5 4/6] rust: DmaFence: [RFC] Add Signaler
Date: Fri,  9 Oct 2026 21:11:22 +0200
Message-ID: <20261009191124.1022902-6-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009191124.1022902-2-phasta@kernel.org>
References: <20261009191124.1022902-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depending on what the JobQueue locking design shall look like, it might
be necessary to be able to signal fences without having to access the
*locked* data structure the fences reside in.

Add a Signaler type to achieve that.

This type is not yet used in this patch series. The patch merely serves
showing the idea so that we have material to discuss.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 49 ++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index b67121c7abd4..4e9b4a6a9471 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -590,6 +590,45 @@ unsafe fn dec_ref(ptr: NonNull<Self>) {
     }
 }
 
+/// An object that can signal an associated [`DriverFence`], independently of
+/// that one's lifetime.
+///
+/// Use with great caucion! Only the producer of a fence should ever be able to
+/// signal it.
+///
+/// This helper is necessary to signal DriverFences that are hidden behind locks
+/// which cannot be taken in certain situations.
+pub struct FenceSignaler {
+    fence: ARef<Fence>,
+}
+
+impl FenceSignaler {
+    /// Signal the associated [`DriverFence`].
+    pub fn signal(&self, res: Result) {
+        let fence = self.fence.lock();
+
+        // SAFETY: `fence` is valid because `self` is valid. The lock must be
+        // held, which we acquired directly above.
+        if !unsafe { bindings::dma_fence_test_signaled_flag(fence.as_raw()) } {
+            if let Err(err) = res {
+                // SAFETY: `fence` is valid because `self` is valid. The fence
+                // must not have been signaled yet, which we check directly above.
+                unsafe { bindings::dma_fence_set_error(fence.as_raw(), err.to_errno()) };
+            }
+            // SAFETY: `fence` is valid because `self` is valid. The lock must
+            // be held, which we acquired above.
+            unsafe { bindings::dma_fence_signal_locked(fence.as_raw()) };
+        }
+
+        // TODO: This should decrement the nr-of-unsignaled-fences tracker in fctx
+    }
+
+    /// Get the associated fence's sequence number.
+    pub fn seqno(&self) -> u64 {
+        self.fence.seqno()
+    }
+}
+
 // Necessary to guarantee that `inner` always comes first and can be freed by C.
 // Also useful for using casts instead of container_of().
 #[repr(C)]
@@ -805,6 +844,16 @@ pub fn as_fence(&self) -> &Fence {
         unsafe { Fence::from_raw(self.as_raw()) }
     }
 
+    /// Create a [`FenceSignaler`] associated with this `DriverFence`.
+    ///
+    /// Use with caution! Only the producer of a [`DriverFence`] should be able
+    /// to signal it.
+    pub fn new_signaler(&self) -> FenceSignaler {
+        FenceSignaler {
+            fence: ARef::from(self.as_fence()),
+        }
+    }
+
     /// Signal the fence. This will invoke all registered callbacks.
     pub fn signal(&self, res: Result) {
         let fence = self.as_fence().lock();
-- 
2.55.0

