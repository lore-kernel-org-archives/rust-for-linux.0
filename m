Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C13921E6
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985398; cv=none; b=TDFX6tW3UogZVgZUh5obvzjUlDfrWDYZXClQjSpIBp4fBahrnIXnKzml3ygnTkrKGfQEaP0qW4lbZdsZ21ePKVrAjl00gxVkY0PrkloO5sntsqw6LVsgs4AORU832FpD/7EZm5E+iYd2kaMKq+Gkl2fposw4A13v468+eMugzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985398; c=relaxed/simple;
	bh=CESb8ZaV6L0XsUXYGHqTDq1phdSxSROEg6fn6oPFpNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqINCLbbeFey7e6LnWW3COH5sf6nEIVOx3GVKSvBHedAmkmPYbaiCImvnwTIQLEuHDDMCWSeXQQBLDV/BtZC3nLrbX7vV9eC9T1CINegjMxzduKglMaa8oL8ckrCBEodgSZeiqDCRG+2pTzf1VeyXg0aONM16WdcJzXoD6BiTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=P+1pD8Ua; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rPPs9edI; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="P+1pD8Ua";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rPPs9edI"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 8962113002B3;
	Mon, 13 Jul 2026 19:29:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 13 Jul 2026 19:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1783985394; x=1783988994; bh=GWNVKcvu4LfXRJ/pntofB
	TdvjjnT+/u+M/PVRQr4xpc=; b=P+1pD8UaBLt6u311ui88blDHCx+eMZl6PXxjc
	PX5QIBq0+RmNn7BrInJg+aqIlGNqmGcCRSeSqa6Hz+P/hWN3DtVyH0hLZ3QuOhMe
	rCjrSzv9YJ7RozbfemvfHTvSVLU2lp6z3DOW6ZtY8j/x8gLiAz635GCYpeA4GIKt
	w+Ykn1S7eVj7pIY/qmWmJ64QDsiO5UErCtgOS3eaoWI3+e6O4bWxTvWp8bwNwOsN
	XHmhdccaUeLL4TKnwGnobOZg19tXZLjRaa5CyS4sLYVxN2OyM41k0+VOvB9C6lsu
	DTM6GkN1hK9kB1RlWPbc/iusdpS9YXaJ4DjvgpULUkkJdKyQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783985394; x=1783988994; bh=GWNVKcvu4LfXRJ/pntofBTdvjjnT+/u+M/P
	VRQr4xpc=; b=rPPs9edIX6pH5139uuQv0ygnJNsW5InJVYRH/BhgflGAr1zp0U+
	dZfviJcitL5b8RtZB+N4EXsAMNJPSPki70tT7F7y1GkROJ5tUIEHbHD02o5zyzCe
	mmHvRlFT+pvGD6WNRgRJrXrgd9W1l+v8d4QbZgPjyd6QigfN7E+P2pFYsu87S4H4
	5YDENy5937AiXczvRQQ3REIYFZbqe6SPLrcZMigL0K09k6pYPCGDGPGxa70SlHY8
	7OTNxhcOlyELy1pCwabeq1oRAtOX/WcLOS1Qf5UEdY5ZFuf0bAO7DGyN03dUlVNZ
	6ACVAxEfveOeHog1x0Yr0IxelR8xNrAu9gw==
X-ME-Sender: <xms:8XRVatblezc0X9W3FssDZnrJjefcwRWBb87UVT20JI_icnT7jf-CPw>
    <xme:8XRVak2TMZmlfgeZQwHN3eJTuckaXbiaOodJc8hAlICw_zCHSEb96hCm8ckcefX3n
    oEBUkBe4CG63anwLDW1mhSWDHGZa8Gdd50Ns90uqIuFL3-hCZpFNA>
X-ME-Received: <xmr:8XRVavtVUrZbb3iLET9o5ZQqdXxYZd96JHTRXRTH8sJVe6cLSzBve0B_tryHm5gQX4_NSpWFdFVFEPBd2HU>
X-ME-Proxy-Cause: dmFkZTGqrO4sb7QBA/Zl+Y7PDuKPN2u050ZMxeGETdPSSYDfkyhfDxCWKUZYxNuEBP4Xo2
    +MpFoiiB0tXcn0A+KcQUk24k7ljfkqR+YZHYAfe3nJco9K/xSN+eERzlDzQ88DBMiguRHq
    jolzYAuvqkwxIWtv0QDn5rnaaFG+pOQD4zOOAedX8kVx3/+j3jZCP0jX2C2mIzO4Qpv24T
    l/lkZZwKS33v4UowWUWlcr/nBRMIjosVXz9bAfklnF9oAxaAszq4+1ljbUZL5bzcqq7iYK
    sxQRSt6jAeQ9qT/0qq079WscXvpx/rTw0aEKv/sOYBbxxRDZCBrPItyVMf4kKUSrOs6pg1
    r+/A4Kjo6Z9/EMY0CxJsPtNstI3RlvauK2PsACzMTKsvUbPDkvsNG0z+uFl4VdC4c/OUmX
    0S3w1SNj4Ogrywm5g2EjYqAhPQQ905++i1kdEG8qm4JpYjEcZ07aOC1sYfU32pEhk2Ry3g
    KLD5mmgBgzs/qaSGXfAbqU0ruU9q8Z0VslFApgxY6e5Ipny78VRzMSJV2aE3H7fxnY1fJg
    OcfGVD0nwmdveYP4FlFb5vfejlPGWelzgSq0GBMPtJ8J0IaQvPP/XzJuEZf5CaCe179I++
    DX4NcPEygrn83C00kjHjg1VJYg8BGMM8IS+BNyDWrHPTzhSmF4iQMVb/GebQ
X-ME-Proxy: <xmx:8XRVaoDtQ94oa2XAQmp-l-xJaiLlOf3JuwRr-mORi3anSFyxWubkaw>
    <xmx:8XRVaiYq-LbGREvfatqlTo0udOANDSfgJFPfPghHqpY7R611AkCZCg>
    <xmx:8XRVaq91Q2Brd0Jt65mRu8V1bc8CAIH3BLBXmKO_fzn8r72RtWfwzQ>
    <xmx:8XRVamjdGez6OM4mL7F1EuJHFweld3th2cFd3oKHHEbiYxdcw-AMcQ>
    <xmx:8XRVauvRnvNyUrmHPGnFXUApCkdRZIPx0fAqSc8Jxume_sIH7eNYUuzn>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 19:29:49 -0400 (EDT)
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
Subject: [PATCH v4] rust: bug: Add bug macro
Date: Tue, 14 Jul 2026 08:29:42 +0900
Message-ID: <20260713232942.3331810-1-tomo@flapping.org>
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
v4
- Fix objtool warning with CONFIG_RUST_DEBUG_ASSERTIONS enabled
v3: https://lore.kernel.org/rust-for-linux/20260712102802.3013600-1-tomo@flapping.org/
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
 rust/kernel/bug.rs | 89 ++++++++++++++++++++++++++++++++++------------
 rust/kernel/lib.rs |  3 +-
 2 files changed, 68 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..7f4a83554c26 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -11,9 +11,19 @@
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
-        const _FILE: &[u8] = $file.as_bytes();
+    ($cond:expr, 0, $asm_tail:expr) => {
+        $crate::warn_flags!(@inner $cond, 0, $asm_tail, options(noreturn))
+    };
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        $crate::warn_flags!(@inner $cond, $flags, $asm_tail,)
+    };
+    (@inner $cond:expr, $flags:expr, $asm_tail:expr, $($opts:tt)*) => {{
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
+        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
+        const _COND_STR: &str = file!();
+
+        const _FILE: &[u8] = _COND_STR.as_bytes();
         // Plus one for null-terminator.
         static FILE: [u8; _FILE.len() + 1] = {
             let mut bytes = [0; _FILE.len() + 1];
@@ -24,6 +34,7 @@ macro_rules! warn_flags {
             }
             bytes
         };
+        const FLAGS: u32 = $flags;
 
         // SAFETY:
         // - `file`, `line`, `flags`, and `size` are all compile-time constants or
@@ -35,14 +46,15 @@ macro_rules! warn_flags {
                 concat!(
                     "/* {size} */",
                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
-                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                    $asm_tail);
                 file = sym FILE,
                 line = const line!(),
                 flags = const FLAGS,
                 size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
-            );
+                $($opts)*
+            )
         }
-    }
+    }};
 }
 
 #[macro_export]
@@ -50,8 +62,14 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
-        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+    ($cond:expr, 0, $asm_tail:expr) => {
+        $crate::warn_flags!(@inner $cond, 0, $asm_tail, options(noreturn))
+    };
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
+        $crate::warn_flags!(@inner $cond, $flags, $asm_tail,)
+    };
+    (@inner $cond:expr, $flags:expr, $asm_tail:expr, $($opts:tt)*) => {{
+        const FLAGS: u32 = $flags;
 
         // SAFETY:
         // - `flags` and `size` are all compile-time constants, preventing
@@ -63,24 +81,29 @@ macro_rules! warn_flags {
                 concat!(
                     "/* {size} */",
                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
-                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                    $asm_tail);
                 flags = const FLAGS,
                 size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
-            );
+                $($opts)*
+            )
         }
-    }
+    }};
 }
 
 #[macro_export]
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
+    ($cond:expr, 0, $asm_tail:expr) => {
+        // SAFETY: It is always safe to call `BUG()`.
+        unsafe { $crate::bindings::BUG() }
+    };
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
         // SAFETY: It is always safe to call `warn_slowpath_fmt()`
         // with a valid null-terminated string.
         unsafe {
             $crate::bindings::warn_slowpath_fmt(
-                $crate::c_str!(::core::file!()).as_char_ptr(),
+                $crate::str::CStrExt::as_char_ptr($crate::c_str!(::core::file!())),
                 line!() as $crate::ffi::c_int,
                 $flags as $crate::ffi::c_uint,
                 ::core::ptr::null(),
@@ -93,7 +116,11 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {
+    ($cond:expr, 0, $asm_tail:expr) => {
+        // SAFETY: It is always safe to call `BUG()`.
+        unsafe { $crate::bindings::BUG() }
+    };
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {
         // SAFETY: It is always safe to call `WARN_ON()`.
         unsafe { $crate::bindings::WARN_ON(true) }
     };
@@ -103,7 +130,10 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {};
+    ($cond:expr, 0, $asm_tail:expr) => {
+        loop {}
+    };
+    ($cond:expr, $flags:expr, $asm_tail:expr) => {};
 }
 
 #[doc(hidden)]
@@ -117,16 +147,31 @@ macro_rules! warn_on {
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
+        $crate::warn_flags!(true, 0, "")
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

