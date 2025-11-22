Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6EE274FC2
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 05:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763790803; cv=none; b=XXThE+sutkHDjyG6qvcmkKN1I91aMOjCInFGfSt2wr/44mMrTII40WYibD2q87Uu2gTcc/uGyj3Br5r2u76Sy+EQxx/uN3+bA0B0aR4E+6+9/GkzDF6CUE1G4oNuvwUS+LrjUYlxehscwmjpaJZ4xMLO1nBmxcFBvUMqzRYyfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763790803; c=relaxed/simple;
	bh=KuoTzXvUiJRo/fUe+eYZLcwzZrM7oWYW51Iq7Li6izg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2+jC/Ji7v9ARSmiiCTG81AzbFuvuwMqPs79jamFrh4r6CltySs4Xe9s58g0l0oMtKHkyo+Cwa5GKST7BYvnDGzFu8RZFc6h8EbOO2i1fJL2GjMV+OPNl5Rad/iB1rtbnD//KcLb4nYAeOoXknFrkgjKY/C/AsnrgRaWjseNuNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqBAD2VO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqBAD2VO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73a9592fb8so580853466b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 21:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763790799; x=1764395599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EI9uG9FTn2LfipbceSxUnzuU7UBICJCAShITNYfKKUg=;
        b=NqBAD2VOAapbJKl6RfsqQNbviwt+0FmCcCIUEDIGpYvI/+y49t56hbAFATxW7APPc1
         qvM4gnMhCQ97BmJoM1wsdZEdPsE7EdHWlSWJ1nu3FTQhNpFmbzYpp1MipLOdv28VedDs
         StNgQKxdZKOkj0ZobPKp2OSqYuYYqkNtdDTclmohm4DGg3PLYMUPpv2X2ncxdOPJwFj8
         pAF8Xl9sIiGTIZig0yLnuaPENu+7HqWI67fFack9FFtN0S549hsJ76i2kGJOZbdkYa/s
         R4dTZ4sZClvivx0vRfWtrR8XyQlGnl+IOXRlmxXrFraaehQF01ulaBUoVM2bfl/6NcDX
         S58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763790799; x=1764395599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI9uG9FTn2LfipbceSxUnzuU7UBICJCAShITNYfKKUg=;
        b=lJWLnTPEQQaKBKDb5HN6UYwD0KsaIHjF42z3zh7gT/hgDb12htvXZdul0EKm2xL1+q
         FZF6DJqOpitdOZcuWsApcvH7QRiKRole2QOyb5uD0llFruSw+UgfdTlDwClhDcbpfrav
         xgK6PWBD3zGoUyfsA0Wyc/GT9K40D8glahaAY9uCcQRgqtvBM4/lLm6mWIQvEpLsfO9w
         EKXxbH8vMPZn3L/ysR20cYoE6xCCv0a6u6v+BSvgKngTr841p+IYPH0ypH9ysnM1vJHQ
         EWtrJ5ubCK1fFO3ftkvj765Vx2QRiYPfvxnplnHhL/tF1HOnnUPuiIaHbUVKhInt8PTR
         b7+w==
X-Gm-Message-State: AOJu0Yzw89bNVn6/RsNuPRwn0gDFW0clqtA7ju/zQXVZlEn3oGWhmx56
	JjyUoH0rmhne5QbaRnnq+00bA3I0s2DAZ7upq7xeVvHHpTzIGHWOIruFBM/yh4SEfgcV4A==
X-Gm-Gg: ASbGncvLTdQejOGF7JWr4O55KZkExUifygeGICbRfzmjxBwnwvanNuHyGfDq8k98PdA
	bF8HzV9KVuddOGVFyeFDzoZ3zlCCyJs88UOICRGPf2EkcP7bNz8MoPo+qbL5OvRgXFOEb+yrf7N
	G47wRcmU3wFf63yMeHglzNjlMhc2kKJLUksEq7cDmS5xMF+bDogVJM7ss2BaLhlkVm7d+OFsqOk
	hfqHqOuHYf5PknTGm+b9NEpQq3O2SWdfWYSGXmLWI/dTqw0e0Ux2H5OIzvOXZO8dvjyov6YX0zO
	t32o2tULaPtNlD9udkwCxz9QfYPgpRyyEa2N64t549IOE1IzVsqrM7XeC2PKHqAqJKyeYYO35vH
	8ETe4UOko+mcuzyOLBge5bsGt1eR3XTCDyXaz8MVCusGj7nR/mXVaDohJvX9vyUhscA==
X-Google-Smtp-Source: AGHT+IGQYRpmOubc+SyTFtb1MHiV2hS06Hah/0FzEK9eHfKGnZ63WsvjYJRi8ZDAkaC56BHw2Cp/Ew==
X-Received: by 2002:a17:906:9fc1:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b765713368fmr1000743766b.4.1763790798933;
        Fri, 21 Nov 2025 21:53:18 -0800 (PST)
Received: from gentb ([2a02:8071:6480:ee20::6780])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d32csm6144231a12.21.2025.11.21.21.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:53:17 -0800 (PST)
From: Gent Binaku <binakugent@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	wedsonaf@gmail.com,
	Gent Binaku <binakugent@gmail.com>
Subject: [PATCH] rust: kernel: Introduce newtype for `PhysAddr`
Date: Sat, 22 Nov 2025 06:52:56 +0100
Message-ID: <20251122055256.264180-1-binakugent@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces a newtype for the `PhysAddr` type alias, replacing
the previous to constrain the operations allowed on physical addresses
and prevent mistakes. This change aligns the usage of `PhysAddr` with the
goals of safety and clarity in the Rust-for-Linux code.

Updates include:
- Definition of the `PhysAddr` newtype in `rust/kernel/phys_addr.rs`
- Adjustments to relevant files (`devres.rs`, `io.rs`, `io/mem.rs`,
  `io/resource.rs`, `lib.rs`) to adopt the newtype.
- Addition of tests and examples to ensure coverage of the newtype and its
  methods.

This work builds upon the discussed patches linked at:
https://lore.kernel.org/rust-for-linux/CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com/

Signed-off-by: Gent Binaku <binakugent@gmail.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1204
Signed-off-by: Gent Binaku <binakugent@gmail.com>
---
 rust/kernel/devres.rs      |   5 +-
 rust/kernel/io.rs          |  11 +-
 rust/kernel/io/mem.rs      |   4 +-
 rust/kernel/io/resource.rs |   8 +-
 rust/kernel/lib.rs         |   1 +
 rust/kernel/phys_addr.rs   | 325 +++++++++++++++++++++++++++++++++++++
 6 files changed, 338 insertions(+), 16 deletions(-)
 create mode 100644 rust/kernel/phys_addr.rs

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index e01e0d36702d..5047db37de19 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -62,8 +62,8 @@ struct Inner<T: Send> {
 ///     io::{
 ///         Io,
 ///         IoRaw,
-///         PhysAddr,
 ///     },
+///     phys_addr::PhysAddr
 /// };
 /// use core::ops::Deref;
 ///
@@ -78,7 +78,8 @@ struct Inner<T: Send> {
 ///     unsafe fn new(paddr: usize) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
+///         let physAddr = PhysAddr::from_raw(paddr as bindings::phys_addr_t);
+///         let addr = unsafe { bindings::ioremap( physAddr.as_raw(), SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 56a435eb14e3..3ff19c5aa62e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -13,12 +13,6 @@
 
 pub use resource::Resource;
 
-/// Physical address type.
-///
-/// This is a type alias to either `u32` or `u64` depending on the config option
-/// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
-pub type PhysAddr = bindings::phys_addr_t;
-
 /// Resource Size type.
 ///
 /// This is a type alias to either `u32` or `u64` depending on the config option
@@ -80,8 +74,8 @@ pub fn maxsize(&self) -> usize {
 ///     io::{
 ///         Io,
 ///         IoRaw,
-///         PhysAddr,
 ///     },
+///     phys_addr::PhysAddr
 /// };
 /// use core::ops::Deref;
 ///
@@ -96,7 +90,8 @@ pub fn maxsize(&self) -> usize {
 ///     unsafe fn new(paddr: usize) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
+///         let physAddr = PhysAddr::from_raw(paddr as bindings::phys_addr_t);
+///         let addr = unsafe { bindings::ioremap( physAddr.as_raw(), SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 6f99510bfc3a..8bce3fdfde9f 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -235,12 +235,12 @@ fn ioremap(resource: &Resource) -> Result<Self> {
             // SAFETY:
             // - `res_start` and `size` are read from a presumably valid `struct resource`.
             // - `size` is known not to be zero at this point.
-            unsafe { bindings::ioremap_np(res_start, size) }
+            unsafe { bindings::ioremap_np(res_start.into(), size) }
         } else {
             // SAFETY:
             // - `res_start` and `size` are read from a presumably valid `struct resource`.
             // - `size` is known not to be zero at this point.
-            unsafe { bindings::ioremap(res_start, size) }
+            unsafe { bindings::ioremap(res_start.into(), size) }
         };
 
         if addr.is_null() {
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 0e86ee9c98d8..1e358fb1c712 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -8,12 +8,12 @@
 use core::ops::Deref;
 use core::ptr::NonNull;
 
+use crate::phys_addr::PhysAddr;
 use crate::prelude::*;
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
 
 pub use super::{
-    PhysAddr,
     ResourceSize, //
 };
 
@@ -54,7 +54,7 @@ fn drop(&mut self) {
         };
 
         // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        unsafe { release_fn(start.into(), size) };
     }
 }
 
@@ -109,7 +109,7 @@ pub fn request_region(
         let region = unsafe {
             bindings::__request_region(
                 self.0.get(),
-                start,
+                start.into(),
                 size,
                 name.as_char_ptr(),
                 flags.0 as c_int,
@@ -133,7 +133,7 @@ pub fn size(&self) -> ResourceSize {
     pub fn start(&self) -> PhysAddr {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
-        unsafe { (*inner).start }
+        unsafe { PhysAddr::from((*inner).start) }
     }
 
     /// Returns the name of the resource.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 235d0d8b1eff..81293b7b80c4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -116,6 +116,7 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+pub mod phys_addr;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git a/rust/kernel/phys_addr.rs b/rust/kernel/phys_addr.rs
new file mode 100644
index 000000000000..41b635e5d44e
--- /dev/null
+++ b/rust/kernel/phys_addr.rs
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+//! A newtype for physical addresses.
+//!
+//! This module provides `PhysAddr`, a type-safe wrapper around the kernel's
+//! `phys_addr_t`. Using a newtype prevents accidentally mixing physical
+//! addresses with virtual addresses or other integer types, which is a common
+//! source of bugs.
+//!
+//! The API prioritizes explicitness and safety. Conversions to and from the
+//! raw integer type must be done via `from_raw()` and `as_raw()`. Arithmetic
+//! is provided through both explicit methods (`checked_add`, `wrapping_add`)
+//! and ergonomic operators (`+`, `-`) that have well-defined wrapping behavior.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::bindings;
+//! use kernel::phys_addr::{PhysAddr};
+//!
+//!
+//! let addr = PhysAddr::from_raw(0x1008 as bindings::phys_addr_t);
+//!
+//! // The `+` operator uses wrapping arithmetic.
+//! assert_eq!(addr + 8, PhysAddr::from_raw(0x1010 as bindings::phys_addr_t));
+//!
+//! // For safety, checked arithmetic is also available.
+//! let new_addr = addr.checked_add(8).expect("Overflow occurred");
+//! assert_eq!(new_addr.as_raw(), 0x1010);
+//!
+//! // Alignment is a common task.
+//! let aligned_addr = addr.align_down(8);
+//! assert_eq!(aligned_addr.as_raw(), 0x1008);
+//! ```
+use crate::bindings;
+use core::{
+    fmt,
+    ops::{Add, Sub},
+};
+use macros::kunit_tests;
+
+/// A newtype wrapper for a physical address.
+///
+/// Its size is guaranteed to match the C kernel's `phys_addr_t` by wrapping
+/// the generated binding. `#[repr(transparent)]` ensures it has an identical
+/// memory layout, making it safe to use across FFI boundaries.
+#[repr(transparent)]
+#[derive(Copy, Clone, Default, PartialEq, Eq, PartialOrd, Ord, Hash)]
+pub struct PhysAddr(bindings::phys_addr_t);
+
+impl PhysAddr {
+    /// The zero physical address. Equivalent to `PhysAddr::default()`.
+    pub const ZERO: Self = Self(0);
+
+    /// Creates a `PhysAddr` from a raw `phys_addr_t` value.
+    pub fn from_raw(addr: bindings::phys_addr_t) -> Self {
+        Self(addr)
+    }
+
+    /// Returns the raw `phys_addr_t` value of the physical address.
+    pub fn as_raw(self) -> bindings::phys_addr_t {
+        self.0
+    }
+
+    /// Returns `true` if the physical address is null (zero).
+    pub fn is_null(self) -> bool {
+        self.0 == 0
+    }
+
+    /// Checked addition. Returns `None` if overflow occurs.
+    pub fn checked_add(self, rhs: bindings::phys_addr_t) -> Option<Self> {
+        self.0.checked_add(rhs).map(Self)
+    }
+
+    /// Checked subtraction. Returns `None` if overflow occurs.
+    pub fn checked_sub(self, rhs: bindings::phys_addr_t) -> Option<Self> {
+        self.0.checked_sub(rhs).map(Self)
+    }
+
+    /// Saturating addition. Caps at `phys_addr_t::MAX` on overflow.
+    pub fn saturating_add(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.saturating_add(rhs))
+    }
+
+    /// Saturating subtraction. Caps at 0 on underflow.
+    pub fn saturating_sub(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.saturating_sub(rhs))
+    }
+
+    /// Wrapping addition.
+    pub fn wrapping_add(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_add(rhs))
+    }
+
+    /// Wrapping subtraction.
+    pub fn wrapping_sub(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_sub(rhs))
+    }
+
+    /// Wrapping multiplication.
+    pub fn wrapping_mul(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_mul(rhs))
+    }
+
+    /// Aligns the address down to the nearest multiple of `align`.
+    ///
+    /// `align` must be a power of two.
+    pub const fn align_down(self, align: bindings::phys_addr_t) -> Self {
+        Self(self.0 & !(align.wrapping_sub(1)))
+    }
+
+    /// Aligns the address up to the nearest multiple of `align`.
+    ///
+    /// `align` must be a power of two.
+    pub const fn align_up(self, align: bindings::phys_addr_t) -> Self {
+        self.add_const(align.wrapping_sub(1)).align_down(align)
+    }
+
+    const fn add_const(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_add(rhs))
+    }
+}
+
+impl From<bindings::phys_addr_t> for PhysAddr {
+    fn from(addr: bindings::phys_addr_t) -> Self {
+        Self::from_raw(addr)
+    }
+}
+
+impl From<PhysAddr> for bindings::phys_addr_t {
+    fn from(addr: PhysAddr) -> bindings::phys_addr_t {
+        addr.as_raw()
+    }
+}
+
+impl Add<bindings::phys_addr_t> for PhysAddr {
+    type Output = Self;
+
+    /// Adds with wrapping on overflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_add`] or [`saturating_add`].
+    fn add(self, rhs: bindings::phys_addr_t) -> Self::Output {
+        self.wrapping_add(rhs)
+    }
+}
+
+impl Sub<bindings::phys_addr_t> for PhysAddr {
+    type Output = Self;
+
+    /// Subtracts with wrapping on underflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_sub`] or [`saturating_sub`].
+    fn sub(self, rhs: bindings::phys_addr_t) -> Self::Output {
+        self.wrapping_sub(rhs)
+    }
+}
+
+// Find the offset between two addresses.
+impl Sub<PhysAddr> for PhysAddr {
+    type Output = bindings::phys_addr_t;
+
+    /// Calculates the offset from `rhs` to `self`.
+    ///
+    /// Performs saturating subtraction. If `rhs` is greater than `self`,
+    /// the result will be 0.
+    fn sub(self, rhs: PhysAddr) -> Self::Output {
+        self.0.saturating_sub(rhs.0)
+    }
+}
+
+// Implement standard formatting traits for addresses.
+impl fmt::Debug for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use a more descriptive debug output.
+        f.debug_tuple("PhysAddr")
+            .field(&format_args!("0x{:x}", self.0))
+            .finish()
+    }
+}
+
+impl fmt::Display for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "0x{:x}", self.0)
+    }
+}
+
+impl fmt::LowerHex for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.0.fmt(f)
+    }
+}
+
+impl fmt::UpperHex for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.0.fmt(f)
+    }
+}
+
+impl fmt::Octal for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:o}", self.0)
+    }
+}
+
+impl fmt::Binary for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:b}", self.0)
+    }
+}
+
+impl fmt::Pointer for PhysAddr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "0x{:x}", self.0)
+    }
+}
+
+// --- KUnit Test Suite ---
+#[kunit_tests(kernel_physadrmod)]
+mod tests {
+    use super::*;
+    use crate::bindings::phys_addr_t;
+
+    #[test]
+    fn test_creation_and_conversion() {
+        let addr = PhysAddr::from_raw(0x1000);
+        assert_eq!(addr.as_raw(), 0x1000);
+
+        let default_addr = PhysAddr::default();
+        assert_eq!(default_addr.as_raw(), 0);
+        assert_eq!(default_addr, PhysAddr::ZERO);
+
+        ()
+    }
+
+    #[test]
+    fn test_is_null() {
+        assert!(PhysAddr::ZERO.is_null());
+        assert!(PhysAddr::from_raw(0).is_null());
+        assert!(!PhysAddr::from_raw(1).is_null());
+        ()
+    }
+
+    #[test]
+    fn test_arithmetic() {
+        let addr = PhysAddr::from_raw(0x1000);
+
+        // Checked addition
+        assert_eq!(addr.checked_add(0x10), Some(PhysAddr::from_raw(0x1010)));
+        let max_addr = PhysAddr::from_raw(phys_addr_t::MAX);
+        assert_eq!(max_addr.checked_add(1), None);
+
+        // Wrapping addition
+        assert_eq!(addr.wrapping_add(0x10), PhysAddr::from_raw(0x1010));
+        assert_eq!(max_addr.wrapping_add(1), PhysAddr::from_raw(0));
+        assert_eq!(max_addr + 2, PhysAddr::from_raw(1));
+
+        // Wrapping subtraction
+        assert_eq!(addr.wrapping_sub(0x10), PhysAddr::from_raw(0x0ff0));
+        let zero_addr = PhysAddr::from_raw(0);
+        assert_eq!(
+            zero_addr.wrapping_sub(1),
+            PhysAddr::from_raw(phys_addr_t::MAX)
+        );
+        assert_eq!(zero_addr - 2, PhysAddr::from_raw(phys_addr_t::MAX - 1));
+
+        ()
+    }
+
+    #[test]
+    fn test_address_difference() {
+        let addr1 = PhysAddr::from_raw(0x1000);
+        let addr2 = PhysAddr::from_raw(0x2000);
+
+        assert_eq!(addr2 - addr1, 0x1000);
+        assert_eq!(addr1 - addr2, 0); // Saturating subtraction
+        assert_eq!(addr1 - addr1, 0);
+
+        ()
+    }
+
+    #[test]
+    fn test_alignment() {
+        let addr = PhysAddr::from_raw(0x1007);
+        let align = 8 as phys_addr_t;
+
+        // align_down
+        assert_eq!(addr.align_down(align), PhysAddr::from_raw(0x1000));
+        let aligned_addr = PhysAddr::from_raw(0x1008);
+        assert_eq!(aligned_addr.align_down(align), aligned_addr);
+
+        // align_up
+        assert_eq!(addr.align_up(align), PhysAddr::from_raw(0x1008));
+        assert_eq!(aligned_addr.align_up(align), aligned_addr);
+        assert_eq!(PhysAddr::from_raw(0).align_up(align), PhysAddr::from_raw(0));
+
+        ()
+    }
+
+    #[test]
+    fn test_saturating_arithmetic() {
+        let addr = PhysAddr::from_raw(0x1000);
+        let max_addr = PhysAddr::from_raw(phys_addr_t::MAX);
+
+        // Saturating add
+        assert_eq!(addr.saturating_add(0x10), PhysAddr::from_raw(0x1010));
+        assert_eq!(max_addr.saturating_add(1), max_addr); // Caps at MAX
+
+        // Saturating sub
+        assert_eq!(addr.saturating_sub(0x10), PhysAddr::from_raw(0x0ff0));
+        let zero = PhysAddr::from_raw(0);
+        assert_eq!(zero.saturating_sub(1), zero); // Caps at 0
+
+        ()
+    }
+
+    #[test]
+    fn test_checked_subtraction() {
+        let addr = PhysAddr::from_raw(0x1000);
+
+        assert_eq!(addr.checked_sub(0x10), Some(PhysAddr::from_raw(0x0ff0)));
+        let zero = PhysAddr::from_raw(0);
+        assert_eq!(zero.checked_sub(1), None); // Underflow
+
+        ()
+    }
+}
-- 
2.52.0

