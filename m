Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8061C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjFIGzN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjFIGzK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:10 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE073585
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=429; q=dns/txt; s=iport;
  t=1686293691; x=1687503291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZPBWLwZ04uVSCsWOMcNT9dzBFwpTdCJ70Lu8dR9ozU=;
  b=N7IYv+BOX15DLwBHvjs7Q505OKeBqjX39Eu0evqnuX1GTRGHzT/2sfjk
   Xx84G76tg2kLyBhMBBBmNEEjPXAzaAJSYXz/9/unKwsc9ooYnyKzJDzW1
   JORy6VIqdoOhLTWyzzBRrUEJ8RF+4R936L7k0u5gwxw0umgWnlOBkhr6m
   g=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279097"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:47 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDU055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:47 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 36/80] Add SAMPLE_RUST_SERDE in rust.config
Date:   Fri,  9 Jun 2023 09:30:34 +0300
Message-Id: <20230609063118.24852-37-amiculas@cisco.com>
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
 kernel/configs/rust.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
index 422b49798d92..5e29e66e8f7d 100644
--- a/kernel/configs/rust.config
+++ b/kernel/configs/rust.config
@@ -8,4 +8,5 @@ CONFIG_SAMPLE_RUST_PRINT=m
 CONFIG_SAMPLE_RUST_FS=m
 CONFIG_SAMPLE_PUZZLEFS=m
 CONFIG_SAMPLE_RUST_HOSTPROGS=y
+CONFIG_SAMPLE_RUST_SERDE=y
 
-- 
2.40.1

