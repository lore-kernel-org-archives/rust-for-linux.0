Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626A9C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbjFIG4w (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238171AbjFIG4a (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:30 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE343AA7
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1150; q=dns/txt; s=iport;
  t=1686293778; x=1687503378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Xqb8KBvktXNzD3OdGr0wKmDiZjlz7Tb+Xx4+ZL++Rk=;
  b=UxxlasEH6yLCU0vh0/19mk97RgUGQMc66eQiwAnqjr/+bYI9Y8R30V3m
   wNerJbWEV7D9fOy4QlkJ5uUQTvzA8w1OXJo5O8WXHw+VVGB+OTj4DCI4J
   IB18i7G0TNI0rbSS0BM40fp2EOMCrOQ0prbggcCIe/e9xbRf899+l8EiQ
   Q=;
X-IPAS-Result: =?us-ascii?q?A0AQAQAWx4JklxbLJq1agliDJFUuEkeNTYhVnWuBfg8BA?=
 =?us-ascii?q?QENAQExEwQBAYUGAoV1JjQJDgECBAEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHB?=
 =?us-ascii?q?BQBAQEBAQEBATcFEDWFaA2GBQMDJwsBRhAgMVcZgn4BglwDrRiBeTOBAYR1m?=
 =?us-ascii?q?muBaIFCjBaFSkKBSUSECHaFEYV1BI4vjyiBKW+BHjlpfwIJAhFngQoIXIFzQ?=
 =?us-ascii?q?AINVAsLY4EdglUCAhE8FFJiGR0DBwQCgQUQLwcEMigGCRgvJwZTBxcWJAkTF?=
 =?us-ascii?q?UIEg1kKgRBAFQ4RglwqAgc2bwMJAwcFSUADCxgNSBEsNRQfBkOBBxdjgXwkJ?=
 =?us-ascii?q?J5Ggw0BgQ2CKaRXoCqEEot8lQQaM4VXo36YFqNdhC8CBAYFAhaBYzqBWzMaC?=
 =?us-ascii?q?BsVgyIJSRkPjjmJcIlnQTE7AgcLAQEDCYtGAQE?=
IronPort-Data: A9a23:7q5CY6NbtWveZBDvrR3el8FynXyQoLVcMsEvi/4bfWQNrUoh0DICx
 jMZUW+AOqvcazCmeNokaYvi8hhV78PXnd5jTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl52Uo48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjik806JrH6Q3UgRGtWqxo4hj0
 M9njrXlHG/FPoWU8AgcexBVCWR1OrdLveKBKnmkusvVxErDG5fu66wxVwdtbctCor0xWzsmG
 f8wcFjhajiKguO93bayUcFnh98oK4/gO4Z3VnRIkG2EVqh5EfgvRY2bztpq+SgTr/pCNtvfe
 fYWYz9sXE35Nkgn1lA/UcJiw7jAamPEWzpapV6cjak6+W7eyEp2yreFGMDIYcDPS8JP20KZo
 H/W13r2DwtcN9GFzzeBtHW2iYfycTjTUY8IUbyg8eR2xVua2ioYCQYdUh2wpvzRZlOCt8x3L
 kIV/noF84MJt12VEeHBBw+gulS/l0tJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrFVTGM
 XfUw7vU6SxTXK69FCjGqObExd+mEXVPdDVTDcMRZVFdi+QPtr3fmTrpar6P+oacitj4Azy4+
 CyDoEDSbJ1K1pdWv0lX1X7DjiyropHPQmYICuTrsoCNs1kRiG2NPtLABb3nARBod9/xor6p5
 iJspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiDzI9oMsWkldBo4aK7onAMFh
 meN4mu9A7cObBOXgVNfOOpd9uxzl/G7TIS5PhwqRoMXMsMZmPC7ENFGPB7MgD+FfLkEmqAkM
 pDTate3EXsfEsxaIMmeGY8gPUsQ7nlmnwv7HMmjpzz+iOr2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FC7SjOnSJqNFMRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:38qTw6/gtgJwHfMUwm9uk+D3I+orL9Y04lQ7vn2ZhyY4TiX+rb
 HLoB1173HJYVoqMk3I3OrwW5VoIkmskKKdn7NxAV7KZmCP01dAbrsSj7cKqAeOJ8SRzINg/J
 YlW7RiCdH2EFhxhdv37U2FCdo6qeP3l5xA/d2/85+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:z6MAi2PpumO4t+5DXSdm8B4/ROseMWzjk0/se12gE0xSYejA
X-Talos-MUID: 9a23:0fnI3AkUEDHI/2YZIbDIdnozH8JaxruNIXoBurgHpfWLPylzC26k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453678"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:45 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDM055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:44 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 28/80] rust: syn: remove `unicode-ident` dependency
Date:   Fri,  9 Jun 2023 09:30:26 +0300
Message-Id: <20230609063118.24852-29-amiculas@cisco.com>
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

From: Miguel Ojeda <ojeda@kernel.org>

The `syn` crate depends on the `unicode-ident` crate
to determine whether characters have the XID_Start or XID_Continue
properties according to Unicode Standard Annex #31.

However, we only need ASCII identifiers in the kernel, thus we can
simplify the check and remove completely that dependency.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/syn/ident.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/syn/ident.rs b/rust/syn/ident.rs
index 6292a05f59f7..9ae2f0cbd83e 100644
--- a/rust/syn/ident.rs
+++ b/rust/syn/ident.rs
@@ -91,11 +91,11 @@ fn from(token: Token![_]) -> Ident {
 pub fn xid_ok(symbol: &str) -> bool {
     let mut chars = symbol.chars();
     let first = chars.next().unwrap();
-    if !(first == '_' || unicode_ident::is_xid_start(first)) {
+    if !(first == '_' || first.is_ascii_alphabetic()) {
         return false;
     }
     for ch in chars {
-        if !unicode_ident::is_xid_continue(ch) {
+        if !(ch == '_' || ch.is_ascii_alphanumeric()) {
             return false;
         }
     }
-- 
2.40.1

