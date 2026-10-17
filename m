Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEBD3C3F4F
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235550; cv=none; b=WGfh2E5Olx73DoLlGVbtmoFh5Aq29NxETbz5gco82XOuXrL/D7egiz5EiN6kO3gsagamzEWdm8s/1SzdPUg+tWH0p7GUeV3I8ewV7O5V4GaXItvWUyehmfIEqKHlY3G9eB6qODF0/mjwogo73QLmmwq16c+nmBkbOFPnRmiFCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235550; c=relaxed/simple;
	bh=74CJvqEkKfBRvXbARPjEwO0NtcDktQ/9IMFbr6zewug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R3X9tbzxgFmAcMuKjUGMJXg97BGtlUa3MqSn69JweyuSY0Im4Wrwmgtr+shPL0RbW9agX5U4fmd/MghskCQ1R0pkmdPg6k6Mxq6gqAYdvUql4fDT+5YLzPqrxLOZKQakVBSmmQ/ZmLtfu6HECRl53EIp2R8aI/Nkah1REoQlp6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faxHU70o; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faxHU70o"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac92391681so170069a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235546; x=1792840346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0pzh+DYQAeNLy2B/gc/tk604xzKWdMKlKXdt2hdJDA=;
        b=faxHU70oz13rVCG1nKTA6f5bWh8we5lRPxuugbbx68UzG4IF61vn17kHRg3Q9c3XJ4
         5XZ04N2EEwYJ66cwWnM9MtHESVCul+LqAsJj7VRhuwjVGYgaL+6MRU5OqS5xOG/RTc3y
         zWZUg2hWE9upUrNqPHuNb8/8WReMlAswKFIQ3poHkvYlXJrTOosCpJKrAalC0UfdXRlH
         dxEZ0ZT1IzI+AJ5YQnymrinF+U7O9iTQoeDch5W2ThHIR36z8kXhSFzQLg8pSapA4D7L
         RMZ24VfumWE9zYzFEyvugHib29P9L+3rxhPxUJFvahOmgM+lGcxWZU+ohuxkbniolO7I
         8Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235546; x=1792840346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0pzh+DYQAeNLy2B/gc/tk604xzKWdMKlKXdt2hdJDA=;
        b=Ds5wIk5Ol/g9t5R6Agsb2Ph4edsAR/+/iwqPBUQppp57qY8BWazL9ot+4D3oEhHPbq
         ys+Np52kmmvLuivZA8I+YUFIFlNfzRwb9Uvc8onl0+dwbZ5PVydMAQQqS+fTFuvKjUiH
         vgsQUBMWc07ZlSdmggRCmbJtDgh6ibzo7KQECjayU3lTTwHfjcvia1HbpuCScpsOG7cL
         AQDJmeorFrLli7EsyXyjndnYdmwFyh5edlsg03OUThce7QDyft+TFtVX9u5HfArlEzjL
         vrYdhqix9FhKyrHGatDllBGFBJYUymnyUo9bgQEOs9Ar0lUY47iEcp1PqQzEh5INjkvt
         Vaaw==
X-Gm-Message-State: AFq9FYIBkKDzaeJhbzjzUNThliEMFXPaugRzKT/+r1n3RTM0qHpbAGRb
	PkoAuEaffUExdrTE8eYlgzP48LHZjVa/5wNXMPcVApeaZWpdOpgq5uk9BWJvtMR69w==
X-Gm-Gg: AYBFou1bxysyMgn6+BYe0zfbLvmtH/YSt9yS5+mqfnJla6wRWHLIyKKlvRoXTIDNNZs
	baB5Ucm5JxZzIsc940oGCYujQQ/FWK5zYs84gRlude2pJg8xEsKNVcTNLfEe0lSDYUI0pJWZO3b
	jbKE+HUNWeuz70UPtyCzjYuakme/m8fzx/rybA0MWcGWlfO+4YvgGXcdGOMYCUCckkIlrV+WW4L
	6HTO/VfQgEJVskch5i1J4fVpNNs5K+8hn+eRr2rrknEOWtNBCKbtpirTrlXvUjmzSvcstRr8B1B
	T5G7UCUXipdoset31cQNH3rnsB426JI+d7L+HB8aae5fIgm4D8em1NlcZKTltrJ8SDbsubh0wJ8
	gl8uqi1OAA5WwdKvc5imZWh92gRXdN+hxCTD13JmYgvJ9+X1AE74gXw7wDF0fpt/quTbU9F8wm3
	ghvwZfSwlS/VjrHh+OtKvmjhuZp4pGJoBS0JzmSbGYqsl+g5q8jBFwIgJXLru3Fk1pdOJpm5MIy
	jGq8xG3Og8WPatZLvgTWd1cQC0R
X-Received: by 2002:a17:90b:4d06:b0:3ac:9f00:3bb5 with SMTP id 98e67ed59e1d1-3aceefa8a39mr1862524a91.38.1792235546044;
        Sat, 17 Oct 2026 04:12:26 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a0c:9a40:9205:1:be24:11ff:fe93:ff0e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm2974687a91.4.2026.10.17.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:12:25 -0700 (PDT)
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
Subject: [PATCH v3 3/3] rust: math: add signed division and remainder helpers
Date: Sat, 17 Oct 2026 19:11:34 +0800
Message-Id: <20261017111134.22546-4-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017111134.22546-1-chenhan0017.work@gmail.com>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delta's division and remainder implementations operate on integers and
do not depend on time units. Move them into a math module to provide a
common home for arithmetic helpers, with Delta as the initial user.

Expose div64_s64() and rem_s64() so driver crates can use these operations
without constructing time values. The division helper takes two i64
operands; the remainder helper takes an i64 dividend and an i32 divisor
and returns an i64. Both keep Rust's signed operator semantics, including
the unconditional panic checks, and use the existing C helpers on 32-bit.

Keep the Delta API and its panic documentation unchanged. This is separate
from the preceding behavior fix so that introducing the math module is
not required for a backport.

Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 49 ++++------------------------------
 3 files changed, 70 insertions(+), 44 deletions(-)
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
index 000000000000..34ca097caac9
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Integer arithmetic helpers.
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
+/// Returns the remainder of an [`i64`] dividend divided by an [`i32`] divisor.
+///
+/// A non-zero remainder has the sign of `dividend`.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
+#[inline]
+pub fn rem_s64(dividend: i64, divisor: i32) -> i64 {
+    if divisor == 0 {
+        panic!("attempt to calculate the remainder with a divisor of zero");
+    }
+
+    if dividend == i64::MIN && divisor == -1 {
+        panic!("attempt to calculate the remainder with overflow");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        dividend % i64::from(divisor)
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        let mut rem = 0;
+
+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
+        // `&mut rem` provides a valid, aligned, writable pointer for this call.
+        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };
+
+        i64::from(rem)
+    }
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 4415e91a5227..e297d327953f 100644
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
 
@@ -634,32 +619,8 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
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
+        Self {
+            value: math::rem_s64(self.as_nanos(), divisor),
         }
     }
 }
-- 
2.34.1

