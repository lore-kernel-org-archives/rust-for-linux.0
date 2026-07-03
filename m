Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903535E948;
	Fri,  3 Jul 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063954; cv=none; b=p5DjjUnxm8mHBWyderL2yR1Xb+uzmU8Dm5sPXH5F8NwFZHVg3YkJMeO1+spG4XxPGDxtWuC424S+XMjl2o+S638lhu6CU93VzqThmap6agZ7tgvqP3AG7uDhOJnItLL16kN+obB4m1tTPL/a7r43eKYiiEnvSC6JwMshE9+h6XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063954; c=relaxed/simple;
	bh=Cfzyf35WFfCL23gQouUoApv3a6NKQO0Kftlg1kb+GRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tH3dqBtWcpW+U0A2EnpFuNZzJa66T6RvcLiB/tAOHol4975MtCZHTE9Eruzhs01EHnRr6JdFvU4Te7q7Haz270RJapVyHMhyM4S5Esd9fhNvoQP0kpp77nIgsnNGrMhLeF8uYrGS4OoD6VPBxpudNFRVMym/208yhyTBBPqfiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQhQGJw/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQhQGJw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E806E1F000E9;
	Fri,  3 Jul 2026 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783063952;
	bh=fmCvV08WNd5aRXYPQd4CXpSl5t2HVbpLE52owDbkbBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NQhQGJw/FGsbzEtPjCvQRuSWdfOeZwGUvQx5s0h93IEnfCKrKzd61TXMdX6au1A/u
	 fSsN22CPMGvm1Y8wS+im/Az6o4mGItMxc2peuVnsdqhzS+wDbq7VExHOrVlxuId3WR
	 28Fo50xRTPmAo8aa9U9ytG9UqeDRc1Tvq2F7KGqP2b9y2EulQntzB7oWDRS8kCyK2k
	 q/VsxDJMftdUupYguXQkT6nBsoy5TYJBsQzBLQ5tUDQUbEJjUlFuwbGS1Ph3LXFYo7
	 2mCHusr3llz+zb21hEjO28tpIfxOAom5yH+mQE3O1k0N5tZ6UG56j+nisF5eM9Nhxm
	 lHmZ+b/VAI+8A==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <bqe@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 5/5] MAINTAINERS: Add entry for Rust dma-buf
Date: Fri,  3 Jul 2026 09:31:41 +0200
Message-ID: <20260703073141.3962604-7-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703073141.3962604-2-phasta@kernel.org>
References: <20260703073141.3962604-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust does now have abstractions for dma_fence. These abstractions are
quite complicated and require expertise with both the C and the Rust
side. Therefore, using the existing entry also for maintenance of the
Rust code appears reasonable.

Philipp volunteers to help maintain the dma_fence abstractions. Add a
corresponding MAINTAINERS entry.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..5e5a23a21cd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7622,6 +7622,7 @@ F:	fs/dlm/
 DMA BUFFER SHARING FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Christian König <christian.koenig@amd.com>
+M:	Philipp Stanner <phasta@kernel.org>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
@@ -7635,6 +7636,8 @@ F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 F:	rust/helpers/dma-resv.c
+F:	rust/helpers/dma_fence.c
+F:	rust/kernel/dma_buf/
 K:	\bdma_(?:buf|fence|resv)\b
 
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
@@ -8621,7 +8624,9 @@ T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
 F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
+F:	rust/helpers/dma_fence.c
 F:	rust/helpers/gpu.c
+F:	rust/kernel/dma_buf/
 F:	rust/kernel/drm/
 F:	rust/kernel/gpu.rs
 F:	rust/kernel/gpu/
-- 
2.54.0

