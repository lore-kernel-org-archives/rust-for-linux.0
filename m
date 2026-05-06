Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E71946DA
	for <rust-for-linux@vger.kernel.org>; Wed,  6 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031460; cv=pass; b=hCO4YRG6JUNBkYdqB3oijjfbYHGkmgPPsHuNZAVKP7/L8drllcBHdyXTsdC8OHl/NrWgaXhIkwEAgCCvNbKUMg3eDhbtCRIZik8FioUnaH8sGxRxpUuFbRApSXHRhUvBDLNIPm/X7VD+LxDriVeZJHTkh2oHTA3KXHjQ10g2+yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031460; c=relaxed/simple;
	bh=C7qsdyfRZwLfmFcnjYA15m8oaydBcIlTQ0Il36+MFvs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VoiVk+UhA1Qe3s3NY0zyyBEJAlEQhbbI1kUIqusfXfm6H/otrTOwq1Sft8nuPKUW9958pTmp7FqyyF5o8AlCHWc6D8WnXRGTSQ7s/9hbemCXhOZj10A0u6sLaiYImEZ4auQP1McHlh8has9Z5SETTSr01jAWt9HfeQVAjcB0hk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixCnj17V; arc=pass smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixCnj17V"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9177026eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 18:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778031458; cv=none;
        d=google.com; s=arc-20240605;
        b=Peww0maDd7G4ye/5PgLlYXwkq6ALjJ5TTsoznvp4yhogipbM4Rhg0QTjFCMWPqjhPt
         ki9sSkFT4MyGxsjSkqe7BxCAZgAlSPA2qgaWreczDC76uF+1Y29ptzvPPKXqW4vzS+uQ
         hMM9ZIDAANRQMRk4fs/qR840lqXEkEg4dl1W0Dm9eT4E6a9WubFOjvSVt+YqTXH90j08
         fWeeI4k7HmxJvGEru1NAof5VexSy4f1KduaT00DkqgXKN38kKVNdrgSIW7/I1+OzIKrP
         pDubEQW9aFFR6uXgO6ltwv7BSTUFBJq9t9iszsHspZs8D/cKzMvbjpwQdOMPOMJufU4Q
         kNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        fh=wLrUfhCmnTYsUEG1lZ/Q/aGk3NXaRrhl2Mw07dJQPBo=;
        b=AydeDkG4Bhto3rVH375ws7plwOVNXv6SZntzEm5ybpoWSFOgP5s+rDoHvxLKsnQ12R
         JwtNZo5yICfmEzeOePX46vVbAwHUYx8mZDfMdHQ+rlMLDKDRnY3xbxrVEf9PkdTRWDl/
         h79aFxFq5h5fDj+iQjdmWmu/1rcdiUIM5Txn/7jvX6XwsBivsVnLBAyNe82RX/qSmIss
         Wz1mM4VyIGC2NGp6GQB/nAPxzvZg3G+PUtBXJ9OXK+TkPQDSxF8/24Chv3tIsT518xKY
         3LsW8nRH3pVVSoNC7sNX47l13tAirIzMTaeXOQQ0qEdpihkkIu05DXVd65t/m86BL/0h
         IEUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031458; x=1778636258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        b=ixCnj17VLPQg9lheYEj3yITgmaUrlpKFp3UIKE7a10tV77if6of1U/OCN4iR+kW/yn
         +lCITkH5gIr+j4XmpIjU6JffIB1d21gnY4B+XV5yyfO3jNLFs4sEVx0eAeOIj2UiC36X
         PCmqQtquocwae3+Cad9kKtLyn6ccJk+krU8gfFzvrWWx24ThoJMQPIBCpxAgKREOiIku
         pm6WCo7lcPwJn4A57PpID296FsHg68BgO+YMjZHycUoGfvSvjAXmoxPAWtpcpG62GCy7
         oBkbEd+sGZuCulyjcDY1VhgYMdm3NRf7L5mg1+xsbmXx0uNzyqtV1H2HJd6OUonOFrXE
         wFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031458; x=1778636258;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        b=o6VC/F0BI2kvbzTDodtZySdhcBLdwqvoAfWWobDMk4hxz4yFt7DnvIvjhgSyt+Ecdt
         xU/UNc8Jgpd0S/hHC1D4AkTIUNch11bK27ZyrAVQ0IAEeeRC2McmNu9fX7NDPJD2+xVD
         DJCODQqbi+br+wNKOhI6RCi9BDW5oYGNzVzItkDjrO7DPKuHZNvhb8+/YsfDufpIZfB4
         hCdu/2NFjXYQxGpk5eKn9iP0TdVJb8klyu27PM538IDBUCd7NG3YT5v7G+lV35xZQdQn
         ZrD4LuRDx+tooXXBFlUD08iwLo7J/hlsZq6PniCdt6ydhrnDfOK848oGoFBX5GYkBOPz
         aNOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TDshPELzpNyCUgD42kJ0mCxVMNZnyymQGijfOkVOAXALRmmb2ZI7ZtQOmYa5RHN+HHT0pfnqKZYbmBr5d+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2eTBHq3+4FnMRKuP75UmC8nZ+fCRjcYUbHeTxGPjWbPSA8FsN
	iZgSCv28QdaRWeRUBJxfUtW0b8iz/Mkg1Hmc00nJqkzmuebn0/x/vVkxUfDfIxfIpu9Wl4DsMA/
	07tlV6WC5I6hdUPMRgb5ozB/f+OBlZqc=
X-Gm-Gg: AeBDietQEFo5JoJLpEN399YKAbM7CkCb6YOAJZ2kXV/87VwJC6me5Sq35lSMfkJgGHp
	S2R7ucqQxjQANGuWSnt32ZJiYZA9zPGN6jidzhlNYv+jvuMBbF5J9iGuu3e2T336mtBiodrWyA1
	+lqW8jZAZ4TwFKxVG6D5GpTK6PxDzw3/UHeCRAZ32Ki6Joz7I8S2ytmCiUDqvzgOVqmFp6PNDHy
	xZUmEe8WIiXki9sDbshqC7Q2Wd7LIvpbDj9TzbvBi2pQTgJ2jkuhujoSXdLiv4x6/Cpprp8OieJ
	hVAkBz6wIsAVKB9/x7DTra56rWsoQaV7BLz/LSxbmlzGKUIjUrHU
X-Received: by 2002:a05:7022:251f:b0:127:5cd6:fa45 with SMTP id
 a92af1059eb24-1319cc19f1dmr852370c88.14.1778031457882; Tue, 05 May 2026
 18:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raymond Newman <raymondcharlesnewman@gmail.com>
Date: Tue, 5 May 2026 21:37:26 -0400
X-Gm-Features: AVHnY4Kf8u22XpqbbYHu0UkH0cArPL6iBBLagzAn_rgaMABRGr1lNMEyPN9lh80
Message-ID: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>
Subject: [PATCH] lib/gcd: Convert to Rust
To: linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 96902ad2caf167ca0377e0b2063973e2183465b4 Mon Sep 17 00:00:00 2001
From: Raymond Newman <raymondcharlesnewman@gmail.com>
Date: Tue, 5 May 2026 21:29:29 -0400
Subject: [PATCH] lib/gcd: Convert to Rust

Convert lib/math/gcd.c to Rust. The binary GCD algorithm is preserved
exactly, including both the efficient-ffs fast path and the even/odd
fallback for CONFIG_CPU_NO_EFFICIENT_FFS targets.

__ffs() is replaced with trailing_zeros(), which maps to the same
hardware instruction. swap() is replaced with core::mem::swap().
Unary negation for the bitmask isolation trick is replaced with
wrapping_neg() to make the intentional wrapping behavior explicit.

ABI compatibility is preserved via #[no_mangle] pub extern "C".

Signed-off-by: Raymond Newman <raymondcharlesnewman@gmail.com>
---
 Documentation/core-api/kernel-api.rst         |   2 +-
 .../zh_CN/core-api/kernel-api.rst             |   2 +-
 lib/math/gcd.c                                |  88 ---------------
 lib/math/gcd.rs                               | 103 ++++++++++++++++++
 4 files changed, 105 insertions(+), 90 deletions(-)
 delete mode 100644 lib/math/gcd.c
 create mode 100644 lib/math/gcd.rs

diff --git a/Documentation/core-api/kernel-api.rst
b/Documentation/core-api/kernel-api.rst
index e8211c4ca..fff8ecc47 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -178,7 +178,7 @@ Division Functions
 .. kernel-doc:: include/linux/math64.h
    :internal:

-.. kernel-doc:: lib/math/gcd.c
+.. kernel-doc:: lib/math/gcd.rs
    :export:

 UUID/GUID
diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst
b/Documentation/translations/zh_CN/core-api/kernel-api.rst
index a1ea70810..3a9d4a3a3 100644
--- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -174,7 +174,7 @@ include/asm-generic/div64.h

 include/linux/math64.h

-lib/math/gcd.c
+lib/math/gcd.rs

 UUID/GUID
 ---------
diff --git a/lib/math/gcd.c b/lib/math/gcd.c
deleted file mode 100644
index 62efca678..000000000
--- a/lib/math/gcd.c
+++ /dev/null
@@ -1,88 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/kernel.h>
-#include <linux/gcd.h>
-#include <linux/export.h>
-
-/*
- * This implements the binary GCD algorithm. (Often attributed to Stein,
- * but as Knuth has noted, appears in a first-century Chinese math text.)
- *
- * This is faster than the division-based algorithm even on x86, which
- * has decent hardware division.
- */
-
-DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
-
-#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
-
-/* If __ffs is available, the even/odd algorithm benchmarks slower. */
-
-static unsigned long binary_gcd(unsigned long a, unsigned long b)
-{
- unsigned long r = a | b;
-
- b >>= __ffs(b);
- if (b == 1)
- return r & -r;
-
- for (;;) {
- a >>= __ffs(a);
- if (a == 1)
- return r & -r;
- if (a == b)
- return a << __ffs(r);
-
- if (a < b)
- swap(a, b);
- a -= b;
- }
-}
-
-#endif
-
-/* If normalization is done by loops, the even/odd algorithm is a win. */
-
-/**
- * gcd - calculate and return the greatest common divisor of 2 unsigned longs
- * @a: first value
- * @b: second value
- */
-unsigned long gcd(unsigned long a, unsigned long b)
-{
- unsigned long r = a | b;
-
- if (!a || !b)
- return r;
-
-#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
- if (static_branch_likely(&efficient_ffs_key))
- return binary_gcd(a, b);
-#endif
-
- /* Isolate lsbit of r */
- r &= -r;
-
- while (!(b & r))
- b >>= 1;
- if (b == r)
- return r;
-
- for (;;) {
- while (!(a & r))
- a >>= 1;
- if (a == r)
- return r;
- if (a == b)
- return a;
-
- if (a < b)
- swap(a, b);
- a -= b;
- a >>= 1;
- if (a & r)
- a += b;
- a >>= 1;
- }
-}
-
-EXPORT_SYMBOL_GPL(gcd);
diff --git a/lib/math/gcd.rs b/lib/math/gcd.rs
new file mode 100644
index 000000000..29397c669
--- /dev/null
+++ b/lib/math/gcd.rs
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Greatest Common Divisor
+//!
+//! Implements the binary GCD algorithm. Often attributed to Stein,
+//! but as Knuth has noted, appears in a first-century Chinese math text.
+//!
+//! This is faster than the division-based algorithm even on x86, which
+//! has decent hardware division.
+
+use kernel::prelude::*;
+
+/// Calculate the greatest common divisor of two `usize` values
+/// using the binary GCD algorithm.
+///
+/// Returns 0 if both inputs are 0. If only one input is 0, returns
+/// the non-zero value. The result is the largest integer that divides
+/// both `a` and `b` without remainder.
+///
+/// On architectures with an efficient find-first-set instruction,
+/// uses a faster bit-shifting path. On architectures without
+/// (CONFIG_CPU_NO_EFFICIENT_FFS), falls back to an even/odd loop
+/// which benchmarks better under those conditions.
+#[no_mangle]
+pub extern "C" fn gcd(mut a: usize, mut b: usize) -> usize {
+    let r = a | b;
+
+    if a == 0 || b == 0 {
+        return r;
+    }
+
+    #[cfg(not(CONFIG_CPU_NO_EFFICIENT_FFS))]
+    {
+        return binary_gcd(a, b);
+    }
+
+    // Isolate least significant set bit of r, which is shared by
+    // both a and b and must therefore be a factor of the GCD.
+    let r = r & r.wrapping_neg();
+
+    while (b & r) == 0 {
+        b >>= 1;
+    }
+    if b == r {
+        return r;
+    }
+
+    loop {
+        while (a & r) == 0 {
+            a >>= 1;
+        }
+        if a == r {
+            return r;
+        }
+        if a == b {
+            return a;
+        }
+        if a < b {
+            core::mem::swap(&mut a, &mut b);
+        }
+        a -= b;
+        a >>= 1;
+        if (a & r) != 0 {
+            a += b;
+        }
+        a >>= 1;
+    }
+}
+
+/// Inner fast path for architectures with efficient find-first-set.
+///
+/// Uses `trailing_zeros()` which maps directly to the hardware
+/// instruction (e.g. BSF on x86, CLZ on ARM). Not compiled on
+/// CONFIG_CPU_NO_EFFICIENT_FFS targets where the loop-based
+/// even/odd path in `gcd()` benchmarks faster.
+///
+/// `r` captures the shared trailing zeros between `a` and `b`,
+/// representing the power-of-two component of the GCD, which
+/// is restored via shift at the end.
+#[cfg(not(CONFIG_CPU_NO_EFFICIENT_FFS))]
+fn binary_gcd(mut a: usize, mut b: usize) -> usize {
+    let r = a | b;
+
+    b >>= b.trailing_zeros();
+    if b == 1 {
+        return r & r.wrapping_neg();
+    }
+
+    loop {
+        a >>= a.trailing_zeros();
+
+        if a == 1 {
+            return r & r.wrapping_neg();
+        }
+        if a == b {
+            return a << r.trailing_zeros();
+        }
+        if a < b {
+            core::mem::swap(&mut a, &mut b);
+        }
+        a -= b;
+    }
+}
-- 
2.54.0
