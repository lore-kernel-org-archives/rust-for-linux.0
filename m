Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55A1BD4E4
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112926; cv=none; b=QeURnrvGb2/ZQoyVx30RgxsiZgdzTocvKjybK05zJyk7oSY/hWLxpWDTijEjuCju+lNk1GGZS6SPzD+CZz7dC48/HlwxCYEaPimyrKpL9SQ4oxB+G8nVOg8UW54eAYGcOLfcOrDCsIJxmIj5t3/itCP4TzwostfEaMVuEBALpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112926; c=relaxed/simple;
	bh=MmT2mTIg7lD3LQpVQ6BofZ6b0wOersBEjYOE2yVnphM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snAtVnD/7ZefcOQGK+6Z5bd3QdfwVppdY99h8WlY00/Ov77mXTQco8MZf7q8P5WRrQXFKVvZOfd/plEVEKerLzayH/Y/2H8mD0Pfs5UAMIS74BkKsJAdjolklVv3YnHEu/YKlXkAgL5gH1R1EBFmEwq6fVycKmH73hENaFZF+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a9huNEjo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9huNEjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxr2ZwkBcEiYjaLoRj6Vm8ZHty9ueyrSMs+jrT+4p3E=;
	b=a9huNEjoG7Xy9it2OA5xv4upmyfRSxK3O9wZOar3aIFqNAKEG3aHktI7CfsxTqwuQPq5S0
	gs6/6N4LpBbWex+iRVy9efi2bp0U0tiMj+1SOUNT8E1qVAC3Sju3OTrO1Rgr1MvAPHhE0U
	IyL1Si0JRVZzqNaS8kvnVCI561xWGFM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-e7YNtyONPOuuu3hKs0b6AA-1; Thu, 04 Jul 2024 13:08:43 -0400
X-MC-Unique: e7YNtyONPOuuu3hKs0b6AA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4264fc808edso120505e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112922; x=1720717722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxr2ZwkBcEiYjaLoRj6Vm8ZHty9ueyrSMs+jrT+4p3E=;
        b=emU9rxY1kxGFRALLP2b8IrCEk4bwCmHKpLK5Ve0J1KInwSTci1kVnOKmunUfNtd+sR
         vLdUNR4RMXCG7xttCXwjE/cwWCsp5QvPUtmSjf82IGLjA0QXLNHkMnnL2tI515to01UP
         mPe6kl/j3362CpcB/K6pG1kB70mDTaZ7YijLWGuPnVdsWC1DPmW6kh8hiMbHvwtL21ye
         zto+83Uli2oqF2femFPf7irzcPFeOOpX92m/Z71ddSxxcUOFKBadrGlW7VHPDiv9e+jW
         BAqMgi0AmmqiMQ9Zs8AnsNYwozVmMuGJlBxPApJUNwx+YlU31gJtvX/+BEGGpAXSL0hD
         4bvg==
X-Forwarded-Encrypted: i=1; AJvYcCW52IgA+sWfa9zIpUUxDI6ZhPBACfQFe0W0xt+j+8eNBfNaDZ6dB1V0195cOAkMIfliQMkLsOQkwj5CI3pg5VVg0Hmo0ML4T73GFWIzuRA=
X-Gm-Message-State: AOJu0Yw9o7m5mj8OzcLYoh6AxrbEtK4K9mpy6z+vyp6F5oHMPUpe9D11
	aacwa2GsstjC7rEZR8cTTQl4V1B/jVqHNPFVV+JEzBZqMHbStqQ9AAOI1B3dKf1925nBxgMqjet
	9VSHxUXvJQEDp3A0PWPGbbEcyuNgzduyY2IrCUUiNsAqRu3MDd/NfTwaa9u+3/+Ne
X-Received: by 2002:a05:600c:4f88:b0:424:ad14:6b79 with SMTP id 5b1f17b1804b1-4264a3cc8bdmr13990935e9.8.1720112921745;
        Thu, 04 Jul 2024 10:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1VJwx5uKuQN/O8iZw/4yKAqhZVwMwMz3EKnS+JDkXDZHxAy/WJXVoREQUOWvD5/92MPuUDA==
X-Received: by 2002:a05:600c:4f88:b0:424:ad14:6b79 with SMTP id 5b1f17b1804b1-4264a3cc8bdmr13990825e9.8.1720112921452;
        Thu, 04 Jul 2024 10:08:41 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264d5101ffsm17492075e9.16.2024.07.04.10.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:41 -0700 (PDT)
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
Subject: [PATCH 07/20] rust: alloc: implement `Vmalloc` allocator
Date: Thu,  4 Jul 2024 19:06:35 +0200
Message-ID: <20240704170738.3621-8-dakr@redhat.com>
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

Implement `Allocator` for `Vmalloc`, the kernel's virtually contiguous
allocator, typically used for larger objects, (much) larger than page
size.

All memory allocations made with `Vmalloc` end up in
`__vmalloc_noprof()`; all frees in `vfree()`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h     |  1 +
 rust/kernel/alloc/allocator.rs      | 55 +++++++++++++++++++++++++++++
 rust/kernel/alloc/allocator_test.rs |  1 +
 3 files changed, 57 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ddb5644d4fd9..f10518045c16 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 1860cb79b875..0a4f27c5c3a6 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -16,6 +16,12 @@
 /// `bindings::krealloc`.
 pub struct Kmalloc;
 
+/// The virtually contiguous kernel allocator.
+///
+/// The vmalloc allocator allocates pages from the page level allocator and maps them into the
+/// contiguous kernel virtual space.
+pub struct Vmalloc;
+
 /// Returns a proper size to alloc a new object aligned to `new_layout`'s alignment.
 fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -112,6 +118,55 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
     }
 }
 
+unsafe impl Allocator for Vmalloc {
+    unsafe fn realloc(
+        &self,
+        src: *mut u8,
+        old_size: usize,
+        layout: Layout,
+        flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        let mut size = aligned_size(layout);
+
+        let dst = if size == 0 {
+            // SAFETY: `src` is guaranteed to be previously allocated with this `Allocator` or NULL.
+            unsafe { bindings::vfree(src.cast()) };
+            NonNull::dangling()
+        } else if size <= old_size {
+            size = old_size;
+            NonNull::new(src).ok_or(AllocError)?
+        } else {
+            // SAFETY: `src` is guaranteed to point to valid memory with a size of at least
+            // `old_size`, which was previously allocated with this `Allocator` or NULL.
+            let dst = unsafe { bindings::__vmalloc_noprof(size as u64, flags.0) };
+
+            // Validate that we actually allocated the requested memory.
+            let dst = NonNull::new(dst.cast()).ok_or(AllocError)?;
+
+            if !src.is_null() {
+                // SAFETY: `src` is guaranteed to point to valid memory with a size of at least
+                // `old_size`; `dst` is guaranteed to point to valid memory with a size of at least
+                // `size`.
+                unsafe {
+                    core::ptr::copy_nonoverlapping(
+                        src,
+                        dst.as_ptr(),
+                        core::cmp::min(old_size, size),
+                    )
+                };
+
+                // SAFETY: `src` is guaranteed to be previously allocated with this `Allocator` or
+                // NULL.
+                unsafe { bindings::vfree(src.cast()) }
+            }
+
+            dst
+        };
+
+        Ok(NonNull::slice_from_raw_parts(dst, size))
+    }
+}
+
 #[global_allocator]
 static ALLOCATOR: Kmalloc = Kmalloc;
 
diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index 3a0abe65491d..b2d7db492ba6 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -7,6 +7,7 @@
 use core::ptr::NonNull;
 
 pub struct Kmalloc;
+pub type Vmalloc = Kmalloc;
 
 unsafe impl Allocator for Kmalloc {
     unsafe fn realloc(
-- 
2.45.2

