Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81E14E5343;
	Tue, 29 Sep 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679020; cv=none; b=abqFh9VaVuA30nh/9fswINyc4UzYcimpHsv2CIAClQQA690mzE0Zg4o4C4YKhZqdQ1zIqaOk/9OVrn3FaNtHuH3bBPJv8ARknzujNWVNjxe61IPnoLfjtUsTYvgIfCD7hIqbr84hKjLYsfZywtTV2CU9I8hEObPvVEq+9GT2Ys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679020; c=relaxed/simple;
	bh=Bi93tTMddeQ/oitqBjzRaAkM1LpmL7MowJLqKb5A8pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egKQvE4+D+AujDE1VN4Smd64KdgUEIEmedFpdkES+DWYhj7T8uJ4hUbJVil3W3hb5avuFBXJxV4dEmke+pJCzINFZrgzEe7zgb4C0ZPpJ+/zbg3HVaHkl04GIanHeRfxK+9BCsBowdo1V2+ACqjFmegu6L6w/r2ZOhD5LRL1DDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nk4EY9jx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nk4EY9jx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4881F00898;
	Tue, 29 Sep 2026 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679011;
	bh=YvjiYYGb1HHkRI/noHetRX7tr+whhoEHSilSms9Fg8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nk4EY9jxMNWDGoxZC3G66Dp3JanDnxpRETJsDQt1p97+Aeho+GyxKgoS8I4RtoELx
	 oIR38k8OEu/UzPCaZMM0D44DCBbNHQ3SbGGIkPlDVOfjUMXToFqYYNBm8/17RBPYRI
	 wrpocHMqRrM2DvwBzmtUk0OV8TIF5MgyXmScKEKtpy5dT+uLVbPC1YPMKYiTtVStFt
	 mqTZqG1bNY0R1OXYvSlDypc2OXQgPFToYpwwQKPypzzJGLY+D3VXegXS0zJFsWYMT5
	 EMyEEgNK9ehc++mPslEgzTb5rHyF+DBFzZ+54I5PaMoHBQ8DqtpzHkxyu8SrlOxPEs
	 5JBQYdXZ4Zv1A==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Wilcox <willy@infradead.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
	Janne Grunau <j@jannau.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v4 2/3] rust: DmaFence: Implement Deref for FenceContext
Date: Tue, 29 Sep 2026 12:47:02 +0200
Message-ID: <20260929104703.934128-4-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929104703.934128-2-phasta@kernel.org>
References: <20260929104703.934128-2-phasta@kernel.org>
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

