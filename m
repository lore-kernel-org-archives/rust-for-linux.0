Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719985;
	b=CG9PeEinNCKr6gC3C2Ugoqj5QQiZcdPE69LxV+2O/CF3Pych5Lo+iRhcVotcdIz8SY12
	 8uB+ABjKNRNiyn/Yll3woLL+V9ovSOw8lpDP72QOuIOLGPG67sC9XWNtH+EnTRQweCevD
	 nzNuDivErixPSqVxwTvCQFC0xpNlgYPq2voSiWnlQfd6JqfPmUElGonzmk9TSSWRSbJjz
	 IUkgHjJL2okoRJtW+sjxxwNtIDSrbiDKtl2Qs29Zz7VaAkmZS+tbUSDlB/rBo9KyND17R
	 UgSpS9yqmSnwc6OeEaTE5dwDUJ+ycJ3cufjYIgyo1RvAT5Mv7+jocIitUpdWpzrM47w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719985;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vVa2LUvdBpdByYvpnwtRSMfp/8FgFZVL6sNFqsj3PfI=;
	b=3wVBqZkZrzG/E67NlMeijQRgPmcN0hMMemCTH6k76aSGRbitJwuTSxJyGhXpKII5q+cL
	 cIJaeYUjseKl9mdLBpsH0O3Hsa1xPYpPnJkSxj6IKcwIIpSkWK8Dro9+HT3envxB6PWW6
	 GdSENoiC4UoKGhfAjw9BrOA06Qeqqy2fxMSwQ//KquLDJxiFaadfZox5pJlprwTy2vA1i
	 pCM0pSMndn5g/kBeWPfA7OPurCe4SJi2xin3rG5XCZzT+bAb++0Amuom4G/OfdbbbRX5D
	 JpJ7S6lUbTVnVe8tlDaTjk2F1fDkXW/yvmMhc7csRBdtw4Hpzppj8V3IrxesjNGD4JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rgon7FVn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E56082BEB;
	Tue,  3 Nov 2026 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rgon7FVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1A41F00A23;
	Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719984;
	bh=vVa2LUvdBpdByYvpnwtRSMfp/8FgFZVL6sNFqsj3PfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rgon7FVnYEIWjzhIW9EmBLM1fvkOQj3UBG/z8F5dL4E6WMLKerC1MqVKXHYscU3X0
	 uNEwBPiiBGfKMUGiaXrSOhwZ21UgT1Wmqg3Z4sH1/QgkJm5RtxuU56Cx7jE7E2ELym
	 Iq11ODcYtJBoGvuoBoDbR6Q1sr2WqyjJC96IHeyAz92Nj3wKD1mCFKQyGzE+Qp5bz2
	 8eY2RYZV5GmI7Btwr/YzWiHKujYMOzyZ/s8bQxEVgpLVjHDkMscCit3Dx4J+uknPgf
	 QxgrYuGQ7uS8rMxBmM/AouLmAxX4DYwSjfDRIQuihn5rxcxYK5uSU0oiTZNFVr4NHg
	 eUKCsuvb3ZcAA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v7 6/8] rust: DmaFence: Tell results in signaling callbacks
Date: Tue,  3 Nov 2026 16:31:36 +0100
Message-ID: <20261103153138.1087330-8-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103153138.1087330-2-phasta@kernel.org>
References: <20261103153138.1087330-2-phasta@kernel.org>
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

A FenceCallbackRegistration invokes the on_signal() trait functions
specified by the user.

These callbacks always get executed, even if the fence was signaled with
an error. The user must then be able to react accordingly.

Since the fence->error must only be set before a fence signals, and must
not change after it signaled, we better acquire it with the lock.

Change the on_signal() trait function so that the user always gets
passed the fence's actual state.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 71965b26e148..c8856dbed0a2 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -291,9 +291,12 @@ fn from(e: AllocError) -> Self {
 /// }
 ///
 /// impl FenceCallback for MyCallback {
-///     fn on_signal(&mut self) {
-///         pr_info!("Fence signaled!\n");
-///         // Handle fence completion
+///     fn on_signal(&mut self, status: Result) {
+///         if status.is_ok() {
+///             pr_info!("Fence signaled!\n");
+///         } else {
+///             pr_err!("Fence signaled with an error!\n");
+///         }
 ///     }
 /// }
 /// ```
@@ -308,7 +311,7 @@ pub trait FenceCallback: Send {
     /// An implementation likely wants to inform itself (e.g., through a work item)
     /// within this callback that the associated [`FenceCallbackRegistration`]
     /// can now be dropped.
-    fn on_signal(&mut self);
+    fn on_signal(&mut self, status: Result);
 }
 
 /// A callback registration on a fence.
@@ -395,11 +398,18 @@ pub unsafe fn new<'a>(
         // embedded into a `FenceCallbackRegistration`.
         let reg: *mut Self = unsafe { container_of!(ptr, Self, callback_foreign) };
 
+        // SAFETY: The lock is being held by the C backend.
+        let fence_result = match unsafe { (*reg).fence.status_locked() } {
+            FenceStatus::Signaled(result) => result,
+            // Can never happen.
+            FenceStatus::Unsignaled => Err(ENOENT),
+        };
+
         // SAFETY: `reg` is a valid `Self` pointer.
         //
         // The backend ensures synchronisation so whoever holds the registration object cannot drop
         // it while this code is running. See `FenceCallbackRegistration::drop`.
-        unsafe { (*reg).callback.on_signal() };
+        unsafe { (*reg).callback.on_signal(fence_result) };
     }
 
     /// Returns a reference to the fence this callback is registered on.
@@ -678,8 +688,12 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 /// struct CallbackData { }
 ///
 /// impl FenceCallback for CallbackData {
-///     fn on_signal(&mut self) {
-///         pr_info!("DmaFence callback executed.\n");
+///     fn on_signal(&mut self, status: Result) {
+///         if status.is_ok() {
+///             pr_info!("DmaFence callback executed.\n");
+///         else {
+///             pr_err!("DmaFence callback executed, but fence has an error.\n");
+///         }
 ///     }
 /// }
 ///
-- 
2.56.0

