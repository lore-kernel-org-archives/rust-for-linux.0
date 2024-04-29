Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7714039D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421577; cv=none; b=nnG6IN0b5wo4akjKw1Z2nzDQviw37kTGdmm4L7+6mf+v64Vrk3ruEEfDZza5DrC6jrATAiqEMDzGLS/6zrIl9N08DxuC0TDJkGsj/HhAF9tZn2kGsTR51Ojs8exoDOWIrXwInBn2FRm/aorQu8cRjKhoXfwkqr2xbmXZhqE+p8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421577; c=relaxed/simple;
	bh=Jz32H7oq+CzNBqqdMkV5livvDbGtH6/b6qNGdLTjS5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLXlSnQqVNFMJZUPbW6gnIutD28FfC1qw64MxQ4G0FakXxlAAUz6OX8kTKidPu9UoAmZW3HBf2hHBys65ywWsnyY04uHs9iGG1P7zaSwXKPGIbLsHPeoNeMYMvnf8AjGzeda1dyOVtAdTrAiLzQpNRJszsSA6HrWM067XnoLN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JNDVRxgQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JNDVRxgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBMG9ix/Qgg234TBB9JgmaOXRuhAUgGd/aMauXCUTmc=;
	b=JNDVRxgQaOzEOovwoumeZ05TSRiMmB9Xpr1vdvZZR1ojAF4OBe/0Ar4Yp+2Wn2AaAh2Dka
	FHA0vgQqAmK9yJJ+cZKDyc4WHvj5/+Kvoyz3KzHmd+9hCfNB52gJHQPLhmaufeDbi+6xWE
	94zv1w6BrEic94GSfY15vp1HSqFXDP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-sOKn4-1CNM63VMdrn59n5A-1; Mon, 29 Apr 2024 16:12:53 -0400
X-MC-Unique: sOKn4-1CNM63VMdrn59n5A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-345aa380e51so3188607f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421572; x=1715026372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBMG9ix/Qgg234TBB9JgmaOXRuhAUgGd/aMauXCUTmc=;
        b=XDV5G+qidbuUqwhdJQOCePUClUHkSQxDcUuWMNZbpZDKtNF0aiaNSnIp/DUP8I3Itr
         NeVW7QVolRLTK04tizmfkY3tNB0z/jZ68aPJFelSAf+JhTJau8uoI9oJlBrzYN8geXKG
         /gOxSNv4pfWRXyHJPyyXpkuSiSyA4i6/2K4KdPRlIN5ymRSkP5dpyEU7ZsjOYxRvNkq3
         ADoH9NhoOrauLkT/wrUsCuGOaEv8gsmcPGaJ39LykrUPVFujb5S4WZRyDdsk0E32G6yn
         1aisOaezNMwDtoW19gJQQzgSlQqG4O4MkYeA1gkdz/hUgFywUFdNevuvWjdTicYz+iP5
         K/rg==
X-Gm-Message-State: AOJu0Yzu/bDZoxYXwDSy5++odf6rThNxDfUSeqL3OChXAPpQ5Avze/HC
	hX8GegY1JiC7dpRbxW1dTB9DefEnectm1eq7D4WTcXOq1z0/9CEfqclDbda41TkEmQ/+TiogJeF
	t6T0Ldsj+faPOqr07PSiff5/xaQb8bR6j124hx8CTI4HGBs9aSvTe+C7/xkuXrZRT
X-Received: by 2002:a5d:64eb:0:b0:34d:742e:3dbf with SMTP id g11-20020a5d64eb000000b0034d742e3dbfmr238421wri.0.1714421571911;
        Mon, 29 Apr 2024 13:12:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfwhJKaYGq0NdWEk7/s79qau3rTktOjbYC8PwAitalzbdIUDamwMDo6VbnUo5rVeAZOsAFnQ==
X-Received: by 2002:a5d:64eb:0:b0:34d:742e:3dbf with SMTP id g11-20020a5d64eb000000b0034d742e3dbfmr238410wri.0.1714421571673;
        Mon, 29 Apr 2024 13:12:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d6b88000000b0034c462f920csm10009736wrx.40.2024.04.29.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:51 -0700 (PDT)
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
Subject: [PATCH WIP 6/8] rust: alloc: implement BoxExtAlloc
Date: Mon, 29 Apr 2024 22:11:56 +0200
Message-ID: <20240429201202.3490-7-dakr@redhat.com>
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
 rust/kernel/alloc/box_ext.rs | 40 +++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index 76653d6f4257..74d6bb24e965 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -2,7 +2,7 @@
 
 //! Extensions to [`Box`] for fallible allocations.
 
-use super::Flags;
+use super::{AllocatorWithFlags, Flags};
 use alloc::boxed::Box;
 use core::alloc::AllocError;
 use core::mem::MaybeUninit;
@@ -21,6 +21,19 @@ pub trait BoxExt<T>: Sized {
     fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
 }
 
+/// Extensions to [`Box`].
+pub trait BoxExtAlloc<T, A: AllocatorWithFlags>: Sized {
+    /// Allocates a new box using a custom allocator.
+    ///
+    /// The allocation may fail, in which case an error is returned.
+    fn new_in(x: T, alloc: A, flags: Flags) -> Result<Self, AllocError>;
+
+    /// Allocates a new uninitialised box using a custom allocator..
+    ///
+    /// The allocation may fail, in which case an error is returned.
+    fn new_uninit_in(alloc: A, flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
+}
+
 impl<T> BoxExt<T> for Box<T> {
     fn new(x: T, flags: Flags) -> Result<Self, AllocError> {
         let b = <Self as BoxExt<_>>::new_uninit(flags)?;
@@ -51,6 +64,31 @@ fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError> {
             ptr.cast::<MaybeUninit<T>>()
         };
 
+        // SAFETY: For non-zero-sized types, we allocate above using the global allocator. For
+        // zero-sized types, we use `NonNull::dangling`.
+        Ok(unsafe { Box::from_raw(ptr) })
+    }
+
+}
+
+impl<T, A> BoxExtAlloc<T, A> for Box<T> where A: AllocatorWithFlags {
+    fn new_in(x: T, alloc: A, flags: Flags) -> Result<Self, AllocError> {
+        let b = <Self as BoxExtAlloc<_, A>>::new_uninit_in(alloc, flags)?;
+        Ok(Box::write(b, x))
+    }
+
+    fn new_uninit_in(alloc: A, flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError> {
+        let ptr = if core::mem::size_of::<MaybeUninit<T>>() == 0 {
+            core::ptr::NonNull::<_>::dangling().as_ptr()
+        } else {
+            let layout = core::alloc::Layout::new::<MaybeUninit<T>>();
+
+            let data = unsafe { alloc.alloc_flags(layout, flags)? };
+            let ptr = data.as_ptr();
+
+            ptr.cast::<MaybeUninit<T>>()
+        };
+
         // SAFETY: For non-zero-sized types, we allocate above using the global allocator. For
         // zero-sized types, we use `NonNull::dangling`.
         Ok(unsafe { Box::from_raw(ptr) })
-- 
2.44.0

