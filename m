Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB5DC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbjFIG41 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbjFIG4K (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:10 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8697230F9
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1121; q=dns/txt; s=iport;
  t=1686293740; x=1687503340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kH5ph0iTXjBO1ubPo3VSAa2CqhhZw5JtgB3uPmeczRo=;
  b=Q/VLaHwlLeuieD/j6hbS6u/e4K30yusBDqxXjEXpDpM7QjUmZjin2U8X
   CAzRkEczm5WPSzXQRqSWPa/Hhvfx+jDyNKDcmTC9UpuBishPs61LO7bCU
   YQsTKmLXnbAAkHoh/0vCXpmS9MmS0D3sdOM2TqP0zTN0THQTs1gboLJ0E
   k=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279103"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:58 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE3055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:57 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 69/80] rust: hex: add SPDX license identifiers
Date:   Fri,  9 Jun 2023 09:31:07 +0300
Message-Id: <20230609063118.24852-70-amiculas@cisco.com>
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
 rust/hex/error.rs | 2 ++
 rust/hex/lib.rs   | 2 ++
 rust/hex/serde.rs | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/rust/hex/error.rs b/rust/hex/error.rs
index ff7a3b5c16bd..e553a046c9ed 100644
--- a/rust/hex/error.rs
+++ b/rust/hex/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::fmt;
 
 /// The error type for decoding a hex string into `Vec<u8>` or `[u8; N]`.
diff --git a/rust/hex/lib.rs b/rust/hex/lib.rs
index ec48961b9ffe..a23def3f80db 100644
--- a/rust/hex/lib.rs
+++ b/rust/hex/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Copyright (c) 2013-2014 The Rust Project Developers.
 // Copyright (c) 2015-2020 The rust-hex Developers.
 //
diff --git a/rust/hex/serde.rs b/rust/hex/serde.rs
index 335a15132a27..40ab1edb2bc8 100644
--- a/rust/hex/serde.rs
+++ b/rust/hex/serde.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Hex encoding with `serde`.
 #[cfg_attr(
     all(feature = "alloc", feature = "serde"),
-- 
2.40.1

