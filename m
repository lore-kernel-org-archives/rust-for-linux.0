Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1652DE56A;
	Fri,  6 Feb 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770414207; cv=none; b=m6jmMGEqHKAWH/nFS+sowEbUPTLVvQ9hoyuB9h+7Q4j4nhOOUTUfi+OATMIXhK0tmkgapznTkcvtm6wW4D+r4DV4IvAbS6JHmvx6yJRHJsGNKKmYVSh91L9JBxTBTFc5MiKIeK8F+rzCO1Jqo3d9ME8LVlhFknlvyGZrNS+29cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770414207; c=relaxed/simple;
	bh=NgQfAJHzVJF3x25o6e0VGnyxpkVMB6vbImUYVyuSsxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVdqAHvSFdFECReaO1kG6ZNWj5webPupgGB+SkBr2Qxlgu4gn7FLYsRSUft8+XVfsDcYyNNB0rGIdMHhE6ivR0eBfcaa/XJw4jiueEbOoNb5AlzfgNWpoamv9qtqspBVfNp8VKlfoBNcd0b5vtxLLZG1nMk8/ki0Uw4kKk3GsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4NlRDtD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4NlRDtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42824C116C6;
	Fri,  6 Feb 2026 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770414206;
	bh=NgQfAJHzVJF3x25o6e0VGnyxpkVMB6vbImUYVyuSsxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U4NlRDtD9s/gTCacHwCXha31viLPKHOqvB4N2P+g+m2Kx77f5fR+S/sxo/+JbRPCf
	 XXd0vMBthXZhVQl/zLrF6lsQbz7wy883crvpo4sYtOwyknqWxhlFv9hlOQ2Nba6iyc
	 ccwJnQT7dPFQ8hIF3nzPQ7NKcrkLxEfkga3OgAW1Z7BWlep5Plsprdl0nZYKlpajsX
	 I5XgfNVdu7F65TL9j3L5dlRj4vjXOBUKijb/D5tL0x4/rktMS4AHYlop8dcG4E1pit
	 s/j5l2MW40kZk7UR9OL8Q476vIaYDPDXo+yOxxmT+71ldU1iRkHhsrA6QDMAlje0uF
	 IlbLXySC7+xSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Tamir Duberstein
 <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 11/11] rust: xarray: add preload API
In-Reply-To: <20260206-xarray-entry-send-v2-11-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
 <20260206-xarray-entry-send-v2-11-91c41673fd30@kernel.org>
Date: Fri, 06 Feb 2026 22:43:14 +0100
Message-ID: <874intpmz1.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Add a preload API that allows preallocating memory for XArray
> insertions. This enables insertions to proceed without allocation
> failures in contexts where memory allocation is not desirable, such as
> in atomic contexts or where reliability is critical.
>
> The API includes:
>
> - `XArrayPreloadBuffer` for managing a pool of preallocated nodes.
> - `XArrayPreloadNode` representing a single preallocated node.
> - Integration with the entry API, allowing `VacantEntry::insert` and
>   `VacantEntry::insert_entry` to accept an optional preload buffer.
> - A new `Guard::insert_entry` method for inserting with preload support.
>
> The implementation uses a circular buffer to efficiently manage
> preallocated nodes. When an insertion would fail due to ENOMEM, the
> XArray state API automatically consumes a preallocated node from the
> buffer if available.
>
> Export `radix_tree_node_ctor` from C to enable Rust code to work with the
> radix tree node cache.
>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I somehow managed to not include this last bit of detail:

commit 09bdfa18f6f879eb42df2e032ad5224eed29eb25
Author: Andreas Hindborg <a.hindborg@kernel.org>
Date:   Fri Feb 6 22:38:09 2026 +0100

    radix-tree: enable sheaf suppport for kmem_cache
    
    The rust null block driver plans to rely on preloading xarray nodes from the
    radix_tree_node_cachep kmem_cache.
    
    Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index b642f2775e89c..ddd67ce672f5c 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -1599,10 +1599,16 @@ void __init radix_tree_init(void)
 	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
 	BUILD_BUG_ON(ROOT_IS_IDR & ~GFP_ZONEMASK);
 	BUILD_BUG_ON(XA_CHUNK_SIZE > 255);
-	radix_tree_node_cachep = kmem_cache_create("radix_tree_node",
-			sizeof(struct radix_tree_node), 0,
-			SLAB_PANIC | SLAB_RECLAIM_ACCOUNT,
-			radix_tree_node_ctor);
+
+	struct kmem_cache_args args = {
+		.ctor = radix_tree_node_ctor,
+		.sheaf_capacity = 64,
+	};
+
+	radix_tree_node_cachep = kmem_cache_create(
+		"radix_tree_node", sizeof(struct radix_tree_node), &args,
+		SLAB_PANIC | SLAB_RECLAIM_ACCOUNT);
+
 	ret = cpuhp_setup_state_nocalls(CPUHP_RADIX_DEAD, "lib/radix:dead",
 					NULL, radix_tree_cpu_dead);
 	WARN_ON(ret < 0);


Best regards,
Andreas Hindborg


