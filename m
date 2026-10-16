Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AC456E0B;
	Fri, 16 Oct 2026 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141077; cv=none; b=ujQusxBm2kIgfUEUmBEUWh3HYtvwFM5fDd5jPoc8anKwI+JKtF0h0ubfoWBmczjgQTF4HIGKdiYvlHgqnDekNjX6DcEhShH+UQfDtMNZrWnIme1pQRrFycq5nrjanXosIVhdhvrj9+8/Gm8UbJYb/rRbtkkYw8XobGGtL8V/IqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141077; c=relaxed/simple;
	bh=r3SsZSfnVKtvPKfDpj5cXNsRgFyj6O/G8Jvzb6iFHKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJWcvHyF7cx/ucJ61x/zfMTNq0iDoTp+hgsQ+muyF4fvNAoiKjlqTbA6df6zVvcb+VVOshdYymdjPgGDQDFeyAXOatrIRgOHYrhjuri0WVNly7unYuvYCyArJxqy/Z6RpId+1eBjGGWF0mEqE0h712zWLMDgkjhOVbw51A1BNaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTpO4VQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTpO4VQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0311F000C4;
	Fri, 16 Oct 2026 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141076;
	bh=IuD3niWZWj/SxlZGkAUiZZ1uFpmjslr0pgDLUkbJfbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OTpO4VQG/avpA0Go3uWAVMrWaP0dWPbOTtC0YS02+n4VHAqtck6+p44+ZB2tVsG9v
	 qPyDYB8BHkgatuUTHBXqSjLRzSDyamVHV7/yMkyoKwPQQ6zSkisxA3T+ti47Qx4KfV
	 b8ps71yc49kWsp6NLxSDGkOaBsS40fttjrwnB2cpBIJCBK6/LxI1Gb61tG5M2pR//e
	 YljtqExO5ulSu1Ga6EpIzzIlvVtY+ppWXZb1LPgIukJiwjRbeQZrXUZypuXUTmbTLO
	 MWxco9s/nYMYSUfvHGG7nLExdYb5cicrJ0rmgbFAarUc2U3zd1UUEKEURfYi5auld7
	 l1Ap0gtBxT8Wg==
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	John.harrison@igalia.com,
	da.gomez@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v6 3/5] rust: DmaFence: Don't drop on signal
Date: Fri, 16 Oct 2026 10:57:22 +0200
Message-ID: <20261016085724.1031766-5-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016085724.1031766-2-phasta@kernel.org>
References: <20261016085724.1031766-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
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
 rust/kernel/dma_buf/dma_fence.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 0028124e6aa6..b67121c7abd4 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -806,7 +806,7 @@ pub fn as_fence(&self) -> &Fence {
     }
 
     /// Signal the fence. This will invoke all registered callbacks.
-    pub fn signal(self, res: Result) {
+    pub fn signal(&self, res: Result) {
         let fence = self.as_fence().lock();
 
         // SAFETY: `fence` is valid because `self` is valid. The lock must be
-- 
2.55.0

