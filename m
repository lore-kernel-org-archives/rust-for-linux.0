Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C0FC7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjFIGyh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238568AbjFIGyV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:21 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A930F9
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4943; q=dns/txt; s=iport;
  t=1686293658; x=1687503258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pgRmeFAK+IKfdHZ8c7lK4GY/I3z0zva/9EkiPDh+X1Q=;
  b=dahBm6xw9xOOZr//cG6BGKsIXM1L9tOjCelM9XI6wWo4aYLKA09EES6I
   uja9jptiTfMIAKZSi/aSseSCZZC1lKVbnkw0Xv94qsmAjIBy80Pn1rmJb
   rTikTvn2T20BjX4eJeRkDRexu4qItodbFxtauubhW/Q2Z37lNBg/sIrl+
   w=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220555"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:39 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID3055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:38 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 09/80] rust: kernel: backport the delay module from the rust branch
Date:   Fri,  9 Jun 2023 09:30:07 +0300
Message-Id: <20230609063118.24852-10-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/kernel/delay.rs | 104 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs   |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 rust/kernel/delay.rs

diff --git a/rust/kernel/delay.rs b/rust/kernel/delay.rs
new file mode 100644
index 000000000000..d28d45ec2e57
--- /dev/null
+++ b/rust/kernel/delay.rs
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Delay functions for operations like sleeping.
+//!
+//! C header: [`include/linux/delay.h`](../../../../include/linux/delay.h)
+
+use crate::bindings;
+use core::{cmp::min, time::Duration};
+
+const MILLIS_PER_SEC: u64 = 1_000;
+
+fn coarse_sleep_conversion(duration: Duration) -> core::ffi::c_uint {
+    let milli_as_nanos = Duration::MILLISECOND.subsec_nanos();
+
+    // Rounds the nanosecond component of `duration` up to the nearest millisecond.
+    let nanos_as_millis = duration.subsec_nanos().wrapping_add(milli_as_nanos - 1) / milli_as_nanos;
+
+    // Saturates the second component of `duration` to `c_uint::MAX`.
+    let seconds_as_millis = min(
+        duration.as_secs().saturating_mul(MILLIS_PER_SEC),
+        u64::from(core::ffi::c_uint::MAX),
+    ) as core::ffi::c_uint;
+
+    seconds_as_millis.saturating_add(nanos_as_millis)
+}
+
+/// Sleeps safely even with waitqueue interruptions.
+///
+/// This function forwards the call to the C side `msleep` function. As a result,
+/// `duration` will be rounded up to the nearest millisecond if granularity less
+/// than a millisecond is provided. Any [`Duration`] that exceeds
+/// [`c_uint::MAX`][core::ffi::c_uint::MAX] in milliseconds is saturated.
+///
+/// # Examples
+///
+// Keep these in sync with `test_coarse_sleep_examples`.
+/// ```
+/// # use core::time::Duration;
+/// # use kernel::delay::coarse_sleep;
+/// coarse_sleep(Duration::ZERO);                   // Equivalent to `msleep(0)`.
+/// coarse_sleep(Duration::from_nanos(1));          // Equivalent to `msleep(1)`.
+///
+/// coarse_sleep(Duration::from_nanos(1_000_000));  // Equivalent to `msleep(1)`.
+/// coarse_sleep(Duration::from_nanos(1_000_001));  // Equivalent to `msleep(2)`.
+/// coarse_sleep(Duration::from_nanos(1_999_999));  // Equivalent to `msleep(2)`.
+///
+/// coarse_sleep(Duration::from_millis(1));         // Equivalent to `msleep(1)`.
+/// coarse_sleep(Duration::from_millis(2));         // Equivalent to `msleep(2)`.
+///
+/// coarse_sleep(Duration::from_secs(1));           // Equivalent to `msleep(1000)`.
+/// coarse_sleep(Duration::new(1, 1));              // Equivalent to `msleep(1001)`.
+/// coarse_sleep(Duration::new(1, 2));              // Equivalent to `msleep(1001)`.
+/// ```
+pub fn coarse_sleep(duration: Duration) {
+    // SAFETY: msleep is safe for all values of an `unsigned int`.
+    unsafe { bindings::msleep(coarse_sleep_conversion(duration)) }
+}
+
+#[cfg(test)]
+mod tests {
+    use super::{coarse_sleep_conversion, MILLIS_PER_SEC};
+    use core::time::Duration;
+
+    #[test]
+    fn test_coarse_sleep_examples() {
+        // Keep these in sync with `coarse_sleep`'s `# Examples` section.
+
+        assert_eq!(coarse_sleep_conversion(Duration::ZERO), 0);
+        assert_eq!(coarse_sleep_conversion(Duration::from_nanos(1)), 1);
+
+        assert_eq!(coarse_sleep_conversion(Duration::from_nanos(1_000_000)), 1);
+        assert_eq!(coarse_sleep_conversion(Duration::from_nanos(1_000_001)), 2);
+        assert_eq!(coarse_sleep_conversion(Duration::from_nanos(1_999_999)), 2);
+
+        assert_eq!(coarse_sleep_conversion(Duration::from_millis(1)), 1);
+        assert_eq!(coarse_sleep_conversion(Duration::from_millis(2)), 2);
+
+        assert_eq!(coarse_sleep_conversion(Duration::from_secs(1)), 1000);
+        assert_eq!(coarse_sleep_conversion(Duration::new(1, 1)), 1001);
+        assert_eq!(coarse_sleep_conversion(Duration::new(1, 2)), 1001);
+    }
+
+    #[test]
+    fn test_coarse_sleep_saturation() {
+        assert!(
+            coarse_sleep_conversion(Duration::new(
+                core::ffi::c_uint::MAX as u64 / MILLIS_PER_SEC,
+                0
+            )) < core::ffi::c_uint::MAX
+        );
+        assert_eq!(
+            coarse_sleep_conversion(Duration::new(
+                core::ffi::c_uint::MAX as u64 / MILLIS_PER_SEC,
+                999_999_999
+            )),
+            core::ffi::c_uint::MAX
+        );
+
+        assert_eq!(
+            coarse_sleep_conversion(Duration::MAX),
+            core::ffi::c_uint::MAX
+        );
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index dd9c39071391..9dc9124a5bd7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -35,6 +35,7 @@
 mod allocator;
 mod build_assert;
 pub mod cred;
+pub mod delay;
 pub mod error;
 pub mod file;
 pub mod fs;
-- 
2.40.1

