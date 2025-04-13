Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA52EAE6
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541831; cv=none; b=cT0vIsqnpQl1L+gTRhA2vrBi7zconf2yUAfyIlz9Hs4nqK0quAvTV+hAwPGqpRUBK/9hoKPILm4cvViOy03N1+62bFiSM9RnjhwqC4L+LRNvaZng1KnChlHU1O+M5p31MX6rwdCKhf7WqHLkwJlIPy25wkdC+tKwr0gJ3odL138=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541831; c=relaxed/simple;
	bh=HRpk4crhti5v+DjVB50QZ7UJDRryOozqiBPlUeuBkOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkiSBXu6UPu/1B9m3RQ347ehqWDBfkQdOr2oETbIP9CpmmNxKw84B1k3jqJEIFf04l9ujOjcon3yHh+5aZp2cqrFdmnFoCUatY7DK1iiahfAu4fi89bLmLZf/erbY/xP9sxE8h4FEICcYCR9v+N2heZpWQkiMlna3+FmY88d0pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz7iX/ml; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz7iX/ml"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301cda78d48so3224413a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 03:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541829; x=1745146629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9Nj/sXoAwJRSzABPjN/TSW8p1e2JSrmwtwqk546+f0=;
        b=Iz7iX/mllgYiG7/2+2zUiiCNoWB5/Nb9ytuZApszQgAVrLK10vG3eIPilNNep+UrBP
         WkOjvolJ7F+h7FGQbnUdoTfAQL0p828tahrOoWj+CRy3Q+J5l93BgK+l/qK/wbLCLAVA
         T6eHcl8RZhTlPK/Y49/LZQoKIIlDqvYHj0ostDMLMcGnje3RcZcrhJLVxl3hSTNWOooq
         Jm6Hr8sJch9uifL7htLbkGAlt4HVMcxzL+w+JRL4c5dCE5x1D9df/D80R0il2EjJ7kIi
         R5PQnTSjNe4SpAzBmkdIJhb2eqx+Ij6Y7t59KvAM31GTy7GaLaB9643/KuusWTecbNTA
         vAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541829; x=1745146629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9Nj/sXoAwJRSzABPjN/TSW8p1e2JSrmwtwqk546+f0=;
        b=HW+PdlfuTc+IEvjiZW8ngDSGPvFp3W58T/Fjigk9eeFJFWKfybRR/nuUifEVd86t7W
         tEO8i8G2P09wztwV5H5bEUNP9Hi+O/z6PbrJBvZh6FI4Myjh10S9JXBhM++qmug/xPdj
         3zIbdzGyIElZ3SE4X86l5IV8fW0QXdQ88KIbbtaFgsE2kgDGySYrz16RW5K10VCBDrN5
         /nQq3baqItzqTPM+Ltq4kj26VCvoPNoEnoJdKaIrix2q2GEVFAIKZ5G2b/II/9KhLIIv
         HEGQSlPykolpDgfxo92+Hvz6cWRnS8rtIG6nNwSTRZqn2mULz5mtc78sBwZfh3FN4+g1
         gpOw==
X-Gm-Message-State: AOJu0YxbKjKoKw0QozZDkYX6z3STQIGRYmoGTDFfhbIvBmP75QhgBIlS
	ofbsKWNySZe1K0JvmsisNY6EzJEwOGtwsfQzYgEh2bhawEXeyarsxW6DH6oX
X-Gm-Gg: ASbGncuQf8Cb/CfB1dCGPmGC37MbOYJtV5y9tVsNp/S0uBQS2KOnTgA1tz6EHxVjreE
	0VpI7nVS76cya3LGx3YR4WZDVvaGYsdjkSneR9XXHqiF1aGJ1C0st2vACX6QZKgmcpKG2zyeU7P
	b4FwlQQPpvU7q29+M7gvylP/lLVHHONr2DZggnGgxZofzit2tLC5WphZV9rPjcVI+/LcwL2pJJD
	ZX/xJvhjOevKu/AhSF/15rPRGD4NL6xCRX4ZfSaOUKDibWbjHXPx67aL2pm82lKBVppc4DGtS8h
	sJu13vM8VFEkmoeOHJJqUAX6JzaaONxbcApUK+Sv9te8MmGtL7PVXs6twhw9NDiFXTAuzm4tE/g
	5NjccBVXeRL91HqX7iw==
X-Google-Smtp-Source: AGHT+IEUZMJ/S6uiHh5+EE6Xx9v/9oy8rwOYx+BKMp2FJrAlSMcBanlma/K+/+eXwQrb0bD4lu9ENg==
X-Received: by 2002:a17:90b:17ca:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-308236281f7mr11278778a91.1.1744541828687;
        Sun, 13 Apr 2025 03:57:08 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccab77sm80667215ad.214.2025.04.13.03.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:57:08 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: [PATCH v1 3/3] rust: time: add ktime_get() to ClockSource trait
Date: Sun, 13 Apr 2025 19:56:28 +0900
Message-ID: <20250413105629.162349-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413105629.162349-1-fujita.tomonori@gmail.com>
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the ktime_get() associated function to the ClockSource
trait, allowing each clock source to specify how it retrieves the
current time. This enables Instant::now() to be implemented
generically using the type-level ClockSource abstraction.

This change enhances the type safety and extensibility of timekeeping
by statically associating time retrieval mechanisms with their
respective clock types. It also reduces the reliance on hardcoded
clock logic within Instant.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c | 16 ++++++++++++++++
 rust/kernel/time.rs | 32 ++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 7ae64ad8141d..613475c529d4 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -1,8 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/delay.h>
+#include <linux/timekeeping.h>
 
 void rust_helper_fsleep(unsigned long usecs)
 {
 	fsleep(usecs);
 }
+
+ktime_t rust_helper_ktime_get_real(void)
+{
+	return ktime_get_with_offset(TK_OFFS_REAL);
+}
+
+ktime_t rust_helper_ktime_get_boottime(void)
+{
+	return ktime_get_with_offset(TK_OFFS_BOOT);
+}
+
+ktime_t rust_helper_ktime_get_clocktai(void)
+{
+	return ktime_get_with_offset(TK_OFFS_TAI);
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index db9a783631ec..4b9b61eed628 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -63,6 +63,11 @@ pub trait ClockSource {
     ///
     /// This constant corresponds to the C side `clockid_t` value.
     const ID: bindings::clockid_t;
+
+    /// Get the current time fro the clock source.
+    ///
+    /// The function must return a value in the range from 0 to `KTIME_MAX`.
+    fn ktime_get() -> bindings::ktime_t;
 }
 
 /// A monotonically increasing clock.
@@ -80,6 +85,11 @@ pub trait ClockSource {
 
 impl ClockSource for Monotonic {
     const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
+        unsafe { bindings::ktime_get() }
+    }
 }
 
 /// A settable system-wide clock that measures real (i.e., wall-clock) time.
@@ -100,6 +110,11 @@ impl ClockSource for Monotonic {
 
 impl ClockSource for RealTime {
     const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_real()` outside of NMI context.
+        unsafe { bindings::ktime_get_real() }
+    }
 }
 
 /// A monotonic that ticks while system is suspended.
@@ -113,6 +128,11 @@ impl ClockSource for RealTime {
 
 impl ClockSource for BootTime {
     const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_boottime()` outside of NMI context.
+        unsafe { bindings::ktime_get_boottime() }
+    }
 }
 
 /// International Atomic Time.
@@ -130,6 +150,11 @@ impl ClockSource for BootTime {
 
 impl ClockSource for Tai {
     const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_tai()` outside of NMI context.
+        unsafe { bindings::ktime_get_clocktai() }
+    }
 }
 
 /// A specific point in time.
@@ -153,14 +178,13 @@ fn clone(&self) -> Self {
 impl<C: ClockSource> Copy for Instant<C> {}
 
 impl<C: ClockSource> Instant<C> {
-    /// Get the current time using `CLOCK_MONOTONIC`.
+    /// Get the current time from the clock source.
     #[inline]
     pub fn now() -> Self {
-        // INVARIANT: The `ktime_get()` function returns a value in the range
+        // INVARIANT: The `ClockSource::ktime_get()` function returns a value in the range
         // from 0 to `KTIME_MAX`.
         Self {
-            // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
-            inner: unsafe { bindings::ktime_get() },
+            inner: C::ktime_get(),
             _c: PhantomData,
         }
     }
-- 
2.43.0

