Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4924C2D5C6B
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573620; cv=none; b=Lul0ban1rpZXlQLihfy7r8dcAGTfJdnqhvaCnyYa4lvzFTu+FzP9MxpVf0QT7U4oBFGNfwEvxuFs4yPkFUVOLU/iq8UjbRJugb+EczGMbY3zFtk0OcWv0GfFBSSvRECsjBJiDtoEKuUgN7djKJ1E9CG4YcsDeAnQD9D+6uGKhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573620; c=relaxed/simple;
	bh=unOJnRtpV5M6bJg+GHhZaizhNYUWqBr/lbEYY15USvM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=XWFWnVLQoThSAHLFpoj5QH5AmMVhM9Hz7P7cvcMQeKnooJz+B8rANuHeipVqyS/BZLFayfHmD4+7jvbz6XeiVctY+1rgX92PZNxZEa4G0nRPDi+lWoWZQfbVivDHyoESnt0MtiDn8lA12AiQ89NYRjwKnByKZQjOFAPQRvfa5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wg2T7P9p; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wg2T7P9p"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752573615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nng2QLzQFaX12lzTkgmMSqRelbdU2mEPT5KatLQKsfI=;
	b=Wg2T7P9peGdZRAPmgd9HZG5ovvA84Q+mbmetF2MYhCxQAH0TOli4/mbm2ZQWX5jaDgY0oK
	u+vsxbDjglvAXiryksGT2qSt9Z2sveOHD3XI7c1KxdoxDCV9BrW0L51pzhtzhOQRdh7mnp
	49okDzwuiiPtT7mVricleQsPO2o8sCM=
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Hui Zhu <zhuhui@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] rust: allocator: Vmalloc: Support alignments larger than PAGE_SIZE
Date: Tue, 15 Jul 2025 17:59:45 +0800
Message-Id: <cover.1752573305.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

There is a TODO in Vmalloc::realloc "Support alignments larger than
PAGE_SIZE."

These commits make allocator vmalloc support alignments larger than
PAGE_SIZE.
The function vrealloc_align is added to vmalloc.c to support reallocating
aligned vmap pages.
When Vmalloc::realloc intends to reallocate memory aligned beyond PAGE_SIZE,
vrealloc_align should be used instead of vrealloc, thus enabling support
for alignments larger than PAGE_SIZE.
And add a sample to the samples memory allocator usage.

Hui Zhu (3):
  vmalloc: Add vrealloc_align to support allocation of aligned vmap
    pages
  rust: allocator: Vmalloc: Support alignments larger than PAGE_SIZE
  rust: add a sample allocator usage

 include/linux/vmalloc.h        |   5 ++
 mm/vmalloc.c                   |  80 ++++++++++++++++---------
 rust/helpers/vmalloc.c         |   7 +++
 rust/kernel/alloc/allocator.rs |  32 ++++++----
 samples/rust/Kconfig           |  10 ++++
 samples/rust/Makefile          |   1 +
 samples/rust/rust_allocator.rs | 104 +++++++++++++++++++++++++++++++++
 7 files changed, 199 insertions(+), 40 deletions(-)
 create mode 100644 samples/rust/rust_allocator.rs

-- 
2.43.0

