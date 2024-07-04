Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762D1B4C49
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112912; cv=none; b=PRS/435MXbKHN2L0DZpTiH78gGtP5our2ePQ5GotGqAUDjf5ySE1EycTUUXzT1XyB7PCll303e03zlhs4sGob4rE3y4zcBfzX+V3zslihtE+PaKZNSHsKtaIdUEt6djxxHTk3zfqqAwvHSiso3E63wBS1AQy9DCJ4bRq+xGUrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112912; c=relaxed/simple;
	bh=dBkn8uWErKq0NfiBMQ9moE7lJwn+ZFUPDGAulmb98hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRRlR35eu8B1LKjmg+cOLLHjT5UsNJ8ubYPN9ULP37m0RN5iIp2Tqb63BJkG9zGPv0Svhxt2tiOOOYY1+Me0ki1nkgMg0OM0oTq4iq2WSwaUvXO6KT5yhp+nnoVydsEIrTlE4BZxmMljgUAmghPrJLlIJUIRKFbbVWomvvJFnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVGugd7y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVGugd7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xi1xjBHaOdM6NCOm6B2REEcdukdUD5LuLilmDyDwG4g=;
	b=IVGugd7ywP32HEOmc8ChtJ0n6+vO34R0vAQzuySh6Iwoneo3IyDIdGj3gONVSD8eXq6ha5
	vPTrWbLIHos76qKqAo/8nAhr7iGq5wJ0xGj12ap2mYRE6CT5zMlSxmdVsQsoCSDYSARvoq
	wNqwQzMXn8xqNPODFoO6s/rPYPfnsfM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-t5HV4aAaMuKFL6-DvCGVBw-1; Thu, 04 Jul 2024 13:08:27 -0400
X-MC-Unique: t5HV4aAaMuKFL6-DvCGVBw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36796a0687bso695691f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112906; x=1720717706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi1xjBHaOdM6NCOm6B2REEcdukdUD5LuLilmDyDwG4g=;
        b=D3pl6WIUWmm0edMbvTG/NEFbe9kPwwsHrdVZEVlHmn62aVKS7X/6kdiKD7fudvLVEm
         nwBPVgUn8kmC4L6gLqcob39VBI2d2lGgdeu2fG4zE2RCiZMYqUifYvkKhNJdlxwKVoHt
         lKHequaNWTjipT8+PKbP7iJp+gjXbP0nr6EhFKvlXABwfljBfwRC4vmz30fkAzTxnc9W
         /uIEHyWGNiTJJvGy73EDCc3i2Uq829g1uSKH43u6raQpD3DjIRYtBc2pFgfwb23ETp7q
         fXBCr8V7H4QV9Bwf5C4HvWbOIET5W9shMX+M1s/221RKybtNRRcsjOSayYSBifQFZVlI
         sYzA==
X-Forwarded-Encrypted: i=1; AJvYcCX62wNXUqmdhayJp4FAzUaI94y9yNc+an2i+NEkOUTJ+22kD0AUyielv160yTCAXryUGiSftbiedfDBlZLIaHHpaSDEADPr5Jb1yL86QxQ=
X-Gm-Message-State: AOJu0YxYfA+WtG7pWK5/B9sUtnckctuwIulgg3NL5fUww3c5G1uowQEA
	w9OnILbst3vzx51aGlwCLTHReH7f50f1L973J7IKn0vAK3or/eNLvQ+NCvnKxWc/sZIvQadqi9x
	CrI6DIHuSOzjoMvQVpuF9Obk0fMjgg4jlD2kACbjS2OULbCE+MzyJPJGJXWJV4GhA
X-Received: by 2002:adf:f548:0:b0:366:ec2c:8648 with SMTP id ffacd0b85a97d-3679dd66b0emr1473883f8f.43.1720112906043;
        Thu, 04 Jul 2024 10:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZE9lqxekh8vlvO7Znvqy+xmMypbyEYcSxQDzUKYJCWAgpo4YD19f2xbFzHmbfg5HdXDdSSQ==
X-Received: by 2002:adf:f548:0:b0:366:ec2c:8648 with SMTP id ffacd0b85a97d-3679dd66b0emr1473853f8f.43.1720112905720;
        Thu, 04 Jul 2024 10:08:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679983882csm2704593f8f.78.2024.07.04.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:25 -0700 (PDT)
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
Subject: [PATCH 03/20] rust: alloc: rename `KernelAllocator` to `Kmalloc`
Date: Thu,  4 Jul 2024 19:06:31 +0200
Message-ID: <20240704170738.3621-4-dakr@redhat.com>
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

Subsequent patches implement `Vmalloc` and `KVmalloc` allocators, hence
align `KernelAllocator` to this naming scheme.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/allocator.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 49fb33cc18d9..e47ab8fe21ab 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -6,7 +6,7 @@
 use core::alloc::{GlobalAlloc, Layout};
 use core::ptr;
 
-struct KernelAllocator;
+struct Kmalloc;
 
 fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -48,7 +48,7 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
     }
 }
 
-unsafe impl GlobalAlloc for KernelAllocator {
+unsafe impl GlobalAlloc for Kmalloc {
     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
         // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
         // requirement.
@@ -84,7 +84,7 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
 }
 
 #[global_allocator]
-static ALLOCATOR: KernelAllocator = KernelAllocator;
+static ALLOCATOR: Kmalloc = Kmalloc;
 
 // See <https://github.com/rust-lang/rust/pull/86844>.
 #[no_mangle]
-- 
2.45.2

