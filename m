Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523475;
	b=gRESuUdXsE3O6LR+Dn8Bu7yZKiCG1xPgX3WoYS1uUoT3aW83iAmC1o3PS5XhOo7tYYlt
	 iI1tZ6RXIB9ck/+NPsOEumdbjOxtVCWb97ey1azsJvb7n+crswtfGmj3mpW2fZUbpiaam
	 f18V1zusP4O4UiMqGYofK1EsplYUD5zG/4BJCJuKkvRDaiQxo/XQgA92p4DobotCnJwDM
	 O2H5gAtPHO45iXyZOnXG3bdX3nKBqUtcV6P/dIBMsrVofm6+0ZHIqKRjlMb0YOeBBk4H9
	 1BBmt505MnhhGTeV67qSont7ZgW73zqWD/nQLHmMhfwOgtyLScdTnko6DuOREq/89WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523475;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BhHK9+MR/OQZKom6aOPhq12F9TD7C4ERicWlg2LJXpI=;
	b=kL6HMu6RYQY/SL99grXt/0WSlOwgOV4acyeOt1kQYyu/VNIhVZox6Z5NiK9li+H8tsMM
	 eafsp+wJgdFMk4sYedBsOTeGF4iCZJCjRGRoIrYH7VroWYk7VWDgyIY1IP+Q7xWXBVDxS
	 UkI4QB0qWnEVFTrK0FS7yauWfL1ekobZsjYKQKIDF/lsjx8l8vlUHYoz88UPQFFeFnbjE
	 LEvmeCMpm022rSF5K2OJHUYewMwXsNC2Xb55E6rPhf2/WbtahgDBF2Lz770vQQt8T4wZ9
	 PmYeSIWr7FwF9G+5wisB1xIuCGsVmO5JGrf3Y0WsHDT0QCjOANAS1T7aXlUmP9XW0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bz/+xbov";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4FC606A32E;
	Tue, 24 Nov 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz/+xbov
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE061F000ED;
	Tue, 24 Nov 2026 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523475;
	bh=BhHK9+MR/OQZKom6aOPhq12F9TD7C4ERicWlg2LJXpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bz/+xbovzeFwc21FwtUwbnH+/NIoo1yEDBUPEr5YkDOZStw+fmB8D2YNitX2ihrSC
	 2IxaBCqhs9sC0amr913OifsVINpsIyHVYhXhSwuUY92XsMKkpL6xoWtXaIkoiTp8YX
	 vSFYpL838GlN9DMI4u6t2kySEFrrJ+PpbQpjChWpMslq4ahRLxKqeo+4Rd4+NMBaWn
	 4GaKePRaTJND9oH8iKr89jPp1AFtU5SwHFisVESAKb7wjjo39H7BKWK8jZN/mBzTTl
	 09jcixRKoMgfKJ/U2xIbk/z9TeuRRMYSD+x2EGu++Tcq0BIMYG5COuHjmvkJfHBI2D
	 7bqXvQevQNVpA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 08/10] rust: DmaFence: Pass result in callbacks
Date: Tue, 24 Nov 2026 13:29:50 +0100
Message-ID: <20261124122951.878199-10-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124122951.878199-2-phasta@kernel.org>
References: <20261124122951.878199-2-phasta@kernel.org>
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
specified by the user. These callbacks always get executed, even if the
fence was signaled with an error. The user must then be able to react
accordingly.

Memory ordering is ensured by the C backend.

Change the on_signal() trait function so that the implementor always
receives the fence's actual state.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 09bebf9c1e4e..e972b2e84b1d 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -299,9 +299,12 @@ fn from(e: AllocError) -> Self {
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
@@ -316,7 +319,7 @@ pub trait FenceCallback: Send {
     /// An implementation likely wants to inform itself (e.g., through a work item)
     /// within this callback that the associated [`FenceCallbackRegistration`]
     /// can now be dropped.
-    fn on_signal(&mut self);
+    fn on_signal(&mut self, status: Result);
 }
 
 /// A callback registration on a fence.
@@ -403,11 +406,17 @@ pub unsafe fn new<'a>(
         // embedded into a `FenceCallbackRegistration`.
         let reg: *mut Self = unsafe { container_of!(ptr, Self, callback_foreign) };
 
+        // SAFETY: `reg` is a valid `Self` pointer. This here is literally an
+        // executing fence callback, hence the fence is signaled. Its signaled
+        // bit has been set with a strongly ordered atomic instruction on the
+        // same CPU.
+        let fence_result = unsafe { (*reg).fence.__status() };
+
         // SAFETY: `reg` is a valid `Self` pointer.
         //
         // The backend ensures synchronisation so whoever holds the registration object cannot drop
         // it while this code is running. See `FenceCallbackRegistration::drop`.
-        unsafe { (*reg).callback.on_signal() };
+        unsafe { (*reg).callback.on_signal(fence_result) };
     }
 
     /// Returns a reference to the fence this callback is registered on.
@@ -686,8 +695,12 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 /// struct CallbackData { }
 ///
 /// impl FenceCallback for CallbackData {
-///     fn on_signal(&mut self) {
-///         pr_info!("DmaFence callback executed.\n");
+///     fn on_signal(&mut self, status: Result) {
+///         if status.is_ok() {
+///             pr_info!("DmaFence callback executed.\n");
+///         } else {
+///             pr_err!("DmaFence callback executed, but fence has an error.\n");
+///         }
 ///     }
 /// }
 ///
-- 
2.56.0

