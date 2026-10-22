Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686096;
	b=HeAgM2RmqdGDqFvzW3L0LoxOajKNhWrrcMYxeQ9a5JhfyOXJTsK4AOx6FRGzFRHUC3lr
	 Q1PeaUpy8wWo8kW7FHJ7FDZy3LZIYSpBnZOMCH4TD191sWSnE8UlwtUCr8JCNBLzdo+M6
	 1sRaBeDpJRIAJqowRPzJCEgtX1Zse97zO2DgD8WGru9GWBFJSeqF5J3x0DUAjlxZsy0OO
	 6nYQxNbAi8MSk3gqzZSK5AneKyp8mnlS4R33f3Rv7X1KCIRnVPPXPnWjLVc64+A1nDB8Y
	 WK3suE6Hxq9ChH5lywIAfTU4vp2EHv9xP+LNoDWOtd4NwFuO0VkWNDpjVDRUPA+dgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686096;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4oz5dX4tDBH0WqAQg9PhRE4xJRQGNmthSi52inKF9B0=;
	b=ycyEW/R7PMZT/3Kn2SNCitDoz0cZ9GOMpLxb51DdN8R4302rKU+oUUyezsFgt/BMHDB+
	 nnSQ8qgvBjfs2z/TCwTqDuBpLTa2PPp2j9yNkZ/YseQrp5HuvXz2uQ5EKvjWg4Tg8O7tv
	 gVAQxzo+kBJLpjP1gQsrHJusS8sVoavFplElXNs9AehHeB5L3QQ59+Z2OzcvyFlZWwfOs
	 oMSOnvkNs4ebDIjdGG36u9qzI8dE1VgAzsr61ZeSTioN4ux+iVktaabUoP+RF2PLmMK2+
	 7eqFj9G42uDPj4sm/Gwpl9UFqSbZVQPdYQ8ivTyjeoqjdKxeigAEMMueJ6z6/442BIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0+ksbiT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0628606A319;
	Thu, 22 Oct 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0+ksbiT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C008B1F01828;
	Thu, 22 Oct 2026 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792686096;
	bh=4oz5dX4tDBH0WqAQg9PhRE4xJRQGNmthSi52inKF9B0=;
	h=From:To:Cc:Subject:Date;
	b=U0+ksbiTduDU7g2VPa9NcaYlCjoPp3YwKe7qAuewXxTnZ2WM3riuNva02dkZl1mme
	 viI4fAYuREXSuzk+4O/BmscDrpn5zBD8h1E/h+qJ+YtREgZAi39VIHRZesMchcT138
	 BTyCAzoA6fsvM/0N2pETw3xQ3/3DKOfNeW/7Cxf9LIDKT5uqckkU5ZC8CAyT53dbWq
	 1npn+6BSTHY19JKrNLjuQHOTZbQzssdQu5TwICvdvDVA5b7kMFtCa1vmfobRl9vkjN
	 WqVyerElqLI55a+LMAcv6GB6yGOAYdRp8Mz4BebgLWyi1jyPbqKqTwwRTo+IWlOqEy
	 mxhJAXXM0kBUA==
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
Subject: [PATCH] rust: DmaFence: Implement Deref for FenceContext
Date: Thu, 22 Oct 2026 18:21:17 +0200
Message-ID: <20261022162116.2282295-2-phasta@kernel.org>
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

base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
-- 
2.56.0

