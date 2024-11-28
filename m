Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB01AF0DE
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732803216; cv=none; b=Dc9WannJos9QzQRipLWI8qJ+uBG19dGybH896aZGPC165RltWWf1NKrv1ibtbWuap7tdJOd6lj+jjUcIIb/V7Z/edCz59TyN7MytBxYM2TxkqUoEMidUNcEX0NPkjNu8oxjtinEeGZlyeKH0O3SX6iyylPXcBlrPJs+z9kcdInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732803216; c=relaxed/simple;
	bh=E3Ik4zpqBXaoUgm4o3J8sc3AWKSWWlS7ekn07azRmjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Ovg2t39udxeX2CGfVthp+6rrzrPIKgyskwS7ZkrnzwxcY1tqiEAFAwyfnhcp5MqGNXJ4fiAyrX4GKF21yZF0ucVuVBqvNuY2LxGIoXj7LH7XyxfTAj8YYUSkiu0Alzpuay/qX5adLi/lwCiJ37s1e08bzRo7ATWkb4coDkMQyBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NriGOW7T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NriGOW7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732803213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6SJAHP15rGarv2ZWYIDM7GIKVfkSq/CuvkJEM5Zlm4=;
	b=NriGOW7TutloO0I0ws4YY0o79IxeMEwcpqdWnIyFdaBNhh10i0DGCVGozwMem7MwLq0OMp
	ojTyJnxdg0CEyKs5Pdi+WMopHfg4m5l95HK3dj6HUBZSNwa5ONSqZHsgogtd0JlsSQ+4w7
	js+43KvyZ6aUsvQE+6HvqrETTtvzCCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-aI8GK8rCPoyh9uidrJmu4A-1; Thu, 28 Nov 2024 09:13:32 -0500
X-MC-Unique: aI8GK8rCPoyh9uidrJmu4A-1
X-Mimecast-MFC-AGG-ID: aI8GK8rCPoyh9uidrJmu4A
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4349f32c9a6so6484485e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 06:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732803210; x=1733408010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6SJAHP15rGarv2ZWYIDM7GIKVfkSq/CuvkJEM5Zlm4=;
        b=j9fnebVGOBFWF52XsGLSjGzJqS+MsxcE3kxcRKju+M5qIIwWBSIeZvlFQWiTYEEGg3
         4eSUAEMuvFjUZJfs9+1B4B+g6Ou5nQ+OPCtjJcvo6JmxrSANvjTxhhK26ju/Yaaf4hfa
         2wcpabj6rr3jl+mZTn6+jwCYQP/a+u5jHsrF/mJLdusyS+evoR9UdXeTyZYTrM7gZcNt
         KOmwE4fjK+mEz5UKj3cUqvxXCgpfYP0mqRNqJfsNSmNCgadVE/l3bNgsBkfk+s7G+g16
         TCm1ACvSISffVoA+8XrJ9IqwF7XuDQVz97AChWBzbYU3CHA584L16HkJ+8boC47/rgIH
         IeHw==
X-Gm-Message-State: AOJu0YzBtiBU8nQ/PPuT/bkBnLgihGUvDu9BFtZ/9hWEOYJ+6hFBdyiE
	Rz7h4/N0N3DZmAj2jwIXmlJN4h3703CfM5HS+Q2mbWXmfoD476LOPHjiJJEkM7REnoiB1UpTINe
	T+6T4zqyDQRNE/ElGQUg78HYUz6nv8W2/l/v/ss5WQSRV9g+PxwFP1/VGqqI8o4EEc8mcLh49uv
	Ed32ObpdvGagtb1FqxkA1Rd3i1NHNljSOI/a4rEMpfRmVKkCVd
X-Gm-Gg: ASbGncvUU1k2uIU7kB8KI+u0FUvGYAKiTkiAsatCBfo+0DScPDeiNhm7HKxD550FQvU
	LdFVsFBuh/qEnjHgfM2Fo6jn7bsZBKVScMMTt9dp2a8cizLwgD4Gyjgv5KUhkYwA1e6MI2RI7tJ
	YzSN86slBMJtxg//JF0jYPVwdEt+e7pKZc3vRYlLQHA5YE+RAerGL8pwp2PuzZWEA8EqrZiPESC
	R2/xbcYC4Tb795TiKRwAeYSRz6iy1D5vaECoIY+pZGJp/hLOVzEew==
X-Received: by 2002:a05:600c:5102:b0:434:a7b6:10ee with SMTP id 5b1f17b1804b1-434a9dcdeb4mr73655125e9.18.1732803210349;
        Thu, 28 Nov 2024 06:13:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzxzRKTj1hhxbgKbfI9iOKu3aqDxVuon8Cnx4/Dji1Z2q/mHAgXbf419s79zhA/kno8QYJYA==
X-Received: by 2002:a05:600c:5102:b0:434:a7b6:10ee with SMTP id 5b1f17b1804b1-434a9dcdeb4mr73654785e9.18.1732803209917;
        Thu, 28 Nov 2024 06:13:29 -0800 (PST)
Received: from [192.168.10.3] ([151.49.236.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e48edsm54409575e9.42.2024.11.28.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:13:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	axboe@kernel.dk,
	tmgross@umich.edu,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	alex.gaynor@gmail.com,
	a.hindborg@kernel.org
Subject: [PATCH 2/2] rust: block/mq: replace mem::zeroed() with Zeroable trait
Date: Thu, 28 Nov 2024 15:13:23 +0100
Message-ID: <20241128141323.481033-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128141323.481033-1-pbonzini@redhat.com>
References: <20241128141323.481033-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aUucmk7AdvqqBGY30a7JoqYT7WBz4cVItzk6JtwxXv4_1732803211
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Isolate the unsafety in the declaration of the Zeroable trait, instead of having
to use "unsafe" just to declare a struct.  This is more similar to how you would
use "..Default::default()" (which is also a possibility here, but arguably
less efficient).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/kernel/block/mq/gen_disk.rs |  8 +++++---
 rust/kernel/block/mq/tag_set.rs  | 10 ++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 708125dce96a..65342d065296 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -6,7 +6,7 @@
 //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
 
 use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
-use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
+use crate::{bindings, error::from_err_ptr, error::Result, init::Zeroable, sync::Arc};
 use crate::{error, static_lock_class};
 use core::fmt::{self, Write};
 
@@ -31,6 +31,9 @@ fn default() -> Self {
     }
 }
 
+// SAFETY: `bindings::queue_limits` contains only fields that are valid when zeroed.
+unsafe impl Zeroable for bindings::queue_limits {}
+
 impl GenDiskBuilder {
     /// Create a new instance.
     pub fn new() -> Self {
@@ -93,8 +96,7 @@ pub fn build<T: Operations>(
         name: fmt::Arguments<'_>,
         tagset: Arc<TagSet<T>>,
     ) -> Result<GenDisk<T>> {
-        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
-        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
+        let mut lim: bindings::queue_limits = Zeroable::ZERO;
 
         lim.logical_block_size = self.logical_block_size;
         lim.physical_block_size = self.physical_block_size;
diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index f9a1ca655a35..1ff7366ca549 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -10,6 +10,7 @@
     bindings,
     block::mq::{operations::OperationsVTable, request::RequestDataWrapper, Operations},
     error,
+    init::Zeroable,
     prelude::PinInit,
     try_pin_init,
     types::Opaque,
@@ -32,6 +33,10 @@ pub struct TagSet<T: Operations> {
     _p: PhantomData<T>,
 }
 
+// SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
+// all are allowed to be 0.
+unsafe impl Zeroable for bindings::blk_mq_tag_set {}
+
 impl<T: Operations> TagSet<T> {
     /// Try to create a new tag set
     pub fn new(
@@ -39,9 +44,6 @@ pub fn new(
         num_tags: u32,
         num_maps: u32,
     ) -> impl PinInit<Self, error::Error> {
-        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
-        // all are allowed to be 0.
-        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
         let tag_set = core::mem::size_of::<RequestDataWrapper>()
             .try_into()
             .map(|cmd_size| {
@@ -55,7 +57,7 @@ pub fn new(
                     flags: bindings::BLK_MQ_F_SHOULD_MERGE,
                     driver_data: core::ptr::null_mut::<core::ffi::c_void>(),
                     nr_maps: num_maps,
-                    ..tag_set
+                    ..Zeroable::ZERO
                 }
             });
 
-- 
2.47.0

