Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCE1B3737
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112905; cv=none; b=SO7VGolUt4csyj4GGjEOL5iIQs/nWZZXr8nnpn+RJxC/53cYhZ15Lt8ZNp+AxD8zilHfAq1/KH+PQaadmJRdLuVx4tro544Cftv5L5kGDN2WDCkLP3HQJaff09TAPqdLKFcBEon0556uBPwJjYysoosIkZOvCvKpKSKZBXazkiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112905; c=relaxed/simple;
	bh=3XWf+tqZEw33+PZlZUtYxgrm0fV1xVHRbQpdrge2Weo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iH8QOPnqUxOhDPqxgpJkYfI+ANSuY83l0oQCYWqE6xkYoYnLsgS5mCA+SoJQgHWlQab6ouq0XNrPNFFFSDHQJwasBeJqoVHyun6cIV9oGFrx/A+LJFy4ZTXGac7fdad0luyCqkVl8bZkLD5+w9Xtoe9MUgBvFFZ1WUoH9gkh9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dTRmtIye; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dTRmtIye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vphM9iJmRWkBamFnV9XKqsHbOU4Zx/cdWYFfn2wn3+4=;
	b=dTRmtIye68hVR4DB9YqRaUDXsUN3Tp2/TaZLGVIRC+wYQ+6SKYmh1SX9Ofpa8l/lseWP5x
	RD5ncMhOWbS0pMWAx51KXgHHgoiroxjD86/qRUDE3rHUDTCg1otR2yuBqElBYB6/b2b9mD
	s4omSGt1SHjzVK9EAWNlrDFtwjfY9qs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-_fMgB3QRNuKVjMh94gRPxQ-1; Thu, 04 Jul 2024 13:08:19 -0400
X-MC-Unique: _fMgB3QRNuKVjMh94gRPxQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36710f4d5c9so579793f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112898; x=1720717698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vphM9iJmRWkBamFnV9XKqsHbOU4Zx/cdWYFfn2wn3+4=;
        b=fJPyOxrR24IkzNriqRPkCJB8ixFiWt9Q4l9zDZUw7VFy1kdjZ27bWDCROMugJupvkG
         G4BjveTrTzZPvcdy0rHquOj8nFX/FwXEDiWA6mGRdyMiMP+muusEmAYb8dGXQwpFiyPS
         Z0qHfKYzkZkVgXJZRRfG11JnXoEQGy2iSjJUTr7kzXU+lpK6q6cr/XIDsnR6m6b3qRoh
         WyfSHg0Y276SuDNA0QothFEaCA8S25k8MdJ+fkAPYwSxf5Tesk558IAO2Y8e+IOAG0W4
         rGw5Y9V7emNvwp1cKeum5TvM4obWgvAIqGY9TgK21E9RlHH/yq5XqaCgrKZsVe2wQemP
         RNmA==
X-Forwarded-Encrypted: i=1; AJvYcCXSHu2W+CG6If7dNXchzEn0/vClK/MTcW1v2BpsGSKD3Gaap/cjn0Nk+2LGGvMby+9MuqJ5ybuOptQgPl+Twd+zRRzDH4jEykyFv4Utnu0=
X-Gm-Message-State: AOJu0Yzdr1Ittx8z/Qo5nmKPqFHmw3PGXNS4H/u1Q6cVfQk/0JtDylmS
	BxSrgm08fSkdm5vbTW150ZYk7Q5bVzrD9yQPpWS+Cd9h+G2v6eG8lp3rN/ZVCok88NDZH44A0iG
	KeK+rcbc42lj+xcJfVpQbvNgApmbjQgc5/yYI37NxDFb2GAAATBAgGmRGiSg4NSn8
X-Received: by 2002:adf:facf:0:b0:367:8fc3:a25b with SMTP id ffacd0b85a97d-3679dd31215mr1461495f8f.42.1720112898280;
        Thu, 04 Jul 2024 10:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOQrlOgzUp2s25TyvjFOYtHEEXKGFugmXIqiA5JDYJbXkI5jgBcotLg9FeuRNMnsJcDHO7fA==
X-Received: by 2002:adf:facf:0:b0:367:8fc3:a25b with SMTP id ffacd0b85a97d-3679dd31215mr1461481f8f.42.1720112897828;
        Thu, 04 Jul 2024 10:08:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a1805e53sm1391438f8f.22.2024.07.04.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:17 -0700 (PDT)
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
Subject: [PATCH 01/20] rust: alloc: add `Allocator` trait
Date: Thu,  4 Jul 2024 19:06:29 +0200
Message-ID: <20240704170738.3621-2-dakr@redhat.com>
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

Add a kernel specific `Allocator` trait, that in contrast to the one in
Rust's core library doesn't require unstable features and supports GFP
flags.

Subsequent patches add the following trait implementors: `Kmalloc`,
`Vmalloc` and `KVmalloc`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs | 73 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 531b5e471cb1..462e00982510 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -11,6 +11,7 @@
 /// Indicates an allocation error.
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
+use core::{alloc::Layout, ptr, ptr::NonNull};
 
 /// Flags to be used when allocating memory.
 ///
@@ -71,3 +72,75 @@ pub mod flags {
     /// small allocations.
     pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);
 }
+
+/// The kernel's [`Allocator`] trait.
+///
+/// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffer described
+/// via [`Layout`].
+///
+/// [`Allocator`] is designed to be implemented on ZSTs; its safety requirements to not allow for
+/// keeping a state throughout an instance.
+///
+/// # Safety
+///
+/// Memory returned from an allocator must point to a valid memory buffer and remain valid until
+/// its explicitly freed.
+///
+/// Copying, cloning, or moving the allocator must not invalidate memory blocks returned from this
+/// allocator. A copied, cloned or even new allocator of the same type must behave like the same
+/// allocator, and any pointer to a memory buffer which is currently allocated may be passed to any
+/// other method of the allocator.
+pub unsafe trait Allocator {
+    /// Allocate memory based on `layout` and `flags`.
+    ///
+    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the size an
+    /// alignment requirements of layout, but may exceed the requested size.
+    ///
+    /// This function is equivalent to `realloc` when called with a NULL pointer and an `old_size`
+    /// of `0`.
+    fn alloc(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
+        // SAFETY: Passing a NULL pointer to `realloc` is valid by it's safety requirements and asks
+        // for a new memory allocation.
+        unsafe { self.realloc(ptr::null_mut(), 0, layout, flags) }
+    }
+
+    /// Re-allocate an existing memory allocation to satisfy the requested `layout`. If the
+    /// requested size is zero, `realloc` behaves equivalent to `free`.
+    ///
+    /// If the requested size is larger than `old_size`, a successful call to `realloc` guarantees
+    /// that the new or grown buffer has at least `Layout::size` bytes, but may also be larger.
+    ///
+    /// If the requested size is smaller than `old_size`, `realloc` may or may not shrink the
+    /// buffer; this is implementation specific to the allocator.
+    ///
+    /// On allocation failure, the existing buffer, if any, remains valid.
+    ///
+    /// The buffer is represented as `NonNull<[u8]>`.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to an existing and valid memory allocation created by this allocator
+    /// instance of a size of at least `old_size`.
+    ///
+    /// Additionally, `ptr` is allowed to be a NULL pointer; in this case a new memory allocation is
+    /// created.
+    unsafe fn realloc(
+        &self,
+        ptr: *mut u8,
+        old_size: usize,
+        layout: Layout,
+        flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError>;
+
+    /// Free an existing memory allocation.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to an existing and valid memory allocation created by this `Allocator`
+    /// instance.
+    unsafe fn free(&self, ptr: *mut u8) {
+        // SAFETY: `ptr` is guaranteed to be previously allocated with this `Allocator` or NULL.
+        // Calling `realloc` with a buffer size of zero, frees the buffer `ptr` points to.
+        let _ = unsafe { self.realloc(ptr, 0, Layout::new::<()>(), Flags(0)) };
+    }
+}
-- 
2.45.2

