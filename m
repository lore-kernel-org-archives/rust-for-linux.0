Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CD4A13B7
	for <rust-for-linux@vger.kernel.org>; Fri, 15 May 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859286; cv=none; b=H1NiK6ilLFIF3cvz0v6wWdqFyZWeHiTx/rf2uf2lU2e8Wjwuc1CIqx2bUyfpTJQGk8bw76VHuBWEUk0DeTPckRhI4zqzr0E3a8/im6eFJtMwI8oY+hSnW1WCIt0aA87IbbVzGLmGiiYofyU+6riVU0fUWNaMjyVA1hVAgcaonTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859286; c=relaxed/simple;
	bh=Cw6RB2xwVNg60bZMSn6gOJDFl2hX8Itoo8qTAGoCjVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iIQ8SgyWeHyw8K07yyRVr19i+P6VG6m04ApQXP7sKkVcavXNjAB+B18cKltxaln29BUBEDzOZa7o4TsMlKal7rA0/L7nZ4GoNYbtrB7WM1xrhrDEVerFKK36OQWXflG0fdVMOINs20HIiL4Z87Fsjzj3sT7rkOa1ye2jKNNrIHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b9e9a6802aso38732795ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 15 May 2026 08:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859280; x=1779464080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2GlfldTJ1NCqqJtuo6DGIIhZylBNgZDx9CMfiWKh6s=;
        b=mLELn8AbDAFYrMTFNR2CqCopw8OZUgGhgRSrnwr4YW+O2k3/tCgWQ1vfYU7XIKoMgP
         6TeEeIRACPIgxBtMz2HyE7dfg/gMPVCmJePFbv2PtdTNWnrHZNya0FlWTLifDyGyCrWT
         PzJUOvGUU8NoojkiJiZZofDmnCw6WWpznLTmsKeRr5M5plZomO50KYFO0fdIcfZXaia4
         LX3tyYtT6D4yulDd9xtrt+MQ9c2Wy7wvCiNXmDsZqHF9w4/84u2kcxAR108xG4BTIuUz
         KJGnaWAbHFRvQND9sSS3J0a7FFJNCXq42JbR2OcVsdj6e+DAybn+g1revKfPvfPv3xW8
         acLg==
X-Forwarded-Encrypted: i=1; AFNElJ96yDc+DtGZOMO6S7c2dxuwSjRryWFqBSaIHW0j/qEobL1djb8VWhtlWPmXsE9gFjXZf/OCwEPLDPHsCheV2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrK/YqyekHUzXLFcHUkB48FfBTxgO1ASv04yyZ0krcRnk0Okph
	TfwOs15DFyVFlnyepuYplD1spclVdnnsyPXRDH75dj6A7Bf//LPhOIxS
X-Gm-Gg: Acq92OFF0z44uB7k/jDCe5licBvjZljwFToga75jCl7I7jWUdvb/Jkq801HsmhYyscp
	ShbB7m29hNQIu+HoGOC20FM5RZAJD5XLz6zDLSiAPD4gT77dzRfS+isjFG83CrC27v67QFP/izq
	HJCWkie8Ldb/xqQ2AysJHG5BFooObsNeX2CaFskiPsPEYXGl+zGiYBdmFt4XV1unVadEGjDHCvm
	8kLu9MzhUq0XeOOeq87I69YPaRE3t0AG8xkLjZDyC1X0wa54mvcXWCWTQkzPaRR2lCchPTHtQN6
	iCUs5O4p9MLUHeQ8+uWg8TEhaUTZOy0D9r49CY19PMN9ycgRLfiMU0o03I7kQMzn0h6eKVE2pMh
	/FvDuCC4WTFCX5u17V5IoDTntkSOUH74nveyOgOoACl/ZuTEfhYaQy8oUCCZvFV5Tn/RwnwbEaD
	1p2H8b
X-Received: by 2002:a17:902:ffd0:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bd7e8786bcmr50021235ad.18.1778859280012;
        Fri, 15 May 2026 08:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm67339195ad.82.2026.05.15.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:34:39 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
To: sunke@kylinos.cn
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH] rust: fmt: route {:p} through HashedPtr to prevent address leaks
Date: Fri, 15 May 2026 23:34:16 +0800
Message-ID: <20260515153417.4010898-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512-hashedptr-v12-2-61d5c7786889@kylinos.cn>
References: <20260512-hashedptr-v12-2-61d5c7786889@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
so that `{:p}` formatting uses the kernel's `%p` hashed format instead
of printing raw pointer values, preventing kernel address space leaks.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 166 ++++++++++++++++++++++++++++++++++++++++++++-
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

