Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121EC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238421AbjFIGzx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbjFIGzn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:43 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B6C3583
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=576; q=dns/txt; s=iport;
  t=1686293713; x=1687503313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lkO/lDf2A3Y1spvqU1zsq9HQHRdFgHfXrdqTBDDEDKA=;
  b=k8NJAHIYJuKiDV552ncpF3s9x9RdXpiVVHqSq9IFB0lyXyVCOTlQj28a
   0NtJIfGkYNk5ULFn1QI/t0r5Fgxg4cwaQqJNBTLTo+Z3Ye5DpcWsjqI2a
   L5eos8U1HRSoGAmtRe9Li8oJo04hMvVnbFxaMjp8Ml3AWxU8s0NSIxScl
   o=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820463"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:42 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDE055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:41 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 20/80] kernel: configs: enable rust samples in rust.config
Date:   Fri,  9 Jun 2023 09:30:18 +0300
Message-Id: <20230609063118.24852-21-amiculas@cisco.com>
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
 kernel/configs/rust.config | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
index 38a7c5362c9c..422b49798d92 100644
--- a/kernel/configs/rust.config
+++ b/kernel/configs/rust.config
@@ -1 +1,11 @@
 CONFIG_RUST=y
+
+CONFIG_MODULES=y
+CONFIG_SAMPLES=y
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=m
+CONFIG_SAMPLE_RUST_PRINT=m
+CONFIG_SAMPLE_RUST_FS=m
+CONFIG_SAMPLE_PUZZLEFS=m
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
+
-- 
2.40.1

