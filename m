Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D24399C2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757086; cv=none; b=AYpVfTR60zOSiJW0SuHXZ1F7KNbeT437c1Eqfc6SzgjLguPUPFTdyV9AZR8ylgt0FQK9mgwhLYKW4tlSIQHtbP+RjaBm2kYTLoVkftHYXtyBJ2BiEEyU7FebJGaB4HjZnsy8s55AAMIi7yARVvd/P5U3zW/W96X6n5RvyB7ykv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757086; c=relaxed/simple;
	bh=8F8RuNGFEz/AtJtM98W0SDG+tZLsHdhYzZKBCa7Ftwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwXxJxz0Zu06vI1NY2nMBX8Hvzq8gr2qhWzZvmOwOgsSlmh20zJc6cTvtrAZ6AfHAtZ2rvAMZdVApU0WV41hB/mXP7fPY3kAI9fsE0BtpWe+iF/sjHxZvz4SIl4ae5n4oIeY82X5u6xDUb8AWhRv9rTBISeb++3+g509wmA9ykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Ey4Xlkw4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dQmtVddm; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Ey4Xlkw4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dQmtVddm"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id AC68513007C6;
	Wed, 22 Jul 2026 17:51:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 22 Jul 2026 17:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757081; x=
	1784760681; bh=j/YlaVecCqeUqpuwKfapH4ZjIrRoaIsWlfVDnbnciGc=; b=E
	y4Xlkw4MeAk3TmRtt8VdjI5db6NH/yS66qNQ85+f80JhiQ+hR77RLsZTECXae/3p
	sdhhEV3I9EK/BL2ACFmZywSwO+p3GAqSsVkiTK6Hp8zgr9XzKsqURWqifORZVEU5
	1N347tY04zV4haW9IyZgHzSKBe4CzXKdRAunTbyBbXQ8MznmajxNoyhMh1TIo3eX
	JIKNMFfCt8f7j5rmnpyTaUnRolyLpQkuQbgO+fz0hQv17ZNBcksoNWaKuCgYjrRT
	FzDPJlCeHcB1pJd6YEsA6XmP/Ki857DggVFFspRuGuqqbY9tP7q/Zg6PbNKR7rhe
	jVcmqIoCtWS8v8cIka75g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757081; x=1784760681; bh=j
	/YlaVecCqeUqpuwKfapH4ZjIrRoaIsWlfVDnbnciGc=; b=dQmtVddmQ9XlGO6DB
	rSU9WgT31hdLohQN9SemSwRk5TAhxrP8Hl84ZAmPGaLkq+iuUrD0odTslUhE9SKh
	d3kqMIBbMbJPc2HkzcxFiRKtiOlmJSvM2N51IUVEbMgpqnuIlZliGrLpKnBXQmRx
	pCYiMLIfcuY49/FQjfBbJBoyoePFnA389+XcpcdMuj6OOOodSktMItGhyBVtvQyW
	uS/JScMxDq+t3iK/1HVuktKj5pvScsv2eVmTxSQTySXSBdKJlXwu54udrTfCKNyp
	5lfqSu8N/aLESjnnoZc3hQaEgnG1pY35MuIhP9zbrR9MLpCu6NStICF0vYKiP+nc
	eYN+w==
X-ME-Sender: <xms:WDthagW2GqoEL_R56cHdAAafjJQGoL9e4NLeVYjAjQOlorWT9sgUIg>
    <xme:WDthagstJuiF_5tIdx-2aUEFRTuZ_PRJUZz35zO05E53vq0ff4Xgw-Bw3JQ1uEX-h
    Bvp6PVydad9oF48IL3MH0YY1XYOD9oAn_yfueeea1AMwIpJZWketUo>
X-ME-Received: <xmr:WDthagNcJ128UsFwYENBVBve5ZUaLaL-M0iBWYPwvJN52PKmBTlzAXNT1gb5Bzsm2Ru5YO-v1WgKwSTAMm4>
X-ME-Proxy-Cause: dmFkZTGuoNy9B4Nm4eUiSt/VO/ZwmCQP+pc5e41if9fnwGdZOMxeWyXy+Utey7GravQTWS
    muAn+B62eren/+/qU3EjCcmq1A6Eqv/2TSGyUXtamSBV1XbJXh0burYHMsiltX+K3CtEff
    Wco0eXJKyhY0hcEwzWNRu2xlxwLsydcKZzw9PWSXF6a5FRETjsjcJ2OKj6rTuDQTgABHtb
    ILguifJG57tR2Wc7xaCTnmZVRe6QvnD67FskWzmUPI2exQarWI/gxcbziaEnx1ptUC9fe2
    5uCFs5iP9pgb++LyH7dLUYB5glPYeF9nYP1PyEK9FtB8D5G90yfpz901nPJyFMuBsApRJm
    b23eZHHkgP3IpSI4VilpGkqIXn8YCyKs9on3II9Lu/h/o9L8dIp/mTPkBgwAXVVsrwGvs1
    dbuFssk9/rLCx0aZQ8pR3qiOnj0ywPVhM5WJFgsXNsWRsPFHlZ+KEdxF7poVqvM4oGpK23
    lXS9r9Onx3XSkvPjwO9209/QFmnBze0J05CzyWc5thPkQv9v8m9Un+hi1tHbesLno1YAEL
    2ezk6itkIUiLlTbiCwAW45KNGunTor4boawI/jVb81ba9ywi/co7T7Jm8jyWTt6tkZXg6j
    ogTUgr8jJy0EiJZrUOOywOPq9rUY1vuBwHdPWqGyKAwQHqQ7ih7bvxiUSglQ
X-ME-Proxy: <xmx:WDthaop6jQZhUpTUwZ9oLsswSRU_GRdTJ1tiSVWJ_KdGfJF12uW3kw>
    <xmx:WDthaqvZi4bbnMVs2mHOvTGHUBv0AbgmmmbLQGrnrw15zk5sdydYuQ>
    <xmx:WDthaohFLjwtJZJ6YVTf-e6r6R7CTjvb0R3dGAIxARqyLPSt9zrJoQ>
    <xmx:WDthau0n-D8uOPTb_1Fl6Tz0Keph0LxUdTseGNz-pJobb_SrjXRDtA>
    <xmx:WDthanp0HozlG0cErpPOi_y2x_h9tMQHaXdU2U9W34AgzvWOm4JSyq2s>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:14 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 1/7] rust: time: make Delta generic over its time unit
Date: Thu, 23 Jul 2026 06:49:45 +0900
Message-ID: <20260722214951.72941-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Delta hardcodes its value as i64 nanoseconds. A later patch adds a
jiffies span, whose natural representation is isize jiffies rather than
i64 nanoseconds, and a separate type per unit would duplicate the
arithmetic and comparison machinery.

Make Delta generic over its time unit so the jiffies span can reuse that
machinery. The nanosecond Delta keeps its current representation and API
via the default unit parameter, so no functional change.
users.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 72 ++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..8c01ca62b471 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -246,7 +246,7 @@ impl<C: ClockSource> ops::Sub for Instant<C> {
     #[inline]
     fn sub(self, other: Instant<C>) -> Delta {
         Delta {
-            nanos: self.inner - other.inner,
+            value: self.inner - other.inner,
         }
     }
 }
@@ -258,7 +258,7 @@ impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
     fn add(self, rhs: Delta) -> Self::Output {
         // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
         // (e.g. go above `KTIME_MAX`)
-        let res = self.inner + rhs.nanos;
+        let res = self.inner + rhs.value;
 
         // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
         #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
@@ -278,7 +278,7 @@ impl<T: ClockSource> ops::Sub<Delta> for Instant<T> {
     fn sub(self, rhs: Delta) -> Self::Output {
         // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
         // (e.g. go above `KTIME_MAX`)
-        let res = self.inner - rhs.nanos;
+        let res = self.inner - rhs.value;
 
         // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
         #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
@@ -291,14 +291,38 @@ fn sub(self, rhs: Delta) -> Self::Output {
     }
 }
 
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::Nsec {}
+}
+
+/// A trait for time units.
+pub trait TimeUnit: private::Sealed {
+    /// The underlying representation of the time unit.
+    type Repr: Copy + Clone + PartialEq + PartialOrd + Eq + Ord + core::fmt::Debug;
+}
+
+/// A time unit of nanoseconds.
+///
+/// A [`Delta<Nsec>`] stores its value as `i64` nanoseconds and can represent
+/// any `i64` value, including negative, zero, and positive numbers.
+#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
+pub struct Nsec;
+
+impl TimeUnit for Nsec {
+    type Repr = i64;
+}
+
 /// A span of time.
 ///
-/// This struct represents a span of time, with its value stored as nanoseconds.
-/// The value can represent any valid i64 value, including negative, zero, and
-/// positive numbers.
+/// The span is stored in the unit given by the type parameter `U` (see
+/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
+/// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
+/// positive.
 #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
-pub struct Delta {
-    nanos: i64,
+pub struct Delta<U: TimeUnit = Nsec> {
+    value: U::Repr,
 }
 
 impl ops::Add for Delta {
@@ -307,7 +331,7 @@ impl ops::Add for Delta {
     #[inline]
     fn add(self, rhs: Self) -> Self {
         Self {
-            nanos: self.nanos + rhs.nanos,
+            value: self.value + rhs.value,
         }
     }
 }
@@ -315,7 +339,7 @@ fn add(self, rhs: Self) -> Self {
 impl ops::AddAssign for Delta {
     #[inline]
     fn add_assign(&mut self, rhs: Self) {
-        self.nanos += rhs.nanos;
+        self.value += rhs.value;
     }
 }
 
@@ -325,7 +349,7 @@ impl ops::Sub for Delta {
     #[inline]
     fn sub(self, rhs: Self) -> Self::Output {
         Self {
-            nanos: self.nanos - rhs.nanos,
+            value: self.value - rhs.value,
         }
     }
 }
@@ -333,7 +357,7 @@ fn sub(self, rhs: Self) -> Self::Output {
 impl ops::SubAssign for Delta {
     #[inline]
     fn sub_assign(&mut self, rhs: Self) {
-        self.nanos -= rhs.nanos;
+        self.value -= rhs.value;
     }
 }
 
@@ -343,7 +367,7 @@ impl ops::Mul<i64> for Delta {
     #[inline]
     fn mul(self, rhs: i64) -> Self::Output {
         Self {
-            nanos: self.nanos * rhs,
+            value: self.value * rhs,
         }
     }
 }
@@ -351,7 +375,7 @@ fn mul(self, rhs: i64) -> Self::Output {
 impl ops::MulAssign<i64> for Delta {
     #[inline]
     fn mul_assign(&mut self, rhs: i64) {
-        self.nanos *= rhs;
+        self.value *= rhs;
     }
 }
 
@@ -362,25 +386,25 @@ impl ops::Div for Delta {
     fn div(self, rhs: Self) -> Self::Output {
         #[cfg(CONFIG_64BIT)]
         {
-            self.nanos / rhs.nanos
+            self.value / rhs.value
         }
 
         #[cfg(not(CONFIG_64BIT))]
         {
             // SAFETY: This function is always safe to call regardless of the input values
-            unsafe { bindings::div64_s64(self.nanos, rhs.nanos) }
+            unsafe { bindings::div64_s64(self.value, rhs.value) }
         }
     }
 }
 
 impl Delta {
     /// A span of time equal to zero.
-    pub const ZERO: Self = Self { nanos: 0 };
+    pub const ZERO: Self = Self { value: 0 };
 
     /// Create a new [`Delta`] from a number of nanoseconds.
     #[inline]
     pub const fn from_nanos(nanos: i64) -> Self {
-        Self { nanos }
+        Self { value: nanos }
     }
 
     /// Create a new [`Delta`] from a number of microseconds.
@@ -391,7 +415,7 @@ pub const fn from_nanos(nanos: i64) -> Self {
     #[inline]
     pub const fn from_micros(micros: i64) -> Self {
         Self {
-            nanos: micros.saturating_mul(NSEC_PER_USEC),
+            value: micros.saturating_mul(NSEC_PER_USEC),
         }
     }
 
@@ -403,7 +427,7 @@ pub const fn from_micros(micros: i64) -> Self {
     #[inline]
     pub const fn from_millis(millis: i64) -> Self {
         Self {
-            nanos: millis.saturating_mul(NSEC_PER_MSEC),
+            value: millis.saturating_mul(NSEC_PER_MSEC),
         }
     }
 
@@ -415,7 +439,7 @@ pub const fn from_millis(millis: i64) -> Self {
     #[inline]
     pub const fn from_secs(secs: i64) -> Self {
         Self {
-            nanos: secs.saturating_mul(NSEC_PER_SEC),
+            value: secs.saturating_mul(NSEC_PER_SEC),
         }
     }
 
@@ -434,7 +458,7 @@ pub fn is_negative(self) -> bool {
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
     pub const fn as_nanos(self) -> i64 {
-        self.nanos
+        self.value
     }
 
     /// Return the smallest number of microseconds greater than or equal
@@ -477,7 +501,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                nanos: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(dividend),
             }
         }
 
@@ -489,7 +513,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
 
             Self {
-                nanos: i64::from(rem),
+                value: i64::from(rem),
             }
         }
     }
-- 
2.43.0

