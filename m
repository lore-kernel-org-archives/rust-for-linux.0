Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63C218AA2;
	Thu,  9 Jan 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429575; cv=pass; b=hq4FNax+pxMkKXXj/NI9Vna+nv2GUURFz7besaaeBixpbi+a6VKdQw/daUKFU4ZKH9ZBfWMFUzZ7q9Vb3QM5HXQthushVmgP4uIhIZ5o5w4T0REMszR4vRfYSTvUdCAvmjq1P1sNy+mz3coL+rWIw3VgulT7bWdLB+RboZQqNMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429575; c=relaxed/simple;
	bh=OyLYxTOVAlFhT8oqEEuw1gs3cOzGszCg81p8FkmSV1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvVzWHABUzg1MUovZajr21IV/Clx+w4D5Rg8M40wrbePEv+Ln+Bl1ALrcrpgzDuphMkUbwsqlDcSv3XAoSAh1NxKCJoy4Fw/KhESbDKCiU4QcpdQr66kdn2g/8BbHiUwROHreKQgfQ+OvhX8XdQGqTfuQdfVCD7b/Uc+4nPnyXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AG9/dwyb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AG9/dwyb"
ARC-Seal: i=1; a=rsa-sha256; t=1736429556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aZAvmbA9+6lhCrgkoYJ89hK9AEJWUfX3dXEYEmfUp6vfIMMT0iEHrwzwLc9IJXXnfDX94ADHk4OMVitJL4MbrRgm4hhk+yrhOZmzGV3C/yQLL/fsXqaysrL3i1R+5AxDogo1I9e/O1r0gdzX4o5WyjP70UWwAs46plu0WvmIEVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736429556; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7420RDTEKewPFPGNmdGzr3U/kXyX9XcWh+9nisX56wc=; 
	b=UgYDvisGkU+PJbLiCWAG+OuCIT6Nhp/xcvgSK7y9sR3RyBjiwzOAGwQMuGoehDNWPcrmK0qjBtqlX/tx6aCG2qXsOyEof9AvzylWlFS+Uvc/sRPSivcrEcwPcWtbyIVurFfwEmu3C1Kmg9XztP3V65vAc68B/FixoAyebGCJi8U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736429555;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7420RDTEKewPFPGNmdGzr3U/kXyX9XcWh+9nisX56wc=;
	b=AG9/dwybFI9kZAxKr99nf/USMy/hJeAn1EYoboYcvy7UqgJyLLGwRH5X8hCuF92W
	qhT2clgxZTLPH1XSvEAwqv+7dHW7zv9Qbu0KHQXTRUWuXDfGP4AN1rmdJW7LF11c1dO
	seHoP5H5g7/JMAWGB9lg4r3luSzKmYc9eMFoY+o0=
Received: by mx.zohomail.com with SMTPS id 1736429553593969.069510451024;
	Thu, 9 Jan 2025 05:32:33 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] rust: platform: allow ioremap of platform resources
Date: Thu,  9 Jan 2025 10:30:55 -0300
Message-ID: <20250109133057.243751-4-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from a some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 98 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 03287794f9d0..9575917a1b2d 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,8 +5,11 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    bindings, container_of, device, driver,
+    bindings, container_of, device,
+    devres::Devres,
+    driver,
     error::{to_result, Result},
+    io::{mem::IoMem, resource::Resource},
     of,
     prelude::*,
     str::CStr,
@@ -189,6 +192,99 @@ fn as_raw(&self) -> *mut bindings::platform_device {
         // embedded in `struct platform_device`.
         unsafe { container_of!(self.0.as_raw(), bindings::platform_device, dev) }.cast_mut()
     }
+
+    /// Maps a platform resource through ioremap() where the size is known at
+    /// compile time.
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform};
+    ///
+    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
+    ///     // No runtime checks will apply when reading and writing.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource, true)?;
+    ///
+    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
+    ///     // the `Devres` makes sure that the resource is still valid.
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.readl(offset);
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.writel(data, offset);
+    ///
+    ///     # Ok::<(), Error>(())
+    /// }
+    /// ```
+    pub fn ioremap_resource_sized<const SIZE: usize>(
+        &self,
+        resource: &Resource,
+        exclusive: bool,
+    ) -> Result<Devres<IoMem<SIZE>>> {
+        // SAFETY: We wrap the resulting `IoMem` in a `Devres`.
+        let io = unsafe { IoMem::new(resource, exclusive) }?;
+        let devres = Devres::new(self.as_ref(), io, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
+
+    /// Maps a platform resource through ioremap().
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform};
+    ///
+    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // Unlike `ioremap_resource_sized`, here the size of the memory region
+    ///     // is not known at compile time, so only the `try_read*` and `try_write*`
+    ///     // family of functions are exposed, leading to runtime checks on every
+    ///     // access.
+    ///     let iomem = pdev.ioremap_resource(&resource, true)?;
+    ///
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_readl(offset)?;
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.try_writel(data, offset)?;
+    ///
+    ///     # Ok::<(), Error>(())
+    /// }
+    /// ```
+    pub fn ioremap_resource(&self, resource: &Resource, exclusive: bool) -> Result<Devres<IoMem>> {
+        self.ioremap_resource_sized::<0>(resource, exclusive)
+    }
+
+    /// Returns the resource at `index`, if any.
+    pub fn resource(&self, index: u32) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
+        let resource = unsafe {
+            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
+        };
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        (!resource.is_null()).then(|| unsafe { Resource::from_ptr(resource) })
+    }
+
+    /// Returns the resource with a given `name`, if any.
+    pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
+        // platform_device` and `name` points to a valid C string.
+        let resource = unsafe {
+            bindings::platform_get_resource_byname(
+                self.as_raw(),
+                bindings::IORESOURCE_MEM,
+                name.as_char_ptr(),
+            )
+        };
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        (!resource.is_null()).then(|| unsafe { Resource::from_ptr(resource) })
+    }
 }
 
 impl AsRef<device::Device> for Device {
-- 
2.47.1

