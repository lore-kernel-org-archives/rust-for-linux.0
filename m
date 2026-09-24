Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC69442FDF
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292385; cv=none; b=Cfy+XiWs0YendxKMdzSuWDSOOpzivjleNsj+vOd2ouC361w8BFvBmRZt5hmzSa0qFWHAHCxRTdoHSp+nBaL7nguoXv+5SLXO+WcoV5XBDHzLEO+oEMxXnQHsVjdqbNz6pJ7qLTb/djqDk+QnO2XfN95WOO+OrW70ZJKANvnQBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292385; c=relaxed/simple;
	bh=ly7WEjIjWT4ApZxtShCzulcY1mzbquoo3fe0eO6Ffew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frJ6lUYBknbzEd2B65PghH0l/x0Hp0DsqFXtBs51YDEgBEOby0GpCQhhrCGDhfn8a9oPl4cOTC2K1sYKq1UcMe38elnhQQmwTI9kACt++KF+9JYjmK9r/F+h6juaRTtfMnf1twabyXjpW7aP/3wM0VsIK6mcD7uq4mgyb4vnhjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=S/do55+/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BVfOry6i; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="S/do55+/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BVfOry6i"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D384B1D000DE;
	Thu, 24 Sep 2026 19:26:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 24 Sep 2026 19:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790292382; x=
	1790378782; bh=APIfVhkcI8dZbI9wPDb9TAPfMsopaEOH6ZFys/pLozk=; b=S
	/do55+/GajubrU1fyvG0Jwezg3WFyll0F+8f2htpJUzKLkpF1uQPBb+Tr5EBqxXm
	F6RwTGHm/pCPS47gSbrnIGl+ZBRgeW7igW0BhRSVCctijvfKtphl/pRc7rcyYrsk
	nwH4h/LKZoL3uSe9aU2RxWsIzEruBS4O8M6yKctxnIeZXS+qVt99GisaGFzEU6K5
	IZUTPrFHG/XqHPldWI4D9Dr1hNK+PdENxyqXphxAnkfKBsHcG2J8tuRu2/5St7i8
	+TlZ3d1SXQ1SF0g6Ud7XDqnhvvsyYVGr1AYQgXozRSFkp5/yH4dl8lMiFUDDCsc7
	UBBXzjzBxPlj8Wwhz8jOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790292382; x=1790378782; bh=A
	PIfVhkcI8dZbI9wPDb9TAPfMsopaEOH6ZFys/pLozk=; b=BVfOry6iU5FBcibeC
	86NKdaAaJs5nxWNU8clk3jjjgfjKFDzZplirP4SSJppU7V2Zsc5F4/jIpkoaoUhb
	38YvyafvMr9048it6/4OXrMGDaU1eUmQISkLPAnNIZW2QVqkqgyUZtjCg71Qqe7S
	p6eu0y/LwgEPtIrqf3mjk/on+JfUa4sOj/1mZprFh8WjN26x8/Nxvbgge/gHnDup
	+boxcjOgAvZQXMhtaKTM88WD/Ig1dvQcjF4cOLoNi5V3NK/7Qhc/Djpyw0lG/III
	jwMQkGrjSgRm0MmqSAdni1387fYziRM5nKNlvSOPVG1/7BeLRFEowFpZiwFUqn63
	EPPOw==
X-ME-Sender: <xms:nrG1asFr0xUFKiF7SyYfEbD8RBeYC7qt1nfOR4DUlJnqUGb0XQpGhA>
    <xme:nrG1ahOWw80BXrRPaW-m3GUozJ3i2DzSqzyD5lIqIJcYDMWS9PQUt37DK-gs5lpzR
    kPk2yFGRkxMQSttWHUZukJz2Jh62aUqg4ID3vsby8fby-sNhYegZY3w>
X-ME-Received: <xmr:nrG1ahrfszEe_gBJUoBSuT0-uy5Z4b12Yf45q6_VVPXDjd7pXxC5byF7Tnz6kqGkRFmfEeusjgKwwnFjCX0>
X-ME-Proxy-Cause: dmFkZTGbOl1CsLxRFUps7BdJom5bppIhQpu7pBznzb6kn2yGIAPueY895qavc5g3NMtK7j
    ntxwJ4R5IhYXb0s2MqzNYLCBOYgQ8ara+e3VMCH6Dbm0OaHubeT0lT0KdzB/6mCdgrEGTq
    DSNHlBaJXohruxToxVTUauoWmm1SguPcHuk5n8ty/BsZy8xeCBeM3NP1LRR5duuDnQj55S
    798WLu76nL+kmR0TMvafxK80f5dtiN86F7nYwWXfqJqcjBOZKTtNqnSgNqf6EcdhsqzwMv
    U+IJKwA7Lhe4SrOnotLI9Va/FtfjaU6FyBnRbYv5yu9j9GXSaHKZ00lkLwjKhseyMvqVTj
    C3cjDDhL8BBaCvsB427m+JoiWxKg30CKWcPVejT88EZPHGbB3WwfFNX4zL+1M1l1hyNC87
    49LtnFecv6ktS5+knfO6jkMu7ONgq/ca/4QpZciQp4fmX2FdYavH4mpqGpe7kLPE53bKp3
    wXCnacuDOeHzehOUOZ6sqrLWQe2IDwAOTKBImlcqCBiSDWeF8Zr2iExosDh1P3ndk0wyM5
    xt0gBTnz/OK4RDewAHd/Mwi8bLBf5dUmZEyRxkcBn9NXYQyezCFWdEQ6grw+o8/erHHfF4
    xj3Fobaf2VRkpCBsNivlHstJm+vbs/Bm/81AR4Xk/NiigO+hF8bVCSe9ttBA
X-ME-Proxy: <xmx:nrG1aiBEck83gYfYmjdMa7APO3CMgHHKVfSF6jqgDXZd5Wz2ceg_BQ>
    <xmx:nrG1aqN6x4X7I9B4fVTQdr5h34gqAc1CVmChEU51gNNbFWwM04ATrw>
    <xmx:nrG1agBAvVaQBicoR5PWQwAHSikEGJHOfXX7zv_YvmsFPgZo5q0XeQ>
    <xmx:nrG1ao9h3v-fscXc6RbjUsYiXXXa45pkmDroKkuv4ewOCK6W1nHGDw>
    <xmx:nrG1ag8WbpkjjARK78UNSYFs_XeBLghfJgcTOdbIZYhE7iF6yYTYg-sq>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 19:26:18 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
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
Subject: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
Date: Fri, 25 Sep 2026 08:25:30 +0900
Message-ID: <20260924232530.446588-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924232530.446588-1-tomo@flapping.org>
References: <20260924232530.446588-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The boundaries of __msecs_to_jiffies() and nsecs_to_jiffies64() depend
on which HZ branch is compiled. With CONFIG_HZ_300
nsecs_to_jiffies64() overflows after 64.99 years, which is less than
the 292 years a Delta can hold. With HZ=1000 a jiffy is a millisecond,
so __msecs_to_jiffies() returns its argument unchanged and never caps
it at MAX_JIFFY_OFFSET.

Compute the conversion in Rust with mul_u64_add_u64_div_u64() instead. It
returns (a * b + c) / d, computing a * b internally in 128 bits, so
ceil(nanos * HZ / NSEC_PER_SEC) needs no input clamp and rounds once. The
bound then follows from the arithmetic: with HZ <= NSEC_PER_SEC, which a
static_assert() checks, the result is at most the nanosecond count.

Unless the result saturates, the value is rounded up, so the timeout is
never shorter than the requested span. It saturates at zero jiffies for a
negative span, i.e. an immediate timeout, and at MAX_JIFFY_OFFSET, the
upper bound the kernel uses for a jiffies span. Since MAX_JIFFY_OFFSET is
derived from long, only 32 bit can reach it, and a saturated timeout there
is finite, so it can be shorter than the requested span.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/helpers.c   |   1 +
 rust/helpers/math.c      |   8 +++
 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/time.rs      | 105 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 rust/helpers/math.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..08374b163774 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -73,6 +73,7 @@
 #include "kunit.c"
 #include "list.c"
 #include "maple_tree.c"
+#include "math.c"
 #include "mm.c"
 #include "mutex.c"
 #include "net/genetlink.c"
diff --git a/rust/helpers/math.c b/rust/helpers/math.c
new file mode 100644
index 000000000000..e2ee29bcce0f
--- /dev/null
+++ b/rust/helpers/math.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/math64.h>
+
+__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
+{
+	return mul_u64_add_u64_div_u64(a, b, c, d);
+}
diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..0087749995d2 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_TIME_KUNIT_TEST
+	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust time API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..6f50a1ec680e 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,6 +39,10 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
+/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`. It is the upper
+/// bound the kernel uses for a jiffies span, not a wait-forever value.
+const MAX_JIFFY_OFFSET: isize = (isize::MAX >> 1) - 1;
+
 /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
 pub type Jiffies = crate::ffi::c_ulong;
 
@@ -554,6 +558,62 @@ pub fn as_millis_ceil(self) -> i64 {
         }
     }
 
+    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
+    ///
+    /// Unless the result saturates, the value is rounded up to the next whole
+    /// jiffy, so the resulting timeout is never shorter than `self`.
+    ///
+    /// A negative span saturates at zero jiffies, i.e. an immediate timeout.
+    ///
+    /// A span that does not fit saturates at the kernel's [`MAX_JIFFY_OFFSET`],
+    /// the upper bound for a jiffies span. That is a finite timeout, so a
+    /// saturated result can be shorter than the requested span. It is derived
+    /// from `long`, so only 32 bit can reach it, at about 12 days with `HZ=1000`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// // A negative span is an immediate timeout.
+    /// assert_eq!(Delta::from_millis(-1).to_jiffies_timeout().as_jiffies(), 0);
+    ///
+    /// // A span shorter than a jiffy still waits, i.e. the timeout is never
+    /// // shorter than the span.
+    /// assert!(Delta::from_nanos(1).to_jiffies_timeout().as_jiffies() >= 1);
+    /// ```
+    ///
+    /// [`MAX_JIFFY_OFFSET`]: srctree/include/linux/jiffies.h
+    #[inline]
+    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
+        const HZ: u64 = bindings::HZ as u64;
+
+        // The quotient `(nsecs * HZ + NSEC_PER_SEC - 1) / NSEC_PER_SEC` has to fit in
+        // `u64`; `nsecs * HZ` does not. With `HZ <= NSEC_PER_SEC` the numerator is at
+        // most `(nsecs + 1) * NSEC_PER_SEC - 1`, so the quotient is at most `nsecs`.
+        crate::static_assert!(HZ <= NSEC_PER_SEC as u64);
+
+        // CAST: `i64::max()` makes the value non-negative, so the cast keeps it.
+        let nsecs = i64::max(self.as_nanos(), 0) as u64;
+
+        // SAFETY: `mul_u64_add_u64_div_u64()` must not be called with a zero divisor,
+        // and its result must fit in `u64`. `NSEC_PER_SEC` is a non-zero constant, and
+        // the assertion above bounds the quotient by `nsecs`.
+        let jiffies = unsafe {
+            bindings::mul_u64_add_u64_div_u64(
+                nsecs,
+                HZ,
+                (NSEC_PER_SEC - 1) as u64,
+                NSEC_PER_SEC as u64,
+            )
+        };
+
+        // CAST: `jiffies` is clamped to `MAX_JIFFY_OFFSET`, which is `<= isize::MAX`.
+        let jiffies = u64::min(jiffies, MAX_JIFFY_OFFSET as u64) as isize;
+
+        Delta::<Jiffy>::from_jiffies(jiffies)
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
@@ -580,3 +640,48 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
         }
     }
 }
+
+#[cfg(CONFIG_RUST_TIME_KUNIT_TEST)]
+#[macros::kunit_tests(rust_kernel_time)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn to_jiffies_timeout_converts() {
+        const HZ: isize = bindings::HZ as isize;
+
+        // One second is exactly `HZ` jiffies, and the round-up must not add one.
+        assert_eq!(Delta::from_secs(1).to_jiffies_timeout().as_jiffies(), HZ);
+
+        // One nanosecond more has to round up to the next whole jiffy.
+        assert_eq!(
+            Delta::from_nanos(NSEC_PER_SEC + 1)
+                .to_jiffies_timeout()
+                .as_jiffies(),
+            HZ + 1
+        );
+    }
+
+    #[test]
+    fn to_jiffies_timeout_saturates() {
+        // The result never exceeds `MAX_JIFFY_OFFSET`. On 32 bit with `HZ=1000` this
+        // span is 2147483647 jiffies, so the clamp is what keeps it in range; on 64
+        // bit it fits and the check holds for every possible return value.
+        let clamped = Delta::from_millis(i64::from(i32::MAX)).to_jiffies_timeout();
+        assert!(clamped.as_jiffies() <= MAX_JIFFY_OFFSET);
+
+        // `MAX_JIFFY_OFFSET` is derived from `long`, so only 32 bit can reach it. On
+        // 64 bit `i64::MAX` nanoseconds is about 292 years, which is 9223372036855
+        // jiffies with `HZ=1000`, far below the limit.
+        #[cfg(not(CONFIG_64BIT))]
+        {
+            // An overlong span is clamped to `MAX_JIFFY_OFFSET`.
+            let overlong = Delta::from_nanos(i64::MAX).to_jiffies_timeout();
+            assert_eq!(overlong.as_jiffies(), MAX_JIFFY_OFFSET);
+        }
+
+        // A negative span is an immediate timeout, however long it is.
+        let negative = Delta::from_nanos(i64::MIN).to_jiffies_timeout();
+        assert_eq!(negative.as_jiffies(), 0);
+    }
+}
-- 
2.43.0

