Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102823392D
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905670; cv=none; b=PRyF6kPH7OGUkhboQ1gzR9S+Nk0w5TiPAAgKP4dnFAgBvV8vQjc6GbjmU8aAbh7Vm6fXe5+E/QHe6RcVn2v30acjeO3VYtmKQHQ/h5ya7Ykr4eJp/BzXvGe+j1Sd9fQhGXZ02EWrJ1YzT7ummqEqxcXjKofp/YQ1wbtyESAFoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905670; c=relaxed/simple;
	bh=DPdu3pJVEUwAJ71acm/LHxruFuaLM/Xgx6UVmK0AT9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gm8n2QKWVseTWfd5AytNjnDq0nvDDeKO2kjOLl3QtIwQk5mxfBx7TOMTkrBgszOvpj1O4oy7ga+SLIAMc4D/e2jGBIdB+MC2e8nxYnvT9IiwRbDmdq/5yYAlR1E9GV60HydLyKhmLAZ75H+YegHsBMax6VL/OkiLB7lnoXl8rjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=fq+PTczA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lr7wA8it; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="fq+PTczA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lr7wA8it"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ECA321400151
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 21:47:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 21:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790905667; x=1790992067; bh=hbIyRtTdJRkJqSu6Gqw4q
	Pd1cYYI3rJ5fFh8sQXTFRU=; b=fq+PTczAnKb/nc6BJ3RfKqn9PKeYMy2hMg/i4
	3gph9zax/e9m7Ain1+Hxt4l3UiXUGKAZhMwWBXE9rqMGbFBNEWStwcGzkkjQWo3y
	8AKO8ZyiDDZikw9U97+/pMIKDmnDheN9269RdZ7EVLPN4oa9fzdT060MZJ+m2DFb
	XgK6ZPaEe1VsGZSZ9SVGifXhRSlgImJVo8p48kqwLJQwuhCoOYFpECBhBk4qyW3S
	DmoiWzo3HRqbCCaNcqbG0JinrUZcDzYPXUF50nx6p6nwtTBenoc6Tl4L48KC8ylo
	Dy+r6SOKpKhJUgqUotCJ5XUvZwJRcZW6Zh4lYFF7TjPDQwT+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790905667; x=1790992067; bh=hbIyRtTdJRkJqSu6Gqw4qPd1cYYI3rJ5fFh
	8sQXTFRU=; b=Lr7wA8itvbS9I9UwD0tOqtcKHXeb76IOJ8p745Wu0Z8H0L5iHMT
	dE5XG3VAw+L0/aSxP051gIQA7dhxhnppdxMq8mGysGk/Hd8KYQuCFL8wbOpN6Fwr
	+hJrBFC/BsdV+XwubLpo6qjIcUI0B+mHGTdpnq72JLpTN3OCVmfh5GxcyZaUkJuY
	dpybZ+kiSEpVIWQRAcOdkcZS1gTe4HbMtMRHvuVF3hdU1HoUMSO8jdwUDt0rP4Dx
	YS9TJ4tONn7+h3+inoZXWMNCDqi+aanLm5IvlBwKxD1sNNWxWWepG12aLCTbFPqK
	Sfc3V1va3kXjsoTOaNegqQVs5hMqJsTefVw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790905667; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:hozrLR6yXBHhLcbr5fyCQKL4aunTEOK7impJErObuINZiNI
	1ce4PqrWNwbOAh3ZVq1wY1vxc0fhlse8TWT5Ma9oizkCpaf+fxk9w7aHVRzi3xfJ
	N/LWXY8nlpbITZGhuEbaZr4Fa0hhcGPNYRAdiX7Op1c3wYNwDcn+W4Dev2Ml/rN5
	GPZPP/6eHd8CbEOpkFM51spzZoWCpHrJ4jkmy3UUV4mb2ZdBjwd8mV0cLtvDDgUH
	MmENyCZtHd94J/qV8q6jp9P4LZaWvhhljvvv8C/dcd+qIchs3WG+EveCyQZudrqv
	B5J4rYRT+uFWBocv++iVIzdzQxHGNOBSWo75SDw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:g9tgzLcknEQDZJ6RKTbNUX7LCyIgKLoZJ+XH28U0gfg=:DPdu3pJVEUwAJ71acm/LHxruFuaLM/Xgx6UVmK0AT9I=;
X-ME-Sender: <xms:Qw2_asdb2UUpR_nJLSHqdOCGSamy4iBIDBmUjaLWXngR2xy6bhVwLg>
    <xme:Qw2_aqldVXR5qavXaku-lZIKTkqAVt7kiVyNqZ7jlT3NzSTo2M3CCVauMgu1x1tjS
    G0-VpXiLQG1UAY64vMM_DeOHqxi3AACzRBItxM99_M0jzwADKxlC2M>
X-ME-Received: <xmr:Qw2_ah9IBmPdBuesNo259UdFtGw67kR69XGeWFwUVmhrmfGh2_oU66wOSE6wHgZvo1qyMGgaO5b7d3S0-yo>
X-ME-Proxy-Cause: dmFkZTGzGU0R+rjgEKU6+cCDqH+hH2IIPZDWGUS+km5KMCtkUAp1Hq+NaZ3RttrbMMDyPu
    OytvIrfVvBuGizxwtyQohjmaFYfG1f38wRg4+e9eGPcdfuH7CbKxRX1s0tpB4028agKaYV
    vUE2BkUkVtoEnmPpDrq24URLTdBl8FS3RLfkM9rViw08t5Numk8VEvNO28amQgkX5GXcl9
    z48GXANEXm+eEjWYDjCB+DsiFXO6y0ea/yFGzQ2PRFH4J8dBC6dwjPxER6sCkkgXHGcVAw
    B6CXhVQhD6Liw1HqQt+XWcQWREyfWxuldXa20Z5aVXsYZRb67wWmkb2o9Z4La7Kz3gWsrd
    IRJ43ePxI4dNf1HTbH6i7gS77gDJzD+mToIew+fF7OSQ5ebkEfec2RogU4t56ch4N7V85E
    asGmWN+ZsGx5Evbc/09noBnz3KtyK+zHb2j7iYtQnmQ86nyt4/fyfhxbCP7p6PjQ6arbLw
    OHLsBYG71XP73YnqhhizE7yGy5okIN7pLUK7TVpmMEEK/P7UfVl2mxgrF7drC4xq/5X7YJ
    erZXCmljC7nOSLXovuLxl1+4RM6RVZoq2pqOGRnQ6HJLw6CguBBkOLQuEOKB+2BdKdxZkD
    kCdyUT0aPBbp/5AfZp4LeJ3e7FqZtk0SLa01fZ7LXIbGtTzmSGqwq/slxCVQ
X-ME-Proxy: <xmx:Qw2_agGkQbTgcfzK-eU3dgQSlr16f8hCcS_7nwDlASypn_Iku8Hkwg>
    <xmx:Qw2_alJa_nT0P-yjXGqPLH_9Zb0qxubbubAR03LX5PFMMtfhu_98xg>
    <xmx:Qw2_aglFcdATVYrfExfwAaJdgmXiPH1E0GkVqWWWlK-EmGB3GGpl7g>
    <xmx:Qw2_aux_t4pUuLnEbkr5MMgJgWilzVmPxoTPzU0cUsyHcYcPAV_zaA>
    <xmx:Qw2_atUijZqZbJstpQzZnrNyGpkmUjRiX-svHpS88YD_lF6HTz6e8LbV>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 21:47:44 -0400 (EDT)
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
Subject: [PATCH v1] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
Date: Fri,  2 Oct 2026 10:47:39 +0900
Message-ID: <20261002014739.2566289-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

When core calls one of the stubs for builtins that should not be used,
the stub runs a trap instruction that prints no message, and the Oops
shows a wrong name. For example, when __rust__udivti3() is called on
x86_64, the Oops shows:

  Oops: invalid opcode: 0000 [#1] SMP
  RIP: 0010:__rust__adddf3+0x0/0x10

The stubs call panic!(), but since Rust 1.79, rustc does not allow code
in a `#![compiler_builtins]` crate to link to functions in other crates,
and it silently turns such calls that do not return into a trap [1]. In
addition, all the stubs have the same code, so LLVM merges them into one
function.

Replace panic!() with _printk() and BUG(), as the panic handler in the
kernel crate does. These are C functions, and rustc allows calls to
them. Each stub passes its own name to _printk(), so the stubs are no
longer merged:

  __udivti3 called: `u128` should not be used
  kernel BUG at rust/helpers/bug.c:7!

Link: https://github.com/rust-lang/rust/pull/122580 [1]
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
Another option to fix this is moving the stubs to a normal crate (not
`#![compiler_builtins]`), so that panic!() works as usual.
---
 rust/compiler_builtins.rs | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd5..9416ca4c23f5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -9,8 +9,8 @@
 //! At the moment, some builtins are required that should not be. For instance,
 //! [`core`] has 128-bit integers functionality which we should not be compiling
 //! in. We will work with upstream [`core`] to provide feature flags to disable
-//! the parts we do not need. For the moment, we define them to [`panic!`] at
-//! runtime for simplicity to catch mistakes, instead of performing surgery
+//! the parts we do not need. For the moment, we define them to print an error
+//! and call `BUG()` at runtime to catch mistakes, instead of performing surgery
 //! on `core.o`.
 //!
 //! In any case, all these symbols are weakened to ensure we do not override
@@ -25,13 +25,46 @@
 #![no_builtins]
 #![no_std]
 
+unsafe extern "C" {
+    #[cfg(CONFIG_PRINTK)]
+    fn _printk(fmt: *const u8, ...) -> core::ffi::c_int;
+    fn rust_helper_BUG() -> !;
+}
+
+// In a `#![compiler_builtins]` crate, code cannot link to functions in other
+// crates. `rustc` rejects such calls, except that it silently turns the ones
+// that do not return (e.g. `panic!`) into a trap.
+#[cold]
+#[inline(never)]
+#[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
+fn intrinsic_called(name: &str, reason: &str) -> ! {
+    #[cfg(CONFIG_PRINTK)]
+    // SAFETY: The format string is NUL-terminated. Each `%.*s` takes a
+    // `c_int` length and a pointer. `name.as_ptr()` is valid for reads of
+    // `name.len()` bytes, and so is `reason.as_ptr()` for `reason.len()`
+    // bytes.
+    unsafe {
+        _printk(
+            // "\x010" is `KERN_EMERG`.
+            c"\x010%.*s called: %.*s\n".to_bytes_with_nul().as_ptr(),
+            name.len() as core::ffi::c_int,
+            name.as_ptr(),
+            reason.len() as core::ffi::c_int,
+            reason.as_ptr(),
+        )
+    };
+
+    // SAFETY: FFI call.
+    unsafe { rust_helper_BUG() }
+}
+
 macro_rules! define_panicking_intrinsics(
     ($reason: tt, { $($ident: ident, )* }) => {
         $(
             #[doc(hidden)]
             #[export_name = concat!("__rust", stringify!($ident))]
             pub extern "C" fn $ident() {
-                panic!($reason);
+                intrinsic_called(stringify!($ident), $reason)
             }
         )*
     }

base-commit: c82c75ae11fae66cf070562f9b5241a4663f30cb
-- 
2.43.0

