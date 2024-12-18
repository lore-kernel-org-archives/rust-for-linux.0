Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA615746F;
	Wed, 18 Dec 2024 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502896; cv=none; b=C638sm/rRvzAsLmq9XoOnf5VvYAmcpeYG9eE3X8feeCNA5a2MgNwUw37Z/LESfjw7e+99/+JkUXG3+N2g/K80MXo78seKooawx2C5phz5IVI6PG2wUHhiRrwVpHJCYyKtXRC+G3sgg+EwstAvzq+yO6jWqybYA/6rgjPZjzUD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502896; c=relaxed/simple;
	bh=F+UxQeJn/7V3A50yv7sNNr+lijigleW03jac6dRiBd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrE0jdYbzth0jVxpuqANB0umIZbAM3YXdkloRyQie2uYD8UDevjUkLWHDwF+7lHrpt5RpJd6dT9AWsVnQUephyafcVbS368fYl/5xx7DuHBveLq4s1Escd5ydYLsylGRZCu1tbKg1L3ONyvFRsENyckaxMoLYm+Q5YTcbUiPZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIKTuhpF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIKTuhpF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728e729562fso5263688b3a.0;
        Tue, 17 Dec 2024 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502893; x=1735107693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwlBx0jrzaKTcJ0dbZncCuW6nwSfqkNTYDsslGfubt4=;
        b=KIKTuhpFJEhDMDfOjAcCPJOvVn2RgkznuK863VM5tk5CxhKLyNFngbCChVIkuZ1u66
         oQ0oe5ghVEhlvsY28JDGHu5VioEcY0HrqhQESf/HZQm/2P0FIH134yWlfhWZ2X5veq8B
         3FFqX2Nv7jRb+VTuRpf1OMwZvvO4p9HghY7Md38e7kOCKmDuKZdXj4JyCeirS6JiM0iu
         Mcpt/tZV5+2qN0AjJb2Iu9iVewBhmx/MBsa+quNt0H4enpmj5lAVq/7f7kdmybTrAN9M
         jLhnGzS27mE5xfFtQUpSoEUcdVLYBznpKYGvtJeTJ6LCIMAO5GOJbDG7Y+IC7nrPV4QD
         Wypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502893; x=1735107693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwlBx0jrzaKTcJ0dbZncCuW6nwSfqkNTYDsslGfubt4=;
        b=Q5ZEEgbKTgXeZ8wcfzCK4h72FeAf1cVHDdOPYM/aZl12OM4oOrR5/yIfgkdOebjvAt
         sy4E5/xOUfm8VAo5r9XCrhdF6kELlvtTHPI8qcde80VaZeKp+4Gh2bhTaj0bICvdDjKo
         mi/+eBPbXtrIWaVVUfJhPq1acZTXP4d6bL7Fx6BBcS+p+JDjWBrTW+o87JZHdquIi/6C
         MFgXxHB78c/5W6XO5jRAVaLFkVCqNhMi9l8VOs10bcA+Tsm4AyLaAEnYTf6ZcbMLyYC6
         XlbeddCNNpVm9ea1MQp1thwqmNbY4jSqfJMmAiklwFZifYXmVgMR0s2PCl2aCZDaa/60
         L05w==
X-Forwarded-Encrypted: i=1; AJvYcCW7hFwlh8mgBlt01X40fvDnUTAeMpQYVOw7Vv+f7S+eOPYxxTBeFQQ+h7Ul7uLQHpxA/b5AQIYNkTRZNiRWPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGTrs2NRrL/9EoCFRd8sOJUD+NCDM78QCXF+5RHKQVDKCh1+x
	kUervOeonk24dHtjpAvpOXQe4Pb1Iu39y2STlXf++ttDiH+LjA67n+PpnhME
X-Gm-Gg: ASbGnctKbjplL4NGjiwFBt9aonsMdZdX4KV5zXZk5u8hxwd/7yhxpxwT8+Hvy3+H9jb
	QtIO/xCcP9UFpKUk8ksaoXYdLj3hLmM+qqdAz3kSk9cISozbN+jpZBaSvmFX4FZq/8VBNZZVIR2
	4Dw8526G6lPB7b1gOC2NylDy4NHHAHm88k8avbRku5ioajCnK2lOesmeDfm8kD2ajlMAx3Qa0rY
	Lms1kNkMpRlcIJAHSA6A1/zsyGsUAVT3qHeCCaL/vKv8fmOHAgkOAGKLEIVelc/S8/qdFMD/MER
	VzyiRvcaMut7PVEvQw==
X-Google-Smtp-Source: AGHT+IHQ4m+HWcjLQvuT9XztCDOhnw/Ackcq84+U+25p09X+uuYbWpONGNOHBq0tC1LQs8iHELt5MQ==
X-Received: by 2002:a05:6a00:44cb:b0:726:41e:b314 with SMTP id d2e1a72fcca58-72a8d2c3f2cmr2786241b3a.19.1734502893327;
        Tue, 17 Dec 2024 22:21:33 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:33 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v2 5/5] rust: Add warn_on and warn_on_once
Date: Wed, 18 Dec 2024 15:20:09 +0900
Message-ID: <20241218062009.2402650-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
macros doesn't work so this uses the assembly code exported by the C
side via ARCH_WARN_ASM macro. Like the static branch code, this
generates the assembly code for rust dynamically by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

ASM_REACHABLE definition works in the same way to get objtool's
reachable asm code. The architectures which use objtool (x86 and
loongarch) needs it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 125 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d..633b2c28605c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -37,6 +37,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
@@ -449,5 +452,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f1d7f4225332 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
\ No newline at end of file
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..7ffd9cb1ad75
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 FUJITA Tomonori
+
+//! Support for BUG_* and WARN_* functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                "/* {size} */",
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(
+            concat!(
+                "/* {size} */",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const ::core::ffi::c_char,
+            );
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(CONFIG_BUG))]
+macro_rules! warn_flags {
+    ($flags:expr) => {};
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! bugflag_taint {
+    ($taint:expr) => {
+        $taint << 8
+    };
+}
+
+/// Report a warning only once.
+#[macro_export]
+macro_rules! warn_on_once {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!(
+                $crate::bindings::BUGFLAG_ONCE
+                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
+            );
+        }
+        $cond
+    };
+}
+
+/// Report a warning.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!($crate::bugflag_taint!($crate::bindings::TAINT_WARN));
+        }
+        $cond
+    };
+}
diff --git a/rust/kernel/generated_arch_reachable_asm.rs.S b/rust/kernel/generated_arch_reachable_asm.rs.S
new file mode 100644
index 000000000000..4e65525e4464
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/objtool.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ASM_REACHABLE)
diff --git a/rust/kernel/generated_arch_warn_asm.rs.S b/rust/kernel/generated_arch_warn_asm.rs.S
new file mode 100644
index 000000000000..8f239b431aa4
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("111b", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..913f3a5b2a98 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 mod build_assert;
 pub mod cred;
 pub mod device;
-- 
2.43.0

