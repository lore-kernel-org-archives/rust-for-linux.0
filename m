Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DD4D5966
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157438; cv=none; b=WLvM56TlhFXaZ5o9QRu9MEsfSSVuVye1Im2LJ6V6tY7miR3cX/7kWroR71IAOoPL3o6um5QgdAVEbzklgJP0nkc2lZFMwhNdq/2eJzwuw/5OaP5k9bAkXQaoy7aUzyH/DvEmDJqlh0z04gA5rYSgpd59tnAB79tKH0bh3PZEV5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157438; c=relaxed/simple;
	bh=e7El8JVzuCckJxWrAaf3VRho7SDEP+z8OekEMMCb2Po=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DBwsUFZuj2GMAYj9hHJDmp9/zcFaDZ3Vdrau5nmNpA1Nv3ovVAJGfvgcOJDHizOFXQqVKxqG0VWzx4Mls92qhj9q7VwijA9GiD47eQjl+sQZQq+UZjmc/ZAyqZ95eYCGd/VFTqRw3x8kScVxNmOif3U/lrwv8EKyb9GZ3Sa8zLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LMv0rCqL; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LMv0rCqL"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b00febba3so5033613f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792157430; x=1792762230; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZIpAdLqjWfhWgBtyxJ71j9kLYaSyELhA3AyKnuBJJU=;
        b=LMv0rCqLdz1B4EAC6mVImzHSGGSv/sZZqP3GeG/Vp/8PXGEWM7GGZGztIf5KS5SJK8
         gg70GWPxrkBUWlvKkM6efSGI9Akp/HTyxB8sVmrYxIySSD8rOo7csnJ7CmvU2JIMFDps
         Fb+hbr+mnnUuhcM0C6T/j+5jdPdLf/Tqezoc7I6j9xA4h7NGRJ5skuQ3z86vJI4VWoWw
         AHQ/buUNk3VyvoCrqudcWxyGp4y7CwpDHuFjIIb0/194wc5EoADSXfxSLa6DFiGpyeUd
         PmQ5zoO0oa9AWS8IMr5r+83ZB7uE3/iHJHuIrjrnd6wEma7FCWRTr99DG92K1ar3Xfuz
         4UlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157430; x=1792762230;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZIpAdLqjWfhWgBtyxJ71j9kLYaSyELhA3AyKnuBJJU=;
        b=owxYb5KOZtZD6Exn+DBtNvtTbYx2SW3JBF3bu3WAbo6Q4+d3daq56AV4uQ1UZjiWRn
         ySKi7AgrxwNhSVrArIHcvMB6E5W5RFp9pHjFFWgtTqZr1maAW9OwN4pcy0fEhDo/ZBiy
         SU51DAs4dI1ywLpp4mAhfCft86f+/LugzTf4it+3q88P3/9bAkJLYYbuieMJ6V4XZUeO
         SlNV6SX8l4kHEO0K0JW/vWW23Z1JqzrkF8fujhgXuozQNTbZcGncsZ9gYRQdh964Dg48
         TG2oSMBLKaMkoO3SXbR3gdr7XxFz7RcBKH8/ABU4Sz2clB3fc5ts/uuu8Cu0TvgJn4hj
         EeZg==
X-Forwarded-Encrypted: i=1; AKwUvBzaL7TQ6vPXlYR6WleP4q5kTkjlSoFDO4As7U2PTNWS+u1FYdjAB8gnf/gjM3ZMYvBzwF7gQbKpih96FbfECg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxxC++7Mv1dSvEV1wfdrTE/I9mrWYtEcOJc2ZdxDJnJaLh3RdO
	nXUlPMsnMiK3eEJmvfEG74n7bjoF+ck8Kxseq96W9Il2qAfNwMdDzpKPSKgmBEw7lWtwiVeZeTL
	CxtheQdy38ti0U+nNEg==
X-Received: from wmom10.prod.google.com ([2002:a05:600c:460a:b0:4a1:d08f:5d06])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr419166625e9.26.1792157429802;
 Fri, 16 Oct 2026 06:30:29 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:30:16 +0000
In-Reply-To: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=e7El8JVzuCckJxWrAaf3VRho7SDEP+z8OekEMMCb2Po=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0ibxm/pJuRR/eaxLabVg+WYFOjq8PzLjg9HGN
 Ng7jx+oXHCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatIm8QAKCRAEWL7uWMY5
 Rt8wD/4xV9Q8bXw1mZEz2tsam7qfZZT9L5xuUK/uWtKOZSPmrZ9L6tmK+BOCdREdBSP3X63WSiA
 JKnX7sqftIvrgPKBGh8vUyzcsXp+UEiF6ihLVo45bSVeDCyKhSBl7FKyIPNExKxAQdFDelHBe18
 n8tu7hnyH0npzscKCagq1CUJwQ/pWzrp81/wYlKVuOLHO2Vro7BePj37Kvtk9CspMezG10zZFXN
 nyCoC8Ko4gReoZ27GguonsWAWmM+iA4T3hNM6g7Fx6zwVdrISzXRrHAb49597uRD4xUltrP/Rgm
 /hfV3ydUKXoABK+qiNgXJdLgLx6Ym2s/0sG3M5x/aJm6vkmLSPyS9HppD18hnCNFXL0f3APap2x
 PXkUwa0mWKY5G1opKxqyjk4rA65T1s9lh7my0g2MCqfW7d6h0v4qpxXqnSb2fitsO0pdgKR7Ibp
 hgwB6qcwKcCvjrILG1Nf+ufsDUzI8gcLEVTwNm56SdPU1CaXMMS6+gt+AkI3tD70ghpMVFuFhF3
 jmvWPbB4MdM3HW+zNOIeFA9z0euJrjLkLBj9cPYIFcddjkQADFJbPCbBI3cAXM/LXU13UgBC82U
 slMx4quFUCar82bLqoYoGl4GJFKTJdptU5xKkLD+GYC+ukwanzPGLFQQ1SsBzSqU8HmBS+mJFpu nQ1TaHrIsOkuDEg==
X-Mailer: b4 0.14.3
Message-ID: <20261016-binder-memcg-v1-1-d659b8ae088b@google.com>
Subject: [PATCH 1/2] rust: page: add Page::alloc_page_memcg()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"T.J. Mercier" <tjmercier@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pages allocated on behalf of a userspace process and mapped into its
address space should be accounted to the process's memory cgroup. Thus,
add `Page::alloc_page_memcg()` to charge newly allocated pages using
`mem_cgroup_charge()`, and switch `Page::drop()` from `__free_pages()`
to `put_page()` so that charged folios are uncharged when freed.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/page.c | 17 +++++++++++++++++
 rust/kernel/page.rs | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index f8463fbed2a2..145758a8a954 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -2,6 +2,7 @@
 
 #include <linux/gfp.h>
 #include <linux/highmem.h>
+#include <linux/memcontrol.h>
 #include <linux/mm.h>
 
 __rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
@@ -10,6 +11,22 @@ __rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
 	return alloc_pages(gfp_mask, order);
 }
 
+__rust_helper void rust_helper_put_page(struct page *page)
+{
+	put_page(page);
+}
+
+__rust_helper struct folio *rust_helper_page_folio(struct page *page)
+{
+	return page_folio(page);
+}
+
+__rust_helper int rust_helper_mem_cgroup_charge(struct folio *folio,
+						struct mm_struct *mm, gfp_t gfp)
+{
+	return mem_cgroup_charge(folio, mm, gfp);
+}
+
 __rust_helper void *rust_helper_kmap_local_page(struct page *page)
 {
 	return kmap_local_page(page);
diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 1c0796ea229f..7a36b7dd6c9c 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -10,8 +10,10 @@
     bindings,
     error::{
         code::*,
+        Error,
         Result, //
     },
+    mm::Mm,
     uaccess::UserSliceReader, //
 };
 use core::{
@@ -195,6 +197,28 @@ pub fn alloc_page(flags: Flags) -> Result<Self, AllocError> {
         Ok(Self { page })
     }
 
+    /// Allocates a new page and charges it to the memory cgroup of `mm`.
+    #[inline]
+    pub fn alloc_page_memcg(flags: Flags, mm: &Mm) -> Result<Self, MemcgAllocError> {
+        let page = Self::alloc_page(flags)?;
+        // Note: Charging the folio with `mem_cgroup_charge()` only works because `Page::drop` uses
+        // `put_page()` (which uncharges the folio before freeing it) rather than `__free_pages()`.
+        //
+        // SAFETY: `page` was just allocated, so we hold the only reference to it and it is not
+        // yet charged to any memcg. `mm.as_raw()` is a valid pointer to an `mm_struct`.
+        let ret = unsafe {
+            bindings::mem_cgroup_charge(
+                bindings::page_folio(page.as_ptr()),
+                mm.as_raw(),
+                flags.as_raw(),
+            )
+        };
+        if ret != 0 {
+            return Err(MemcgAllocError::Memcg);
+        }
+        Ok(page)
+    }
+
     /// Returns a raw pointer to the page.
     pub fn as_ptr(&self) -> *mut bindings::page {
         self.page.as_ptr()
@@ -376,7 +400,31 @@ pub unsafe fn copy_from_user_slice_raw(
 impl Drop for Page {
     #[inline]
     fn drop(&mut self) {
+        // We need to use `put_page()` instead of `__free_pages()` to properly handle memcg
+        // accounting.
+        //
         // SAFETY: By the type invariants, we have ownership of the page and can free it.
-        unsafe { bindings::__free_pages(self.page.as_ptr(), 0) };
+        unsafe { bindings::put_page(self.page.as_ptr()) };
+    }
+}
+
+/// Error returned by [`Page::alloc_page_memcg`].
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub enum MemcgAllocError {
+    /// Allocating the page failed.
+    Alloc,
+    /// Charging the page to the memory cgroup failed.
+    Memcg,
+}
+
+impl From<AllocError> for MemcgAllocError {
+    fn from(_: AllocError) -> Self {
+        Self::Alloc
+    }
+}
+
+impl From<MemcgAllocError> for Error {
+    fn from(_: MemcgAllocError) -> Error {
+        ENOMEM
     }
 }

-- 
2.56.0.212.g129ede20d9-goog

