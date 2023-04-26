Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57DEC77B60
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Apr 2023 08:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbjDZIUg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 Apr 2023 04:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239654AbjDZIUg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 Apr 2023 04:20:36 -0400
X-Greylist: delayed 122 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 26 Apr 2023 01:20:34 PDT
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE2210F6
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Apr 2023 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=991; q=dns/txt; s=iport;
  t=1682497235; x=1683706835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1hVL1dW3Hnp9rI/JcRp6myvUhJgzNin3XL8Qc6rAluY=;
  b=ZvYI2I8eXx01ZthPEUqJQc1gSrk1WNs1Yn1B2wUGqjY9xJhHAvyaTRTt
   dWY77kPhT6YkMjSZTW+QSPgOfmA5C5VZFqkK1VKEz05sJRVIsJ0+5VjJA
   a2GIYkqVQbmJOHwa69ZAQI/a31aVplPvL44wuJ4DAjIjZwYWSaMwD4yWa
   c=;
X-IronPort-AV: E=Sophos;i="5.99,227,1677542400"; 
   d="scan'208";a="4880063"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Apr 2023 08:17:25 +0000
Received: from archlinux-cisco.cisco.com ([10.61.201.228])
        (authenticated bits=0)
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 33Q8HHVM024264
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 26 Apr 2023 08:17:25 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
        benno.lossin@proton.me
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH] rust: Sort rust/helpers.c's #include directives
Date:   Wed, 26 Apr 2023 11:17:15 +0300
Message-Id: <20230426081715.40834-1-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <CANiq72kXa-SgRiVhvjU7X4fa8XSJB4po9xf_V4L6Gn2o+t6T+Q@mail.gmail.com>
References: <CANiq72kXa-SgRiVhvjU7X4fa8XSJB4po9xf_V4L6Gn2o+t6T+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.201.228, [10.61.201.228]
X-Outbound-Node: aer-core-1.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Sort the #include directives of rust/helpers.c alphabetically and add a
comment specifying this.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1003
Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/helpers.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/helpers.c b/rust/helpers.c
index 81e80261d597..73c01db0c828 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -16,15 +16,17 @@
  *
  * All symbols are exported as GPL-only to guarantee no GPL-only feature is
  * accidentally exposed.
+ *
+ * Sorted alphabetically.
  */
 
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
-#include <linux/refcount.h>
 #include <linux/mutex.h>
-#include <linux/spinlock.h>
+#include <linux/refcount.h>
 #include <linux/sched/signal.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 
 __noreturn void rust_helper_BUG(void)
-- 
2.40.0

