Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FB3803E0
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071965; cv=none; b=ulXpTvicEgz0FQSopK0a2pMCYG8bRTnNd5/gQibr2bnQOY8MOScYrRgp8E9ckxWI68njpLd96Fg6AGdJexW82VHvPrgLvHnivF4qq2g5YM8/i1ot65a6POgey9cBWNwu8qu5vp//71eEAfJixB0GIzGpCmyhDEDmWBkSCL7IhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071965; c=relaxed/simple;
	bh=UEICtBQncvv0nPiQVfvxC3LfOwnL7fmft+j7JsgjgKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCyJUSE+tSQCuRpR6rLLu8mYr/L7069dH0JadPNgbrtDHWY/pqECVRGal2UbQmTJ7rbbZIiJfQnptkyVYiObUWfnEM0DJWY79ORkJXhH56pNyUrt49+8uXBTsOv0dkKXn6SJwE+09iDgydK1WGoZQNOyK5LhbudhehQLrC0uyj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82307c6902eso198040b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071963; x=1769676763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7b0CjqxJqPQdcQC+1ouSnJhTgft+u1z48wvCBaskqg=;
        b=m33/P1aKndUntkncK4VLiQIlEL/o7izTMcIiF4yUyLBEmfUHOx4kNAO5XiRtDZGcC2
         M1ApJ9RgjffhusQvzsvR5hY5grOaNqSU7hxI7g79QNCN8VEZXuOQObPTWEv+a1dgwOMk
         otz3dQDDr5DY1LaVZCghugyCacKZ76noaGgM10dVAv9bbq4Fhhpbby1NF6d9pfsxnlNw
         mM4ydEUo4TnHeQ8Jraft9bdINen71qa4rTXHC6ZqgITsF1a9LHPGpxhOY0M9G3wiPdNs
         2H+5XrecsKWdYZZ5d03A4VdgiFbiHkH8QtSncqfWI9XfzQR8R+kyfmUEcgLPFmpy1Dqx
         s8aA==
X-Forwarded-Encrypted: i=1; AJvYcCV1E4TvnYyzvWHSkB1jjcxkhdNi6jxmwkj4x1WhJTJelPunWId6zDVyNjzL9WEGra2QXwu9Pfd/WygFXUwOpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHLlgCg+nuAxHY0czLEzbNEWwxS+WZrs9ingjk8ms8Q8LE4O9
	oBMO5llZF1y5+SA9oD3uQI9DQn0CCwOk6vapiPOhtWvOoynNyCj+X0Cr
X-Gm-Gg: AZuq6aLqKEes5IVuDcE/ZAIQOhmWo4ae6a7ROCe/l6EijLyVNwQUZBvf6nLpSrZBXE3
	OKJ4GXJjsCEa1NhY4BWPggBZrfjZu25+iWs+DDgWjMTZk8Bix1wkn3ohDsYrdX1FPxl/K+R5oT0
	yg4gHjF18uCz9wrocjnj5EW4qU5oxps+j9BsQA/XendxbHwJnVHtNE+od7X0+bWE11Hl4JQSCjm
	O/V8HN3Ti3kljk/pQp8fTCwRXV3vG57BgDywTli7T+zoWgRSSTe7pSA3b4c+XK94dlVdNEZ5cOF
	/BYcCB/kyrwhIDIEprYkDhcjdmq4jn+KOnwlsEIX5iEiMBg7mVzYkUINvOWmuRGF5wSsVwjgj6O
	Axxvfmd2colFtZD/qZYiR78OLWZJJQ1WwAOTEvCrIq+P5rO1rnwi+T1xEYAX6PuV39CkvEc56Fe
	YB8gs1h2CWfhQ=
X-Received: by 2002:a05:6a00:22c5:b0:81f:9f14:ecc8 with SMTP id d2e1a72fcca58-81f9f6ac7edmr18070763b3a.27.1769071962598;
        Thu, 22 Jan 2026 00:52:42 -0800 (PST)
Received: from localhost.localdomain ([2a11:8080:200::1:10a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10e6ec7sm17354524b3a.28.2026.01.22.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:52:42 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
Date: Thu, 22 Jan 2026 16:52:28 +0800
Message-ID: <20260122085228.2449409-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121050059.2315091-2-sunke@kylinos.cn>
References: <20260121050059.2315091-2-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Pointer trait and two pointer wrapper types for safe pointer
formatting:

- Pointer trait: A copy of core::fmt::Pointer for foreign types.

- HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
  This is now the default behavior when formatting raw pointers with
  "{:p}", preventing kernel memory layout information leakage.

- RawPtr: Formats raw address without hashing (corresponds to %px).

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 142 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..5d4d9b72eeb37 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -5,6 +5,7 @@
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+use kernel::str::CStrExt;
 
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
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
@@ -90,3 +91,140 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+/// A copy of [`core::fmt::Pointer`] that ensures raw pointers (`*const T`
+/// and `*mut T`) are automatically formatted using [`HashedPtr`] instead
+/// of being formatted directly, preventing kernel memory layout
+/// information leakage.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     bindings,
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// // SAFETY: no_hash_pointers is a global variable.
+/// let no_hash_pointers = unsafe { bindings::no_hash_pointers };
+///
+/// #[cfg(CONFIG_64BIT)]
+/// {
+///     let ptr_const = 0xffffffff12345678 as *const u8;
+///     let ptr_mut = 0xffffffff12345678 as *mut u8;
+///
+///     // SAFETY: no_hash_pointers is a global variable.
+///     unsafe { bindings::no_hash_pointers = false; }
+///     let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
+///     assert_eq!(cstr.to_str()?.starts_with("0x00000000"), true);
+///
+///     // SAFETY: no_hash_pointers is a global variable.
+///     unsafe { bindings::no_hash_pointers = true; }
+///     let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
+///     assert_eq!(cstr.to_str()?, "0xffffffff12345678");
+/// }
+///
+/// #[cfg(not(CONFIG_64BIT))]
+/// {
+///     let ptr_const = 0x12345678 as *const u8;
+///     let ptr_mut = 0x12345678 as *mut u8;
+///
+///     // SAFETY: no_hash_pointers is a global variable.
+///     unsafe { bindings::no_hash_pointers = false; }
+///     let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
+///     assert_ne!(cstr.to_str()?, "0x12345678");
+///
+///     // SAFETY: no_hash_pointers is a global variable.
+///     unsafe { bindings::no_hash_pointers = true; }
+///     let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
+///     assert_eq!(cstr.to_str()?, "0x12345678");
+/// }
+///
+/// // SAFETY: no_hash_pointers is a global variable.
+/// unsafe { bindings::no_hash_pointers = no_hash_pointers; }
+///
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
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
+        // The "%p" format produces a fixed pointer format: "0x..." (e.g.,
+        // "0x00000000b231c2e6").
+        let len =
+            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_char_ptr(), ptr) };
+        // SAFETY: scnprintf with "%p" format always produces valid ASCII
+        // output, which can be directly converted to UTF-8.
+        let formatted = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
+
+        // Use pad() to respect width and alignment. Padding with explicit
+        // characters (e.g., {:0>16p}) is supported, but zero-padding
+        // shorthand (e.g., {:016p}) is not.
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
-- 
2.43.0

