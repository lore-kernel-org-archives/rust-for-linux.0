Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3E1411D3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421585; cv=none; b=pERAb5c8QSPQDUh0pVeYD+T6pJh6A587Mbz6T9n9Ar4WGzOThJ9KrgK0GNAVHB1S6N8OguA9WOP7TRZinajzP1Nc3bT4jmrEbqJxf5t6YjaofjJ1APFRWUT9lYobzf8nAXN0vobJLk46fT8QAzBkqbMj/QJovDaM5EEQ8C3GZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421585; c=relaxed/simple;
	bh=Xj1pSDVsCmULZFyhtqkNS3MU4FIHVWu40vQk43YtcuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfQeL/KyKL0JOPnU2xaMh5KIOp2R/TYwyDoUxiihFNTHdcbdOfxwxZP50TraL/uMZF5G1cphG2pIZ9TNnj/pzOsUVPxuexYysyRrEGz/8yyJr0f5HjkWrnTFiZiyePyUBkMgCToccr0T6DuSXfwzbs7PAGJt6+fHv2uxSCJz3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BY1SmQr1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BY1SmQr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzQwSg51jPWyZ9cX1xVPxIDEzXtGK4Td3ncJ/9WnY9o=;
	b=BY1SmQr1OhsyRVmmnAu66A5LQcsOMZlH3nPwC7I4QYL0gvUnlMXGaaFoBlCNFnVDcKEFvD
	1qxTkoqSkfnjaN2k0AHfg2/39LF32jG7VZwL9lJUQ4mHsy1cCXL7fo6/CrywyX6/UUWQux
	aHzUSJ3vCq3/4fDqSbI+7alppmiGXzs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-wx3GzU99MX--SS2hLP7ETg-1; Mon, 29 Apr 2024 16:13:01 -0400
X-MC-Unique: wx3GzU99MX--SS2hLP7ETg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41bfb8c1ecaso9409855e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421580; x=1715026380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzQwSg51jPWyZ9cX1xVPxIDEzXtGK4Td3ncJ/9WnY9o=;
        b=ozSGogVGEpT4OPa4uEIHw8g6QChceEuyuUj+6FTWhHCHC6Nx3EViXU76yi0PoIVYSa
         +jRRP7lkvks7z/vDhy2yXAnNRS07IWHUqT8XNivw76mK3jrDuWWXcgH0x4qTIY5QNMhd
         flhj4i8W10tlfG22pDNASnfS6I2g3rNjMJ5PQxIKrjZuVsWRV7t9HtlGjg5SwpKPtgtk
         YOAIgVuqCTZcyuysz0bACYJ/mroSwsvNB3AFnlEw2Z2cS5qgV8IVl9zzN3za+9brL8Xm
         xqvSU9LvsSyNMZUdcioqp/gsGWFrBO+3k4v5poQn3xkmz3WjPHKXL4oC1G/SEOCGu9tq
         S7xA==
X-Gm-Message-State: AOJu0YwQovgRCdVZ/XYWzGU/pgy24O8nfXK9fqD4tah1jwtyFgO3TysY
	Q9WpwWvfKlmvvTJbHiM/FbtIWoV008tcq5X1ozHLtBtOEL7qvOt+rB9nZYwdpMbmcL3whZm6ozb
	xIFaUcaM01cX5xm3Y4GH+C5k5JHA4TLZalT+ZX/YkaO/3ZbtGSLv5/HvlKQ7Gt+eU
X-Received: by 2002:a05:600c:a41:b0:418:fe93:22d0 with SMTP id c1-20020a05600c0a4100b00418fe9322d0mr587994wmq.11.1714421580030;
        Mon, 29 Apr 2024 13:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsy4k/Bd8qh8AsdGif5ODOjI2iaaH9V8wc+FDM2NTB5l7ybVohme8s280u5POPlrGWdi48FQ==
X-Received: by 2002:a05:600c:a41:b0:418:fe93:22d0 with SMTP id c1-20020a05600c0a4100b00418fe9322d0mr587988wmq.11.1714421579824;
        Mon, 29 Apr 2024 13:12:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c500700b0041bc412899fsm11197518wmr.42.2024.04.29.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	ajanulgu@redhat.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH WIP 8/8] rust: alloc: implement vmalloc allocator
Date: Mon, 29 Apr 2024 22:11:58 +0200
Message-ID: <20240429201202.3490-9-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429201202.3490-1-dakr@redhat.com>
References: <20240429201202.3490-1-dakr@redhat.com>
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

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 173347ff018a..d3d0bbc41ab2 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -11,6 +11,7 @@
 use crate::alloc::AllocatorWithFlags;
 
 pub struct KernelAllocator;
+pub struct VmAllocator;
 
 pub(crate) fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -123,6 +124,42 @@ unsafe fn realloc_flags(&self, ptr: *mut u8, _old_size: usize, layout: Layout, f
     }
 }
 
+unsafe impl Allocator for VmAllocator {
+    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        self.default_allocate(layout)
+    }
+
+    fn allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        self.default_allocate_zeroed(layout)
+    }
+
+    unsafe fn deallocate(&self, ptr: NonNull<u8>, _layout: Layout) {
+        unsafe { bindings::vfree(ptr.as_ptr() as *const core::ffi::c_void) }
+    }
+}
+
+unsafe impl AllocatorWithFlags for VmAllocator {
+    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
+    {
+        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, flags) }
+    }
+
+    unsafe fn realloc_flags(&self, src: *mut u8, old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
+    {
+        let size = aligned_size(layout);
+
+        unsafe {
+            let dst = bindings::__vmalloc(size as u64, flags.0);
+            if !src.is_null() {
+                core::ptr::copy_nonoverlapping(src, dst as *mut u8, old_size);
+                bindings::vfree(src as *const core::ffi::c_void);
+            }
+            let ptr = NonNull::new(dst as *mut u8).ok_or(AllocError)?;
+            Ok(NonNull::slice_from_raw_parts(ptr, size))
+        }
+    }
+}
+
 #[global_allocator]
 static ALLOCATOR: KernelAllocator = KernelAllocator;
 
-- 
2.44.0

