Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D97339B30
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616978; cv=none; b=ArW9Gh0ybZUXtKHPQVz6P1zlMA/+v6s6QMTZzC1tCxdbJzJP7dyltVNLEwR/L8zghV+xLs4444OJbJKOQUxG+m2MJPy9UBo8Id56UKLo0V5CZFiLh7qmcPucShDuxampKzALEdIKIh4LW3oCi/343aVXzV17EqHCYQDGAWEz22c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616978; c=relaxed/simple;
	bh=3/t+NkFQ/sfvXAgi16TNI6nieZ3WONZSXYBl7iU98Ls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eIqt+05jSxfaMsi4J/F7XUNcmhjnRPRHE5DcA0w+I8UxPotVKxrLxVK793KUe2jRo8K9t1ASLqfaULQ3dt2h96UW0v4hp63tSvg7ws7jG7WulxFY42B+mb1VaeVaEEvBKcc1Oe28EaOKRPgS4SirH04d8F6Hb7XRqzs2oxO5cUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ImhJ+TY1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ImhJ+TY1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47a83800743so9450735e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616975; x=1768221775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7HijWvoQg86kFapHPJ6xmOixNwXXnFawvbJlN+o/VM=;
        b=ImhJ+TY1BTpBvW12C6ieWVZmWl8sq1vELiqhLB6wpS1TyE4dxUZLkaj5g+YFUVfyuU
         8ET8667XPPJzmZXfSgS85Uxw2b6LXGLB00yf6rVuaGyAJPWN5qvDp9ohsymauISiaS2p
         XHW2q5ZZ7N+pjdAIXmpMVi6R/B5uALizS0Nr/MutxQI9ydzvsP9r6zbb3ZMaNLfWmu7D
         rsFIcUabLZDi5yz+zREq2j1baPK+gYNqwBR5Rh6HHBIn6AncySdYKgltl7Z6yY8uLchb
         5YfVC1nLkVaUEq7RuJAXo/SrQK/PNLTh/FDYNMt962Pi07II36yFUPpyhLErjyV8l/dh
         /F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616975; x=1768221775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7HijWvoQg86kFapHPJ6xmOixNwXXnFawvbJlN+o/VM=;
        b=dNSpwflpnmUOEQ4e+ecWh+rNDEAemr240kGYjYptRShZOKnOdU+ZUjuY4AJKRhNa4s
         q+XCVQM0r/jXnUm22YhbJxqyi5y/c/QUrdMl+181CZp41wCXFi52xwMOI2ks0EnMCcWx
         su/+TWKQzAkF/l7h8IZUoqlZhV62IdY6DsQq3oepGgYmAzj3OzYdBgyP7vxxEs1eW3l6
         UnniZZ4eaGkKhOhIWXCnCbSADJVzQA+dvOt3875Q+uJlTLfbtQgyWI6ob6HjLFeMkd6L
         Bt2c4hnjb3sOv7ZxYwvOzaz5LjErcpFiglqLzHkRU+/3+EtlVqqRCyrpZ/5j5Scejaqr
         jm3A==
X-Gm-Message-State: AOJu0YyDN/rvn8sRrZDkpZkhtfZEAEY9pgzwqB0qtvMg7E+uNKlThtTs
	luDZM7LOv0ZQQ4Zo/lOGHQyXjpXM62OkvmZAWQZ1iEOAluBA3rfWznaLefX5JrGlrs63iYc48bg
	G4KwY0mDIXydqPujKxueDf07niy/cTgkp5csZMrQZyDryTww0M/Ij+oYM4Y6EbaSBUHTCAadPab
	5cklAUXdbEQYBMwIbCKQfikLZTkj2N1Y5zQvQ54L0Vq3PfKHmoUOUyWrdFTXeYB1g=
X-Google-Smtp-Source: AGHT+IGQAETQokUV/JmEC/jSfhuRPZE6uXyBIWU2Q87B+4EDRlagPdgjl1xTSF6npIccNEDFpslVc7TtC9mw1sQ=
X-Received: from wmmu7.prod.google.com ([2002:a05:600c:c7:b0:47d:1e65:e8bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6011:b0:477:a2f7:74de with SMTP id 5b1f17b1804b1-47d6ba7ab7dmr77941665e9.3.1767616974459;
 Mon, 05 Jan 2026 04:42:54 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:24 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3941; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3/t+NkFQ/sfvXAgi16TNI6nieZ3WONZSXYBl7iU98Ls=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G7Ch1In0wVFnxCsygufoE0Pqht57tzU6qB1
 YHQ1MVnmXuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 RvnCEACWTL2Y1XjPP/ZChNHZ14zqsEgGtEQdS94TPAkB19ro+4h8Vy0tsm/BkDEvSOXN6sWS/mP
 a4bNvB8id4ZNHcxQn8csjhzb72Oc5XH71W8k3tuDRM7FwTXPWLgifYc9XG5sAsJ8K/1uI56sYue
 vqpW6aXViP/AlaqktQ2iDHbU9BW3z+r4jL01UxG4UcwQM+kPy4MwgfmOr5UPAWqpq8FbR5vZof1
 bALG3Nwpm6v4KmG/bloFL0Tqpig2QsUyBgR3qk7eiUpyI7hspT3HU/Bkw6HlsAJ8N5hxuaSub9F
 qhYsUJCx517xFWAxLx73L6tDT3Wng5Uz8VxRWqMwO6aZcbSs/ifGbRPx2esospC7LHVsiGveDTC
 lZzfvx4x+AM4cvk7Mo5LStJdmR5/hxClL8zXlMFxtDLK+6Liq9rqKCw953jdnqtdgARjGVwMUFx
 eCY8ni1buXBWyeBjln2bmTPpx9oX/C1E4G3o1jsH9X7SNuQF7uFoovwFkf+rWywe6GZ57qu/pB4
 HbBMBxM9LFQf8cCmTX7Ay3squ/yQV6R+3RcbXakjX48exAQoE7ke8JgOwcAP+AvrCTzcADXXNdK
 YpwIRtLbq5E4+WfLTZmdztA2OlI+A6gC3Y2Wr6vRcPsnINEXlrjw/YwOyRcmC3lSZTFgvUkM5N9 dsPoRy3lSvPxVIQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-11-51da5f454a67@google.com>
Subject: [PATCH v2 11/27] rust: mm: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
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
 rust/helpers/vmalloc.c |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)

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
index 7d7f7336b3d2f5a32e6a2b6cf8407da37775cfd9..326b030487a2b2199283b64b3b427e57cf5fb14a 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -2,7 +2,7 @@
 
 #include <linux/vmalloc.h>
 
-void * __must_check __realloc_size(2)
+__rust_helper void *__must_check __realloc_size(2)
 rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
 				gfp_t flags, int node)
 {

-- 
2.52.0.351.gbe84eed79e-goog

