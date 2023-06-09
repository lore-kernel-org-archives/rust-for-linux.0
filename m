Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84436C83005
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238021AbjFIGyT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238494AbjFIGyN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:13 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC5230C5
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1008; q=dns/txt; s=iport;
  t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kFPIxUv1JEM2z9PtGJ4FK80G1ryE4KiCeF5WLnfrSno=;
  b=l6N2kVTX/QQRO0M1ChvE9Rx3QIZQfoAV1RiWEwdZcm5Wraq53m0iK/XG
   ay9isX6+v0BIqV9YMiyrRZEHtlW9w69rcqkixXgYI4Qfz/Qdt83Bn7X2m
   bMbw1Ey5HiQXSHm1BcAwYMR8LpF7mdDxWbQxoePmGkIbe0xfj/drCCNNw
   Y=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857708"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:59 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE8055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:58 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 74/80] rust: puzzlefs: display the error value for WireFormatError::KernelError
Date:   Fri,  9 Jun 2023 09:31:12 +0300
Message-Id: <20230609063118.24852-75-amiculas@cisco.com>
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
 samples/rust/puzzle/error.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
index 8554756be8d3..8766d01ef932 100644
--- a/samples/rust/puzzle/error.rs
+++ b/samples/rust/puzzle/error.rs
@@ -40,7 +40,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             WireFormatError::SeekOtherError => f.write_str("cannot seek to other blob"),
             WireFormatError::ValueMissing => f.write_str("no value present"),
             WireFormatError::CBORError(_) => f.write_str("CBOR error"),
-            WireFormatError::KernelError(_) => f.write_str("Kernel error"),
+            WireFormatError::KernelError(e) => write!(f, "Kernel error {:?}", e.to_errno()),
             WireFormatError::TryReserveError(_) => f.write_str("TryReserveError"),
             WireFormatError::HexError(_) => f.write_str("HexError"),
         }
-- 
2.40.1

