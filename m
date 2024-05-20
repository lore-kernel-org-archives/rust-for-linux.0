Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984C13AD05
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226062; cv=none; b=QrsuIi9tYUYRkaNs+kh+Ei9NIQqyC9v5xpCqjAlnlkuqSzxHM1ZzP2MywZLxu5t2s3P6hfmtT+3X4+4mZzKiDvTBcvZobSkhqHjJ4Qd1NdE2fWha4acoZNgJWT4DdDp9XuApdNsJG2Nrfuwup7Z5kALh5/sTBhHFEY/AiaHe+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226062; c=relaxed/simple;
	bh=YZfg+yFUJvGKf66LKiZJyB7z2AoSnnfdsff2xWWMZwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE39F+VkZ98/LUn97ZnE91Dsj2aeoQKVqJ++ZX8RX5dPl+Odd9jHkP8r7gKDGBwfOD1fim3ICu3uVGMt9FyxH+gpk2mFTmFVEA8t38poKc0LT0TnfrGTjYQs1PIOKQnCeoWmTEjMVgYNZZ4RzgpiH5jE2GsVxhsoz20VML3+65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dsf+nX4F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dsf+nX4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716226060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3g+oeQpArsYWOlDSausMXlW95ZfMKvIKOo6W5/n3oc=;
	b=Dsf+nX4FeTVE4ittJoyxJgKr82bhAlXgCdUxKsKOItRW1T4HQYcJDcml93rQNnV0PtlJTo
	L/VSorgoWX1Lc9TfEw2FX29t+nnamNtE+JJ3O71PoluIIbuvRtW567j0JwhME0AQSYMP/I
	H/+npJQflECwMjeuWjJ47CVufq2o3dY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-gkZQtxbLMJmwA3sDllN_uQ-1; Mon, 20 May 2024 13:27:38 -0400
X-MC-Unique: gkZQtxbLMJmwA3sDllN_uQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34e0836d91eso7975927f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226057; x=1716830857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3g+oeQpArsYWOlDSausMXlW95ZfMKvIKOo6W5/n3oc=;
        b=oyzBhp06uHbApf0fRVKykjhi+ZXaVHINUcGjDPNJ+Scb5cy5irYCr9KBaOlwOR8QV3
         6GFaP4Tuu29PecBM9G8v1u7la4IFXL5RWIqNk0Tc10qBETvK94keS8RhdFtv1OQfIVXL
         p/QHqqkjp3rEvFixWj7UfGFDuJFrKfQ6dt+26+69ZO53ecsxSZtI71KlXA2i4bJhYec7
         +sMMH3wlJe5+O+LwhCJkd2lPrUy4TOW28beIFj5UFW7O0LXYGUHSqpXXpm86ctQFkX76
         8FbEknIUNSk8Jlbra6+IHOCPRtRuwB/m+8dKrJY8G6kELz+r6HrHwq8VPw+X4mdxz7C2
         Z7qQ==
X-Gm-Message-State: AOJu0Yw47pSOf+rR+N6PEFFz5smCer6RpqKRKhNlh9Qd7YOj9nJE3i8c
	O9LqLlhvjplnuoExF/v8C+sUOL4MGv7QASzzfoY5JJlxPo/98GQkZrzC6cXnWA2IW6Rcpsrdw9F
	lRXpZW43Ja7IneSFyXagAwwp7os79u6s82xlI59sMrZehRjna4a3oDC1Xo77rQMvw
X-Received: by 2002:adf:ab1a:0:b0:351:4e42:c5f0 with SMTP id ffacd0b85a97d-3514e42c73emr20272333f8f.52.1716226057087;
        Mon, 20 May 2024 10:27:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu7wi4ZLZ2yvRdkdYrPpzRkpeebcFzF47KqCnjyY1JeHk/jzOQJr9+KzuhFk2uiAX8OmXa2g==
X-Received: by 2002:adf:ab1a:0:b0:351:4e42:c5f0 with SMTP id ffacd0b85a97d-3514e42c73emr20272302f8f.52.1716226056700;
        Mon, 20 May 2024 10:27:36 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-352f264c7f1sm9827066f8f.42.2024.05.20.10.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:27:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	bhelgaas@google.com,
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
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 11/11] rust: PCI: add BAR request and ioremap
Date: Mon, 20 May 2024 19:25:48 +0200
Message-ID: <20240520172554.182094-12-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172554.182094-1-dakr@redhat.com>
References: <20240520172554.182094-1-dakr@redhat.com>
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

From: Philipp Stanner <pstanner@redhat.com>

This commit implements a basic mechanism for requesting and IO-mapping
PCI BARs.

To perform IO on PCI devices it is necessary to have memory mapped PCI
BARs. Before mapping those, a region request should be performed so that
collisions with other drivers can be avoided.

Since all the logic necessary to obtain the aforementioned resources are
already implemented in C, Rust abstractions should use these interfaces.
Hereby, the Rust implementation has to ensure that all resources are
released again latest when the driver's remove() callback gets invoked,
or earlier if the driver drop()s the PCI resource.

This can be achieved through the Devres container, which uses devres
callbacks combined with Revocable to block access to the resource - in
this case, the PCI BAR and its IoMem.

A pci::Bar's Drop() trait shall deregister the memory region request and
iounmap() the mapping. In case remove() is invoked before such a Bar is
drop()ed, the Devres container shall ensure that access to the Bar is
revoke()d (through Revocable) so that no UAFs can occur.

Implement 'Bar', a container for requested and ioremapped PCI BARs.

Implement the Drop() trait such that the memory request and IO-mapping
get freed if Bar goes out of scope.

Implement Deref() so that the container is transparent.

Implement iomap_region() to create a Bar and have the result returned
through a Devres container, ensuring that the resources are latest freed
in the driver's remove() callback and access to the Bar is revoke()d for
outstanding users.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Co-developed-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/pci.rs | 123 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 606391cbff83..15730deca822 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -54,6 +54,7 @@
 
 #[doc(hidden)]
 pub use bindings;
+mod iomem;
 pub use macros;
 #[cfg(all(CONFIG_PCI, CONFIG_PCI_MSI))]
 pub mod pci;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 323aea565d84..403a1f53eb25 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -5,12 +5,17 @@
 //! C header: [`include/linux/pci.h`](../../../../include/linux/pci.h)
 
 use crate::{
-    bindings, container_of, device, driver,
+    alloc::flags::*,
+    bindings, container_of, device,
+    devres::Devres,
+    driver,
     error::{to_result, Result},
+    iomem::IoMem,
     str::CStr,
     types::{ARef, ForeignOwnable},
     ThisModule,
 };
+use core::ops::Deref;
 use kernel::prelude::*; // for pinned_drop
 
 /// An adapter for the registration of PCI drivers.
@@ -287,6 +292,104 @@ pub trait Driver {
 #[derive(Clone)]
 pub struct Device(ARef<device::Device>);
 
+/// A PCI BAR to perform IO-Operations on.
+pub struct Bar {
+    pdev: Device,
+    iomem: IoMem,
+    num: u8,
+}
+
+impl Bar {
+    fn new(pdev: Device, num: u8, name: &CStr) -> Result<Self> {
+        let barnr = num as i32;
+
+        let barlen = pdev.resource_len(num)?;
+        if barlen == 0 {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY:
+        // `pdev` is always valid.
+        // `barnr` is checked for validity at the top of the function.
+        // `name` is always valid.
+        let ret = unsafe { bindings::pci_request_region(pdev.as_raw(), barnr, name.as_char_ptr()) };
+        if ret != 0 {
+            return Err(EBUSY);
+        }
+
+        // SAFETY:
+        // `pdev` is always valid.
+        // `barnr` is checked for validity at the top of the function.
+        // `name` is always valid.
+        let ioptr: usize = unsafe { bindings::pci_iomap(pdev.as_raw(), barnr, 0) } as usize;
+        if ioptr == 0 {
+            // SAFETY:
+            // `pdev` is always valid.
+            // `barnr` is checked for validity at the top of the function.
+            unsafe { bindings::pci_release_region(pdev.as_raw(), barnr) };
+            return Err(ENOMEM);
+        }
+
+        let iomem = match IoMem::new(ioptr, barlen as usize) {
+            Ok(iomem) => iomem,
+            Err(err) => {
+                // SAFETY:
+                // `pdev` is always valid.
+                // `ioptr` was created above, and `num` was checked at the top of the function.
+                unsafe { Self::do_release(&pdev, ioptr, num) };
+                return Err(err);
+            }
+        };
+
+        Ok(Bar { pdev, iomem, num })
+    }
+
+    fn index_is_valid(i: u8) -> bool {
+        // A pci_dev on the C side owns an array of resources with at most
+        // PCI_NUM_RESOURCES entries.
+        if i as i32 >= bindings::PCI_NUM_RESOURCES as i32 {
+            return false;
+        }
+
+        true
+    }
+
+    // SAFETY: The caller should ensure that `ioptr` is valid.
+    unsafe fn do_release(pdev: &Device, ioptr: usize, num: u8) {
+        // SAFETY:
+        // `pdev` is Rust data and guaranteed to be valid.
+        // A valid `ioptr` should be provided by the caller, but an invalid one
+        // does not cause faults on the C side.
+        // `num` is checked for validity above.
+        unsafe {
+            bindings::pci_iounmap(pdev.as_raw(), ioptr as _);
+            bindings::pci_release_region(pdev.as_raw(), num as i32);
+        }
+    }
+
+    fn release(&self) {
+        // SAFETY:
+        // Safe because `self` always contains a refcounted device that belongs
+        // to a pci::Device.
+        // `ioptr` and `num` are always valid because the Bar was created successfully.
+        unsafe { Self::do_release(&self.pdev, self.iomem.ioptr, self.num) };
+    }
+}
+
+impl Drop for Bar {
+    fn drop(&mut self) {
+        self.release();
+    }
+}
+
+impl Deref for Bar {
+    type Target = IoMem;
+
+    fn deref(&self) -> &Self::Target {
+        &self.iomem
+    }
+}
+
 impl Device {
     /// Create a PCI Device instance from an existing `device::Device`.
     ///
@@ -319,6 +422,24 @@ pub fn set_master(&self) {
         // SAFETY: By the type invariants, we know that `self.ptr` is non-null and valid.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Returns the size of the given PCI bar resource.
+    pub fn resource_len(&self, bar: u8) -> Result<bindings::resource_size_t> {
+        if !Bar::index_is_valid(bar) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: Safe as by the type invariant.
+        Ok(unsafe { bindings::pci_resource_len(self.as_raw(), bar.into()) })
+    }
+
+    /// Mapps an entire PCI-BAR after performing a region-request on it.
+    pub fn iomap_region(&mut self, barnr: u8, name: &CStr) -> Result<Devres<Bar>> {
+        let bar = Bar::new(self.clone(), barnr, name)?;
+        let devres = Devres::new(self.0.clone(), bar, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
 }
 
 impl AsRef<device::Device> for Device {
-- 
2.45.1

