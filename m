Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9430F535
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152077; cv=none; b=CuemSaz0Ne00fk+8SJykRv7RlLid92QRP5p68fSYuJHhb+PasgCA5UTmiYAg4frOFVSP/GiW1JbS4xCqZEJgFMsLVUGpYi9fuuTuVxmGI0TXCtsGu2lxLGrwu53v6TvH0KrZPFb8ZKc6JBZgguSE6G7hxazTWrHIme/0nXNQVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152077; c=relaxed/simple;
	bh=c8/thFJDN/UgryeDScJ+escZtWjAhYIGhui0hzCl4Qc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GOUlbazHM3alg5nLeNlhMLB/XyKxaHFPXWxoU2/HHJM1XGFhXhlkF7Yyz3iWAA7d+svcGG81vxPhEwCFVNIqi9qZiudkBwRhk59IwjJz71Jd5M2yuIeLSdTqAMXzcK1zZINX5Zud1HU5bWCfVsNfl1IGQdL6vIbuWl+JRl/t7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TFBNMHHO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TFBNMHHO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48a5952c635so7181565e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778152074; x=1778756874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96wqgdzB1qNP9htR3bQ5evm1FwspyJ/v2h/BJXWKmQY=;
        b=TFBNMHHOJfki3QAIt4cFeXg45F1crh1PQobNLOJ3IfU5Y4h8hLAR0dSccIDOE/6mbD
         bDH/TzZ64CMNGvcWKqWJmkcb6YfxxRVSYg/XEdy9FLsSQ2iZlHmHn28WP/T38JJluWbF
         CHO+Of8c7v3miwWQJ5S2bYVrFK9A9BYLB6TM1cxWpbgMQXVvvEIyvMQtiBJcOArYq3tD
         /JNLCEeFOjg5PNa9u9T/P8ivUu5seOnbseb9P0BsQSQT8WYxZB/tkzMDC3lifwC7uSoQ
         xF1uuQ6s0llh0W9W6yLmkEg1psS9OBYVmwmp7980UvZ0WTdWt7OkV6ftJrarkjADyBnq
         Nn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152074; x=1778756874;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96wqgdzB1qNP9htR3bQ5evm1FwspyJ/v2h/BJXWKmQY=;
        b=eHh9bZMYF+JVP+/snvgL+AINyD1nupd+YyJEoCQ2Rkw6P/gi6GX6Ju3AAwgDkMFNrH
         bJpbLfHxPU/FNoHX3KuFJY75jqTbe81bskOgNSH1P3DpkbgkOqape2QgbSzrr//765oN
         8dDbZb2P9CDfyb9HNeWhUd6iLXco1vVrOJnnY2/BFcqBTQkORH+QabYfiGOr1cpIH3Qw
         eSV0DrVxGUnL/O1EgRKcBSCsPC8doUgN0SSaUJSxiZb/QNMA+MKKygSVuhdaF++gwwG0
         PGSPnCH5Mxc1yRu/zH4eXlfQb9D7wipA6KzrId6SQ2fYL7FrDxIeOKD2M7kZpqhv6i5/
         IgdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dfpRrqmie6chzgIhhO4hpenGSARJ+jGmQv8HouPrgO7BEmt9sBd3RZKNTTO2+HklcCFnF1YBY6sU4uQ0Wyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iE03bUx1cGUsma3jzFsmMphL++uLrfoModzx7p2Cib1BhGcG
	vTxbPj7SQzhd2Bx5mhFkJBoj30v4rt0u4A6fIVcPs4ehs7suwGQB80abcOWWtV1c2tNeGTVBJUc
	ko1/TCM63FO0v6WBQHw==
X-Received: from wmaz10.prod.google.com ([2002:a05:600c:6d8a:b0:489:1b01:386f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8485:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48e51f32a6fmr129081145e9.15.1778152074296;
 Thu, 07 May 2026 04:07:54 -0700 (PDT)
Date: Thu, 07 May 2026 11:07:47 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIJy/GkC/x2MQQqAIBAAvxJ7TlDBgr4SHUzXWiyNFSKQ/p50m
 znMVCjIhAWmrgLjTYVyaqL6Dtxu04aCfHPQUg/SyFGslDyyKDtTig2O7OJ9WmFUCKMftAraQKs vxkDPf56X9/0Ag2ZN3GkAAAA=
X-Change-Id: 20260507-binder-shrinker-lockvma-51ff7d621f25
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=c8/thFJDN/UgryeDScJ+escZtWjAhYIGhui0hzCl4Qc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp/HKELVKJZIjusH/kk1vQC1NcJVmdZ8s6fmPcu
 OEyVzE1beyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCafxyhAAKCRAEWL7uWMY5
 RnCCEACYCaPfKVvg5gzG3Q4VoJsQAu1S2L4JqdBScEi2ciEe4pE9vp8uMSz+GvnwHeVuIOyqkFg
 v/eMglNqpsug6KWSTWjfCWmOActM7ybDr4JfaOBcTRGagIbSgcXx1dvndyFVXlxXzeWa6gMtH2c
 RjO3M5pe1mPm0zqv3G8cu+EVYiyB9H2o26KQUyEiZHflhckqwZfiVgVkdUO+t6/ZFXlPtMLQ8HE
 77Mx8s/4UkqZPB/h0sI7G5Il4vBp2m1h4klVJ7cJklDWxoNbhWw3CO0ea+3sQLmr4sl9T1ttU8j
 tYlF5piXfINjJXZmm/n8wBpUhLQLKXtdyd3PleXOQl7VA+0h1ubS414cxk4IJY7UKiiuPy45KD7
 MV+BsfUC9mSVja1X58IRiU3tfNpwTo1PkaJO4Q5DwlPJdgAcCB1ZlOlH9rkK1GlD38k6y+BGOwc
 W3mNi1BR/yqNAAQg+n2GqH0JLJuhT7I5NrbmWttYM0RLTdg4sjt3wVzd3OGjVS52DQnLSKRySw0
 fGYT0ktBi2w/iOvi+ffNogGy/rtfnWXCELXSxO8E+093xpYiNp2lDPqVO04qPaYhaWTJBpc+qgP
 9X+jxkq8AyyI2ltQsjBCFKosJAn1STFd/jmriwHVwuQUiw6A+AK6P8ammOB12d7RUxzh04W1GqC pwTYc0kivMysqhA==
X-Mailer: b4 0.14.3
Message-ID: <20260507-binder-shrinker-lockvma-v1-1-76e3406bbfa6@google.com>
Subject: [PATCH] rust_binder: use lock_vma_under_rcu() in shrinker
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The shrinker callback currently uses the mmap read trylock operation to
attempt to access the vma, but it's generally better to only lock the
vma instead of the whole mmap when you can.

When lock_vma_under_rcu() fails, there is no reason to lock the mmap
lock instead because it's already a trylock operation that is allowed to
fail.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/page_range.rs | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index e54a90e62402..e82a5523804f 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -705,7 +705,7 @@ fn drop(self: Pin<&mut Self>) {
     let page;
     let page_index;
     let mm;
-    let mmap_read;
+    let vma_read;
     let mm_mutex;
     let vma_addr;
     let range_ptr;
@@ -728,17 +728,18 @@ fn drop(self: Pin<&mut Self>) {
             None => return LRU_SKIP,
         };
 
-        mmap_read = match mm.mmap_read_trylock() {
-            Some(guard) => guard,
-            None => return LRU_SKIP,
-        };
-
         // We can't lock it normally here, since we hold the lru lock.
         let inner = match range.lock.try_lock() {
             Some(inner) => inner,
             None => return LRU_SKIP,
         };
 
+        vma_addr = inner.vma_addr;
+        vma_read = match mm.lock_vma_under_rcu(vma_addr) {
+            Some(guard) => guard,
+            None => return LRU_SKIP,
+        };
+
         // SAFETY: The item is in this lru list, so it's okay to remove it.
         unsafe { bindings::list_lru_isolate(lru, item) };
 
@@ -751,7 +752,6 @@ fn drop(self: Pin<&mut Self>) {
         // `zap_page_range` before we release the mmap lock, so `use_page_slow` will not be able to
         // insert a new page until after our call to `zap_page_range`.
         page = unsafe { PageInfo::take_page(info) };
-        vma_addr = inner.vma_addr;
 
         // From this point on, we don't access this PageInfo or ShrinkablePageRange again, because
         // they can be freed at any point after we unlock `lru_lock`. This is with the exception of
@@ -761,14 +761,12 @@ fn drop(self: Pin<&mut Self>) {
     // SAFETY: The lru lock is locked when this method is called.
     unsafe { bindings::spin_unlock(&raw mut (*lru).lock) };
 
-    if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
-        if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
-            let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
-            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
-        }
+    if let Some(vma) = check_vma(&vma_read, range_ptr) {
+        let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
+        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
     }
 
-    drop(mmap_read);
+    drop(vma_read);
     drop(mm_mutex);
     drop(mm);
     drop(page);

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260507-binder-shrinker-lockvma-51ff7d621f25

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

