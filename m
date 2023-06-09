Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A402DC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbjFIG5B (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238562AbjFIG4g (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:36 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0B62D7B
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1418; q=dns/txt; s=iport;
  t=1686293793; x=1687503393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bA4ivKZfFML1/UcBA5Vd1WZU9lOJ7HWBz7M0wTXIAF8=;
  b=WYEMT7bfcOo4cukp+AamPOUd+8ZeOkDdKNPiW1gNH8WIhm/R7jFhfRWf
   jTDnvN+oT9BTTv0ZfQvy58o75NalRxqKWAsPJBd1O3mukZ9sM5s1qtN8j
   lMpHGLviXxsSnIDjwcRH6iOzYhaovd5vu/SGRHZcj9ECRtyPYqHoBJQHT
   M=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453675"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:39 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID4055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:39 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 10/80] rust: kernel: add container_of macro
Date:   Fri,  9 Jun 2023 09:30:08 +0300
Message-Id: <20230609063118.24852-11-amiculas@cisco.com>
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
 rust/kernel/lib.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9dc9124a5bd7..9f68f804074d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -99,6 +99,37 @@ impl ThisModule {
     }
 }
 
+/// Produces a pointer to an object from a pointer to one of its fields.
+///
+/// # Safety
+///
+/// Callers must ensure that the pointer to the field is in fact a pointer to the specified field,
+/// as opposed to a pointer to another object of the same type. If this condition is not met,
+/// any dereference of the resulting pointer is UB.
+///
+/// # Example
+///
+/// ```
+/// # use kernel::container_of;
+/// struct Test {
+///     a: u64,
+///     b: u32,
+/// }
+///
+/// let test = Test { a: 10, b: 20 };
+/// let b_ptr = &test.b;
+/// let test_alias = container_of!(b_ptr, Test, b);
+/// assert!(core::ptr::eq(&test, test_alias));
+/// ```
+#[macro_export]
+macro_rules! container_of {
+    ($ptr:expr, $type:ty, $($f:tt)*) => {{
+        let ptr = $ptr as *const _ as *const u8;
+        let offset = $crate::offset_of!($type, $($f)*);
+        ptr.wrapping_offset(-offset) as *const $type
+    }}
+}
+
 #[cfg(not(any(testlib, test)))]
 #[panic_handler]
 fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
-- 
2.40.1

