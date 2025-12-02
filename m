Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310E2F6914
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704303; cv=none; b=EzGnk8MZ9TRb0hXFaxW6GfXzMUhl3Evo25ntaN/R9ZSra0+cCneA+KNrSsj5/s5yfg9CQ1E5ZBTXc450VAjffKc8EZjkJkTj3kAX19qWgjWw7K9mDLyamLxuBJ/Q8i3nAsihs4BxXmAH619OfTPfM0iwQRWrT6Y0UMozxtGChx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704303; c=relaxed/simple;
	bh=s5F849cKunCWhXEDw04RDI6ouvr7CQTpbwq+FWSvJxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tOxshfI0YfwzyZBswpq3EI2TO6ziMuHyTUlS2CK4tv/bsSuUqRuFswqoqTjpc9/Vp+9PfrGthX8l+eSo3dElqqsh/mvi9jwLG1a1Vl9XDsUgldJtbDz8kFP0flF+PQHZ7Ynhl8Rwxg058QSwZJp4TwMi/YGU6egg/zWaEEpMFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0ZxcRrl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0ZxcRrl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42e2d5e833fso1691073f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704298; x=1765309098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qMYBEWcYpIOM/tMAd0uS75dTnBdoaoIVwbOFkcZei8=;
        b=K0ZxcRrlL4vlE9jtZl0iuBpjLZl+9w+9vrevasxiXmPw5o0SIi6bBmwx8zIxEfYmSv
         KZv/HHFSUlJB9dXmm31BXIjSPjU7oGqhY4aCXFoOKN0dyd2fxcbswWxOyJf10HPYYie4
         /qPJmXQKNW5yPro3zFF9UQTMc1Mnq+rGxqwJidoSOADJBHUAFuqKAgjjn9SBnh1KP5zO
         lWsUon33Pd2YxSyTc+GmNRQ7k+tDESdkNeMXUAOmhd6O+K7n3rfEdYj62SEagThf3ef/
         nQXsiqqL1NBZq/brkgwT5gGfIQq4yTj03Fv0y7saFt32YjrWdTtBbVpgc7XUGdPNOOxX
         +KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704298; x=1765309098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qMYBEWcYpIOM/tMAd0uS75dTnBdoaoIVwbOFkcZei8=;
        b=UkpNJnpoB7lq1JMlckDc7pjXD5oCkRmuVPP3RTeD9gGItfJeyCSuKsXUJibL5jbY9e
         O1T71q0Oa5usR451jto8yOcy9S2J3ejFLOZ/ZwlEvvwBuAYjx2xz3dpvFaRKYz4z0Y+b
         DKyo/bYXA/7gmdeX+sJhmZtsdTtHjOsQ2F69soEQyHCQzPZ7gKs5zeV2DYe3jd+JhAK8
         LVswQTSpQZGckuoMzcGfGK3oOHoU/WQnpJWMl/aI0PXC1NfW1m5YfR4wWQ7VSfd1anqT
         WTOX4tDOCqVoSoRd3sTkzkSPBATpXGctrqR2FheniBOkq4TihMswjPzXRJTT8Hj0laWA
         hLyA==
X-Gm-Message-State: AOJu0YxFA2ccYWR4tUl92tDTdNEYG30yxlXJq1tWcGHK7ODCtGMgT7+W
	s2q0eu4/5bBcuHZ36frxCmDmEDGOsiuj9jayXRVStl4R72rkrRhdhQMZ4OpDdN0G9gWqgkDZfuI
	S/6q2mhpIK6oRQp4dElA2Lj7PfiiuagC3cMBsXBGc/nVMY3ZqPCLRZvOWxKd1I2DnCNc8ldDYIO
	H//oO3pLHK0UuYw9Lfj3HhPBZxH0MwTopFaaFbHASPJVOen+8fDICRgAjoDkRNDzc=
X-Google-Smtp-Source: AGHT+IF3Aj9rjblOcR3xPIzMTJeS1VxCNmkzb1lfjIl8FlvWxFuJ83OIWlXne2ViSMvh24ifU49i6uNyDCJKhgQ=
X-Received: from wrbdi3.prod.google.com ([2002:a05:6000:ac3:b0:42b:3346:5434])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310f:b0:429:bce4:20bf with SMTP id ffacd0b85a97d-42cc1d194fdmr45269347f8f.55.1764704298588;
 Tue, 02 Dec 2025 11:38:18 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:48 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=s5F849cKunCWhXEDw04RDI6ouvr7CQTpbwq+FWSvJxw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJWR/fRnVCj+DsWwJtPSwRwrcDjpzyN8mfq
 0sOX8tn6DKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 RvZUD/4qk2bOPLDVVH6o1xUcG7fKDtuBkgkvoaYHvWDhZyyaKHD8OGY9owyeYUcmt0x2jXq7bqH
 EPkgKOcp+3Cw0AfukXcyx0o+uatdJultYdvh+OrKvhTVEBLmA0BJON86RPamY6m8AGpKPlf2NjT
 UyRL9U+voiZJXo0oBSw0cGHezDPy7vYIWpncqGphzipHTJ30X6ilRQFdkfhXulX+ElmXbUxvZUJ
 Am24xCt59rrJ9xE/WRBI9qf4jSVJFsbmJl0PRxsuBLTkRQmsHUhWLHCslAoFx9/6QcrwavEyPR8
 4h1GQG5bXrYNh2hXa9cX+0vroiDZ/HxAs6VzgVMc6N1idyZWwcAodb6uiyz3PCGUf4NPNE+1P8q
 WUvfZO24jxODhRZXzfvUHqrZ2rL05qBY5uzj9XPpB/7EOF3ALh2PRTa2ze8+q6lVrQBF8zThKNb
 D65FwQ7TvitYVjF2b7XPYnKHLOlJazGEx8NRmO+r3TKAD15fFqO78KZqjygtM+br0UeWHD5QyvP
 FI0vxWYerfITc94IYwV4sG47FHjRtyieKyrKXnj58n51wtj95YVr4IMNO4XTmTu/y7ok18iCzak
 X1Tn799NmNMmiOBUGzmsnHbx1oAI04dFiSaMXIfSvuvK+sEHy41PG2x+qznP/f4V9XUdqoEbx9s B+77XbIBao49Nvg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-24-a2e13cbc17a6@google.com>
Subject: [PATCH 24/46] rust: mm: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org
---
 rust/helpers/mm.c      | 20 ++++++++++----------
 rust/helpers/page.c    |  9 +++++----
 rust/helpers/vmalloc.c |  7 ++++---
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 81b510c96fd2692dcb7ab4705f790bd3a41a630e..b5540997bd20d4398e2838956ed70b2fb61c5661 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -3,48 +3,48 @@
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 
-void rust_helper_mmgrab(struct mm_struct *mm)
+__rust_helper void rust_helper_mmgrab(struct mm_struct *mm)
 {
 	mmgrab(mm);
 }
 
-void rust_helper_mmdrop(struct mm_struct *mm)
+__rust_helper void rust_helper_mmdrop(struct mm_struct *mm)
 {
 	mmdrop(mm);
 }
 
-void rust_helper_mmget(struct mm_struct *mm)
+__rust_helper void rust_helper_mmget(struct mm_struct *mm)
 {
 	mmget(mm);
 }
 
-bool rust_helper_mmget_not_zero(struct mm_struct *mm)
+__rust_helper bool rust_helper_mmget_not_zero(struct mm_struct *mm)
 {
 	return mmget_not_zero(mm);
 }
 
-void rust_helper_mmap_read_lock(struct mm_struct *mm)
+__rust_helper void rust_helper_mmap_read_lock(struct mm_struct *mm)
 {
 	mmap_read_lock(mm);
 }
 
-bool rust_helper_mmap_read_trylock(struct mm_struct *mm)
+__rust_helper bool rust_helper_mmap_read_trylock(struct mm_struct *mm)
 {
 	return mmap_read_trylock(mm);
 }
 
-void rust_helper_mmap_read_unlock(struct mm_struct *mm)
+__rust_helper void rust_helper_mmap_read_unlock(struct mm_struct *mm)
 {
 	mmap_read_unlock(mm);
 }
 
-struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
-					      unsigned long addr)
+__rust_helper struct vm_area_struct *
+rust_helper_vma_lookup(struct mm_struct *mm, unsigned long addr)
 {
 	return vma_lookup(mm, addr);
 }
 
-void rust_helper_vma_end_read(struct vm_area_struct *vma)
+__rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
 {
 	vma_end_read(vma);
 }
diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index 7144de5a61dbdb3006a668961cd1b09440e74908..f8463fbed2a2670ddfd4c23dc922b46b0913c3a2 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -4,23 +4,24 @@
 #include <linux/highmem.h>
 #include <linux/mm.h>
 
-struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
+__rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
+						   unsigned int order)
 {
 	return alloc_pages(gfp_mask, order);
 }
 
-void *rust_helper_kmap_local_page(struct page *page)
+__rust_helper void *rust_helper_kmap_local_page(struct page *page)
 {
 	return kmap_local_page(page);
 }
 
-void rust_helper_kunmap_local(const void *addr)
+__rust_helper void rust_helper_kunmap_local(const void *addr)
 {
 	kunmap_local(addr);
 }
 
 #ifndef NODE_NOT_IN_PAGE_FLAGS
-int rust_helper_page_to_nid(const struct page *page)
+__rust_helper int rust_helper_page_to_nid(const struct page *page)
 {
 	return page_to_nid(page);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 7d7f7336b3d2f5a32e6a2b6cf8407da37775cfd9..469ebf2f41c94744e2a2719d7c0eb7d4d7dc58ff 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -2,9 +2,10 @@
 
 #include <linux/vmalloc.h>
 
-void * __must_check __realloc_size(2)
-rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
-				gfp_t flags, int node)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_vrealloc_node_align(const void *p, size_t size,
+					unsigned long align, gfp_t flags,
+					int node)
 {
 	return vrealloc_node_align(p, size, align, flags, node);
 }

-- 
2.52.0.158.g65b55ccf14-goog

