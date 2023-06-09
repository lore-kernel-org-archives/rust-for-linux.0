Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB90FC7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbjFIGyP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB682718
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2064; q=dns/txt; s=iport;
  t=1686293648; x=1687503248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9XGTjbhyp3qO/xtnSVQKqu68MVmWXRTWVIIDTquDPY=;
  b=Y/l0NyG3MLB4Pa7qUfrXwujO1DE7iBhcZTCF0sTOPLQBO14SkJ4D5fHK
   Pu2UEOPunATOEJ1pMjNnwCmCyaq2TLs5GAe3KfCw+4uN23rfIzT1mEUXa
   aAO3PrPLASZ/0kSez0Hye2s3P76vCDPfKQjaX2YO/rv6aXd3BMEgQOnjN
   A=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857706"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:56 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDx055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:56 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 65/80] samples: puzzlefs: add TryReserveError (and from conversion) to WireFormatError
Date:   Fri,  9 Jun 2023 09:31:03 +0300
Message-Id: <20230609063118.24852-66-amiculas@cisco.com>
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
 samples/rust/puzzle/error.rs | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index 254926e6b4e2..e803c2177b72 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -1,3 +1,4 @@
+use alloc::collections::TryReserveError;
 use core::ffi::c_int;
 use core::fmt::{self, Display};
 use kernel::prelude::{EINVAL, ENOENT, ESPIPE};
@@ -10,6 +11,7 @@ pub(crate) enum WireFormatError {
     ValueMissing,
     CBORError(serde_cbor::Error),
     KernelError(kernel::error::Error),
+    TryReserveError(TryReserveError),
 }
 
 impl WireFormatError {
@@ -20,7 +22,7 @@ pub(crate) fn to_errno(&self) -> c_int {
             WireFormatError::ValueMissing => kernel::error::Error::to_errno(ENOENT),
             WireFormatError::CBORError(..) => kernel::error::Error::to_errno(EINVAL),
             WireFormatError::KernelError(e) => kernel::error::Error::to_errno(*e),
-            WireFormatError::TryReserveError(e) => kernel::error::Error::to_errno(EINVAL),
+            WireFormatError::TryReserveError(_) => kernel::error::Error::to_errno(EINVAL),
         }
     }
 
@@ -37,6 +39,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             WireFormatError::ValueMissing => f.write_str("no value present"),
             WireFormatError::CBORError(_) => f.write_str("CBOR error"),
             WireFormatError::KernelError(_) => f.write_str("Kernel error"),
+            WireFormatError::TryReserveError(_) => f.write_str("TryReserveError"),
         }
     }
 }
@@ -59,3 +62,11 @@ fn from(source: kernel::error::Error) -> Self {
         WireFormatError::KernelError(source)
     }
 }
+
+#[allow(unused_qualifications)]
+impl core::convert::From<TryReserveError> for WireFormatError {
+    #[allow(deprecated)]
+    fn from(source: TryReserveError) -> Self {
+        WireFormatError::TryReserveError(source)
+    }
+}
-- 
2.40.1

