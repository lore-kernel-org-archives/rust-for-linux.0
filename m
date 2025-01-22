Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D81D31A5
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590071; cv=none; b=ksA2LRcjAmsS6Wltcrd5YR3gKka1xTYUSEQJ+1ENcwcUp9wnl59FPoM4Z3PBJ2dOAyhpvSbTv6Ow95cOQO1lhR59+8FTGn42RbyI747ZZBMtnmXxH9qIv1gmtieVPhWhrGGqK2iUJtYwtnGK56UkumN2eFDhgsKCKhJe10bmEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590071; c=relaxed/simple;
	bh=k+2WxuFUkJb3ygcg18Fn5sNX0oS0EgYOnFVMYFHzHjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ba67BXtGoYJjzVSiyAaeyq1MLslZ9ErWESWeQ/BZGubieFnCbF1Y9bW4SkXDPFWmLVyAXCgHA8ZxdpeA7eoqXajQlLVQlKkAwVfVpUEniJJOLl1P0EEJG/+ILJPCUvxxvg9HVf/BJ4TR5pDJsLT/uBFp6xs1YjEHMtDudE7stSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IaKwuhLw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IaKwuhLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737590068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qn5VPfgtJ4t4Y4+cqcL97GvZXixeJcYoIyEVffAkuws=;
	b=IaKwuhLw/oQX/M9nE9R0uzi8YViFBUORLdhVbC3dM8tujciGT9/pvVajxuWWHAovqHN1tL
	s3BPDt6BCbLKKtVNjTk7tUAbgTr15vWqINZlIODUv9cZvsc+VPbzQMdINpCu2SssPYLwJL
	zcLUZrUe2VZWClmTSv+RZswX57EPXtY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-z2VU-b20N-egqKu72yEhTQ-1; Wed,
 22 Jan 2025 18:54:25 -0500
X-MC-Unique: z2VU-b20N-egqKu72yEhTQ-1
X-Mimecast-MFC-AGG-ID: z2VU-b20N-egqKu72yEhTQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F3091956080;
	Wed, 22 Jan 2025 23:54:23 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.57])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9107319560AA;
	Wed, 22 Jan 2025 23:54:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Date: Wed, 22 Jan 2025 18:49:22 -0500
Message-ID: <20250122235340.2145383-3-lyude@redhat.com>
In-Reply-To: <20250122235340.2145383-1-lyude@redhat.com>
References: <20250122235340.2145383-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

A number of kernel modules work with virtual devices, where being virtual
implies that there's no physical device to actually be plugged into the
system. Because of that, such modules need to be able to manually
instantiate a kernel device themselves - which can then be probed in the
same manner as any other kernel device.

This adds support for such a usecase by introducing another platform device
type, ModuleDevice. This type is interchangeable with normal platform
devices, with the one exception being that it controls the lifetime of the
registration of the device.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-authored-by: Maíra Canal <mairacanal@riseup.net>
---
 rust/kernel/platform.rs | 96 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 75dc7824eccf4..b5d38bb182e93 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -13,8 +13,11 @@
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
-
-use core::ptr::{NonNull, addr_of_mut};
+use core::{
+    mem::ManuallyDrop,
+    ops::*,
+    ptr::{addr_of_mut, NonNull},
+};
 
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
@@ -213,3 +216,92 @@ fn as_ref(&self) -> &device::Device {
         &self.0
     }
 }
+
+/// A platform device ID specifier.
+///
+/// This type is used for selecting the kind of device ID to use when constructing a new
+/// [`ModuleDevice`].
+#[derive(Copy, Clone)]
+pub enum ModuleDeviceId {
+    /// Do not use a device ID with a device.
+    None,
+    /// Automatically allocate a device ID for a device.
+    Auto,
+    /// Explicitly specify a device ID for a device.
+    Explicit(i32),
+}
+
+impl ModuleDeviceId {
+    fn as_raw(self) -> Result<i32> {
+        match self {
+            ModuleDeviceId::Explicit(id) => {
+                if matches!(
+                    id,
+                    bindings::PLATFORM_DEVID_NONE | bindings::PLATFORM_DEVID_AUTO
+                ) {
+                    Err(EINVAL)
+                } else {
+                    Ok(id)
+                }
+            }
+            ModuleDeviceId::None => Ok(bindings::PLATFORM_DEVID_NONE),
+            ModuleDeviceId::Auto => Ok(bindings::PLATFORM_DEVID_AUTO),
+        }
+    }
+}
+
+/// A platform device that was created by a module.
+///
+/// This type represents a platform device that was manually created by a kernel module, typically a
+/// virtual device, instead of being discovered by the kernel. It is probed upon creation in the
+/// same manner as a typical platform device, and the device will not be unregistered until this
+/// type is dropped.
+// We store the Device in a ManuallyDrop container, since we must enforce that our reference to the
+// Device is dropped using platform_device_unregister()
+pub struct ModuleDevice(ManuallyDrop<Device>);
+
+impl ModuleDevice {
+    /// Create and register a new platform device.
+    ///
+    /// This creates and registers a new platform device. This is usually only useful for drivers
+    /// which create virtual devices, as drivers for real hardware can rely on the kernel's probing
+    /// process.
+    pub fn new(name: &'static CStr, id: ModuleDeviceId) -> Result<Self> {
+        // SAFETY:
+        // * ModuleDeviceId::as_raw() always returns a valid device ID
+        // * Returns NULL on failure, or a valid platform_device pointer on success
+        let pdev_ptr = unsafe { bindings::platform_device_alloc(name.as_char_ptr(), id.as_raw()?) };
+        if pdev_ptr.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY:
+        // * The previous function is guaranteed to have returned a valid pointer to a platform_dev,
+        //   or NULL (which we checked for already)
+        // * The previous function also took a single reference to the platform_dev
+        let pdev = unsafe { Device::from_raw(pdev_ptr) };
+
+        // SAFETY: We already checked that pdev_ptr is valid above.
+        to_result(unsafe { bindings::platform_device_add(pdev_ptr) })
+            .map(|_| ModuleDevice(ManuallyDrop::new(pdev)))
+    }
+}
+
+impl Deref for ModuleDevice {
+    type Target = Device;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl Drop for ModuleDevice {
+    fn drop(&mut self) {
+        // SAFETY: Only one instance of this type can exist for a given platform device, so this is
+        // safe to call.
+        unsafe { bindings::platform_device_unregister(self.as_raw()) }
+
+        // No need to manually drop our contents, as platform_device_unregister() dropped the ref
+        // count that was owned by this type.
+    }
+}
-- 
2.47.1

