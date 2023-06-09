Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7786DC7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238550AbjFIGyS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbjFIGyL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:11 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADBA271D
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1360; q=dns/txt; s=iport;
  t=1686293649; x=1687503249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ekq0zE5Bz7mGa1j5s6Vb4PXVhaFdlj5hirgH3ngpa9c=;
  b=SbWbEN/VyAcAtCgCqnW8UNjtp18p1ULNlA/Lpg0SRGcy4+IoLHsHlT7E
   hVrT/CMWH/qhNcm484Bo9Nw7q92UNcHq00m3MNRiJP4Zpl03ydv1i9VQ3
   iq6Aica+5UH36IZDnOBo6G5YUQG+STkTZkjDLsV6/tCUIhaQiZfoNNIJL
   o=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508936"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:59 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIEA055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:59 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 76/80] samples: puzzlefs: implement the conversion from WireFormatError to kernel::error::Error
Date:   Fri,  9 Jun 2023 09:31:14 +0300
Message-Id: <20230609063118.24852-77-amiculas@cisco.com>
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
 rust/kernel/error.rs         | 2 +-
 samples/rust/puzzle/error.rs | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6fff9a4f0672..8196a7462561 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -96,7 +96,7 @@ impl Error {
     ///
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
-    pub(crate) fn from_errno(errno: core::ffi::c_int) -> Error {
+    pub fn from_errno(errno: core::ffi::c_int) -> Error {
         if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index 8766d01ef932..c9635a96f9e2 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -81,3 +81,11 @@ fn from(source: hex::FromHexError) -> Self {
         WireFormatError::HexError(source)
     }
 }
+
+#[allow(unused_qualifications)]
+impl core::convert::From<WireFormatError> for kernel::error::Error {
+    #[allow(deprecated)]
+    fn from(source: WireFormatError) -> Self {
+        kernel::error::Error::from_errno(source.to_errno())
+    }
+}
-- 
2.40.1

