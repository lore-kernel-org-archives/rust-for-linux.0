Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D4C2594AE;
	Thu,  9 Jan 2025 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429569; cv=pass; b=mvPR6+R0G6EoxLmEfNwJiPSt8/wO9JWWOGxU8JTl/bm/8f7OLwvbUtaAito3fhnxOm4465OSTMj97MVKtuMSn9ZN3CBjgdsURnjUu5ye+cY+5LMjnFi0m6uSBbjzlCwtVyFTYsWd6pW66dtpvJBh5RnZd45Y/50T30CZqb6HdOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429569; c=relaxed/simple;
	bh=c6fwVqXNnrwPUnSEIrYq/sBnDN860M3/UpzdhxBzy2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOQfiqZFctftvKHw0uPJY4bqnboxfbmRpfYJyyfurGbtvUOAyqtMYUHh5BhhEPgQriTm+6AkvHUmtWjQudztrbiqLSwagkom5k2H3KMMwysqvO2+uU78R/RSYYm0ZSqdYXSSe0Eqk3ggF/PETgkLvtIyDWja+Z234HB5aF+6adk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=KRs/G/s8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KRs/G/s8"
ARC-Seal: i=1; a=rsa-sha256; t=1736429549; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bDHRnM6EiIJDIruUnQQ5ddArbzIZC5mUj1jfPjzPEBDhS1YX8lAnsi3JBBxpP/6+AGk0iifgUllVEmoVmFZD2bX777VMGFJH4XagJf8qG1hs2ugg/4ljrijgpYOpDDw4dBNyFIeHOyAkCtf4qCgk9hA58gtv1UYZtM/vSA1xKkY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736429549; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=edI3ctFtW7vOkEP2zTdR6wwIX8yhphvDDcq1lIJICw8=; 
	b=KtV2tDA7wRJs+gxkviItgW1o9Ais0AsB9Zz/FxTlU3zOEgP5JbBCUr2wY5owH0htE/5LSDm7nPpGRvayLSlVs5AzjWCqyy3jh/7WpgjzZ/Ry2umQRdOkYJiyWt/QBIqQvHQpMTnkpN0aIW+LBFXzpfkquqpINxMee0IElTWtlcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736429549;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=edI3ctFtW7vOkEP2zTdR6wwIX8yhphvDDcq1lIJICw8=;
	b=KRs/G/s8/n7r1X1osEBymavh2HZhe6fphIS/SJPFbKDbtaPGA4Fpi59NPlfigY93
	i+HpteONv+aT4Ew7imPBmL98WQ/fHYZzdwnckFGNNGnNCAgZJX9Q+b3aaQHGlGDvzFG
	fNOur8Qs3JOhpyFBCsgOZdpeYpWPPk0WhsCnKLzU=
Received: by mx.zohomail.com with SMTPS id 17364295485461011.6740568975843;
	Thu, 9 Jan 2025 05:32:28 -0800 (PST)
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
Subject: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
Date: Thu,  9 Jan 2025 10:30:54 -0300
Message-ID: <20250109133057.243751-3-daniel.almeida@collabora.com>
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

Add a generic iomem abstraction to safely read and write ioremapped
regions.

The reads and writes are done through IoRaw, and are thus checked either
at compile-time, if the size of the region is known at that point, or at
runtime otherwise.

Non-exclusive access to the underlying memory region is made possible to
cater to cases where overlapped regions are unavoidable.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/io.c     |  10 ++++
 rust/kernel/io.rs     |   1 +
 rust/kernel/io/mem.rs | 108 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
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
index 000000000000..f2147db715bf
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic memory-mapped IO.
+
+use core::ops::Deref;
+
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
+/// start of the I/O memory mapped region and its size.
+pub struct IoMem<const SIZE: usize = 0> {
+    io: IoRaw<SIZE>,
+    res_start: u64,
+    exclusive: bool,
+}
+
+impl<const SIZE: usize> IoMem<SIZE> {
+    /// Creates a new `IoMem` instance.
+    ///
+    /// `exclusive` determines whether the memory region should be exclusively
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the underlying resource remains valid
+    /// throughout the `IoMem`'s lifetime. This is usually done by wrapping the
+    /// `IoMem` in a `Devres` instance, which will properly revoke the access
+    /// when the device is unbound from the matched driver.
+    pub(crate) unsafe fn new(resource: &Resource, exclusive: bool) -> Result<Self> {
+        let size = resource.size();
+        if size == 0 {
+            return Err(ENOMEM);
+        }
+
+        let res_start = resource.start();
+
+        if exclusive {
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
+        let addr = unsafe { bindings::ioremap(res_start, size as usize) };
+        if addr.is_null() {
+            if exclusive {
+                // SAFETY:
+                // - `res_start` and `size` are read from a presumably valid `struct resource`.
+                // - `size` is the same as the one passed to `request_mem_region`.
+                unsafe { bindings::release_mem_region(res_start, size) };
+            }
+            return Err(ENOMEM);
+        }
+
+        let io = IoRaw::new(addr as usize, size as usize)?;
+
+        Ok(IoMem {
+            io,
+            res_start,
+            exclusive,
+        })
+    }
+}
+
+impl<const SIZE: usize> Drop for IoMem<SIZE> {
+    fn drop(&mut self) {
+        if self.exclusive {
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
+impl<const SIZE: usize> Deref for IoMem<SIZE> {
+    type Target = Io<SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Safe as by the invariant of `IoMem`.
+        unsafe { Io::from_raw(&self.io) }
+    }
+}
-- 
2.47.1

