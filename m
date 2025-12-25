Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A6298CC7
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703447; cv=none; b=K/0ZX1ya599XZHYBm2ChgmwFCQHoSPnPnFC9M3k3PD/ln3SCDxi4aY4opjwhY+GSjEliKJQxZ5MxksVIl65Ec1ROn2InzFfPQq+uFPJXG9pFpPne2yuVHQUjiJpnkmBhffJz4X3aXj5EMTOsPUFwfddnxtX6OMt2ItMkoyVa7A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703447; c=relaxed/simple;
	bh=5A6u3HeaSqbpuE1b+rrjW69P8MGxlsIK2xgOnoBzRXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WySn8TROoh3EoZ2Z2E6enf1Z5fqfvf8cOaRcS6K1xClAoxZDFyHdZ4BLuuZH+usc9t6LHh6c++16acdmhx5DKMcpFz8KPeSBfEoagZtcfZV6MrW6cl5eHWmzHXAv2/sxCxNwCOka1pf+39gTbXx9QWs8M+EAizQSpzPRA06kPDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d5c365ceso87851215ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 14:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703444; x=1767308244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PdVuttNIB1NoRqaf0s+Oz7jFyShR3Rn3wBkMnhZSljg=;
        b=K9mcNdm/Sb1ffuiu4QEeb7Y1O2HP6lcb7Ur62CSVTfvknpbtCuEpWaD3cwiYc4p8tn
         gsRCHqpwnPp/gUS7KSOQTnIQmgT8bZFicAinoPYpgJIEhyKMZ+E29GtRwnq+43WNHeGA
         W/M9Sdtq1wPqNNcnEfHyQIydaiS9l08HBRp+jbjMDBx+MY8YmkV0riZ0jzoHtD6kG+RE
         NK7er7/bXgndCt8vNdn4K6dzGBbNqZOiFxS3ektXQ7Cdtj0VpvWDilYc4C8dngFW/ujm
         8P8EXjIATzM7iBFigVe9Jp8yeF+SItY9Zw5EbK0AeqEv/vUCUGlMNJtKT5xRJCxAVUal
         AvOw==
X-Forwarded-Encrypted: i=1; AJvYcCWGFd5aElBS023DNfRGPUaztKpReD18ZkcG3PM1Tf+pZnT75IcNGEo66VpgtAri5CuisbSpcYAuzkg0afsDTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBSq8f9Crr08oJAIa8rPErKf1BfGbyKdfk2MvCwDShSFrIrra
	HYzkDWpar5SK2WoMkkgJ1Xb8D6Ez3fDY5ghNox5nfUWNSOEgou946Ryn
X-Gm-Gg: AY/fxX7877cO2xv909oAZ08D0lkKnwW0KuHib7RJ5fe1mMIl+S0Qjb2rJBjRh8+FigC
	vziVHp+gS5vVfFUgNSg56mtI22dnjVLvT0BWrXqIV5l6dmG/+Y/9i1YGZE9dS7RbFjP9Ei5cTqY
	OKKK36BEPNN4znq4yelcBkLT4SmEZrBmkcKavMQggUjDfV8gUJtLldYK4Snt7/yjfP/SEw3/TFF
	U+ET3hbWmMwAABvaL9VEaF6FZPpQTMl+q+lD3ZbAlhIvMs2D6E9hD/P2Jeztc1toWtUwEz+dFEI
	SY+CoKp8I47Q4tMDjjdG7UJkdcsAk+rNAgBC8kfCr7Yzz9GO1gGvf8MJwbchLAYQYZDsVo+zfMB
	CpZNtBd/h0Yxc9asbWZxI+3p7SL1/+0BvDYx83Ha9b+399coij1Hy61FXTDfx5jd9CN1Q0CLTUi
	lC09Jb1+tUFcuPEFFr6ZA=
X-Google-Smtp-Source: AGHT+IE5l+xF+HfqHrIcAQWzDHvzfqALOYqadxa74P7e7kD0ARf3+gwLLPON+Yw21xTld6EFyZ352w==
X-Received: by 2002:a17:902:ce82:b0:2a0:f469:1f56 with SMTP id d9443c01a7336-2a2f272b393mr239322585ad.31.1766703444460;
        Thu, 25 Dec 2025 14:57:24 -0800 (PST)
Received: from localhost.localdomain ([103.56.52.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm187308755ad.44.2025.12.25.14.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 14:57:24 -0800 (PST)
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
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v4 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
Date: Fri, 26 Dec 2025 06:57:05 +0800
Message-ID: <20251225225709.3944255-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225225709.3944255-1-sunke@kylinos.cn>
References: <20251225225709.3944255-1-sunke@kylinos.cn>
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
 rust/helpers/fmt.c     |  61 ++++++++++++
 rust/helpers/helpers.c |   3 +-
 rust/kernel/ptr.rs     | 215 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fmt.c

diff --git a/rust/helpers/fmt.c b/rust/helpers/fmt.c
new file mode 100644
index 0000000000000..9c8991cb8726d
--- /dev/null
+++ b/rust/helpers/fmt.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
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
+
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
index e3893ed04049d..2b36968aa90fd 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -1,11 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Types and functions to work with pointers and addresses.
+//!
+//! This module provides wrapper types for formatting kernel pointers that correspond to the
+//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
 
+use core::fmt;
+use core::fmt::Pointer;
 use core::mem::align_of;
 use core::num::NonZero;
 
+use crate::bindings;
 use crate::build_assert;
+use crate::ffi::c_void;
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -225,3 +232,211 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
+        // Hash not ready yet, print placeholder
+        return f.write_str(PTR_PLACEHOLDER);
+    }
+
+    // Successfully got hash value, format it using Pointer::fmt to preserve
+    // formatting options (width, alignment, padding, etc.)
+    // SAFETY: hashval is a valid pointer value from ptr_to_hashval.
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
+/// use kernel::{ptr::HashedPtr, prelude::fmt, str::CString};
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
+/// use kernel::{ptr::RestrictedPtr, prelude::fmt, str::CString};
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
+/// use kernel::{ptr::RawPtr, prelude::fmt, str::CString};
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
+impl_ptr_wrapper!(HashedPtr, RestrictedPtr, RawPtr);
-- 
2.43.0

