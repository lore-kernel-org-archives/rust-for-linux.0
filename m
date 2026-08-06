Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AA3822AA
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001593; cv=none; b=Uz0+d5P7IdFtDiIEJ/R+zZB/Ky7AKoLU+vhkOFsj3MMQeI93LkU0WNU1s4TtA3BLSG3lvmeSQiRErSBJk73aT/heqHMgYESGS97S99Y0yz/fNaYkvry3Dkzxj9Jzj3wIprCKCLSikAeC7CGcbHpxatQL1Q4vzRWiu8HuEjOTtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001593; c=relaxed/simple;
	bh=FL9AwOMJ7xTCrrgnVYgPbMkAm+R3Da7a/hg/pHUvP9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhitkzCYuahFoVLu4S5H/gx1HhT1HsmIyMT2Pd4aUjxN8xVnWwIXxJk1UC26O7WNEJcO7OgCr16lh0ol/CbWBoqz99KHIzCofGLxDa+miu6rPnFd514lVuejcP9Jbu7UTaDttj2E8z5IxEI8aRjPracgwb8hznDsZyZHKK2HxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WhyzOLwq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PG0ADM+N; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WhyzOLwq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PG0ADM+N"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 28D801380231;
	Thu,  6 Aug 2026 03:33:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 06 Aug 2026 03:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001591; x=
	1786005191; bh=fyBsFp2Gm3To1VdIzzEx2YkdpYkBouIQpfSktn98GZE=; b=W
	hyzOLwqvMr4gSQqbFOFJ0YgFz4H/AGQjFTP/cZ7PmTFKgZvE9Lyfy2lSmMbiX7In
	AbERO/g3jU0pYKinmKdxOI7qZ3dZ3mTO2LYGp8hxT5rIarIRLMZAuDP+UIbesBm6
	YbEkL135s0VZ7G11jpG7ukfuR4tqtTmHbvDygh7Xgh1CRtIx49w02WhYncU77ogk
	FhQ3DX/yAIVSBoa7cim8YNCc57M2MtloGUiH7XMeRA1co/HO4pwuVZ/oKDIt/AOB
	uiT7QyWTDwCB031OwSULw15Xdbsf5U8/t3xT+dRIWycSaAojhRb0XPg0A1csa6eR
	5/X87JToGwsz39w7H0yBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001591; x=1786005191; bh=f
	yBsFp2Gm3To1VdIzzEx2YkdpYkBouIQpfSktn98GZE=; b=PG0ADM+NgCm4RQ4Ex
	fvfl6+WbzaaYIc8kXiG80YpdEPM7m37XqGjNhLtv3ioxn9Ab+7WKlhSH6sO5gnlE
	mUfPDHB+l8NkZpEffvRoQm30ZPrttzcmixGXhX/MtPXrMUHGgjPweVvoYYOJ/XMc
	mf7XrimDXGy5JKIF5dvyrvkh8Fb7+e1r8kgr1B65myQ8FejUpKFqMxLAuphVcCUw
	b6POlSmL4jEkU+ahUvPyqGAAdOKvdVZvjpOtWImD2cjZ2vZdRKatuWLgVZ2l1+Ni
	i4zJ+4o+tqX60m5IT1pZroTJgsrWUJyqRCQQ7DwERFHvSGgp3cN+fY6VG/H0Z92s
	vz99w==
X-ME-Sender: <xms:tjh0agbh3N3TOjS-keqQbdWYNe9a2FCqDZgT-RRlYN3OfQF_P9n_eQ>
    <xme:tjh0anhiYeeI5M6KVgiaq8JjNN8tHZ54ZD5A-syo7nuoIUZa6t0i3PaR0ZOBMceO6
    sXgH6MVxdiILvuhuXtAUoSpaTNN2ZQPvJ5uleKj2NTXXPODlJ_7aWm1>
X-ME-Received: <xmr:tjh0amwJ2QGhAHqtKtxm9RmNSBasngeAaQG10tlFgjxu8p0QllZCg7U_B8ADB-_rww_DC609t25P3XQjHX8>
X-ME-Proxy-Cause: dmFkZTEgjQqBj2bjEymb1zbMZpPNtcgeFkIN1QZzQbxZUKA/RuRyg2DJgajv+NSiGStCeT
    yaYOrCQ7A9gm4WvsiYs1D5t6pPIrllqTbL1Ixlpbf00exSovWm+XcO2G2nbZr0gIMU9T5H
    LqUZEZ7mYO5L/yzE2XzC75M8q4ggUCox/oKRet71npKs8JL7T6FFF0IbK70RPW0nQUZLVJ
    G9VXR8Ti169JZ3zIVViQPK2ghSiO6EeNfHPs6UrpsWSoqkR8yv6qZOHEJ6g0y9pV5MgB8E
    MAD3aacXBW0NxzgaSjqINGlK1Su9gqkNfLS2YhXVvxpfxNqUzyd441y62Y4/nFeExS7hJl
    s1fRNChLxQLoqmrTRKU7ix0tYsuR0uj9NwGH9EDXv14jpTkVp5DIp7G6dHTk8MNPsKS61C
    M991e7G8kEGLJL+EtBNVKNuCsv0R6uqg7PiZusBTxn0pfCP5WBG2yPCUo19O7sFmX5lyP6
    5u/1JWBSd+F5fr42GMZRM4ATEq9afdeQMU/SoYXZtOsy4w6P22qLDr5/TBhH9i+AiAkNE6
    D7fq6ddN6bfjHG7qdqiilt669ZDoaINpS2C7s3lTDSn3Jey0IQL3WkBSRFlD/kdZwxM8IK
    oUhbk3LA2Ww0eqP4r+52PA3LcQzP2hwXzmRy/TAuOSA+Dxor7Gdtjqc+RZ4Q
X-ME-Proxy: <xmx:tjh0aj-mzLLxBdkcdT2QCD6KGxTddXVYC7YbCMrNIcQCztT70c7scg>
    <xmx:tjh0arwTkt8NSykyH2GP7yorSqmJDfcN9uEY0DlZwJbGE21-3f3Xow>
    <xmx:tjh0asVErAEYMFn44iVbje8AhUJzEffwq3sbsAIsWk2oN63DIwc0Zw>
    <xmx:tjh0auaiKrx3ILSXnCVLGrm--Pvtq0Yw3bfVTcT2F2z2TJW7aneP8w>
    <xmx:tjh0at8y2bMpkKhhFuPB6IKtx4vrnwNDbn3aGalwv9Sx5CqN-3Y6kjUP>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:05 -0400 (EDT)
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
Subject: [PATCH v5 1/7] rust: time: make Delta generic over its time unit
Date: Thu,  6 Aug 2026 16:32:35 +0900
Message-ID: <20260806073241.1024319-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806073241.1024319-1-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 72 ++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b8463823aed9..589bd7827523 100644
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
@@ -484,7 +508,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                nanos: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(dividend),
             }
         }
 
@@ -496,7 +520,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
 
             Self {
-                nanos: i64::from(rem),
+                value: i64::from(rem),
             }
         }
     }
-- 
2.43.0

