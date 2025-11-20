Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8532DCF70
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667474; cv=none; b=H0gPGbtyxmI7na4KdXNaQuzXuuJAuIDOfbmTn0+5LwTsxg9u6vgsbAQJhwhoXN7H0TsAA/CEjJat8f1WuQ2IPhhHInQkaaFPuGTzGC9oAePiHTNOVi6BT6EkQuS6dKxqc6iiuAG3FCyI52oxeJ4Bbuh1mkf2HLhaCWHtzuV0daE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667474; c=relaxed/simple;
	bh=RuzBxUfNldLphdXJ1/YfWQk8i9OCxTF/DE52FRt83F8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gl9ZLXgrxF1GfHWdvqOtPyMFRX9Hg1Hf3Iy9vCZImKTWKX/vU5JzTmPuru6VLuXnEiBbjzK/t/YlpPGrXhcMnB3Z8/ovTekU25kOmCjZ1UghNex0f8EPxQf6rdiPnzviks3jSMwHdqgUEf3BpGkZ+JjUvfmmMTkjiVGMw81Juek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn82l8uh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn82l8uh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so2127296a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763667470; x=1764272270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkdu+LsCUXFBIgM4CB60iYythh6x54mcsqtzaxVDy+I=;
        b=Yn82l8uh0ZCXN2qykquRyqSLmiUFxiTos2v4NSKf7tpiyfpHsHwX3ypHGUQTwuxl+N
         yta5gVzY2XX8s77QLfcEge5eV/A5A1hi48tgelO4JbZrky4GgWJrFdCUtSIN5H10Oagk
         L5JASoADiI+Nbp+kcjzhM2+ewDSIHOaTUr0fncNovthltOWw627If/mXxrh69QhiKO+D
         xfEi2tVtnJ34YlaWhelFqZ0/l7pSs+o1bK1n/rdboqJ2H0NL7Ga/PSJVwIj6cs2S+ZWJ
         G9Wg/VELKf/HBNAqkJtvbcn7L8ACWWO4a3DYmQIUthvPR4EkmnO5Fmc6qvBBffLWT7PH
         17ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763667470; x=1764272270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fkdu+LsCUXFBIgM4CB60iYythh6x54mcsqtzaxVDy+I=;
        b=ikQNrfoaJx9hxbFdVezoiaXi/HZRgyd584i6sZ3k89u7D468Ei8ntDObFC9rEUtolM
         n0DLb+/rWZ8MJge/ZwQTOLvGc4jVV3hMDxhesiBBrGI6eFh+2iJrL2gX0NxuMAZNCucF
         FvFFWHLfgrl8kGcvWoRBjRZ6YZE5+p/3GZT3r4ujwx4zpFyJOQcjE7pDZ/gGTR4/Eosx
         lrZBYif1X6VShTDAbVCypPf1yXGMtVm7CcFbIRoSXdGg5GtkDNM4EoeOX9+B7+1AydVT
         fP10G3U5sBAau02G7PuuES2vmGmCHfEXzyOGwFBvmdrGg4oeOZy5AQF3wTtbPIgAlSsp
         e1og==
X-Forwarded-Encrypted: i=1; AJvYcCXOlpN7RhVU4kOlG8svnNRdk9FWN/GGtflCpnr+6qFGjEb3I78vH0eGX1T1qJX1VXDlVtOeBrtd6o4KyO4Z+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNYqnd7RmEl1EpwEb6VnMWfpeF50X9/tZHXbsBpBxVBa3edKe
	xGIWqtXKhcZbJNWZmn2fbrT1kYovdPd05e2eO8o5yEd2RYK+tt6IONe0
X-Gm-Gg: ASbGncv+AOOZkMpbztN7kzi2x6iZOmEP4aen5d/ToCJrNdK9jWATi4n23d5FBAP2BQR
	Naekck6PgFKJLYGihDrqVeiN0rX1xRhw1pQQQ4tlVCl0KDH3oIv81VPJHAM6j2q66dVUwGHQ0eC
	rIRLeCyU0YFXlAiWXbxCRB88XwFmB3Zw9a0tz1P/HUiRebRVAWUtWamJJMuUuMtqOG9+iO5FHEd
	9VBpXLQfol1p4wJG9vJ8xeInUjkxzwkz7KcMsvrYPE/eZ/fAZHNBek9UFfpMJ226wQH+L7drC5H
	1ykFRiphUxzYekOvWk7jw0sqT0g8PiY11At7ByzjOJeC7F8Q0TKFidSFe9G+PWnljuWZK++98tf
	Yr+nckyWf2C2zL2Y3ag50RWlJrkE2QWoBsF5kHHzOU5aO8MjMRAvUQr6QjgumSTsuPg==
X-Google-Smtp-Source: AGHT+IGxEmSOs/pbgifmxje/0gjywCP4Ex99urrpKg/AuSmsdWA4HdnrOdDNL9hfkXCKnOMhzsmG2w==
X-Received: by 2002:a17:907:3e04:b0:b54:7778:c62d with SMTP id a640c23a62f3a-b7654d5cb18mr56015566b.15.1763667469834;
        Thu, 20 Nov 2025 11:37:49 -0800 (PST)
Received: from gentb ([2a02:8071:6480:ee20::6780])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43b1sm270508266b.38.2025.11.20.11.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:37:48 -0800 (PST)
From: Gent Binaku <binakugent@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gent Binaku <binakugent@gmail.com>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rust: Convert PhysAddr type alias into newtype
Date: Thu, 20 Nov 2025 20:36:51 +0100
Message-ID: <20251120193656.142234-1-binakugent@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the use of `phys_addr_t` in the Rust kernel bindings into a
dedicated `PhysAddr` newtype to provide stronger type safety around
physical addresses.

By wrapping `phys_addr_t` in a transparent Rust newtype, we avoid
accidentally mixing physical addresses with virtual addresses or other
integer-like values. This allows the API to clearly express intent at
call sites and makes misuse harder.

The newtype provides:
- Explicit construction and extraction via `from_raw()` and `as_raw()`.
- Arithmetic helpers (`checked_add`, `wrapping_add`, `wrapping_sub`)
  with well-defined wrapping behaviour and operators.
- Alignment helpers (`align_down`, `align_up`) for common patterns.
- Formatting implementations (`Debug`, `Display`, hex, octal, binary).

Existing Rust code that interacts with C helpers such as `ioremap*` and
resource APIs is updated to use `PhysAddr` at the Rust boundary while
still passing the underlying `phys_addr_t` to C via `as_raw()`.

This addresses Rust-for-Linux issue #1204 by defining a dedicated
PhysAddr type on top of phys_addr_t, constraining operations and
avoiding confusion with other integer types.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1204
Link: https://lore.kernel.org/rust-for-linux/20251112-resource-phys-typedefs-v2-0-538307384f82@google.com
Signed-off-by: Gent Binaku <binakugent@gmail.com>

diff --git c/rust/kernel/io/resource.rs i/rust/kernel/io/resource.rs
index d0064724a01a..3c5a02d161d8 100644
--- c/rust/kernel/io/resource.rs
+++ i/rust/kernel/io/resource.rs
@@ -8,10 +8,10 @@
 use core::ops::Deref;
 use core::ptr::NonNull;

+use crate::phys_addr::PhysAddr;
 use crate::prelude::*;
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
-use crate::phys_addr::PhysAddr;

 pub use super::{
     ResourceSize, //
@@ -133,7 +133,7 @@ pub fn size(&self) -> ResourceSize {
     pub fn start(&self) -> PhysAddr {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
-        unsafe { PhysAddr((*inner).start) }
+        unsafe { PhysAddr::from_raw((*inner).start) }
     }

     /// Returns the name of the resource.
diff --git c/rust/kernel/lib.rs i/rust/kernel/lib.rs
index 8c50c8147851..5402ab654a50 100644
--- c/rust/kernel/lib.rs
+++ i/rust/kernel/lib.rs
@@ -115,6 +115,7 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+pub mod phys_addr;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git c/rust/kernel/phys_addr.rs i/rust/kernel/phys_addr.rs
index 15ae6db5baf9..41b635e5d44e 100644
--- c/rust/kernel/phys_addr.rs
+++ i/rust/kernel/phys_addr.rs
@@ -31,12 +31,7 @@
 //! let aligned_addr = addr.align_down(8);
 //! assert_eq!(aligned_addr.as_raw(), 0x1008);
 //! ```
-#![allow(dead_code)]
-
-use crate::{
-    bindings,
-    error::{Result},
-};
+use crate::bindings;
 use core::{
     fmt,
     ops::{Add, Sub},
@@ -50,7 +45,7 @@
 /// memory layout, making it safe to use across FFI boundaries.
 #[repr(transparent)]
 #[derive(Copy, Clone, Default, PartialEq, Eq, PartialOrd, Ord, Hash)]
-pub struct PhysAddr(pub bindings::phys_addr_t);
+pub struct PhysAddr(bindings::phys_addr_t);

 impl PhysAddr {
     /// The zero physical address. Equivalent to `PhysAddr::default()`.
@@ -76,6 +71,21 @@ pub fn checked_add(self, rhs: bindings::phys_addr_t) -> Option<Self> {
         self.0.checked_add(rhs).map(Self)
     }

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
     /// Wrapping addition.
     pub fn wrapping_add(self, rhs: bindings::phys_addr_t) -> Self {
         Self(self.0.wrapping_add(rhs))
@@ -86,27 +96,48 @@ pub fn wrapping_sub(self, rhs: bindings::phys_addr_t) -> Self {
         Self(self.0.wrapping_sub(rhs))
     }

+    /// Wrapping multiplication.
+    pub fn wrapping_mul(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_mul(rhs))
+    }
+
     /// Aligns the address down to the nearest multiple of `align`.
     ///
     /// `align` must be a power of two.
-    pub fn align_down(self, align: bindings::phys_addr_t) -> Self {
+    pub const fn align_down(self, align: bindings::phys_addr_t) -> Self {
         Self(self.0 & !(align.wrapping_sub(1)))
     }

     /// Aligns the address up to the nearest multiple of `align`.
     ///
     /// `align` must be a power of two.
-    pub fn align_up(self, align: bindings::phys_addr_t) -> Self {
-        // This is the idiomatic way to perform align_up.
-        self.add(align.wrapping_sub(1)).align_down(align)
-   }
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
 }

-// Implement operators for ergonomic pointer arithmetic.
-// The convention is that these operators perform wrapping arithmetic.
 impl Add<bindings::phys_addr_t> for PhysAddr {
     type Output = Self;

+    /// Adds with wrapping on overflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_add`] or [`saturating_add`].
     fn add(self, rhs: bindings::phys_addr_t) -> Self::Output {
         self.wrapping_add(rhs)
     }
@@ -115,6 +146,9 @@ fn add(self, rhs: bindings::phys_addr_t) -> Self::Output {
 impl Sub<bindings::phys_addr_t> for PhysAddr {
     type Output = Self;

+    /// Subtracts with wrapping on underflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_sub`] or [`saturating_sub`].
     fn sub(self, rhs: bindings::phys_addr_t) -> Self::Output {
         self.wrapping_sub(rhs)
     }
@@ -133,7 +167,6 @@ fn sub(self, rhs: PhysAddr) -> Self::Output {
     }
 }

-
 // Implement standard formatting traits for addresses.
 impl fmt::Debug for PhysAddr {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
@@ -162,6 +195,24 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }

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
 // --- KUnit Test Suite ---
 #[kunit_tests(kernel_physadrmod)]
 mod tests {
@@ -169,7 +220,7 @@ mod tests {
     use crate::bindings::phys_addr_t;

     #[test]
-    fn test_creation_and_conversion() -> Result {
+    fn test_creation_and_conversion() {
         let addr = PhysAddr::from_raw(0x1000);
         assert_eq!(addr.as_raw(), 0x1000);

@@ -177,19 +228,19 @@ fn test_creation_and_conversion() -> Result {
         assert_eq!(default_addr.as_raw(), 0);
         assert_eq!(default_addr, PhysAddr::ZERO);

-        Ok(())
+        ()
     }

     #[test]
-    fn test_is_null() -> Result {
+    fn test_is_null() {
         assert!(PhysAddr::ZERO.is_null());
         assert!(PhysAddr::from_raw(0).is_null());
         assert!(!PhysAddr::from_raw(1).is_null());
-        Ok(())
+        ()
     }

     #[test]
-    fn test_arithmetic() -> Result {
+    fn test_arithmetic() {
         let addr = PhysAddr::from_raw(0x1000);

         // Checked addition
@@ -205,14 +256,17 @@ fn test_arithmetic() -> Result {
         // Wrapping subtraction
         assert_eq!(addr.wrapping_sub(0x10), PhysAddr::from_raw(0x0ff0));
         let zero_addr = PhysAddr::from_raw(0);
-        assert_eq!(zero_addr.wrapping_sub(1), PhysAddr::from_raw(phys_addr_t::MAX));
+        assert_eq!(
+            zero_addr.wrapping_sub(1),
+            PhysAddr::from_raw(phys_addr_t::MAX)
+        );
         assert_eq!(zero_addr - 2, PhysAddr::from_raw(phys_addr_t::MAX - 1));

-        Ok(())
+        ()
     }

     #[test]
-    fn test_address_difference() -> Result {
+    fn test_address_difference() {
         let addr1 = PhysAddr::from_raw(0x1000);
         let addr2 = PhysAddr::from_raw(0x2000);

@@ -220,11 +274,11 @@ fn test_address_difference() -> Result {
         assert_eq!(addr1 - addr2, 0); // Saturating subtraction
         assert_eq!(addr1 - addr1, 0);

-        Ok(())
+        ()
     }

     #[test]
-    fn test_alignment() -> Result {
+    fn test_alignment() {
         let addr = PhysAddr::from_raw(0x1007);
         let align = 8 as phys_addr_t;

@@ -236,11 +290,36 @@ fn test_alignment() -> Result {
         // align_up
         assert_eq!(addr.align_up(align), PhysAddr::from_raw(0x1008));
         assert_eq!(aligned_addr.align_up(align), aligned_addr);
-        assert_eq!(
-            PhysAddr::from_raw(0).align_up(align),
-            PhysAddr::from_raw(0)
-        );
+        assert_eq!(PhysAddr::from_raw(0).align_up(align), PhysAddr::from_raw(0));

-        Ok(())
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
     }
 }
---
 rust/kernel/io/resource.rs |   4 +-
 rust/kernel/lib.rs         |   1 +
 rust/kernel/phys_addr.rs   | 139 +++++++++++++++++++++++++++++--------
 3 files changed, 112 insertions(+), 32 deletions(-)

diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index d0064724a01a..3c5a02d161d8 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -8,10 +8,10 @@
 use core::ops::Deref;
 use core::ptr::NonNull;
 
+use crate::phys_addr::PhysAddr;
 use crate::prelude::*;
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
-use crate::phys_addr::PhysAddr;
 
 pub use super::{
     ResourceSize, //
@@ -133,7 +133,7 @@ pub fn size(&self) -> ResourceSize {
     pub fn start(&self) -> PhysAddr {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
-        unsafe { PhysAddr((*inner).start) }
+        unsafe { PhysAddr::from_raw((*inner).start) }
     }
 
     /// Returns the name of the resource.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 8c50c8147851..5402ab654a50 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -115,6 +115,7 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+pub mod phys_addr;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git a/rust/kernel/phys_addr.rs b/rust/kernel/phys_addr.rs
index 15ae6db5baf9..41b635e5d44e 100644
--- a/rust/kernel/phys_addr.rs
+++ b/rust/kernel/phys_addr.rs
@@ -31,12 +31,7 @@
 //! let aligned_addr = addr.align_down(8);
 //! assert_eq!(aligned_addr.as_raw(), 0x1008);
 //! ```
-#![allow(dead_code)]
-
-use crate::{
-    bindings,
-    error::{Result},
-};
+use crate::bindings;
 use core::{
     fmt,
     ops::{Add, Sub},
@@ -50,7 +45,7 @@
 /// memory layout, making it safe to use across FFI boundaries.
 #[repr(transparent)]
 #[derive(Copy, Clone, Default, PartialEq, Eq, PartialOrd, Ord, Hash)]
-pub struct PhysAddr(pub bindings::phys_addr_t);
+pub struct PhysAddr(bindings::phys_addr_t);
 
 impl PhysAddr {
     /// The zero physical address. Equivalent to `PhysAddr::default()`.
@@ -76,6 +71,21 @@ pub fn checked_add(self, rhs: bindings::phys_addr_t) -> Option<Self> {
         self.0.checked_add(rhs).map(Self)
     }
 
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
     /// Wrapping addition.
     pub fn wrapping_add(self, rhs: bindings::phys_addr_t) -> Self {
         Self(self.0.wrapping_add(rhs))
@@ -86,27 +96,48 @@ pub fn wrapping_sub(self, rhs: bindings::phys_addr_t) -> Self {
         Self(self.0.wrapping_sub(rhs))
     }
 
+    /// Wrapping multiplication.
+    pub fn wrapping_mul(self, rhs: bindings::phys_addr_t) -> Self {
+        Self(self.0.wrapping_mul(rhs))
+    }
+
     /// Aligns the address down to the nearest multiple of `align`.
     ///
     /// `align` must be a power of two.
-    pub fn align_down(self, align: bindings::phys_addr_t) -> Self {
+    pub const fn align_down(self, align: bindings::phys_addr_t) -> Self {
         Self(self.0 & !(align.wrapping_sub(1)))
     }
 
     /// Aligns the address up to the nearest multiple of `align`.
     ///
     /// `align` must be a power of two.
-    pub fn align_up(self, align: bindings::phys_addr_t) -> Self {
-        // This is the idiomatic way to perform align_up.
-        self.add(align.wrapping_sub(1)).align_down(align)
-   }
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
 }
 
-// Implement operators for ergonomic pointer arithmetic.
-// The convention is that these operators perform wrapping arithmetic.
 impl Add<bindings::phys_addr_t> for PhysAddr {
     type Output = Self;
 
+    /// Adds with wrapping on overflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_add`] or [`saturating_add`].
     fn add(self, rhs: bindings::phys_addr_t) -> Self::Output {
         self.wrapping_add(rhs)
     }
@@ -115,6 +146,9 @@ fn add(self, rhs: bindings::phys_addr_t) -> Self::Output {
 impl Sub<bindings::phys_addr_t> for PhysAddr {
     type Output = Self;
 
+    /// Subtracts with wrapping on underflow.
+    ///
+    /// For checked or saturating arithmetic, use [`checked_sub`] or [`saturating_sub`].
     fn sub(self, rhs: bindings::phys_addr_t) -> Self::Output {
         self.wrapping_sub(rhs)
     }
@@ -133,7 +167,6 @@ fn sub(self, rhs: PhysAddr) -> Self::Output {
     }
 }
 
-
 // Implement standard formatting traits for addresses.
 impl fmt::Debug for PhysAddr {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
@@ -162,6 +195,24 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
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
 // --- KUnit Test Suite ---
 #[kunit_tests(kernel_physadrmod)]
 mod tests {
@@ -169,7 +220,7 @@ mod tests {
     use crate::bindings::phys_addr_t;
 
     #[test]
-    fn test_creation_and_conversion() -> Result {
+    fn test_creation_and_conversion() {
         let addr = PhysAddr::from_raw(0x1000);
         assert_eq!(addr.as_raw(), 0x1000);
 
@@ -177,19 +228,19 @@ fn test_creation_and_conversion() -> Result {
         assert_eq!(default_addr.as_raw(), 0);
         assert_eq!(default_addr, PhysAddr::ZERO);
 
-        Ok(())
+        ()
     }
 
     #[test]
-    fn test_is_null() -> Result {
+    fn test_is_null() {
         assert!(PhysAddr::ZERO.is_null());
         assert!(PhysAddr::from_raw(0).is_null());
         assert!(!PhysAddr::from_raw(1).is_null());
-        Ok(())
+        ()
     }
 
     #[test]
-    fn test_arithmetic() -> Result {
+    fn test_arithmetic() {
         let addr = PhysAddr::from_raw(0x1000);
 
         // Checked addition
@@ -205,14 +256,17 @@ fn test_arithmetic() -> Result {
         // Wrapping subtraction
         assert_eq!(addr.wrapping_sub(0x10), PhysAddr::from_raw(0x0ff0));
         let zero_addr = PhysAddr::from_raw(0);
-        assert_eq!(zero_addr.wrapping_sub(1), PhysAddr::from_raw(phys_addr_t::MAX));
+        assert_eq!(
+            zero_addr.wrapping_sub(1),
+            PhysAddr::from_raw(phys_addr_t::MAX)
+        );
         assert_eq!(zero_addr - 2, PhysAddr::from_raw(phys_addr_t::MAX - 1));
 
-        Ok(())
+        ()
     }
 
     #[test]
-    fn test_address_difference() -> Result {
+    fn test_address_difference() {
         let addr1 = PhysAddr::from_raw(0x1000);
         let addr2 = PhysAddr::from_raw(0x2000);
 
@@ -220,11 +274,11 @@ fn test_address_difference() -> Result {
         assert_eq!(addr1 - addr2, 0); // Saturating subtraction
         assert_eq!(addr1 - addr1, 0);
 
-        Ok(())
+        ()
     }
 
     #[test]
-    fn test_alignment() -> Result {
+    fn test_alignment() {
         let addr = PhysAddr::from_raw(0x1007);
         let align = 8 as phys_addr_t;
 
@@ -236,11 +290,36 @@ fn test_alignment() -> Result {
         // align_up
         assert_eq!(addr.align_up(align), PhysAddr::from_raw(0x1008));
         assert_eq!(aligned_addr.align_up(align), aligned_addr);
-        assert_eq!(
-            PhysAddr::from_raw(0).align_up(align),
-            PhysAddr::from_raw(0)
-        );
+        assert_eq!(PhysAddr::from_raw(0).align_up(align), PhysAddr::from_raw(0));
 
-        Ok(())
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
     }
 }
-- 
2.52.0

