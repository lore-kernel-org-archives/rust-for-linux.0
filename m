Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFFAC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238475AbjFIGyK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:10 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948FF2D7B
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=990; q=dns/txt; s=iport;
  t=1686293648; x=1687503248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDPrHehaSVMJttr8Gt36YOXEapeyJb82JDuVYvh3n5U=;
  b=Cw/psnslNWSe2n+llZTMr27e3IiI2xj6bwGIGqSXVxov6zwehJZ7Z/G6
   YzEoBuDjhNADkclRNQNlkI+9Ew2Yse3S7MLcFzlK+g6zuCaJWj6BuVngU
   GI5RdoREerrFL/ucKssTTMNJjTqQIUtXvVNgKPvoi4ol4FrfIhdA7fIfY
   k=;
X-CSE-ConnectionGUID: ULSvVzoKRXmkfew1mO+c9w==
X-CSE-MsgGUID: IP/aoAT3QL6NMNrZ+AtJtA==
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799470"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:56 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDv055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:55 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 63/80] rust: alloc: add from_iter_fallible for Vec<T>
Date:   Fri,  9 Jun 2023 09:31:01 +0300
Message-Id: <20230609063118.24852-64-amiculas@cisco.com>
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
 rust/alloc/vec/mod.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/alloc/vec/mod.rs b/rust/alloc/vec/mod.rs
index 2ca945f7eb9b..b755cf0b936c 100644
--- a/rust/alloc/vec/mod.rs
+++ b/rust/alloc/vec/mod.rs
@@ -649,6 +649,16 @@ pub fn try_with_capacity(capacity: usize) -> Result<Self, TryReserveError> {
     pub unsafe fn from_raw_parts(ptr: *mut T, length: usize, capacity: usize) -> Self {
         unsafe { Self::from_raw_parts_in(ptr, length, capacity, Global) }
     }
+
+    /// See https://doc.rust-lang.org/std/vec/struct.Vec.html#examples-31
+    #[stable(feature = "rust1", since = "1.0.0")]
+    pub fn from_iter_fallible(iter: impl Iterator<Item=T>) -> Result<Vec<T>, TryReserveError> {
+        let mut vec = Vec::new();
+        for value in iter {
+            vec.try_push(value)?;
+        }
+        Ok(vec)
+    }
 }
 
 impl<T, A: Allocator> Vec<T, A> {
-- 
2.40.1

