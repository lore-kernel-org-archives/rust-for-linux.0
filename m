Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D71BBBF8
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112922; cv=none; b=o1Drm9VyZDYAL6NAKHXNLKqoNYy37Y6oqOIhimcV7Hn9PDgLJG+xqychuTCH1K73j4idB8nYwiG4w/5kwTBXX9Dr9SpkvTi0EidmTGBpqc9zWIFtbsxpH7TL7G6EeQcKxwNjWIghFNOGgGBJkFgX9qu0guOZIOBO3JB8iBOfseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112922; c=relaxed/simple;
	bh=YcnAH3SHZXROeNoMHnipvFfals1BnUzQ96nTlnvMQFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EO2vJxqoLXlDEQ1nYzhnSJWSXp/Q37mFJxG+uwlHUrW85aKkib0f4tquUaukcOGN1O6xdu/XscIVLcuPqdcv5BV8T/16D3MC2yWG+VXhHcBU1ZM/EggBi4M7JI1Y7wEdsjDMPY0xd2GN6G0hzOpHk1VYofOLc813Xl2MoryBJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3KoE2B3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3KoE2B3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0UMICwsMRzMsfA9s19JVB8HcVWOB39iLX8GByK/zHc=;
	b=B3KoE2B3E9QAmfByZnPwoHIqoFTFiKp/gnWeWhlM2TEpZm42cDG7SSPkabLMkM7leLsR6O
	JYpPDwKn70RdMdS2NnfuoxgNoRS8r/WvolEZkejufZBZlFGVbji6945tv5k8eYiOz/Ang+
	qmmwQhsTKuFcKyUPzY52uTiE5nhdpzY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-pwhhgVVTOym7NFdEZ6tFvQ-1; Thu, 04 Jul 2024 13:08:39 -0400
X-MC-Unique: pwhhgVVTOym7NFdEZ6tFvQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3679aa0ee0aso547629f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112918; x=1720717718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0UMICwsMRzMsfA9s19JVB8HcVWOB39iLX8GByK/zHc=;
        b=cvaowrrDEfhfOR9YXtT11QkYEp8euXL/fjuUYOOb9uunq6AU1/PowZsJhBZsWV1/RU
         suE3ACiLnJibaGPo8h+bjD42xJ4Fdb1Y2lh28OdVxsSrkaFzRuOHZ1+6tC6BI/du1MHP
         DRb5M6U1JuCPWcjA8VbVIu5eHNPp0mxuEpE2YC4isUC6t9AM/SJAUXSQq+vtDd79fikc
         RW1s0fpImsY9YxfNr0l9FPkkmBtt/zTwGpKe9MPS8GeFT2HEdyblUbxMWY6c7NL5HdFP
         MfCWXS5cvLHzaJdO7M5Cwb+aBPjVZwyVlZuAVIdiHXhXBMf0vs0Giu1d2h8E+v04C8bx
         Y1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZQYw9yWQ2G9tg6eK0ah+O9woXCPozu6HywfQs6R9Ri8nMj4QKnULhJiwBZjsjGl+tpjhtQZUs4OiE2fptHwPU/LOGTh5dRivJl5amm4=
X-Gm-Message-State: AOJu0YyRfpXuXuoG+ybrBc8Iw0ENqSwWBd3mxI31VekIYl6urerJ/NBK
	dd/debwOhld3r178xJALxhiDmF7IayOXP51Fh8yhkttIwnXo1V5dh9Qh2OkS6U+b5wCR4+D+zRF
	H6XBCU47VdjpaYI1edo2otXOxtvN8u9fPf3q4RTRFkbxJvmOuqRqzGUB2WS2e6o1L
X-Received: by 2002:a05:6000:12c6:b0:367:91cf:e890 with SMTP id ffacd0b85a97d-3679dd10283mr1823255f8f.6.1720112917798;
        Thu, 04 Jul 2024 10:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/XJEdVUhXEyatK6ngjqfp7NJ4Le1ciarBr+9Y1EF175deeq20/plyxZJPo3uVQ0XayyddFQ==
X-Received: by 2002:a05:6000:12c6:b0:367:91cf:e890 with SMTP id ffacd0b85a97d-3679dd10283mr1823239f8f.6.1720112917535;
        Thu, 04 Jul 2024 10:08:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a3016f8bsm877280f8f.46.2024.07.04.10.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 06/20] rust: alloc: remove `krealloc_aligned`
Date: Thu,  4 Jul 2024 19:06:34 +0200
Message-ID: <20240704170738.3621-7-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704170738.3621-1-dakr@redhat.com>
References: <20240704170738.3621-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that we have `Allocator` for `Kmalloc` in place, remove explicit
calls to `krealloc_aligned` and get rid of `krealloc_aligned` itself.

`bindings::krealloc` should only be called from `Kmalloc::realloc`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs | 21 ---------------------
 rust/kernel/alloc/box_ext.rs   | 13 ++++---------
 rust/kernel/alloc/vec_ext.rs   | 23 +++++++++++++----------
 3 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index b7c0490f6415..1860cb79b875 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -36,27 +36,6 @@ fn aligned_size(new_layout: Layout) -> usize {
     size
 }
 
-/// Calls `krealloc` with a proper size to alloc a new object.
-///
-/// # Safety
-///
-/// - `ptr` can be either null or a pointer which has been allocated by this allocator.
-/// - `new_layout` must have a non-zero size.
-pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: Flags) -> *mut u8 {
-    // SAFETY:
-    // - `ptr` is either null or a pointer returned from a previous `k{re}alloc()` by the
-    //   function safety requirement.
-    // - `size` is greater than 0 since it's either a `layout.size()` (which cannot be zero
-    //   according to the function safety requirement) or a result from `next_power_of_two()`.
-    unsafe {
-        bindings::krealloc(
-            ptr as *const core::ffi::c_void,
-            aligned_size(new_layout),
-            flags.0,
-        ) as *mut u8
-    }
-}
-
 unsafe impl Allocator for Kmalloc {
     unsafe fn realloc(
         &self,
diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index 829cb1c1cf9e..1aeae02c147e 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -33,24 +33,19 @@ fn new_uninit(_flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError> {
     #[cfg(not(any(test, testlib)))]
     fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError> {
         let ptr = if core::mem::size_of::<MaybeUninit<T>>() == 0 {
-            core::ptr::NonNull::<_>::dangling().as_ptr()
+            core::ptr::NonNull::dangling()
         } else {
+            let alloc: &dyn super::Allocator = &super::allocator::Kmalloc;
             let layout = core::alloc::Layout::new::<MaybeUninit<T>>();
 
             // SAFETY: Memory is being allocated (first arg is null). The only other source of
             // safety issues is sleeping on atomic context, which is addressed by klint. Lastly,
             // the type is not a SZT (checked above).
-            let ptr =
-                unsafe { super::allocator::krealloc_aligned(core::ptr::null_mut(), layout, flags) };
-            if ptr.is_null() {
-                return Err(AllocError);
-            }
-
-            ptr.cast::<MaybeUninit<T>>()
+            alloc.alloc(layout, flags)?.cast()
         };
 
         // SAFETY: For non-zero-sized types, we allocate above using the global allocator. For
         // zero-sized types, we use `NonNull::dangling`.
-        Ok(unsafe { Box::from_raw(ptr) })
+        Ok(unsafe { Box::from_raw(ptr.as_ptr()) })
     }
 }
diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index e9a81052728a..bf277976ed38 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -118,6 +118,7 @@ fn reserve(&mut self, additional: usize, _flags: Flags) -> Result<(), AllocError
 
     #[cfg(not(any(test, testlib)))]
     fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError> {
+        let alloc: &dyn super::Allocator = &super::allocator::Kmalloc;
         let len = self.len();
         let cap = self.capacity();
 
@@ -145,16 +146,18 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
 
         // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
         // `krealloc_aligned`. We also verified that the type is not a ZST.
-        let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };
-        if new_ptr.is_null() {
-            // SAFETY: We are just rebuilding the existing `Vec` with no changes.
-            unsafe { rebuild(self, old_ptr, len, cap) };
-            Err(AllocError)
-        } else {
-            // SAFETY: `ptr` has been reallocated with the layout for `new_cap` elements. New cap
-            // is greater than `cap`, so it continues to be >= `len`.
-            unsafe { rebuild(self, new_ptr.cast::<T>(), len, new_cap) };
-            Ok(())
+        match unsafe { alloc.realloc(ptr.cast(), cap, layout, flags) } {
+            Ok(ptr) => {
+                // SAFETY: `ptr` has been reallocated with the layout for `new_cap` elements.
+                // `new_cap` is greater than `cap`, so it continues to be >= `len`.
+                unsafe { rebuild(self, ptr.as_ptr().cast(), len, new_cap) };
+                Ok(())
+            }
+            Err(err) => {
+                // SAFETY: We are just rebuilding the existing `Vec` with no changes.
+                unsafe { rebuild(self, old_ptr, len, cap) };
+                Err(err)
+            }
         }
     }
 }
-- 
2.45.2

