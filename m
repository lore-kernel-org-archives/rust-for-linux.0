Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CEB3BF69C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218813; cv=none; b=F7xq2IF+odGsnJR1fcl8vlXyFpVjy1mThvVjoSB/f+enJhjI37KojkfTLtUuRZl4Rio5ADACYWpT8hZ3hZqO7N7k2tw6/BdnI9woSko+viMn4ZLdj/7g+6KrMeA2VquXN5KgJUhIzjx8Dv5h8yYJfR3AAaQjPyLK+dYO1YMbFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218813; c=relaxed/simple;
	bh=ptAcM1gM58Nm0V37+Eq1edqMJKZWrADPfv1pNEPRI8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C+KDOnhk8QDhgL1YRcWPiMpGo68WbTi1zVD6rCXdfbBKBCMA8Z08b88UUq55QjqpyQUQKjJalX0A0lhfmalIEWmwfD27pGaKgOb0V1JiajDMeJdHD6aF5znQCMiCIxVUFv9pVAFqHkZVhN9uJSbnIYZ4m9LJ11rwYMv12AnUMCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70f91776fcso5909009a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 01:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218806; x=1773823606;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE7NZfN8SYBkdlro3Yz/WBuY2L67Vpyed03RGLeB47w=;
        b=NAVJIL6gx4yj0YEbTl0HQWicwQRSH66xNZOq++uEuP1UJeBpDzhmVaH2X88r5YM0ua
         gBPLZt0SnZ6+iUUPr0h3uklHN9PmZIPLp9SbvKtcMcVlGmQgVYKsjEicrNCHfsNNGaAZ
         ayV46v7FIX7e/h+IChxXXmv3NHIyeSc/OdlMLTT8fcW7ZQwDMvC3LNAbrz65ZyqIYjUe
         ZZe0564OhFMvn2XWXsVVT69yENYmUUZCud8BWF7iItSZQxJigu4LTQL6UQ5fpWSpqLsf
         w76kdCyt8wrZmitQP6cRJ8YsW6yWrmzOyBShjXEA10LAsfCeD9gOL4iyWieSzxIoFye2
         5P+g==
X-Gm-Message-State: AOJu0YyxPr+m6mCtjWLyE6v3vsFsHCQDdSAKQYbZyYihuLcn6ncuellA
	NJWX3vIieutcQ7OfpzNQ4JXxeXG0NNYrUE3/o6CfwDc1ep3ImVeceLro
X-Gm-Gg: ATEYQzzI8/dHD+HxEmeH5DxDjf0CSeERf+sT338MdhY2HZLR2HfP1vfd4YVZFrc0jKk
	ep3HW/vm59qMVSxsednElAmcwh5XhJFu0hAN93g4qnSy57JYXkIxj0LQA80wOk93kKfhOW7v08t
	iXjMquxZXtd9I3myTP+qcsIl1H+M29TwmtiWkWzNS+l0mrwnx9eYLKgJeoL3D0yP1KixGLLx4WQ
	5AfwmFHmlgBztCWuBaoHVfRtp9QOcZ7OPLgLdAxFc5X5QIvtRUO6B4Dil637AbvB46bSsyhhhkI
	YO1++nJN2xpztut+QF/HuV7kQSHiJW0EgG651dWvOAI5E1sbTDTi3VlmG8+vNFDQ/7nYhARB5TB
	JVIvvtxOJUxikgudOY2FyhT7Rvbja/HEbikR8clEvRZYKQJp6aJKqRUYpIh2gFZllfjvCwf6i
X-Received: by 2002:a17:903:2348:b0:2ae:7eda:765e with SMTP id d9443c01a7336-2aeae7df028mr19420135ad.17.1773218806200;
        Wed, 11 Mar 2026 01:46:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a304:100::50a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378930sm16073985ad.85.2026.03.11.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:46:45 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Wed, 11 Mar 2026 16:46:16 +0800
Subject: [PATCH RESEND v11] rust: fmt: add safe pointer formatting support
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-hashedptr-v11-1-dd1b8e8b0fb0@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3

Add Pointer trait and HashedPtr pointer wrapper type for safe pointer
formatting:

- Pointer trait: A copy of core::fmt::Pointer that, together with the
  Adapter type and fmt! macro, ensures raw pointers are automatically
  formatted using HashedPtr instead of being formatted directly.

- HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
  This is now the default behavior when formatting raw pointers with
  "{:p}", preventing kernel memory layout information leakage.

Link: https://github.com/Rust-for-Linux/linux/issues/1219
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
v11:
- Fix inaccurate or inappropriate descriptions in comments
- Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
  always passed to scnprintf on all architectures
- Per Tamir's suggestion, replace doctests with mod tests and adjust
  test content to make the tests more meaningful
- Remove the RawPtr wrapper type: it and HashedPtr use different
  formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
  call core's Pointer impl directly). This series focuses on fixing the
  issue that without it {:p} would output the pointer's stack address,
  and on using HashedPtr to safely format raw pointers and avoid leaking
  kernel address space layout information

v10: https://lore.kernel.org/rust-for-linux/20260121050059.2315091-1-sunke@kylinos.cn/
- Merge all patches into a single patch
- Improve `kernel::fmt::Pointer` trait implementation

v9: https://lore.kernel.org/rust-for-linux/20260119033006.1453006-1-sunke@kylinos.cn/
- Refactor implementation to use Pointer trait and Adapter pattern
  instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
  scnprintf directly in Rust for pointer hashing, eliminating the
  need for C function export
- Move pointer wrapper types from rust/kernel/ptr.rs to
  rust/kernel/fmt.rs
- Split implementation into more granular patches: Pointer trait
  foundation, HashedPtr type, raw pointer default behavior, and
  RawPtr type
- Remove documentation patch, integrate examples into code doctests
- Simplify API and improve code organization following Display trait
  pattern

v8: https://lore.kernel.org/rust-for-linux/20260101081605.1300953-1-sunke@kylinos.cn/
- Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
  EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
  pointer wrapper types (HashedPtr, RawPtr) for %p and %px
- Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
  construction

v7: https://lore.kernel.org/rust-for-linux/20251229072157.3857053-1-sunke@kylinos.cn/
- Refactor kptr_restrict handling: extract kptr_restrict_value() from
  restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
  improve RestrictedPtr::fmt() implementation to directly handle
  kptr_restrict_value() return values (0, 1, 2, -1) for better code
  clarity
- Remove Debug derive from pointer wrapper types (HashedPtr,
  RestrictedPtr, RawPtr)

v6: https://lore.kernel.org/rust-for-linux/20251227033958.3713232-1-sunke@kylinos.cn/
- Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
  in format_hashed_ptr(), ensuring width, alignment, and padding options
  are correctly applied to PTR_PLACEHOLDER

v5: https://lore.kernel.org/rust-for-linux/20251226140751.2215563-1-sunke@kylinos.cn/
- Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
  using kernel vertical style with alphabetical ordering
- Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
  Clippy warning)
- Update type ordering to alphabetical (HashedPtr, RawPtr,
  RestrictedPtr) in fmt.rs macro invocation

v4: https://lore.kernel.org/rust-for-linux/20251225225709.3944255-1-sunke@kylinos.cn/
- Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
  formatting options (width, alignment, padding characters)
- Improve code structure: reduce unsafe block scope, use early return
  pattern
- Add doctests with formatting option tests for all pointer wrapper
  types
- Enhance documentation with detailed formatting options section,
  including examples for width, alignment, and padding
- Fix RestrictedPtr example to use pr_info! instead of seq_print! in
  docs

v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@kylinos.cn/
- Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
- Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
  rust/kernel/ptr.rs corresponding to %p, %pK, and %px
- Make raw pointers automatically use HashedPtr when formatted with {:p}
- Add documentation for pointer wrapper types

v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke@kylinos.cn/
- Disabled {:p} raw pointer printing by default to prevent accidental
  information leaks

v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylinos.cn/
- Initial implementation that directly printed raw pointers
---
 rust/kernel/fmt.rs | 145 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 1e8725eb44ed7..11a0508a7fd08 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -5,6 +5,7 @@
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+use kernel::str::CStrExt;
 
 /// Internal adapter used to route and allow implementations of formatting traits for foreign types.
 ///
@@ -27,8 +28,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
@@ -90,3 +91,143 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+/// A copy of [`core::fmt::Pointer`] to prevent raw pointers from being
+/// formatted directly.
+///
+/// Together, the [`Adapter`] type, [`fmt!`] macro, and this trait ensure
+/// that raw pointers (`*const T` and `*mut T`) are automatically
+/// formatted using [`HashedPtr`] instead of being formatted directly,
+/// preventing kernel memory layout information leakage.
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
+#[macros::kunit_tests(rust_kernel_fmt)]
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
+            unsafe { bindings::no_hash_pointers = false };
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            let formatted = cstr.to_str()?;
+            // On 64-bit systems, hashed pointers start with 0x00000000.
+            assert!(formatted.starts_with("0x00000000"));
+            assert_ne!(formatted, "0xffffffffdeadbeef");
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = true };
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
+            unsafe { bindings::no_hash_pointers = false };
+            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+            let formatted = cstr.to_str()?;
+            // On 32-bit systems, hashed pointers start with 0x, but the
+            // content differs from the original pointer.
+            assert!(formatted.starts_with("0x"));
+            assert_ne!(formatted, "0xdeadbeef");
+
+            // SAFETY: no_hash_pointers is a global variable.
+            unsafe { bindings::no_hash_pointers = true };
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
+        unsafe { bindings::no_hash_pointers = no_hash_pointers };
+
+        Ok(())
+    }
+}

---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-hashedptr-4914d995a537

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

