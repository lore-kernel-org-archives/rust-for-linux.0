Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA129292F
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Jul 2025 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753426972; cv=none; b=S7MNAaqn3lj7IwFoBv/dtRdB5ui2dMTRewjcfvPkiZi4Lovx890jAALNvVUftQIsayePuk2yFFtXXdbSb6Eh/Pj4Yy//y2h1zilZ505Z24khKutU49QUc7APmbr50Ei+u8/+sKgq/o2+og6TpEdtlx/b26yAvvmgZwArxuZxhQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753426972; c=relaxed/simple;
	bh=sVKJXmIHL8iu8lKvPknablaS4BAt4Ho9tkTmzj5mLSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tWzB2mhbhX9bNtKSrkWhBiv/ilHGvSEbxBkjYhvwpHiC0kuImpdm36t2FzyNaB1kl/NQVZp2juiqxVdiyaZdmoQpsVf+ukSEn2ynG2ngeJvT07Nhu6S+MXVt41yKnj2rEoRf3aSFunKTuDqm8f3SY8A2hgpuMWGwRSV9iLdxtmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fQQ8rI6/; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fQQ8rI6/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753426968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pg6Pw/+iwYd83cgdfN4Bh0EwknHj0usqoSKEWVkMPoY=;
	b=fQQ8rI6/h3DIxATplBwlhcGSjV9hSBeW1rVy6wThi8I/APmugVzUapX0hFwP06RiuGLvDP
	NskkSYjbkEO9F2p9890wgqj8oVytKEQUQRBEGEwMuYZXWoqZvLXGb8TgUkvjSzAmw/zwjd
	nXm8z81AFLW4N932xMKhfSXJduR+gX0=
From: Hui Zhu <hui.zhu@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Geliang Tang <geliang@kernel.org>
Subject: [PATCH v5 2/2] rust: alloc: kvec: add doc example for as_slice method
Date: Fri, 25 Jul 2025 15:02:21 +0800
Message-Id: <7d5600d4913d62a011d23c917786ce947644b50b.1753423953.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1753423953.git.zhuhui@kylinos.cn>
References: <cover.1753423953.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

Add a practical usage example to the documentation of KVec::as_slice()
showing how to:
Create a new KVec.
Push elements into it.
Convert to a slice via as_slice().

Co-developed-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 rust/kernel/alloc/kvec.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..fa04cc0987d6 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -224,6 +224,16 @@ unsafe fn dec_len(&mut self, count: usize) -> &mut [T] {
     }
 
     /// Returns a slice of the entire vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert_eq!(v.as_slice(), &[1, 2]);
+    /// # Ok::<(), Error>(())
+    /// ```
     #[inline]
     pub fn as_slice(&self) -> &[T] {
         self
-- 
2.43.0

