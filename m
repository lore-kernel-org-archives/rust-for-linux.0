Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD81BF31D
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112930; cv=none; b=WjAciQl+NqGnzf1xqjZs05adjKzEt88HQCuzl6FEUy5xiTGCwRRLSrYuDSkDE+QZ5xxDVA/3yism8bKagmSOCTtFPm7YEa6bC9xdovKhqBez1GtkXgDT1DswV0HZZZy+ZbYLJLjwhYLFzuSQEgH1m0e/VoWTWquf4gZmKSjJjew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112930; c=relaxed/simple;
	bh=E7ojxsq33F6ZnnbOXdj2GEcN3gFVpL3aaByghHTyjMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjUyc999trjEwN3a3fdBuc7K1fxSaTQ0nZIbrOJSEl1AkDwQzuCAhfvwNz2n0fctAWhsFpATcQeGUK20e+l1PjWxC0uMN0Jqssy9X6GzW+4jIG9ARqLIcUCNPWYPvLTLfTMw5I09K+EEu6BriMNyRgxe8yGLKP8vLXwqvJcB3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcP0RtcL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcP0RtcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VyIj9wqWP+H3az8I4qjKuL0QiLtMtnLk/T2lFXWq4Zg=;
	b=bcP0RtcLgkjGXliwFpmDAwHD4AanB61Ys66pT6qPGu9BF39Z24MquV9jo6In0s790wSXH7
	VCsrUXNfMKHKdoT49oPXHcJOMs6Cbe/PCj6nUfXlppAf+Rqm9SZTj5K1dnO1f8WsGGVk3Q
	ugMk6+62SCjDKXaGKR7N7nSoPsybpkc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-qpNrxK6qO52fsK_Ewyidsw-1; Thu, 04 Jul 2024 13:08:46 -0400
X-MC-Unique: qpNrxK6qO52fsK_Ewyidsw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4257c42f035so6041985e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112925; x=1720717725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyIj9wqWP+H3az8I4qjKuL0QiLtMtnLk/T2lFXWq4Zg=;
        b=OkWTluILndRaOUcoC0N5u0lpJJcocKdw+10lquPSag9rKq54dMhbueU5E6EovfNKfM
         WBEfxNfLusQc5XxcGcfTk9GTZEJ+xLOHptIEt4ZUI7d55u3bTmXijQh6V6NE8G8wE6D8
         KWwyfDZlE/0Mh2bpNpI5wBRXDHmS9JYEeETRxalryxetHey17DnwYnW3HI5takrte8gZ
         oGopBpod71/joOVtDHdBZBJIIQTemwgRpHlI+bjJVsCv/Vk6WnEw34zNT/BPZpvjSiqh
         rutPrEVAK/lyqOrrXn7bZADnKLDt85bNkfW6ZSXSeE6fmdptDnHTqwzw0Qs28LgON1D0
         dREw==
X-Forwarded-Encrypted: i=1; AJvYcCUQVomuOrrLip9llSv+kqZoiMhpZub1x+4exx0KkJ6xnsBeXU4EIJxJuk0/2lEwe88ZVI3IZR7WhW4o0/5KV0zSPKWOrCX4NvkRTAq3XU0=
X-Gm-Message-State: AOJu0YyPhpo8GDN2n+y4DhQP/Q08bji89NJAxxi4ol0UhuZlTPha1lWg
	bnk19vzafGNSB/XVMFLUvWeRZI735BP66v1+6YiZ/+/k2252cfJU5bdG1EybkCkKd21Z9zhXFeP
	9qIcHMeR8kCjdcdCq04Zoq+atMKnXTXtu2r61/pIDkyi3RtnIlG/KUyqq+N+isvFM
X-Received: by 2002:a05:600c:4205:b0:424:e04b:88f9 with SMTP id 5b1f17b1804b1-4264a3d882emr19468475e9.3.1720112925520;
        Thu, 04 Jul 2024 10:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfI/OG2k4CkgNKhoBfG0TFM/3DwBzLEJDiB1KuYfjIallxq+of5uFapJbWq2WqSV8EV+r/zg==
X-Received: by 2002:a05:600c:4205:b0:424:e04b:88f9 with SMTP id 5b1f17b1804b1-4264a3d882emr19468185e9.3.1720112925222;
        Thu, 04 Jul 2024 10:08:45 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm30529065e9.7.2024.07.04.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:44 -0700 (PDT)
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
Subject: [PATCH 08/20] rust: alloc: implement `KVmalloc` allocator
Date: Thu,  4 Jul 2024 19:06:36 +0200
Message-ID: <20240704170738.3621-9-dakr@redhat.com>
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

Implement `Allocator` for `KVmalloc`, an `Allocator` that tries to
allocate memory wth `kmalloc` first and, on failure, falls back to
`vmalloc`.

All memory allocations made with `KVmalloc` end up in
`kvrealloc_noprof()`; all frees in `kvfree()`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs      | 35 +++++++++++++++++++++++++++++
 rust/kernel/alloc/allocator_test.rs |  1 +
 2 files changed, 36 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 0a4f27c5c3a6..d561c594cc7f 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -22,6 +22,12 @@
 /// contiguous kernel virtual space.
 pub struct Vmalloc;
 
+/// The kvmalloc kernel allocator.
+///
+/// Attempt to allocate physically contiguous memory, but upon failure, fall back to non-contiguous
+/// (vmalloc) allocation.
+pub struct KVmalloc;
+
 /// Returns a proper size to alloc a new object aligned to `new_layout`'s alignment.
 fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -167,6 +173,35 @@ unsafe fn realloc(
     }
 }
 
+unsafe impl Allocator for KVmalloc {
+    unsafe fn realloc(
+        &self,
+        old_ptr: *mut u8,
+        old_size: usize,
+        layout: Layout,
+        flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        let size = aligned_size(layout);
+
+        let ptr = if size == 0 {
+            // SAFETY: `old_ptr` is guaranteed to be previously allocated with this `Allocator` or
+            // NULL.
+            unsafe { bindings::kvfree(old_ptr.cast()) };
+            NonNull::dangling()
+        } else {
+            // SAFETY: `old_ptr` is guaranteed to point to valid memory with a size of at least
+            // `old_size`, which was previously allocated with this `Allocator` or NULL.
+            let raw_ptr = unsafe {
+                bindings::kvrealloc_noprof(old_ptr.cast(), old_size, size, flags.0).cast()
+            };
+
+            NonNull::new(raw_ptr).ok_or(AllocError)?
+        };
+
+        Ok(NonNull::slice_from_raw_parts(ptr, size))
+    }
+}
+
 #[global_allocator]
 static ALLOCATOR: Kmalloc = Kmalloc;
 
diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index b2d7db492ba6..f0e96016b196 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -8,6 +8,7 @@
 
 pub struct Kmalloc;
 pub type Vmalloc = Kmalloc;
+pub type KVmalloc = Kmalloc;
 
 unsafe impl Allocator for Kmalloc {
     unsafe fn realloc(
-- 
2.45.2

