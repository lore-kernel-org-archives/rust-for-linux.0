Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B04A5C24
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784563; cv=none; b=VM2RkcmknhnNWi7AYM0yDIVt4J6D0oSt9JM+d69lczs6AiwrtUmqsjg0tZ66VWaxFZYb6fLkdcj3Nnu9y6I9ERudbX6l0JuymtyuKvRsWTLXlhq63zDn+Yvgnm39BGnSy5yEaK6Dl+3A8+m/x9oiUme+H1UhkUZvnxnbLEFgPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784563; c=relaxed/simple;
	bh=oHHosyHZWMkw5jfe8BEniW0Z6ViGgVYaKT2KOzSgbb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PfTNKD7LmqCcldLFrPcJ/Pn+NsO9hjjytRIZQ554Via1f5SV4h4+vXSd2DPMURSFj3DDLR5kqN/k/GNcsIkySwq8VOlgyK8a1WM2itd/2wp8PaKma/mmk8OPGhADA4/T2uJzlRzZZlAkpxmjmfpd76XzFsVi/1CgsZl5FTTCeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=EjSU27Zc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jYhaKXc0; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="EjSU27Zc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jYhaKXc0"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 0D17CEC0230;
	Mon,  7 Sep 2026 08:35:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 07 Sep 2026 08:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1788784558; x=1788870958; bh=VY7zadNFT40eoyR169G24
	gAlQTdbmD3qXqChQciqlkI=; b=EjSU27ZcmRxsT+z0ndHrp+3JtljnFYH5WjzX9
	cKWonH020p8imeqbFpnJbOSX22yYfs3MC+KHcay6eV1k/fJcu39gkSt+szaZJ9El
	yhk8gXfZ9MfbAQ4RVUzoAdXWz+Fh5BXvYcKve/FnMUJ04BUELefcfnyC9mE1s2UA
	klb8ZGwPFASIfbDWHFDp0amGMXlaLDSDEpbS99jwrm00KrXhMC+R66EoO8wecFNW
	7INDnqL0L3JUT18NmkN2nlpdgOQ5/emtY/c0cb4o9V0s+g3KteTc4TBqbrjy9XTN
	Solozq2VlXEk2pfYtXbHE0nQAIvVanvVfL7xjWIZkrUiyNleg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788784558; x=1788870958; bh=VY7zadNFT40eoyR169G24gAlQTdbmD3qXqC
	hQciqlkI=; b=jYhaKXc0GKOj0eS52OORyC6wxIgRQErLlBdVxaV9T2PAcsbPaga
	TVBBxEWV+oQVI+n85P1ln7HZwRu4TLotV+XFZzxt3a0kbp9KRUt76geE99+M+K9i
	s+9wk2C6IZDKcUt9ixwfGjGXxG16t3HhV0myjp8SVAWqwNwfNT++RdthL3WimLFr
	HmHl4YyDsqzKDflDCmof2eInizELqaiwvYyuIs0qlsoqegnIALXcT6BvU4X13YAg
	cjbs4YcOZJhef3BRNB/SBzoHlKu6ihb9Xw216tDQoBnmpH6742VECbERX86oQV2r
	HzeawV8OQO0AIBA/JSx5N70VQgSQ6JZ1Hjw==
X-ME-Sender: <xms:ra-eamS5sPLLvA5EJfeDtaTxEhqASsIWRpPh4jxNgVhoOXfjmLfF0A>
    <xme:ra-eanoWApikAnUxJeelDcMdIvNThy1wccg89ClJlZCwpcphAVKvn5BNJbtHG6TC_
    AEjrzg2Em03-jSTMb0XF-gt-yfH_2QUoW1I6ikYSVkePZS54bG2OzM>
X-ME-Received: <xmr:ra-eavUUoSbuMZ74oQ1MqZvmG6AoxYRYnFt4TeIvHP6YkfwGmvDKUAUeJaWHNr_ZiaWTeLi1OoC2tN5SROQ>
X-ME-Proxy-Cause: dmFkZTGywOwcE5pkc21wr4xubF3LLBeS+cD79ELNBcE3TpZNRCY8F6TH5/+Wxc7rtzfFss
    v2CEe4vyAQjIxqfYlSgcOX/Up9O9OUPVbTNDp7wzLyzCRFQPYDfd7ZePS6sLw8zH9ltBr4
    0UmXFPNjQt1QSwk5fabjoydubB2iMz8hw7dN+5zTrGREN8kRlxssoGKGq/bWfDsFFA9qiX
    yHP9nKyhIp5sbdmKD5yXQvqeVptgcB+7U26inahJNKm7I9qMRXhlvKiJdFo+pA+Y4PABbl
    hIVXa2rGrOwfPLC+1VRWOI8Dkq1HgI0wXXhvNAAPZ52XVri2OpKmUr/rE8I2BJDzbxtPX6
    CNaRglQWwsxyV0162z4Lll8ECF7NGbaJ5LIpkCDZ2ZIbPzS23mxkxxP6fJsSr5gM7Nec2i
    TOkKQ70srzgHtIGXG6QoR61N3MdBzrbU1XDFaTAzu8qToAcJQf+oYQ0opu4afC8gFaxAql
    QuWBaggloQHeu45fi96CWQz81H6nnczGYbLwqUu87S+sbhhUALQZ2YkBY/u9UF8JrHuxJD
    33v/cCNc2LkWbkrd7DPI/IQhlKpSEl3gJERhczMmQm7vBT4s71aXUpuX7Se7hCKGFJpi/G
    9gydM3hR8QGb00wDhdM120QYKuU0g9scqNNILptHGQQd1xcZmzc8UZ/cvOsQ
X-ME-Proxy: <xmx:ra-eal_0uEYYKRVeIZyqgPBQwyQVWc4TYkzyTAP90riBZ_bMicnlBw>
    <xmx:ra-eanYfTW0eIdwBxDtQNVj45XJM_dJxTHjRnBLmBuLzYwze0kxNAw>
    <xmx:ra-eatf_PemRO3-KaUAUXVME5NhR9Qxed61UXHfvZ6jn6Hcq6ZAkSg>
    <xmx:ra-eaho6P1nMyOpr5fHxatBUIE1PFm3R4F4So2z5TxW3F1QvFLC6-w>
    <xmx:rq-eajfF89-ief3LLjyIFjTZA6QO7Jk1pGBFxTLI6kQUwXDOxJ8pMwLe>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 08:35:52 -0400 (EDT)
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
Subject: [PATCH v2] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
Date: Mon,  7 Sep 2026 21:35:24 +0900
Message-ID: <20260907123524.2332118-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
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
v2:
- Use mul_u64_add_u64_div_u64() instead of __msecs_to_jiffies().
- Dropped the as_millis_ceil() example and KUnit test patch; the conversion
  no longer uses as_millis_ceil(). Will send it separately.
v1: https://lore.kernel.org/rust-for-linux/20260811150147.1360102-1-tomo@flapping.org/
---
 rust/helpers/helpers.c   |   1 +
 rust/helpers/math.c      |   8 +++
 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/time.rs      | 109 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)
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
index 6c0a5e8090d0..8e9c349b1df7 100644
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
 
@@ -554,6 +558,66 @@ pub fn as_millis_ceil(self) -> i64 {
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
+    /// from `long` and can only be reached on 32 bit, where it is about 12 days
+    /// with `HZ=1000` and about 124 days with `HZ=100`.
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
+        // `bindings::HZ` cannot be used here. bindgen keeps the first definition of a
+        // macro and ignores a later `#undef`, so `HZ` resolves to `__USER_HZ`, i.e.
+        // 100, from `include/uapi/asm-generic/param.h` instead of `CONFIG_HZ`.
+        const HZ: u64 = bindings::CONFIG_HZ as u64;
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
@@ -580,3 +644,48 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
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
+        const HZ: isize = bindings::CONFIG_HZ as isize;
+
+        // One second is exactly `CONFIG_HZ` jiffies, and the round-up must not add one.
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

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.43.0

