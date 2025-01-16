Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9D1DE8BA;
	Thu, 16 Jan 2025 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032736; cv=pass; b=V7/p1W8p/JVIQ6nuaKI1L1qzcIdaZpV1vH9kzmH9v9aIs//Z9OjlZ81MYbNUOUmxkxO7t/K7B40viFc/bXyluGnz+Vnyj0XEI5KBBVHlu9K+fbg+jYERHt+miXCeosg4lLMwJBcSb/1M44pizfQhBl5o01E9Nkgw3ELIqIZ0a+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032736; c=relaxed/simple;
	bh=E6UU7+rKtRQHDVd+PY4Y9zBTkdz0wuYUfb1LjfbbZjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eI18GxZgGL+eho/4R2lPD6w+pCP/0Q0f2Dq/YSeiFRn8OVHiiXm7+cwz98mJW4up6Ter1k3UAlrbhk9p/ikPPXPh1wXwSXHHtTIhTetz/d9u8fd1TK8aclHe3GuG/MckRua0CDyoZ95y1ltcFpsvOcHhGG1XJBMjhXeFSAzIiKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CcZsQcUB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CcZsQcUB"
ARC-Seal: i=1; a=rsa-sha256; t=1737032719; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M15DH3R4vavAJfcXEwgrPADqAi0LYolpoSkEUWM3yPwuRJwJ4YuRiVQPizhhTppN/5lPaGYOf6HGPerF6uJLBZtKaSc6vr1PlywzhDYvySDTBGKCX05157Qg769W0wYAaOmACySYqGMCAV9KCq61zfR0jUKzDfOltl5CwkvDfJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737032719; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ic+oqGqc/mAL/ksa+/gIMfrYC8TNVWq2OPJ1ekYeafI=; 
	b=RvT+SWQtE2O5eMEy16OMipAl8eigW0GZlgTV7myTdp191OlEbx6g2gAmi6IO1ddCEbTimUVCESUqAur50LerXmblrLrTjzSYTmn0p2IpkhW0BfQWN+WALnW9EPn4GYqFTdngIiwhG70aUhrBXPRaA3z6nhRsRtoqa1h83/DbQGk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737032719;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ic+oqGqc/mAL/ksa+/gIMfrYC8TNVWq2OPJ1ekYeafI=;
	b=CcZsQcUBZ9oMxGIB0s+fIILB7hZCl5GtmHjj5VO5WzYZlBzPrmfBrBvSlUpNqDe2
	vp4MXb1APWxbhYzuDdWpaZWN8/empZI5oTopR1qlub1ecVF/TBSRxK7Z5YFSK1n1qpz
	Uwxx0bHBT3WDtE/7ZC6P+W/su5n3W9upCcjtlNfc=
Received: by mx.zohomail.com with SMTPS id 1737032716833915.5252914519633;
	Thu, 16 Jan 2025 05:05:16 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.mco,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com,
	robh@kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 3/3] rust: platform: allow ioremap of platform resources
Date: Thu, 16 Jan 2025 09:56:26 -0300
Message-ID: <20250116125632.65017-4-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116125632.65017-1-daniel.almeida@collabora.com>
References: <20250116125632.65017-1-daniel.almeida@collabora.com>
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
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 105 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 50e6b0421813..55c2e0ffd4d1 100644
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
@@ -191,6 +194,106 @@ fn as_raw(&self) -> *mut bindings::platform_device {
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
+    /// use kernel::{bindings, c_str, platform};
+    ///
+    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
+    ///     // No runtime checks will apply when reading and writing.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource_sized::<42, true>(&resource)?;
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
+    pub fn ioremap_resource_sized<const SIZE: usize, const EXCLUSIVE: bool>(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<IoMem<SIZE, EXCLUSIVE>>> {
+        IoMem::new(resource, self.as_ref())
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
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource::<true>(&resource)?;
+    ///
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_readl(offset)?;
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.try_writel(data, offset)?;
+    ///
+    ///     # Ok::<(), Error>(())
+    /// }
+    /// ```
+    pub fn ioremap_resource<const EXCLUSIVE: bool>(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<IoMem<0, EXCLUSIVE>>> {
+        self.ioremap_resource_sized::<0, EXCLUSIVE>(resource)
+    }
+
+    /// Returns the resource at `index`, if any.
+    pub fn resource(&self, index: u32) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
+        let resource = unsafe {
+            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
+        };
+
+        if resource.is_null() {
+            return None;
+        }
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        Some(unsafe { Resource::from_ptr(resource) })
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
+        if resource.is_null() {
+            return None;
+        }
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        Some(unsafe { Resource::from_ptr(resource) })
+    }
 }
 
 impl AsRef<device::Device> for Device {
-- 
2.48.0

