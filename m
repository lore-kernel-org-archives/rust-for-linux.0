Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40193290A5
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170551; cv=none; b=YByApk077yn3NdUp9125Ka4o0s+ak7N1/+6TO4VWyXYxc4cA4x1yXB01k2Byd3AXH4X8twCdIlS+YEH4beM4KzUVlHalaAofYLl0qPvTwBT058ZS0VLOVqyq//DeP5up1TmprUdOZKdbOMBZSpTNqOmvBEMGVGEMR/RkzT93ZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170551; c=relaxed/simple;
	bh=pjBnNZOe5K3Vlde9UtdsxhDHX1CIhipp5ZSL/D+SJhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3dRVnQ44SnarNnzZWyIrSSG/TWbCLmCQ6HuX8sVsWuEEsNBTa9TCDJ2AWUbiYOrVz5eGb3fwdMB4OP8DzETH/P6qOfXi4CXRfLE2tWtGwSq1309uDbjebUNa7fJ8BmJBw3vosYzqWf4Obgrmqtw2LgGjc2gDOUUVOC7q1UaNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=VmyQtsCD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=biUhXYG/; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="VmyQtsCD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="biUhXYG/"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id DBDD913801C4;
	Sat,  8 Aug 2026 02:29:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 08 Aug 2026 02:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170548; x=
	1786174148; bh=91XYwtqRonaeYphXoAVvKu24MrANtNlm6mWb9sMYW7Q=; b=V
	myQtsCDV2a6/ENe280PcvowGzwjx6BfxwaD0H75v516NlOuG6cbwd43DrCW/DtrQ
	Sf5TCMlvfjzQ+FMgRE8iCtwgYbOjLC2dBrdNw0Ve6LMP1+5eqNDDYkT7M1gYZDq0
	xfdo2zSsYbRza+ewn2MGw5PzrSoOm2uQP75goDPNOBOmbLfJ3bLaPlIX+XGElnz0
	zHuKcsqBF9L27eo8qQfz5Eo4ZABxGzU5O1piIp5xhbGbe6bLAnZTqiJX1TN+EWRL
	gl7XkTe3TZL7+Er5AD3E7q4NTZuHbiE5I2xxCnaAw1r+64Hw7+dOVdQCxZQjeUGy
	avRtpkI1b6NAWQAaNbuLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170548; x=1786174148; bh=9
	1XYwtqRonaeYphXoAVvKu24MrANtNlm6mWb9sMYW7Q=; b=biUhXYG/edoej2ccy
	hgilHcAz6SNywofSxlP02GqEA8MdTdeX7+3sid2sCB5SoK2i/l4LZlg4UKJ9uozV
	DkSGIb1Io+4SKbFXzLZq1L4VMlTG/5yrkOW5TWmXnFUkn+PJWdkyXUfqEJwBOMlB
	35CvXIa9svWjpnLQn4VDpq5/g71YhWvruVJxHNKIKDe7fzGIEzj5vBSqgNgX7us5
	moHcdzP7oYmsou4VIuT6nYyyfaQToU6Sd/W+179q6rIKIutQ773PWZ/H53x5jrD6
	4X2GkZaG49HxFEGfj+6VyadlEeVaZK3LZcjSrGKytVSTirk/LgeR90Lja/pM+s/7
	CSM4Q==
X-ME-Sender: <xms:tMx2ap6ld8fBCU2S__2m5hAK31Bfjdv2z_SilSpnKfETBBTrtrP4EQ>
    <xme:tMx2ajCnB3eYW58pP_hrPdNNIlwPISszxyxoHS3rAtuVDNDLEHGBpliBisHD2wXTk
    UXO9qwyEnEieUj4zsxUMy60RBvsQn82Zz5D_3fEHb-1hGTfYm1fp-2V>
X-ME-Received: <xmr:tMx2asSbAXfrRGiYPCQCB2EMP61CqjEfhwQTaYkDPe-vDsfJZuuJK8V4tRAArKrseGV4fAXf7yfiOZcLdfs>
X-ME-Proxy-Cause: dmFkZTGPkp/tjUF9QhjmhubFpVsEJiLyXpdymDQrM8aVQ3kZuefEetQxeEW0ZOf4RrEr9P
    LsxjTKn60UCLD1q8TGml7nMYQgaOZD6UryIwVsYw9c3jQPw69RG55VceGwySH18w/RXixP
    9ALHD292JMWwKQ2E2TR4oVe8cE/VF35DjCuy8p2zkKeBmUj7k5VChHrMhTMNGL9/0k+flN
    D/XO/y8C66ZMkHzR5HQRnvxIGNJ22YhihAosFjsscruigf2Ki1At7aI9+pPQrR08nl/TLi
    2PNvSDjqxzYH449vkP95HWg/wP5kxHrjdUvNcOiDpPYzwspfXJSX/omV4B8zmmoEMc26mp
    WEroWJ4d5TT8aOQec1u4ZuhAk6HRdxMLaEWccW3+s34pRrYe5itqkoiNDHEgGNXIw8RiTW
    TZCyhEPsTqXpNoGGbmG0OtmkpWzaW4tLBA7qfWGONUyGmVgul8Pjo5hU3X5MA1kTv+U8+t
    NCckh/oAsP4iKbZm2RsRYcAaX335ph5SSrOc9v/e512IfynzO+zZhYW37QMobN0FYtx7yF
    YaFiXexdBOM0HjLXdnsOXmMhzk7Jl0fpQClH2leAq8cNxa9Mqjswtd899N7rnXojd3Qmfz
    AbKRuW2tw+FRZYhlQfjJEG7OzyxdWNtf1R8KBseJDZYkrLlr7w9//9nJ95HQ
X-ME-Proxy: <xmx:tMx2arcFrkFA_TxQpwGHkRX0c8VLrZyJuHkGIV5-FERG0k3G_yxQ4Q>
    <xmx:tMx2atSJ7UPDwIGTdLTfI2X77d0yDZCee9Tbi-hEbNuVrYiEzcBEeQ>
    <xmx:tMx2av0c15aEVxW7EnogW3QgzDdA2MrGoNhm5RAt1CwtDfzYzjJTAA>
    <xmx:tMx2ar4CS6GncDNJR9En5AxneeCkSTeRfOW35QB9Po6tPa5QZZV5Ew>
    <xmx:tMx2atfqam62SCt4WPEaSAjk1VthuZ13froIX5_YDQgV4ImHQOY3twZH>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:03 -0400 (EDT)
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
Subject: [PATCH v6 1/7] rust: time: make Delta generic over its time unit
Date: Sat,  8 Aug 2026 15:28:33 +0900
Message-ID: <20260808062839.1159990-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
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
index b8463823aed9..afe35759bc15 100644
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
+pub enum Nsec {}
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

