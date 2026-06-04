Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF793CC7D3;
	Thu,  4 Jun 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603192; cv=none; b=aOKGAOJLO9oKBBjhNmwETeAR7QY4H1x6VVS3YjJtRvLivcjzTAA+8a8zKoNLvO8DrRlhk3urv+dUIacoEsRNHU3KvBHVKnMWzVNupktDzjGeRdIkQOaU6yvIAz33QzCZ+pe4pnuPdT65hJxrh3kOCUksQBqjvhky6YE9+8I96p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603192; c=relaxed/simple;
	bh=BhCLKxRMqF4V+mE7gy9xjhXHgxHe6HNf41/h4Z3bGDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqJAqHmEqBGzrW3JQ7+XRn8Z3XDDdC2UD3wUr1UH/gYFfO1It/AvyPuz8MWfnS8WgjQIS2ugOgEdvG07XeO0ByFdt1XalV+CcwBfEJhtHVtBw+59SMDhp8lLDCUuvFDQnGYER1YKw9EpS9N8YNDVf+xbp/SICbEo8rAdaItKovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPB7jQM4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPB7jQM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3E91F00893;
	Thu,  4 Jun 2026 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603188;
	bh=SmiYFIKuE1zvPsAEwECS8Z/13j8fqEOETWiRIjYfqnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JPB7jQM4qJtWMPT2RpIm3aDZ+OqvI++pmnDzF8FMZBTb31pYMzeuqqRAwPEt2U/M8
	 oJKnydYcgbMlOhGRVfZEoV0I58oPOh+XPf6uMTBjDM9Eep/0dTqrdtnj68lmGASZox
	 PBX5XLmf0gL1N51R9I3dAOan6GiEkpZ++4QT/rp6O1XJsmBIswbVhxlZIoWaRneVA4
	 /VQkNhLFs1jQhfm8QOigz8afOxpQ3XRLy5aaXRNNqiIuKX9UKc1/ytGC3dlFArNUql
	 LdwpoFUyRNrClq/wrHMIXnf1s7kSW43K7mdm0+mdt1SdV+xeMClipC88ye1INxd9de
	 IvKZV6qi03OKA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:16 +0200
Subject: [PATCH v4 10/11] xarray, radix-tree: enable sheaf support for
 kmem_cache
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-10-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=BhCLKxRMqF4V+mE7gy9xjhXHgxHe6HNf41/h4Z3bGDc=;
 b=kA0DAAoB+lApCKrFvdAByyZiAGoh2PKiOBQrTuWb4+c//hzTix9gM8yNN9SYEMxv0B6vxjLml
 4kCMwQAAQoAHRYhBFeK2cjZZnYmKsBqhvpQKQiqxb3QBQJqIdjyAAoJEPpQKQiqxb3Qbq0P/jVv
 ytNdtugJpYOvBMGd1/YyL95/92eWNJhenjaWD1s1c0k4gvnjG7MsQU66xf/lWXcu++IXGQOkSqx
 NU+8laAbYXgJ9wN62QfkdW8g08qC/0aduBghYfnV6wkNkH2TAeb+plHFV3GehmBmt5ah3diPeSd
 q8/UWaLDuC6dFp/gK0VpFU4Jx5nq/I18kDluysSCN2SVcm0YYMEee4taiZaClYxtYt9nmS/9fjz
 pm0KexPuArJ4IHr0LUsEX7m5k+JCUG9v5jFyWHbg97msdx4K9q7/8l/06Ru1TrMFJB31+FGgYFX
 PiQny9SX83eY87vZ2QFPBZoflNlDll8SIEVX0fD3AKwXL8IkIK7GeyvG2pGgs2Tb37siozoMGJs
 BL1TLFNii7SWJoNjTxQcrVb+hIi1ri4hAibMvDE3DCV05yVhiEGX2sQIQnFPEEAoUlH6K2ueN6b
 idJJycJ6yaueCdo5sT7p0hyuIk5m2MJprCBbkbviOogzBeBdhlc3FyovogAtHhd1eS4XMtEsg6+
 NdE5CmDY8wrOrdGdIheNX9d88Utv3GLICqXBLW5kKukdbGuLnXFDjds6oeWEJnBsPr2BfZ+Pj2c
 7f/YdnKxZaIpg5SIR+wVwdSoXlrLhifSSTWTd/QAehI+Ash+Nc0acpg3gWI/knsDdI/46xM0rPI
 0qePx
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The rust null block driver plans to rely on preloading xarray nodes from
the radix_tree_node_cachep kmem_cache.

Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 lib/radix-tree.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index 976b9bd02a1b..1cf0012b15ad 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -1598,10 +1598,16 @@ void __init radix_tree_init(void)
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

-- 
2.51.2


