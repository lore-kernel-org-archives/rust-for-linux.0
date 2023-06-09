Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9C7C7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjFIGzw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjFIGzm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:42 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A4830EC
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=399; q=dns/txt; s=iport;
  t=1686293712; x=1687503312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1FogRc3amejYCyE9AaNMTo6iZcgqhtulRteru0o/J8=;
  b=CJTtJT8y1CWg7jqbgKsoOChGfU/B4uv5qWyingJiupwU3j+FF0P6u7/c
   d2TXMzKGLa8L5NHQ7m7qNbDhjqQ1fW8+8WvddESWaCTNXtymCW0hvy5cy
   FcDyVd6NqzNyb4ADWAm1ewuHEbQ8DSaqvE0wVGxJ2sMpUuFULh/KeGO/f
   Q=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820462"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:40 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID6055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:39 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 12/80] drop: Add crate::pr_warn declaration
Date:   Fri,  9 Jun 2023 09:30:10 +0300
Message-Id: <20230609063118.24852-13-amiculas@cisco.com>
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
 rust/kernel/fs.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 2a0267b3c0b6..1d920fde4022 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -17,7 +17,6 @@
 use core::{
     cell::UnsafeCell, marker::PhantomData, marker::PhantomPinned, ops::Deref, pin::Pin, ptr,
 };
-
 use macros::vtable;
 
 pub mod param;
-- 
2.40.1

