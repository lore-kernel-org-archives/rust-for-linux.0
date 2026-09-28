Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF4391855
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 18:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620789; cv=none; b=hUEMvVJyEzf5GGNlb9N3SQIgOZrLq8YFDyJpuzxTRNwUeanj5zHPXd/LeOSRqHcmZinqdBOfG4vLFEyowM4CMPAD63uLLQdcDh5G+THSkvLGJTfLfuONMKL0fZLDLkAU9DRsX0qzpk7ynrrAWyfgk4HXndqyjUT3cqC+gzNPjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620789; c=relaxed/simple;
	bh=Ewfn825KMMfQWZHKSaQmSSueVQ7i6/KPsY9fK9R06Ec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rfEM2V40WKCFgFEb8ycrKwtTRKAVCloVGUClaFuyOgSKA/xJx2s4hJXRIGQbP0gdnmTrvSfC1eQ/O4MwSlNhvD3TIlfuQ76bLWuQr7OXWoSt4u24u+FefKO9yIu6OdOYtHu9joQ/rlj/oUtRaOMwJM/rE7OMfxuN0gkxR1iFciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCwQTcZn; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCwQTcZn"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc4aa027fe4so397964a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790620787; x=1791225587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IOOwv7IZ0QI+lpXyM098yh42pUbvn2jib46/JVSv4g=;
        b=DCwQTcZnmpp6yvpJOw9RQhELLtoW+YD7LvOZIIoAvHo5aEe6QPWwPDjQ8saK7tu/mM
         AuvqVTT1hSqWEez6jR4fw2SpR1/JLZot5kXDq5wFv9ts015eSqSloscIHe8+T7Ifz76q
         367qcoIq2/UsqJrlgiItqBe0pan5n82x3NDjcM+7xf8BHvzPzVis8QyPGXO33t54sMJN
         j4LYTYpEeFOfTmH1485YvN8ZBn31dBi9C4YKhfarE5t+P+nioXwcU4Vb+o4ceaLNCOkE
         NbAmN4K5DUnsypwKJ1CxhohZMOptrAPqO3axx1BeUuG7a2OuyHFAWg1XZ5AVDrUHwUeO
         ojHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620787; x=1791225587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IOOwv7IZ0QI+lpXyM098yh42pUbvn2jib46/JVSv4g=;
        b=Py2DuKd3gd/HpYwjgxLLOYj9bF/VxmhA8Gxb/hZXtk67lWTTMNJgqy2P6EDetzWwuj
         9G7QvIIjjiYIlVClB4SDgmuUG9UwIVgnl1QQK/OCJcCkiI/Yqv8Lh+9adg39bsqLbyip
         mw4V+Ksd2VeiPULwFBgiKov2MXZcxSSp1891lzogTCzJR8Y0g2GgvQr0ezRrba/BUoOd
         EQYhX98kuEP2RZnkV70xtxFSPu88X8lZgh8HnkKy2Pa0IbfCPs7sqm4Y5F2b/QOmBE1h
         990lP6mikzRJIpr1kGTaccHDarDTKUdup0MTFEoBBQ7/d+gsZM1LCrLrG2EWAKx9jICX
         RzZA==
X-Forwarded-Encrypted: i=1; AKwUvBxo15VOikKljQk2voCxQ9dEfGmtq6hbX5sF+LcPO28vOIlXdlUEYvzRkhYxgIxG7UWocq49xi74FosYG7LMGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mVkT9QOtaWHZZoRd3yGkBdxfrTdgRJJKDRkp/8H+J5bgN454OX
	Noh4UrmRsnXFBVt8I2DAjkDixd/yXCJniGm2NBRTZ6ZzJbvK3jBtsp8=
X-Gm-Gg: AYBFou38uFsH8oy5kOAkfJgMvcFhFVn5sfF38Tmczujw3fT9A9O0ZWGCrv+tgdEw7/W
	Krj2v19BHW3jGIoFYBc4gvChCa35SOiJOibqy9HAEV3stjX4WXl2fPHAXIb3gnGwNvqEqGb1mn1
	+iA8ozFoiz8v4llOmZYEdnbNidG/9uaCqy5RDF1MAnVxiqluDooOceYYH9I8uPdV7osxvxOO/WU
	9RQ3N7/FuXsEKj+3A6jdWZCUfylnrqtbvN+G9NYV7LKHp1knJb7uPLIT+YKtzEh8z4G1OtpUbX1
	qlT4/OlNziRRvMzIJwj5TzsZYifgdXSaKaThF29BJmCketI7Gc1HM4/YNC5yqFvUC2Rhn80ZCPf
	c4kNNtWb0fsnRCYCpk/70Xtreay2kZkcpUkHZG7TJlozxA18mdxcwmRSb9PYe35uigYf3myM85Q
	avEY5CP3O8obyn1qxou24HTAaCO0SCgfryf0GvfDkaSi2wAqnc7hU+YbLJ95MXO9NH2f5HeDv45
	HQ/paLZL4oCUMcHocps
X-Received: by 2002:a05:6a00:b46:b0:881:b503:6425 with SMTP id d2e1a72fcca58-881b50369demr5738321b3a.12.1790620786465;
        Mon, 28 Sep 2026 11:39:46 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a14:7dc0:101:1565::2bf2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf83e0fsm4511336b3a.37.2026.09.28.11.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:39:45 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: a.hindborg@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: time: make Delta division and remainder fail consistently
Date: Tue, 29 Sep 2026 02:39:25 +0800
Message-Id: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 64-bit, Delta division and remainder use Rust operators, which panic
for a zero divisor and for the i64::MIN / -1 overflow case. On 32-bit,
the C helpers do not provide the same behavior, so the same API calls can
return architecture-dependent values or emit a divide-by-zero diagnostic.

Check both invalid inputs before selecting the architecture-specific
implementation. This gives both APIs the same panic conditions as i64's
`/` and `%` operators and documents them in the public API.

Tested on x86-64 and ARMv7 QEMU with CONFIG_SAMPLE_RUST_REPRO=y: zero
divisors and i64::MIN / -1 panic for both APIs, while 10 / 3 returns 3
and 10 % 3 returns 1 on both architectures.

Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations for Delta")
Closes: https://github.com/Rust-for-Linux/linux/issues/1254
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
 rust/kernel/time.rs | 103 +++++++++++++++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..55c90365ba73 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -405,21 +405,65 @@ fn mul_assign(&mut self, rhs: i64) {
     }
 }
 
+#[inline]
+fn div_s64_or_panic(dividend: i64, divisor: i64) -> i64 {
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
+        // SAFETY: `divisor` is non-zero, and both operands are passed by value.
+        unsafe { bindings::div64_s64(dividend, divisor) }
+    }
+}
+
+#[inline]
+fn rem_s64_or_panic(dividend: i64, divisor: i32) -> i64 {
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
+        // SAFETY: `rem` points to a local variable and `divisor` is non-zero.
+        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };
+
+        i64::from(rem)
+    }
+}
+
+/// # Panics
+///
+/// Panics if `rhs` is zero, or if the quotient overflows, i.e. if `self` is
+/// `Delta::from_nanos(i64::MIN)` and `rhs` is `Delta::from_nanos(-1)`. Both
+/// cases panic on 32-bit as well as on 64-bit; see `div_s64_or_panic()`.
 impl ops::Div for Delta {
     type Output = i64;
 
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.value / rhs.value
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            // SAFETY: This function is always safe to call regardless of the input values
-            unsafe { bindings::div64_s64(self.value, rhs.value) }
-        }
+        div_s64_or_panic(self.value, rhs.value)
     }
 }
 
@@ -554,29 +598,26 @@ pub fn as_millis_ceil(self) -> i64 {
         }
     }
 
-    /// Return `self % dividend` where `dividend` is in nanoseconds.
+    /// Return `self % divisor`, where `divisor` is a number of nanoseconds.
+    ///
+    /// The result has the sign of `self`, and its magnitude is strictly smaller
+    /// than that of `divisor`.
     ///
-    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-    /// limited to 32 bit dividends.
+    /// `divisor` is a 32-bit integer because the helper called on 32-bit
+    /// platforms, `div_s64_rem()`, takes an `s32` divisor. The dividend (`self`)
+    /// is a full `i64` on every architecture, so the width restriction applies
+    /// to all configurations, not only to 32-bit ones.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `divisor` is zero, or if the division overflows, i.e. if `self`
+    /// is `Delta::from_nanos(i64::MIN)` and `divisor` is `-1`. These are the same
+    /// inputs [`ops::Div`] panics on, and the same ones `i64`'s `%` operator
+    /// panics on. See `rem_s64_or_panic()`.
     #[inline]
-    pub fn rem_nanos(self, dividend: i32) -> Self {
-        #[cfg(CONFIG_64BIT)]
-        {
-            Self {
-                value: self.as_nanos() % i64::from(dividend),
-            }
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            let mut rem = 0;
-
-            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
-
-            Self {
-                value: i64::from(rem),
-            }
+    pub fn rem_nanos(self, divisor: i32) -> Self {
+        Self {
+            value: rem_s64_or_panic(self.as_nanos(), divisor),
         }
     }
 }

base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
-- 
2.34.1

