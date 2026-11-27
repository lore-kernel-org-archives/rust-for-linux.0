Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781227;
	b=x6K0TSyZFR36BN8HQZl8k6YaG7bT3/AXRhlzSyDXPxFwxbHiVRWWAasA/p2PbVKkYfzK
	 i/d7vZ/LwU6VgmwgTs/9bpdy1NpWXG7PjJ4YifQFper/F/txBxrYD/E/QFOvJxSPEop6D
	 4VRfD0E9Go1jCIv8UFmeIT6YwYKSREgD2xCPfsZXlqs4jqNMW0gFfreW9fx7YFP7BEFGX
	 2+GxDKf3J05zmQDL7TLqEjiKhXg06Lm7bduLPoUS8cV8PuqsnPqQJqbs1Gitqkq81V3Qt
	 VafsjWq9jIiEm07zFRvvDR19WZBtlUuT4zxSd/LO3zVUpEb7r7b4LFIyIz21iO7/oDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781227;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=odfrwtc+j/jVo4M/i20gl+FcqG9Nsr40B1yfA4AgMPE=;
	b=ZySyS3tckfrmj91enOdVhI3SYH2Z5v0rc9BskPu6qV3mY1UWJq+hr0AOTJE9NSOu1gbJ
	 RhzHpm6m3hT1hEUDB+hQWCIzPeqKZLNPB/BPkik6Os0EbCkQ5TaAKWiwGloaVcHU4mwX4
	 AtWtYggO2UZ3NTDgiFb8YKpQF3K7bnppCOSEDGctX4GIhrVTXzt3lLx8VydPvcCarZyjK
	 gvhKapz9v+1Ly+1YQg0FSe1t36/WgKk78E0O1FTmUGZPsB2DLZjet/10VhA7ZnxsxwaUE
	 N5KNKnP4KTBUVjw/KGFQifBNHtKrEIgTKaVwQMVFOLVkIFnoa1csLGBCrJXZSSNTlBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HmTegJrl;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8531606A31C;
	Fri, 27 Nov 2026 12:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8531606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HmTegJrl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=od
	frwtc+j/jVo4M/i20gl+FcqG9Nsr40B1yfA4AgMPE=; b=HmTegJrlIK/PsPfHbc
	8j0+AR4FOberbYFchQGqtGKm4Al4HHqZe9cOi/zzXxB3Mpg0oSD0VqUEwysEdPWX
	XUIyklL3wC3+k9KpHFlqnsicKN6yJKd9/SEp5GdUOpq06qRzvdfhHbKp8DJ8MKmW
	28Npp0lFk3gcid6T1T0cPF8X8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3n5A9cglrxbarDw--.55658S2;
	Fri, 27 Nov 2026 20:06:27 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] rust: rbtree: call rb_erase() before KBox::from_raw() in remove_current()
Date: Fri, 27 Nov 2026 20:05:53 +0800
Message-ID: <20261127120553.1233-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
X-CM-TRANSID:_____wD3n5A9cglrxbarDw--.55658S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1DXF4DCFW8Zr1rGF48WFg_yoW8CFWxpr
	W7Wrs8Kr97Wr42gws2qr48CF15XF1UXF45ua9Y9a1Ikw4UJ3Wktr4xK3WUu34q9r4kuryY
	q34jkrsavrWvkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pioa0kUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBrQTKZWsJckRpQAAA37

In CursorMut::remove_current(), KBox::from_raw(this) is currently called
before bindings::rb_erase(&mut (*this).links, ...). Constructing and
moving a KBox asserts exclusive (noalias) ownership over the allocation,
which invalidates the raw pointer `this` and aliases with the subsequent
bindings::rb_erase() call that mutates the rb_node links in C.

Move bindings::rb_erase() before KBox::from_raw(this), matching the order
already used in CursorMut::remove_neighbor().

Tested with LLVM=-22 and Rust KUnit doctests in QEMU (372/372 passed,
including all 11 rbtree doctests).

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -918,15 +918,15 @@
     pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         let prev = self.get_neighbor_raw(Direction::Prev);
         let next = self.get_neighbor_raw(Direction::Next);
+        // SAFETY: The reference to the tree used to create the cursor outlives the cursor, so
+        // the tree cannot change. By the tree invariant, all nodes are valid.
+        unsafe { bindings::rb_erase(self.current.as_ptr(), addr_of_mut!(self.tree.root)) };
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
         let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) };
         // SAFETY: `this` is valid by the type invariants as described above.
         let node = unsafe { KBox::from_raw(this) };
         let node = RBTreeNode { node };
-        // SAFETY: The reference to the tree used to create the cursor outlives the cursor, so
-        // the tree cannot change. By the tree invariant, all nodes are valid.
-        unsafe { bindings::rb_erase(&mut (*this).links, addr_of_mut!(self.tree.root)) };
 
         // INVARIANT:
         // - `current` is a valid node in the [`RBTree`] pointed to by `self.tree`.

