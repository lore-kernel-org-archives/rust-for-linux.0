Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC31C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbjFIGz6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237988AbjFIGzt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:49 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D75635B1
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=527; q=dns/txt; s=iport;
  t=1686293718; x=1687503318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qq3lRW4GH+znAiRIXvFB+YhP9f2auQGkGocVhEb7cc8=;
  b=aN34d3yMwFmYIt11T176qjayTqlb4v9RsdGEyM1x1FwIjwLdV+8s8DG+
   kQg4O1LnP3G25gZl3sZl5usG43tEN3LhLOuh7jXXWrqQ8YjAMKxCzADzX
   KXDuPtSpMGr+MG8eAKcbxOV+yGW3qiEaie4JoEdoxPh/wzyzvFtZmP4vP
   8=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453685"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:55 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDt055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:55 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 61/80] samples: puzzlefs: build puzzlefs into the kernel, thus avoiding the need to export rust symbols
Date:   Fri,  9 Jun 2023 09:30:59 +0300
Message-Id: <20230609063118.24852-62-amiculas@cisco.com>
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

---
 kernel/configs/rust.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
index 5e29e66e8f7d..4b109055f990 100644
--- a/kernel/configs/rust.config
+++ b/kernel/configs/rust.config
@@ -6,7 +6,7 @@ CONFIG_SAMPLES_RUST=y
 CONFIG_SAMPLE_RUST_MINIMAL=m
 CONFIG_SAMPLE_RUST_PRINT=m
 CONFIG_SAMPLE_RUST_FS=m
-CONFIG_SAMPLE_PUZZLEFS=m
+CONFIG_SAMPLE_PUZZLEFS=y
 CONFIG_SAMPLE_RUST_HOSTPROGS=y
 CONFIG_SAMPLE_RUST_SERDE=y
 
-- 
2.40.1

