Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256EC30BBB9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763410; cv=none; b=gS45Q33caK9D/u6PVQeql4D2HbQTHyCWb4V9oX8oMWEa3zyJ2bVos4Pv8LbjCIFrrNvVEGbqddTm7c5AR2YMnqJibFCl5cbFun1PDgact58pLpFRaw/kDEtOVoZt/qOY23Sg4knov4Wt2zJBuNF0Wc3N0oUruDnLW7aiXcEk2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763410; c=relaxed/simple;
	bh=3Bz1W83pyaisYQLkTiiVDMpcQpVcYcsFqTaZmc/GLPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gedwPRMZNv4Ql2n/UlN0JSgSeCv/mV2j12oOroH32WPzivItb4kqIAoF2JpTpf/E89WEavIey7qBi6ViRa3yIMqnuG9g2DfNnzsw4uqeL1kmFIhE8k5bjVrQrL2t0EMc7rJVSXrJyLqKAWhYEgflM7htQ/IY7J+q5okIWAKXSc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3698e34a567so9315076a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 19:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779763408; x=1780368208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ihr6pecjt6XrybXMPyshAo9jLguaTZlFe4uVWsyidKc=;
        b=DLV4xzExJzB1IoThPX2w2Ab7ZuGqZt+9ePt6BvAhrFvXkV+SuNLbjnyQZd2WHN4g/a
         5TVQitRrMmdstRL+JOn+QaRCoyVjImY8j9vInxtXtTxLRmY0tW9mNR26fe0ExWCHuKiR
         DU7+Iy8XRBb0rf8xD7ywRvbpbqv9FBC4gbnPRed1Ks/tb85BwxJL+7JxUK7YwsyHaRGI
         MVwA5K/wrencxXLBfcbOS4He8cyalMob+YObvh/nZ7foslr4haptnZWua10+anU4X/PL
         9UkVYlPsUQh090YEthNvx5FTjTpb92gtWZ8G+BfxOGIsPCkizobXLU50Swrdq4tLF5jp
         ZhYA==
X-Gm-Message-State: AOJu0Yy3KntSHmhxpH5bBj66pih2WvUTSpGUcqcppUYGg3ToKgp0ovC9
	JvXwo10XK6Kf0O1trnh4zW43BNGq4u44mHRHCcm7waFDS7toCaHTW3Lg
X-Gm-Gg: Acq92OGMyuhBCBoHrlQ8im7M/XpgLirRh3z7x3m2gO/lVxwtNVOy0bNDF2mbClgWroX
	Y/BnIeoIg5grGiv5pgUckYyHbLbcfH/lEr7IJSqP8xOxp7IxUcyt2Q2ftqJaQ/AremizbptquCc
	zb76gE5Dtif4SuYLwVIt0I86BVM78IeMB39q0zmIvZT6bqOY/CaS3y4CyTO6egc3skSonPB1Opz
	UvXDYmQOfd+oym/b+Z7bOY4Phfgibif3+OMpAJBQo6AOOyEUFB4RXpSC8B1KX0FfvM4eDsUe/Wu
	rZOTmdca+3dA+ph1hvcwr8/feZVwFc0ceoDoR68V6o3LMwkNfgNHe6MYVzEQIo7D2LXCxcnc9oy
	4fOSVEp7tk0zAc7723DgYT2BO0FPZyOGSFuDxRZexOib2uSVzZbkY/mASEqvMw9Euerc=
X-Received: by 2002:a17:903:2ece:b0:2bd:eeb6:ff22 with SMTP id d9443c01a7336-2beb0390b36mr201048235ad.7.1779763408229;
        Mon, 25 May 2026 19:43:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm99551665ad.17.2026.05.25.19.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:43:27 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 26 May 2026 10:42:49 +0800
Subject: [PATCH v13 2/2] rust: fmt: route {:p} through HashedPtr to prevent
 address leaks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-hashedptr-v13-2-324352716eb9@kylinos.cn>
References: <20260526-hashedptr-v13-0-324352716eb9@kylinos.cn>
In-Reply-To: <20260526-hashedptr-v13-0-324352716eb9@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779763387; l=7686;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=3Bz1W83pyaisYQLkTiiVDMpcQpVcYcsFqTaZmc/GLPo=;
 b=isIdJUrRam+JF2yWlVem9AYutkgYGafJoaBPSHYf8bKeIRCDRy5HjFl0NLaDZ7uwUdJ/0hpGA
 HPDVkf/EBYJCW5Y9RSjpuRbWWByA3iOUvPoGycLW9OsaADX8d386P/J
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

