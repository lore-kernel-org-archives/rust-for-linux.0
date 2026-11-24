Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523456;
	b=wHnASwoN5udPBlbRr5+I0JxGlT7OpBySu5OX9Rc0Bf31wU+WIhTbZYfE9YwTCTsl2eON
	 bsM4epOktNk4JSQz5s85XSE7MAYML211bjb+tpdYL8SFzEzus37+eeNmGRlms9kh7Qy5x
	 Evx6xlfkxxQvr6e30zbcCDyTJM1lTwWB3sW2/61nmm1jl+2WFTYGwZnzQXPhAxtQBKVCd
	 0C3Iq0WI83il55KZCwPzeAeJVFOEIfXRHo4i3qBAjOT9UbkzBkBCy9PXuf2q1GS6qSUXr
	 yVC76iEyJkcLgEgJjGMkjHOQ8gFyfe614aD9E2wf/4HcP07un7AzSkcVOPQdjzd/1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523456;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	b=LOt3D9JYyJiC3R75w+bY0DCcxkLXqS4MdD8XHE4HVSaStq1j8Gx5bTZCnnGKHIKr2ivS
	 kz4UnwXxIghrqnXGgLPnIRhj87yJbhCWxkMW/RLVJJGtyoUyTP0TwaEwW4NfNV2a4Evxb
	 84+Pp8ZL0ZHhmknx0fJWozC9lvetb45sOJetnPCLL9YXWA2LctiM33hv83bWisX0e081G
	 4pzFDoT6m6lzT2lU6KIMRU95mTEHWKsIzXbSEpi/OyKKhlUB6YIXa9GNuaRO8eXBY16HG
	 FvRhJhET4TQLV1KRnFpTpGSAlcYcYXPqDQpH6yVzpad1BqESHTxpIMlma2Yxv9nphkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah9rm9kk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AF606A32C;
	Tue, 24 Nov 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah9rm9kk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7A11F000EF;
	Tue, 24 Nov 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523456;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ah9rm9kk3qqc63HshSpfWVXkf+OkTHyqrqGNgKCcJ8Q8NLLHsUW4cSlvsfhyMLb/1
	 cJHkqYOo6JcxcfIrnHr8i5skcLb3TBHCrbzOSmlQ0EUaPGNS/wHBhGESJyoFlYW6vO
	 bPOqEvCZOTu5f13cLb5ZyV9lG7axuRHvTwWQRKqkUrtWRAgykLODUnh23xBwu/xzse
	 ekSqBP8QxMgtO3Nf1kfuG4YrtHumf4i7vSVrTuMoT/j0XlSAWCXiAncJTMtdoUmVYr
	 kz8P+OHuE5C0/PQDkNNuHNfgqD+I2/bzf4xrHMtaSPw283sxGXYkSAwu3ZSMn/z2os
	 TahD6hWCVDMrw==
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
Subject: [PATCH v2 05/10] rust: DmaFence: Don't drop on signal
Date: Tue, 24 Nov 2026 13:29:47 +0100
Message-ID: <20261124122951.878199-7-phasta@kernel.org>
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

The original design for DmaFence intended to comply as strictly as
possible with the "dma_fence contract", which, according to some, says
that a fence must only be signaled once. Thus, the implementation was
made so that a DriverFence drops on signal.

While extending JobQueue's capabilities, it was discovered that this
characteristic causes - unnecessary - trouble: fence-data must be
dropped in an RCU-deferred manner because the C backend demands that.
However, fences are often signaled in atomic context (e.g., interrupt
handler) where you don't want to drop, but signal as quickly as
possible.

Actually, there is no real hard reason to enforce that a fence can only
get signaled once, because the C backend is robust against multiple
signal attempts.

What is decisive is that a) all fences signal and b) they only drop no
earlier than 1 RCU grace period after signaling.

Don't drop a DriverFence on signal().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 897308f60dd3..c04b68fe67fe 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -820,7 +820,7 @@ pub fn as_fence(&self) -> &Fence {
     }
 
     /// Signal the fence. This will invoke all registered callbacks.
-    pub fn signal(self, res: Result) {
+    pub fn signal(&self, res: Result) {
         let fence = self.as_fence().lock();
 
         // SAFETY: `fence` is valid because `self` is valid. The lock must be
@@ -831,14 +831,15 @@ pub fn signal(self, res: Result) {
                 // must not have been signaled yet, which we check directly above.
                 unsafe { bindings::dma_fence_set_error(fence.as_raw(), err.to_errno()) };
             }
+
+            // SAFETY: `self.data` is valid because `self` is valid.
+            let fctx = unsafe { self.data.as_ref().fctx };
+            let _ = fctx.nr_of_unsignaled_fences.fetch_sub(1, Relaxed);
+
             // SAFETY: `fence` is valid because `self` is valid. The lock must
             // be held, which we acquired above.
             unsafe { bindings::dma_fence_signal_locked(fence.as_raw()) };
         }
-
-        // SAFETY: `self.data` is valid because `self` is valid.
-        let fctx = unsafe { self.data.as_ref().fctx };
-        let _ = fctx.nr_of_unsignaled_fences.fetch_sub(1, Relaxed);
     }
 }
 
-- 
2.56.0

