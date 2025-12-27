Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985DEEAB
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806826; cv=none; b=h9ZUUqtG0HQ7BJI+xCmJppahI0MWGVP37yklFsO3UdQv5npnZlnsTLvzrLA1kVcUZmU75uV8tBuHfUphcvmGvcpt1mab4d+/FfuSBkJEYv+OssgxSnmIqy2MQwqaPrJUb0+66MYrBWEQnDO3ANthbkmhzuVvHpwXhfh6OwTop9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806826; c=relaxed/simple;
	bh=R5KZaLebedYNSgMXqufZZ19mAlT/E5drqf1COoRjhO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEFh/7LrK3/l/y10jROIur9uaEx8XpkkfYoLtpvZKuz4/4tzxPUFwmnC8J6scT9aJdWuOcCOfyTF/egPDUE0Ii3Zsbhl6SigwriEpkNnT2JSBKUiIA+zQlXlqIFqITIePOeCyvO3Fz+wWJpLjzwgMCM7iE95qyUh1/8DQchEzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0f3f74587so108821795ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806824; x=1767411624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQIoT8rqBwjRRO78tf3cOrWGLoz/de8TOlSsZ8QELqM=;
        b=Xb2KG5RbG+YQGHTloCXqpnMQ3nWH8yxEg5BfgNxAfWi2weNflTy461GFdGRSxokHD6
         u5mnxdboY0rDML/mW27NjZegyuRJR8WfD2AS6COWfM1IIh08GZ3jdC5wvN/BXILea7sW
         h9iny+hTrJoSt9zJ6IpY89kyfM5+IEJsLLWyBnmGj31W9iA3MX2FrnpSvNiFsOim3Eyq
         LLBMmkl/DdjW9Z28q8fplUPUCLpGE9QQvlki8+37BoZhy/gkrtRA+a/M7gZ76WOOBMuv
         Da4egsrNa/ZyGXo7ufbVZsE04soIqBa8mO36HJAW9aL85W3RAjOEyIc7tThE2cMO3b4F
         xdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu1cluSFl0VfUeW2eXPRzUafvqmSElovQ1FEh54VeBkxiIvbPeV0tD10jxUg83ikMPw9CfcpdV0ITgZ3QSmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Fzd64UYYrfJCtuQGc5AUJXs+unhbAqpXOz4rzcpw6N9+Jmtk
	pbqJCpeeUhu2J8oTQrls5YRcAoWo5BtwKQfSf1ZvuWJJBXiAlqCZKUf/
X-Gm-Gg: AY/fxX41C1A0jXy1Xtd4L0cDUyTMxFeW6mTTIIAxKgB2CogDScL1GNDcBsToJOn49qW
	6mYHG77433iNwEXnGYIrcWmOz0QyxtpNNGTzNFAd3Kd86Avru3u4GtcPVpcx/ErXy1hs8iEJK+1
	HconfdQFmF3rbOSM7S3TnXvQZmciuwPdH0BbsxR9mjujG9p8lPQa3QNF4hpJqharr7A4cr6zYBC
	SYVWwValLW3ccIoGAo1pyDESl1OdZ9DCDT4yroBeuZr8LtYKEmk+zuhhEPSsNbQv7QQm1OFSKNr
	skP7ZE7zcppvp/bET4bz2e5Y+1ZMQeAkys9IHNvRcSC243uxeD9kN/9x1H0c6OSm04A8d6oYAbi
	kOlXrNyE6n9ZcUwncH6md8JWV8NWDiUnwB7WoX2cff7DEiNRLenCZW3KrFVQbD10wSOox36C/QF
	O+HkFL7abxT8efmxwuVDfsLSTi9Fydt7CqoLVWHe4IygonByblQfuCmZc=
X-Google-Smtp-Source: AGHT+IGGRyx+X3dQXBM3kB4mJw4rUVETZae7YIjjZ92o1WPU98ZnbCXM93AVoxCsljmHSfm359H0xA==
X-Received: by 2002:a17:902:e892:b0:298:29e0:5f32 with SMTP id d9443c01a7336-2a2f2231ae0mr248873285ad.15.1766806823704;
        Fri, 26 Dec 2025 19:40:23 -0800 (PST)
Received: from localhost.localdomain (61-221-120-112.hinet-ip.hinet.net. [61.221.120.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm215323135ad.44.2025.12.26.19.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 19:40:23 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v6 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
Date: Sat, 27 Dec 2025 11:39:53 +0800
Message-ID: <20251227033958.3713232-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227033958.3713232-1-sunke@kylinos.cn>
References: <20251227033958.3713232-1-sunke@kylinos.cn>
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
---
 rust/helpers/fmt.c     |  65 +++++++++++
 rust/helpers/helpers.c |   3 +-
 rust/kernel/ptr.rs     | 241 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 305 insertions(+), 4 deletions(-)
 create mode 100644 rust/helpers/fmt.c

diff --git a/rust/helpers/fmt.c b/rust/helpers/fmt.c
new file mode 100644
index 0000000000000..4ee716bbfe284
--- /dev/null
+++ b/rust/helpers/fmt.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2018 - 2025 KylinSoft Co., Ltd. All rights reserved.
+ * Copyright (C) 2018 - 2025 Ke Sun <sunke@kylinos.cn>
+ */
+
+#include <linux/kernel.h>
+#include <linux/cred.h>
+#include <linux/capability.h>
+#include <linux/hardirq.h>
+#include <linux/printk.h>
+
+/*
+ * Helper function for Rust to format a restricted pointer (%pK).
+ *
+ * This function determines what pointer value should be printed based on the
+ * kptr_restrict sysctl setting:
+ *
+ * - kptr_restrict == 0: Returns the original pointer (will be hashed by caller)
+ * - kptr_restrict == 1: Returns the original pointer if the current process has
+ *                       CAP_SYSLOG and same euid/egid, NULL otherwise
+ * - kptr_restrict >= 2: Always returns NULL
+ *
+ * Returns:
+ *   - The original pointer if it should be printed (case 0 or case 1 with permission)
+ *   - NULL if it should not be printed (no permission, IRQ context, or restrict >= 2)
+ */
+const void *rust_helper_kptr_restrict_value(const void *ptr)
+{
+	switch (kptr_restrict) {
+	case 0:
+		/* Handle as %p - return original pointer for hashing */
+		return ptr;
+	case 1: {
+		const struct cred *cred;
+
+		/*
+		 * kptr_restrict==1 cannot be used in IRQ context because the
+		 * capability check would be meaningless (no process context).
+		 */
+		if (in_hardirq() || in_serving_softirq() || in_nmi())
+			return NULL;
+
+		/*
+		 * Only return the real pointer value if the current process has
+		 * CAP_SYSLOG and is running with the same credentials it started with.
+		 * This prevents privilege escalation attacks where a process opens a
+		 * file with %pK, then elevates privileges before reading it.
+		 */
+		cred = current_cred();
+		if (!has_capability_noaudit(current, CAP_SYSLOG) ||
+		    !uid_eq(cred->euid, cred->uid) ||
+		    !gid_eq(cred->egid, cred->gid))
+			return NULL;
+		break;
+	}
+	case 2:
+	default:
+		/* Always hide pointer values when kptr_restrict >= 2 */
+		return NULL;
+	}
+
+	return ptr;
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4..b6877fe8dafc0 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -27,8 +27,9 @@
 #include "dma.c"
 #include "drm.c"
 #include "err.c"
-#include "irq.c"
+#include "fmt.c"
 #include "fs.c"
+#include "irq.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index e3893ed04049d..8b58221c2ec4b 100644
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
@@ -225,3 +236,227 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
+#[derive(Copy, Clone, Debug)]
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
+#[derive(Copy, Clone, Debug)]
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
+        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
+        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
+        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
+        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
+        let restricted_ptr = unsafe { bindings::kptr_restrict_value(self.0) };
+
+        if restricted_ptr.is_null() {
+            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
+            return Pointer::fmt(&core::ptr::null::<c_void>(), f);
+        }
+
+        // restricted_ptr is non-null, meaning we should print something.
+        // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
+        let restrict = unsafe { bindings::kptr_restrict };
+
+        if restrict == 0 {
+            // kptr_restrict == 0: hash the pointer (same as %p)
+            format_hashed_ptr(self.0, f)
+        } else {
+            // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
+            // This matches C behavior: pointer_string() prints the raw address
+            Pointer::fmt(&restricted_ptr, f)
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
+#[derive(Copy, Clone, Debug)]
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

