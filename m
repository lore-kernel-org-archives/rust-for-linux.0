Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B914039D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421581; cv=none; b=YIvsOUs1UcRyer0IbmUbtG4sEUBh0HWPX0+7oyo+7/ioNlXnglg0dFF6avw5+lRhfwKhuESujAH2bYtk6fCBPHrTLZANE5QqNTF4Sp2+28YY2EaKOPCjBMf8MCr7TeEi1MhJ8mtcC9f+DCU86EWFJx6eJOVaWcWJkg1Yn12zt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421581; c=relaxed/simple;
	bh=aFVXXxvoisGrVLT3arV7hCZfMOg/cWcnYvFGJbuf4ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FM9vUfZyw792xuT5AkMZloo/7juoz+a+2Xx60+pXR+VSAw5wGBVkeu3xJ46BRUyTaHLQl3eB/Fgjkiqu2Nxw4izshd9BjqxOBaLgLnuaYcAintGeNFraYpc5xVppE56WVDrNAVQ9nfST11+w4qSpdI8rDw5VTY8HCv7FJyCg48U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGn8c3OF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGn8c3OF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJSURqrk3HaDUjXnAjseyotEy81ga5jvdUt+VY+TK9g=;
	b=CGn8c3OFO6a+K5haspP6CUNG5QWVjB1mcl6TLR1yFsql3wIuMsz1SKdTWYjNXKV0hZ35Xw
	Y2xJUvoYRW48eMHnXWl8e77n65VN01jsD2KmDRAYI3M9UWsPI6SbanvpvovpNGs4oRTobL
	6jeHXvQkMkcvi5xCVpa4R1cae19FKw8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-bvSWc7-UPiuP1_R9qAGp8g-1; Mon, 29 Apr 2024 16:12:56 -0400
X-MC-Unique: bvSWc7-UPiuP1_R9qAGp8g-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-343f5059c5fso2884932f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421575; x=1715026375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJSURqrk3HaDUjXnAjseyotEy81ga5jvdUt+VY+TK9g=;
        b=u0OcB84U2ZAr3M3vBuuK/MmPkm1clkZgTHHSEobbQmXt8LyRIhQKnIqvQmGPCQ/RLS
         xs/t9Wxqw6Cm7L/l7W3hXiBJgzHVCRhvGPVESWjNedh0yECre512KcTwFUQPOYgxDnky
         sj5/lQkPyurTe8IqEt8p1HsbJ7ZgrayE9RDuPq2OpPKPjw2ieH3ZKrOErl9UnQg3JIHL
         FA9YpffXvf344pQy2Vlxu2llnBnzTGk/20NkYmde+kSrnnmRWoLT1ixje9bcSblxcYCx
         BEyYDLzXS00MS4H5w6fkhy596GefbVyWCGmeJSb/E7EGm8n1T4EbDk+F6IhuvZFoHDiN
         klXg==
X-Gm-Message-State: AOJu0YxokxRQX323XwOOs2X2UaAPbinWHHvKunYDRZAiXGri3Bx4o13K
	Wei7oc+kfDm4po6tD1ZD6WnDaXF8EToYxVeM1Y9dL20VGQg4ExuhsCS65MmcdO+GdoK1S8NNpQT
	PSvL+nWvsoq3K/B1HpsDSCqCRZ565B+XmnbwBxLNNuaLqPkrWAv6YyiNstJAArRMT
X-Received: by 2002:adf:fe8a:0:b0:34c:f320:247 with SMTP id l10-20020adffe8a000000b0034cf3200247mr4043679wrr.49.1714421575596;
        Mon, 29 Apr 2024 13:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR5AJRXEkk6/msdTRjJzwWIjUwuVaOWQ42LewvnZnPpBJbysjIS2zbo/IHuEGcOWC01zRgXA==
X-Received: by 2002:adf:fe8a:0:b0:34c:f320:247 with SMTP id l10-20020adffe8a000000b0034cf3200247mr4043668wrr.49.1714421575356;
        Mon, 29 Apr 2024 13:12:55 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id df15-20020a5d5b8f000000b0034cee43238fsm4467575wrb.27.2024.04.29.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:54 -0700 (PDT)
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
Subject: [PATCH WIP 7/8] rust: alloc: implement VecExtAlloc
Date: Mon, 29 Apr 2024 22:11:57 +0200
Message-ID: <20240429201202.3490-8-dakr@redhat.com>
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
 rust/kernel/alloc/vec_ext.rs | 85 +++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index 1dc991b44be7..3ed33fdffe70 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -2,9 +2,10 @@
 
 //! Extensions to [`Vec`] for fallible allocations.
 
-use super::Flags;
+use super::{AllocatorWithFlags,Flags};
 use alloc::vec::Vec;
 use core::alloc::AllocError;
+use core::ptr;
 use core::result::Result;
 
 /// Extensions to [`Vec`].
@@ -76,6 +77,76 @@ fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocEr
     fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>;
 }
 
+pub trait VecExtAlloc<T, A: AllocatorWithFlags>: Sized {
+    fn with_capacity_in(capacity: usize, alloc: A, flags: Flags) -> Result<Self, AllocError>;
+    fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError>
+    where
+        T: Clone;
+    fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>;
+}
+
+impl<T, A> VecExtAlloc<T, A> for Vec<T, A> where A: AllocatorWithFlags {
+    fn with_capacity_in(capacity: usize, alloc: A, flags: Flags) -> Result<Self, AllocError> {
+        let mut v = Vec::new_in(alloc);
+        <Self as VecExtAlloc<_, A>>::reserve(&mut v, capacity, flags)?;
+        Ok(v)
+    }
+
+    fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError>
+    where
+        T: Clone,
+    {
+        <Self as VecExtAlloc<_, A>>::reserve(self, other.len(), flags)?;
+        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
+            slot.write(item.clone());
+        }
+
+        // SAFETY: We just initialised the `other.len()` spare entries, so it is safe to increase
+        // the length by the same amount. We also know that the new length is <= capacity because
+        // of the previous call to `reserve` above.
+        unsafe { self.set_len(self.len() + other.len()) };
+        Ok(())
+    }
+
+    fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError> {
+        let len = self.len();
+        let cap = self.capacity();
+
+        if cap - len >= additional {
+            return Ok(());
+        }
+
+        if core::mem::size_of::<T>() == 0 {
+            // The capacity is already `usize::MAX` for SZTs, we can't go higher.
+            return Err(AllocError);
+        }
+
+        // We know cap is <= `isize::MAX` because `Layout::array` fails if the resulting byte size
+        // is greater than `isize::MAX`. So the multiplication by two won't overflow.
+        let new_cap = core::cmp::max(cap * 2, len.checked_add(additional).ok_or(AllocError)?);
+        let layout = core::alloc::Layout::array::<T>(new_cap).map_err(|_| AllocError)?;
+
+        let (ptr, len, cap, alloc) = destructure_alloc(self);
+
+        // We can't trust ptr to be a NULL pointer if cap is zero, hence explicitly assing a NULL
+        // pointer.
+        let ptr = match cap {
+            0 => ptr::null_mut(),
+            _ => ptr,
+        };
+
+        // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
+        // `krealloc_aligned`. We also verified that the type is not a ZST.
+        let data = unsafe { alloc.realloc_flags(ptr.cast(), cap, layout, flags)? };
+        let new_ptr = data.as_ptr();
+
+        // SAFETY: `ptr` has been reallocated with the layout for `new_cap` elements. New cap
+        // is greater than `cap`, so it continues to be >= `len`.
+        unsafe { rebuild_alloc(self, alloc, new_ptr.cast::<T>(), len, new_cap) };
+        Ok(())
+    }
+}
+
 impl<T> VecExt<T> for Vec<T> {
     fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError> {
         let mut v = Vec::new();
@@ -175,3 +246,15 @@ unsafe fn rebuild<T>(v: &mut Vec<T>, ptr: *mut T, len: usize, cap: usize) {
     let mut tmp = unsafe { Vec::from_raw_parts(ptr, len, cap) };
     core::mem::swap(&mut tmp, v);
 }
+
+fn destructure_alloc<T, A: AllocatorWithFlags>(v: &mut Vec<T, A>) -> (*mut T, usize, usize, A) {
+    let mut tmp: Vec<T, A> = unsafe { core::mem::transmute_copy(v) };
+    core::mem::swap(&mut tmp, v);
+    tmp.into_raw_parts_with_alloc()
+}
+
+unsafe fn rebuild_alloc<T, A: AllocatorWithFlags>(v: &mut Vec<T, A>, alloc: A, ptr: *mut T, len: usize, cap: usize) {
+    // SAFETY: The safety requirements from this function satisfy those of `from_raw_parts`.
+    let mut tmp = unsafe { Vec::from_raw_parts_in(ptr, len, cap, alloc) };
+    core::mem::swap(&mut tmp, v);
+}
-- 
2.44.0

