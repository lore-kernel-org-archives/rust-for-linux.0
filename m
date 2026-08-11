Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C31E9B37
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415032; cv=none; b=LgpzeCRsNGS3iyl19r0TwqTkJJiKN9r61kqyK5qs2guon5cfIqvYMTisgPGhUChX1Tg9jpuzMHcIns/0wIitUklBqizsjJfKRokOFXz9EUiWp8s8fy/+G0bah+gn3TacLEb3sHH3iaZ54KsrKgiXbjg4fO+jq9yI2GPscLgYLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415032; c=relaxed/simple;
	bh=jqjA34bvJgy9gCGvJeh0cm/fqn3PuOKbFmUkrTzIfhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFVgUgFSy5LtBlJUrJD7QEkifNNsZUBoYls0Zw+iTNIYAtkhf6K9IKadP2jldaQLCBL19cxej5YtT/NkZ/v3cMjX72iRNlUWQdizYeyeGeVfAUqrciS6Pra47gAPW+wjUI0za24yBh3eGfSduvgkXp9PP5GB11HlCMn6DNAjM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a2c90e383so393500b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 19:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415030; x=1787019830;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehtZQIet9kzoz6zhTbiJw94Kc28YfT7TvEOKkYFitp0=;
        b=RThgleS1Y668c9xyVceaNrJ8jcGK7GsflN2qJlpW0vJYPxmSWELJM0tQiWnIAZznci
         vOjv4yDfuSiTE0OGw++Qri8yb6vM6g/dhMvzjMcAzqMDdL9rhNZLWsOoICemKF4Ij+ZM
         5UDgatK7d+EYpEld0GVLpqPbaoyUMCAiHpWVA5qzKsT8j2FUhs0dJFiHryDw1IYo6tZA
         gWTfO/3L/3e8H5yuxZf+H5xY45T8RaKi5pk7zZysysrM/WcBTP0tkGeioFoa4rYEcbe5
         MiOZ4rxjjdyaRYWhO1FHxx2QstC0NjfDzkWmlBzWOH9gLFEdNXtQAyuTIUN1KaFmln3q
         O+rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxgWOjnfjEsY4+H/TWnV7zGiyXKlupA8nBMW9An/tVfxiDiGZKeGrtI2Twyn5ZeOLy12GDlD++ERzGJFoWdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyALSPeeR+zhx+mqSXo8meJ0AhIHpYvQvMNsQexiQZPNcb5onf1
	W8W1hUGKifQFZNd2RdBVj/E21TEZMo/NRknRa3RY4EA3COfXCmLhwrBy
X-Gm-Gg: AR+sD13GXNM+FEJmOGJQATYbJJc1lvhruOS44L534XBpxarwBOjVlK4Tkl0kz2MJvz8
	gcmQZ8XuYCmzTTl47lYPB4/dpib/yBY/xrp7kN5FyH1wQwW77u/YIygRraaNT5j5T5oX0Yh5waN
	tkiBp34i59qnfQDNzm5v3uaPZjY/Lz6aKiOkhSUa+ccrbq3CEWGRROObFCuzOmVXnuJvsJBS4li
	BxT/XbnbO4ia41V22ke9y4m/oPH7N5qPurQQilcK4770XSIIo3uFjX4haZRDGGXnzLMGqo1Y3bn
	0shfMWN8aCeza3qqGONOIyWINJWGBYjYCcU+hgYvqpkWNCPAqVgbntDh2kv4R4ALBXWMezlerSo
	/Oj3AtouOYxDKeppsn3NJqvV3dS11Fy7zyGwwV1fWB1nw1Id4lEy8h1u3iaZWow5J5iULjUe8v8
	sF1AUliA29BlBWWdOJAe21AMkppaCo4wNXC2x4hDLISmM=
X-Received: by 2002:a05:6a21:4a81:b0:3cb:b6b0:1b83 with SMTP id adf61e73a8af0-3cc22ef3ed0mr3331482637.9.1786415029605;
        Mon, 10 Aug 2026 19:23:49 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8d6074sm52491765eec.12.2026.08.10.19.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:23:48 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Ke Sun <sunke@kylinos.cn>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org,
	Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH v16 2/2] rust: fmt: route {:p} through HashedPtr to prevent address leaks
Date: Tue, 11 Aug 2026 10:23:34 +0800
Message-ID: <20260811-hashedptr-v16-2-e21e70a58153@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811-hashedptr-v16-0-e21e70a58153@kylinos.cn>
References: <20260811-hashedptr-v16-0-e21e70a58153@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786414719; l=6384; i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id; bh=jqjA34bvJgy9gCGvJeh0cm/fqn3PuOKbFmUkrTzIfhs=; b=MooNkAZDfLa2ktS0sU2kWLOYnUUg08dmzc+AMP4oUwMwH5peki+Bln85pAvpzMbuB8drxm4eA //xtVDce5TtASn2ohNWfgduya4Ua2Z8d9mC+dZm/I6SPaunQEJMLIxn
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519; pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
Content-Transfer-Encoding: 8bit

Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
so that `{:p}` formatting uses the kernel's `%p` hashed format instead
of printing raw pointer values, preventing kernel address space leaks.

Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index cd7d9664ff5b9..29454c83dc6b7 100644
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
+            // `scnprintf` already applied the width and zero-padding via `%#0*p`.
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
@@ -112,3 +211,41 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+#[macros::kunit_tests(rust_kernel_fmt)]
+mod tests {
+    use crate::{
+        prelude::fmt,
+        str::CString, //
+    };
+
+    #[cfg(CONFIG_64BIT)]
+    const PTR_VALUE: usize = 0xffffffffdeadbeef;
+
+    #[cfg(not(CONFIG_64BIT))]
+    const PTR_VALUE: usize = 0xdeadbeef;
+
+    #[test]
+    fn test_ptr_formatting() -> core::result::Result<(), crate::error::Error> {
+        let ptr: *const u8 = core::ptr::without_provenance(PTR_VALUE);
+
+        let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
+        let formatted = cstr.to_str()?;
+        // If the RNG is not yet ready, `"%p"` falls back to `"(ptrval)"` / `"(____ptrval____)"`.
+        let formatted = formatted.strip_prefix("0x").unwrap_or(formatted);
+
+        let cstr = CString::try_from_fmt(fmt!("{:>24p}", ptr))?;
+        let padded = cstr.to_str()?;
+        assert!(padded.ends_with(formatted));
+
+        let cstr = CString::try_from_fmt(fmt!("{:024p}", ptr))?;
+        let zero_padded = cstr.to_str()?;
+        assert!(zero_padded.ends_with(formatted));
+
+        let cstr = CString::try_from_fmt(fmt!("{:0100p}", ptr))?;
+        let clamped = cstr.to_str()?;
+        assert!(clamped.ends_with(formatted));
+
+        Ok(())
+    }
+}

-- 
2.43.0

