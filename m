Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686439;
	b=o03PzVF+I/2j7MrU+I183e6YJu+Lfna/csNz17RCr3KIiqDGrAzWEP38AcHiWlllbHhU
	 E5N0QbVOZHsMdlHfnYEoEgA2mTZ3qL0/XkknKm5C5kEdwGwL/xbLgCujrVYSH85n0BNFl
	 oOOFNvFnbDQNJHr+aT+Yw8A8fWcCPk5Gon9r8yzVd2hatJGJed78h46IKEvPahZaoyn77
	 I0yCw2scqg8gO0D0Ovd2HT4ccGHNLF/XFRGd/U5VNh7P4PCZI5ZskS85dpMY8LO5S/SU6
	 2CrdUpjJwvz/katPcbNnImLA4jO/2qrHyBJN0PiLd5H2A5or4vKwvBd1wCLkvey7S4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686439;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1gaTKAWNo5zd3KFHzEp92l6xFt453cp+GsDCAPAz/9Q=;
	b=lS7/zuBXqQtAHOSIz+r2A79Y50b3XegTu5jgrrh3tx97aawDjnegJD4jBStTya/HJ44H
	 5f2KqAA1xwu6RVKS76mjgEALi8s9iAEft4muDRhhuM7EfywobTSYD+mD3CtQU1/pmwjFF
	 xqL6NFrqVcwc2a1tDbDofjN5aRWUHc1bB7ybPN/zZlHgNc6pNYprdNuhLLc9dHTwhLOgs
	 8w46itLTjeYVn4u3e9VUZsUz4p4PgZu80w308WDZfPqh9X10okSmKDBSM/5Tb+QTn4w3S
	 KNH74muTmeEU999KXRFcJ2iyu9fDGVoXQqsEbw1EGno/20ajmBoVHiUpcZ5RRX5ulfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmiC120B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F17606A31E;
	Thu, 22 Oct 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmiC120B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026B71F031ED;
	Thu, 22 Oct 2026 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792686438;
	bh=1gaTKAWNo5zd3KFHzEp92l6xFt453cp+GsDCAPAz/9Q=;
	h=From:To:Cc:Subject:Date;
	b=FmiC120BJNiO7YlSbc4PgGjMkQw0E75g6JOvlm36vGn1x6c9hLzbMklFw0RiKQjSW
	 NlQDR1tlfOcUACzDvJj9BOTi9dNTMDmLRodho6GC7z0xFLZdQxwLGWVeBb2CYCeFov
	 ega7CYUO0VM3RJDAHVSF+jsTq0hCMZ2yUK/rJw6QxdhQLTu7LM9zeHPuA03t1oC/SL
	 JdkKAOwM23jdE859EhCy2Tm4IqPz3mDg+udnxcY4IuAolHJZ7vgM8n+w9V2wxE6P9B
	 0PVLoDOeEuk5pxgzZk634t+VJa1XStH8qjy0M0eSZlTZLklrX9iLaut/J7szDOBwjD
	 DG5piyghkc5zw==
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: DmaFence: Don't drop on signal
Date: Thu, 22 Oct 2026 18:27:03 +0200
Message-ID: <20261022162701.2297062-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
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
 

base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
-- 
2.56.0

