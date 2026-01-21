Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869031A7F3
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 05:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768971678; cv=none; b=Nin9DvhNWmSIJfERu/sYNA/jtHPQ6/ZcfBmXlimD3ZVPjaw+rnDOCJ5nJR8ZsjhgtPGvTqlLtu7YQAPvGEpoQUEuPRHq6ufN2x1LH8LfAWkW+FhalHTrtpvvz8SGWKipkc55RDFrr7Alrf6DRdY40u/hkneknab7ya0FM7+jLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768971678; c=relaxed/simple;
	bh=FFFCR42NiBO5wynerk/zc3Riv2aO+i1OGAdBmdGrrnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwgPBSQIdJqOumQL0SreLTRyEM4/G5ZssT2AArwgJk45qu6zEKL5SUZTIcxOuEKVQcYxHutc0aYUU9JTzBWe6b/P/8CVEIKSVGQa6mD9tCE6RwWOXP7OqZhyZCQ8WQGG+eFHQAX4m0jlH1ug60UnMD8yA7c5hMZrgIWNJ/eKeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f3b4ae67bso3283661b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 21:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768971675; x=1769576475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2s/01gzta4t+VYsoXBKgpPT+c3aVWQQdueTXFLCy+78=;
        b=qnxG8qmwyO+f3v7WAwX8yKKDFPwLrORlT/j9jyjaLXb0ZMPDfyVTLNKWcVqw9cf4Am
         IGBoInP3KYtMOGkmLHyQi8B7Q6p3h7/RcT3aldqlUCEThjByKyrJO+7x+lFJ3p6IP9tF
         W5hR3+Wx8uBPOPvN9iwoobq2AsTx+vaCEyQ+gx3aPBlG2ituE6yt8R7cuLuEfK8v7PFt
         9MffWe0ZqpXVC/gcrgG5E4PBPGBAg7KkX77nJ1nVNqZUSE7o6g0HVK9mbmPrtIdyFXTQ
         umW++IxUlXn90RKxJ/aIP/g+8LQI2SGZHD9ovvJaj6wooT49jJOWzVWC6LBhrZ3TnI3G
         hAtw==
X-Forwarded-Encrypted: i=1; AJvYcCXGVNLhtKc65NdXyIyL1wVe/iqiNCAN5OxTS5Ambc6oZbBYhQv2KgdOaeUK3r8G0qaL3QvdCxy6T1SnM2KGFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmoUYstU5d9n29r3yj3dn0P/ldUs6Rl64F8uHm0ewTV3tBJhY
	8tOdpH9StwQZYkrf2NaOd+Wh3Ex7DhWpnTbCQuh1D9/70YtKb8EQA2Lg
X-Gm-Gg: AZuq6aKZfgw3Az0zMvX+FsmlYA9rAi65B97kZrJTSh6PWe9rjq82PeThMg8IdFnX9kB
	im26gMpCKW/Y0I+Y1jr/OAkF2JQIpnQ0AbtgC/LTzoHSRiS+gx7YC1/HzGY0WiKjg5RZHcEZAZh
	3Vf0y7A/AYHZFdJ9i8h9Ant89huoYCowP7Of5TIJ/H8byrmdYkzvh8gKCzhoVY7xliucUq/CRde
	Sfe2E6bDXbFOwxWNRQcIgng46Zlqkwp40G1moLtzTvDddlsOOYkkaa1NYRKOUEw1x+q70Qy61TU
	rg56zSEQhg+0OQA4s75S7K5cYTXUOlalQO4FS0GvRvKExzRv1lnQqMZF82N2YYoPs6evgoTTdWe
	I99z/AxvizDOdnHwA/HL8HluKSI3zsq/TaIpjWdEk8OtJ0KC2+0sZ3mQlkcWLwq5xWNTc0eumoQ
	7wO+6/A0PxGFKKMxp9cWuu0kgLp3fOC7GAU5YglMem12/BWvyQ/d4Qr90UYGDL7aJluA==
X-Received: by 2002:a05:6a00:7483:b0:81f:3bfa:f0da with SMTP id d2e1a72fcca58-81f9f6d46bdmr14155330b3a.29.1768971674579;
        Tue, 20 Jan 2026 21:01:14 -0800 (PST)
Received: from localhost.localdomain (210-61-187-173.hinet-ip.hinet.net. [210.61.187.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10be07fsm13628453b3a.20.2026.01.20.21.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:01:14 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
Date: Wed, 21 Jan 2026 13:00:59 +0800
Message-ID: <20260121050059.2315091-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121050059.2315091-1-sunke@kylinos.cn>
References: <20260121050059.2315091-1-sunke@kylinos.cn>
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
 rust/kernel/fmt.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..d53184d0a12bc 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
@@ -90,3 +90,167 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
+/// foreign types.
+///
+/// Types should implement this trait rather than [`core::fmt::Pointer`].
+/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
+/// formatting foreign types (e.g. types from core) which do not implement
+/// [`core::fmt::Pointer`] directly.
+///
+/// By default, raw pointers (`*const T` and `*mut T`) are formatted using
+/// [`HashedPtr`], which hashes the pointer value to prevent leaking kernel
+/// memory layout information.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// // Works with const pointers
+/// let ptr_const = 0x12345678 as *const u8;
+/// pr_info!("Default pointer: {:p}\n", ptr_const);
+///
+/// // Works with mut pointers
+/// let ptr_mut = 0x12345678 as *mut u8;
+/// pr_info!("Default pointer: {:p}\n", ptr_mut);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
+/// assert_eq!(cstr.to_str()?.len(), 30);
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
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     fmt::HashedPtr,
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// let ptr = HashedPtr(0x12345678 as *const u8);
+/// pr_info!("Hashed pointer: {:p}\n", ptr);
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
+            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_ptr(), ptr) };
+        let formatted = core::str::from_utf8(&buf[..len as usize]).map_err(|_| Error)?;
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
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     fmt::RawPtr,
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// // Works with const pointers
+/// let ptr_const = RawPtr(0x12345678 as *const u8);
+/// pr_info!("Raw pointer: {:018p}\n", ptr_const);
+///
+/// // Works with mut pointers
+/// let ptr_mut = RawPtr(0x12345678 as *mut u8);
+/// pr_info!("Raw pointer: {:018p}\n", ptr_mut);
+///
+/// // Works with references
+/// let value = 42u8;
+/// let ptr_ref = RawPtr(&value);
+/// pr_info!("Raw pointer: {:018p}\n", ptr_ref);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
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

