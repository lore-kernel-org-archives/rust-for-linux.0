Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59AD45C6E0;
	Fri, 16 Oct 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141075; cv=none; b=mkM2zx3vtWzNnXyZJZtY7JooyxDm1MGtGWeJLPTLaf0mPQhLA5auGsXETRkh56fWdQrAnlQ03mIsE87UHxDsIy5ZKzV8dzrZN3mE/K/HJxOrnWYcYZz9goVf10/Bb3IqwbA/DhSnwowZanIxNq+PTBd684Qitv16iIav4T/VVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141075; c=relaxed/simple;
	bh=Bi93tTMddeQ/oitqBjzRaAkM1LpmL7MowJLqKb5A8pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ9vOXlama7pI0TYA6EZUPQPiDQyPV4p3Q33dE0lvnTeDqESf04c1dK/NrVdp9nwJFdH2QK8ESavjlyetu7METW1zp5b0kvk+U57nxRw63sGyZDzwC+vXHqYag+doeUfFMqdtYLACeCTqD99a2PDLF+EO9DjJext3WDy7G6+wOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELOBqSB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELOBqSB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86D91F000C5;
	Fri, 16 Oct 2026 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141071;
	bh=YvjiYYGb1HHkRI/noHetRX7tr+whhoEHSilSms9Fg8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ELOBqSB2KVz5K0YP8VRPomyj7a+8EhI/F0Mm0QOMtV3k2DXDF0S6U8UiwSaqkU+1f
	 eEWPjzg18QPDpk/b+IoFG5rhFIifOfT2zmA/FMeTFLFLKmfFtDTeHiOeRd2EBK9WgW
	 7VvkL4mwf+yLENwfJSI7atHhpDeGi2oiPaG8l0GRiHEWzo1yazxroKFc7cXUTfUelQ
	 DA0egYCxL8SfJ24Bdy9ve3FY8B08oxEz+GEKtyp5L34DFGb8EgmXpkePzzDSfZVefa
	 qpFo8dvDnyk5nafrL+8turIhpxCFQY0px+sVKIVLyzBp5tLyd4cUmVklS5p8Z4UAH9
	 Knj6pNEynnWeA==
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
Subject: [RFC PATCH v6 2/5] rust: DmaFence: Implement Deref for FenceContext
Date: Fri, 16 Oct 2026 10:57:21 +0200
Message-ID: <20261016085724.1031766-4-phasta@kernel.org>
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

