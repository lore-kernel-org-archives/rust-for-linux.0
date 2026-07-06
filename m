Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D4278156
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315159; cv=none; b=Kwnzg9eIsG3RIm1mrlDQpcaed2nx0NAUFGW+F4ltEcH7mlEK0PZMxYLXzH3I3jq8o5cOQMewDROb1ycwhOFCLwM06qKfiDP8O7BsW6F0x8uE3Zap25V69W+KaJ57d9Ntsh/CDFRDa5xHYSIFZ+IVOleNrIfQC+gDibHl4W0mpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315159; c=relaxed/simple;
	bh=3Bz1W83pyaisYQLkTiiVDMpcQpVcYcsFqTaZmc/GLPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PlNOi3K6mjcGwon94o+D5G1PqJRLUFFWTHz6nEjOXXZYzbTSzMe+swCwNuZJUVmFV8U9hL1Uus+pQZZvAh7kZ3N0m2wGRRpPEDv+zr9s5lNVpmckTQRov0FV28sWXqvfQD9gQGUm/Vbv2bXEpnYJrjP5R9gYd76YGcMU2DkUjOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so839702a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 22:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315158; x=1783919958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ihr6pecjt6XrybXMPyshAo9jLguaTZlFe4uVWsyidKc=;
        b=OxT7sf2aS/oK9qWOfgE0N42XwFJB1bCScQkJ27r1htIFo05VRuwKySrkYwA+ejcMuA
         WuI+OWxiUfIKhTjzVa0gpOUS8EvwwD05J/5Yr/SmJbnIiSpJYhdGc3yl1v1kU3DlzlNK
         9ATb2JdSZDy45fyA/qSjT0+aaP2SHO4ieC9BzBtLf5Y/W2vt/qFD2oCQGEUGaAtf7qfy
         zCttD9J6fPFxDfAGnNp6hvozcb+WCFFuJnmISf5dbiB/oiYlYM6CQ1cb9yLN6JZF5/xI
         rTV3vVCb5ba5fD6MzSVlEdL4fwFYnmv5vEUb7yOU9F4TWIGrXk75gNhBNObPDGKtdzVj
         h+/g==
X-Gm-Message-State: AOJu0YwY77+j2JTHeNeTLMlWK3pZUzN/o71uZZf1DEjikHXtTMgOZAxy
	NKMIkQQHyqEfZwjMOTqkwnLxwlPpuFgozqRJEttCavyzdyFbozXzois5
X-Gm-Gg: AfdE7cmAnxjITTJy2nvRfE+YW9DYgXHplR3X7Aj/I3M7EOjyCo+ya5SZcGSFTtCqe+Q
	dhOrikn38i0rn46oTsK51S83BcG59ax5S6URpu32ps/kRKMl7aTJil9Vyj/k6/CSRWGJOtuZOpL
	3qIbrjuds03pK3Tl9+RQ9b+3tb7F123OAEpicY/kaGl2+N5bhXebzmwWohhb7Gy3Qexc9/hRx5V
	2RCXGiE2C4ZZXV1VW2u6slFDmIc3NW1ZEoHzPKskoyXJ/GLthkyqmt72yea4e/8rTD1r8ol+fcE
	uj7yraoGZgJJtrL7hQ8J0Bk1cT0xFRe4I7hfvPy1zM48pnQjXivZukqHnazy3GpUzHXHoK3vVGa
	PTd3z9kJtYK0ponS0Pc0EwfVgE+eYTljy5IdQ4Rsu6VC7uQ3eaTg+T7DLeg==
X-Received: by 2002:a17:90b:3b86:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-381122ebe8emr13732482a91.10.1783315157640;
        Sun, 05 Jul 2026 22:19:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm26511081eec.19.2026.07.05.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 22:19:17 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 06 Jul 2026 13:18:44 +0800
Subject: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
In-Reply-To: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783315138; l=7686;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=3Bz1W83pyaisYQLkTiiVDMpcQpVcYcsFqTaZmc/GLPo=;
 b=ZqFv6PWz3tOWi6qjcO53lhn35crXSi3zNrYUHq3Cj9xHS6R7HLdsQxdO+E202dyzFCv68tlyT
 wBNZhJZig/UAv2P9ZQNHN+TGeBlZt3SKM/KwhewMnRPperhRY0/+esK
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
so that `{:p}` formatting uses the kernel's `%p` hashed format instead
of printing raw pointer values, preventing kernel address space leaks.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index cd7d9664ff5b9..3d154dad06f64 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -39,13 +39,106 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     LowerExp,
     LowerHex,
     Octal,
-    Pointer,
     UpperExp,
     UpperHex, //
 };
+use core::ptr::NonNull;
 impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
-impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
+/// A copy of [`core::fmt::Pointer`] that allows implementing pointer formatting for foreign types.
+///
+/// Together with the [`Adapter`] type and [`fmt!`] macro, it enables raw pointer formatting to be
+/// intercepted and routed to [`HashedPtr`] (kernel's `%p` hashed format), preventing kernel address
+/// leaks.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Pointer {
+    /// Same as [`core::fmt::Pointer::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+/// A wrapper for pointers that formats them using kernel's `%p` format specifier.
+///
+/// By default, `%p` prints a hashed representation of the pointer address to prevent kernel address
+/// leaks. When the `no_hash_pointers` kernel command-line parameter is enabled, the real address is
+/// printed instead (for debugging purposes).
+pub struct HashedPtr<T: ?Sized>(pub *const T);
+
+impl<T: ?Sized> Pointer for HashedPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        use crate::str::CStrExt as _;
+
+        let mut buf = [0u8; 32];
+
+        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, sufficient for all architectures
+        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is null-terminated and `%p`
+        // matches the pointer argument.
+        let len = unsafe {
+            crate::bindings::scnprintf(
+                buf.as_mut_ptr().cast(),
+                buf.len(),
+                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%p` does not.
+                c"0x%p".as_char_ptr(),
+                self.0.cast::<core::ffi::c_void>(),
+            )
+        };
+
+        // SAFETY: "0x%p" produces only ASCII, which is valid UTF-8.
+        let hashed_str = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
+
+        // Handle `{:0width$p}`: insert zeros after "0x" prefix.
+        if f.sign_aware_zero_pad() {
+            if let Some(width) = f.width() {
+                if hashed_str.len() < width && hashed_str.starts_with("0x") {
+                    return write!(f, "0x{:0>width$}", &hashed_str[2..], width = width - 2);
+                }
+            }
+        }
+
+        // Use `f.pad` to handle width/alignment formatting.
+        f.pad(hashed_str)
+    }
+}
+
+// Raw pointers are formatted via `HashedPtr` (kernel `%p`: hashed by default, plain with
+// `no_hash_pointers`).
+impl<T: ?Sized> Pointer for *const T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(&HashedPtr(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for *mut T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&(*self).cast_const(), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &mut T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for NonNull<T> {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&self.as_ptr().cast_const(), f)
+    }
+}
+
+// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`
+impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {
     #[inline]
     fn fmt(&self, f: &mut Formatter<'_>) -> Result {
         Pointer::fmt(self.0, f)
@@ -112,3 +205,72 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+#[macros::kunit_tests(rust_kernel_fmt)]
+mod tests {
+    use crate::{
+        bindings,
+        prelude::fmt,
+        str::CString, //
+    };
+
+    #[cfg(CONFIG_64BIT)]
+    mod expected {
+        pub(super) const PTR_VALUE: usize = 0xffffffffdeadbeef;
+        pub(super) const HASHED_PREFIX: &str = "0x00000000";
+        pub(super) const RAW_POINTER: &str = "0xffffffffdeadbeef";
+        pub(super) const PADDED_RIGHT: &str = "      0xffffffffdeadbeef";
+        pub(super) const ZERO_PADDED: &str = "0x000000ffffffffdeadbeef";
+        pub(super) const HASHED_PADDED_RIGHT_PREFIX: &str = "      ";
+        pub(super) const HASHED_ZERO_PADDED_PREFIX: &str = "0x00000000000000";
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    mod expected {
+        pub(super) const PTR_VALUE: usize = 0xdeadbeef;
+        pub(super) const HASHED_PREFIX: &str = "0x";
+        pub(super) const RAW_POINTER: &str = "0xdeadbeef";
+        pub(super) const PADDED_RIGHT: &str = "              0xdeadbeef";
+        pub(super) const ZERO_PADDED: &str = "0x00000000000000deadbeef";
+        pub(super) const HASHED_PADDED_RIGHT_PREFIX: &str = "              ";
+        pub(super) const HASHED_ZERO_PADDED_PREFIX: &str = "0x00000000000000";
+    }
+
+    #[test]
+    fn test_ptr_formatting() -> core::result::Result<(), crate::error::Error> {
+        let ptr = expected::PTR_VALUE as *const u8;
+
+        // SAFETY: `no_hash_pointers` is a global variable that is never concurrently modified —
+        // KUnit tests may run at boot (before `mark_readonly()`) or manually afterwards (when the
+        // variable is read-only). Reading is always safe.
+        let no_hash = unsafe { bindings::no_hash_pointers };
+
+        if no_hash {
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            assert_eq!(cstr.to_str()?, expected::RAW_POINTER);
+
+            let cstr = CString::try_from_fmt(fmt!("{:>24p}", ptr))?;
+            assert_eq!(cstr.to_str()?, expected::PADDED_RIGHT);
+
+            let cstr = CString::try_from_fmt(fmt!("{:024p}", ptr))?;
+            assert_eq!(cstr.to_str()?, expected::ZERO_PADDED);
+        } else {
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            let formatted = cstr.to_str()?;
+            assert!(formatted.starts_with(expected::HASHED_PREFIX));
+            assert_ne!(formatted, expected::RAW_POINTER);
+
+            let cstr = CString::try_from_fmt(fmt!("{:>24p}", ptr))?;
+            assert!(cstr
+                .to_str()?
+                .starts_with(expected::HASHED_PADDED_RIGHT_PREFIX));
+
+            let cstr = CString::try_from_fmt(fmt!("{:024p}", ptr))?;
+            assert!(cstr
+                .to_str()?
+                .starts_with(expected::HASHED_ZERO_PADDED_PREFIX));
+        }
+
+        Ok(())
+    }
+}

-- 
2.43.0

