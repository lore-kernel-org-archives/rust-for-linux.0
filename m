Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4397C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238572AbjFIG4Y (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237974AbjFIG4I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:08 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CCF3C12
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1406; q=dns/txt; s=iport;
  t=1686293738; x=1687503338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BVAioZoebkUk4n3b9DlbBt8/kLmK7TeOBJnBjldfQ5g=;
  b=PonIQtzBabN7h8TGN+FVoVhbtq7ng/w8Xy5s8Q9zYMyWYbWCfR9aBZKB
   nhM57JlU3kCdZMN3KlUnGkK8+qLcH3FENcUcWNWEU4UcWFioiVnVckDma
   W5aUtY88+JSwjAs4mclxOTpmTWvpYUQH5NIyuWahEfj8k6zmM0bxBWATT
   A=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279102"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:56 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDu055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:55 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 62/80] rust: alloc: add try_clone for Vec<T>
Date:   Fri,  9 Jun 2023 09:31:00 +0300
Message-Id: <20230609063118.24852-63-amiculas@cisco.com>
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
 rust/alloc/vec/mod.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/alloc/vec/mod.rs b/rust/alloc/vec/mod.rs
index 94995913566b..2ca945f7eb9b 100644
--- a/rust/alloc/vec/mod.rs
+++ b/rust/alloc/vec/mod.rs
@@ -2489,6 +2489,15 @@ unsafe fn split_at_spare_mut_with_len(
     }
 }
 
+impl<T: Clone> Vec<T> {
+    /// Try to clone the vector using the global allocator
+    #[inline]
+    #[stable(feature = "kernel", since = "1.0.0")]
+    pub fn try_clone(&self) -> Result<Self, TryReserveError> {
+        self.try_clone_in(Global)
+    }
+}
+
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Resizes the `Vec` in-place so that `len` is equal to `new_len`.
     ///
@@ -2613,6 +2622,14 @@ pub fn try_extend_from_slice(&mut self, other: &[T]) -> Result<(), TryReserveErr
         self.try_spec_extend(other.iter())
     }
 
+    /// Tries to clone the vector using the given allocator
+    #[stable(feature = "kernel", since = "1.0.0")]
+    pub fn try_clone_in(&self, allocator: A) -> Result<Self, TryReserveError> {
+        let mut new_vec = Vec::try_with_capacity_in(self.len(), allocator)?;
+        new_vec.try_extend_from_slice(&self)?;
+        Ok(new_vec)
+    }
+
     /// Copies elements from `src` range to the end of the vector.
     ///
     /// # Panics
-- 
2.40.1

