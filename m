Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F23E3C5D;
	Thu, 18 Jun 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789244; cv=none; b=BDBjreOQyfdaiIZi+0mCyYbKS3Rno4cfNO8kdDbQu1rJqEJa5jxAsKj/CjZ+H9mNUrvoIzH9fvpEAHQbSWiOWsZ1T2n4PAQ6IE7Bl4f26vYwrL+JHZBk4xHtjT2ugyNonI/48SYmqH3dPLspUvWJ89kR099ACYIbSYUbC0kZlhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789244; c=relaxed/simple;
	bh=/KSYHgrvr1OljmenRFrv3guPwSZcskkY5LTeDOeK9Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJYrwsO0FL+F4L0yOa52lPOoIxZQNuAjsIjYgg8Z7R0Fe451CkUG+sT/nh+3m623uYkc1MvsIdTP7FQ4xPJ0pLCo9/S0vIMzBxcUFrw23L5JGTPJ0mel/vEWnJLVn1dB/xg8PfKTXn01bXcvA18+eKVWzqnZfdU16a2UkEFhuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMr80BAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMr80BAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4471F00A3A;
	Thu, 18 Jun 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789243;
	bh=i0ao8Lg+Wq5WeXEzHY8cpaUJ8+ojOdhUgxJLtMGBRfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GMr80BAwd8qRqlnnpdG1JdOaG1Z30vgKb1oz+rwVp/HnbVu1RhCHUMYA8sprow8XZ
	 mjrVOBDT2sEE+sFtmG5hTiC7fflWIaaB1tp8LYWKRBNa2zZ8obbkRupr5VRLesyAoh
	 jfui6PydD6AYMGPhpNaFSHvMICDVbAFy8MTiERMs4JnROqbjYqBpWvjE75oShB/nvl
	 Ab/T6qGgLPPfryu075N32AYheRwPaaXMVzoepT7ogqLnGhLgsMlRHBO3syAejZMs5q
	 U8hpcM2Qa9klATmi993fFNEICbNF1ejCPcSo9Fqdb3GauqJLi0FYEVJ8udBQaB4SSn
	 jsyqReRih/Eiw==
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
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Burak Emir <bqe@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry for Rust dma-buf
Date: Thu, 18 Jun 2026 15:26:27 +0200
Message-ID: <20260618132628.3811068-6-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618132628.3811068-2-phasta@kernel.org>
References: <20260618132628.3811068-2-phasta@kernel.org>
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
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ae6919454c3..8b03eb2c578a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7535,6 +7535,7 @@ F:	fs/dlm/
 DMA BUFFER SHARING FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Christian König <christian.koenig@amd.com>
+M:	Philipp Stanner <phasta@kernel.org>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
@@ -7548,6 +7549,8 @@ F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 F:	rust/helpers/dma-resv.c
+F:	rust/helpers/dma_fence.c
+F:	rust/kernel/dma_buf/
 K:	\bdma_(?:buf|fence|resv)\b
 
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
-- 
2.54.0

