Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9937DC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238431AbjFIG4x (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbjFIG4c (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:32 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3053B3588
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1110; q=dns/txt; s=iport;
  t=1686293786; x=1687503386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWRqeE2lEMEu4/jVLAIrn3OWYjqMbsUMzSIgDQ0A+54=;
  b=RfYYl3jYRo6Xe09hWKHt88MTv71ooKMIcEOwpmnK4iBEI4jvyxISnW4V
   CuA6bQkF1I7Du3G+5FLO+x6kRlUId+Fg9YgZc+J7nTcxrJhJmL7rMtQjk
   CtRjLHgtI19HMP5NYo7rbyGAOgB6rXqfSxogLsRgyhv8Q5qw7qKy8e5+l
   w=;
X-IPAS-Result: =?us-ascii?q?A0AQAQAixoJklxbLJq1agliDJFUuEkeNTYhVnWuBfg8BA?=
 =?us-ascii?q?QENAQExEwQBAYUGAoV1JjQJDgECBAEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHB?=
 =?us-ascii?q?BQBAQEBAQEBATcFEDWFaA2GBQMDJwsBRhAgMVcZgn4BglwDrRmBeTOBAYR1m?=
 =?us-ascii?q?muBaIFCjBaFSkKBSUSEfoURhXUEji+PKIEpb4EeOWl/AgkCEWeBCghcgXNAA?=
 =?us-ascii?q?g1UCwtjgR2CVQICETwUUmIZHQMHBAKBBRAvBwQyKAYJGC8nBlMHFxYkCRMVQ?=
 =?us-ascii?q?gSDWQqBEEAVDhGCXCoCBzZvAwkDBwVJQAMLGA1IESw1FB8GQ4EHF2OBfCQkn?=
 =?us-ascii?q?kaDDQGBDYIppFegKoQSi3yVBBozhVejfi6XaKNdhC8CBAYFAhaBYzqBWzMaC?=
 =?us-ascii?q?BsVgyIJSRkPjjmJcIlnQTE7AgcLAQEDCYhuLYIrAQE?=
IronPort-Data: A9a23:mpw+ka6kdC1y8n7ArHs3iQxRtEPHchMFZxGqfqrLsTDasY5as4F+v
 mpOWmyEOPqCYDCgL40iPI+xpxgD6sPWzoUxHgNorn89Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyOa/lH3WlTYhSEUOZugHtIQM8aafHgpLeNYYH1500k7xbZp2tUAbeWRWmthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9UPrzEZqMw07QGeG4KAIVq
 9Hrl9lV9kuBl/sk50jMfrzTKiXmSZaKVeSCZ+Y/t6WK2nB/SiIOPqkTMOISVlpoggm1nv971
 +sUkoLzYyQ7F/iZ8Agde0Ew/yBWNKBcvbTAO3X67IqYzlbNdD3nxPAG4EMeZNJDvL0nRzsWr
 rpCcljhbTjb7w6y6Lu+S+Jxgs04BMLqJ4gY/HpnyFk1CN57G8+SG/SXjTNe9C1g3JpDQ6nbX
 OkQTRtlRwbrQEBDOW5CXfrSm8/x1iWgLFW0smm9oqg672H7zwFr1rXpdt3PdbSiX9hOggOWo
 XiD+2X/HwEyKtOS03yG/2iqi+uJmjn0ML/+D5Wx++QvgUWU3HBWDhQKE1C6uvK+zEW5XrqzN
 nD45AIqtaYN6XOicuX8cBenniejoF02eMh5RrhSBB629oLY5AOQB24hRzFHacA7uMJeedDM/
 gLZ9z8OLWEz2IB5WU5x5Z/J92jsaHh9wXsqOHVdF1ptD8zL+tlbs/7Zcjp0OIiR5jEfMRj0x
 j2QoWAFm7wf5SLg//zgpA2vb96EiJzEUAkx7wPbNl9JDz+Vhqb4PeRECnCCs56sybp1qHHa5
 RDofODEtogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmEgfhs4ap1UJG6zC
 KM2he+3zMEIVJdNRfInC79d9+xxpUQdPY2/D6uNPoYmjmZZLVbXp0mCmnJ8L0i0wBRzzsnTy
 L+QcN2nCj4BGL97wT+tL9rxIpd1rh3SMVj7HMihpzz+iOL2TCfMGd843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnOMqNNLcA5TcidT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:mzm2vqHmBbjZGOedpLqEx8eALOsnbusQ8zAXPo5KJSC9Ffbo8/
 xG88506faZslwssTQb6LO90cq7MBbhHOBOgLX5VI3KNGLbUSmTXeNfBODZrAEIdReSysdtkY
 99bqlzD8DxB1Bmgcu/3BO1CL8bsb66GdiT5ds3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ASVhRP2rRTJEArVM3fbkwBc7mUcQ9fELA837sH06?=
 =?us-ascii?q?XA3lXEZqLCnWz6ooxxg=3D=3D?=
X-Talos-MUID: 9a23:Ja1CRwqRnjNpyEAU/dgezysybp1lvfurM2MEtbQMkNuvFnF8OA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279095"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:43 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDH055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:42 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 23/80] rust: proc-macro2: remove `unicode_ident` dependency
Date:   Fri,  9 Jun 2023 09:30:21 +0300
Message-Id: <20230609063118.24852-24-amiculas@cisco.com>
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

The `proc-macro2` crate depends on the `unicode-ident` crate
to determine whether characters have the XID_Start or XID_Continue
properties according to Unicode Standard Annex #31.

However, we only need ASCII identifiers in the kernel, thus we can
simplify the check and remove completely that dependency.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/proc-macro2/fallback.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/proc-macro2/fallback.rs b/rust/proc-macro2/fallback.rs
index f795c7618118..0d576c32162d 100644
--- a/rust/proc-macro2/fallback.rs
+++ b/rust/proc-macro2/fallback.rs
@@ -724,11 +724,11 @@ pub fn set_span(&mut self, span: Span) {
 }
 
 pub(crate) fn is_ident_start(c: char) -> bool {
-    c == '_' || unicode_ident::is_xid_start(c)
+    c == '_' || c.is_ascii_alphabetic()
 }
 
 pub(crate) fn is_ident_continue(c: char) -> bool {
-    unicode_ident::is_xid_continue(c)
+    c == '_' || c.is_ascii_alphanumeric()
 }
 
 fn validate_ident(string: &str, raw: bool) {
-- 
2.40.1

