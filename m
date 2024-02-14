Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8526087B
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Feb 2024 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931515; cv=none; b=U2uECradX83ea0I6kv5sQgF1C7nWmx1sYufofbGsKEIpWfC1qAdFSq7aqsdG1oTCcbxNTq/RYHoBfmUYIRahZEtdJilpapZWy+eDi9A5RAzaC2PhOtLWGZ8Ar63FUpWn1/iLnikpV7kFOgeEZ6muSK47dO9aYzR8xtyljNLKcbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931515; c=relaxed/simple;
	bh=nSY/ipm3/ufRfFV6OKDnHMrXNybe4BKCpYhUNqiAdxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EkPFxOwtmltbFph7ZtfuMl/OmWLPyC1R+T434bpuxMr+Hx5D5MfOJY5Y+8RWl3wHvof42UJQCnQgiv7QBOJ4iil1EtRmqAIV6aPZaYLD0cw4IJelaLBswIyG0QZbTQlwPxolRIceNG5YrBZLTNYsgYDZrJ/sWnb2KVoJ0u2M2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXphQshR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXphQshR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707931511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VgGnSh1FS2jhduTVKubyRQKqPQ/32rOrbBEh1JM9wsE=;
	b=LXphQshRV77Dc9W7bP4ZD3ibjQfDs5oU0Wu+SpV0RxOV3GY5Ycgy585h3rQJsBsLmN7NFn
	jFb5x6rFstJ4cxVbzQr3EYmbFgFvx5mWAb/8a3TAujP15b7V3e4ie0+MnbKBWLwwBdhJMh
	vm+xgfJU5KrobksI/DcJHWPYrXAQu18=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-a09e6x4RP7i_JTNVKPwTtA-1; Wed, 14 Feb 2024 12:25:10 -0500
X-MC-Unique: a09e6x4RP7i_JTNVKPwTtA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3bdd99a243so2423966b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Feb 2024 09:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931509; x=1708536309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgGnSh1FS2jhduTVKubyRQKqPQ/32rOrbBEh1JM9wsE=;
        b=o2go5qLRXEeeoPisphbxkDOCR7v8fH+Nz377k9rVhggEnoPtPtV9iqeExrqkndCdw+
         wYrkomBqeUbmr91XXFLkZWAyBBce6fZq2SIaQL2TxJqnP7e0lfm4UlPkfLYtEUCdWt+0
         6lmlIu7Y2GMBDMeZxePeCkdojTxQgA+qOkYZMXkcbdhEMzV5ZZuxssqPsnbmpL5GDOZ/
         Z1I6KFK0BqHbPWXAmdJ4+PWSs+6H5Hx0qWkkDDK7BdyCTc/IQ3Qus6tKnVdc8+KCsEjw
         WWWdRRU2E8vCm4/B4sG3KGUigAH3zP/rXqO2njXKakcaVrJwkftm2tVDni5P3tO+45ph
         lvXw==
X-Gm-Message-State: AOJu0YwF8xwDEL+gxLWJ6UsvA1Uu2+0RGZ+kd386e1FCiFFY6AygM3uE
	RCgxbDTbfOnOWTxosvP97KEPGSkrtn1zyXBE17ChKiooQi3Bz8L+HouL7LJkmnMw5rmbveaxgXC
	VmDlyMubSqW8Yb66hvQFVcQBtmSM+lBZCTmH3gba4XubUX0G4iNo5cfEnztQOcP1i
X-Received: by 2002:a17:906:2c46:b0:a3d:6175:7d04 with SMTP id f6-20020a1709062c4600b00a3d61757d04mr1163991ejh.34.1707931509069;
        Wed, 14 Feb 2024 09:25:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpJO2MitTrBHND+Gsloj+exIoYmAekYLRTsfYhVEQUSH0y7WkRE+CU59MJxkUIO9Nju6x7XQ==
X-Received: by 2002:a17:906:2c46:b0:a3d:6175:7d04 with SMTP id f6-20020a1709062c4600b00a3d61757d04mr1163965ejh.34.1707931508611;
        Wed, 14 Feb 2024 09:25:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiK4wpvb07ZT0WpDRHlSIKf0oEDBDyscAVfF4smPJFL3PUfJViFdMbNIOJmWbpoL9KNlRehUEF3IC2rGam31WhZzDBzJvlGCrC5RTlzrumVzORcyEXq0U/9+mX//QyeLbktSvGe4iN0WQh4wkDXjxF0UuyZZS1GjLW7lWhYP0KpcbXfT21uPH52BN02VLnAaHYa2CyJB3gvHYO77k6ZKZhe1+r4o3oGXKoH34iHfjMdNX6P50+sRoswSNCScNewos0iC67z40DM+JYuOwIyROPCdAQ6fkouSWNsBNCCdNYwQPR788XK5x1slfwLQ4xK0tXXL8XTPWfjHr+apjny52NOKJLo42u5K7fFgYZFHIn8Q==
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id h2-20020a1709063c0200b00a3d1ea6134dsm1370996ejg.197.2024.02.14.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:25:08 -0800 (PST)
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
Subject: [PATCH v3] rust: str: add {make,to}_{upper,lower}case() to CString
Date: Wed, 14 Feb 2024 18:24:10 +0100
Message-ID: <20240214172505.5044-1-dakr@redhat.com>
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
Changes in V3:
  - add an `impl DerefMut for CString`, such that these functions can be defined
    for `CStr` as `&mut self` and still be called on a `CString`
Changes in V2:
  - expand commit message mentioning the use case
  - expand function doc comments to match the ones from Rust's stdlib
  - rename to_* to make_* and add the actual to_* implementations
---
 rust/kernel/str.rs | 81 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..02d6e510b852 100644
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
+    pub const unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
+        // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
+        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+    }
+
     /// Returns a C pointer to the string.
     #[inline]
     pub const fn as_char_ptr(&self) -> *const core::ffi::c_char {
@@ -206,6 +219,32 @@ pub unsafe fn as_str_unchecked(&self) -> &str {
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
+        self.0.make_ascii_uppercase();
+    }
 }
 
 impl fmt::Display for CStr {
@@ -581,6 +620,40 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
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
+        let mut s = (*self).to_cstring()?;
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
+        let mut s = (*self).to_cstring()?;
+
+        s.make_ascii_uppercase();
+
+        return Ok(s);
+    }
 }
 
 impl Deref for CString {
@@ -593,6 +666,12 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl DerefMut for CString {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut *self.buf) }
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

base-commit: 7e90b5c295ec1e47c8ad865429f046970c549a66
-- 
2.43.0

