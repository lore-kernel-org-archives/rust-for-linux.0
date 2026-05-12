Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F893A7589
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576171; cv=none; b=PAlX4wWyFDmp4Qj0vxRJUnU3bamNp5z5k6T2Fa+zWi/fYoxMTi3MNH1vpjfaHK77k3HZwz0pFM1EOLMIqDlzse1i6H6JO0M0IfYq8q1EC6PximE38VyaZVlStQVajNyJBzf2NaLuwHZBwSBRCeIcOIP2dCrndPoMdRaXbKFNm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576171; c=relaxed/simple;
	bh=GC74ihABPZY/ezZCu8yy5EWX+5Az1a/OuAYH0kjzUj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rr9+oATOGAWG0OwMTwsQ4XHL5bZcFlLlyyWGmlcWHriu56XogUQ6I2rJ4hSokzhbwe0RElpUdCKXpBgS9Bc6rdl0+pMnCk7IOQ7NRLVbSrhUN8Tw/8vGARKNd/uCvnks0fEvCRPKTt7QGr1+v9Tw5E1Sx7TCL8DIbsawceQ0L6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b458ca2296so34613225ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 01:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576155; x=1779180955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEJyoALwDvsToZ8RO+SB4EU7i9G1fjiA7i42bf/4Lh4=;
        b=ddK8M34yRvvmW3oGLf/WTtshoweRcFfcZy/7JzpJJk3j7pEFCYfvGf2pdJ06Qc0PFd
         dX9DSwIagVu1Bz5uXLN67LVzNdH3B0JFDWSdbONKeXH0wMIPoqC0H5Cp5OkaN+ep2vG/
         wv7kJPCm8BbWtoMGQWjIBHfuDz+5yUt1jjsaEAt0YULjF9opH26vJs6ZAgAKOpTynMvo
         EqG2eQPKZfedhkNZqulkdaXMTz3+9KKhVr+wEiM5eKlTLc7W8VdbxdIZZPfaKol+o0Nr
         SUwa44wAC4wfMslYiixmvoSal/Upc90tT+dgxKnjzM8po8rAo966vLrn0ZTAVy2h6iGU
         SBbg==
X-Gm-Message-State: AOJu0YzcvIMpthsUXR483kkKJnVDmqAg27Ai7u/C8oMAGmAaDZzlSX6a
	kANTsMVgRnW5g098bAEuoJSGOqU5+Qg9lkCXpJpGUuQmjABWB8KpQ6j4
X-Gm-Gg: Acq92OGsSzssZzbRAM+D0bMWrehmgvaNvM9/jyG8dESZA0lRzMUqV2arEjv+pJCQq7q
	1roXY5ogcUlT23f1ExHl7jubebrbZ+QoRfWC69PJ77qop2z9CQm0hCfWZjvv5ep2ji/SdIQTlIa
	nBsmD2t0kjHM8UkwD6vy0VhvbexVkC8vc7iUJX0/wt194LqxB15iIEg5BrjPBJuHqPhzch/0jjR
	jrKPAvVUU3ZnRqBwp/LDNofeJOlyG/siqC8HkUNxj+s3ShoNk2IKzjOZrZB98okilQ+9xVv+sb9
	mpO/jU34cJsXaRBFil3g6GtROk8Qd3Z3eTQu1g1BKzek/UGSe5UV/8N4j3zxmWzaxpSttJvrkoN
	vImn0NRLE+vH0rUbmkwF+hW+pNRyRe5JkWiKGuYfIcMq27/rq3P+bXSCj8xCevbZ9J60=
X-Received: by 2002:a17:903:646:b0:2ba:25ca:b49f with SMTP id d9443c01a7336-2baf0d39079mr122791625ad.17.1778576155268;
        Tue, 12 May 2026 01:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm124209215ad.44.2026.05.12.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:54 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 12 May 2026 16:55:28 +0800
Subject: [PATCH v12 2/2] rust: fmt: route {:p} through HashedPtr to prevent
 address leaks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-hashedptr-v12-2-61d5c7786889@kylinos.cn>
References: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
In-Reply-To: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576135; l=8059;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=GC74ihABPZY/ezZCu8yy5EWX+5Az1a/OuAYH0kjzUj8=;
 b=Ysols+4GHW5Rnqve5+4fGQvbRaAbEbEt+3hGUe1I5+YDglA3Ta69n3LGEe3lOW4rtMZGtltMG
 LGshuB6x5zcCYyXc7GHkjl0dJCA/jHhYKBMw0t8pVjCRNP2/yosjK3Q
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
so that `{:p}` formatting uses the kernel's `%p` hashed format instead
of printing raw pointer values, preventing kernel address space leaks.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index aba9f3dbd3175..19f422ff7f0ed 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -27,10 +27,95 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
 impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
-impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
+/// A copy of [`core::fmt::Pointer`] that allows implementing pointer formatting
+/// for foreign types.
+///
+/// Together with the [`Adapter`] type and [`fmt!`] macro, it enables raw pointer
+/// formatting to be intercepted and routed to [`HashedPtr`] (kernel's `%p` hashed
+/// format), preventing kernel address leaks.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Pointer {
+    /// Same as [`core::fmt::Pointer::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+/// A wrapper for pointers that formats them using kernel's `%p` format specifier.
+///
+/// By default, `%p` prints a hashed representation of the pointer address to prevent
+/// kernel address leaks. When the `no_hash_pointers` kernel command-line parameter is
+/// enabled, the real address is printed instead (for debugging purposes).
+pub struct HashedPtr<T: ?Sized>(pub *const T);
+
+impl<T: ?Sized> Pointer for HashedPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        use crate::str::CStrExt as _;
+
+        let mut buf = [0u8; 32];
+
+        // SAFETY:
+        // - `buf` is a valid writable buffer. 32 bytes is sufficient for all architectures:
+        //   64-bit: "0x" + 16 hex digits (zero-padded by `pointer_string`) = 18 bytes;
+        //   32-bit: "0x" + 8 hex digits (zero-padded by `pointer_string`) = 10 bytes.
+        // - The format string is valid and `%p` expects a pointer argument
+        // - `scnprintf` is safe to call with proper arguments
+        //
+        // Note: "0x" is added because Rust's `{:p}` includes a "0x" prefix,
+        // but the kernel's `%p` does not.
+        let len = unsafe {
+            crate::bindings::scnprintf(
+                buf.as_mut_ptr().cast(),
+                buf.len(),
+                c"0x%p".as_char_ptr(),
+                self.0.cast::<core::ffi::c_void>(),
+            )
+        };
+
+        // SAFETY:
+        // - `buf` is a valid buffer (see above for size justification)
+        // - `scnprintf` returns the number of characters written (excluding null terminator),
+        //   which is always non-negative (see `vsnprintf` and `vscnprintf` in lib/vsprintf.c)
+        // - `len` is bounded by `scnprintf` to at most `buf.len() - 1`
+        // - The format string "0x%p" produces ASCII hex digits and "0x" prefix,
+        //   which are valid UTF-8 (ASCII is a strict subset of UTF-8)
+        let hashed_str = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
+
+        // Use `f.pad` to handle width/alignment formatting.
+        f.pad(hashed_str)
+    }
+}
+
+// Raw pointers are formatted via `HashedPtr` (kernel `%p`: hashed by default, plain with
+// `no_hash_pointers`).
+impl<T: ?Sized> Pointer for *const T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(&HashedPtr(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for *mut T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&(*self).cast_const(), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
+    }
+}
+
+impl<T: ?Sized> Pointer for &mut T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
+    }
+}
+
+// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`
+impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {
     fn fmt(&self, f: &mut Formatter<'_>) -> Result {
         Pointer::fmt(self.0, f)
     }
@@ -96,3 +181,86 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
+    /// A RAII guard that temporarily sets `no_hash_pointers` and restores it on drop.
+    ///
+    /// # Safety
+    ///
+    /// `no_hash_pointers` is a `__ro_after_init` global variable. KUnit tests run during
+    /// `kernel_init_freeable()` (init/main.c), before `mark_readonly()` makes the
+    /// `.data..ro_after_init` section read-only. At this point there are no concurrent
+    /// readers or writers, so it is safe to modify.
+    struct NoHashPointersGuard {
+        original: bool,
+    }
+
+    impl NoHashPointersGuard {
+        /// Sets `no_hash_pointers` to `value` and returns a guard that will restore
+        /// the original value on drop.
+        ///
+        /// # Safety
+        ///
+        /// See struct-level documentation.
+        unsafe fn new(value: bool) -> Self {
+            // SAFETY: See `NoHashPointersGuard` safety documentation.
+            let original = unsafe { bindings::no_hash_pointers };
+            // SAFETY: See `NoHashPointersGuard` safety documentation.
+            unsafe { bindings::no_hash_pointers = value };
+            Self { original }
+        }
+    }
+
+    impl Drop for NoHashPointersGuard {
+        fn drop(&mut self) {
+            // SAFETY: See `NoHashPointersGuard` safety documentation.
+            unsafe { bindings::no_hash_pointers = self.original };
+        }
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    mod expected {
+        pub(super) const PTR_VALUE: usize = 0xffffffffdeadbeef;
+        pub(super) const HASHED_PREFIX: &str = "0x00000000";
+        pub(super) const RAW_POINTER: &str = "0xffffffffdeadbeef";
+        pub(super) const PADDED_LEFT: &str = "0xffffffffdeadbeef      ";
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    mod expected {
+        pub(super) const PTR_VALUE: usize = 0xdeadbeef;
+        pub(super) const HASHED_PREFIX: &str = "0x";
+        pub(super) const RAW_POINTER: &str = "0xdeadbeef";
+        pub(super) const PADDED_LEFT: &str = "0xdeadbeef              ";
+    }
+
+    #[test]
+    fn test_ptr_formatting() -> core::result::Result<(), crate::error::Error> {
+        let ptr = expected::PTR_VALUE as *const u8;
+
+        // SAFETY: See `NoHashPointersGuard` safety documentation.
+        let _hashed = unsafe { NoHashPointersGuard::new(false) };
+        let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+        let formatted = cstr.to_str()?;
+        assert!(formatted.starts_with(expected::HASHED_PREFIX));
+        assert_ne!(formatted, expected::RAW_POINTER);
+        drop(_hashed);
+
+        // SAFETY: See `NoHashPointersGuard` safety documentation.
+        let _guard = unsafe { NoHashPointersGuard::new(true) };
+        let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+        assert_eq!(cstr.to_str()?, expected::RAW_POINTER);
+
+        let cstr = CString::try_from_fmt(fmt!("{:024p}", ptr))?;
+        assert_eq!(cstr.to_str()?, expected::PADDED_LEFT);
+
+        Ok(())
+    }
+}

-- 
2.43.0

