Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974169;
	b=j1lrVFaZhKD8APgAjWRfbvpF05TE3BVb9f5j9xMi4/m5PBXQ0P4gN3O8zcBX754Vz9/V
	 X/u5R7OREvhXU60u4iblIfNF30TNvDWAmHkSLqyIUAMn6l6ISx/FgMxbIX66zGnz91tfc
	 GlcSUXLuBL6GRBIxZSnzUpoPhJdvvcwasBnRBc/ED05Jo0EUJaoZzveRJykgjnNggouKV
	 /P8WzD/EMNQkTQdBgMTVpj/tLCqpV494zH7Gaj5UvkMSK6UWYygoXVCUjoWWfnFfctZZ3
	 WCLjpRtR6Mk7sWVDF1FMUVhrD8lAl3FmW3s41L6Rc/HY3DPro3OV88F8ishSHIIm+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974169;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	b=XJWTW+pDAXLhM+oAbkr53EFgJiH5MmGB5ziWpKzE6x5LG+3iGCglfHjVC6QhWsmV3NTv
	 oDTKHtc8nJYzdVAGN8IHM7mKf3umnDs3pebPpSl76oC9NjTy/R2qjb4R0Pw/eXDZmwiE2
	 DuCq89GIAJYGPH9Zt2Yp7hD574HeWAFesJFDMQXuA8nY6avjJNG3PxL5FTUip61YA93lU
	 707N8bB6oPSEM1gI8y/bjLNFyDbXsI3ixUOrSpoZfIQhVBWk1koPqtJ9Jl1Xol6R8/wA+
	 EztTciWOAORm2ci+9+/mgT62S4CqFuZaFj7rHz0ZSrr8v3XSNiyMZ7mkc8VmSX1aY1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km8FoWCe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E10606A329;
	Fri,  6 Nov 2026 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km8FoWCe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0681F008A1;
	Fri,  6 Nov 2026 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974168;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=km8FoWCegCel/jROzl61CU43r6GLLLMBkvvUJpUxKLjXJA63NyDeXhimKR4WXI/UH
	 3tINOaJQgyFyOUXm9m95CPTlHZEDk8ouCfBXtb2sZv9dAS9RIQByud6/twyM+3o05M
	 bKDvOdjXW6J1M9UE2bRV03itpdNUkOF1DSr3m+JOyfS2MZcXzxEWYHQbjET/ojOEp+
	 tXuHEoPWZLJ1O3AClYsK30jgLM3DQ4KIUKnqpQ2dXSyvjfJUoVR7xI3Bo6OqBGOgVS
	 bZLcvEQZDTcJqBAplZ759HTt+EiRJ2ZMfBXFymu3+DytE/xo5zPrloAOmwm1hF45Uw
	 CUKCBmZfS5MhA==
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
Subject: [PATCH 1/8] rust: DmaFence: Implement Deref for FenceContext
Date: Fri,  6 Nov 2026 15:07:46 +0100
Message-ID: <20261106140752.520386-3-phasta@kernel.org>
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

A FenceContext carries data, which the user should be able to access.

Implement Deref for FenceContext.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index a1d851656562..5300448882e7 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -86,6 +86,15 @@ pub struct FenceContext<T: FenceContextOps + Send + Sync> {
     data: T,
 }
 
+impl<T: Send + Sync + FenceContextOps> Deref for FenceContext<T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        &self.data
+    }
+}
+
 impl<'a, T: Send + Sync + FenceContextOps> FenceContext<T> {
     // This can later be extended as a vtable in case other parties need support
     // for the more "exotic" callbacks.
-- 
2.56.0

