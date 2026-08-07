Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF723BF9F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090536; cv=none; b=BWXFn/H1xtd2aLlN0Kk2pxLIqSgm7xJom+AYXr+xzCCv2ZEcWEVHZa/8Vz2CPAqMizepSq97fUGgYk2DwCKojNr7PEb98cMU5LSPAvVJJfFNpnJVA5gSzx1blUnpa2I9gFoRcnlElzUooXLSJ7O8fku7YBOkWHkYHARf31kYpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090536; c=relaxed/simple;
	bh=jYP92RmpWS3QYPCqaEXH711zeL3zgEX96vFM9COA358=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWI+aWOnw0husD1eWtglvo4UsTbfCO+OVGMEVSdf9MMnQRN3dDRFWrJFNd0rcROQkkCNTPpCcaMLaJqfAAT0igpu6HuuwHfahEUmE/hppuUYkBTpJ+hfeK5ZFbuxHuJ4MRkDfYEzEnuvlfwJveN11AqgIjGa2TOdXm8ygybo2Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3639212b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 01:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090534; x=1786695334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9HAk9d11iCpXCg8uueq8gtnJYZqXcQYxUb+aH2sm2g=;
        b=HVoYnczqwwaxUHEGVXc4Wzr8pozIVxJyt0eoDuTlKfTNYUqTUp60CgU0cyRX48f8IN
         /QK6emOP1kUVb7CfNiImoTzuCz8tyX21Zgs0F6rLqbP4+rbrGm6n87/n298zSc7j4Isc
         QjzitUOJaPGNXLanzmN8MYLJWrdFg8Z+oPbKGn+gtiLDlmuuxUnAMYOfzwG84h6zCvIp
         f4H1D7qRyjam24bSKgTDabF2O37iVBhY/KKf7mAh0T+GFowNGq8i9TM8GQA+LBLNmYwy
         wAp43l7H1JuKA1MJ15YfepCOgx29SGG8EZ9afilzWBC4n5hQORQX9mcql5a8UlEu1mQ3
         AejQ==
X-Gm-Message-State: AOJu0YyrCCl2ltHyKyAz4ZSiW6Fcj7LrTvc9iEPeF9AzeamQqixH7eQQ
	07wqdHLME9AgkYLo2tAcPBvXF/njyNp1GOKzM8yCQv1UtnrZHhhb5ve1
X-Gm-Gg: AR+sD121+FQambP/kHbT8m10vL9Z/0J+8PODTEwcgxw3aNWAP/1UbQtahlQ8bB5RRyd
	tsALDn2JvUX1DGDZbqxHlBnNUxtk05aY9cNfDw3RxbBdLnteIXjUia6kdcjEM8jXVkd1Cv9Y0x6
	dIDd//gEp4mJFsRYwIrYBfto223MiKX1/KWehq9SPnVpUWmzbXNK/N6YS4YgW2ZH4+vvXL8LxUq
	jDKBm/kvgLKPaHNwtBf0hPDjLVxgYBH8jYt3bNYHZovjHTzRBoOysQLXr118Qq4GdKgrlst7lwE
	JDuBDxJ3q+f6BUulkg+UdCGzNFmsjy7f4V1jvnpEid64A/CbJpBvO0W3bGR98Fq/dFWYZweY/ez
	qytYILmZM5X4RuZp2zbI3mwnJygDCIvOK0PlOK0fBzZSLTZWbTBFfLLIXLfTechh9m8m/qrxqiX
	04V0w+QD1GHNNhOz4w0ysSzZd4L6dYZg==
X-Received: by 2002:a05:6a00:348d:b0:842:706e:ad43 with SMTP id d2e1a72fcca58-84f2e0ccba3mr24046789b3a.33.1786090533845;
        Fri, 07 Aug 2026 01:15:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3c948bsm630035b3a.17.2026.08.07.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:15:32 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Fri, 07 Aug 2026 16:14:54 +0800
Subject: [PATCH v14 2/2] rust: fmt: route {:p} through HashedPtr to prevent
 address leaks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-hashedptr-v14-2-817009769ffb@kylinos.cn>
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
In-Reply-To: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786090507; l=7702;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=jYP92RmpWS3QYPCqaEXH711zeL3zgEX96vFM9COA358=;
 b=61LieBydKl0+TvVTPxlGdh4kUBUOKuOgOrclqLxbIg0kLXp87LVkLQ3e1fjSY5WzQzoUmFqp5
 b9vZxVwdm/PA8bAdmXeZ+6qbPnzmiAVENr/EwRUGTeNeJSHPBVikdmH
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
index cd7d9664ff5b9..94a2d0e91f4c6 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -4,6 +4,8 @@
 //!
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
+use kernel::prelude::*;
+
 pub use core::fmt::{
     Arguments,
     Debug,
@@ -39,13 +41,104 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
+        // Use `%#0*p` for the `0x` prefix and zero-padding; `+2` compensates for
+        // the prefix counting toward the field width.
+        let default_width = (2 * size_of::<usize>() + 2) as c_int;
+        let width = match (f.sign_aware_zero_pad(), f.width()) {
+            (true, Some(w)) => w as c_int,
+            _ => default_width,
+        };
+
+        // SAFETY: `buf` is a valid, writable 32-byte buffer, sufficient for
+        // all architectures (max 19 bytes for 64-bit under the default width).
+        // The format string is null-terminated; `width` (c_int) and pointer
+        // match the `%*` and `%p` specifiers.
+        let len = unsafe {
+            crate::bindings::scnprintf(
+                buf.as_mut_ptr().cast(),
+                buf.len(),
+                c"%#0*p".as_char_ptr(),
+                width,
+                self.0.cast::<c_void>(),
+            )
+        };
+
+        // SAFETY: `%#0*p` produces only ASCII, which is valid UTF-8.
+        let s = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
+        f.pad(s)
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
+        Pointer::fmt(&HashedPtr(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(&HashedPtr(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &mut T {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(&HashedPtr(core::ptr::from_ref(*self)), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for NonNull<T> {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(&HashedPtr(self.as_ptr()), f)
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

