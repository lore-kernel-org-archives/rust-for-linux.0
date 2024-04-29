Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336714039D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421573; cv=none; b=uWW/oI/oAJEIHCVHcKcLzdd8aBoheykvXuW9tOSSXWeix1L6664ABJN1u2e6Og1xw0z6DOkTmzyJBUYGc4Xk8J0rrcrkTlehfk2qlbICMO4Mx1SKImVk0/rI/8k6ggwDpcOOB1XY+sVc20x8PmzVhVcPVmGmIPEoY7O29PyYK+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421573; c=relaxed/simple;
	bh=oE+6PVEXp+s6O9INT5ychvKVT0IW9XNeu40FBCHIdQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHNtQdwL4BNizewODAyZNZrk7VIlmaaCHtWHl6AUpH/Rke5Asoh0EgcMeJsLHWI+HazSvyS73n47UB7wtH2HqisrI1w5Oi5LPwiglXojQGMZE0nTFD3+H5GV986ZxHsajHVCTylUm/CkKwTc1rpl3E8QshQWqR5Mel6lnxM8TwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXcIAFxL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXcIAFxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1DvCCjJPMtJff+K62O/WrD9DHNL3ihFnjQrs9Krufw=;
	b=hXcIAFxLW0JoSGzeCApgoJUl7jRaPxHwVYa4ic+ngRI/AgAPy2aSKrVKvfGWXQiyx3w/Ib
	IBp7thmcV9kl/sLl41+nZvT2bdnwuzgHCXw0uWtRFWdTlQT2d05+dQhvYMIv5WMBjCtmky
	vzfe8ZcO3H4ZFNON7vHbkfQhZe7/8q4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-gD54jR3vND-wZcl4gl-LsA-1; Mon, 29 Apr 2024 16:12:49 -0400
X-MC-Unique: gD54jR3vND-wZcl4gl-LsA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3455cbdea2cso2500877f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421568; x=1715026368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1DvCCjJPMtJff+K62O/WrD9DHNL3ihFnjQrs9Krufw=;
        b=UX7WomnkkcrFDeRar0Z9StAOb5llImAsGkkfkYPp/Z58cFfZPKBEB5F2k4fGvagnFK
         LpvmknUMdEzDAWLkzbxSUYXhgBKKAbxxCSa8Z5rE0cCx9cqHtKpm5mvO0XdUcBY+HVKw
         kMGLoBtKC88/C0fezJPHxI5uZqTHUq4ZaMqDQktmr77DiIRMKp+lwAQLM0t6TcQWeYTb
         yzNcsvl+Spk0ZOA7YMOMIubXiyk0mPNst4INN8Glr/jeaT+3Dth7xX+xZsd2fEqWIGJb
         EnS6G9kVWRgNRtpB9mfZ3HXYnRrDDgNhb7+bj2u//IXTHEOD7H9i/a1HSgmOrxB33+IU
         QkPQ==
X-Gm-Message-State: AOJu0YxCcz4mcMz73fc4m0HAXfthIYnwNcB1KdY6Z+nvAPjJyyqpdX4r
	5RWALatQOhs6I96ySD2P5dEUyu6ez28lgOoJI2R4TIiKlVpsZ5942f9nTPoAa6V/nSxt4W9Z/kL
	QwQ3LEspCdVC/1/ouVF0yzVrCyKIw5E5HZT3LLgURywvCtQU30eS6wpy5g7Tq4fs7
X-Received: by 2002:a5d:4384:0:b0:34c:c53e:f2ca with SMTP id i4-20020a5d4384000000b0034cc53ef2camr720086wrq.14.1714421568147;
        Mon, 29 Apr 2024 13:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7gwxMjoStL579NtrjSdEwLiD8bDvktuUGBdgMlHPc1lHKOQeZnZvcSHJryREzAeQwmnH//A==
X-Received: by 2002:a5d:4384:0:b0:34c:c53e:f2ca with SMTP id i4-20020a5d4384000000b0034cc53ef2camr720076wrq.14.1714421567939;
        Mon, 29 Apr 2024 13:12:47 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm30253147wru.36.2024.04.29.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:47 -0700 (PDT)
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
Subject: [PATCH WIP 5/8] rust: alloc: implement AllocatorWithFlags for KernelAllocator
Date: Mon, 29 Apr 2024 22:11:55 +0200
Message-ID: <20240429201202.3490-6-dakr@redhat.com>
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
 rust/kernel/alloc.rs           |  2 +-
 rust/kernel/alloc/allocator.rs | 38 ++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index ec45ba8f77ce..12c6c4e423f5 100644
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
index 236100649ae1..173347ff018a 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -3,12 +3,14 @@
 //! Allocator support.
 
 use super::{flags::*, Flags};
-use core::alloc::{GlobalAlloc, Layout};
+use core::alloc::{GlobalAlloc, Layout, Allocator, AllocError};
 use core::ptr;
+use core::ptr::NonNull;
 
 use crate::bindings;
+use crate::alloc::AllocatorWithFlags;
 
-struct KernelAllocator;
+pub struct KernelAllocator;
 
 pub(crate) fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -89,6 +91,38 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
     }
 }
 
+unsafe impl Allocator for KernelAllocator {
+    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        self.default_allocate(layout)
+    }
+
+    fn allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        self.default_allocate_zeroed(layout)
+    }
+
+    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: Layout) {
+        unsafe { self.dealloc(ptr.as_ptr(), layout) }
+    }
+}
+
+unsafe impl AllocatorWithFlags for KernelAllocator {
+    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
+    {
+        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, flags) }
+    }
+
+    unsafe fn realloc_flags(&self, ptr: *mut u8, _old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
+    {
+        let size = aligned_size(layout);
+
+        unsafe {
+            let raw_ptr = krealloc(ptr, size, flags);
+            let ptr = NonNull::new(raw_ptr).ok_or(AllocError)?;
+            Ok(NonNull::slice_from_raw_parts(ptr, size))
+        }
+    }
+}
+
 #[global_allocator]
 static ALLOCATOR: KernelAllocator = KernelAllocator;
 
-- 
2.44.0

