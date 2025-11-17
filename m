Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1221367
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338278; cv=none; b=CctPSHqAv4mwcVVikf75lukq47I7aY078/tQ3aKrx6U94351GvWB8AEPqCuMjvsAWK/zEDxZfs0VenKtrftIV00krntLQNnPZrkXVdGz1ZrLJurSnpNnwYS51L2TYHHSVlrXdEhlsDD/SKW1kgLf43TJwAzc2F7Rb5VeGZdrBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338278; c=relaxed/simple;
	bh=tJQTSoLeSIbYvZESmNiIw5sMsSIJ6dPqa5+S+lc/QCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2fcegRkHo4kovVrvbshvgeKIfIfLXrReRTnLYpHGglB75R9tBjqZIv/iNwFrUxa16XvY6TXoWqKawK20VllL/og+dd+EyRg+uFFaeVZYIZJH+OqYVqcsTnK1uToTQknkZsLjF2qXyxplwOGsAo1+tKpOEdyRnATxhu7bcpvEs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0SLc5Bl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0SLc5Bl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29844c68068so35388545ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338276; x=1763943076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko3R4AfTQ14Evgu81z5D9Bb0HoJRGp65fDPRp405zc0=;
        b=g0SLc5BlPyPjXrPGJMgHacl49RuzWmx4d4Mxz8GUmNs+3C1mpUURZP09EBIB8wY1iq
         C1jBLIKmski3k/uD2tlXDnAcQU39XlUbt/D9KkpczQmbvsVeu/bweqZP3g5REn71JElj
         LH1FbDIRBtbIuGgDskl7cJ1Rqxb5jWiS02Rr+Pio+3RvvYPHjSSZDURtHX7ROECzEHot
         fWn7jlwbkRLHkDhv2uswE70Txh6eerSxWxkH1/2foNTV7JjSMADI1Ck2vnZ+QD5tBiZM
         jqX/4ppVOha/DTTl8izo2n1NIcu+eXrR5S06ri8F86Zz/Lq/dPsrvrSNLUmx8dQzUWqt
         7e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338276; x=1763943076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ko3R4AfTQ14Evgu81z5D9Bb0HoJRGp65fDPRp405zc0=;
        b=QOL/Z5wDL++0BMG8gi/6jle2Z9WGjqsSzJRKw+jvWzBltscy8aTnj/g+7T4NuI4bbO
         Ti+PtOJAP1UIuA0wuXNzUooPf1/0LTx/seRZA5d62QxGb/ZQaeDg/njvX70bAWg3V3YP
         7R2CL56bxBEc62b7NtDDHMGMHm2t+LgMVH4r24d2Njej0Pf53PoeVb+VTjIw59RxqBzL
         0PTgOm/R32OmvCKeahzF7EyyYZRAByw/dPtDnZbBmCgoij7ldDN+IJ7JjyEX8wRkTqFJ
         IlR5jEp5GnxVgroxK0M90NKCTQ0XVLC8GETBYKp/JJ2+c4FezHvwclP1POW1J1tkGk1F
         l38w==
X-Forwarded-Encrypted: i=1; AJvYcCXIwG+GolMDayp5Y/+LPYe8agqrPjdMRbueosyWb13bBavfXbV1Psnf/QtMisbZgTAme/iQfeo3vS2IurF2zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztJ/em/8uFR0KeZ2LkN7zqQtwKNdDIp4ubqSmYJYRchlM4Pn1q
	isZbfoc0S3lPRJEDjLEI+3zu2Z41wpUE/DArSeEG911IlB2kBSkdDSUX
X-Gm-Gg: ASbGnctdFUsoAg4MtH8dOLgRpX7abMaYIoC4BAmFijNKQ7WctoW54KO0A2yPSaZ/Al8
	h+uBLIjPciQNJ3PkjTq/Tw7rACNfpvYZ6Xr/kkbKG6claWS5se0D654V+uwASbHLWc8IXarFnw7
	Wh7Dlw7Sn52PZVAlUeeyeYqsEiWgwNBCAOFBYedjJNs9H+d5oIrVD9Is4lrCfnTDWaiLZIPvYYr
	eielkgq1CPZ7HlCvbgTdegy//roIDl1txp6kFsBchW6vvJdMK1N7Aa+7VUmGZ35k042o1Z5lybl
	sbFa7a0wkTi1OZ0WKFItfQtgEo46jBHy2vyWyzX0zqfMff1sRX+/kFj+Cv1LLTbrUE7HzTIlOT1
	h6MGvhToNp+JoUb4+o7AL0g0tSNuniKA/2UzJaRIlGhXPEt8mhxqQ6Eb4SvncwPFMYLDuUM2X90
	vzOh2uJV/007jFbIwZlec7xRpy4GTzutF4zGk9cT2YQmtKnCh+LIgkrFqoAhf3GM9+o5MLpw==
X-Google-Smtp-Source: AGHT+IH5cFvEAKAFTBjLmZnAI2VyML29CvTKnvJDvk7ERd94KvbsPR2gdh7H1qfbacTk+eA+ytPLEw==
X-Received: by 2002:a17:903:2303:b0:295:7b8c:661c with SMTP id d9443c01a7336-2986a6f2613mr125897345ad.26.1763338275985;
        Sun, 16 Nov 2025 16:11:15 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm118374365ad.89.2025.11.16.16.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:11:15 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store support
Date: Mon, 17 Nov 2025 09:10:34 +0900
Message-ID: <20251117001035.4068507-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add atomic operation support for i8 and i16 types using volatile
read/write and smp_load_acquire/smp_store_release helpers.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45b..4c9f4f76dbdf 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
         }
     }
 );
+
+impl private::Sealed for i8 {}
+impl private::Sealed for i16 {}
+
+impl AtomicImpl for i8 {
+    type Delta = Self;
+}
+
+impl AtomicImpl for i16 {
+    type Delta = Self;
+}
+
+macro_rules! impl_atomic_only_load_and_store_ops {
+    ($($ty:ty),* $(,)?) => {
+        $(
+            impl AtomicBasicOps for $ty {
+                paste! {
+                    #[inline(always)]
+                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _load >](a.as_ptr().cast()) }
+                    }
+
+                    #[inline(always)]
+                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _load_acquire >](a.as_ptr().cast()) }
+                    }
+
+                    // Generate atomic_set and atomic_set_release
+                    #[inline(always)]
+                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _store >](a.as_ptr().cast(), v) }
+                    }
+
+                    #[inline(always)]
+                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _store_release >](a.as_ptr().cast(), v) }
+                    }
+                }
+            }
+        )*
+    };
+}
+
+impl_atomic_only_load_and_store_ops!(i8, i16);
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 45a17985cda4..09b357be59b8 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -5,6 +5,18 @@
 use crate::static_assert;
 use core::mem::{align_of, size_of};
 
+// SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
+// itself.
+unsafe impl super::AtomicType for i8 {
+    type Repr = i8;
+}
+
+// SAFETY: `i16` has the same size and alignment with itself, and is round-trip transmutable to
+// itself.
+unsafe impl super::AtomicType for i16 {
+    type Repr = i16;
+}
+
 // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i32 {
@@ -118,7 +130,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
-- 
2.43.0

