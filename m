Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40558244687
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 04:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777870686; cv=none; b=psCgNglK9/EVF7M3pdU56MwWwxUOems7VkiPVcQQAkp/WBYCnNU2BUWYqRws978ffoOqW8AwXpTZFEeMSu+m3mF0QE0Zy9HDmeoR0EUfp3hjPFzKRj5XH27DtyqWp8bRGebuW1BvuYiRia9TQO7f8HPpRnaoYzbXJHSuqJVYfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777870686; c=relaxed/simple;
	bh=PRXAEhg0v3BeQlsKrf8Gyufs2wJcCoRs3w2MjIzAHcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kczz8xLWzm6eSQe/8t8bAOfUSRBTT4cFqJB3I7VKpd2b98obJOED0vGoEOaP+itlT0vJatpnw6LscednU0PEkvEUor3Hqw14N7lnQR/E+im0QSYXIcVzYckLhp6GQfkjHEdvSJOjvE2Umg2o/YZHOPX4Xo+Jhf4aQoJUT1u82AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdmE6ezy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdmE6ezy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba21d32776so3915115ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777870684; x=1778475484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCVSMWc8XZyiIWDdmlHdj6gt0j+W5iLgLMvbf1xdc2c=;
        b=PdmE6ezyuhrelM2wE86/cdPEGVY0m/l9T4TnXZujd4+486TcEFauuJB92VkVIgab0D
         c2xUhXfXA8nW6VQU1jypdn37M0rz1rXcC3OGNnVQcdMa7+Zi+Fp+jifSn34AFyJ60gc7
         TgwDHDUNYnnTssaqge/mYJAXcWxgUgOJBlgRBzim+RIvv+mM8i+acZJ1OKgVrsZ3VJpb
         EUwUCgD30SFFif8hblxLQeW4u9H+B9va4ItIAUTZhPLAn+AhI6RB5QrFnBjP+N7Ecn8V
         qa2nUWM3x9UYgDBNbnGa95oIKAfTNEqogCBhzgBrNI9VqPUhPU0ygVVCwsN5dXbgra2g
         unTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777870684; x=1778475484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCVSMWc8XZyiIWDdmlHdj6gt0j+W5iLgLMvbf1xdc2c=;
        b=IqHv7wjIQm/xDn9b9fAJDqjGg120Td/rza9e3kqg3cDXGd9QzAAZDaOu0u3ONvU3zw
         gR6NhRXv9KkOrnGDYTT9ZwYbFGXJss5nmwnF8ZRngO3rNsmCkCtTt91ONk6LPRlVqmUE
         DEdj8IapqqA+ILMfIkEu+zacmlyrI+5d4/4kevv9/PAFLCtvkBk+B5JVlHzXpJKaH/g4
         zyHYdLXDXBoK8/NOfL/1xZ4U+VYt/d5G+Oe7VzaRCr//ferGWYpQbjjkv1vIf1t2WmZQ
         BtMH1RYb2S4EivGsL9XSoBQQuJ+DOvFRo1x1+Lt3LgELYCGAfhHvhJvbKWRmXrL8Gi+/
         tHNg==
X-Forwarded-Encrypted: i=1; AFNElJ9BB7QyLAW35y1w+ggIPumsQI7v8ep1kkY2zreHWHMbaND4QhwRI8rCW+SXnM9X4HDD+e2crhLw6Ip88kbaWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjhjvfEmpoRw1So4GbAJaFOcnOH4jQRyBmi4ptMM5xzVVm1nG
	psdjQDrsXGVwE0gKJ0IaK65tr1AkgliB6bbLMH8xhxQdkPvFLu2Soaio
X-Gm-Gg: AeBDievzokPoCxlWF2otBpJHji6BDryV6l8eB48KHaozlvvOAsJUzo4UauL4B7M7VlW
	YcgRzfNfaf/xaF24SpsZHPY9YYZXm3h/PM0pKnTGfDnlkzQFKjbXMoB7z8NXBIbosQhlHnXai27
	byEHt76OF+5TLM9T5eBr/H9H7Jh3ZMkARERoOV046+0Xc/VQ1WxdkWLEaHHd4O4WvRAlL0VBfS+
	auFtefBFSjyHWk/WB9T4XKctXgIbRUUuPStu1tLMKvCG/WBHMz2nOq8xKNOandq/DM1Of4T3VVe
	Sub5EqplXJKs9bs65TECMA5yb0dVYEVJ4RProZLUXbbXXjdBlfkQwzXDjMrp40193LUig/eNAJI
	ZY+y9Mcxvq/nIdNhfl92ljIeQN9vCa0OD7zzCqZ4H7reWbs3G3C0TB9YFSkJNBNoq7Wk5YAFxVi
	CNQ5pStkZmpv1eou7QtfxWJrIZx22IbJE48QMpAnooJIen04ag8plxBPiopksnFp0E2//f0A==
X-Received: by 2002:a05:6a21:e098:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3a7f1c534aemr7846594637.44.1777870684446;
        Sun, 03 May 2026 21:58:04 -0700 (PDT)
Received: from albab.. ([114.130.187.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835152fec5bsm11697879b3a.0.2026.05.03.21.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:58:03 -0700 (PDT)
From: Albab Hasan <albabhasan276@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Albab Hasan <albabhasan276@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: io: convert `PhysAddr` type alias to newtype
Date: Mon,  4 May 2026 10:57:03 +0600
Message-ID: <20260504045714.59248-1-albabhasan276@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Makes `PhysAddr` a newtype wrapper around `bindings::phys_addr_t`.
This restricts what operations are possible with physical address
values, helping prevent mistakes such as mixing them with other
integer quantities.

Arithmetic operations are intentionally not provided; none of the
current users perform address arithmetic in Rust.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1204
Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
---
 rust/kernel/devres.rs        |  4 +--
 rust/kernel/io.rs            | 52 ++++++++++++++++++++++++++++++++----
 rust/kernel/io/resource.rs   |  6 ++---
 rust/kernel/iommu/pgtable.rs |  2 +-
 4 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 6afe196be42c..0de69157877b 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -72,10 +72,10 @@
 ///     ///
 ///     /// [`paddr`, `paddr` + `SIZE`) must be a valid MMIO region that is mappable into the CPUs
 ///     /// virtual address space.
-///     unsafe fn new(paddr: usize) -> Result<Self>{
+///     unsafe fn new(paddr: PhysAddr) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
+///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index e5fba6bf6db0..7c35537edf43 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -4,6 +4,8 @@
 //!
 //! C header: [`include/asm-generic/io.h`](srctree/include/asm-generic/io.h)
 
+use core::num::TryFromIntError;
+
 use crate::{
     bindings,
     prelude::*, //
@@ -17,9 +19,48 @@
 
 /// Physical address type.
 ///
-/// This is a type alias to either `u32` or `u64` depending on the config option
+/// This is a transparent wrapper around either `u32` or `u64` depending on the config option
 /// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
-pub type PhysAddr = bindings::phys_addr_t;
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{bindings, io::PhysAddr};
+///
+/// let raw: bindings::phys_addr_t = 0x1000;
+/// let paddr = PhysAddr::from(raw);
+/// let raw2: bindings::phys_addr_t = paddr.into();
+/// assert_eq!(raw, raw2);
+///
+/// let size = usize::try_from(paddr).unwrap();
+/// assert_eq!(size, 0x1000);
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Default)]
+pub struct PhysAddr(bindings::phys_addr_t);
+
+impl From<bindings::phys_addr_t> for PhysAddr {
+    #[inline]
+    fn from(value: bindings::phys_addr_t) -> Self {
+        Self(value)
+    }
+}
+
+impl From<PhysAddr> for bindings::phys_addr_t {
+    #[inline]
+    fn from(value: PhysAddr) -> Self {
+        value.0
+    }
+}
+
+impl TryFrom<PhysAddr> for usize {
+    type Error = TryFromIntError;
+
+    #[inline]
+    fn try_from(value: PhysAddr) -> Result<Self, Self::Error> {
+        usize::try_from(value.0)
+    }
+}
 
 /// Resource Size type.
 ///
@@ -97,10 +138,10 @@ pub fn maxsize(&self) -> usize {
 ///     ///
 ///     /// [`paddr`, `paddr` + `SIZE`) must be a valid MMIO region that is mappable into the CPUs
 ///     /// virtual address space.
-///     unsafe fn new(paddr: usize) -> Result<Self>{
+///     unsafe fn new(paddr: PhysAddr) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
+///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
@@ -127,7 +168,8 @@ pub fn maxsize(&self) -> usize {
 ///
 ///# fn no_run() -> Result<(), Error> {
 /// // SAFETY: Invalid usage for example purposes.
-/// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
+/// let addr = PhysAddr::from(0xBAAAAAAD as bindings::phys_addr_t);
+/// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(addr)? };
 /// iomem.write32(0x42, 0x0);
 /// assert!(iomem.try_write32(0x42, 0x0).is_ok());
 /// assert!(iomem.try_write32(0x42, 0x4).is_err());
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index b7ac9faf141d..d703c7317980 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -58,7 +58,7 @@ fn drop(&mut self) {
         };
 
         // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        unsafe { release_fn(start.into(), size) };
     }
 }
 
@@ -113,7 +113,7 @@ pub fn request_region(
         let region = unsafe {
             bindings::__request_region(
                 self.0.get(),
-                start,
+                start.into(),
                 size,
                 name.as_char_ptr(),
                 flags.0 as c_int,
@@ -137,7 +137,7 @@ pub fn size(&self) -> ResourceSize {
     pub fn start(&self) -> PhysAddr {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
-        unsafe { (*inner).start }
+        unsafe { (*inner).start }.into()
     }
 
     /// Returns the name of the resource.
diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index c88e38fd938a..1d75c09c47bb 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -182,7 +182,7 @@ pub unsafe fn map_pages(
             (map_pages)(
                 self.raw_ops(),
                 iova,
-                paddr,
+                paddr.into(),
                 pgsize,
                 pgcount,
                 prot as i32,
-- 
2.43.0

