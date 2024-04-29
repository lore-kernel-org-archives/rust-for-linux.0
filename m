Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125A1411DC
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421565; cv=none; b=Y4YGiNi4w2IskUED4nS/TIdnW8PhIiywdR+UkYpQr7H7XcHAZhcY1i4YLJFNDJJp4PqhcGJtYAFvDK6io17m2jC7073QNFTUtnvrGvl1QEbIQxJnluAcOiv/WyczDaS50TgsWctLyLv28Pw3t6Q1n6V2czckwnxPhJRctzDuAag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421565; c=relaxed/simple;
	bh=Zm5kCXqpxiaglaDQHVa217uYu5ECvxHE1cvWHyZP/6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W90ph0/qIOoyBhI1ID1qqDDnSySE877yFzZKM54SdwGfOCcwIshVoFXRIFEOkSEfgEc60ZgTRtM8+wu+uMR942iVfryGINpkh8WXjNkOV+ZQVXTGFBqIb7fRWM2zreXVkDkFg2Xiyqm84dTSGvLCtLpBfcb98yw1H5zW2lFwDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2Ewjhm7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2Ewjhm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2KgDBfAZJyFV5vmZ4/+Tnupy907b5tR6MHRNyQJaEg=;
	b=f2Ewjhm7nf9uHmIf6d8LRReLDNGrSLucy5pkv2491OU8i9BajCYVnYqvE76W5BCtjeR9/Y
	5WGhD4MSoR6GFjw13i1Q9u/HGeeZrRiiTFgseSq5PfPr8Odqclp3OLwByyJ3HvZj6VS9s/
	9JclGDw8X6zhyja+3sfZvWGpL8s0C1Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-11xXfN5EMVujG0-MA_Rgtg-1; Mon, 29 Apr 2024 16:12:41 -0400
X-MC-Unique: 11xXfN5EMVujG0-MA_Rgtg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-343f08542f8so3409402f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421560; x=1715026360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2KgDBfAZJyFV5vmZ4/+Tnupy907b5tR6MHRNyQJaEg=;
        b=nnDKzBCutwDB5muGfBlMeYEg5KGfVD7BozymUeL80o7MG52X9S0PcLrf+tFGmFgeue
         HVXsmJ8CAbxHCLF7B11SrWxylAm6mrqTN16w6HZF7+h30oXofbrPIcTePgpCGYm2hy3/
         xpeFBqiuyP3MhFYHcjAAPQ4Vxeho/VGfA/RBNU2kApCzdOU1NGzqMkracsHv0pVcxhL1
         nw5c9SaX3J/RftsLzVQ3LcTAVZyz35iW5d2rAd2mExShGl6uWcPuwO8TcoyDd5zG/7JU
         FIJ/BNUyITwTn96QeSkhd7MuZKQXGoS8U+EB/D6tHwY9izlNM1LJ8j9EkGQ5b5uW0W8q
         XtjQ==
X-Gm-Message-State: AOJu0YykcrY/D4I0ktYlYBlDt86INcv/i1I2aoUw6mP6M3MxmwvjUU0a
	iisZX6PNkTgttBRST1fdo8kYaPqhQDk4uE1y8wx7voXEurrNAq726q2n5JUIqLzmSxoPQgpl0lX
	3H1oy4QVVohGp33o3hwMuMB0Tsnq9PkZagnOjMW0M/7yFcEm2Wfocf+nWXKHH05c9
X-Received: by 2002:a5d:5189:0:b0:347:adba:a3b0 with SMTP id k9-20020a5d5189000000b00347adbaa3b0mr546619wrv.7.1714421560237;
        Mon, 29 Apr 2024 13:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Df5SEPM0tsG7fPLdIaU1ONmftzXuUafATFslCSa3Bq19h2cxxtigIaCB8KKC6PnO1J4Zyw==
X-Received: by 2002:a5d:5189:0:b0:347:adba:a3b0 with SMTP id k9-20020a5d5189000000b00347adbaa3b0mr546613wrv.7.1714421559952;
        Mon, 29 Apr 2024 13:12:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d434b000000b0034a2d0b9a4fsm29166269wrr.17.2024.04.29.13.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:39 -0700 (PDT)
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
Subject: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
Date: Mon, 29 Apr 2024 22:11:53 +0200
Message-ID: <20240429201202.3490-4-dakr@redhat.com>
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
 rust/kernel/alloc.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 9bc1b48b5641..ec45ba8f77ce 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -8,6 +8,14 @@
 pub mod box_ext;
 pub mod vec_ext;
 
+use core::{
+    alloc::{Allocator, AllocError, Layout},
+    ptr,
+    ptr::NonNull,
+};
+
+use flags::*;
+
 /// Flags to be used when allocating memory.
 ///
 /// They can be combined with the operators `|`, `&`, and `!`.
@@ -68,3 +76,16 @@ pub mod flags {
     /// small allocations.
     pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);
 }
+
+pub unsafe trait AllocatorWithFlags: Allocator {
+    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
+    unsafe fn realloc_flags(&self, ptr: *mut u8, old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
+
+    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL) }
+    }
+
+    fn default_allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
+        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL | __GFP_ZERO) }
+    }
+}
-- 
2.44.0

