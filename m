Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10CD1D174E
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803664; cv=none; b=P6ZoqR9oVRJXHjVHgBUwQXiidh/imNtwfAPe2Qq/CiJvIa504Xng22zPT0BXY1LxBQxvZoIVznm74BdRlSqyYPJGF9pD+KcH+X3xYt1j0FI7BM/J2ttE/vGZbt7DjtXTl3LSXVqSpfnL+X5IO9/RH7Xr7AJmXE6Lj8v5g9CtAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803664; c=relaxed/simple;
	bh=R2BNast9S+uzShXAaMlbfRx2hOWG5iWeOEgjA1mIXtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMBCtqE8eL8mVrFM10cX+OgRvHa6ucX05QvmFJUOK7gLRjNcXHjpgtg44gHhBaN+nqceQD/1SIFf+l5EsROnS9HygBMNW6k3SlcnpegvDiW4CnJchNmB1BMV92CPbN3dL0+X73Ur1uGROodIyRNvjzlk5h2xQwYJpUVBkEfogZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zg++3uRo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg++3uRo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f84907caso5744271e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730803661; x=1731408461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us1MQ3VFdk6HacMvC0Go6gqCprtYZ8gBw2TmXjsQOqo=;
        b=Zg++3uRoddDUlNSIRRM09tXKKgH/wEclLLwxBhhoNA2URwXvrfXjMG1338vQXVwJHf
         MJ/1YAR63Bd/q5pA/zfFkgbbAgSlHK/IN2YiIL+Nuz8S8H0ZJ7mZo78JC/oErJTvjM0o
         1sM8KpsyjcuovwAQkGy5tamCz5u2RSEQ2s0ANEhk3UV3hjbn/TfyoKemznm4RW0SG7CS
         lGQnw5kgcAI5BuK/9J8Q7fifbQ1+eRkfSizAP25xu/a4mJ+WAqslAMJk9qjMZJ4gXjZn
         NzvHK4ZR/05ZbcVrlJVEwxnhP7ofjTOjl6uD777b8FiSCtKj5RFqMfkeZ5ErjOH6cmkE
         XqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803661; x=1731408461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Us1MQ3VFdk6HacMvC0Go6gqCprtYZ8gBw2TmXjsQOqo=;
        b=lkNveSVucy/nR2cZomCure4uNUV+lQmbN/Ij2tlSLDEMivxe5cPJkQ80mNtNPof4NA
         0F3JoulCNne2FOENWZAO5gcEOJMeDlKYJd8IIualqdYGhX4QKXEGKE2zRLfXxyKkGgFY
         oERnrcc2vbFBo47Ctz3lJyimiD89EzHkDjxcblCkz3mTc41huIzrrxfQQOZTUQeLVPuQ
         qmLJKsU6jmaog8LxoWHESKQdP7ym2KdRE50db+OfmtcJKPVYNz2E3Yf2ogyxn3nmErYI
         DBtUPqF/ZvflkRaPrd6Ye7I3RXfEZrNVo7zo4lri6A+89x0jb3RjToTyrMTsPzvZ5wZ4
         jaDA==
X-Gm-Message-State: AOJu0YwZ6LmPhY8x+RMuV9f3UuF5aQI0phpIGagO5BQQ9Zkq+Y/hz53z
	Po6WI6Gl6zpAFXec90K8rIuTCeD9wzXC+9C59gl3uvZMaEBuqCF1Qt3n6A==
X-Google-Smtp-Source: AGHT+IEcDZfanIx/aIZn1jZU/fgKlgNLNbAqpK0EP5KevGhUMv8gktXPVobcPudsOS8WokgXYVgrXg==
X-Received: by 2002:a05:6512:1392:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-53b34c5f886mr17590298e87.38.1730803660755;
        Tue, 05 Nov 2024 02:47:40 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9620bsm2082686e87.37.2024.11.05.02.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:47:39 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	daniel.almeida@collabora.com,
	a.hindborg@kernel.org,
	dakr@redhat.com,
	airlied@redhat.com,
	miguel.ojeda.sandonis@gmail.com,
	wedsonaf@gmail.com,
	a.hindborg@samsung.com,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
Date: Tue,  5 Nov 2024 12:46:57 +0200
Message-ID: <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple dma coherent allocator rust abstraction. Based on
Andreas Hindborg's dma abstractions from the rnvme driver.

Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dma.rs              | 169 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 3 files changed, 171 insertions(+)
 create mode 100644 rust/kernel/dma.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a80783fcbe04..3ff2abbfaef6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/firmware.h>
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
new file mode 100644
index 000000000000..3311fc99e5df
--- /dev/null
+++ b/rust/kernel/dma.rs
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Direct memory access (DMA).
+//!
+//! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::code::*,
+    error::Result,
+    types::ARef,
+    transmute::{AsBytes, FromBytes},
+};
+
+/// Abstraction of dma_alloc_coherent
+///
+/// # Invariants
+///
+/// For the lifetime of an instance of CoherentAllocation, the cpu address is a valid pointer
+/// to an allocated region of consistent memory and we hold a reference to the device.
+pub struct CoherentAllocation<T: AsBytes + FromBytes> {
+    dev: ARef<Device>,
+    dma_handle: bindings::dma_addr_t,
+    count: usize,
+    cpu_addr: *mut T,
+}
+
+impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
+    /// Allocates a region of `size_of::<T> * count` of consistent memory.
+    ///
+    /// Returns a CoherentAllocation object which contains a pointer to the allocated region
+    /// (in the processor's virtual address space) and the device address which can be
+    /// given to the device as the DMA address base of the region. The region is released once
+    /// [`CoherentAllocation`] is dropped.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::device::Device;
+    /// use kernel::dma::CoherentAllocation;
+    ///
+    /// # fn dox(dev: &Device) -> Result<()> {
+    /// let c: CoherentAllocation<u64> = CoherentAllocation::alloc_coherent(dev, 4, GFP_KERNEL)?;
+    /// # Ok(()) }
+    /// ```
+    pub fn alloc_coherent(
+        dev: &Device,
+        count: usize,
+        flags: kernel::alloc::Flags,
+    ) -> Result<CoherentAllocation<T>> {
+        let t_size = core::mem::size_of::<T>();
+        if t_size == 0 {
+            return Err(EINVAL)
+        }
+
+        let size = count.checked_mul(t_size).ok_or(EOVERFLOW)?;
+        let mut dma_handle = 0;
+        // SAFETY: device pointer is guaranteed as valid by invariant on `Device`.
+        // We ensure that we catch the failure on this function and throw an ENOMEM
+        let ret = unsafe {
+            bindings::dma_alloc_attrs(
+                dev.as_raw(),
+                size,
+                &mut dma_handle, flags.as_raw(),
+                0,
+            )
+        };
+        if ret.is_null() {
+            return Err(ENOMEM)
+        }
+
+        Ok(Self {
+            dev: dev.into(),
+            dma_handle,
+            count,
+            cpu_addr: ret as _,
+        })
+    }
+
+    /// Reads a value on a location specified by index.
+    pub fn read(&self, index: usize) -> Result<T>
+    where
+        T: Copy
+    {
+        if let Some(val) = self.cpu_buf().get(index) {
+            Ok(*val)
+        } else {
+            Err(EINVAL)
+        }
+    }
+
+    /// Write a value on the memory location specified by index.
+    pub fn write(&mut self, index: usize, value: &T) -> Result
+    where
+        T: Copy,
+    {
+        if let Some(elem) = self.cpu_buf_mut().get_mut(index) {
+            *elem = *value;
+            Ok(())
+        } else {
+            Err(EINVAL)
+        }
+    }
+
+    /// Performs a read and then a write of a value on a location specified by index.
+    pub fn read_write(&mut self, index: usize, value: &T) -> Result<T>
+    where
+        T: Copy,
+    {
+        if let Some(elem) = self.cpu_buf_mut().get_mut(index) {
+            let val = *elem;
+            *elem = *value;
+            Ok(val)
+        } else {
+            Err(EINVAL)
+        }
+    }
+
+    /// Returns the base address to the allocated region and the dma handle.
+    /// Caller takes ownership of returned resources.
+    pub fn into_parts(self) -> (usize, bindings::dma_addr_t) {
+        let ret = (self.cpu_addr as _, self.dma_handle);
+        core::mem::forget(self);
+        ret
+    }
+
+    /// Returns the base address to the allocated region in the CPU's virtual address space.
+    pub fn start_ptr(&self) -> *const T {
+        self.cpu_addr as _
+    }
+
+    /// Returns the base address to the allocated region in the CPU's virtual address space as
+    /// a mutable pointer.
+    pub fn start_ptr_mut(&mut self) -> *mut T {
+        self.cpu_addr
+    }
+
+    /// Returns a DMA handle which may given to the device as the DMA address base of
+    /// the region.
+    pub fn dma_handle(&self) -> bindings::dma_addr_t {
+        self.dma_handle
+    }
+
+    fn cpu_buf(&self) -> &[T]
+    {
+        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation` and
+        // is valid for reads for `self.count * size_of::<T>` bytes.
+        unsafe { core::slice::from_raw_parts(self.cpu_addr, self.count) }
+    }
+
+    fn cpu_buf_mut(&mut self) -> &mut [T]
+    {
+        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation` and
+        // is valid for reads for `self.count * size_of::<T>` bytes.
+        unsafe { core::slice::from_raw_parts_mut(self.cpu_addr, self.count) }
+    }
+}
+
+impl<T: AsBytes + FromBytes> Drop for CoherentAllocation<T> {
+    fn drop(&mut self) {
+        let size = self.count * core::mem::size_of::<T>();
+        // SAFETY: the device, cpu address, and the dma handle is valid due to the
+        // type invariants on `CoherentAllocation`.
+        unsafe { bindings::dma_free_attrs(self.dev.as_raw(), size,
+                                          self.cpu_addr as _,
+                                          self.dma_handle, 0) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b62451f64f6e..b713c92eb1ef 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,7 @@
 pub mod block;
 mod build_assert;
 pub mod device;
+pub mod dma;
 pub mod error;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
-- 
2.43.0

