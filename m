Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974181;
	b=tP0V1cKvmhtuG9+JQA78JyVvnTZj7pJO8qiFWFsmKxSdIOYyWNaeL5KjOX8KTN2HQPH9
	 +fyvM/2bBwj+X1Ra+PtArsLIG4V7Gt0yp1NODUYuOrQZfiAK8SK5pJk0QthpypINZUCh5
	 m713myTH4GwJ7Qh5tYNgLbjzSF5HKBCTCSDzjXJiSnMpedVbcm3SeL31pA9TiEPgF0Non
	 3vuWiGl6Qe8Clx9XhjDHWqPSK1n7Ui6whGeFPno/98ZeOIi+eXT5tH4wFAzeC8br1ZQXK
	 WvBqh3/25oXCPxmgzMj/rqpbA/8AA4M6YfNn9ensCFg4Is8TPHZ6bSB0Zw/QcfLBthA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974181;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	b=2FUAJ78xiu/S8Tk6fHtl6IxKE4j7VWfk0ffioAzvjeNec633Isz98oHQqpZn9fi9Wl0X
	 WpuyF/8L2bjTv7W5Ix0F9vxWjbv+ARg2TIFt04sFi6hQyx6n1VxPIrmbsvGgR/PiHqsk5
	 DFf4PIX9LrhV4F0+qCZQ1PB7Rxf16Bv+QMu4IjlweZoQvUMQD90hMxP8/Pwa/xuwENRkE
	 c0otNMGRUd7SW4ySo4OoloDR9lad/3e3I9rc1ldqiEIfiK+AZhG8JnLeRXWOSg+K+4zjh
	 AW3iO4AzxqnQxOlhnbzNjF4JZDt2BFYjDNOfh233Gz+6VkkUob+f5+PLTEDnohNHdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbC6FZdN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD7606A329;
	Fri,  6 Nov 2026 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbC6FZdN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84051F0089F;
	Fri,  6 Nov 2026 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974180;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GbC6FZdNpYIimzsIiCgs9n3hu59KLkvEkzhGrmq8Z28VgdF//olD+VLVHx27gmMnP
	 MJuJeVOCLt41TH8uz6VfnGYDTU4KMWV/AavVFxN/CwEnrkoXw9BXMhb+1TsnZXlbZw
	 5IX8Wx95HOzkSDc9chq5lGhOVKhFefEvuBiw8m0qoq+5QKtbYmTTlm5b6uAnNcMGFg
	 FmCFz+KWpFBjk3iCSxUSHMX3SVoXx9Pu2wpln98KZVOvOLhjjnyvenRpTa8MW/BVr3
	 9EJTSQtnzqHuBYm35eWsKUL62VM+zcUV7hkTeKNBbnFlQ57rxu2zo5oaySSAUVdP77
	 YNFw0A5VjwEsQ==
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
Subject: [PATCH 3/8] rust: DmaFence: Don't drop on signal
Date: Fri,  6 Nov 2026 15:07:48 +0100
Message-ID: <20261106140752.520386-5-phasta@kernel.org>
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

