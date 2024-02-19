Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679073CF6B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708360763; cv=none; b=ZruyjuEf9ZLKbC+9v0/EXml8kBll83bnu/P46KM6c8mcuqM0WX2TSDNN84fqp4t6yXv3Kx/GSHVrWlYehhbte5wpegtz3jZAivCSuzrtJYxrOd5m1T4PfbiRcEYepQXX+38UyO9s+S8NUTjTpLZljXZnuJqbb6ygrMN1C7S/ruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708360763; c=relaxed/simple;
	bh=C8EgG7XcdcMV2/sMB+b9Fci+Styb0h0r87nEyY8e7XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pErvVZKTU8Kcu2U9Wvi67iuwlapZ22nVrDb4HE+8wXCl2IRyvmaNwVt4klL8VzeHOj4aksf+3Q9xSUILenx8kn581e4zVEm5UQYRZy9U+1Gfw2BaTdpVEur0vrnN/dT8lzGKH27IUiXi+sITt9WMBd8y4KGs7BCujTQvVOAAfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBCbE4Ch; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBCbE4Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708360760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=okXEMX2Wb0ZGER6a+MgWT/1TkbqrgHTCP6DrA/Jrr/Y=;
	b=SBCbE4ChmX/UKfbla7nS5kBrt6vHBdAl309SBdY7e7xDIq22ADsLFfaz6sefqjmtu3q8O6
	EluLWghZgq86wOIa9KW3i3Ik3mcB+VwmtAE6s+bUbCnUGVjsfHPnhECAZMgjCn+pfMmG2q
	Lh7Toww2LvZUCqLO7GbjhJ6zHP4ZxVg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-nFWkSQHrPpS4ZmTh6xkWrw-1; Mon, 19 Feb 2024 11:39:19 -0500
X-MC-Unique: nFWkSQHrPpS4ZmTh6xkWrw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3e931d4491so51945266b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 08:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708360758; x=1708965558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okXEMX2Wb0ZGER6a+MgWT/1TkbqrgHTCP6DrA/Jrr/Y=;
        b=c1mtMGZTG3OO+WqroGMt821Kso912nL61xm0sucE3ZX6mzcP9Bh7fyv1G0lMY5aQG2
         fTsSxLO5Fx3KtB1ss+kBrHDdAc9QbqYBQI1oNzSH5vZ7iGqln3Zo1+sZtaNwH+ccdii5
         t+kc5j/KuiyworvZMltTqX7mjb/uqybeT30uVBm9MiMWVj9mHJpu4qXlmBi0r6zBjXJC
         ywMhNf6wYia3ZZPxhvIesz3lFDqr8GQ3Z6oh5rw7p6/ks4ZFqaYIJ3U3vOfXxb6Kg8tk
         pmnyM4Mls8baj0yVkZGaNbd9u+aE3NvH3y8nqVce7t4bnWXdY+F9W88Ng9Uz/C9d0TGa
         6TZA==
X-Gm-Message-State: AOJu0YxBddsiNLrbpzjIRc4cyuIyl4wNXRwjbrzIxp6tlQiQRahwdtXu
	qi3eyyhInpiXU6FhCie7Xh241DHL5AS9T/nHoL+aFVb1xV5D7kMMKbW+9S1OYm4BFXa51xob0y8
	8hlz7s6dpAg7YbrXEFhcktSt8W3193stYxWZWNmWPpaWHxWDPuigaoO0ylhZaPCsH
X-Received: by 2002:a17:906:f288:b0:a3d:716e:820a with SMTP id gu8-20020a170906f28800b00a3d716e820amr10426726ejb.28.1708360757866;
        Mon, 19 Feb 2024 08:39:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8H4A36zvOv2OU3+pQkw3yUuL31KlBUOh3dF6I/PGJAP0F/ZAr+eyA+TyQROHdWS0FncINcQ==
X-Received: by 2002:a17:906:f288:b0:a3d:716e:820a with SMTP id gu8-20020a170906f28800b00a3d716e820amr10426703ejb.28.1708360757516;
        Mon, 19 Feb 2024 08:39:17 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id vu9-20020a170907a64900b00a3e59740f4esm2033586ejc.92.2024.02.19.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:39:17 -0800 (PST)
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
Subject: [PATCH v4] rust: str: add {make,to}_{upper,lower}case() to CString
Date: Mon, 19 Feb 2024 17:39:13 +0100
Message-ID: <20240219163915.2705-1-dakr@redhat.com>
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

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
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
index 7d848b83add4..4dec89455e2d 100644
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
+        return Ok(s);
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
+        return Ok(s);
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
+        unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut *self.buf) }
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
-- 
2.43.0

