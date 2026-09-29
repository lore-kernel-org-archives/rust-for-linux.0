Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80936B903;
	Tue, 29 Sep 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679019; cv=none; b=rjlC8lQXDDUnco7kxq3J4stcMLNkGGBQs6WUO9Ti043mVdgWZ9jijzHklgK0kyTiuWo1qrxngp2nZ5ZoDTR9TMmj6BVGDwLE6Nh8Or1OfwbiJGB9GUuwiql3b0b8hvuXFNe3xExWXCQ767LHPuKyWLKSPBWUXuiGjcsXGyBdhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679019; c=relaxed/simple;
	bh=rRO0QPvIaMf5zTQzxf3K03LESvu0PgXC4aLW0BhAiiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOlpEqy/AQ9rR2qypmm/bOK+Rk6Ed0BbuK4p/M7eYTSyRTQbKykXd7WDfP2fhQf4LFiMEagU1W+Qs1RkCqLO8GYimvVtnGfwrw2vfrjeWGlsnSnsfrX9SbGqSl2P2RDZ7UOUQPmxdcvIdgdGdopFLcWn4a/svnpyYY3O/fcASsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX1F0SwF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX1F0SwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0907D1F00893;
	Tue, 29 Sep 2026 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679005;
	bh=QiQ3oCtAQFVoZ8VpJPXCtOe7WLKhJFhUDIDS4+CUyCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SX1F0SwFPJLo00M9irTamepuy5LaiSxXrDEYcxyysweVW7hIZswSrsrOmbE4q7kxc
	 hQsId7ZxjQSLcm2CCFK3VBhe1Q2z8dmuy8qe/qh7BJQM336ih+UN0D12TlKz8yggoD
	 xVTG/fYxxffWfiSYp1/lmgX2qIStV65WHqQox8cUOwlBvvo/oWLCTcercxw2T2wgbg
	 tPaBzIGN+TKoRDy8z8grg+BIWyLfAIFWU6gfPEp2kZbXFv0M3OSjeRSh1RIN3cnCbC
	 NGgGV1OS4UBaNTY4uyUfy3Ay1BaLLgGBJr3jMlmK7CUT02YCC1R2SQniiRx7o4HAQU
	 f0uiK897Bo0qA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Wilcox <willy@infradead.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
	Janne Grunau <j@jannau.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v4 1/3] rust: DmaFence: remove static lifetime
Date: Tue, 29 Sep 2026 12:47:01 +0200
Message-ID: <20260929104703.934128-3-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929104703.934128-2-phasta@kernel.org>
References: <20260929104703.934128-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(will be upstreamed separately)

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 18a43e1bb442..eef2b9e93f35 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -291,7 +291,7 @@ fn from(e: AllocError) -> Self {
 ///     }
 /// }
 /// ```
-pub trait FenceCallback: Send + 'static {
+pub trait FenceCallback: Send {
     /// Called when the fence is signaled.
     ///
     /// This is called from the fence signaling path, which may be in interrupt
@@ -310,7 +310,7 @@ pub trait FenceCallback: Send + 'static {
 /// When this object is dropped, the callback is automatically removed if it
 /// hasn't been called yet.
 #[pin_data(PinnedDrop)]
-pub struct FenceCallbackRegistration<T: FenceCallback + 'static> {
+pub struct FenceCallbackRegistration<T: FenceCallback> {
     #[pin]
     callback_foreign: Opaque<bindings::dma_fence_cb>,
     callback: ManuallyDrop<T>,
@@ -326,7 +326,7 @@ impl<T: FenceCallback> FenceCallbackRegistration<T> {
     /// On success the callback is pinned in place and will fire when the fence
     /// signals. On `AlreadySignaled` the callback is returned to the caller so
     /// that owned resources can be reclaimed.
-    pub fn new<'a>(fence: &'a Fence, callback: T) -> impl PinInit<Self, CallbackError<T>> + 'a
+    pub unsafe fn new<'a>(fence: &'a Fence, callback: T) -> impl PinInit<Self, CallbackError<T>> + 'a
     where
         T: 'a,
     {
@@ -693,7 +693,8 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 ///
 /// let cb_data = CallbackData { };
 /// let waiting_fence = ARef::from(fence.as_fence());
-/// let cb_reg = FenceCallbackRegistration::new(&waiting_fence, cb_data);
+/// // SAFETY: `cb_data`'s content is not forgotten.
+/// let cb_reg = unsafe { FenceCallbackRegistration::new(&waiting_fence, cb_data) };
 /// let cb_reg = KBox::pin_init(cb_reg, GFP_KERNEL)?;
 ///
 /// // TODO signalling guards
-- 
2.55.0

