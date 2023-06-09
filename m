Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E88C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjFIGyc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238549AbjFIGyR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:17 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0FF2718
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3631; q=dns/txt; s=iport;
  t=1686293654; x=1687503254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=99VouR26BlBAwHzl036iVu18RJU2VEAH7jm78IPcSug=;
  b=dJkcb8vaBofykwtrJGXyi8DFaeSMkDrOhcfSEu7tjp84DUNYuBnEH816
   hmD7/E6w3d+C9C6Bx97eKZN8FJHZQST+bkV50P+orUGTC5eHIB5UexIFo
   RRxrQoo2uujFOGCN00uePAMXYJ1EDbcD/fBZYUufj1G0X7WaeyHKmD3Dy
   8=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508930"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:48 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDX055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:48 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 39/80] rust: serde_cbor: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:37 +0300
Message-Id: <20230609063118.24852-40-amiculas@cisco.com>
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
 rust/serde_cbor/de.rs        | 2 ++
 rust/serde_cbor/error.rs     | 2 ++
 rust/serde_cbor/lib.rs       | 2 ++
 rust/serde_cbor/read.rs      | 2 ++
 rust/serde_cbor/ser.rs       | 2 ++
 rust/serde_cbor/tags.rs      | 2 ++
 rust/serde_cbor/value/de.rs  | 2 ++
 rust/serde_cbor/value/mod.rs | 2 ++
 rust/serde_cbor/value/ser.rs | 2 ++
 rust/serde_cbor/write.rs     | 2 ++
 10 files changed, 20 insertions(+)

diff --git a/rust/serde_cbor/de.rs b/rust/serde_cbor/de.rs
index 170e0593cf44..1c9a9acc8eb5 100644
--- a/rust/serde_cbor/de.rs
+++ b/rust/serde_cbor/de.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Deserialization.
 
 use core::f32;
diff --git a/rust/serde_cbor/error.rs b/rust/serde_cbor/error.rs
index b1a6a459e540..0b4b5be8edcc 100644
--- a/rust/serde_cbor/error.rs
+++ b/rust/serde_cbor/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! When serializing or deserializing CBOR goes wrong.
 use core::fmt;
 use core::result;
diff --git a/rust/serde_cbor/lib.rs b/rust/serde_cbor/lib.rs
index 55668541539b..cf406a439340 100644
--- a/rust/serde_cbor/lib.rs
+++ b/rust/serde_cbor/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! CBOR and serialization.
 //!
 //! # Usage
diff --git a/rust/serde_cbor/read.rs b/rust/serde_cbor/read.rs
index 1b53018df870..6c17282d2c5d 100644
--- a/rust/serde_cbor/read.rs
+++ b/rust/serde_cbor/read.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "alloc")]
 use alloc::{vec, vec::Vec};
 #[cfg(feature = "std")]
diff --git a/rust/serde_cbor/ser.rs b/rust/serde_cbor/ser.rs
index 7016dc340a84..9f5bb67f0479 100644
--- a/rust/serde_cbor/ser.rs
+++ b/rust/serde_cbor/ser.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Serialize a Rust data structure to CBOR data.
 
 #[cfg(feature = "alloc")]
diff --git a/rust/serde_cbor/tags.rs b/rust/serde_cbor/tags.rs
index 8adccb8ea8b5..057765b9d2f8 100644
--- a/rust/serde_cbor/tags.rs
+++ b/rust/serde_cbor/tags.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Support for cbor tags
 use core::fmt;
 use core::marker::PhantomData;
diff --git a/rust/serde_cbor/value/de.rs b/rust/serde_cbor/value/de.rs
index f5bdbb74676c..366eda1e27ac 100644
--- a/rust/serde_cbor/value/de.rs
+++ b/rust/serde_cbor/value/de.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::collections::BTreeMap;
 use std::fmt;
 
diff --git a/rust/serde_cbor/value/mod.rs b/rust/serde_cbor/value/mod.rs
index 7bd2255314ca..cc93c2b40a52 100644
--- a/rust/serde_cbor/value/mod.rs
+++ b/rust/serde_cbor/value/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! CBOR values, keys and serialization routines.
 
 mod de;
diff --git a/rust/serde_cbor/value/ser.rs b/rust/serde_cbor/value/ser.rs
index 347aae9601fa..e52987778288 100644
--- a/rust/serde_cbor/value/ser.rs
+++ b/rust/serde_cbor/value/ser.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Copyright 2017 Serde Developers
 //
 // Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
diff --git a/rust/serde_cbor/write.rs b/rust/serde_cbor/write.rs
index 94c326ef96b0..21baf7de9711 100644
--- a/rust/serde_cbor/write.rs
+++ b/rust/serde_cbor/write.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "alloc")]
 use alloc::vec::Vec;
 #[cfg(not(feature = "std"))]
-- 
2.40.1

