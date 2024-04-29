Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAF1411D3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421569; cv=none; b=qkdB++Lkm/vfu6tIgdVq3J8PnfOFRtFytyYPxSTXCSiIT0d+992pfZJkDlCtCuLP5OnfCW+spDWEzNINw3pxH4Ejg+fnubo1U9ud1HCz9DbaYe2dbIVKsyeF9YTDsbhnriWxWhHZY8iH+Syt+I+FkMImj6C+mmiA8ULi7QA2520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421569; c=relaxed/simple;
	bh=p1HoVpwkiWk5o7Qbkrsp3gLBBz8Td0brC4K1yKCvG5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ixxytm7mY8UMf9oC14G3kLxkdrAJ7H6lukZWEeyIpwBuHZQwa+TksgEnVe6O/b393BhENa15L4xM+smdlgyt2JMw2yADUtX7Ko3YX4orpPb0y39nvmQ570qkyQgisEyfI+GmPyfiZB9Tp0Y9dLpDkmblRDD5s0B90i8FBe78jY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HkdNgQYF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HkdNgQYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/8X5gvUbcYroQJ4Uc7TKXQVF2WLcUn//N2QhYs+9Yc=;
	b=HkdNgQYF7zII0X8BckarnI8UToVnPm4nm9kFWrF0/8sNKa7p09NvVwxD3iCNwOagufG7bG
	EMTGybV4cpP5x34GGiZKaz+6+3J4Od+QIi9aNBPJwEinhS9d9GEZcB8OmnkYn7kIlJo+9f
	XrOEMmaEoFQy3a6t0uEwFe7HxaM1VGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-bncU1vNxPP-8S9yXg3VrFA-1; Mon, 29 Apr 2024 16:12:45 -0400
X-MC-Unique: bncU1vNxPP-8S9yXg3VrFA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34d1089a3feso744706f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421564; x=1715026364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/8X5gvUbcYroQJ4Uc7TKXQVF2WLcUn//N2QhYs+9Yc=;
        b=jHXTDEKjIbpxQ+JaKIn1X3k7oQ7z5wPMxI49Y+9ETUfqJrqBFvD2aZVKKYhWc649Z2
         NfFu6jRWdKfwUvR9opbrSaUUsU7HEUK+djEpwA8TvJ3ZnJSvVLdkrV4Uwx8BrJSzsNgS
         e7Usjp5QQZhtk0zTegY/MMw30WcqVnTKWDwZ4GhdLnJW+9j9bdo/S/ZIE7y+KSXPTpnM
         xfR59pdLYfu2JCMrW7LBJ5yIKYlw899Pe54c5u4bqzj/UjEvWOoQhWVpqh3gAjmdawGx
         h3ysmHpoqNwlkyPdqcmIO9PIC5ag+nnI7Xm3CFCp4xBr0NfF34Z6RHxf74/VJazNXb+q
         WAVQ==
X-Gm-Message-State: AOJu0YyeRqVKTgZZLGINJMMQ31JZXFDaj5Gh7UOEJRzRjsZTHla3e7Hf
	Z9iUUYFasSeWmlu5Jo+p5TSYK3PEKa7bhQ2BQrjQc4I48wkAiwFXcv4v6eN+BZQ+Vt6lPSK9mmc
	G6zvcBiZBUZeLnoRR/HejSJ5pPSkhqX/xP/TnFyd+BdIWK2Y60SL0xvJqdO/sGfKh
X-Received: by 2002:adf:e305:0:b0:343:751e:8ef7 with SMTP id b5-20020adfe305000000b00343751e8ef7mr10128556wrj.51.1714421564508;
        Mon, 29 Apr 2024 13:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVOi+eLrMq4xae/Z7kmjaijkRGraEXpGV8NfrGz5OBJOUAwCOXXLNzN3tPYREmRv3k0/NKmg==
X-Received: by 2002:adf:e305:0:b0:343:751e:8ef7 with SMTP id b5-20020adfe305000000b00343751e8ef7mr10128542wrj.51.1714421564221;
        Mon, 29 Apr 2024 13:12:44 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0034d7a555047sm52172wro.96.2024.04.29.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:43 -0700 (PDT)
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
Subject: [PATCH WIP 4/8] rust: alloc: separate krealloc_aligned()
Date: Mon, 29 Apr 2024 22:11:54 +0200
Message-ID: <20240429201202.3490-5-dakr@redhat.com>
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

Separate krealloc_aligned() into krealloc() and aligned_size().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index ff88bce04fd4..236100649ae1 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -10,13 +10,7 @@
 
 struct KernelAllocator;
 
-/// Calls `krealloc` with a proper size to alloc a new object aligned to `new_layout`'s alignment.
-///
-/// # Safety
-///
-/// - `ptr` can be either null or a pointer which has been allocated by this allocator.
-/// - `new_layout` must have a non-zero size.
-pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: Flags) -> *mut u8 {
+pub(crate) fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
     let layout = new_layout.pad_to_align();
 
@@ -32,6 +26,16 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
         size = size.next_power_of_two();
     }
 
+    size
+}
+
+/// Calls `krealloc` with a proper size to alloc a new object aligned to `new_layout`'s alignment.
+///
+/// # Safety
+///
+/// - `ptr` can be either null or a pointer which has been allocated by this allocator.
+/// - `size` must be non-zero.
+pub(crate) unsafe fn krealloc(ptr: *mut u8, size: usize, flags: Flags) -> *mut u8 {
     // SAFETY:
     // - `ptr` is either null or a pointer returned from a previous `k{re}alloc()` by the
     //   function safety requirement.
@@ -40,6 +44,16 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
     unsafe { bindings::krealloc(ptr as *const core::ffi::c_void, size, flags.0) as *mut u8 }
 }
 
+/// Calls `krealloc` with a proper size to alloc a new object aligned to `new_layout`'s alignment.
+///
+/// # Safety
+///
+/// - `ptr` can be either null or a pointer which has been allocated by this allocator.
+/// - `new_layout` must have a non-zero size.
+pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: Flags) -> *mut u8 {
+    unsafe { krealloc(ptr, aligned_size(new_layout), flags) }
+}
+
 unsafe impl GlobalAlloc for KernelAllocator {
     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
         // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
-- 
2.44.0

