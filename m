Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE6AC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238034AbjFIG43 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbjFIG4O (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:14 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C985830FA
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1548; q=dns/txt; s=iport;
  t=1686293743; x=1687503343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p0wMN60cY10QWgXMPeGDd41yZv2hmm4rqM31ZTqLRqo=;
  b=lnyjakRx8vMsYiiA3GVHs/0TL4r8Ib3TGXDObr3rGUcBnda43WKqIf2d
   MXSAcQH4DBZJzm+zvKAYMg1LO69y7UknCE6ORoRStsGLefPexRHrMdq2H
   7bG8J9cq1JniClb8E0WcJMRAtPLrRZuU0uCAzSlweke3/XufLJ1htZlc0
   k=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820471"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:56 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDw055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:56 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 64/80] samples: puzzlefs: implement to_errno and from_errno for WireFormatError
Date:   Fri,  9 Jun 2023 09:31:02 +0300
Message-Id: <20230609063118.24852-65-amiculas@cisco.com>
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
 samples/rust/puzzle/error.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index 5fa9c1404df4..254926e6b4e2 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -1,4 +1,6 @@
+use core::ffi::c_int;
 use core::fmt::{self, Display};
+use kernel::prelude::{EINVAL, ENOENT, ESPIPE};
 
 // TODO use String in error types (when it's available from the kernel)
 
@@ -10,6 +12,23 @@ pub(crate) enum WireFormatError {
     KernelError(kernel::error::Error),
 }
 
+impl WireFormatError {
+    pub(crate) fn to_errno(&self) -> c_int {
+        match self {
+            WireFormatError::LocalRefError => kernel::error::Error::to_errno(EINVAL),
+            WireFormatError::SeekOtherError => kernel::error::Error::to_errno(ESPIPE),
+            WireFormatError::ValueMissing => kernel::error::Error::to_errno(ENOENT),
+            WireFormatError::CBORError(..) => kernel::error::Error::to_errno(EINVAL),
+            WireFormatError::KernelError(e) => kernel::error::Error::to_errno(*e),
+            WireFormatError::TryReserveError(e) => kernel::error::Error::to_errno(EINVAL),
+        }
+    }
+
+    pub(crate) fn from_errno(errno: kernel::error::Error) -> Self {
+        Self::KernelError(errno)
+    }
+}
+
 impl Display for WireFormatError {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
-- 
2.40.1

