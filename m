Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74671F63CD
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501036; cv=none; b=ogg9hIkcnm1jLrG3ZqU2t5VNCN04r7YpHyYUrCCzEM865kSSVosqtY1ky0Hn8v0huF2pb5+V7dWcTVY+9jOmBLnHnA3Wp3Ly8DH6DtrhsS3nopADzQ6AfESBj3IdwrkdJIW2aOhJZsnSzq0y7FjBZJfNCQirfIJBR/TZ2eMifw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501036; c=relaxed/simple;
	bh=BRmQasUOfm3BiP14t4WH9QTjqAZKwC5yiEgnV755ysE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARFw8UUj4F9XCX7/jvQIVyPQnlcgIeMior1jQwL2mlI/J41uCFbbg/7+1fbSwODFQEJkCSx9gCJSDWhbQy6Qz7k/M71E2AVVo35ZsaFGIEzlj5Ih80hgdXMiYoHmdgAYvxHzKWG4dAxsxRerC44SFllnFcAs7Vco/e3j+iCDRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7bced39cfso59227905ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 00:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769501033; x=1770105833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXvjsMl8Rhn/pofEHkhODwleTbotGHaU3hdcij7GJYU=;
        b=pKzKAMc67A+fATMXuOcICKjmx3S5IDt6btJlbLt69xf9ecSGbStj46d+HFF3WvU2qd
         9+6+NDRsHIN/XeXwvNvgrHIwMaB3WeT3r9JPJZzWRX5QIk06SyHILY9iEWMyL84hXkKP
         OTRJXXianc6lFmXVLAX2t3OXU+9hgwbSPQ3uBlr8Cu81Z6mDgpA8kvxs8xAuawUb7c3R
         G27XjD7iAn3ZZnREkc2tVr9onAA8S4t4bsnj/Doob01PZPf/aJ3YyV5OyWJwASqqLsN/
         bNLtUgL86cYCQhdllALifFuw16P07Wxvjm3M4sR0oyDQiPUa4Z9WIa1N7lzpKXJqoOkn
         DHGA==
X-Forwarded-Encrypted: i=1; AJvYcCUeifOAyBWVDVHgTFk91Pz4LhYZMKUhIJ21JrJlt/g83prpPXFBNbO5n7c99GOac+Q1M1mI8LyjvjNrhcSLrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIDtCasCTMxzEK61ond3A9Sz2+tRro8fZ+wyWtY+AjzOKGzQYq
	YrJMqofREMbUADEsNEk3/11oCpSpf605zrTakSNWqP0q7FC07+dd6ugB
X-Gm-Gg: AZuq6aJyR9x7VQEdRW6LyHZLWz5qtwRpDgYJjhYse+4ut1n/KZf22A88xYAX4hQho8b
	fmThzYSriBP4pNFE3Ncd9OyJQ5RueZT17tChb93D/MxFQm8sZcES/9dbBfhL8tpEUVspSr4Qucn
	vJIfh/M8OlGrrriutT75BIeCUcLECkXKFqIaNqBp7KwdtBpDxc/Muajw+EjLFrdMKxqDHGnGpgt
	lOU1J07cr62atCk25HdczxVwVkgS0f7RamsxWmZxsTRx4738c8dN0a35dHEIRGL9rNJTv34EUgB
	YfFIU0l+G+pgZ+KObpmLnJeIPytt0Z6bmji+Hs/i3r/EhhB1jP2JGy4K/EgpxqRTqZncFISTXol
	zfoFzlvzAy8cz2NUEfJy7qnaUgPMcUddKKkm8YWrxY49n0Oh/pF8HXpJoEDWynbhn80QpvsN9V4
	M98+MfILV4pj3g6jQrpW7qTIEWS8NZOWdNzaMOWLiLekLhkujh63LeRIc=
X-Received: by 2002:a17:903:3504:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a870e18902mr10018955ad.32.1769501032737;
        Tue, 27 Jan 2026 00:03:52 -0800 (PST)
Received: from localhost.localdomain (61-221-120-113.hinet-ip.hinet.net. [61.221.120.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a871ec47c6sm8821915ad.98.2026.01.27.00.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:03:51 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
Date: Tue, 27 Jan 2026 16:03:40 +0800
Message-ID: <20260127080340.2886001-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
References: <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Pointer trait and two pointer wrapper types for safe pointer
formatting:

- Pointer trait: A copy of core::fmt::Pointer that, together with the
  Adapter type and fmt! macro, ensures raw pointers are automatically
  formatted using HashedPtr instead of being formatted directly.

- HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
  This is now the default behavior when formatting raw pointers with
  "{:p}", preventing kernel memory layout information leakage.

- RawPtr: Formats raw address without hashing (corresponds to %px).
  Should only be used for debugging purposes.

Link: https://github.com/Rust-for-Linux/linux/issues/1219
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 162 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..56d505e120aa1 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -5,6 +5,8 @@
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+use crate::prelude::kunit_tests;
+use kernel::str::CStrExt;
 
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
@@ -27,8 +29,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
@@ -90,3 +92,159 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+/// A copy of [`core::fmt::Pointer`] that exists to prevent raw pointers from
+/// being formatted directly.
+///
+/// Together, the [`Adapter`] type, [`fmt!`] macro, and this trait ensure that
+/// raw pointers (`*const T` and `*mut T`) are automatically formatted using
+/// [`HashedPtr`] instead of being formatted directly, preventing kernel memory
+/// layout information leakage.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Pointer {
+    /// Same as [`core::fmt::Pointer::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+impl<T: ?Sized + Pointer> Pointer for &T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(*self, f)
+    }
+}
+
+impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        Pointer::fmt(t, f)
+    }
+}
+
+macro_rules! impl_hashed_pointer {
+    ($($ptr_ty:ty),* $(,)?) => {
+        $(
+            impl<T> Pointer for $ptr_ty {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    Pointer::fmt(&HashedPtr(*self), f)
+                }
+            }
+        )*
+    };
+}
+
+impl_hashed_pointer!(*const T, *mut T);
+
+/// A pointer that will be hashed when printed (corresponds to `%p`).
+///
+/// This is the default behavior for kernel pointers - they are hashed to
+/// prevent leaking information about the kernel memory layout.
+#[derive(Copy, Clone)]
+pub struct HashedPtr<T>(pub *const T);
+
+impl<T> Pointer for HashedPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let ptr = self.0;
+        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprintf.c:
+        // pointer_string() and ptr_to_id()), which is 16 characters on
+        // 64-bit systems. With the "0x" prefix and null terminator, this
+        // is at most 19 characters. 32 bytes is sufficient for all pointer
+        // formats including hash values.
+        let mut buf = [0u8; 32];
+
+        // SAFETY: scnprintf never writes more than size-1 characters, so
+        // len is at most buf.len() - 1.
+        let len =
+            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_char_ptr(), ptr) };
+        // SAFETY: scnprintf with "%p" format always produces valid ASCII
+        // output, which can be directly converted to UTF-8.
+        let formatted = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
+
+        // Use pad() to respect width and alignment.
+        f.pad(formatted)
+    }
+}
+
+/// A wrapper that formats any type implementing [`core::fmt::Pointer`] as its
+/// raw address without hashing (corresponds to `%px`).
+///
+/// **Warning**: This exposes the real kernel address and should only be
+/// used for debugging purposes.
+#[derive(Copy, Clone)]
+pub struct RawPtr<T>(pub T);
+
+impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        // Directly format the raw address - no hashing or restriction.
+        // This corresponds to %px behavior.
+        core::fmt::Pointer::fmt(&self.0, f)
+    }
+}
+
+#[kunit_tests(rust_kernel_fmt)]
+mod tests {
+    use crate::{
+        bindings,
+        prelude::fmt,
+        str::CString, //
+    };
+
+    #[test]
+    fn test_ptr_formatting() -> core::result::Result<(), crate::error::Error> {
+        // SAFETY: no_hash_pointers is a global variable.
+        let no_hash_pointers = unsafe { bindings::no_hash_pointers };
+
+        #[cfg(CONFIG_64BIT)]
+        {
+            let ptr = 0xffffffffdeadbeef as *const u8;
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = false; }
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            let formatted = cstr.to_str()?;
+            // On 64-bit systems, hashed pointers start with 0x00000000.
+            assert!(formatted.starts_with("0x00000000"));
+            assert_ne!(formatted, "0xffffffffdeadbeef");
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = true; }
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            // When hashing is disabled, fmt outputs the raw pointer directly.
+            assert_eq!(cstr.to_str()?, "0xffffffffdeadbeef");
+
+            // HashedPtr uses scnprintf and pad to format pointers. The pad
+            // method does not support zero-padding.
+            let cstr = CString::try_from_fmt(fmt!("{:032p}", ptr))?;
+            assert_eq!(cstr.to_str()?, "0xffffffffdeadbeef              ");
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        {
+            let ptr = 0xdeadbeef as *const u8;
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = false; }
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            let formatted = cstr.to_str()?;
+            // On 32-bit systems, hashed pointers start with 0x, but the
+            // content differs from the original pointer.
+            assert!(formatted.starts_with("0x"));
+            assert_ne!(formatted, "0xdeadbeef");
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = true; }
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            // When hashing is disabled, fmt outputs the raw pointer directly.
+            assert_eq!(cstr.to_str()?, "0xdeadbeef");
+
+            // HashedPtr uses scnprintf and pad to format pointers. The pad
+            // method does not support zero-padding.
+            let cstr = CString::try_from_fmt(fmt!("{:016p}", ptr))?;
+            assert_eq!(cstr.to_str()?, "0xdeadbeef      ");
+        }
+
+        // SAFETY: no_hash_pointers is a global variable.
+        unsafe { bindings::no_hash_pointers = no_hash_pointers; }
+
+        Ok(())
+    }
+}
-- 
2.43.0

