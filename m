Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DD44781A;
	Tue, 22 Sep 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066309; cv=none; b=KwHwAlUG8F25eeh8YN6gQu6G9zQT6zyUZJAFJLJ3ZCPAAhBP2jsBy/x/9Id+9ec1o9epucV6S0aeM8Xnm6ZjNxPaOKSpbp3FMU9RM39nA3yiF99lBYlRMhOA7bmyVhU+aDKS3nLU6Suzq693y+G/3VecAwdAikj4WA7K4XLYsPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066309; c=relaxed/simple;
	bh=Quu5JpjsqB31b31e9ok9qojvyEBty9pRwvRIr3LlWL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYMG21XKhp+vzR/ZxQk1vmCWF4jMTjhmvQwDxs8plzEwTGJkc6Y8L1bHpId9ikL53q0DxhxDWBXQvTBxFdK4s4yFu/ztMJQGXhksSy1C/zlVt6i+82vuhCscCkxPwAVI9bkKQ34ApDGVdaByLUdcVgDB9IyRBVylP8raci9MNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIiJO9AK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIiJO9AK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0C41F000FF;
	Tue, 22 Sep 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066307;
	bh=/0PJ1Y0fdVdEdVlkEBVy6/bOil5nzH/MclyCeJ0MOyg=;
	h=From:To:Cc:Subject:Date;
	b=DIiJO9AKQSIhY95QfmUBDsITyFavLwZ05MHS+SSVN/tkFtADbFcb5B033hW53njGs
	 QG2r+EuwXHg3DBDA+w6Ek7SiCmKT5XGsaHvdS/si0o8Y8ItrVRbKyWUuiMIzuw/x5r
	 XdHjTcAHA/cvvg0IgL8D5Mkhc5GwX9oM557Lwpkeyyj0qFryDq5BH4RCG0Fb0WAWpa
	 KCV/bI12MprrZ2F8DCDrF0cCJrJTdjlphVfKKL3pVhjn7a3tkORtzT41UNAQeRhy7t
	 B+gqQk9IlQNAkhY4GjJEulgAYBe2+BKBvrO5p4kj5D7FTQeoe+NPniRluY7V9AGxgr
	 cTzC5/g27oKsg==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] rust: DmaFence: Remove static lifetime
Date: Tue, 22 Sep 2026 10:36:32 +0200
Message-ID: <20260922083631.444614-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A FenceCallbackRegistration can stem from another party than the one
that has created a Fence. Should that party forget the registration
object (for example through a refcount cycle) and then unload the
module, a fence signaling would run into the unloaded module, causing
UAF bugs.

So far, this has been solved by demanding that the payload data of the
registration object demanding static lifetime.

It turns out, however, that this is harmful because the static lifetime
bubbles up to all users, ultimately potentially causing a large amount
of driver data to be static, which renders the lifetime obsolete.

Solve this issue instead through an unsafe requirement which demands
that the user does not forget the registration object. This is also the
solution chosen by ScopedWork.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 18a43e1bb442..c3fa68c4df86 100644
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
@@ -326,7 +326,14 @@ impl<T: FenceCallback> FenceCallbackRegistration<T> {
     /// On success the callback is pinned in place and will fire when the fence
     /// signals. On `AlreadySignaled` the callback is returned to the caller so
     /// that owned resources can be reclaimed.
-    pub fn new<'a>(fence: &'a Fence, callback: T) -> impl PinInit<Self, CallbackError<T>> + 'a
+    ///
+    /// # Safety
+    ///
+    /// `callback` must not be forgotten.
+    pub unsafe fn new<'a>(
+        fence: &'a Fence,
+        callback: T,
+    ) -> impl PinInit<Self, CallbackError<T>> + 'a
     where
         T: 'a,
     {
@@ -693,7 +700,8 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
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

