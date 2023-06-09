Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3D3C83005
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237598AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238473AbjFIGyK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:10 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B2D2D7E
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1788; q=dns/txt; s=iport;
  t=1686293648; x=1687503248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OUt/qNwTeUdC7gKzGznwk8psCS9r64gD+yxvgAYMnFs=;
  b=V9JYbBxk/PVcS94cap2JarXg9FGyKO7+0IGLZu+Bk4Who+9dXNyPdPk2
   95cD7SUlD5e44lUdlrpVcpuWe3c/Z5lWgTeC+Z9hu+EjF0tYhxhgW4giu
   QGT2+4eHXbnWXnWQQlbM2yBnvRjgyFNx7gX1quGzKIbEgy/7yRE7deSL0
   I=;
X-CSE-ConnectionGUID: IuRWzM/BTfmxCGWXP9hPxg==
X-CSE-MsgGUID: nfUnOxA4R5CxD1Id+ywROw==
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799472"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:59 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE7055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:58 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 73/80] rust: puzzlefs: add HexError to WireFormatError and implement the From conversion
Date:   Fri,  9 Jun 2023 09:31:11 +0300
Message-Id: <20230609063118.24852-74-amiculas@cisco.com>
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
 samples/rust/puzzle/error.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index e803c2177b72..8554756be8d3 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -12,6 +12,7 @@ pub(crate) enum WireFormatError {
     CBORError(serde_cbor::Error),
     KernelError(kernel::error::Error),
     TryReserveError(TryReserveError),
+    HexError(hex::FromHexError),
 }
 
 impl WireFormatError {
@@ -23,6 +24,7 @@ pub(crate) fn to_errno(&self) -> c_int {
             WireFormatError::CBORError(..) => kernel::error::Error::to_errno(EINVAL),
             WireFormatError::KernelError(e) => kernel::error::Error::to_errno(*e),
             WireFormatError::TryReserveError(_) => kernel::error::Error::to_errno(EINVAL),
+            WireFormatError::HexError(_) => kernel::error::Error::to_errno(EINVAL),
         }
     }
 
@@ -40,6 +42,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             WireFormatError::CBORError(_) => f.write_str("CBOR error"),
             WireFormatError::KernelError(_) => f.write_str("Kernel error"),
             WireFormatError::TryReserveError(_) => f.write_str("TryReserveError"),
+            WireFormatError::HexError(_) => f.write_str("HexError"),
         }
     }
 }
@@ -70,3 +73,11 @@ fn from(source: TryReserveError) -> Self {
         WireFormatError::TryReserveError(source)
     }
 }
+
+#[allow(unused_qualifications)]
+impl core::convert::From<hex::FromHexError> for WireFormatError {
+    #[allow(deprecated)]
+    fn from(source: hex::FromHexError) -> Self {
+        WireFormatError::HexError(source)
+    }
+}
-- 
2.40.1

