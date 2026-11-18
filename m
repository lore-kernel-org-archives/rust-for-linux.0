Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018784;
	b=UhVktlWn4BDomMi+b13W0053YfcBkNGkuZ5M5cPYO9qBN+7PvRA432sqm118xk/k5xKr
	 E+C9KZmHCSg3/jg3n7Q4+KWShcV+uXbLWnkCIWlDTrWn1jIZI1vULZcZnwJn7J2MS8jie
	 RofeQrrsqpA5urzjbdYTZXuVrgU833D0Z7HAqQLRhOdLfIqZQCvT7NfKPG5n5e6kBHeUh
	 z5I9/J9o1Gk3u+FTlPxu7xpbB/vbe4zLZAdX394UdE5W4RouxG20emTAMxgmlI3LkiKef
	 oks7OzJKV57xr0aGnhZBKh6oE6k7zikYn3QWGpAc9loH8nvShJQ6Okd5cTlNHTtg4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018784;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FIZqapb8xoPPZmibFU/FsBHC1hySFY51gzuyNap1WSU=;
	b=Z5Qtpx9NIQEyQh/RF2Vg5Bngl9FYQwPSstDTXELzdVo37NnJrIcn/pqFBNpFU/ZfGxUI
	 Q/NFsjyQeTVgOpTjfWzqx0y6NRNo/QKnyw5CwiYbkT4R3S720IeSGzHEQmOBnM1BV4NIJ
	 c+6aZC+zgME0AP7+uyg+jGsXlZDBPGxtDH8Ce8lIUs72IouPXKpLHYxcEBRdF+jPuFsEg
	 DBr9Uw1fXcoGwTgRJ59hwbn1rWG7QJ21cPrD0ki1T+0+EFY0V6nyj+ynxxsCH7PxrmZlf
	 OFY3ltVP0CLyy4g7xWSp7c2gfw2S9IDoMuGBi3AQGE73a7pIOZ0U9ldHRA7cO6CVY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EBr7lbGd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328F606A320;
	Wed, 18 Nov 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EBr7lbGd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FDF1F000C7;
	Wed, 18 Nov 2026 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018784;
	bh=FIZqapb8xoPPZmibFU/FsBHC1hySFY51gzuyNap1WSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EBr7lbGdd3m9eZRuIT7kCU/l44o97EDmO41nPGVVjZtTrTV8X5jmEe5lRuagtVaPn
	 x5iLBuyBDUg1DvW5o4jNVWCOCGOYSYreSTcSuae+Z6952ruwHTPsIexa8euXHrXJq8
	 1yE0itI4dEfNJE+7Hj8H2+7iVM4hKZupA5eRoZ3igNGSj3FoWy4WgYIQ1gcw3+JX3I
	 6gtxmZma0+C7xe5mkPTDqBnSUZJ6gQqTouSJWxd7EaFd3HDKgua7n+0M63q86DZpUF
	 uewccdi3tVo5JARYvUY7tU0X+uclXfHIG+LrvkcY1UgkBHXFYNz+BWI1l0vH5KfilG
	 0KRGK1ACpTvvQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 18 Nov 2026 17:18:19 +0100
Subject: [PATCH v22 3/6] mm/page_alloc: make alloc_frozen_pages() available
 outside of mm
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-page-ownable-v22-3-d63ff73f4075@kernel.org>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
In-Reply-To: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 David Hildenbrand <david@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mike Rapoport <rppt@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Wilcox <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: Igor B <igor.b@beldev.am>, Vitaly Wool <vitaly.wool@konsulko.se>, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4705; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=CSZp8YNPv6y1CiJdShh/fjzWy72Ib/hXzZVsa31Sgvw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq/c/wX1nvR1gv9B/rOkt3izg0E8fkXINMM5O8F
 2+9y+ysrTeJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCav3P8AAKCRD6UCkIqsW9
 0GOED/9Vh/5INvgk9P8DwMR2aeS3JnDyMMF9WA2Bjl84hKZIl7oOBVjfTgOoskAxASTMJCthWjk
 Op2BleD2sKiUr/PpAV2x4cwQJVRYFJkhFPfXJrKXUCkV6MwDkFlXJTRxd1rklOfNaFvkUjKlvcr
 BAZPI2fUuxQNidBN/lbX2BhoyXcS2KuBi8WslDeJ8ngOR3X9WDl70uQ8oRRQsSKxBhHIFGhtWW9
 6zX9SGimznWfr+bcJlLmw0ZSaxjqSixBucu5YewsJbMUVb7tvIemuKLMZTa1Zzyh2TEWRo9BbFB
 kt8ncx6AUinI8kEDkGVxNGxoZ0QWLoJ3s7tYfFXKcTudftgTKMiN6YfPcJdDG4BXtXnqk09Gt0D
 oEqe20F73wFLY1Oc6REy0aoZqJefNBkAJuMuPuzyZxS7aTMjYjuPe3QGWn6QhXNQ5hGhSDHfAqb
 0x7+nHWyNB6E2fR9w97K9raJmPHk1zfsTAFhoN4QCP2tALLJ4ABJFrj2utsPjjyr2JI9LO4w1Ve
 85ejPhZJ9EYWK3l2/Nd94WOP+kBuMiiwvbx3Zi9+HGE+WWF6A6p7wWe5p9CQ6rvdcknmpwY0sy3
 tyZ95LoKOkGcooGZOzOaxROhYBM04IKH9LDWRiDQWUK390O+5y85e4+VUpziCGCI3qwE2uFfwe9
 LiDjaD5a0RPiWkg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

alloc_frozen_pages() and free_frozen_pages() are declared in the private
header mm/page_alloc.h, and free_frozen_pages() is not exported. Thus,
frozen pages cannot be allocated outside of mm, and not from modules.

The Rust page abstractions need frozen pages. The reference count of a
frozen page is zero and references to it cannot be taken, so the caller
that allocates a frozen page is guaranteed by mm to be its only owner.
The Rust abstractions rely on this to hand out the data of a page as a
Rust reference.

Move the declarations of alloc_frozen_pages(),
alloc_frozen_pages_noprof() and free_frozen_pages() to
include/linux/gfp.h, and export alloc_frozen_pages_noprof() and
free_frozen_pages() with EXPORT_SYMBOL_GPL().

For !CONFIG_NUMA, alloc_frozen_pages_noprof() is a static inline function
that passes ALLOC_DEFAULT to __alloc_frozen_pages_noprof(). ALLOC_DEFAULT
is private to mm, so the function cannot move to the public header as it
is. Move it out of line to mm/page_alloc.c instead. This adds a function
call to the existing callers in mm/slub.c on !CONFIG_NUMA kernels.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 include/linux/gfp.h |  9 +++++++++
 mm/mempolicy.c      |  1 +
 mm/page_alloc.c     | 10 ++++++++++
 mm/page_alloc.h     | 14 --------------
 4 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 63a7654c725f..7e1f24658f9e 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -302,6 +302,15 @@ static inline struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order,
 
 #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
 
+/*
+ * Allocate frozen pages. The reference count of a frozen page is zero, and
+ * references to it cannot be taken. The caller owns the pages and frees them
+ * with free_frozen_pages().
+ */
+struct page *alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order);
+#define alloc_frozen_pages(...)			alloc_hooks(alloc_frozen_pages_noprof(__VA_ARGS__))
+void free_frozen_pages(struct page *page, unsigned int order);
+
 static inline struct page *alloc_page_vma_noprof(gfp_t gfp,
 		struct vm_area_struct *vma, unsigned long addr)
 {
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 0cb6da1c47a4..6d872db9fc6a 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2582,6 +2582,7 @@ struct page *alloc_frozen_pages_noprof(gfp_t gfp, unsigned order)
 	return alloc_pages_mpol(gfp, order, pol, NO_INTERLEAVE_INDEX,
 				       numa_node_id());
 }
+EXPORT_SYMBOL_GPL(alloc_frozen_pages_noprof);
 
 /**
  * alloc_pages - Allocate pages.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index eb4f02617f53..d6284cf965cf 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2993,6 +2993,7 @@ void free_frozen_pages(struct page *page, unsigned int order)
 {
 	__free_frozen_pages(page, order, FPI_NONE);
 }
+EXPORT_SYMBOL_GPL(free_frozen_pages);
 
 void free_frozen_pages_nolock(struct page *page, unsigned int order)
 {
@@ -5491,6 +5492,15 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 }
 EXPORT_SYMBOL(__alloc_frozen_pages_noprof);
 
+#ifndef CONFIG_NUMA
+struct page *alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order)
+{
+	return __alloc_frozen_pages_noprof(gfp, order, numa_node_id(), NULL,
+					   ALLOC_DEFAULT);
+}
+EXPORT_SYMBOL_GPL(alloc_frozen_pages_noprof);
+#endif
+
 struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order,
 		int preferred_nid, nodemask_t *nodemask, unsigned int alloc_flags)
 {
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index 7097ea1805f6..541fa8b3f532 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -237,22 +237,8 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order, int nid,
 		nodemask_t *nodemask, unsigned int alloc_flags);
 #define __alloc_frozen_pages(...) \
 	alloc_hooks(__alloc_frozen_pages_noprof(__VA_ARGS__))
-void free_frozen_pages(struct page *page, unsigned int order);
 void free_unref_folios(struct folio_batch *fbatch);
 
-#ifdef CONFIG_NUMA
-struct page *alloc_frozen_pages_noprof(gfp_t, unsigned int order);
-#else
-static inline struct page *alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order)
-{
-	return __alloc_frozen_pages_noprof(gfp, order, numa_node_id(), NULL,
-					   ALLOC_DEFAULT);
-}
-#endif
-
-#define alloc_frozen_pages(...) \
-	alloc_hooks(alloc_frozen_pages_noprof(__VA_ARGS__))
-
 struct page *alloc_frozen_pages_nolock_noprof(gfp_t gfp_flags, int nid, unsigned int order);
 #define alloc_frozen_pages_nolock(...) \
 	alloc_hooks(alloc_frozen_pages_nolock_noprof(__VA_ARGS__))

-- 
2.54.0


