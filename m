Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3029CB4A
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951463; cv=none; b=bn2Xty+83eFyDFqIYMRVK2mFVTRVAAnnWEIAVZkaQdieaVbrEMXRtQIFXzhy3zo/JuKiJkF9OWNT62CoumgRrH/bxBhXLmGtekvUqE4Ura5UNmlQDL+JDd7bBd9O9USjvJWvazOsiJpeJ3p7TJa/N9HWGsleREm9BtLYTm4eVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951463; c=relaxed/simple;
	bh=A4Z1Kjyb0q1+2b/+mK/fbB8zgsXm4jFE/SD9T8Zpf54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUJxOC1/gWME51k+r1LQlOU9TPACcmdZIQDtqGOHqje89/ZwEHm6UR5nWuYec3Gf+xN2twSFoukuANkLf09nvSOZhjsi+LrG/3HFsfWeR+XvjYvE2N0ToqINT1WKkJhSZkZwcYigRJ4VUdB1KyYbcOR/P50VNNLlZHHWqAYhMUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aY27z28P; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aY27z28P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753951457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eKCSojzWFBB5XUZbOG8+B8FuemPRTu6X+SCrs+V14Jo=;
	b=aY27z28PUE8wAxByhX99TjV2uDdGqU6Rf5qpI6F7k2368DdBKSPjnOYlPANo6/KIH/2UKi
	s2KOLd5hP9eom5lRSFK117leU2sgyQdS3IBy76qgK8bHmd0ICHCKicNne4TxSLW0Q32heH
	KIFFZb1hMKdZhwxCU7E1fHXQvqoHJPA=
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
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	vitaly.wool@konsulko.se
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v8 0/2] Rust allocator and kvec improvements
Date: Thu, 31 Jul 2025 16:42:36 +0800
Message-ID: <cover.1753950392.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

This series adds tests and docs for Rust kernel components:
Patch 1 adds KUnit tests for allocator alignment guarantees.
and simplifies KVec test module naming convention.
Patch 2 documents KVec::as_slice with a usage example.

Both patches are co-developed with Geliang Tang. Based on [1].
Tested on x86_64 using KUnit.

Changelog:
v8:
Updated according to the comments of David.
v7:
Updated according to the comments of Miguel.
v6:
According to the comments of Danilo, updated test for allocator.rs
and allocator rebase onto [1].
v5:
According to the comments of Danilo, change to use generic struct and
allocator Generics in allocator.rs.
v4:
According to the comments of, add the error check for push.
v3:
According to the comments of Danilo and Boqun, move KVec test to doc
example and move VBox to allocator unit tests.
v2:
According to the comments of Danilo, updated the commit to samples the
usage of VBox and KVec.

[1] https://lore.kernel.org/lkml/20250715135645.2230065-1-vitaly.wool@konsulko.se/

Hui Zhu (2):
  rust: alloc: add alignment tests for allocators
  rust: alloc: kvec: add doc example for as_slice method

 rust/kernel/alloc/allocator.rs | 56 ++++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kvec.rs      | 12 +++++++-
 2 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.43.0

