Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EB3C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237687AbjFIGyI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:08 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2794272A
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=598; q=dns/txt; s=iport;
  t=1686293647; x=1687503247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wNFvatKwoX1MJwvpxjn8wf60XjSOfMxD1chVbJO/uu0=;
  b=GNc3BmquhSTH/zUj1P5booVdg85Tw3ko/eqfA2PnxnmkXjWJYfACNRo9
   +hAiOzEqVahi3K7UBbRcoxPAZsROvkd5IfFG/QCTLgjjHiq/F2WIX9Go4
   lf8tFaZM6XOMwTOtgrFAWx2dbVFVhbHRUH7i7AvWhZp3ypj/uTnv5t/I6
   A=;
X-CSE-ConnectionGUID: D3ptSMo2S/S6OwaynulrNg==
X-CSE-MsgGUID: nmN65veXQ8y6FuuIK0EuXg==
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799469"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:54 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDn055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:53 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 55/80] rust: file: add get_pos method to RegularFile
Date:   Fri,  9 Jun 2023 09:30:53 +0300
Message-Id: <20230609063118.24852-56-amiculas@cisco.com>
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
 rust/kernel/file.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index afb2084745de..5b119d6c4f72 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -287,6 +287,11 @@ pub fn read_with_offset(&self, buf: &mut [u8], offset: u64) -> Result<usize> {
             result.try_into()?
         })
     }
+
+    /// Get the current file position
+    pub fn get_pos(&self) -> u64 {
+        self.0.pos()
+    }
 }
 
 /// A file descriptor reservation.
-- 
2.40.1

