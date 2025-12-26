Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFADA1A9FAA
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758104; cv=none; b=L6afA722M4KVGrqjJG/0OVPJ6+W429fO+dmcpDaVI2V+boem4n/jsCI/Pd0IeVqS7Xa1Ncy2FVfXDcJ0xl/tzMgLo2SxwyZ8B/BlT03qjiQVxs5ieBs1vOh/VyJhgXBDiMpuGndzJZYWqkZooDbq0YX5I1JwuW6SRT2/T8GlHnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758104; c=relaxed/simple;
	bh=GwHFQihY56h+73dPg2u17+HuZuz9EC8ejVHi+ZETqQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2V+TuoqTSpiIoaBkSSD27dmXiTSp3vxFZ6I90gubymOXb0gOtulKxFR4Qq8qXneLvJ45xHqjL66K6znLStG1LHjfFcdUzOG/FuNYPR7QcCnT1xxc2a9No22u2rvBkiakRyED4FxWSJrp11bzpCRcmx7BsONaUaWjxXVgknYzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso7585641b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 06:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766758101; x=1767362901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJZG6D8tt0XaN9lJEeJBStcBkiPXa85keCqsqb3lDWI=;
        b=Kv3j64GYf0fY5zQdp2VwcsBRnEVqGNBX1ZWRW3btMi702lWOdtn6SGKNO1Mb3V11DI
         kh8B9xOSiNs+jYQBqNsXssqgqkFA9RG4QwPm6XYv8v9wbf14fRvQ6RDSoJF1luQNPHsf
         e9S7skD7QwozYjkn1hNKU20VFxUdr89w0jM6LEchgPUK8Z1oLlbkba1jXRlvdu6OcHIO
         qwbaiGZ/Z+U7w+FKUViDq575Swk2HvLhSPmTxBYGBRZ3C9AtbrEF4sFlOI92zxMlh00m
         AZpt82zzPJhWMjFojuoHbhV3kspsFpfG5++Xf/ZQbd/Xx/xxD5BM8JvVp+LRnZOiOZVH
         0tBw==
X-Forwarded-Encrypted: i=1; AJvYcCWytUq+v2XmowDgFDyLH+A+dy7E3ipozb8/TWVdbXadliQ+15pDbYJ2tsQ9WLUHgrGDXwhReDPoECrCUD4x6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEZOhAdUjoPpEGhWXRXe+VDFokyhbsLwYmYiQDnacjQ01pFws
	/B1I9fWs/t3ULBGhd87S7mf/PZsFm7SFynmZJJdV9JKOuiJltz7mC4GR
X-Gm-Gg: AY/fxX69sQydOeFl4h6LQo0xzy0GXDOd3UqOTmfH0nZWkr8UVMe36jx8Y6+XOZs11eN
	SrUkZMj7aR99RGlcFP4F4qWg+q8X+R0L5qclAIBka6KzaYx7xCl9YcpPN7fTxed8R4qpAxUnS6h
	s8Ql+z51PnbOH8Afc8pGiH6cwovOn1qM9RbabgL9aPi5lstQhzqm4v71Ey1WircY4j2Lb90xEeD
	nNNFtGbMpeyv1FLuJm5tKBMmNHXMCnz3pXmqW49JqrOUXyz91v8+9V2qfLDeGKIritrpNRAAiKi
	uutsbJQb1fSNOZnyHOcbhkG4IhZfeMhybQOaIPB2cMaHulMHoPelTZA9FwJSOZp/dMKSNHBoHzO
	oRCNnsJOkIM/nT+IPpk5AqGGwWyCLd83Z4/RNeC8V0p758fcsetO6Y5SZb8v1Ivvgyilk2+B9p6
	sXjm2egIOnV8vHSr1/lWH4
X-Google-Smtp-Source: AGHT+IFxzEbdmeqIboacwlVLug9p046O34AXe3pLJ0vmQ/ViLtLe+/eMKvaV9LCCOmgwriNjLvv62w==
X-Received: by 2002:a05:6a20:4320:b0:35f:5fc4:d88a with SMTP id adf61e73a8af0-376aa4fc3dfmr22941101637.49.1766758101150;
        Fri, 26 Dec 2025 06:08:21 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm11460886a91.6.2025.12.26.06.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 06:08:20 -0800 (PST)
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
Subject: [PATCH v5 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Fri, 26 Dec 2025 22:07:49 +0800
Message-ID: <20251226140751.2215563-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226140751.2215563-1-sunke@kylinos.cn>
References: <20251226140751.2215563-1-sunke@kylinos.cn>
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

