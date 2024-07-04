Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B21B3F18
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112917; cv=none; b=A88v8CF0UaNrIJ7+xwVG5MfqI6R6jKLRIZKu+2SPQvkpsIZFOAIOlC0hZmD3wb8sOJT9X9qmKxCRRiOzgY019cwyvoEwv6Jfd7ugH3GBRMbE4HVgnEb5LDO82tmg6gVbeIH0vzhmYZRsFR/BknzV9UuNzkKpfxuxqfpUwntgLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112917; c=relaxed/simple;
	bh=aqDUDzMLL0KBfzNb+W57apl4KxEClGQPXZoBULsxmbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvmCMdvi6GucJs8n9fyaeMJMn90fl7kSWQDjbjkfGv9YZT+YJc0oAYaF97ZVOsOJIwi8CIocu1UsbAk81GvQY61VlYvZsLobiOCO/QEQLi2NbplOm0cXEcykAqzpb9/NMHmwASXRFvajXBOJ+zZzMvjPIR3gx5rd8Jzd8LhRW5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OmX4/y/M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OmX4/y/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4BR7jnFeoylsc8H3CWU/Zy5FjcYkLHilMYKh3x+8ho=;
	b=OmX4/y/Meze0wD1rzIa7hkt3thWvYvhtNNIW/NQTA0Vz4HmDjZngWe3zzBwX3Wq0aZ4Usu
	7M7mr/g2IaIwNnll8PoUwYiriuk3LQv8fyjD+F+o75qnzdofrkeHgf02FB62hPGl5xoPo/
	UkNAbAHdPSl/PSYK+FByB6r8iFFUWDU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-JH8cQVIwPbGoSGWbxDyY7A-1; Thu, 04 Jul 2024 13:08:31 -0400
X-MC-Unique: JH8cQVIwPbGoSGWbxDyY7A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36785e6c1e6so556697f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112910; x=1720717710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4BR7jnFeoylsc8H3CWU/Zy5FjcYkLHilMYKh3x+8ho=;
        b=PWH7l9praesSHRUnkL0jFcEhWe+QDTvpYzJZfcFV35KwMHv5f4EuyTW8WL6sbQNw8+
         IiGPksZ7ECrrAE/guRmDKDNashlL4bvqoc3qW+Oc/vfJTmVTDbFQ3QYae0TKxMKAFYV4
         QaCcPciMKyMx0cI2UNA4A99dvPDxpSFUYpXvW3fDCHqFUFHKEIYf/Z/OeF+xR20CHH+7
         klfveJERBSYdTyZV7IsrKkoWO6bbjdwX9vakPxX+Z6Rapuntvcb4SDWXSsl3jBJfG4b5
         7qz+NCQ2XP/rnbZ+xlZXbrqUqP2yrws9kVPzVOzTELFwmeaNj+0IALzDLTzY8/DHzpRl
         BJAg==
X-Forwarded-Encrypted: i=1; AJvYcCXwlnUM80L0p3YAHcEEsAO+ZlxS/HqXMozYX8/7Wy6DaHwVPQH7/7zrUQ6Nzc987CYOsbhsrqPUdRix+vm8jHHUFWge93Kav5bWL7t6pLc=
X-Gm-Message-State: AOJu0Yzshdu3iIE5q1ts5PxPN7EGn0CGLTDK1KDhSAiKlSmtu3KupIy5
	jrJbEnU4rhDPqFLzMijVVY3KeUkUtxaS6gnyXYVy78sEP96YDHA4oTMvIhFygJTf7mK1AWEACwg
	oObrk3JIXBi24hd9XIKfvGIaXmo7u2/LUv21jh5CTEE8gPj9ozL0D6Wef/0lenv3F
X-Received: by 2002:adf:f28e:0:b0:367:4dce:1ff5 with SMTP id ffacd0b85a97d-3679dd36309mr1758610f8f.32.1720112909989;
        Thu, 04 Jul 2024 10:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtFP0X2+rYgV0THjQz9OOrD6kATfOo+R0GkmOlrj+yr/SK3gwzL+dt1XCgyR3THktcbaONoQ==
X-Received: by 2002:adf:f28e:0:b0:367:4dce:1ff5 with SMTP id ffacd0b85a97d-3679dd36309mr1758582f8f.32.1720112909619;
        Thu, 04 Jul 2024 10:08:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678ed75772sm6030398f8f.62.2024.07.04.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:29 -0700 (PDT)
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
Subject: [PATCH 04/20] rust: alloc: implement `Allocator` for `Kmalloc`
Date: Thu,  4 Jul 2024 19:06:32 +0200
Message-ID: <20240704170738.3621-5-dakr@redhat.com>
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

Implement `Allocator` for `Kmalloc`, the kernel's default allocator,
typically used for objects smaller than page size.

All memory allocations made with `Kmalloc` end up in `krealloc()`.

It serves as the default allocator for the subsequently introduced types
`KBox` and `KVec`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs           |  2 +-
 rust/kernel/alloc/allocator.rs | 74 ++++++++++++++++++++++++++++------
 2 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 462e00982510..8d79cc95dc1e 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -4,7 +4,7 @@
 
 #[cfg(not(test))]
 #[cfg(not(testlib))]
-mod allocator;
+pub mod allocator;
 pub mod box_ext;
 pub mod vec_ext;
 
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index e47ab8fe21ab..b7c0490f6415 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -5,9 +5,18 @@
 use super::{flags::*, Flags};
 use core::alloc::{GlobalAlloc, Layout};
 use core::ptr;
+use core::ptr::NonNull;
 
-struct Kmalloc;
+use crate::alloc::{AllocError, Allocator};
+use crate::bindings;
 
+/// The contiguous kernel allocator.
+///
+/// The contiguous kernel allocator only ever allocates physically contiguous memory through
+/// `bindings::krealloc`.
+pub struct Kmalloc;
+
+/// Returns a proper size to alloc a new object aligned to `new_layout`'s alignment.
 fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
     let layout = new_layout.pad_to_align();
@@ -27,7 +36,7 @@ fn aligned_size(new_layout: Layout) -> usize {
     size
 }
 
-/// Calls `krealloc` with a proper size to alloc a new object aligned to `new_layout`'s alignment.
+/// Calls `krealloc` with a proper size to alloc a new object.
 ///
 /// # Safety
 ///
@@ -48,20 +57,54 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
     }
 }
 
+unsafe impl Allocator for Kmalloc {
+    unsafe fn realloc(
+        &self,
+        old_ptr: *mut u8,
+        _old_size: usize,
+        layout: Layout,
+        flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        let size = aligned_size(layout);
+
+        // SAFETY: `src` is guaranteed to point to valid memory with a size of at least
+        // `old_size`, which was previously allocated with this `Allocator` or NULL.
+        let raw_ptr = unsafe {
+            // If `size == 0` and `old_ptr != NULL` `krealloc()` frees the memory behind the
+            // pointer.
+            bindings::krealloc(old_ptr.cast(), size, flags.0).cast()
+        };
+
+        let ptr = if size == 0 {
+            NonNull::dangling()
+        } else {
+            NonNull::new(raw_ptr).ok_or(AllocError)?
+        };
+
+        Ok(NonNull::slice_from_raw_parts(ptr, size))
+    }
+}
+
 unsafe impl GlobalAlloc for Kmalloc {
     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
-        // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
-        // requirement.
-        unsafe { krealloc_aligned(ptr::null_mut(), layout, GFP_KERNEL) }
+        let this: &dyn Allocator = self;
+
+        match this.alloc(layout, GFP_KERNEL) {
+            Ok(ptr) => ptr.as_ptr().cast(),
+            Err(_) => ptr::null_mut(),
+        }
     }
 
     unsafe fn dealloc(&self, ptr: *mut u8, _layout: Layout) {
-        unsafe {
-            bindings::kfree(ptr as *const core::ffi::c_void);
-        }
+        // SAFETY: The safety requirements of `dealloc` are a superset of the ones of
+        // `Allocator::free`.
+        unsafe { self.free(ptr) }
     }
 
     unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
+        let this: &dyn Allocator = self;
+        let old_size = layout.size();
+
         // SAFETY:
         // - `new_size`, when rounded up to the nearest multiple of `layout.align()`, will not
         //   overflow `isize` by the function safety requirement.
@@ -73,13 +116,20 @@ unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, new_size: usize) -> *mut
         //   requirement.
         // - the size of `layout` is not zero because `new_size` is not zero by the function safety
         //   requirement.
-        unsafe { krealloc_aligned(ptr, layout, GFP_KERNEL) }
+        // - `old_size` represents the memory that needs to be preserved.
+        match unsafe { this.realloc(ptr, old_size, layout, GFP_KERNEL) } {
+            Ok(ptr) => ptr.as_ptr().cast(),
+            Err(_) => ptr::null_mut(),
+        }
     }
 
     unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
-        // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
-        // requirement.
-        unsafe { krealloc_aligned(ptr::null_mut(), layout, GFP_KERNEL | __GFP_ZERO) }
+        let this: &dyn Allocator = self;
+
+        match this.alloc(layout, GFP_KERNEL | __GFP_ZERO) {
+            Ok(ptr) => ptr.as_ptr().cast(),
+            Err(_) => ptr::null_mut(),
+        }
     }
 }
 
-- 
2.45.2

