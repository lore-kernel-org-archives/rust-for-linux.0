Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632087;
	b=E8AI46ULjBWcRVaevnky+0rt9v28gi/324/+Sa4XBDNJu11OI3WLqLIrF878/xxrKsx5
	 SgVWmsYeprWORbX5zRQfZj2tgrQTfTJHnoed0+5dInRHHaAr/C2l3wIVtfvPbUtLciktO
	 RpQxoIry0w7byhjS9N4vPLNAMYAbvUk7w9cN+eyTzGamKbTdP+myR27u2HGE6m50ges4O
	 Q50xV2e83oJYz206JbM3EzFObIzrH2Yo/SAxbZjXMxKSunijDah2W7PymuDoYIcI6f93N
	 Bc1HfgZzZLDAHbKNLiB+3/ShQWe8xyzK200YR8qlg6HNGlLRckOHOaDmZUOCjBZ3Fwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632087;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nbIBXMzmQWZlHkVrJLt2el9arFLvMWt8H0pfM2TvZ70=;
	b=wBk1Tb/eim/PzKntIbGccr5VmtI71VSkZaUXR8l58S/yrc0nvCk8fg7Kle0YIH0DgebR
	 ljS/OQu8FqCeRNR03IDwlt/IqoHWl1/HKlZM5etL938kB7msiuQqsAYwRIvEbnLlsj0pd
	 ltlfAgcFjdhpte4EZfJUVgXjXtQ8onKwvBS1Sk4UH43GnEeozk+niW46COLhMm6HQ4rz0
	 KXQH+ixUwMeg/7WqG12W9w+nlhYOlyGpOLOAWEi6oCyVBZjsCrRvGkOod1nw28bJVKhV/
	 LJRXNW5zUKS3DvVoNvMkYGAhZANH4caFzJDOtS89nkkYd1uQ7GYBu7mfn1adfcOx29g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ6AThzL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10C60A0FFA;
	Mon,  2 Nov 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ6AThzL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7178E1F00A16;
	Mon,  2 Nov 2026 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632086;
	bh=nbIBXMzmQWZlHkVrJLt2el9arFLvMWt8H0pfM2TvZ70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fQ6AThzLEEWi7nExBbcCZi3D6tD8DFAWlSnWil2Sv3ZuBdVXKMb5Yb6Jn/K4wmFRw
	 Hxg4mROQspxZSdJAMA/n5LdG3U7BIzvsmb+Wp6IdgKd4qAuimH3sc7u+aa58oElry5
	 wgso3TSznifEdtHRUixNcVQ9rcsGsjA2mGIEajrdTfsTUg/MlUEyyvDvRzPWy2m3yH
	 TKECuA9j+B7z9ZoMlmy7n80Jvv4diaBqjy3LH0bgt95eWoN8xbnE1t3h9BQm+ghqzk
	 70qPkTHR7ASmJPM3MdoaGpuMskA1J4EAH9dVIvAq7Lj3/USFoSPIkx4fYKgYjkiArX
	 pJhOHB9D+46Hw==
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
Subject: [PATCH 1/2] rust: DmaFence: Don't drop on signal
Date: Mon,  2 Nov 2026 16:06:17 +0100
Message-ID: <20261102150617.527772-3-phasta@kernel.org>
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
index a1d851656562..3022bdb5f7c3 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -805,7 +805,7 @@ pub fn as_fence(&self) -> &Fence {
     }
 
     /// Signal the fence. This will invoke all registered callbacks.
-    pub fn signal(self, res: Result) {
+    pub fn signal(&self, res: Result) {
         let fence = self.as_fence().lock();
 
         // SAFETY: `fence` is valid because `self` is valid. The lock must be
@@ -816,14 +816,15 @@ pub fn signal(self, res: Result) {
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

