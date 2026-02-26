Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1532E732
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149662; cv=none; b=LUO+sUFHyVJrMFTXYF6jhUX7MiLH+2VeaQYUXvjkWRFNgT3Bv5PFDUkGJ3q8F5uciQTEcnFqedtT1pm3ts3Y2ETIJe0JAkDs3m2ZzLQ2fRW3Tuj4dyskdnPKD4OQA2fQKy0YyViabifOJ7TSe+WeG4jK9QoO+1kWR0cyU3Xf8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149662; c=relaxed/simple;
	bh=+710AkSXFh9/JTyVTFsALEm9lZruIYGGtM6C7UvgeXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKRaq8POPaIJOmhNphDwsdDjelJLSdbDhhafXQKp3fr2RIcSXTIJPNYLiMtvtz2F+QzGEHPg9FOUCDCkiOwhBmzKskZ0ufix55NwuC/R25opsesz7XnLyGzydBrVRWuQ3gdV1giROfEJWbraoXpAnoMk0lLyG5R/UxHFMwYFpq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuuQSXaA; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuuQSXaA"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273349c56bso1768134c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149659; x=1772754459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD9eL4ru9kmWsugqvdoizgO/NNbT0Xc+Ro7IneP1lQM=;
        b=cuuQSXaANrnVWiqCWz0id9kTO6X3f4pKw2rgMcw1xeQzcMvXZXs72WgrrkH4cS9EE7
         cdlP6zKZ/tHsGXh55czoi4OYKGUGfRWCbH206B8o5yksjvAIgBtjntc7wYDdZNOyRQC+
         zgO54gh7FfWRVU7Aj6HmkmsxZ3+RdJiOVoDl+8+968x/ed0YmWG0I7D9nL6weaEXRIiT
         au09ooRFJQZxp/nWxW4ClsryyR+dTU6qCJY904Xs34T06DbE6SKY5Lm7JJmnSM/vMZRa
         fy4+6xHb2sCAteTvP4dROpv0DwTHFVZfoxqqcCCH7ZqIB7TMCtOfgIvhJNqSkjJNQuT7
         LNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149659; x=1772754459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gD9eL4ru9kmWsugqvdoizgO/NNbT0Xc+Ro7IneP1lQM=;
        b=PhTaD4fxGnMiaCwafg/KE1fom/727U0OX5vP4Ttn0hnFyXWB3c3q5k2SQdb0OTuLfY
         Gq4ZrayIpLXoYJFvi1cXj/SpiLnWqLSw4uJhwFMKJcm0SxZE4AZn2Yb0PzoSWRMTGazY
         LLBZOQ+UWwegeC/onu94rddg6aqSIMnJDNJzuuyza9Vf3YckZHT90Y0N/fscio6AxVSu
         EL5Mf3gKwHem4AJGQSnitO9Kz96lXIn6ivDXKCVYSKpHDF1Pmxx4CnxhQZaU2JeZDjH3
         Rth8UN7AxrnPK3ZFew9rweYFLGQhn1hYEdFvDlrguYnzbqibJZmJcnGo7QScq8R729yf
         /Hhg==
X-Forwarded-Encrypted: i=1; AJvYcCWfFuHEt92unVri2qRDUwR9/NhYyNZV7D7Z2UXT5bKYfLGiJC8p5ubeYz2t1az/v/3d68BHbjr8hdADFP4fbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVbjDp6AsKSW3pi9z2Fy6m9q9Sd4z7inrUQfnf9/M+F7p+wBu
	7bRwqSYgQ4hf46hIdRqH1loONUC9ESdCtUdyKq8rUtUGJWogd8LS75tz
X-Gm-Gg: ATEYQzytd974pGv5rVqpaUIy1kIhF8BCJxJ9yUFZCd+tT4hPQTWoocCDK7FDxEjbfFY
	PdCPIKnFad3jNMLj6Z2UWX+DnwGCXJPE4pgCcGYB9piaYpabCjegm0RXc4K20AXu/KPtD9rGjGv
	rbwVqcjNA0PtRK1Y3bgOI5Fs8EWkii2FTitu7YTD+Zu8EaIULmaVD2kXPyhOcKa90MslnsKOLdR
	KzoMURs/ItKcC4Gf9OmwxE5yuoCI6+wCXM65M32eShNSo62FoY0EX7hjSr4Ai0B6QavfDiO//SN
	HQc5uc+/Jt7iGZWFLBU+PnECRIOW1Tf7y+1x15PzMDchkaKG4dmRFP7otEgAxSIrtjBPeme1pHp
	lJVxfFSnphT+yEi++DCDRcmV2E88a62bkEySlIV2UwtAiD4fkzLgi4Ed5bjV8PbHulbPRA8ANx2
	hihJlWqXiPe9cCbb2aDlJJSEvfsNrvIM1ojLIfgQUa57Lg0Iwtx4d6ilJVkU85oDiq0i5vjqzEu
	w==
X-Received: by 2002:a05:7022:6baa:b0:127:345c:43b2 with SMTP id a92af1059eb24-1278fc1f7d9mr357491c88.28.1772149658648;
        Thu, 26 Feb 2026 15:47:38 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32633sm3973385c88.9.2026.02.26.15.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:38 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] rust: module_param: add StringParam type for C string parameters
Date: Thu, 26 Feb 2026 15:47:27 -0800
Message-ID: <20260226234736.428341-2-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce StringParam, a Copy wrapper around *const c_char that
represents a string module parameter whose memory is managed by the
kernel parameter subsystem.

StringParam provides:
  - from_ptr(): construct from a raw C string pointer
  - from_c_str(): construct from a static CStr (for compile-time
    default values)
  - null(): construct an unset/empty parameter
  - as_cstr() / as_bytes(): safe accessors that return None when the
    pointer is null

The type is marked Send + Sync because the underlying pointer is
effectively 'static for the module's lifetime — the kernel guarantees
the string memory remains valid while the module is loaded.

This is a prerequisite for wiring string parameters into the module!
macro in subsequent patches.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/kernel/module_param.rs | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 6a8a7a875643..80fe8643c0ab 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -6,6 +6,7 @@
 
 use crate::prelude::*;
 use crate::str::BStr;
+use crate::str::CStr;
 use bindings;
 use kernel::sync::SetOnce;
 
@@ -106,6 +107,74 @@ fn try_from_param_arg(arg: &BStr) -> Result<Self> {
 impl_int_module_param!(isize);
 impl_int_module_param!(usize);
 
+/// A module parameter that holds a C string pointer.
+///
+/// This type is `Copy` by storing only a raw pointer. The underlying string
+/// memory is managed by the kernel's parameter subsystem.
+///
+/// # Safety
+///
+/// The pointer is only valid while the module is loaded. The kernel ensures
+/// the string memory remains valid for the module's lifetime.
+#[derive(Copy, Clone)]
+#[repr(transparent)]
+pub struct StringParam {
+    ptr: *const c_char,
+}
+
+impl StringParam {
+    /// Creates a new `StringParam` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must be valid and point to a null-terminated string,
+    /// or be null for an empty/unset parameter.
+    pub const unsafe fn from_ptr(ptr: *const c_char) -> Self {
+        Self { ptr }
+    }
+
+    /// Creates a `StringParam` from a static `CStr` reference.
+    ///
+    /// Useful for compile-time default values in module parameter declarations.
+    pub const fn from_c_str(s: &'static CStr) -> Self {
+        Self {
+            ptr: crate::str::as_char_ptr_in_const_context(s),
+        }
+    }
+
+    /// Creates a null/empty `StringParam`.
+    pub const fn null() -> Self {
+        Self {
+            ptr: core::ptr::null(),
+        }
+    }
+
+    /// Returns `true` if the parameter is null/unset.
+    pub fn is_null(&self) -> bool {
+        self.ptr.is_null()
+    }
+
+    /// Returns the string as a `CStr` reference, if set.
+    pub fn as_cstr(&self) -> Option<&CStr> {
+        if self.ptr.is_null() {
+            None
+        } else {
+            // SAFETY: pointer validity is checked above
+            Some(unsafe { CStr::from_char_ptr(self.ptr) })
+        }
+    }
+
+    /// Returns the string as bytes, if set.
+    pub fn as_bytes(&self) -> Option<&[u8]> {
+        self.as_cstr().map(|s| s.to_bytes())
+    }
+}
+
+// SAFETY: The pointer is managed by the kernel and is effectively 'static
+// for the module's lifetime.
+unsafe impl Send for StringParam {}
+unsafe impl Sync for StringParam {}
+
 /// A wrapper for kernel parameters.
 ///
 /// This type is instantiated by the [`module!`] macro when module parameters are
-- 
2.52.0

