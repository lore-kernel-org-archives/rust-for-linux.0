Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE030BB94
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564018; cv=none; b=bbldPww1j2cbFJNXC1xcQgOAZCAe1s3bTql/0RvGBlI0mVoFPO8X2gzW5si5Pm3CvqKOmV3QI4pVznL4iT7HDa9Fe8dLsshYb7UOmcelQOKaque5BKNm76YAE371VaAQ2IY9mb3gk9E/uzFhkUGijRwM51JWZNNp2sesBDRe7Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564018; c=relaxed/simple;
	bh=yrEy1iUNJeQ2AxU8G0VM0zGOAM7Ix7d11JtN9etk72Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4SDAnRjvN/WMh0vZr7veRnKP0slbMRMQYxd2so5EkH8a3Sb8fNnWqkv/305dnifT1W+AsZvwDNqhIwX4rykz/Tu2yBjIc76TCGQL7VDHOS9zgwaLffvVRXN0Gr3cifOCN97Rm5DZaN5aii6XWoMsnLhsEZqHLlUP6pM00FfjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso62025005ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 00:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564016; x=1767168816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fj3meOW/LR1PemznJNHwQaWkpYoedc1x6h4Qc3XCNRk=;
        b=t1MxFC0OfFMG2IWeVk5ijw+HHWFllTBz1fLsm/AhKwa7ynj8sHn8gk6FfLm+uAQ18Y
         ta1ruLz0fwkWB/X1G1sIEcYXwh9XclCeQXQFsaPb2LYcyuilwmsU6dBSBr+cHsXuTA1Z
         ne6WTfG9JSl+8uFAjgpqCCTm50GoNKVQ4Wm2tnMFuHiKQn0fIjWbgEh+K9jHHOeJjBAu
         UFQEnhY63wmPL+xnv5C4pmo67CuVQPn7KJDMmBDcq0l1o1U1jXSHdJWxnsOOaW30qXsN
         Luyu8+9gS1O6Y6co/SpgYRJpyJKrjur3wrA/O4b6cdbbHQ5JBl4NMegHjeokPra/w+bN
         eBtg==
X-Forwarded-Encrypted: i=1; AJvYcCVyehx8oL3/NTEbcNCfod9iEJA0uMV5m2ENbY7QAic1xA0El9Mx44Y+SfseqKA6H0Ita9GFklOpvCI/R+e+5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRpE7JkoE6Tl/dX1K0/Yyoq6bhEOqxFTw+lN0giN5XiGyoEzA
	EB5cBP3t2/Dev0SIVbIoxDa57/qfdgskKBVOYfHajucqI13ILxHSxNB4
X-Gm-Gg: AY/fxX5s2p66mPPl/AcHd3mYqz4qm5D4wsM6aaiBZQtk38mKa1Zd3Kk1w/PoCo6XB9H
	zLNqCzKcsp15FHxrPvBuwXmISDcLN6N5PjHpTBCN5hJuQ6dB/YotVwgDqOy2e7allKWrRsQAqcO
	3umYliAp4EuWA3wMOR8FoWdWKRFupCThHBlmWgMGsfV7R6K1SW0n/wIcpZno+pbR8RhMYXhsl2a
	CNAx3t4lRsL4dk0QGh1gQXiidRLB/uItzdcmMEM2WrWfSXN1RySo7ZWhfVRzmIpNm+bL2cigIcO
	Ie/lB4D2p7lX3W4tE25BhhhJbLFpJW2VX1xusOvJdKrX+MpwE5q3MFY2oKD3GOa9sAcrJ344gBx
	IUka9xzVSPzoJOyawXeLbLRU4AEF2RhiAZk7Ctt48+GdHKKtodyaKOL+RDwYDn9sHOXllVelKzN
	y2OtW/oKvbnCes94JNPTuJ63l7/5DOJt6FjB1VLAZZhViTTjWGkE7WYsM=
X-Google-Smtp-Source: AGHT+IH5bW4I7o0wVjERpJfvWcX4E5Bw2aFOxGX2l6HoALqDTNPubZURgw3q9OcX3cLzSMeuICOoLg==
X-Received: by 2002:a17:903:b8b:b0:2a1:243:94a8 with SMTP id d9443c01a7336-2a2f2a4f102mr179432835ad.49.1766564016344;
        Wed, 24 Dec 2025 00:13:36 -0800 (PST)
Received: from localhost.localdomain (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm146462895ad.40.2025.12.24.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:13:35 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH v3 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
Date: Wed, 24 Dec 2025 16:13:11 +0800
Message-ID: <20251224081315.729684-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224081315.729684-1-sunke@kylinos.cn>
References: <20251224081315.729684-1-sunke@kylinos.cn>
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
    seq_print!(seq_file, "{:p}\n", RestrictedPtr::from(ptr));
    pr_info!("{:p}\n", RawPtr::from(ptr));

Changes:
- Add HashedPtr for %p (hashed, default behavior)
- Add RestrictedPtr for %pK (restricted, respects kptr_restrict)
- Add RawPtr for %px (raw address, debug only)
- Add helper function kptr_restrict_value() in rust/helpers/fmt.c
- Add impl_ptr_wrapper! macro to reduce code duplication

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/helpers/fmt.c     |  61 ++++++++++++++
 rust/helpers/helpers.c |   3 +-
 rust/kernel/ptr.rs     | 186 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 249 insertions(+), 1 deletion(-)
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
index e3893ed04049d..deb4d72bcecca 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -1,11 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Types and functions to work with pointers and addresses.
+//!
+//! This module provides wrapper types for formatting kernel pointers that correspond to the
+//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
 
+use core::fmt;
 use core::mem::align_of;
 use core::num::NonZero;
 
+use crate::bindings;
 use crate::build_assert;
+use crate::ffi::c_void;
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -225,3 +231,183 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
+    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
+    // hashing. This is safe as long as ptr is a valid pointer value.
+    unsafe {
+        let mut hashval: crate::ffi::c_ulong = 0;
+        let ret = bindings::ptr_to_hashval(ptr, core::ptr::addr_of_mut!(hashval));
+
+        if ret == 0 {
+            // Successfully got hash value, format it
+            write!(f, "{:p}", hashval as *const c_void)
+        } else {
+            // Hash not ready yet, print placeholder
+            f.write_str(PTR_PLACEHOLDER)
+        }
+    }
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
+/// use kernel::ptr::HashedPtr;
+///
+/// let ptr = HashedPtr::from(0x12345678 as *const u8);
+/// pr_info!("Pointer: {:p}\n", ptr);
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone, Debug)]
+pub struct HashedPtr(*const c_void);
+
+impl fmt::Pointer for HashedPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let ptr = self.0;
+
+        // Handle NULL pointers - print them directly
+        if ptr.is_null() {
+            return write!(f, "{:p}", ptr);
+        }
+
+        format_hashed_ptr(ptr, f)
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
+/// use kernel::ptr::RestrictedPtr;
+///
+/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
+/// seq_print!(seq_file, "Pointer: {:p}\n", ptr);
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone, Debug)]
+pub struct RestrictedPtr(*const c_void);
+
+impl fmt::Pointer for RestrictedPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let ptr = self.0;
+
+        // Handle NULL pointers
+        if ptr.is_null() {
+            return write!(f, "{:p}", ptr);
+        }
+
+        // Use kptr_restrict_value to handle all kptr_restrict cases.
+        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
+        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
+        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
+        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
+        let restricted_ptr = unsafe { bindings::kptr_restrict_value(ptr) };
+
+        if restricted_ptr.is_null() {
+            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
+            write!(f, "{:p}", core::ptr::null::<c_void>())
+        } else {
+            // restricted_ptr is non-null, meaning we should print something.
+            // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
+            let restrict = unsafe { bindings::kptr_restrict };
+
+            if restrict == 0 {
+                // kptr_restrict == 0: hash the pointer (same as %p)
+                format_hashed_ptr(ptr, f)
+            } else {
+                // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
+                // This matches C behavior: pointer_string() prints the raw address
+                write!(f, "{:p}", restricted_ptr)
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
+/// use kernel::ptr::RawPtr;
+///
+/// let ptr = RawPtr::from(0x12345678 as *const u8);
+/// pr_info!("Debug pointer: {:p}\n", ptr);
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone, Debug)]
+pub struct RawPtr(*const c_void);
+
+impl fmt::Pointer for RawPtr {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Directly format the raw address - no hashing or restriction
+        // This corresponds to %px behavior
+        write!(f, "{:p}", self.0)
+    }
+}
+
+// Implement common methods for all pointer wrapper types
+impl_ptr_wrapper!(HashedPtr, RestrictedPtr, RawPtr);
-- 
2.43.0

