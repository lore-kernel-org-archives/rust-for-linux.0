Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760702;
	b=gPCUn5boB26c3JRgLAG5+uBpURb229gKH96sjO9FWU5YHjInnpzifYQ9meErN8zbkZWi
	 AgcCia5EYGHOIAcA7Gr4pXtoaVZGprPWHQ5Jo5KPcZjwvpcq5bzq/Aj5S9aUuOmroLGkD
	 hXqYXkE7nTd8ascpRix+djsGQxIA9u80cxFuswsOHhoHBwG/OgHcYz4cniso5TrPx2/dQ
	 xF3MY9BKAldrBYAfRGb67hk73sBEyBpmZLarAh7XY7NGa1JacFHRdtr2da/Jo0fV7WrxO
	 IZ+paKocSPctWnzLZ6ZVT9nryV1TJ+3XwGQMqL2bVWgmXfEsCL72dGsM8lMNoD7gPuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ROxYqeaskB3zBR7UCdldPcQf+eknyHmuBCA8CKrU5RE=;
	b=Yihb1Y6rh8J90VZW0m+RdRW5lLZlyJoSF/vPFES/WirYzGNap2Dn+mWle3kBvaTAj74c
	 3zeMVZstNY7d/aZqmGzWh+qZnAqeEJcMZ8RgGCu9w1w4X/KF7+Pfir7gNTuitRmIM6YlH
	 KMLNxOSQRFCdMEiNm1K9ZFNxi0mCr0vkGv4UmGcSF8KeIJzZ1uuY0cSjvlehPg87VpCPI
	 DI/mZ+SxcbQ/x7fe/VizLnfcDMxmEhPwU4rbLsBozFi9WiWFAqHpmALxAZJoGHC7iy68a
	 +YHZaGFWGiP26NHGTMIDKDkrdHVq29My84qpz69bA9zwlgZJKjOvIGnPhev4dx/WGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IwjS5uFa;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E102606A31D
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 13:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E102606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IwjS5uFa
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso226370a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760701; x=1793365501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROxYqeaskB3zBR7UCdldPcQf+eknyHmuBCA8CKrU5RE=;
        b=IwjS5uFaBMj7rmvOXnxDvxHE2VPaAahKaNzpfhSIK6dFoo5i3nBhvORr9uIIMc4g2h
         Xa8LKZ8mdRbmTVcYfkfbYZFPRfpBblKzuGeOKmGAWiLHf+V9T8q3t1Uj3J76yFJ4tkuL
         cfqHBvMdpU0tSvaCBcBtln13JeiE65rfFehFqykhWs9Weo40IBxjju4jG8Ngtk6IznV6
         7hwG1XPwL8ffUo2ZR5r/RyEKeTccl4vkKtfF0z5uYhFI/xuaDFHWcrP/5VwhS6tZiKRf
         RpUzXXMDOdeV6MomlAC0jb2FlSfKz37f7bxa3iFUpKdaUjYvrH1tets10raaChbxuRdd
         U2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760701; x=1793365501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROxYqeaskB3zBR7UCdldPcQf+eknyHmuBCA8CKrU5RE=;
        b=vBc2oyR7GqdK3f5y8gJFz27HwzkxOiRJ8nLD7Dv5djA7zCuZeMEYI4ODhqqF7AOU6C
         e3r5RI6RX5wEQKG5I7SSBAQ0YWgpDi6tT0hzJeL/b8wDB8yGVrqW/IDu3h2Jvp2OI3q4
         fpOGPt+9TpMNZZkEJNX+VIKBbww2Htd7bOqA+I+kU/7R0pkk0m2vvSwAZZurkrOTEeoC
         Oc0451hRdC+iCqOeVifVRfS4my5xklAR94Q2HBuWY7olGUDEBITKk/tKg0gE3UHBETYM
         oQTpEMqmcDcHcpakMt27yEJTE/2O9Ze8tskRuBFk/ixyAehHVQcucryAJvRy+hb0sS5J
         Xcog==
X-Gm-Message-State: AFq9FYIt75VQ0e8tGFKaMppah4l1ZtTH+6Rf0sk6+AxlNCqn6FF8njsI
	aiE2TcvCc/3yUqtwviMjDCDMXY5+unNOtjjLpbE2VBSU7oeF5eqRGfDNb9TK/V2dWqGqh0Fdfw=
	=
X-Gm-Gg: AYBFou1CMWIThon0QmBKjpEzljqeEAdmu3csFv8tdBw10NhY78yYeOk2H9iYtYIT/t8
	0MCbUcmlgjohpX5Be+6tvbSsBRFG1KHbRqIZpSof/0YzhFr4bPI39nCbBGGV7C0cC2ZNuiG//o9
	t6B6cQ8pEROBVaoMb+sHqgskSobGnnrn6bKW81e1kS6RlYSqpgQVGeJCnX8FShOjNo8RozqbHTc
	E3bOOtcZhFKWcbk12DJMi1eLAd8+6vXwhtye5GlTSUSt7uUc0AfXf/iZmB+WPE2ClSlzjnMU9Ui
	KhMOJuE1ePuF8vkAodI4h17drgSKwSc53j28j/FLCmCDfHdmf+BmU81OItTGJNZeleQAkOHp7TK
	ByP6yUNfASDNETpQroFKNId46gVIIRq+TrxfAL+9shbFCOp/C+NIaoDL7gjRNrjIk67UCBnYEee
	BPjzhuTHWQvSlgbKeRxo91YpXxQP9UdrGDvAST2JVzD/O5+YdEV4FIiykvptMTcN35Z75V5/QCJ
	Vg7hdAsfBJ4R5+iSf5IRsvr7u8Y6Q/Ob9UpCkh6ezZzZhvy13a90zNzPJSX2ulp6Z+iWopf1BlF
	+V2PG4aQWQ==
X-Received: by 2002:a17:90b:554e:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3adce030544mr1920293a91.34.1792760701042;
        Fri, 23 Oct 2026 06:05:01 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:05:00 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] rust: math: add signed division and remainder helpers
Date: Fri, 23 Oct 2026 21:04:13 +0800
Message-Id: <20261023130413.178487-4-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023130413.178487-1-chenhan0017.work@gmail.com>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delta's division and remainder implementations operate on integers and
do not depend on time units. Move them into a math module to provide a
common home for arithmetic helpers, with Delta as the initial user.

Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
and an i32 remainder, matching the results of the C helper without
exposing its output pointer. Delta's rem_nanos() uses the remainder and
converts it to i64. Both helpers retain Rust's signed operator semantics
and unconditional panic checks, using the existing C helpers on 32-bit.

Keep the Delta API and its panic conditions unchanged. Document the
quotient and remainder semantics and link to the corresponding C header.
This is separate from the preceding behavior fix so that introducing
the math module is not required for a backport.

Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v3:
- Link the module documentation to include/linux/math64.h.
- Replace rem_s64() with div_s64_rem(), returning (i64, i32).
- Document quotient/remainder semantics and explain the i32 cast.
- Adapt Delta and directly test both public helpers.

FUJITA provided a Reviewed-by for v3. It is not carried here because
this revision changes the public API to return both results; a fresh
review of that change is requested.

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 50 ++++---------------------------
 3 files changed, 78 insertions(+), 44 deletions(-)
 create mode 100644 rust/kernel/math.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..60c2af705b47 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,7 @@
 pub mod kunit;
 pub mod list;
 pub mod maple_tree;
+pub mod math;
 pub mod miscdevice;
 pub mod mm;
 pub mod module;
diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
new file mode 100644
index 000000000000..aeb61d5427a7
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Integer arithmetic helpers.
+//!
+//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).
+
+/// Divides an [`i64`] dividend by an [`i64`] divisor, rounding towards zero.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
+#[inline]
+pub fn div64_s64(dividend: i64, divisor: i64) -> i64 {
+    if divisor == 0 {
+        panic!("attempt to divide by zero");
+    }
+
+    if dividend == i64::MIN && divisor == -1 {
+        panic!("attempt to divide with overflow");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        dividend / divisor
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
+        unsafe { bindings::div64_s64(dividend, divisor) }
+    }
+}
+
+/// Divides an [`i64`] dividend by an [`i32`] divisor, returning `(quotient, remainder)`.
+///
+/// The quotient is rounded towards zero. A non-zero remainder has the sign of `dividend`.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
+#[inline]
+pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32) {
+    if divisor == 0 {
+        panic!("attempt to divide by zero");
+    }
+
+    if dividend == i64::MIN && divisor == -1 {
+        panic!("attempt to divide with overflow");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        let divisor = i64::from(divisor);
+        let quotient = dividend / divisor;
+        let remainder = dividend % divisor;
+
+        // CAST: |remainder| < |divisor| <= 2^31, so the remainder fits in i32.
+        (quotient, remainder as i32)
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        let mut remainder = 0;
+
+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
+        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
+        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
+
+        (quotient, remainder)
+    }
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 4415e91a5227..f38e2fbd2670 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -27,6 +27,8 @@
 use core::marker::PhantomData;
 use core::ops;
 
+use crate::math;
+
 pub mod delay;
 pub mod hrtimer;
 
@@ -418,24 +420,7 @@ impl ops::Div for Delta {
     /// and `rhs` represents `-1` nanosecond.
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
-        if rhs.value == 0 {
-            panic!("attempt to divide by zero");
-        }
-
-        if self.value == i64::MIN && rhs.value == -1 {
-            panic!("attempt to divide with overflow");
-        }
-
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.value / rhs.value
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
-            unsafe { bindings::div64_s64(self.value, rhs.value) }
-        }
+        math::div64_s64(self.value, rhs.value)
     }
 }
 
@@ -634,32 +619,9 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     /// nanoseconds and `divisor` is `-1`.
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
-        if divisor == 0 {
-            panic!("attempt to calculate the remainder with a divisor of zero");
-        }
-
-        if self.value == i64::MIN && divisor == -1 {
-            panic!("attempt to calculate the remainder with overflow");
-        }
-
-        #[cfg(CONFIG_64BIT)]
-        {
-            Self {
-                value: self.as_nanos() % i64::from(divisor),
-            }
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            let mut rem = 0;
-
-            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
-            // `&mut rem` provides a valid, aligned, writable pointer for this call.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
-
-            Self {
-                value: i64::from(rem),
-            }
+        let (_, remainder) = math::div_s64_rem(self.as_nanos(), divisor);
+        Self {
+            value: i64::from(remainder),
         }
     }
 }
-- 
2.34.1

