Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C017282866
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783852115; cv=none; b=Zz7CXibg+ukDTdmAH25t/yPLT+0EYgqoooHmSQACCwCzK0ee9yZquuvoEhKPHFAWXM+goMCwfyUEaM2g2brqeqBMuRWCyudUEOldqpQVEyeIe9FpLbeqJZrlENVqqbmYxYMu9iZFw3DV3X28J+QLWpPZIikQcbe40P2a6W5FC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783852115; c=relaxed/simple;
	bh=OXfX6FR7NaHHUMrvA7XOXTmX2PvEd/Kva9P4/lU1l/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HvvOgDMxpBKYY7lNEJkCjS+vMEGXz7UnYMDTO785E8LfIGvTISVxoWkXdl45mePr5qKIE0fgbtv+VfxpvgxCAztGi67DQSbFLNriMUkfBrU67+ZTlxGbNWfTOQwjxNh4xx8TJnvUbm7+XAR0HQZmjpwkJ6ouDYtnzeiur+okaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=bD3LGx13; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BPsndprJ; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="bD3LGx13";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BPsndprJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id C73FE1380125;
	Sun, 12 Jul 2026 06:28:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 12 Jul 2026 06:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1783852111; x=1783855711; bh=Szm3MDFGwqTSDmAcIWu2h
	kMgY5JmR+ue65DebNbCyqI=; b=bD3LGx13Q1MYYY25I3hkNSbs3V9uPE+qDqKSH
	oqOfjLsgknz83vACO+nrwEOufVMcgzxXMjf/BiYc+XiDL7l8hg3NULKpm3SZJnhw
	AnobovLGnhXxV7N+XKqcushZR26DdHMXUiUVitEfCLxGajReBtDJ0jcf+Eh4Av0Q
	RGVpx6uGA9SDU1unj4UIBCMzpcIbFbk8QmtNcqVQTAdsPGWaKYUaSq1AYxEaGhtu
	pH3z4nOBm39WMxZQsd7gXYLwvYZfLLovJqF3qoM5NkHxoSlh28astqrZ5mR7qubj
	0dhmBszowp9cJdN7UKk7M7AweasB/QwJ5oMOx1Q4BpDsluoOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783852111; x=1783855711; bh=Szm3MDFGwqTSDmAcIWu2hkMgY5JmR+ue65D
	ebNbCyqI=; b=BPsndprJoyz/OdNr5hhY7gTiXOR6fNMsnn2G6/2QzkrmU1DNJiR
	xnVyROaAPY16RVvKZ1gZkgUvvsdsst/0ibzN/L2FiDjjn6Sqfa0yeKTt9QJ+7i4D
	68tmHOOBBSDwGOywx9TVEKeiLBMo0ByongCFYF4mhNwxeoU/cxUzuVqlcHljXtq5
	JkfO7pIiCcaw1AxGjh0eav+wxaQMe0PBY1zj0mqrolCGfQx2IlrC07vu2T5vXkz4
	juwpmSx5N8wSpJHN0YtKbtOGCpK0RL6ZQcFCb/dMXUYq6zkHcFy3x8iNOm12QGhk
	qqJFCB2+KM95amrqPcfjMSGHi8sBObCFwXA==
X-ME-Sender: <xms:T2xTalXMvDJtjzVc90TCtACDC0KxQcBHOLIlmjHdB-2YmyarzWxdbQ>
    <xme:T2xTamDR_YGMCjxKDu_dY0sD9nFO5UcBNwuIr_t-rVBQQx9ZtAbByJ2drgIpUE_a6
    FMIS_wi75tMscJszgQMo0Ft6W8hR--G4cZ6uwX6qUe7DBv1FheFSA>
X-ME-Received: <xmr:T2xTahLWkQhR-NHwCqdQ5xa18CIMkfX4-vfbp_zVUglscMxAWMn8RU-4snYy-JQFB5vS9vNhrOZdXssL-lI>
X-ME-Proxy-Cause: dmFkZTGMSItUtPJZ4J4+/C2zR9QitAzWBIMPZ95psAPEfqrrcmz89FWOh2CLpnZZUKip4x
    zVgqFd79nurYTaNCWEOcEkAnVSutF3CvZWh2WGW29hAzB3QH4h3+zZBV4AXnb2W8fxyX+5
    JdmdQc6oLfPIgQGVh2N/kxPnQNJKhwnGnBcFLIjEl307mNbRMi82VLKOHanzqpciDChytz
    lWyFG9wW71S/dBtTpEtD9c2/+glKGz/BI6M+Enx7NE0tC7d9c8iIMp3jHwv7Xf3Ahp1puj
    xlIqBT0TndMQrMsRMJrhZ4VysGzx9iC68c+E7TjOfoda/Vwu4JwYF7ghmCI88z9+gUM1ea
    XBhLBXxCsZUCC86V7koa9uRT98wkJtdK6HvGuUtCbntqByd6LFpVBNsIK1m4kpYzFSCm3/
    9crQykQHLEfWQgV1xZzr3p7tdiDIpUdLhz5DD/jgI5AfyxOl8WWRgdJ3a7u1utciVh1bSN
    9QB0NsJI0P7UNDWn4GPMYp2pzqgcl7slHuP/2pGJh8jZoDquUiSJAVQDU1qj3nRYcT20vm
    hp3G21sgzMxh76i1au+qZQ5nJIttORh5B42f0vOGaMVjOaM4oH76pTHXRLK+8MrCryzIW0
    TPtf6oRP0yCeF90E8KnD9OsadwzFBL08LM2NEaaehX2oosxJGmebEdhQ97jw
X-ME-Proxy: <xmx:T2xTakshlveQa3FWZ6Yvle0NpBIQqjPEnN3LA_P31eHy1PaiV0wVHg>
    <xmx:T2xTapWZpCJDVkVtL0yz2wR92cCs9WStto6mTEtr_We1892x3YsnZw>
    <xmx:T2xTavKhICEXUGFRGv_wNJZu16ht_9jN2rosJZRYAhHjlfH_lHkMuA>
    <xmx:T2xTau_nzad8OmSRg9ALS-rqwIK8CCuEdKj61WHO21bKJmu06Ns7uw>
    <xmx:T2xTakZbKCbiGZFQPmFWFUSy7IzSCyjB2ogqiyqsSgwDY8iwUXxC_xMT>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 06:28:26 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
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
Subject: [PATCH v3] rust: bug: Add bug macro
Date: Sun, 12 Jul 2026 19:28:02 +0900
Message-ID: <20260712102802.3013600-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add bug macro(), the Rust equivalent of the C's BUG(), which uses
the BUG/WARN feature (lib/bug.c) via assembly for
x86_64/arm64/riscv/s390 like warn_on() macro.

bindings::BUG() is already in use today, indirectly, from the kernel
crate itself and from drivers such as binder and nova-core, via
panic!()/.exepct()/.unwrap() on invariants that "can't happen". All of
those funnel through panic() in kernel/lib.rs (#[panic_handler]),
which itself calls BUG().

The motivation for this patch is narrow: replace that bindings::BUG()
call in lib.rs's panic() with bug!(), for a somewhat better trace. It
isn't adding a new decision to crash the system -- that decision is
already made at each of the existing panic!()/.expect() call sites.

The bug() macro is currently for internal use only, so it is marked
`#[doc(hidden)]`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v3
- Make some macro branches wrapped in {{ ... }}
- Fix typos
- Fix UML compile failure
v2: https://lore.kernel.org/rust-for-linux/20260709000103.2912159-1-tomo@aliasing.net/
- Replace bindings::BUG in lib.rs with bug!() to make the motivation clear
- Add #[doc(hidden)] to make clear that bug!() is for internal use only
- Add the bug!() macro, rather than bug_on!(), as the straightforward
  choice for replacing bindings::BUG.
  
v1: https://lore.kernel.org/rust-for-linux/20260707143026.2774023-1-tomo@aliasing.net/
---
 rust/kernel/bug.rs | 100 +++++++++++++++++++++++++++++++--------------
 rust/kernel/lib.rs |   3 +-
 2 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..25f3c2fbc12a 100644
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
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {{
+        const FLAGS: u32 = $flags;
 
         // SAFETY:
         // - `flags` and `size` are all compile-time constants, preventing
@@ -63,28 +68,35 @@ macro_rules! warn_flags {
                 concat!(
                     "/* {size} */",
                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
-                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                    $asm_tail);
                 flags = const FLAGS,
                 size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
             );
         }
-    }
+    }};
 }
 
 #[macro_export]
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
+        // bug!() sets $flags to 0, so we can use that to determine
+        // whether to call BUG() or WARN_ON().
+        if $flags == 0 {
+            // SAFETY: It is always safe to call `BUG()`.
+            unsafe { $crate::bindings::BUG() }
+        } else {
+            // SAFETY: It is always safe to call `warn_slowpath_fmt()`
+            // with a valid null-terminated string.
+            unsafe {
+                $crate::bindings::warn_slowpath_fmt(
+                    $crate::str::CStrExt::as_char_ptr($crate::c_str!(::core::file!())),
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
+        // bug!() sets $flags to 0, so we can use that to determine
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
+    () => {{
+        $crate::warn_flags!(true, 0, "");
+        // SAFETY: We call `BUG()` above so this block will never be reached.
+        unsafe { core::hint::unreachable_unchecked() }
+    }};
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

