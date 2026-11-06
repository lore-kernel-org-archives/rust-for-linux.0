Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974198;
	b=yN37X7ihqJn65O+Fj8ODsB5jb+3gMzTO6NLxMUNzDoWlG/23MMf1e6KqYpCEnnNo6Mwl
	 AfbuHbGaFnnDn6xdBmnhTW4N70nI+0pRXjDEnH6DRNpFmTHSuP1XJbm7XKrj+attSIYyA
	 0j84RshiY/aOgWCL5UMhNTwYETjY+Kd0xcdpIIUlMQIkxK6bDGAnDkX50LamnzW2MEYeL
	 H0q/Xi+D0jm3NToJXR1jUfatAqx3FNcNjllgMPeILJhCgtbXR4wMUFgDrcKr4VfM070CV
	 5FZYx8KYpTD12fyQAyGfRLdepkegThJpb4McrRnjScOVNctRf3k7eiKC34IbiWrBJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974198;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OyR+AgrLeRdx5lhIJBwIotjmx2B5B/rhxsMU+NAW1V0=;
	b=X9ZDiYwvtjvLC73Mn9z5kTJbl9l7jfDV2KGMkx/+QZIHFdRkulqR/vWWx9UuFsQWicNN
	 1bBiRmMqhb+4OmAQZEW6uv+CtsdKN7Jv3tBq5lSdiE8pmRTlL+oWQyFWesfD6qvdSNahU
	 8Am/yS+4fHdD/zWkVkbMnWjpUbcvKeCCazKX918uiCHKtyOl3reLCk7VcKI0+GSLScjye
	 oQUtFX6HzidmJ3h7fYq7xm+okIaCnd5nFlY8asVsy4t+h5qOJ8mRZQHCTs26VxvYehmyi
	 GLcyrRfcdYlq2bP+O4mVfCJG0RGcGY7J9zYol6a8v0UNiEsPxmvixthJtZAMqFwv6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BvA/SEWQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AC606D810;
	Fri,  6 Nov 2026 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvA/SEWQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875B81F008A4;
	Fri,  6 Nov 2026 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974197;
	bh=OyR+AgrLeRdx5lhIJBwIotjmx2B5B/rhxsMU+NAW1V0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BvA/SEWQI6nVWCKu0n7KCXoQYrGBHNdhUOkje0O+iyXtc8tsGWzxClVrYLSIRYcfI
	 YnxfHCYeY7HRUXg8vqNXeLPpxtMx9oZvO+TRWpTgFAuK2uSzLhmhF9SVFfu2zhpnzh
	 kENXdL6Issfd/VX9Ir0PlDQX6Opw5GJ6FphiP4Szfj7wAQ1KwChowdptetmBM8FLay
	 v9VhxGECJ+QqAOr2JATnawNFUL4JK7PTJatgi1N8cLYuRddgi7o6SnsHwi9v1YKHDy
	 mlBbHJEt5tmImqskn5WiCloeu4idpQe8Mb7/nrFaroy+lcm3NrHRqA/b5OQlm7D/ES
	 96uz/VusSSg3Q==
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
	Matthew Brost <matthew.brost@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 6/8] rust: DmaFence: Pass result in callbacks
Date: Fri,  6 Nov 2026 15:07:51 +0100
Message-ID: <20261106140752.520386-8-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106140752.520386-2-phasta@kernel.org>
References: <20261106140752.520386-2-phasta@kernel.org>
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

Since the fence->error must only be set before a fence signals, and must
not change after it signaled, we better acquire it with the lock.

Change the on_signal() trait function so that the implementor always
receives the fence's actual state.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index b0c0e32462ae..f7f9887b8502 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -293,9 +293,12 @@ fn from(e: AllocError) -> Self {
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
@@ -310,7 +313,7 @@ pub trait FenceCallback: Send {
     /// An implementation likely wants to inform itself (e.g., through a work item)
     /// within this callback that the associated [`FenceCallbackRegistration`]
     /// can now be dropped.
-    fn on_signal(&mut self);
+    fn on_signal(&mut self, status: Result);
 }
 
 /// A callback registration on a fence.
@@ -397,11 +400,15 @@ pub unsafe fn new<'a>(
         // embedded into a `FenceCallbackRegistration`.
         let reg: *mut Self = unsafe { container_of!(ptr, Self, callback_foreign) };
 
+        // SAFETY: `reg` was created validly above. The fence is guaranteed to be
+        // signaled since this here is a fence callback.
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
@@ -680,8 +687,12 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
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

