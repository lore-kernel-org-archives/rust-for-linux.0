Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0A478E5F
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908714; cv=none; b=AIi/LAKssor7G2fN9/Y9hGh4lntCD4rQvakldPBALpAVZtqtsO758Dg8vNlnH3Lrry4DhPd+nvFUPwffHUXcsX8SvkAsZ6sstvvDfDXxZFVU/fQIFYGSDmimVCSlDZXSGwDgNo5/6X570b8r59fHVZTNopBn+JMkto1L+hSulpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908714; c=relaxed/simple;
	bh=AL6IHv1whufGFse6eVA+aSC3VKWbewSRVBcxAJ0Brac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnUSC92aE0OIU3VYarG9bE4OYFcNwjZqW6mBp5gCMnXog5rHcRtK8PPequVEfZHpcZz7Fvo1kUhANJol/lCYCEPS3997hJ/CqDS+xsEQ6gb1wc9im+5IJCFP9JB5fFC3z5envbrBiUADzQps3jcxphXLyzM9mDiLTLDxL0xtqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=s36NQe/e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ey88udfG; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="s36NQe/e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ey88udfG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6304F7A0043;
	Tue,  8 Sep 2026 19:05:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 19:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788908710; x=
	1788995110; bh=lCo04LCpWRqOJwtPgOtKkOMnJcXZSTudq2R7GQCE+cw=; b=s
	36NQe/efohG5wjXkOXqrXIIJ3L3iQM0Iocxy4yybrpArH4I4H6ACVEMYbCFdpYFk
	75U3Eg5IF+uXT5Tp/CxdRobCT9gb4mdAW3Ul2feuL1ru1R3VOcCBP0zBNeoUeGPl
	S9p6/sPfx4MaVx0gg7O4MHywfz0ZsuJCFYKd3nlKmjMJ5gQwGwTRm7ZS7gJgqGxd
	ETT257zSY42Pibl0dAZcwT9VxiOksq4XH/Um9Pto6Wxixc7y3OnhlxzhiQtC4Mku
	KStmXUEOgsPqmmmHM0QE4PglzuP0sNLB8nLKm+ng7yH+248kORepuyCcGjat+UR8
	ErcV6+9W1JRN3ljpy+WKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788908710; x=1788995110; bh=l
	Co04LCpWRqOJwtPgOtKkOMnJcXZSTudq2R7GQCE+cw=; b=Ey88udfG34j9OetwL
	D+v4YK5df22Uwz7T+cSRsQijAgfsvY6L51CXshapuv8/+/5r6nnCA1NNfw9LVgXm
	jb0+jCwL0studzTFm2nokBYc4YuLX2yzzsDCqlGHDF+FwZlwP9ylCP4ayN1Zi2c1
	fKyO0ggOboImpVwBAwLqBTTZftiPRpazvGgYXhls5oHoG+12jnI8QVP6fP4hHCJq
	XgL9hvaPIOAPnby384/KSjwX2yeRLTu+BGaAsfs30DLp6cO5Ngxn5/zFI/EFJc4Y
	T5Ki95EaOu65amnXCDBj4fx4jyZBsWVEtHPAeW4vu0Ofe4BxmqXVFrZSMCASnOOe
	xNT7Q==
X-ME-Sender: <xms:pZSgasIhy8-bjFF-rUH52W3mWIkQZwH3UVK1yhDkLIkcjMAymdLx0g>
    <xme:pZSgaoD6rDB7ygFU8cq2BZYClo1TkaloSv3RehF2zqF7vMQXdwwGBzX3eId-0XaOj
    5hzO6dK4jZvAZQfZ08Cs-2dtaXdIF256uqPd_m_4AZJQ4aaMLJylVXX>
X-ME-Received: <xmr:pZSgaoOPyRnWldGBwboMSRQDvClSUfokdaSNRPMcNt-sht_ffK_W-nwvSdn0g3cHUBGFW1an7wTTHQ75ewU>
X-ME-Proxy-Cause: dmFkZTGfb1s+qsgLQNGIT/qdpsGQbHHQ7uv1q5FEKBydyHq1+WRxQWG5PG0au7kMjFTVjd
    0HVcE4PUszpPQpXsfqUfixscJkMU7ER8ArEM83mcW+nCICmYMwQoRAmgF0SRqTKyWahs5P
    5fLdJGDrjwTYjFzu0NFLG0KZVMkU+vP/JRTB9VrrcxZXYYAlG6WZSBhZZFTDEfmSfZVQlF
    MNIn8ha3Zmf7lWp4G5ZlredgmrcbHp4tw58QYST88AtEx5oACbMQa6+ufE5MqBlh2k3AAl
    oRI5PxkDU/3IYbFSQSokm6XqjBDhM9y+8VVz5YNOLo9TWx0GkT5zueZX1t48f343FmP6Pd
    r05fD1+BkEJW7WbtP2ghXlkYBwWbBKpDN+zuo9Q5iBKwnj+SpXzay9+F2qV1nAcG4GQn00
    7AkOhaxdgCI7nkC9RyV4uku+N2hHlQZPwsaJx2XpmNiaNgiBT2OoYTF0JQLG/+G7m2xB3B
    EwBBGS69yRGlTvt6eaGH/4ZiHJksvJLuCKu4Tcmbm22cj/2eUAIsEs27R0BiV43mv6XwJ6
    LtXYLq+494tQNa1IWjL8o2qRTc84OJZTfRxxQb1cjNuk39n/EW+E2TEwGE10mLd1KLYOLh
    KbBVWkIXdo5wcvNactI/wXxJ/VanYuq5wsyJc3mQjKe55eebkgm03riReRZw
X-ME-Proxy: <xmx:pZSgatW2-Eu9hEoerd9U4TlLGEjWsY2heFeDNbno01l1wbU6iu0uvg>
    <xmx:pZSgarTv8Ir_8s1Qz8ZkKdQN5z_G6YJVvYGMFMlS_PIZZHsNdBQRpg>
    <xmx:pZSgaj1ePXJ3CQVe7ER8xbVZvhWqxmUCyA810pegmCcCLERUO4_wvA>
    <xmx:pZSgaogP0pYKdyec4iTuY8XqlAEkDv6na6eUC4x9KWstXLBKpaC1fg>
    <xmx:ppSgag3Lhw7qul2NqreC35wO8bLwYGxLHiF56d778lWerCx_YtGclunC>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 19:05:05 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
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
Subject: [PATCH v3 2/2] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
Date: Wed,  9 Sep 2026 08:04:45 +0900
Message-ID: <20260908230445.2430296-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908230445.2430296-1-tomo@flapping.org>
References: <20260908230445.2430296-1-tomo@flapping.org>
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
index 6c0a5e8090d0..9e66c39f823c 100644
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
+        // CAST: `max()` makes the value non-negative, so the cast keeps it.
+        let nsecs = self.as_nanos().max(0) as u64;
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
+        let jiffies = jiffies.min(MAX_JIFFY_OFFSET as u64) as isize;
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

