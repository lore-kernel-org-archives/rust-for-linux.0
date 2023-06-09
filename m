Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E78C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjFIGzN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjFIGzI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:08 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E8A35A9
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1878; q=dns/txt; s=iport;
  t=1686293688; x=1687503288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AhB7KswFswa2ufveuyuAUoLgW/tRP2PpPNEFnxUEDww=;
  b=BsfNREu+DTQn03k3wRE0J+ywFcWoylRkgL+xms1lov/vrV3CsgZ0Llxh
   1A5Eq0P2YUmgjjuF+qRYbtcNLtQhqvzZRtSqIY0yg1yFeVccBGoG9YvH1
   zegcG//O1GzAY9wuAAvqyCHe3mj+qkB9S06MVj62rdL2lMH7RxphLnUkS
   Y=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857221"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:54 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDq055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:54 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 58/80] samples: puzzlefs: add cbor_get_array_size method
Date:   Fri,  9 Jun 2023 09:30:56 +0300
Message-Id: <20230609063118.24852-59-amiculas@cisco.com>
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
 samples/rust/puzzle/types/cbor_helpers.rs | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/samples/rust/puzzle/types/cbor_helpers.rs b/samples/rust/puzzle/types/cbor_helpers.rs
index ae2aa4609428..b09c104a9286 100644
--- a/samples/rust/puzzle/types/cbor_helpers.rs
+++ b/samples/rust/puzzle/types/cbor_helpers.rs
@@ -1,3 +1,6 @@
+use crate::puzzle::types::{Result, WireFormatError};
+use kernel::file::Read;
+
 pub(crate) const fn cbor_size_of_list_header(size: usize) -> usize {
     match size {
         0..=23 => 1,
@@ -7,3 +10,41 @@ pub(crate) const fn cbor_size_of_list_header(size: usize) -> usize {
         _ => 8,
     }
 }
+
+fn parse_u8(mut reader: impl Read) -> Result<u8> {
+    let mut buf = [0; 1];
+    reader.read_exact(&mut buf)?;
+    Ok(u8::from_be_bytes(buf))
+}
+
+fn parse_u16(mut reader: impl Read) -> Result<u16> {
+    let mut buf = [0; 2];
+    reader.read_exact(&mut buf)?;
+    Ok(u16::from_be_bytes(buf))
+}
+
+fn parse_u32(mut reader: impl Read) -> Result<u32> {
+    let mut buf = [0; 4];
+    reader.read_exact(&mut buf)?;
+    Ok(u32::from_be_bytes(buf))
+}
+
+fn parse_u64(mut reader: impl Read) -> Result<u64> {
+    let mut buf = [0; 8];
+    reader.read_exact(&mut buf)?;
+    Ok(u64::from_be_bytes(buf))
+}
+
+pub(crate) fn cbor_get_array_size<R: Read>(mut reader: R) -> Result<u64> {
+    let mut buf = [0; 1];
+    reader.read_exact(&mut buf)?;
+
+    match buf[0] {
+        0x80..=0x97 => Ok((buf[0] - 0x80) as u64),
+        0x98 => parse_u8(reader).map(u64::from),
+        0x99 => parse_u16(reader).map(u64::from),
+        0x9a => parse_u32(reader).map(u64::from),
+        0x9b => parse_u64(reader).map(u64::from),
+        _ => Err(WireFormatError::ValueMissing),
+    }
+}
-- 
2.40.1

