Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E6422530
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031163; cv=none; b=Fi43xfRwELDZdqj38sMYytdwlZKol7UzcqhOgG1iEtg5g2xaod5a1eTinaayrnn1bmLMBsP9EmfphE+cZoc2exWSHR25zopAj9XSfFBZuDqp8g/e5pnWbiIdAaBJY9rEMxSdgtxo61EV3aUBIlziLKP6dHN/CpaAS/q6PpwZ7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031163; c=relaxed/simple;
	bh=D0m146qHfZXg6BsZtb/XZwdy/tlOCcrGMtgYWm4rDNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zk6DXzVTgRL5nLcJG1Lp4fxl0KrqGRXAKpPpZAgSBUPMluzjOOipIExZrvvUGo4Eh5liAS8e2D1o1ixIPw3/i9uT7VDG1mzGS3m6KFKMutCd/8Qxj6rsZ539sJWa04vhdUuhEeJ9fQYzdQILkd6xGD67GhV/kmprS5Hxq9RWwXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=KToMikrD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YaU6XgFd; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="KToMikrD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YaU6XgFd"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 837E8140011E
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 08:39:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 03 Oct 2026 08:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791031160; x=
	1791117560; bh=+E67cCQLDNpyfo+J1OpymnVkBvMyUVuPeku23vHH4TA=; b=K
	ToMikrDLJZNdkN1t7g55y0OcaHk5/uNZyJqpD6CJQ8LqXKLY1mfhJ2+he0aWrJJo
	3vx4g9LaTw0UdD9cN5Gvv977bWrQkuv3OZPW3ugwwfTuqVqj1V4z/DYsHHVPjd93
	HqvlMlmp2WQ68v6ZNiffEJEqXhSAZTwe4A/WBqc7KkrarvTu1aEn72YJgq/JIBiV
	ELPvsNv1sPmckEOg+2HukJWF7e3UB+PWYp89MWhT+tCw96ppkPhjcwyA52QJF/DN
	eS7WGlJ/46vjFgANV+t8fKvicB/2BxCkGNo/ezoo4LwcdafL3dd0yT/nHlffEQUH
	/nyBvEdZSS5r9j1BdkyQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791031160; x=1791117560; bh=+
	E67cCQLDNpyfo+J1OpymnVkBvMyUVuPeku23vHH4TA=; b=YaU6XgFdL1GFOAeE8
	/amc3SzsnedSe39iPpg6/do0PCBtHBKklU1nJ0Btuwhh8Og+sEmsnz2Q1zB0x3sE
	m4/0bDcDtBralfo7sobLCGiE1OSAeiwjJVGYllJBO7N7UzH+PfqV580M68DJ/qcz
	B6xibE8TtzXiSOZp5xFFBiv7Supq/ipK09weu3AXkAi3a3e+JPTr5nijZm9TC8FD
	2Di86/2WAiQjGZVMGQjC9AaepH3uWRRNBl3Z699iqRany3Ec6q6kvOygq/3lNVzY
	TmDmitgHHSHhB9NXw7nuk2vHufZzOsjrvNrJrM7JAGivSdIrfuc/59iMtobvkS/C
	QDmGg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791031160; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:LP1YfLcJLZGjkzje52INCGNTQjDUOJxESd+PRBMMfD9zCDE
	0YRFgmEzaQkHt9UhDUCNXHPSRQEPHVC9jK0O/qs+vRN1Yd9hIE74H+GW0Ox8FtOw
	NDPzg+4YbPQUn5qkjfMEOWniAX6KiYUmwlBCBiOOoJOm50pYrO7OtlKfMGywnjjp
	uNl4E1xfY+6Q/ZUtKsgrTJStl2uUuEgJQZh60i/IBmbxmcxAKzAB3NifNT2gJcQR
	Sol+tKosOCm2IahIh95mUYfLmy7q8BbcbOO91Rh7GkPz63zG/OnaZ4+9jzPU/WM6
	T1NC5X/U0j5uw42Gv2DSzt3pXGi1kTiF8EFq61Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XM8N4O6bsK1uqQ2JIDI/eKNaMR6Bnb5J1MQAu7uTM+Y=:D0m146qHfZXg6BsZtb/XZwdy/tlOCcrGMtgYWm4rDNU=;
X-ME-Sender: <xms:ePfAai9hExE71_NfgwDV4eW6zaj9mpyq-OpLJNSRfe4ApFHcw24jLA>
    <xme:ePfAavEaxUh7TgYWlm_80c0BgM0DMWaQyvEuXjCNlPWy2WJMUQOiGJdjeV-YmDt29
    PVq8P2JxeoKRh-V_0NQ53rHY71fMQArRhepgqUsiEWzQCld717PzG8>
X-ME-Received: <xmr:ePfAasePCCme9J63G-RxqWffNtRZjKeneEo3_0kMPDm_uGHkUJoBeYBRR3O0CMGwcvY2wew2AZgmDEnoDLs>
X-ME-Proxy-Cause: dmFkZTGTbfV9H9iKSXjFIvwXx2JyQXFB+r32PBVFa0sA11jZh4p31tLlqygR2H7BjabDhV
    h7v45z6ocwD2dLY413VOneBHZWBnFIB9ws36oIggZHK+iE3DDayxIESCZVeMw9ekNYn9US
    YYP2CDuVwrUdq4fvr/x1TATbhsNHDT3BShzDu/SJhflgqaXDTAGCxmaPuY4aM1yX0ey7sg
    gV9yG6yOJAyaPaCU+g1a5c/JBNUCpIl7GxIhSN7PvLJQKEh4ZzyIaK1exi7ANxISwA/3BJ
    pf1lZfYjydkt10W6Pi29Gq/hWYgnrrCXhbyQTmhVz0C8rw6d2V6iLcebTOlr9ezVkQsdoP
    kHUpcywFb4f4CuvrNZthzOvHLl2+vptFMEgdWLjrGPL3PxnnpP3WlPLNp1VXhhsgHum7cJ
    aprlpApmlD8j/jQXck2X81nsVMWwDYsjFRb69namWdKcT5UFHWblDJXvsFRaHgcVibECZ8
    VzEYS7QTr+1cp4x3XHCuFMuIYjvQx0EuRHKfUW5kNSYLtpXA659NJ2GugV3q0Ea9e787Bj
    6J5go/cgS9e5h2hB4FII1t0tiXIFyOt6GwOvpDLz8KhRn9DK8VsNLPKizMLOkUohtX/4DI
    Guls9wOom4bDJfwU0+efmCTYifMgMals78GcVXb1Q9LhD+sv90R/BKzLYlbw
X-ME-Proxy: <xmx:ePfAaokWe84oM0anvacdcKNHJJqIkej6P_0VywfYXZCPsUHiW5yphA>
    <xmx:ePfAajpOusE_Vn2Ftz9X3qNUTgt_9zTjGmWPPhPCPYSscHt7Ad-V0Q>
    <xmx:ePfAatGOemMEgJLPAtXFirGyR_0Z7ivmzeaTZPqnqHX5Tb5-x_ruJA>
    <xmx:ePfAahSaVfKjOzrPdRMTxtEndkSioL7v4texUzDXFPa59ZBvRAjCwQ>
    <xmx:ePfAap3L8n76yKVcRLJtTSdxfzDNNZM0FobBUL_Lk_fBx1TxtTOZLMyM>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 08:39:16 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
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
Subject: [PATCH v1 2/2] rust: bug: add warn_once macro
Date: Sat,  3 Oct 2026 21:39:03 +0900
Message-ID: <20261003123903.113572-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003123903.113572-1-tomo@flapping.org>
References: <20261003123903.113572-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add `warn_once!`, the Rust version of C `WARN_ONCE()`. It prints a
message and reports a warning the first time the condition is true,
and returns the condition every time.

Like the generic C `WARN_ONCE()`, use `do_once_lite!` for the once
state. Add `warn_printf!`, the Rust version of C `__WARN_printf()`:

- On architectures where Rust implements WARN with inline asm (x86_64,
  arm64, riscv and s390), print the message with `__warn_printk()`,
  then trap, as the generic C `__WARN_printf()` does. x86_64 and s390
  have an optimized C version, but Rust uses the generic way for now.

- On UML, pass the format to `warn_slowpath_fmt()`, as C does.
  `warn_flags!` now shares the same call.

- On ARM and LoongArch, add a `WARN()` helper, as `warn_flags!` uses
  the `WARN_ON()` helper there.

`WARN()` is a macro, so Rust calls it through the helper. A C function
cannot pass its variadic arguments on to `WARN()`, so the helper takes
the format and one argument. Rust passes "%pA" and a pointer to one
`fmt::Arguments`, as the `pr_*!` macros do.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/bug.c |  11 ++++
 rust/kernel/bug.rs | 129 +++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 130 insertions(+), 10 deletions(-)

diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index b51e60772578..e5973e3c8aaa 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -11,3 +11,14 @@ __rust_helper bool rust_helper_WARN_ON(bool cond)
 {
 	return WARN_ON(cond);
 }
+
+/*
+ * Rust uses this only on ARM and LoongArch. On x86_64 and s390, WARN()
+ * needs a string literal format, so it cannot be built there.
+ */
+#if defined(CONFIG_ARM) || defined(CONFIG_LOONGARCH)
+__rust_helper bool rust_helper_WARN(bool cond, const char *fmt, const void *arg)
+{
+	return WARN(cond, fmt, arg);
+}
+#endif
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 569dc05d75ad..f71ff3bc7b95 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -82,6 +82,62 @@ macro_rules! warn_flags {
     }
 }
 
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(testlib))]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
+macro_rules! warn_printf {
+    ($args:expr) => {
+        const PRINT_FLAGS: u32 = $crate::bindings::BUGFLAG_NO_CUT_HERE
+            | $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
+        let args: ::core::fmt::Arguments<'_> = $args;
+
+        // SAFETY: The format string is null-terminated and the `%pA`
+        // specifier matches the argument we are passing.
+        unsafe {
+            $crate::bindings::__warn_printk(
+                $crate::str::CStrExt::as_char_ptr(c"%pA"),
+                ::core::ptr::from_ref(&args).cast::<::core::ffi::c_void>(),
+            );
+        }
+        $crate::warn_flags!(::core::file!(), PRINT_FLAGS);
+    };
+}
+
+#[doc(hidden)]
+#[cfg(not(testlib))]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+pub fn warn_slowpath(
+    file: &'static crate::str::CStr,
+    line: u32,
+    args: Option<crate::fmt::Arguments<'_>>,
+) {
+    use crate::{
+        ffi::{c_int, c_void},
+        str::CStrExt,
+    };
+    use core::ptr;
+
+    let (fmt, arg) = match &args {
+        Some(args) => (c"%pA".as_char_ptr(), ptr::from_ref(args).cast::<c_void>()),
+        None => (ptr::null(), ptr::null()),
+    };
+
+    // SAFETY:
+    // - `file` is a static null-terminated string.
+    // - `TAINT_WARN` is a valid taint number.
+    // - `fmt` is either NULL, or "%pA" with `arg` pointing to a valid `fmt::Arguments`.
+    unsafe {
+        bindings::warn_slowpath_fmt(
+            file.as_char_ptr(),
+            line as c_int,
+            bindings::TAINT_WARN,
+            fmt,
+            arg,
+        )
+    };
+}
+
 #[macro_export]
 #[doc(hidden)]
 #[cfg(not(testlib))]
@@ -93,16 +149,17 @@ macro_rules! warn_flags {
             _ = $flags;
         }
 
-        // SAFETY: It is always safe to call `warn_slowpath_fmt()`
-        // with a valid null-terminated string.
-        unsafe {
-            $crate::bindings::warn_slowpath_fmt(
-                $crate::str::CStrExt::as_char_ptr($crate::c_str!(::core::file!())),
-                line!() as $crate::ffi::c_int,
-                $crate::bindings::TAINT_WARN,
-                ::core::ptr::null(),
-            );
-        }
+        $crate::bug::warn_slowpath($crate::c_str!(::core::file!()), line!(), None);
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(testlib))]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+macro_rules! warn_printf {
+    ($args:expr) => {
+        $crate::bug::warn_slowpath($crate::c_str!(::core::file!()), line!(), Some($args));
     };
 }
 
@@ -122,6 +179,25 @@ macro_rules! warn_flags {
     };
 }
 
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(testlib))]
+#[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
+macro_rules! warn_printf {
+    ($args:expr) => {
+        let args: ::core::fmt::Arguments<'_> = $args;
+        // SAFETY: The format string is null-terminated and the `%pA`
+        // specifier matches the argument we are passing.
+        unsafe {
+            $crate::bindings::WARN(
+                true,
+                $crate::str::CStrExt::as_char_ptr(c"%pA"),
+                ::core::ptr::from_ref(&args).cast::<::core::ffi::c_void>(),
+            )
+        }
+    };
+}
+
 #[macro_export]
 #[doc(hidden)]
 #[cfg(any(testlib, not(CONFIG_BUG)))]
@@ -134,6 +210,17 @@ macro_rules! warn_flags {
     };
 }
 
+#[macro_export]
+#[doc(hidden)]
+#[cfg(any(testlib, not(CONFIG_BUG)))]
+macro_rules! warn_printf {
+    ($args:expr) => {
+        if false {
+            _ = $args;
+        }
+    };
+}
+
 #[doc(hidden)]
 pub const fn bugflag_taint(value: u32) -> u32 {
     value << 8
@@ -159,6 +246,28 @@ macro_rules! warn_on {
     }};
 }
 
+/// Report a warning the first time `cond` is true, and return the condition's
+/// evaluation result every time.
+#[macro_export]
+macro_rules! warn_once {
+    ($cond:expr, $($arg:tt)*) => {{
+        let cond = $cond;
+
+        if cond {
+            let warn = || {
+                match $crate::prelude::fmt!($($arg)*) {
+                    args => {
+                        $crate::warn_printf!(args);
+                    }
+                }
+            };
+
+            $crate::do_once_lite!(warn());
+        }
+        cond
+    }};
+}
+
 #[cfg(CONFIG_RUST_BUG_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kernel_bug)]
 mod tests {
-- 
2.43.0

