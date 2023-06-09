Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13084C87FDC
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238509AbjFIGyd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238476AbjFIGyR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:17 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7242D7E
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1349; q=dns/txt; s=iport;
  t=1686293655; x=1687503255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mouQFBPOVow4usNXUGKNCA8at/TLjYBLvthUOgd+moQ=;
  b=PT6KLG+oXVCpFBrudWF4bWaV3MXzhrmGWk68h3TQSqBI2M1rCspaoH0f
   rQA6DuwztUtbPGkJlOdTkMeTO8ull9LsGjTW9VrH1/TiK5EwGunpQwHop
   9a3Pos8ngy3INzjoSi43zyMZuBMc8UFcmFoeUe/2QF9d/cidKIcZU72R0
   0=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220564"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:55 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDr055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:54 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 59/80] samples: puzzlefs: add KernelError to WireFormatError and implement From conversion
Date:   Fri,  9 Jun 2023 09:30:57 +0300
Message-Id: <20230609063118.24852-60-amiculas@cisco.com>
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
 samples/rust/puzzle/error.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index 3427c5d2f7e3..5fa9c1404df4 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -7,6 +7,7 @@ pub(crate) enum WireFormatError {
     SeekOtherError,
     ValueMissing,
     CBORError(serde_cbor::Error),
+    KernelError(kernel::error::Error),
 }
 
 impl Display for WireFormatError {
@@ -16,6 +17,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             WireFormatError::SeekOtherError => f.write_str("cannot seek to other blob"),
             WireFormatError::ValueMissing => f.write_str("no value present"),
             WireFormatError::CBORError(_) => f.write_str("CBOR error"),
+            WireFormatError::KernelError(_) => f.write_str("Kernel error"),
         }
     }
 }
@@ -30,3 +32,11 @@ fn from(source: serde_cbor::Error) -> Self {
         WireFormatError::CBORError(source)
     }
 }
+
+#[allow(unused_qualifications)]
+impl core::convert::From<kernel::error::Error> for WireFormatError {
+    #[allow(deprecated)]
+    fn from(source: kernel::error::Error) -> Self {
+        WireFormatError::KernelError(source)
+    }
+}
-- 
2.40.1

