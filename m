Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719968;
	b=lTx0rKe0rRfF/e+aVdxzN4Cf9wZ2nGcTj8AoU2omTVtTc2VxBJqF8AYYI5WLwx6+lzKT
	 EpNG4P0H43R8mlbGdkHGME5R0SjvwSIiS2V4gDh+Lk0rpYK/hw6ffS/c2HF3LZpwZlz1J
	 YKpyPD75VxVBFgH9uxlTkJBppecaTptf/6rsr31m5OZ1Bw6slyOArT/KWqeGXcrPFVFYp
	 NyqBastM8Kc2P1ryI2QfMNKmjYFrNVhSiYzOBnBbxVa/PVQkrjFRVJbv6eEr3pnhywx/5
	 alcGJ2wQRbJifmCGEZVsKdte2h5KEBkYT7DvTqBj/iLMhyKtBK7z26iDWIylamA+RvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719968;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	b=pKO5Q0B4n0VGpURtU7g1nFb8RPFodK7/gMJbcoGVH/IN6YnBVmxpVj++g/vTTrVuA8HI
	 US0FWvMSbKn+kYLmYSkBDaTwEMsEv46leKo2K2tYcp9zM7ScEcwUjMWUwX0DXhbHO7SXm
	 zZvwepjeV9qn+Qr50m97Vhn3VCSO7ezuoMHZqlpnsIwu/838c1CSrTqu3SLHTkkrKqBAg
	 +9XaFdXOBZiyTI4cMD6T21v5lESuighbFqfBPGhX/FAqVyzT/Sjz4PSVtqYucRDDAEWek
	 EKyT/9JpRvjRKSVjzQQTGxA5RVeSCS7STU4EhqrT2odVgHqr4R99QljVSSVe5Ys1SIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0yxTWAv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E587606A32E;
	Tue,  3 Nov 2026 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0yxTWAv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669A71F00A02;
	Tue,  3 Nov 2026 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719968;
	bh=SCU/DvMkSxwxIfic3xBnQP84VqPgPVXH8KbJhUsz/5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B0yxTWAvVolr4lfh0X1ZwxIq0xJgv3B1SG5Lpa3EB5zqO3VDQLr5VHMN9Du1ZCJt5
	 GoVyU01HMg+T/rP2lQb5iEJE9ZDd5+MxtcYd/uQhfJdTaXuJ/5p7lNmDU7RoZzAWzE
	 5pOOVJT4I8lhSGhHgoTWH22yyae0N6KC81DTrN9EIrhi8+10GJqA9gIAmVJzWU83il
	 NWQ/CHKnNDGpP+0Zenod3OFTN3vUmx0ig8MI95u6HQDG7/6aIiiB7Mz7BoqVXeXF1P
	 ZFp4RUFex8uVpT4vhOp1InWCrwld24ZcLr429cMw0KzE/Lgw5+MWEdjAic3e/qFdK9
	 1dzSAFFcjYEhw==
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
Subject: [RFC PATCH v7 3/8] rust: DmaFence: Don't drop on signal
Date: Tue,  3 Nov 2026 16:31:33 +0100
Message-ID: <20261103153138.1087330-5-phasta@kernel.org>
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

