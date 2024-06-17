Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8D71741DF
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718656229; cv=none; b=V7AhRrEdbb6upzIWXzFa6ptOJg3e8setTd2vX39kC07YQCI3i4CNMwtYbV0WOgI5O01sPILZ2l52Un/webOMKxWEVcx5AAjzmYVzFRhN0geiGa7vmdQRdWryBFBqMzlMSy4/eWUKu3I4jWSwS6JNjV6rVpNtYLzYDmaSVEkV4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718656229; c=relaxed/simple;
	bh=A8M6FF7htEPo5boFGolkHiGeAc6qKIiKNMl16i3X2mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5tRVz2w5cAcpZuyPaB0z1Gq9dQIoFeuex+zi7NNPvtFgStjJ0Cmlk6Py/HBQxjw6OgL64Zlw2EKURwyxgEfsKzdfoRVaSqqt6Yzw+WryGgSwzZT8hpyq8pw+F1ryJK0Ww/d/+HdwUQjU/5xRnWFSSYF1uoEViIX6bO3sWo/2FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SopFgF19; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SopFgF19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718656226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xI+z2ALaUfW3Qgvh6spulMhk7FV84f8kGNKB6ILw4nc=;
	b=SopFgF1916kTTNX3RnnGqfWI0q13jLoaDbgPNGTg9RITaBe0T2W5vW2T50l5nIk1ClTG30
	Ak9XNzqRIEjOWbtuanix62crRKWbcCpiTm4cSSx2mx2HAD8QpYYnb8APGwGauGgq3e2EKO
	7dRzjKpkGEwmQB7DtRT8bxW+zaULsOw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-V3KGN7ooMjWvGBhTS3EzXQ-1; Mon, 17 Jun 2024 16:30:23 -0400
X-MC-Unique: V3KGN7ooMjWvGBhTS3EzXQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-421791c4eadso26828195e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718656222; x=1719261022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI+z2ALaUfW3Qgvh6spulMhk7FV84f8kGNKB6ILw4nc=;
        b=w3tDZjmmoPdLSvH6SNw9Rpg+oRVQlnMyiE0t9urpdcOllllo0k5jhr/2h1pNuK7CFe
         qfhkU4+B5K+B30hmplRMMb9gIVBlkmAxvKHiReQqsxYvQh1WTVLHepELWLKcPB+658pq
         0AcPRff6SffceSCIX1/oNp5Bc2ZZL5M6yeoCmS7Y+1iGdSfbfAogMf6UVYF9HXqCa5bD
         owum81Ryj7YWDz8wXVQ78a22kvmi7pG4zP4/mkGeapj5/Bs8Okthl3Ffw/nCebLnR8zb
         KzrGwy39Q1NACG42z4rI3dRiAXd+iioF4wjHoF3Y1+E0q6ilBDukDVLgATHlQ+J1YgXa
         LIsA==
X-Gm-Message-State: AOJu0Yx2O9FwnBdfEFIHqnZvdLdJhxZrDf+L2pkFS0+YaeQbXoD4F8Iz
	3/WrHVcmoLDgxRTIr0yu1guKvZGZ1t2xsLoP0wC9/ucpXKgpRDftYp4H5YjlM/6tm6X+I3Cj3lh
	f9dpoRBxWkhFBDZFrEOlIRCzSlwwReLRqxC0d/D2dGPTo0+Fkmy7KvjvDyqBj50lF
X-Received: by 2002:a05:600c:1d82:b0:420:ffe3:8536 with SMTP id 5b1f17b1804b1-42304854ecdmr88726075e9.37.1718656222035;
        Mon, 17 Jun 2024 13:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmp0ZVVmRphzqmYQn2Ly27dG0tqw083L13j4r8JcE0pxXR+Ka+RQpWXbiA8+YnOYH4G8hKeg==
X-Received: by 2002:a05:600c:1d82:b0:420:ffe3:8536 with SMTP id 5b1f17b1804b1-42304854ecdmr88725825e9.37.1718656221727;
        Mon, 17 Jun 2024 13:30:21 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422a1e68d04sm185142205e9.36.2024.06.17.13.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 13:30:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mcgrof@kernel.org,
	russ.weight@linux.dev,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v3 1/2] rust: add abstraction for struct device
Date: Mon, 17 Jun 2024 22:29:40 +0200
Message-ID: <20240617203010.101452-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240617203010.101452-1-dakr@redhat.com>
References: <20240617203010.101452-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an (always) reference-counted abstraction for a generic C `struct
device`. This abstraction encapsulates existing `struct device` instances
and manages its reference count.

Subsystems may use this abstraction as a base to abstract subsystem
specific device instances based on a generic `struct device`, such as
`struct pci_dev`.

Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/helpers.c        |   1 +
 rust/kernel/device.rs | 102 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |   1 +
 3 files changed, 104 insertions(+)
 create mode 100644 rust/kernel/device.rs

diff --git a/rust/helpers.c b/rust/helpers.c
index 2c37a0f5d7a8..0e02b2c64c72 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -23,6 +23,7 @@
 #include <kunit/test-bug.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errname.h>
 #include <linux/mutex.h>
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..e445e87fb7d7
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
+
+use crate::{
+    bindings,
+    types::{ARef, Opaque},
+};
+use core::ptr;
+
+/// A reference-counted device.
+///
+/// This structure represents the Rust abstraction for a C `struct device`. This implementation
+/// abstracts the usage of an already existing C `struct device` within Rust code that we get
+/// passed from the C side.
+///
+/// An instance of this abstraction can be obtained temporarily or permanent.
+///
+/// A temporary one is bound to the lifetime of the C `struct device` pointer used for creation.
+/// A permanent instance is always reference-counted and hence not restricted by any lifetime
+/// boundaries.
+///
+/// For subsystems it is recommended to create a permanent instance to wrap into a subsystem
+/// specific device structure (e.g. `pci::Device`). This is useful for passing it to drivers in
+/// `T::probe()`, such that a driver can store the `ARef<Device>` (equivalent to storing a
+/// `struct device` pointer in a C driver) for arbitrary purposes, e.g. allocating DMA coherent
+/// memory.
+///
+/// # Invariants
+///
+/// The pointer stored in `Self` is non-null and valid for the lifetime of the `ARef` instance. In
+/// particular, the `ARef` instance owns an increment on the underlying object’s reference count.
+///
+/// `bindings::device::release` is valid to be called from any thread, hence `ARef<Device>` can be
+/// dropped from any thread.
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::device>);
+
+impl Device {
+    /// Creates a new reference-counted abstraction instance of an existing `struct device` pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    /// i.e. it must be ensured that the reference count of the C `struct device` `ptr` points to
+    /// can't drop to zero, for the duration of this function call.
+    ///
+    /// It must also be ensured that `bindings::device::release` can be called from any thread.
+    /// While not officially documented, this should be the case for any `struct device`.
+    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
+        // SAFETY: By the safety requirements, ptr is valid.
+        // Initially increase the reference count by one to compensate for the final decrement once
+        // this newly created `ARef<Device>` instance is dropped.
+        unsafe { bindings::get_device(ptr) };
+
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
+        let ptr = ptr.cast::<Self>();
+
+        // SAFETY: By the safety requirements, ptr is valid.
+        unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(ptr)) }
+    }
+
+    /// Obtain the raw `struct device *`.
+    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+        self.0.get()
+    }
+
+    /// Convert a raw C `struct device` pointer to a `&'a Device`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    /// i.e. it must be ensured that the reference count of the C `struct device` `ptr` points to
+    /// can't drop to zero, for the duration of this function call and the entire duration when the
+    /// returned reference exists.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(obj.cast().as_ptr()) }
+    }
+}
+
+// SAFETY: As by the type invariant `Device` can be sent to any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` can be shared among threads because all immutable methods are protected by the
+// synchronization in `struct device`.
+unsafe impl Sync for Device {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fbd91a48ff8b..dd1207f1a873 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -28,6 +28,7 @@
 
 pub mod alloc;
 mod build_assert;
+pub mod device;
 pub mod error;
 pub mod init;
 pub mod ioctl;
-- 
2.45.1

