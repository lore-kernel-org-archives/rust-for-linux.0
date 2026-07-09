Received: from outbound.pv.icloud.com (pv-2005e-snip4-6.eps.apple.com [57.103.66.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8711CBA
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555315; cv=none; b=T7u+GUh4YNmAX810UVn7wuVyV0iLOfJsSlmnW8miA6WiNQknoZhSzjcO5yObi199tofvYMHHHD0pYpC4SkPzC3TIvCCDp0vqnuUOWwQtKmuKOYzlsq22Q8dPqTYCQC8b9XbeZdUUW1ZReQNcUcUo9nzLXmKsSZtngQb3xM2Yohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555315; c=relaxed/simple;
	bh=MNAwnnnXpC5JG8h3G+3/XTDcnymIo4ZHQqzlRgjzc0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBY9vN79E8CXQtcirkWpP1bcA0TRJCEDGh1O4+lqcAdS+TXl8QSbaci+ct9hHYwyJtztp3lhfJ8SKRq0rn3DEjQObWPOVfR9H6wBiBA5rJdOd276gk55JIvS//3VZTcrp+AUt2oBkgvz86ocyKDDdbtAbrN7tVGbposY9lH6Z2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=JffgTbMz; arc=none smtp.client-ip=57.103.66.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="JffgTbMz"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPS id C63FC1800304;
	Thu, 09 Jul 2026 00:01:49 +0000 (UTC)
X-ICL-RepId: 019f442e-405e-78b9-bd80-9eb86ddb0444
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNCE4TBVIHXU1WDUcPWB5cFBcIRUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DVAdbAkEJSx1fDloAQQxBHlwaH10dVjhSAV4KQRlXHx0DUh8MUE0BQwgKCEcDTRdeMlMEXxFQFg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783555313; x=1786147313; bh=DwE/M8i0rFXetmKY23n0sQsiLo9C3x6NCJwqOx6Duio=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=JffgTbMzhWkiNVxlyB562Vp5aalX7VlrbNblLrSEUouAcrbFEzXAz+Y1bqGEPc+2/pb+UH3gbDhe5qm3pTcv4PDSRZQiMtpoSrSRkNjt5xnL+cUfSde8ihhi6Ge1BDKtzT+ReFeJQWezD4wC+QlGxCtfC+EafBMqazv8TquaZeO/a7B2zftooVffpW0SVl8h0DfZNrJAvwUHO+t+u3iRwFTUwoIPJFCohLxfwIQzPXFu5/WeJoWe37acNck6zKkz7r0E8VtD+evbPB3hq62lD790vw5/wm4OXUBqAHcLKlwjt9KeyYkE2SXs3QOmT+rfWdCbWB7VUeHgyG+h+qpVvA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPSA id 202211800316;
	Thu, 09 Jul 2026 00:01:46 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: ojeda@kernel.org
Cc: gregkh@linuxfoundation.org,
	a.hindborg@kernel.org,
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
Subject: [PATCH v2] rust: bug: Add bug macro
Date: Thu,  9 Jul 2026 09:01:03 +0900
Message-ID: <20260709000103.2912159-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Tbm8ogQBA5FQHlioUSwQpYyjIlskuk2
X-Proofpoint-GUID: 0Tbm8ogQBA5FQHlioUSwQpYyjIlskuk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDIzNiBTYWx0ZWRfX+PnrpVC5YEsX
 8islS0nXuM+Xdkakb/Dc1LWmRw33WsicTVj3GFAJAGau2yh0KNJnEVnGLM/yvtim4iGfbPI3NaF
 a0pCY6WMjX3YuUcP5cop3wjDJZDwD+9tSOzGUARtWvu7DqTzueA9omHTJPkJhiRr03YwTF4m+Gu
 N/ImkKP7ws3Mq+w4lgNu6n0a9pv/86aVv6HGwEMkdr3H+0mzaxtXnhQ36gUVLLu16JCiA6rN5pY
 w9sk9MuX63ZHr4ghu/rYjaDJmPIklHK/X34R9NzxstymzHLjl883IyasmuCmF1cIGVxwthjmS8+
 li5+zAV6zwirB5NlhXO

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add bug!(), the Rust equivalent of C's BUG(). Like warn_on!(), it
emits the BUG/WARN metadata (lib/bug.c) directly via inline assembly
on x86_64/arm64/riscv/s390. This differs from bindings::BUG(), which
reaches the same C BUG() macro indirectly through a C helper
(rust/helpers/bug.c).

bindings::BUG() is already in use today, indirectly, from the kernel
crate itself and from drivers such as binder and nova-core, via
panic!()/.expect()/.unwrap() on invariants that "can't happen". All of
those funnel through panic() in kernel/lib.rs (#[panic_handler]),
which itself calls bindings::BUG().

The motivation for this patch is narrow: replace that bindings::BUG()
call in the panic() function in lib.rs with bug!(), for a somewhat
better trace. It isn't adding a new decision to crash the system; that
decision is already made at each of the existing panic!()/.expect()
call sites.

The bug!() macro is currently for internal use only, so it is marked
`#[doc(hidden)]`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2
- Replace bindings::BUG in lib.rs with bug!() to make the motivation clear
- Add #[doc(hidden)] to make clear that bug!() is for internal use only
- Add the bug!() macro, rather than bug_on!(), as the straightforward
  choice for replacing bindings::BUG.

v1: https://lore.kernel.org/rust-for-linux/20260707143026.2774023-1-tomo@aliasing.net/
---
 rust/kernel/bug.rs | 98 ++++++++++++++++++++++++++++++++--------------
 rust/kernel/lib.rs |  3 +-
 2 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..c7bd019508f7 100644
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
 
@@ -103,7 +122,11 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {};
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        if $flags == 0 {
+            loop {}
+        }
+    };
 }
 
 #[doc(hidden)]
@@ -117,16 +140,33 @@ macro_rules! warn_on {
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
+/// Reports an unrecoverable kernel bug.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! bug {
+    () => {
+        $crate::warn_flags!(true, 0, "");
+        // SAFETY: We call `BUG()` above so this block will never be reached.
+        unsafe { core::hint::unreachable_unchecked() }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..41bfe5a20287 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -217,8 +217,7 @@ pub const fn as_ptr(&self) -> *mut bindings::module {
 #[panic_handler]
 fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     pr_emerg!("{}\n", info);
-    // SAFETY: FFI call.
-    unsafe { bindings::BUG() };
+    crate::bug!();
 }
 
 /// Produces a pointer to an object from a pointer to one of its fields.

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

