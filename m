Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523443;
	b=JmGzEKFYNLZv8PDd7R/PzoZxd6tt87+t+5m+ASLKRck1xKsN1SMG/JJ9r57pZn5tfiw3
	 N+RZYeaCacKH6uuYC2sWoHcoUz+qY5su3gvLSjMvh3vR4/3daqpadP3RyqhS6E0+wfniC
	 kL0xFKxiioYReTyLyUoU1lNTeJiUqTrJlZiHepCJMQTd14x/KTboYoB3J+yVbTv9PlUz7
	 CfU6Ga4ClHgw6Aajd5ZNR9nbZ8nn8+ZSUn5etZqYYAdSkP8zv1J75AXl/Jq6niMfn3tGI
	 QzsTvrTGvj/QSA408/sdgLVeZUBRB7JLcLaH3NNFp+mu3idQZkms08EMP6X1clLQSEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523443;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	b=inY1uD1sfmNgG0XyfVJkLij1EDjYpWCMj2YWxCDYpJPuIjzGMKk4GitaKtdoQ/kHthbX
	 vnYGRziVdXKQ/Ei8xSxcHSsy8Cwv8eL3hIHJiWqj3srd63BaFHN7CztT6HAsy1hxSqtS1
	 +90V63p1LGkqVFwY6c5K3hhHRt2+77DycsWuuEQ4OAibm0sB/F+w7aeiyrR7O9WPOf5tr
	 2jTXDBqbEi+rOu21TdONt5PaCLZ8n2KAF6g7/ZT/+j3sCiAVsvhEHmSBb4t6L7QiAawAJ
	 tsah1L2rjJ0yDOttlh5JALZByW4L+f6QzdDzphQSM3aYslJxbwI6xNBJPki2+V6bxNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpOVPNyb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60CC606A32A;
	Tue, 24 Nov 2026 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpOVPNyb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1145C1F000E1;
	Tue, 24 Nov 2026 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523443;
	bh=CTC0NGl+gn6K/Ev7/WRzoi5Z9SyGzqqJK0cSV/zyFzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hpOVPNybI+v/8lIKWk/SKbYBPEY+v5ol2DoTeqWoyrAzTqM/96EyjxvwI/KM17fZS
	 DlJa5DqK2Eaa/lwehu2eNovDt8QznDVRZXdzTx+PiBoYpsyrRiv2VR1kFx4tIaEPxp
	 W1Jzgji96Db6z5S3+dtXmTvZN4QCbE6Urxx0t/wWzwXSJftghNqImSBhkLIp17SZvE
	 k94Pe7ZmS7VCJhnoPxst0s/uT0TETk022HNFayAtVaIU7qpAi5T+CLXiq1y6wzKqa4
	 J7/sU6n8p6vzfW6pdFdJiIPrm+he2FSapMdN8wfmlk3gJzGPEn4WFfBUCQOrC9MIlQ
	 6SEhvz/kP9T6A==
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
Subject: [PATCH v2 03/10] rust: DmaFence: Implement Deref for FenceContext
Date: Tue, 24 Nov 2026 13:29:45 +0100
Message-ID: <20261124122951.878199-5-phasta@kernel.org>
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

