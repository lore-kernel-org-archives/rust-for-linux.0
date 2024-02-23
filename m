Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5581184FAF
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Feb 2024 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708706257; cv=none; b=beFr36Wi7XZsnqY0NTZ2unV4YMqpOlOsGQLjqowH0ij36E+geBZQiexAlFvTm85TNHgABo8ZrSdlxYy7dyFrtjfoO5/cJ+ZdRNZM7Lqk87BDMUtXElP6uVS8dBr3GAG5y9eWiENVx83+mYwsw3aYe0xbSnreJy+8JRFysLbPNmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708706257; c=relaxed/simple;
	bh=6X2pjKgoujjJyMfMa5m9DAj7vZS/YUa15KPy8QFZibs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VnbKGtIbZ9tbYH7gYOLWAlG1zMyCq8PWT2XMcfMXEaW8gxZZe+doM8jdW64k8cAuNowTfu+1oCWP5TjTJpPKfYOpoAl80vyiTW+3J0ZxjFNulNGhguk2I/otLGU4Z1zsUc0fUDRUhDe1CZVHfMJnHrYMBuZYp8E/fBWIgb7py+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJY6y0II; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJY6y0II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708706253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jJz4ul1e27rNZHJvoOXiYFCd5EfCVL6UYrKBkI3v9BM=;
	b=AJY6y0IITyBNMSiyxYaXw7BzItPKj7EHQOfrqLLnIyVAKnXzOZwbr9UYdhIJqoQe4B5htx
	skd1fI4drEKXrnjfNFeHJuTmgbS5fHkE0FNEARCyMzcMO9cHiEIEBI3Ezc8ZNioRJjwYlS
	h46BswOqPcK5P2ad9GbITYN6q75Juzc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-0pVQMKoKPxG8uBrDCQUOyA-1; Fri, 23 Feb 2024 11:37:32 -0500
X-MC-Unique: 0pVQMKoKPxG8uBrDCQUOyA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-512e6d29386so792322e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Feb 2024 08:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708706251; x=1709311051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJz4ul1e27rNZHJvoOXiYFCd5EfCVL6UYrKBkI3v9BM=;
        b=O/h2sdPBL4IrAYYpQjL8juK7LYvxQYys7R5jOrL91jJ3C2mlNOty0S4vAxoV2A2rZO
         fEJriSMW0MwGsooRyx6VDHxyPamE5rkAEJT52TvMhkUUg/2UfJ0Pehv4b5zlXBf2+66L
         tNh/qsGbRgO8oWda6E9ENFAy7rST5c4GkcMRmGSTwb93tf9/2y59hqieAj0ZebDMGpCM
         oy2SbqHGy2hWhcY0Z3At6BovZZ0CyA+mmWOwgbbbG9HgnmThXHvyH/qK4Qeo/HqiUycZ
         SAWIH+6PiOD/NJt2V2Sc2piluK7NlUXGB4UbNy0KqkUfMvn4BZlVzrW3DOVSWz8bNj3q
         dGEw==
X-Gm-Message-State: AOJu0YwuBPJd/2RyXwtwG7scDLiOUxrYyLvkmyQrOPMrkpx3Rh726+yU
	UadueNFtFzUCB7cZsTr5sY3VGj5mtkh+HsTTZkjkDZwGwleybquwEFL+OE7chSAor3/9lu/L62Y
	fQvqDgYEOJDiD9wodG3DhxNyDCy34ERDIlm4RPNWGvfiXaeGqCJzBsKSERnZXSW5+
X-Received: by 2002:a19:7404:0:b0:512:d6b4:9622 with SMTP id v4-20020a197404000000b00512d6b49622mr133280lfe.69.1708706251107;
        Fri, 23 Feb 2024 08:37:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI4zo7vR/7Cp58uza9NxBMjotbsgXxD9CrsZsnj8dw90uhjbw+HluXAvqIgWumYG4FZI7fQQ==
X-Received: by 2002:a19:7404:0:b0:512:d6b4:9622 with SMTP id v4-20020a197404000000b00512d6b49622mr133270lfe.69.1708706250687;
        Fri, 23 Feb 2024 08:37:30 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm6542407edb.64.2024.02.23.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:37:30 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v5] rust: str: add {make,to}_{upper,lower}case() to CString
Date: Fri, 23 Feb 2024 17:37:09 +0100
Message-ID: <20240223163726.12397-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add functions to convert a CString to upper- / lowercase, either
in-place or by creating a copy of the original CString.

Naming followes the one from the Rust stdlib, where functions starting
with 'to' create a copy and functions starting with 'make' perform an
in-place conversion.

This is required by the Nova project (GSP only Rust successor of
Nouveau) to convert stringified enum values (representing different GPU
chipsets) to strings in order to generate the corresponding firmware
paths. See also [1].

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in V5:
  - remove unneeded return statements
  - use Vec::as_mut_slice() instead of a dereference
Changes in V4:
  - move to_ascii_{lower,upper}case() to CStr
  - add a few comments suggested by Alice
Changes in V3:
  - add an `impl DerefMut for CString`, such that these functions can be defined
    for `CStr` as `&mut self` and still be called on a `CString`
Changes in V2:
  - expand commit message mentioning the use case
  - expand function doc comments to match the ones from Rust's stdlib
  - rename to_* to make_* and add the actual to_* implementations
---
 rust/kernel/str.rs | 87 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..c1c8ccc80c52 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -5,7 +5,7 @@
 use alloc::alloc::AllocError;
 use alloc::vec::Vec;
 use core::fmt::{self, Write};
-use core::ops::{self, Deref, Index};
+use core::ops::{self, Deref, DerefMut, Index};
 
 use crate::{
     bindings,
@@ -143,6 +143,19 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
         unsafe { core::mem::transmute(bytes) }
     }
 
+    /// Creates a mutable [`CStr`] from a `[u8]` without performing any
+    /// additional checks.
+    ///
+    /// # Safety
+    ///
+    /// `bytes` *must* end with a `NUL` byte, and should only have a single
+    /// `NUL` byte (or the string will be truncated).
+    #[inline]
+    pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
+        // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
+        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+    }
+
     /// Returns a C pointer to the string.
     #[inline]
     pub const fn as_char_ptr(&self) -> *const core::ffi::c_char {
@@ -206,6 +219,70 @@ pub unsafe fn as_str_unchecked(&self) -> &str {
     pub fn to_cstring(&self) -> Result<CString, AllocError> {
         CString::try_from(self)
     }
+
+    /// Converts this [`CStr`] to its ASCII lower case equivalent in-place.
+    ///
+    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To return a new lowercased value without modifying the existing one, use
+    /// [`to_ascii_lowercase()`].
+    ///
+    /// [`to_ascii_lowercase()`]: #method.to_ascii_lowercase
+    pub fn make_ascii_lowercase(&mut self) {
+        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
+        // string.
+        self.0.make_ascii_lowercase();
+    }
+
+    /// Converts this [`CStr`] to its ASCII upper case equivalent in-place.
+    ///
+    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To return a new uppercased value without modifying the existing one, use
+    /// [`to_ascii_uppercase()`].
+    ///
+    /// [`to_ascii_uppercase()`]: #method.to_ascii_uppercase
+    pub fn make_ascii_uppercase(&mut self) {
+        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
+        // string.
+        self.0.make_ascii_uppercase();
+    }
+
+    /// Returns a copy of this [`CString`] where each character is mapped to its
+    /// ASCII lower case equivalent.
+    ///
+    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To lowercase the value in-place, use [`make_ascii_lowercase`].
+    ///
+    /// [`make_ascii_lowercase`]: str::make_ascii_lowercase
+    pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
+        let mut s = self.to_cstring()?;
+
+        s.make_ascii_lowercase();
+
+        Ok(s)
+    }
+
+    /// Returns a copy of this [`CString`] where each character is mapped to its
+    /// ASCII upper case equivalent.
+    ///
+    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To uppercase the value in-place, use [`make_ascii_uppercase`].
+    ///
+    /// [`make_ascii_uppercase`]: str::make_ascii_uppercase
+    pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
+        let mut s = self.to_cstring()?;
+
+        s.make_ascii_uppercase();
+
+        Ok(s)
+    }
 }
 
 impl fmt::Display for CStr {
@@ -593,6 +670,14 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl DerefMut for CString {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: A `CString` is always NUL-terminated and contains no other
+        // NUL bytes.
+        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_mut_slice()) }
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

base-commit: 39133352cbed6626956d38ed72012f49b0421e7b
-- 
2.43.0

