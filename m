Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19D37BE78;
	Mon,  9 Feb 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647981; cv=none; b=Q7vaplIsI7LV1R2BL6THV+PHeBE72a5ZgAe56hMX5IiGF+YrVPUfKt0DA0/7OcTEvk6D5r2L/yPkr31csqZy2awFuj2BwE73aXQYpOA0sLddCDcODVjbYyL/5NuuR4bb4WOYy06g4j9/DVFw76oBwsyMwxWJeWcT6EkOSKajAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647981; c=relaxed/simple;
	bh=VslDN1mPgFIPh4fOyBZhDN58qjpQH9gwwiiN+krVdpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ga0olbyWDmbrE25PO+c3WZrZ7sXsyvEbG3VYXkPgoC6PVcc9rN0aEyOxIYD4dXzJd/WxbMgWQMSW709YevUdYKDDSHt2xLjZpE1ZK4TJAPF9gg82GP6FbBM8LsgBHGVyKxp53mh/DmeKs2eT/Onz51lY8BA2H/Y5HclCRivaOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i41dtz0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i41dtz0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDF3C19425;
	Mon,  9 Feb 2026 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647981;
	bh=VslDN1mPgFIPh4fOyBZhDN58qjpQH9gwwiiN+krVdpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i41dtz0xskrUok+uzr6C0WdKfzIZ4fXVrLBlLxCOk6zIViA9IMUrZWbY4l1jTHyiH
	 8q39lKA1o3D7s+vHLG0Y0d55CSJg07xGLYt2EcioMSRA26dHW4F2IpGpyZF3YbfTJ4
	 IatdZL1SyBG9AcRmkDKbpQ4Vk1r5jImqLCmctbbD/RjqXMg/ZALLuDtp9oXJ+/ET8B
	 diWzf5VRTxiBdln3n3NORvW5jFAxjCw9DzAj5uhdNlAh8GPJ8VQ2TFstZ4QbYZ72LL
	 8n1pq7Sd4Tu4Ru6x8Lqf+X3j6sD6mG11ePNDnEAZAYar+jyK0vGujiBqYt/t9d4En0
	 77w3TEOXo83XQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:16 +0100
Subject: [PATCH v3 11/12] xarray, radix-tree: enable sheaf support for
 kmem_cache
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-11-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=VslDN1mPgFIPh4fOyBZhDN58qjpQH9gwwiiN+krVdpc=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFex2+rby13jaJSZme2/vU05ZzvMRP5UT6SK
 VJQYMHYp8qJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxXgAKCRDhuBo+eShj
 d7xHD/48WEALFQfX+iMYXsiR/Mvn723D+YBjt2TOR/yfD7Sul4d8Iv02lIm3LGfCJsyUqsx0R/m
 Qk2ZkCueXt8bvCuSssHdX0jFMrBRDz9DFgMbk5SHMC2hLN/W0x/AY4rHDH4HxWqA/09V2h9kX9l
 by7veoXmADET0BEbdp15OIZLrP4+TbK6Md7Y98gcZZZZgKfyOgrWD9O+wZSe1jT4JSNrdw0pHhK
 WEiy/1R+bNnLAmMOP7AjVxTRKZ5SQafFzXZwe1+F6+mZe2saG8I5hrDR+VxNKisA7vQl9/z3gF1
 XuYWSv6bLte0vcgMNpzi5111T1Tky95jqKotdLtHq7sO+hUg0IAm1sGAzEr848kitJXmQWyyp8z
 RtkHcd0kwQ/15cx2EZjuMGm32TRs79hH6cCTfvmf4CweWaQmqV+mC5uohtBCP7piEWMy/RrA1lx
 Lk8TicZ76wcecqeZ8TeDdarQAI/oVX1NO6bP4HKm3wcdjn2HDq2AW5m3Ss2RyH1ZoffhLt7eyAY
 HG8F4YbEif5r2ab7bGc75ROxcp9b9NTzghH7dtSdy8YrkyjeZNU9Uc1uq1KyyHMibe/jKSjYmPP
 debQlj5Vy7aICDbaFtI+SvG1jp8hcOSvnmatndAdy79kxiL25JYhXQRUaqy4lc6Xcs8Um0+KbQA
 EVG3kWV3B6ysnbw==
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
index 976b9bd02a1b5..1cf0012b15ade 100644
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


