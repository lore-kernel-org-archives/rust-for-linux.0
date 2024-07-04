Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADAF1B47B7
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112909; cv=none; b=ghuNVKL5v+wtb3TjjvjGLfPyrSWbp2Z/txeAIHBeFUQnpSsByW0kuMN9HhYCD4ZHbzGHKP4W5ShU8b33VD6wJEVrYhrc+N9zNC9nB9W6BPhYmtZwKYWBxOP1pN1roL+C7KsP1xYXErsZ+KhW6CyZ/7YYV8jFfXe37iRHILWor78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112909; c=relaxed/simple;
	bh=QrynI0HoPy4Hny/wycemLcIhmp9fTzHnwd0bnDI3BXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+mLx3VqwBx+S7merOPcU1s244FgMmTwG6A39fkV/ZUvBnZ6Ei07rGuPms9OLjmZ/z+pUJ5pke//rjaJVp9PNNsyqfaM1uBWmBGufVMhew7kWQzRnV6C6DwxxI7+y17atwESCSj848qyiqo8xeyY3nEB72UzT3iUdRRC3V/ps14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hf6+j3wX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hf6+j3wX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkm1HsuIC/IJIdfFvL0dQb/JQUMIA7HW6TqPIuzm1+Y=;
	b=Hf6+j3wXC4iYqXnSSXUoLpMnB7n7WlpsDZsT/MH6CsdE5C+HrXtqNOWnNfLSQYXZnuWmuR
	Ey3Hv3Bi7BwpG5RUTtTqoCyr18vGzoltfBvgU+F8OYu5/ymXiCdX/B0syaOastrym/MSdx
	Cvcj8rUHw1Gn2snspFVGp4AGg+vPBsk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-U6rYk07oO1K4csQm6c3-pw-1; Thu, 04 Jul 2024 13:08:23 -0400
X-MC-Unique: U6rYk07oO1K4csQm6c3-pw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee8f22ef7cso8481261fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112902; x=1720717702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkm1HsuIC/IJIdfFvL0dQb/JQUMIA7HW6TqPIuzm1+Y=;
        b=DEzvs2rXP0wTcPs05F/tYUHiRnSSNE/l05dQYfB/qF022p/JKd/AlXv6qCeRAQ1tgA
         oyuTl9EUNzpYgAwD7UHyXWFYlRxlGI0s/wjdPqmMKcJfSiqk3CLnXdLQKFHL14s8HL7l
         1qXxzZiX/AfSJ7a5eQ72pV0DK61vzWl3sROvbekGMRdF9vBugONCZ4AP2syAFdcRzyUS
         uxkPCrk1M/Ljx0US/jfbeMQEeN0KuM3FHGStyexy9w5s8ERvFuXTVROavlEigH4EtBPk
         HO+BZoD5GM7otRF/0T3Va8YR1xToGYryY9M+fgENzNj2gX9OjYlFqqKjnXnYNHsDzcji
         DhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn6UPexGi8+S8t9t99lsddL7FMj/GIx9PaEVKdif6OKDKr+fkXzy1Q1apuq0VxqliyBDZm1koV1Ep/sIFVJnOwJNGOhSIT5XsWpz9kRr4=
X-Gm-Message-State: AOJu0Yy/lTjo8OuAkDpCTilvLBXGq/keBh4cqxrLC9/lHmepPQ6dApMx
	q9Bu2+E1WV44qAnVIwUWfZvAXFc4uuE7X7Rx3U76v608zWkDkNVpLNMqkYyT2eDvp5r36nqI+TC
	3dhpLhdOs4FvER3/E2dojCLMoshEhfKqQUTElTNXk0Gz8GkoE+VGlp5Vzwm2C4iP+
X-Received: by 2002:a05:6512:3aa:b0:52c:8fd7:2252 with SMTP id 2adb3069b0e04-52ea061f61emr1482793e87.11.1720112902210;
        Thu, 04 Jul 2024 10:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC1w3veRR7ifL3/ieyNufl0zLqc3/LfgsQPz+jstYWmTdKHKy92qb6tBJMl0hm5NEL7o5XSA==
X-Received: by 2002:a05:6512:3aa:b0:52c:8fd7:2252 with SMTP id 2adb3069b0e04-52ea061f61emr1482784e87.11.1720112901793;
        Thu, 04 Jul 2024 10:08:21 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d0b24sm31308165e9.3.2024.07.04.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:21 -0700 (PDT)
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
Subject: [PATCH 02/20] rust: alloc: separate `aligned_size` from `krealloc_aligned`
Date: Thu,  4 Jul 2024 19:06:30 +0200
Message-ID: <20240704170738.3621-3-dakr@redhat.com>
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

Separate `aligned_size` from `krealloc_aligned`.

Subsequent patches implement `Allocator` derivates, such as `Kmalloc`,
that require `aligned_size` and replace the original `krealloc_aligned`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 229642960cd1..49fb33cc18d9 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -8,13 +8,7 @@
 
 struct KernelAllocator;
 
-/// Calls `krealloc` with a proper size to alloc a new object aligned to `new_layout`'s alignment.
-///
-/// # Safety
-///
-/// - `ptr` can be either null or a pointer which has been allocated by this allocator.
-/// - `new_layout` must have a non-zero size.
-pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: Flags) -> *mut u8 {
+fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
     let layout = new_layout.pad_to_align();
 
@@ -30,12 +24,28 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
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
+/// - `new_layout` must have a non-zero size.
+pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: Flags) -> *mut u8 {
     // SAFETY:
     // - `ptr` is either null or a pointer returned from a previous `k{re}alloc()` by the
     //   function safety requirement.
     // - `size` is greater than 0 since it's either a `layout.size()` (which cannot be zero
     //   according to the function safety requirement) or a result from `next_power_of_two()`.
-    unsafe { bindings::krealloc(ptr as *const core::ffi::c_void, size, flags.0) as *mut u8 }
+    unsafe {
+        bindings::krealloc(
+            ptr as *const core::ffi::c_void,
+            aligned_size(new_layout),
+            flags.0,
+        ) as *mut u8
+    }
 }
 
 unsafe impl GlobalAlloc for KernelAllocator {
-- 
2.45.2

