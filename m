Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265A73176E1
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992942; cv=none; b=EJqCH7kNijMJOQzI/OxrH9YBX2Cs+grjEwORkSIkT3+EYee0NZ7L9Lr9pFXwko6iLO6Y7owHqAEPTNL7YKISr9ng45v9T0J0B2U+54Rgwq+v9qFiwR8Ogffpty6Ig4Z312S14tbh94LhP6w1/B1CMt/nhWPliaFvUQWGqvacEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992942; c=relaxed/simple;
	bh=qHNlxSu/PkGCEtLX5EG0jA7l8MJAICI5Q09AO0cyNtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMU2Q7/LP/OEwDd+H5wFOOOwNmUz4BSbRCq2ljaX3B8jWXAaPy4ifvVRfjm626n52c+RZfQ3P3EvAm7RJ7U1eztkWNM64NZC+c+UZlFWWUZfuK3yoYudBg0EaeyDUETVl1WyLCaMIe998UpZTRdpDHqVuQzhgVcpyInorpFb4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so10781432b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766992939; x=1767597739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ip8agSFUw07WRJVcjqLBCL6Q43Z643M9GGCglrCpl9A=;
        b=Zi9v9P4AzUhABctfevO/wj4dS+k7ncbVaEIhFuKP9loqb9aDl6tJATSWJgX1EwB3Fg
         LKdpYkYacMhMFzvAhBD7ZkFfJ8/+Pssp1LebhND7mHh1mMT9mlxZPiP3ZP1BBmGeXaDF
         MyO0gYik9S/n2sxPR36Lv3cT9N7XN+cKyMb2haHK9HhGGBtl0IcnPBvSzrC/Dyep6Bsx
         dIrjNr/OrR4EY5wrNZNSDkxQbLf0eL2hvwM17VnJmmG/TqS0NH2U2R1jh6obk6ma15IY
         ilRWMFW1GzYHmv/pJOw4wLoW+pJvdkIwnqQbwuRpNmpsFlm2PpVBvEmiMpQo+lSpNrXI
         cTvg==
X-Forwarded-Encrypted: i=1; AJvYcCUvA1yIKa0hl6oWgZvZlsKgtWTJakcjV25RFWHh+xxAKzmlzK6Vip/tah2fjMJzwHf6lNluJ1nUA6vbR6BMnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjqxzhVf/aNRRMuPK/dzI1bQAJx0gsO0c0jbEGeSl2SL717sF
	cSNIBLquZagPa5JKqfyv43DLQ0L4TQiwGR64w1fJ+Xmm9AadBfO5I61Y
X-Gm-Gg: AY/fxX66w6GiRMK/1i7sZMgBhF4DUofI5zGf3UK3PQBmHExyeUX0bRQGmMbIQO6gods
	DZOkjZEOWSqHxJkJgyhMZjbixHAZ+Dt0ttzrqzim6AqWa6gTLesSvNFzPT/89WuYuFVKm4vpppc
	lhp+Y0OIMLPraE2yIwmwHwbIOa/fanlAW93UruxvpdE/XZA85O8LenwzpVGD73pn1e91PO3bg27
	nFNCjtb4uGKeNbc7WBCeSD1yAv1LkJyaFo3sN+6OcSKbv6THV8DZCS2epqDscxOIF0Zm3Pmpim5
	BTqd9mDMFUoLfzOPAr/vrx5xTb2fg73yXz0w75+dKWA7+sa2eyOWCUNK6Ca0JzNr7k6S6Ro9ld8
	/n+AENtthWFEJph/fsHhnqYzL6pgSWpVJSIgeHDA6GjoEkj2GhlYW97jTFMoFmqFWATUg4i3h3Y
	9okdR7Ngk4hXZfY3CNLd8PJyf3ehG8auoweKM9rhiiqatwrrqdtno2M1I=
X-Google-Smtp-Source: AGHT+IG/be6yDjXqERiate70pyPYzco09VkGXg+pi2us9kZ71a/2z5BnGFHLUQa0vUYmpotKqVlsJQ==
X-Received: by 2002:a05:6a00:4214:b0:7e8:43f5:bd24 with SMTP id d2e1a72fcca58-7ff6735f3fdmr25105939b3a.57.1766992939195;
        Sun, 28 Dec 2025 23:22:19 -0800 (PST)
Received: from localhost.localdomain (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm29021863b3a.45.2025.12.28.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:22:18 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v7 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
Date: Mon, 29 Dec 2025 15:21:20 +0800
Message-ID: <20251229072157.3857053-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229072157.3857053-1-sunke@kylinos.cn>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
rust/kernel/ptr.rs that correspond to C kernel's printk format specifiers
%p, %pK, and %px. These types provide type-safe pointer formatting that
matches C kernel patterns.

These wrapper types implement core::fmt::Pointer and delegate to the
corresponding kernel formatting functions, enabling safe pointer
formatting in Rust code that prevents information leaks about kernel
memory layout.

Users can explicitly use these types:
    pr_info!("{:p}\n", HashedPtr::from(ptr));
    pr_info!("{:p}\n", RestrictedPtr::from(ptr));
    pr_info!("{:p}\n", RawPtr::from(ptr));

Signed-off-by: Ke Sun <sunke@kylinos.cn>
Suggested-by: Dirk Behme <dirk.behme@gmail.com>
---
 rust/kernel/ptr.rs | 254 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 251 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index e3893ed04049d..ccc5aa83b612c 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -1,11 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Types and functions to work with pointers and addresses.
+//!
+//! This module provides wrapper types for formatting kernel pointers that correspond to the
+//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
 
-use core::mem::align_of;
-use core::num::NonZero;
+use core::{
+    fmt,
+    fmt::Pointer,
+    mem::align_of,
+    num::NonZero, //
+};
 
-use crate::build_assert;
+use crate::{
+    bindings,
+    build_assert,
+    ffi::c_void, //
+};
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -225,3 +236,240 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Placeholder string used when pointer hashing is not ready yet.
+const PTR_PLACEHOLDER: &str = if core::mem::size_of::<*const c_void>() == 8 {
+    "(____ptrval____)"
+} else {
+    "(ptrval)"
+};
+
+/// Macro to implement common methods for pointer wrapper types.
+macro_rules! impl_ptr_wrapper {
+    ($($name:ident),* $(,)?) => {
+        $(
+            impl $name {
+                /// Creates a new instance from a raw pointer.
+                #[inline]
+                pub fn from<T>(ptr: *const T) -> Self {
+                    Self(ptr.cast())
+                }
+
+                /// Creates a new instance from a mutable raw pointer.
+                #[inline]
+                pub fn from_mut<T>(ptr: *mut T) -> Self {
+                    Self(ptr.cast())
+                }
+
+                /// Returns the inner raw pointer.
+                #[inline]
+                pub fn as_ptr(&self) -> *const c_void {
+                    self.0
+                }
+            }
+
+            impl<T> From<*const T> for $name {
+                #[inline]
+                fn from(ptr: *const T) -> Self {
+                    Self::from(ptr)
+                }
+            }
+
+            impl<T> From<*mut T> for $name {
+                #[inline]
+                fn from(ptr: *mut T) -> Self {
+                    Self::from_mut(ptr)
+                }
+            }
+        )*
+    };
+}
+
+/// Helper function to hash a pointer and format it.
+///
+/// Returns `Ok(())` if the hash was successfully computed and formatted,
+/// or the placeholder string if hashing is not ready yet.
+fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+    let mut hashval: crate::ffi::c_ulong = 0;
+    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
+    // hashing. This is safe as long as ptr is a valid pointer value.
+    let ret = unsafe { bindings::ptr_to_hashval(ptr, core::ptr::addr_of_mut!(hashval)) };
+
+    if ret != 0 {
+        // Hash not ready yet, print placeholder with formatting options applied
+        // Using `pad()` ensures width, alignment, and padding options are respected
+        return f.pad(PTR_PLACEHOLDER);
+    }
+
+    // Successfully got hash value, format it using Pointer::fmt to preserve
+    // formatting options (width, alignment, padding, etc.)
+    Pointer::fmt(&(hashval as *const c_void), f)
+}
+
+/// A pointer that will be hashed when printed (corresponds to `%p`).
+///
+/// This is the default behavior for kernel pointers - they are hashed to prevent
+/// leaking information about the kernel memory layout.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     ptr::HashedPtr,
+///     str::CString, //
+/// };
+///
+/// let ptr = HashedPtr::from(0x12345678 as *const u8);
+/// pr_info!("Hashed pointer: {:016p}\n", ptr);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct HashedPtr(*const c_void);
+
+impl fmt::Pointer for HashedPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Handle NULL pointers - print them directly
+        if self.0.is_null() {
+            return Pointer::fmt(&self.0, f);
+        }
+
+        format_hashed_ptr(self.0, f)
+    }
+}
+
+/// A pointer that will be restricted based on `kptr_restrict` when printed (corresponds to `%pK`).
+///
+/// This is intended for use in procfs/sysfs files that are read by userspace.
+/// The behavior depends on the `kptr_restrict` sysctl setting.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     ptr::RestrictedPtr,
+///     str::CString, //
+/// };
+///
+/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
+/// pr_info!("Restricted pointer: {:016p}\n", ptr);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct RestrictedPtr(*const c_void);
+
+impl fmt::Pointer for RestrictedPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Handle NULL pointers
+        if self.0.is_null() {
+            return Pointer::fmt(&self.0, f);
+        }
+
+        // Use kptr_restrict_value to handle all kptr_restrict cases.
+        // - Returns 0: kptr_restrict == 0, use original pointer (needs hashing)
+        // - Returns 1: kptr_restrict == 1, *pptr may be modified to NULL if no permission
+        // - Returns 2: kptr_restrict >= 2, *pptr is set to NULL
+        // - Returns -1: IRQ context with kptr_restrict == 1 (error case)
+        let mut ptr_value = self.0;
+        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
+        // It may modify ptr_value to NULL if there's no permission.
+        let ret = unsafe { bindings::kptr_restrict_value(core::ptr::addr_of_mut!(ptr_value)) };
+
+        match ret {
+            -1 => {
+                // IRQ context with kptr_restrict == 1 - print error placeholder
+                // This should not happen in normal Rust code, but handle it gracefully
+                f.pad("(pK-error)")
+            }
+            0 => {
+                // kptr_restrict == 0: hash the pointer (same as %p)
+                format_hashed_ptr(self.0, f)
+            }
+            1 => {
+                // kptr_restrict == 1: print raw pointer if ptr_value is non-null,
+                // otherwise print 0 (no permission)
+                if ptr_value.is_null() {
+                    Pointer::fmt(&core::ptr::null::<c_void>(), f)
+                } else {
+                    // Print the raw pointer directly (like %px)
+                    // This matches C behavior: pointer_string() prints the raw address
+                    Pointer::fmt(&ptr_value, f)
+                }
+            }
+            _ => {
+                // kptr_restrict >= 2: always print 0
+                // ptr_value should already be NULL, but check to be safe
+                Pointer::fmt(&core::ptr::null::<c_void>(), f)
+            }
+        }
+    }
+}
+
+/// A pointer that will be printed as its raw address (corresponds to `%px`).
+///
+/// **Warning**: This exposes the real kernel address and should only be used
+/// for debugging purposes. Consider using [`HashedPtr`] or [`RestrictedPtr`] instead.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     ptr::RawPtr,
+///     str::CString, //
+/// };
+///
+/// let ptr = RawPtr::from(0x12345678 as *const u8);
+///
+/// // Basic formatting
+/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+/// let formatted = cstr.to_str()?;
+/// assert_eq!(formatted, "0x12345678");
+///
+/// // Right align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
+/// let right_zero = cstr.to_str()?;
+/// assert_eq!(right_zero, "000000000000000000000x12345678");
+///
+/// // Left align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
+/// let left_zero = cstr.to_str()?;
+/// assert_eq!(left_zero, "0x1234567800000000000000000000");
+///
+/// // Center align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
+/// let center_zero = cstr.to_str()?;
+/// assert_eq!(center_zero, "00000000000x123456780000000000");
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct RawPtr(*const c_void);
+
+impl fmt::Pointer for RawPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Directly format the raw address - no hashing or restriction.
+        // This corresponds to %px behavior.
+        Pointer::fmt(&self.0, f)
+    }
+}
+
+// Implement common methods for all pointer wrapper types
+impl_ptr_wrapper!(
+    HashedPtr,
+    RawPtr,
+    RestrictedPtr, //
+);
-- 
2.43.0

