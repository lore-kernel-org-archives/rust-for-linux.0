Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778323;
	b=v+c7/xT2//s2lfnUJot5vLHzsY4o1M25l5giv8dTsJZBBC1OIqo9YyeW3q9A6DS3m9Qg
	 pUGm/8TX+ZPVHqx/B6W2UWZBLyAngaA9Y0+0wTQKjCkpHCxQUKoUMyslSf1ONjpNX2MaG
	 zPEiXDDNZ6KTAXu/6cdhMMOYPZrhAm4FDCdASelRtUUmCLVa/8a/Z2+BYmOIVzxk6ieJG
	 DVQR12JusjqTec9/RUZvG/fML2tHtOcf9hkAH1IKZUKAVBhM7n+SGB04KXgBohDBurR/H
	 BS+I5BMAx32VWvPqKETthi76YgGdPVgHRzARR/ET1lJWTaRh91F76jJlBQbsvA+vTLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778323;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rbckzzyzIkFqZpi1BADHlyG5EWbCbTqZ1QrQLEtCk1s=;
	b=hfASWEpywHXAdZVGQqynsmatLwiWUNjig68JrFiHfPU7AVQ/pewqj7tMrymNSmvO3Ru/
	 tccQMyMbOn7GjFcof2wLYdgrTqN5jDLwMLOFafNCyEYsexo9+4DKehRnp8kY4rJZe0NAz
	 uc8jPcHpICS22j+/V4zdUG+RESqWYo+aQJXwKJ8OKSo+/HQBlSI5RT5BmkI5WvG4O4lrk
	 4f2n2RWKZ6ZBFlo2zUrDr9e9/Gsr5ieVqEZ3S3akK6aLqH1eKa56Y77HBEW9IHgYyAxE0
	 oR0z66BSyl/Y3jYSohZkwwpoLspfhZS+zFNlCVM9bzQeYTpwCkUN6h4D3/hLKwadC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3aSYYbE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAA8606A31A;
	Fri, 23 Oct 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3aSYYbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12221F01829;
	Fri, 23 Oct 2026 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778322;
	bh=rbckzzyzIkFqZpi1BADHlyG5EWbCbTqZ1QrQLEtCk1s=;
	h=From:To:Cc:Subject:Date;
	b=l3aSYYbEdOUtAjoqARzhPp6sXqmfcJ897g7NKkVz5enpyxTriBHdNBONSCRMfjRiz
	 sX+koQMwZgR2V+H0XVMvrn5Sj6TsurF9Y0aQSEivs5+WOLpos3LMKmknzoIN1ZvuZ9
	 09l+I4NUI49ccg3wJIjUs3v3CvcP+LFPhhR5o2PijNOZEx6gGWgqavIWjWdUjuGcrG
	 AA5uu3s0zGdp0G3mxGTrppkoX0mvV8tLtOEPDsnxvpqD7qfFyrL9syqBKXS26g0hPP
	 Mw5Vp8zMwIoWVcNbL6J3bc/mDKOChwO22Ich++hfojQD1NQOH8jD7fyoBoPyOGdidx
	 +85FJYpdUsldQ==
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
Subject: [PATCH] rust: DmaFence: Initialize for 64-bit seqnos
Date: Fri, 23 Oct 2026 19:57:51 +0200
Message-ID: <20261023175750.2979015-2-phasta@kernel.org>
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

When dma_buf::DriverFence et al. were added, it was completely
overlooked that dma_fence has to be instructed to use the desired 64-bit
sequence numbers with a special init function, dma_fence_init64().

Replace the bindings call to dma_fence_init() with one to
dma_fence_init64().

Fixes: 3282d5916019 ("rust: Add dma_fence abstractions")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index a1d851656562..de0bbaf18c7f 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -744,7 +744,7 @@ pub fn new_fence(self) -> DriverFence<'a, T> {
         // SAFETY: `fence_ptr` has been created directly above. It will live
         // at least as long as `Self`. The same applies to `&Self::OPS`.
         unsafe {
-            bindings::dma_fence_init(fence_ptr, self.ops, null_ptr, self.data.fctx.nr, seqno)
+            bindings::dma_fence_init64(fence_ptr, self.ops, null_ptr, self.data.fctx.nr, seqno)
         };
 
         self.data.fctx.nr_of_unsignaled_fences.fetch_add(1, Relaxed);
-- 
2.56.0

