Received: from outbound.pv.icloud.com (pv-2006e-snip4-7.eps.apple.com [57.103.67.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE1382388
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435247; cv=none; b=tPb4w2HiVeVMeOszWv+oKl4pbegW5e1zCfNlRllWEc/lZ2pGdp0GwUik7Rx/hw7omPVRaYb1OihW17lhAGSVMpQsiCa+eHpNirTMmxH+eWEx/E1dMiRsMpp5aWf5CeJ8vrY0WjIttldB00ndLsj+K38geXACNHwhDEFaDC2VAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435247; c=relaxed/simple;
	bh=ZI9aGe0muqk8rJFNQPsuMpTsMkZs58Q4TszWgDI80gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7ymkVcrdHbIE7JtddkQQhRvL/Zf3bsh7Zz8Wtum9ISdzddE5r4SDn2fgLlRp1cSInjY3e+ljpnM6WCIHbvamtNsR91IBu8+kM4S0tFdKt5C8M0zDwAphZlnG5JqdvZcsS6LeaBrUlvOpZ54+kSlqAIRzH8j/5diiuTdJ4g66/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=lr94dSsh; arc=none smtp.client-ip=57.103.67.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="lr94dSsh"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-8 (Postfix) with ESMTPS id BC73A1804970;
	Tue, 07 Jul 2026 14:40:42 +0000 (UTC)
X-ICL-RepId: 019f3d06-2cdb-7098-a60c-7a69cd0e1c21
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNCE0TBVIHXU1WDUcPWB5cFBcIRUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DWgZfAUALTh1fAFwGQAtLHlwaH10dVjhSAV4KQRlXHx0DUh8MUE0BQwgKCEcDTRdeMlMEXxFQFg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783435245; x=1786027245; bh=adw/qeP/lDksVXsihkFA21f4WCtmrOO7YYvHOE64JcI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=lr94dSsh51V9nfW895YZVQiwVANl+OwZSyiiz9+ff+SItsMEJouFYDO01exKaUrcvS0EnsiD3ZrJgBfVLnIg5AWjIu65bvKBGg9gJ7pvgmOLExScIrC8youNYz0ubTB0oys01Ze/nlJbkgXT9mQK7vAnV3OUqR1X4PpeeARHinxLljEFRnDN5YmwHB31X+jQA7+li+eJKRRBBHWPM6g/w9vZmdJUx6ytBuyzenFMpwRsTmBxQ89WcX6d6Q2DGBm0HG27StAZlI9LTEWSUQmRBTOKHBt3yi6DGAaphIe94V0ZN6xUpjJFG3V/RTCzvKnMe1FeGWeFyYFd8KFaXjxqsw==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-8 (Postfix) with ESMTPSA id 0E707181BA84;
	Tue, 07 Jul 2026 14:32:02 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: bug: Add bug_on macro
Date: Tue,  7 Jul 2026 23:30:26 +0900
Message-ID: <20260707143026.2774023-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: psxfDEXm1oXpJ0qn6mt1ZLsS86MUc4-1
X-Proofpoint-ORIG-GUID: psxfDEXm1oXpJ0qn6mt1ZLsS86MUc4-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NCBTYWx0ZWRfX0OfzI5Q7h5d6
 N0Zlw+hbqRpHYt1ILJDaezGPp5PNLhV4NBB87jI7YpOBgRUUUGn/3CW50hBiA5n8ozhYc34KoCn
 jJafhaYWUUsuOWEwXHAEkgfmYyUp+PQy/E/v7X707gYd8G4058vn+JA9A9ek96cEUNIRDcuv4wC
 4IIksCowyb7xllOa269tviNZP9p1sQTMITKD+Z8cGXJO9t5dKHpk5HL4BS24LQ+q3j2VClTa27V
 d4K1WBIW/1GZFkmOZZnKjGZJWDKJluQdGo7gHxRa45/3VXNxWth4WQN3EevYSjyMPh5aBKxbO+n
 OzBho8KmVMPz2+YhgtO

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add bug_on macro(), the Rust equivalent of the C's BUG_ON(), which
uses the BUG/WARN feature (lib/bug.c) via assembly for
x86_64/arm64/riscv/s390 like warn_on() macro.

Use of this macro is heavily discouraged. Prefer warn_on() macro with
recovery code where feasible. See the documentation for C's BUG_ON()
for guidance on when it is rarely justified.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 105 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 76 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..0f904c4614a2 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -11,9 +11,13 @@
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
-        const _FILE: &[u8] = $file.as_bytes();
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {{
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
+        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
+        const _COND_STR: &str = file!();
+
+        const _FILE: &[u8] = _COND_STR.as_bytes();
         // Plus one for null-terminator.
         static FILE: [u8; _FILE.len() + 1] = {
             let mut bytes = [0; _FILE.len() + 1];
@@ -24,6 +28,7 @@ macro_rules! warn_flags {
             }
             bytes
         };
+        const FLAGS: u32 = $flags;
 
         // SAFETY:
         // - `file`, `line`, `flags`, and `size` are all compile-time constants or
@@ -35,14 +40,14 @@ macro_rules! warn_flags {
                 concat!(
                     "/* {size} */",
                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
-                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                    $asm_tail);
                 file = sym FILE,
                 line = const line!(),
                 flags = const FLAGS,
                 size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
             );
         }
-    }
+    }};
 }
 
 #[macro_export]
@@ -50,8 +55,8 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        const FLAGS: u32 = $flags;
 
         // SAFETY:
         // - `flags` and `size` are all compile-time constants, preventing
@@ -63,7 +68,7 @@ macro_rules! warn_flags {
                 concat!(
                     "/* {size} */",
                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
-                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                    $asm_tail);
                 flags = const FLAGS,
                 size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
             );
@@ -75,16 +80,23 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        // SAFETY: It is always safe to call `warn_slowpath_fmt()`
-        // with a valid null-terminated string.
-        unsafe {
-            $crate::bindings::warn_slowpath_fmt(
-                $crate::c_str!(::core::file!()).as_char_ptr(),
-                line!() as $crate::ffi::c_int,
-                $flags as $crate::ffi::c_uint,
-                ::core::ptr::null(),
-            );
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        // bug_on!() sets $flags to 0, so we can use that to determine
+        // whether to call BUG() or WARN_ON().
+        if $flags == 0 {
+            // SAFETY: It is always safe to call `BUG()`.
+            unsafe { $crate::bindings::BUG() }
+        } else {
+            // SAFETY: It is always safe to call `warn_slowpath_fmt()`
+            // with a valid null-terminated string.
+            unsafe {
+                $crate::bindings::warn_slowpath_fmt(
+                    $crate::c_str!(::core::file!()).as_char_ptr(),
+                    line!() as $crate::ffi::c_int,
+                    $flags as $crate::ffi::c_uint,
+                    ::core::ptr::null(),
+                );
+            }
         }
     };
 }
@@ -93,9 +105,16 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        // SAFETY: It is always safe to call `WARN_ON()`.
-        unsafe { $crate::bindings::WARN_ON(true) }
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        // bug_on!() sets $flags to 0, so we can use that to determine
+        // whether to call BUG() or WARN_ON().
+        if $flags == 0 {
+            // SAFETY: It is always safe to call `BUG()`.
+            unsafe { $crate::bindings::BUG() }
+        } else {
+            // SAFETY: It is always safe to call `WARN_ON()`.
+            unsafe { $crate::bindings::WARN_ON(true) }
+        }
     };
 }
 
@@ -103,7 +122,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {};
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {};
 }
 
 #[doc(hidden)]
@@ -117,16 +136,44 @@ macro_rules! warn_on {
     ($cond:expr) => {{
         let cond = $cond;
 
-        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
-        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
-        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
-        const _COND_STR: &str = file!();
-
         if cond {
-            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
+            #[cfg(any(not(CONFIG_BUG), CONFIG_UML))]
+            const WARN_ON_FLAGS: u32 = $crate::bindings::TAINT_WARN;
+            #[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+            const WARN_ON_FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING
+                | $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
-            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
+            $crate::warn_flags!(
+                $cond,
+                WARN_ON_FLAGS,
+                include!(concat!(
+                    env!("OBJTREE"),
+                    "/rust/kernel/generated_arch_reachable_asm.rs"
+                ))
+            );
         }
         cond
     }};
 }
+
+/// Reports an unrecoverable kernel bug if `cond` is true.
+///
+/// This is the Rust equivalent of the C macro [`BUG_ON()`]. Unlike [`warn_on!`], it never
+/// returns control to the caller when `cond` is true.
+///
+/// Use of this macro is *heavily discouraged*. Prefer [`warn_on!`] with recovery code where
+/// feasible. Please see the documentation for the C macro [`BUG_ON()`] for guidance on when it
+/// is (rarely) justified.
+///
+/// [`BUG_ON()`]: https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
+#[macro_export]
+macro_rules! bug_on {
+    ($cond:expr) => {{
+        let cond = $cond;
+        if cond {
+            $crate::warn_flags!($cond, 0, "");
+            // SAFETY: We call `BUG()` above so this block will never be reached.
+            unsafe { core::hint::unreachable_unchecked() }
+        }
+    }};
+}

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

