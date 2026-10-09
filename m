Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB983E4105;
	Fri,  9 Oct 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573275; cv=none; b=u/SnP6X2R+jJpVsk9jxFcttAtZuEV/mFXCJZMIZsptsZ1MWZsux+FFVzm2E3xwd+iJj7H7vSW0c3Gpc2NY3d4JNSeCI6cwAcuHakKsYo6ECpUS2yGju0TusdPG68NGZTXvFlWd+xFiK0VeyeTUeRldA1ORAbZV22dZTJZVo6A24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573275; c=relaxed/simple;
	bh=Bi93tTMddeQ/oitqBjzRaAkM1LpmL7MowJLqKb5A8pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcdhyIYMILPtJElPqkkeFXlCu9VzwNlBZsPhS0Xfw5OymLFgHJ1PFu+GKZ+yhQf3rnMq3R4T/LJQi5+ex3DG8W0QJGjeWnRxW3tEQx4lQMCZ2bkc2loCQuBzl4bH2d3xMXLV4J4KiwZ4M5B2cB05Fj4fm5VXi2xJz9CcchAiAOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVbJbBkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVbJbBkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1991F000FF;
	Fri,  9 Oct 2026 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791573273;
	bh=YvjiYYGb1HHkRI/noHetRX7tr+whhoEHSilSms9Fg8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WVbJbBkGUFnTM16cyhJ0gwH4vvXpsiuVE9+nQSDccJSo62taThMkrlnLsa3YUfDYn
	 zoqfhjjPBrXD1DQKJUWooxwlCNz16LdxL7qFEaodiaHGzdOFTrBCzcdWcI8BAA4QTC
	 oGiRiLw/KaDUTjHV26ohLgmLNfj2YJ3mX1OJrqDTj8eZOL8nyo8nwVQrVGRjG7Lqvd
	 fsP4PADfegH28H0apXiVwic79QpavCXpqlTG9vynqedSpxDYzZHM5sT1BcatMBj0km
	 LxhxG+PfeCOKjMn1FBZrHBvyrMatUi0dxGmYJ5vJ15cujJpAe6pyzwv3NRhXDC1ZsS
	 dbJK9J5uB5YRA==
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
Subject: [RFC PATCH v5 2/6] rust: DmaFence: Implement Deref for FenceContext
Date: Fri,  9 Oct 2026 21:11:20 +0200
Message-ID: <20261009191124.1022902-4-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009191124.1022902-2-phasta@kernel.org>
References: <20261009191124.1022902-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A FenceContext carries data, which the user should be able to access.

Implement Deref for FenceContext.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index eef2b9e93f35..0028124e6aa6 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -86,6 +86,14 @@ pub struct FenceContext<T: FenceContextOps + Send + Sync> {
     data: T,
 }
 
+impl<T: Send + Sync + FenceContextOps> Deref for FenceContext<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.data
+    }
+}
+
 impl<'a, T: Send + Sync + FenceContextOps> FenceContext<T> {
     // This can later be extended as a vtable in case other parties need support
     // for the more "exotic" callbacks.
-- 
2.55.0

