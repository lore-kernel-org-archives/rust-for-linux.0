Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8861E49F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255392; cv=none; b=pkdKBUU2tiMTJ7bBYISJiQeYC9Vrjqnr/dT3D9CcsEZEJHVz+VDl21NHffSS7UJazij6PDou9FM+FJ6m8IPTodZAjLpH+qtkGBD11JwJlZ5Ic/vT/BZ7DhU1CN4hNXWh6VnGevWPlS0nmwelRfI+YaVtjTAATPBxxbbBS+5fzjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255392; c=relaxed/simple;
	bh=3feK49yfpuRBXf0nwO9W9OKA4PGXLah6ZYiw2x/6ukQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BakFpXMvMzGUTRvpDxCzFWx3cAnvFyCANEWyJUAplmr3vsOlsiO9iFgAn6K2AyjYV/J+uDAIc++CKHqg7TOKnkQl3sEkTWXetGRxQuAst74JTEQk1nPYVyrx3skYlv/qWVoT/6howV8m5vUPoRH01Kw7OOOSabjHY0Yyya1Ri7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a081c163b0so104588015ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 00:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767255390; x=1767860190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPbKdBWftidPW9NcZkB5JdDiY/eZWbyOpW0FkyaNVOs=;
        b=waHyMBB3bNoAahioUscIAhKqOoMyVOzidVf+jCwQxlrsM6c1/AzpGiOMVA/u854ZdK
         fMXjALVazHt+V2IyXoqbZlBpC4LLJB6pvLdO+J2GuimjMsHeGpC/XyV9oDiyqwGuVQkj
         v3enzgJuRG86ZmFpsjF6Sx5wLnyMjf+PW+p7f8IwJeWXz2Q9s459fXQMEHVDQiEKLIbI
         sLU3eURonaav/S+b3wW/igvYvPgP8fzPEZh1ClevBL/+5Lh56cBA1ReMJpkJ4AyaNDjZ
         D0jKfYI5nsknKtbItpr1QDNwh+6ZtrhQQLuFEEoPdQBRgpJ3nGCWoLsRTV2QKxbPCPqN
         oh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBJlMl2BWSCHY/PTz8iTmdyqiy2cm7atsiBtI4wjUA9RBAQ2+NwVMZ1sywSlWco/HL+lQQnkOA+z99Rj7wdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtQRjgmvQnjUvyCf2TYvXvypp7wT5TKuX2eX0pLw4bkcLeEvl
	e5Z/pQsiOCHu7OuzGIq0m2z2++drsRtqXAXS4OqvCMROGtmvPiNp/ywj
X-Gm-Gg: AY/fxX480eJQpZLEIUZuLKWTvckKGws/SsxjG+tjCwSxIzzriCRsWkKL7uSBFF8R+4g
	SD1Vxg9hhZI2dudHYXwnwmNFYhdegTgsr8EyDh4yv0ScaXIyw6NIt54BNjntk2s5EYA4DRApkS8
	GimsgebshyQHYbQFA9qUycrDsq5Ydf9os2FHB584U5q76Y1zjMOdDP8ZANabl0A52Q2wUTZl6R3
	+NIlMZz0VZ8w42NRApccDobv08WXmLHed2adRnc+ygbAQbQqotbEKSzT2g6NAEMfp/ptGH0tYzk
	AdBsN79xHXWhBiEpgtj+S70vsMCRTfLDs0D9GSF8FQbE9gFpmbBleKq3dnTbpnkropJZuXj0chp
	XFrTxd8VVAeZp0560lltSWfFCysZcUL7apl4uyav2z1lcOkHzBP3MygGLj7Mp5RacOquYq4sEz0
	DOr46EcIREY4IxQkY2t7lJ8sXaeIUBv8xHSK6tuTo/1KmkJiiJztmLajY4LgmU7F3t9g==
X-Google-Smtp-Source: AGHT+IHkdmdFe+v/IGAdebdHYGpCM2/NTg04TvhNDNIxz+Tdceq8vRl38cYVXg3TxX3+5BJChZsDXA==
X-Received: by 2002:a17:903:3b8b:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a2f2a354ebmr374475455ad.45.1767255390004;
        Thu, 01 Jan 2026 00:16:30 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm342457585ad.3.2026.01.01.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:16:29 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
Date: Thu,  1 Jan 2026 16:16:02 +0800
Message-ID: <20260101081605.1300953-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101081605.1300953-1-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two pointer wrapper types (HashedPtr, RawPtr) to rust/kernel/ptr.rs
that correspond to C kernel's printk format specifiers %p and %px. These
types provide type-safe pointer formatting that matches C kernel patterns.

These wrapper types implement core::fmt::Pointer and delegate to the
corresponding kernel formatting functions, enabling safe pointer
formatting in Rust code that prevents information leaks about kernel
memory layout.

Users can explicitly use these types:
    pr_info!("{:p}\n", HashedPtr(ptr));
    pr_info!("{:p}\n", RawPtr(ptr));

HashedPtr uses ptr_to_hashval() to hash pointers before printing,
providing the default safe behavior for kernel pointers. RawPtr prints
the raw address and should only be used for debugging purposes.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
Suggested-by: Dirk Behme <dirk.behme@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 rust/kernel/ptr.rs | 133 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index e3893ed04049d..77132eaaef73b 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -1,11 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Types and functions to work with pointers and addresses.
+//!
+//! This module provides wrapper types for formatting kernel pointers that correspond to the
+//! C kernel's printk format specifiers `%p` and `%px`.
 
-use core::mem::align_of;
-use core::num::NonZero;
+use core::{
+    fmt,
+    fmt::Pointer,
+    mem::align_of,
+    num::NonZero, //
+};
 
-use crate::build_assert;
+use crate::{
+    bindings,
+    build_assert,
+    prelude::*, //
+};
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -225,3 +236,119 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Placeholder string used when pointer hashing is not ready yet.
+const PTR_PLACEHOLDER: &str = if size_of::<*const c_void>() == 8 {
+    "(____ptrval____)"
+} else {
+    "(ptrval)"
+};
+
+/// Helper function to hash a pointer and format it.
+///
+/// Returns `Ok(())` if the hash was successfully computed and formatted,
+/// or the placeholder string if hashing is not ready yet.
+fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+    let mut hashval: crate::ffi::c_ulong = 0;
+    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
+    // hashing. This is safe as long as ptr is a valid pointer value.
+    let ret = unsafe { bindings::ptr_to_hashval(ptr, &mut hashval) };
+
+    if ret != 0 {
+        // Hash not ready yet, print placeholder with formatting options applied
+        // Using `pad()` ensures width, alignment, and padding options are respected
+        return f.pad(PTR_PLACEHOLDER);
+    }
+
+    // Successfully got hash value, format it using Pointer::fmt to preserve
+    // formatting options (width, alignment, padding, etc.)
+    Pointer::fmt(&(hashval as *const c_void), f)
+}
+
+/// A pointer that will be hashed when printed (corresponds to `%p`).
+///
+/// This is the default behavior for kernel pointers - they are hashed to prevent
+/// leaking information about the kernel memory layout.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     ptr::HashedPtr,
+///     str::CString, //
+/// };
+///
+/// let ptr = HashedPtr(0x12345678 as *const u8);
+/// pr_info!("Hashed pointer: {:016p}\n", ptr);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct HashedPtr<T>(pub *const T);
+
+impl<T> fmt::Pointer for HashedPtr<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Handle NULL pointers - print them directly
+        let ptr = self.0.cast::<c_void>();
+        if ptr.is_null() {
+            return Pointer::fmt(&ptr, f);
+        }
+
+        format_hashed_ptr(ptr, f)
+    }
+}
+
+/// A pointer that will be printed as its raw address (corresponds to `%px`).
+///
+/// **Warning**: This exposes the real kernel address and should only be used
+/// for debugging purposes. Consider using [`HashedPtr`] instead for production code.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     ptr::RawPtr,
+///     str::CString, //
+/// };
+///
+/// let ptr = RawPtr(0x12345678 as *const u8);
+///
+/// // Basic formatting
+/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+/// let formatted = cstr.to_str()?;
+/// assert_eq!(formatted, "0x12345678");
+///
+/// // Right align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
+/// let right_zero = cstr.to_str()?;
+/// assert_eq!(right_zero, "000000000000000000000x12345678");
+///
+/// // Left align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
+/// let left_zero = cstr.to_str()?;
+/// assert_eq!(left_zero, "0x1234567800000000000000000000");
+///
+/// // Center align with zero padding, width 30
+/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
+/// let center_zero = cstr.to_str()?;
+/// assert_eq!(center_zero, "00000000000x123456780000000000");
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct RawPtr<T>(pub *const T);
+
+impl<T> fmt::Pointer for RawPtr<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Directly format the raw address - no hashing or restriction.
+        // This corresponds to %px behavior.
+        Pointer::fmt(&self.0.cast::<c_void>(), f)
+    }
+}
-- 
2.43.0

