Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E81FA15E
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806831; cv=none; b=jq9EX9oexDYsRHI/+7rE+kD1d4quaX1ub5zWB1jUPuz4gJw9AeWqfNbvIk/qk6/DnYQF93sdz/VvngN08zgmsDWN9N4HVjQt6/aTjEASEn7i9XWEXfYPH/eIto8vRuSlvI8XVrIQ9RI9Iq4iRwLV5QNB45x1u1G/MpYIXKmvRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806831; c=relaxed/simple;
	bh=GwHFQihY56h+73dPg2u17+HuZuz9EC8ejVHi+ZETqQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUBKFEIftOqwC0U71ggYNCDgbN8i3w1Rilxk2recMKd7ZVh6HRcvvnunNonhQzgF9bEPmAS5ySV+A75bVtPKLqTcW3j8s34OslPKkpr652wL4NrY81Jrdl7heQAV6fFO/5ZEPZWPH3GgMQWJvX7W1UpQDkb7vmcrnqgA3hGomvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so67903305ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806829; x=1767411629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJZG6D8tt0XaN9lJEeJBStcBkiPXa85keCqsqb3lDWI=;
        b=tYUw/zigyMzRurXp4cQPmg9X0H7jGAHkdJxNJxahmWdAQXutMLG73YCId7uDBUp175
         K/kWhmAkaG2fyMX2JQU2kCI+oPB5NRyCs+7cTC4zAVtePqemD0ydpc60uCaMArNYDu+p
         k3g1UrivXm+Xvtnv/5zmRmF/tRsCo7hDj/wojUVDntcBnAOFqdrLPRBtk4HcKNyEarmq
         uhEYCOH7qchO0sJpginXWBCFWbiGOHR3Jkn9T47Ig5EISJwJHLOtrQ+AH5wvI6Y+Akg7
         3shBJen8HEqHVQ5ovMm2CZA9A/DZi7z57M33I37KyD5GWZpkW4J+iy9QkZACDzcHtXp5
         9apg==
X-Forwarded-Encrypted: i=1; AJvYcCXv/LXEASM8Iq++Zy5NH4fwe6cAPD2haQn7Z/TDWLt+Jagk0IZ5RegTA856kRkGzz0/GoEFFoUCsOEEnWeY7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmeQoP2fvJ8gnMtI3YRGsj8bZ7lUhOfVtXoEMRGplIdfqsDucR
	Z3fVfm8UmWaFwoA64Ny1JW/F4xlP6lqawQrveFrR7iGa00gu3ar4tW6E
X-Gm-Gg: AY/fxX4YFC1/geHEEqrVPpFeotmUYFcSkjnafukx3BuzOgk3d8UWqpNbDe+aTs3CvHo
	pxyjZz32lEIOyzGcHaawS0/BGT7Nf8VuCKT3LPSHx73XmKUyAPSsaGhIBIMj+fRiGCdfRrBtj8+
	bvKCuinjjLtkaPY37rLpfg2oA+uW5xIRnIeKixQr/SfVLUGJAb9JKH+Cqq89+nK2HivXAXfO9nA
	ipfFDlEO1bDxDVeiv2ab58ybJo6Ydgl5SKVq+Hax22vq83BOeo+4A/HiXfwWMp65F0xHwSujWTh
	FWU0q3hv4P61KS5pVbw0y6sUJHuvvuow4Q8M59UBaMpra08e/m96edSHlsJT8l/SzCDBH7AP1eC
	W9V7Ea94PibiJM+HNoUWuuK3mPGAOJCCByBa2AilxGLnpSL0iul90Y8TuztXceYevXkDNADgAAM
	iI1PhgTjSgZdh07E3fJ6/d1EqqEddRyex2SIqj1QpawTHQP56Mldgpg7I=
X-Google-Smtp-Source: AGHT+IEUO3CDYMMwtHUlkf1T0y4bj2KB9OTBjqtEesnrAK7H2i/COtO43ZfRGTv1GnR5u1I2NyKX2w==
X-Received: by 2002:a17:903:4407:b0:2a0:9d25:c4ca with SMTP id d9443c01a7336-2a2f222ade3mr279965285ad.18.1766806828865;
        Fri, 26 Dec 2025 19:40:28 -0800 (PST)
Received: from localhost.localdomain (61-221-120-112.hinet-ip.hinet.net. [61.221.120.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm215323135ad.44.2025.12.26.19.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 19:40:28 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v6 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Sat, 27 Dec 2025 11:39:54 +0800
Message-ID: <20251227033958.3713232-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227033958.3713232-1-sunke@kylinos.cn>
References: <20251227033958.3713232-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make raw pointers (*const T, *mut T) automatically use HashedPtr when
formatted with {:p}, providing safe default behavior for kernel pointers.

This allows users to format raw pointers directly:
    pr_info!("{:p}\n", ptr);  // Automatically hashed

While still allowing explicit use of wrapper types when needed:
    pr_info!("{:p}\n", RestrictedPtr::from(ptr));
    pr_info!("{:p}\n", RawPtr::from(ptr));

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 69 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..197687261b4e9 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,6 +6,12 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
+use crate::ptr::{
+    HashedPtr,
+    RawPtr,
+    RestrictedPtr, //
+};
+
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
 /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
@@ -28,7 +34,68 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+// Special handling for Pointer: default to HashedPtr for raw pointers.
+// This overrides the default Pointer implementation for raw pointers to use hashing,
+// which is the safe default behavior for kernel pointers.
+impl<T> Pointer for Adapter<*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from(*ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from_mut(*ptr), f)
+    }
+}
+
+// Handle references to raw pointers (needed when pointers are passed by reference in macros).
+impl<T> Pointer for Adapter<&*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from(**ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<&*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from_mut(**ptr), f)
+    }
+}
+
+// For wrapper types that implement Pointer (like HashedPtr, RawPtr, RestrictedPtr),
+// forward to their implementation. This allows explicit wrapper types to use their
+// own formatting logic instead of being converted to HashedPtr.
+macro_rules! impl_pointer_adapter_forward {
+    ($($ty:ty),* $(,)?) => {
+        $(
+            impl Pointer for Adapter<$ty> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(t, f)
+                }
+            }
+
+            impl Pointer for Adapter<&$ty> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(*t, f)
+                }
+            }
+        )*
+    };
+}
+
+impl_pointer_adapter_forward!(
+    HashedPtr,
+    RawPtr,
+    RestrictedPtr, //
+);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
-- 
2.43.0

