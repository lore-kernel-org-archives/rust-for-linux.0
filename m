Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36763357CF1
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343768; cv=none; b=DrPZI8kRp1y8ta49/JNQcTV+rB67docXbdFDxveacRymeL4iaF2K/Kg3XqkmuHQyJq8Xm2Xkz8KybwILrUsjB7CDqT52TD05D3nSiH3vwaV2i7u6IV658EZdW2FgFC4xj3iu+sMlD8HjveXDDYdZzeBKoPRjpLjmHlEnn7xjWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343768; c=relaxed/simple;
	bh=kUrNN1MCEpube6HIfSjL6hHn6Vd2yU7GAqY6J5k0siA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkhxM0MqGKbjPlVsepeZO7OavzWZdNDzFWMiIfJazBXeLHdXRAcFXQ03Kwv0W+JIOrzzarpKeobfuowznR2mf8Lv4Snqjak4rX5geA0VsMYLM4wy/pkE225QPnoexyN75OAxsX1Xc0iybwjEDHDfI5DMpD7si9dt5jqBRsuBOqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc73e322dbso14997645ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343767; x=1786948567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2LmN1zOk2qFWlLApU9LvAq04w/CR0Wq6Sk/uEX2NKs=;
        b=rt7Q5sxmbrR8UCVfpoVKmJLkHYE9Eueq5TtK63MmrVee8Es7dAGG//FctRI7En8Owm
         B07wUpLHcIi902GrnuvjztxLNWc6xjE0xRwA2pGOnDrviJBxI2BIc6YzCrV74oQXVxeO
         XPKNIpfLio+zpwldO18gel0NAiXxrrPP3UgM+CmVmtQeLssoqQu/pNQwaAuRW32Vay2y
         SfTIIJb9R6ON9DHG5sT8TRaaGVQhRuG2wQU2lcXuX81Xvc37BH/noSjwgQg/AxqOETEM
         zqqkLVI0Q6CBj1wO3FJSnIYEZIIxdlAtV0rUhS7PlEBOjE5yYT8e3Mm4ETNnNC4Zbd8/
         yMDQ==
X-Gm-Message-State: AOJu0YzMGuYivZV6c5hSY9PFMhlwK4oMrpaR4kmq6+Qsy9dEGVGoDYAE
	mTMPdvz1HLUKZ/mzZhr1p1nH7f3hnnGm+jxJscEMo+VXa2kFWdM2P4wN
X-Gm-Gg: AR+sD12vVF2KDhtRKJSpRdi4vQkvXxTSDmJQ8Pa7H/1KiIMgrYpY9f2DkmwLuKgyC07
	5Is+me/AF6qPsIh+vX0fx3e1JsfLV/kGjdHK4UuU4bECwdZMvg3uxO1sQvctjkGAJfzd0TymKXv
	6x8qs8AUgeoTLERhRx1ZhdGP/2Nk+v+yqtUXiFwmif8JE05A7kvL9IgPz7Ahv4Mic0uCMfP+wsZ
	uZUN9x8XpF+caDCTzHxkDOxuolD7YX5LNevQagg3cyvBCQELjdmt6PftF79R2aU5Z0rEs+me2ns
	qDZ+LPprjpPWHJhj3GUf8hzqB17H5jqHWSvVN6GoC0r1R16V401MqEAMExiWL/4K1sn7TEKPWwZ
	0th081SmTqm7d7V8bUzjAwNQ8MIXo76EFPdurL3Cxl5IP0jfUeUw3/6s9Q7nbPqOaQUj4+0LKCm
	CD6tAbVxrhQwY7XQpakY8S7QCb0RYp1g==
X-Received: by 2002:a05:6a20:6a08:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cb85f44592mr44063523637.24.1786343766469;
        Sun, 09 Aug 2026 23:36:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm46754021eec.28.2026.08.09.23.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:36:05 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 10 Aug 2026 14:35:43 +0800
Subject: [PATCH v15 2/2] rust: fmt: route {:p} through HashedPtr to prevent
 address leaks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-hashedptr-v15-2-eafd27d36476@kylinos.cn>
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
In-Reply-To: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786343747; l=8433;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=kUrNN1MCEpube6HIfSjL6hHn6Vd2yU7GAqY6J5k0siA=;
 b=4uM9hUyBvbCrV57oZqnBWnHQXgX8dCnztAPt6DIwJ7o2CgQr9xBshWM8ZDqiaY6wOOcHRDmGE
 alm6n+QycTYDBMXbDiIuMO1Nzc7PNImv8/ZnvR5swmLqlq5AExZh2E2
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
so that `{:p}` formatting uses the kernel's `%p` hashed format instead
of printing raw pointer values, preventing kernel address space leaks.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 182 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index cd7d9664ff5b9..6f7cb657bef7c 100644
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
@@ -39,13 +41,110 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
+            (true, Some(w)) if w > 0 => w.min(buf.len() - 1) as c_int,
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
+
+        if f.sign_aware_zero_pad() {
+            // The kernel handled the width and zero-padding already.
+            f.write_str(s)
+        } else {
+            f.pad(s)
+        }
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
@@ -112,3 +211,82 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
+        pub(super) const CLAMPED: &str = "0x0000000000000ffffffffdeadbeef";
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
+        pub(super) const CLAMPED: &str = "0x0000000000000000000000deadbeef";
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
+
+            let cstr = CString::try_from_fmt(fmt!("{:01000p}", ptr))?;
+            assert_eq!(cstr.to_str()?, expected::CLAMPED);
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
+
+            let cstr = CString::try_from_fmt(fmt!("{:01000p}", ptr))?;
+            let output = cstr.to_str()?;
+            assert!(output.starts_with("0x"));
+            assert!(!output[2..].chars().all(|c| c == '0'));
+        }
+
+        Ok(())
+    }
+}

-- 
2.43.0

