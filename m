Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F902C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238577AbjFIG4Z (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237988AbjFIG4I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:08 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6FF3C11
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4368; q=dns/txt; s=iport;
  t=1686293738; x=1687503338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=poZ4kSKXAE2r0kcUDCiQR7oBQTk6nDIgbo5KDmlHwaA=;
  b=fjCSDzVZ1fhjTzLqUEK9cjPA6iM0ClZfgSSCW0oKblxIlyhHaiAaKct+
   FiP+vY5q3wEYURW0tf9lbA98MEpMVrPaRkhGZv5UyS/c3T7wZ8oGKVAMD
   PQh+8VOMGAQwEtJZks3TvQdqJEzjF1QNt5wghMmo26nJgiTFOhaALBxpk
   w=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857218"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:50 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDc055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:49 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 44/80] rust: serde: add support for deserializing Vec with kernel_alloc feature
Date:   Fri,  9 Jun 2023 09:30:42 +0300
Message-Id: <20230609063118.24852-45-amiculas@cisco.com>
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
 rust/Makefile                   |  4 +++-
 rust/serde/de/impls.rs          | 19 +++++++++++++++++--
 rust/serde/lib.rs               |  2 +-
 rust/serde/private/size_hint.rs |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0b67547d8007..c9feb8e1afe1 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -120,7 +120,9 @@ serde-skip_flags := \
 
 serde-flags := \
     -Amissing_docs \
-    --cfg no_fp_fmt_parse
+    --cfg no_fp_fmt_parse \
+    --cfg 'feature="kernel_alloc"' \
+    --extern alloc
 
 serde_cbor-skip_flags := \
     --edition=2021 \
diff --git a/rust/serde/de/impls.rs b/rust/serde/de/impls.rs
index 9377f5eee650..6b860b2d9450 100644
--- a/rust/serde/de/impls.rs
+++ b/rust/serde/de/impls.rs
@@ -11,9 +11,12 @@
 
 use seed::InPlaceSeed;
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 use __private::size_hint;
 
+#[cfg(feature = "kernel_alloc")]
+use alloc::vec::Vec;
+
 ////////////////////////////////////////////////////////////////////////////////
 
 struct UnitVisitor;
@@ -1012,7 +1015,7 @@ fn nop_reserve<T>(_seq: T, _n: usize) {}
 
 ////////////////////////////////////////////////////////////////////////////////
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 impl<'de, T> Deserialize<'de> for Vec<T>
 where
     T: Deserialize<'de>,
@@ -1039,10 +1042,16 @@ fn visit_seq<A>(self, mut seq: A) -> Result<Self::Value, A::Error>
             where
                 A: SeqAccess<'de>,
             {
+                #[cfg(not(feature = "kernel_alloc"))]
                 let mut values = Vec::with_capacity(size_hint::cautious(seq.size_hint()));
+                #[cfg(feature = "kernel_alloc")]
+                let mut values = Vec::try_with_capacity(size_hint::cautious(seq.size_hint())).unwrap();
 
                 while let Some(value) = try!(seq.next_element()) {
+                    #[cfg(not(feature = "kernel_alloc"))]
                     values.push(value);
+                    #[cfg(feature = "kernel_alloc")]
+                    values.try_push(value).unwrap();
                 }
 
                 Ok(values)
@@ -1077,7 +1086,10 @@ fn visit_seq<A>(self, mut seq: A) -> Result<Self::Value, A::Error>
             {
                 let hint = size_hint::cautious(seq.size_hint());
                 if let Some(additional) = hint.checked_sub(self.0.len()) {
+                    #[cfg(not(feature = "kernel_alloc"))]
                     self.0.reserve(additional);
+                    #[cfg(feature = "kernel_alloc")]
+                    self.0.try_reserve(additional).unwrap();
                 }
 
                 for i in 0..self.0.len() {
@@ -1092,7 +1104,10 @@ fn visit_seq<A>(self, mut seq: A) -> Result<Self::Value, A::Error>
                 }
 
                 while let Some(value) = try!(seq.next_element()) {
+                    #[cfg(not(feature = "kernel_alloc"))]
                     self.0.push(value);
+                    #[cfg(feature = "kernel_alloc")]
+                    self.0.try_push(value).unwrap();
                 }
 
                 Ok(())
diff --git a/rust/serde/lib.rs b/rust/serde/lib.rs
index c3694fef3321..bfc845e98075 100644
--- a/rust/serde/lib.rs
+++ b/rust/serde/lib.rs
@@ -156,7 +156,7 @@
 
 ////////////////////////////////////////////////////////////////////////////////
 
-#[cfg(feature = "alloc")]
+#[cfg(any(feature = "alloc", feature = "kernel_alloc"))]
 extern crate alloc;
 
 /// A facade around all the types we need from the `std`, `core`, and `alloc`
diff --git a/rust/serde/private/size_hint.rs b/rust/serde/private/size_hint.rs
index f050fca59deb..ac3c9394e7d3 100644
--- a/rust/serde/private/size_hint.rs
+++ b/rust/serde/private/size_hint.rs
@@ -9,7 +9,7 @@ pub fn from_bounds<I>(iter: &I) -> Option<usize>
     helper(iter.size_hint())
 }
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 #[inline]
 pub fn cautious(hint: Option<usize>) -> usize {
     cmp::min(hint.unwrap_or(0), 4096)
-- 
2.40.1

