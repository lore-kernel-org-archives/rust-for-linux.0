Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F71DBB3A;
	Thu, 16 Jan 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032732; cv=pass; b=KCjO1RvyxR2NCQANEDL6sYE525KV8prTAIIQp83he9D75mv/AKclDczQDZhrwF7W6Ds34aUyi0HY4Km6MWjC5vqWZGeAiiICWecIzB7ODMZ+njdhB7UyG/AWMN506z/GAga/N2RJervG2/GpWrp3OQLIwM/dUKJV4GP1nzBlAeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032732; c=relaxed/simple;
	bh=wVsYSFfTcq4Qyi8hxT3KVJPP/YjMXtye28uMP3CXwbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ik87epVCJ3fXDwXQzoZ9yPi7IIsTV0BLZFhGRef4eDC4JBbgS6SsLrKZVxIrFK0840/kHIYuiQkfMqzjc1YAymLyZSkn31EPv2vTFBHEeACjfUy87gy6BqYMFHVoqnAYEgIiA3uAh+HeWBRD/65ZisgfOGHrat0+XhL13JibRfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=F1vygAB2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="F1vygAB2"
ARC-Seal: i=1; a=rsa-sha256; t=1737032715; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aZZIBOvnde6HoJEawyZAaZ0F7UUQY3WmIYfczA5wA2YjlHut2nT7U3vTWtYgktyz6dnNBIuSIbRFKhjGf5b8yUIBc0qqbl2K/qqRFo09RUzeTcmRgy0OCyViE7P5L7+gZWjQN2UlRkCx8m4N77S2d4yDnke+QU5TGK/mWEA96sU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737032715; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gLNt5hpMp+JnNu9GS+NNBAUe84OPwFhj4SDFgzDn6+A=; 
	b=WX0Z7PsMsPqtP0G/2i5LYwidgfUpPl4XLLgNCBO4DpEF/+AfAy5poC77QCVCfGItvwfA+ZgZFF4ov8NrZ1Z0OWLr/REkf3dr2w3DpuVTPx/VbHSYoLJIFeDdoe9EVa0Xb9VChGgO3fhAaZXa7OiM78fMcjYVdFrCS4YMAp6pWas=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737032715;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gLNt5hpMp+JnNu9GS+NNBAUe84OPwFhj4SDFgzDn6+A=;
	b=F1vygAB2FgR109i2zfiTbO9Qj3PUjGVbyfT4nNkRnWXVIIKu9ouQlw6F7rZvKUVj
	nVFqvsKpDU8sLePkJM57EtKlvRXstoVxFfjdpFTitsCwfXNTXFJrItJh+yfdqOwDuTb
	w2h4PvEOyO0zojA0M5MkYfLw8JvDeTc2ujPcAE3w=
Received: by mx.zohomail.com with SMTPS id 1737032713507931.9572553428109;
	Thu, 16 Jan 2025 05:05:13 -0800 (PST)
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
Subject: [PATCH RESEND v5 2/3] rust: io: mem: add a generic iomem abstraction
Date: Thu, 16 Jan 2025 09:56:25 -0300
Message-ID: <20250116125632.65017-3-daniel.almeida@collabora.com>
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

Add a generic iomem abstraction to safely read and write ioremapped
regions.

The reads and writes are done through IoRaw, and are thus checked either
at compile-time, if the size of the region is known at that point, or at
runtime otherwise.

Non-exclusive access to the underlying memory region is made possible to
cater to cases where overlapped regions are unavoidable.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/io.c     | 10 +++++
 rust/kernel/io.rs     |  1 +
 rust/kernel/io/mem.rs | 98 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 rust/kernel/io/mem.rs

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 3cb47bd01942..cb10060c08ae 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -106,3 +106,13 @@ resource_size_t rust_helper_resource_size(struct resource *res)
 	return resource_size(res);
 }
 
+struct resource *rust_helper_request_mem_region(resource_size_t start, resource_size_t n,
+				    const char *name)
+{
+	return request_mem_region(start, n, name);
+}
+
+void rust_helper_release_mem_region(resource_size_t start, resource_size_t n)
+{
+	release_mem_region(start, n);
+}
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 566d8b177e01..9ce3482b5ecd 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,7 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+pub mod mem;
 pub mod resource;
 
 /// Raw representation of an MMIO region.
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
new file mode 100644
index 000000000000..a287dc0898e0
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic memory-mapped IO.
+
+use core::ops::Deref;
+
+use crate::device::Device;
+use crate::devres::Devres;
+use crate::io::resource::Resource;
+use crate::io::Io;
+use crate::io::IoRaw;
+use crate::prelude::*;
+
+/// A generic memory-mapped IO region.
+///
+/// Accesses to the underlying region is checked either at compile time, if the
+/// region's size is known at that point, or at runtime otherwise.
+///
+/// Whether `IoMem` represents an exclusive access to the underlying memory
+/// region is determined by the caller at creation time, as overlapping access
+/// may be needed in some cases.
+///
+/// # Invariants
+///
+/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
+/// start of the I/O memory mapped region.
+pub struct IoMem<const SIZE: usize = 0, const EXCLUSIVE: bool = true> {
+    io: IoRaw<SIZE>,
+    res_start: u64,
+}
+
+impl<const SIZE: usize, const EXCLUSIVE: bool> IoMem<SIZE, EXCLUSIVE> {
+    /// Creates a new `IoMem` instance.
+    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
+        let size = resource.size();
+        if size == 0 {
+            return Err(EINVAL);
+        }
+
+        let res_start = resource.start();
+
+        if EXCLUSIVE {
+            // SAFETY:
+            // - `res_start` and `size` are read from a presumably valid `struct resource`.
+            // - `size` is known not to be zero at this point.
+            // - `resource.name()` returns a valid C string.
+            let mem_region = unsafe {
+                bindings::request_mem_region(res_start, size, resource.name().as_char_ptr())
+            };
+
+            if mem_region.is_null() {
+                return Err(EBUSY);
+            }
+        }
+
+        // SAFETY:
+        // - `res_start` and `size` are read from a presumably valid `struct resource`.
+        // - `size` is known not to be zero at this point.
+        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };
+        if addr.is_null() {
+            if EXCLUSIVE {
+                // SAFETY:
+                // - `res_start` and `size` are read from a presumably valid `struct resource`.
+                // - `size` is the same as the one passed to `request_mem_region`.
+                unsafe { bindings::release_mem_region(res_start, size) };
+            }
+            return Err(ENOMEM);
+        }
+
+        let io = IoRaw::new(addr as usize, size as usize)?;
+        let io = IoMem { io, res_start };
+        let devres = Devres::new(device, io, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
+}
+
+impl<const SIZE: usize, const EXCLUSIVE: bool> Drop for IoMem<SIZE, EXCLUSIVE> {
+    fn drop(&mut self) {
+        if EXCLUSIVE {
+            // SAFETY: `res_start` and `io.maxsize()` were the values passed to
+            // `request_mem_region`.
+            unsafe { bindings::release_mem_region(self.res_start, self.io.maxsize() as u64) }
+        }
+
+        // SAFETY: Safe as by the invariant of `Io`.
+        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
+    }
+}
+
+impl<const SIZE: usize, const EXCLUSIVE: bool> Deref for IoMem<SIZE, EXCLUSIVE> {
+    type Target = Io<SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Safe as by the invariant of `IoMem`.
+        unsafe { Io::from_raw(&self.io) }
+    }
+}
-- 
2.48.0

