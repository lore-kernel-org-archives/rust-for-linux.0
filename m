Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5136DC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjFIGyH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjFIGyG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:06 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6344F2718
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2801; q=dns/txt; s=iport;
  t=1686293645; x=1687503245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUAqCbBGscloBvB6bYj31wfUA0YN7NHxO7CkAI61Pfc=;
  b=FsyMLY73gjyW1FR2+8+YyOwyNATqbuk1FmLyEgrwqF57xLNJgKRPgStr
   vrglYM8WFnw4ot9c/BM7ttfxZl/bx2LJ/G30T/AII2bnAWo+OXzl9MFtt
   s8KGzCDng7ar79DVhlKcClB3hzBWA+HBd5GJ1NEJk7KsJlwM0dQ1hSDAF
   c=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857702"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:49 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDa055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:49 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 42/80] samples: rust: add cbor serialize/deserialize example
Date:   Fri,  9 Jun 2023 09:30:40 +0300
Message-Id: <20230609063118.24852-43-amiculas@cisco.com>
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
 samples/rust/rust_serde.rs | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/samples/rust/rust_serde.rs b/samples/rust/rust_serde.rs
index 3d4957dd0822..0578f0fa137c 100644
--- a/samples/rust/rust_serde.rs
+++ b/samples/rust/rust_serde.rs
@@ -7,6 +7,8 @@
 
 use kernel::prelude::*;
 use serde_derive::{Deserialize, Serialize};
+use serde_cbor::ser::SliceWrite;
+use serde::Serialize;
 
 module! {
     type: RustSerde,
@@ -38,6 +40,57 @@ struct S {
     d: (),
 }
 
+#[derive(Debug, PartialEq, Serialize, Deserialize)]
+struct User {
+    user_id: u32,
+    password_hash: [u8; 4],
+}
+
+fn cbor_serialize() -> Result<(), serde_cbor::Error> {
+    let mut buf = [0u8; 100];
+    let writer = SliceWrite::new(&mut buf[..]);
+    let mut ser = serde_cbor::Serializer::new(writer);
+    let user = User {
+        user_id: 42,
+        password_hash: [1, 2, 3, 4],
+    };
+    user.serialize(&mut ser)?;
+    let writer = ser.into_inner();
+    let size = writer.bytes_written();
+    let expected = [
+        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d,
+        0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73,
+        0x68, 0x84, 0x1, 0x2, 0x3, 0x4
+    ];
+    assert_eq!(&buf[..size], expected);
+
+    crate::pr_info!("cbor serialized = {:?}", buf);
+
+    Ok(())
+}
+
+fn cbor_deserialize() -> Result<(), serde_cbor::Error> {
+    let value = [
+        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d,
+        0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73,
+        0x68, 0x84, 0x1, 0x2, 0x3, 0x4
+    ];
+
+    // from_slice_with_scratch will not alter input data, use it whenever you
+    // borrow from somewhere else.
+    // You will have to size your scratch according to the input data you
+    // expect.
+    let mut scratch = [0u8; 32];
+    let user: User = serde_cbor::de::from_slice_with_scratch(&value[..], &mut scratch)?;
+    assert_eq!(user, User {
+        user_id: 42,
+        password_hash: [1, 2, 3, 4],
+    });
+
+    crate::pr_info!("cbor deserialized = {:?}", user);
+    Ok(())
+}
+
 impl kernel::Module for RustSerde {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust serde sample (init)\n");
@@ -62,6 +115,9 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
         let deserialized: S = local_data_format::from_bytes(&serialized).unwrap();
         crate::pr_info!("deserialized (local) = {:?}", deserialized);
 
+        cbor_serialize().unwrap();
+        cbor_deserialize().unwrap();
+
         Ok(RustSerde)
     }
 }
-- 
2.40.1

