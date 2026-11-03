Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719958;
	b=ut8wtebFATKiXGelv1hlGDkc5DgD21twYx1Rwz8Yl60MeONztMJrfgPwTSj/sIKwolPn
	 t2wJME6mNnQ7eRmO/dOqYkBnWqZbdl1nONVUg3zx/tj4RcFJZjF29rshhRXMGUsM4nV2J
	 TM1pKRK4zDvbTWVCcAHdvwD+xjnJ9Un45/tP09f2k17fQ+nWbYcVgfQiTvRtY19q13x5e
	 YuhPuZVziu96EM5RY2SRejA+i5hQnUwDF0PgRKTX4cyhBoHbryU8WS0/L75xPC/I2SuKl
	 MGADxAtYRP43V5RWm03k+XGVirlwnc/Gh1XdA4Z/VVZyTYtM3LtCdeGBGgQZuLLxtIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719958;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	b=Yaiot9Cz7VSFD6OD75tlS/Qy4lcD60aBciPkdAmtSDEykSqbaI7m8aK7/EtUIzb2pVE3
	 JajOgkEhbkeHC3P8sjudBFP+owmXLe+pnc8LMtscdTi5v4M0O0TfjeT9Lz43Xc7eYdCC8
	 Ijach2sUpGnE8oU/yVGWrcU348ivN6e10z/1OZ/xb3FB2IFWU4iq2LDZZdJKOROZeuGKz
	 rX2X1wxiLZjaLBiQHg84ZCum0X/c3sLCtGUAoezAN0PvrFY3q8X4WndPtHrQ6LHk1SEKR
	 cLzqmYrFg901yo/8ulAzNbnWFp+9Vqs6uoOePcdUo7gIMblTJrMvi8Nta06SmWysSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzVPe8iO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D2606A334;
	Tue,  3 Nov 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzVPe8iO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEDA1F00A16;
	Tue,  3 Nov 2026 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719957;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VzVPe8iOs70piLZ1J3/guI6ECrDAgUg7jhdGOMfNTMoiHm/z+XpybtOdyVyVgUU4p
	 Q2Zkx7Hp2guHXsp9OnuNshn+gEYLNX2S8zXY3OXCiJyLaaH/GX9SHJPrDZbko3QCCf
	 rLMAbkrqUlSI0M1jP5B1vvBv66QACpJXAhi06WeyBlaxghoAJjXcOmjGsSCOhy58VR
	 oqSw3lteA24pk1SiqC9BYuW/x3w9GRUJVvox1RQHw7ANFw/s5L3FFNumZqfezrKCw+
	 stM/65rcsM0/8rmGW8DZYL78zr8pZNbWY3B7MMErMbKTR4zC7GKw72kFYXaM8BZ2O/
	 IEnar3lNxgy9w==
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
Subject: [RFC PATCH v7 1/8] rust: DmaFence: Implement Deref for FenceContext
Date: Tue,  3 Nov 2026 16:31:31 +0100
Message-ID: <20261103153138.1087330-3-phasta@kernel.org>
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

