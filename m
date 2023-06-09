Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC29C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjFIG4R (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237480AbjFIG4H (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:07 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81483C0C
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7459; q=dns/txt; s=iport;
  t=1686293737; x=1687503337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1UGQ8B6/pd3ySaU1MYqgODGbroqwUHd4SOGHVS/6sss=;
  b=mvrWBAMevBj5WMPje11HviomPJpQWoyJi4at7JL5i7uhAea37wz16ht+
   CrIQBv/y5XkTkiecoVQwKozvBorZG/RzDNtq99psQvLdia8GuVejCpVDa
   nZvRppQsATJGMoFprwESlp3uevpiWs/CjSbAIKq3CqgQ/1M44GJ7/SF8i
   c=;
X-IPAS-Result: =?us-ascii?q?A0ARAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IU?=
 =?us-ascii?q?gOBE5xYgX4PAQEBDQEBMRMEAQGFBgKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAycLAUYQIDFXGYJ+AYJcA?=
 =?us-ascii?q?60ZgXkzgQGEdZprgWiBQowWhUpCgUlEgRWBPIE3doJLiDsEji+PKIEpb4EeO?=
 =?us-ascii?q?Wl/AgkCEWeBCghcgXNAAg1UCwtjgR2CVQICETwPBVIIWhkdAwcEAoEFEC8HB?=
 =?us-ascii?q?DIoBgkYLycGUwcXFiQJExVCBINZCoEQQBUOEYJcKgI9bwMJAwcFSUADCxgNS?=
 =?us-ascii?q?BEsNRQfBkOBBxdjgXwkJJ5GgwYHAXoUggsEIaRPoCqEEot8lQQaM4VXo34ul?=
 =?us-ascii?q?2iWRYweeoQvAgQGBQIWgWM6gVszGggbFYMiCUkZD445iXCJZ0ExOwIHCwEBA?=
 =?us-ascii?q?wmLRgEB?=
IronPort-Data: A9a23:i90ptKB2c4xgjRVW/wzjw5YqxClBgxIJ4kV8jS/XYbTApD9332dTm
 GUeD26Cbv6CNGr1eNF0a4jl9k4Pv8eGz9Q3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4WGdoZtJpPljk/FGqD7qnVh3r2/SLP5CerVUgh8XgYMpB0J0XqPoMZnxNYw6TSFK1nV4
 4iq/ZWPYATNNwNcawr41YrS8HuDg9yq0N8olgRWTexGulbYi04UAPo3TU1mByKlKmX8NrfSq
 9frlNlVzEuAl/seIo/NfoLAT6E/auW60T5iJZZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HC9YV9BA0HCpAgSewd1NzEnDbZhxL2ZHnOTuPKo7F/rIkK5lp2CDGluVWEZ0u96GyRF8
 uYVbW1LZRGYjOXwy7W+IgVurp18d4+wbMVF4ioml2ux4fUOGfgvR43D4N5TwTM5nehFHO3VY
 IwSbj8HgBHoPE0SZQ1OV/rSms+Xilr2LARbsG6XqKg8xTPXizBx/OnyZY+9ltuiHJUJwRnwS
 nj912P7Dx0THN+S0zyI9jSrnOCntTnmQ55XGrqis/prhkCD7nIcBQdQVlahp/S9zEmkVLpix
 1c88yc06Kkq81a3C9/0Q1uzoWWPuVgXXN84//AGBB+l1Ifw81+pHU84TGB+Y/AvivQVVxF77
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVPugwdZHWPpBPG+/OkOYgLzosVLTfTu0Iylcd3k6
 23Q9XJv71kGpZRTv5hX62wrlBqKgvAlpCYc4gDaRG/t1R9waOZJjKTxsgGGhRqsBKidQ0eGu
 HECl6CjAAEy4XOlyXblrAYlRe/BCxO53Nv02gcH834JrW7FxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzhVZ52nPC7RYm0DJg4i+aihLAvL2drGwkzNSatM5zFyyDAbIlmY
 87AKJbwZZrkIf0+nGHeqxghPU8Dn3Bimjy7qWHTxBW82r3Wf2+OVboAKzOzghMRssu5TPHu2
 48HbaOikkwHOMWnO3m/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeLmup8I9E7xvsK/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:l6TYeaPqbfvDTsBcTu6jsMiBIKoaSvp037Dk7SxMoHtuA6ilfq
 +V8sjzuSWftN9VYgBCpTniAtjkfZqjz/9ICOAqVN/IYOClghrLEGgI1+TfKlPbdhHWx6p0yb
 pgf69iCNf5EFR2yfrh7BLQKadG/DD+ysCVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:4bZ7E2DHJdPtblD6EzdK0F5NKtsCTn+D83z8KnGDKnREGYTAHA==
X-Talos-MUID: 9a23:cpu88gpDJRrG7w8Cpzwezw5uF8432qe2NEIAk54g4M3DCSxcaijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857217"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:48 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDR055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:46 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 33/80] rust: serde_derive: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:31 +0300
Message-Id: <20230609063118.24852-34-amiculas@cisco.com>
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

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/serde_derive/bound.rs              | 2 ++
 rust/serde_derive/de.rs                 | 2 ++
 rust/serde_derive/dummy.rs              | 2 ++
 rust/serde_derive/fragment.rs           | 2 ++
 rust/serde_derive/internals/ast.rs      | 2 ++
 rust/serde_derive/internals/attr.rs     | 2 ++
 rust/serde_derive/internals/case.rs     | 2 ++
 rust/serde_derive/internals/check.rs    | 2 ++
 rust/serde_derive/internals/ctxt.rs     | 2 ++
 rust/serde_derive/internals/mod.rs      | 2 ++
 rust/serde_derive/internals/receiver.rs | 2 ++
 rust/serde_derive/internals/respan.rs   | 2 ++
 rust/serde_derive/internals/symbol.rs   | 2 ++
 rust/serde_derive/lib.rs                | 2 ++
 rust/serde_derive/pretend.rs            | 2 ++
 rust/serde_derive/ser.rs                | 2 ++
 rust/serde_derive/this.rs               | 2 ++
 rust/serde_derive/try.rs                | 2 ++
 18 files changed, 36 insertions(+)

diff --git a/rust/serde_derive/bound.rs b/rust/serde_derive/bound.rs
index 74c95069c353..dc6b5907ff80 100644
--- a/rust/serde_derive/bound.rs
+++ b/rust/serde_derive/bound.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::collections::HashSet;
 
 use syn;
diff --git a/rust/serde_derive/de.rs b/rust/serde_derive/de.rs
index 884c6335c7ae..06780ac192e8 100644
--- a/rust/serde_derive/de.rs
+++ b/rust/serde_derive/de.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Literal, Span, TokenStream};
 use quote::ToTokens;
 use syn::punctuated::Punctuated;
diff --git a/rust/serde_derive/dummy.rs b/rust/serde_derive/dummy.rs
index 2be502713293..3530303f23f2 100644
--- a/rust/serde_derive/dummy.rs
+++ b/rust/serde_derive/dummy.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Ident, TokenStream};
 use quote::format_ident;
 
diff --git a/rust/serde_derive/fragment.rs b/rust/serde_derive/fragment.rs
index 324504aa4661..a62ed9114224 100644
--- a/rust/serde_derive/fragment.rs
+++ b/rust/serde_derive/fragment.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::TokenStream;
 use quote::ToTokens;
 use syn::token;
diff --git a/rust/serde_derive/internals/ast.rs b/rust/serde_derive/internals/ast.rs
index 2a6950b2a710..139540571820 100644
--- a/rust/serde_derive/internals/ast.rs
+++ b/rust/serde_derive/internals/ast.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A Serde ast, parsed from the Syn ast and ready to generate Rust code.
 
 use internals::attr;
diff --git a/rust/serde_derive/internals/attr.rs b/rust/serde_derive/internals/attr.rs
index 5ff190f02e77..d013215a5e91 100644
--- a/rust/serde_derive/internals/attr.rs
+++ b/rust/serde_derive/internals/attr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use internals::symbol::*;
 use internals::{ungroup, Ctxt};
 use proc_macro2::{Spacing, Span, TokenStream, TokenTree};
diff --git a/rust/serde_derive/internals/case.rs b/rust/serde_derive/internals/case.rs
index 554505160ea4..6a75c7460e67 100644
--- a/rust/serde_derive/internals/case.rs
+++ b/rust/serde_derive/internals/case.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Code to convert the Rust-styled field/variant (e.g. `my_field`, `MyType`) to the
 //! case of the source (e.g. `my-field`, `MY_FIELD`).
 
diff --git a/rust/serde_derive/internals/check.rs b/rust/serde_derive/internals/check.rs
index eb1297aa73bf..188499508684 100644
--- a/rust/serde_derive/internals/check.rs
+++ b/rust/serde_derive/internals/check.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use internals::ast::{Container, Data, Field, Style};
 use internals::attr::{Identifier, TagType};
 use internals::{ungroup, Ctxt, Derive};
diff --git a/rust/serde_derive/internals/ctxt.rs b/rust/serde_derive/internals/ctxt.rs
index d692c2a449d3..7a0a9f92f992 100644
--- a/rust/serde_derive/internals/ctxt.rs
+++ b/rust/serde_derive/internals/ctxt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use quote::ToTokens;
 use std::cell::RefCell;
 use std::fmt::Display;
diff --git a/rust/serde_derive/internals/mod.rs b/rust/serde_derive/internals/mod.rs
index 5e9f416c46f2..9de56241adf3 100644
--- a/rust/serde_derive/internals/mod.rs
+++ b/rust/serde_derive/internals/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 pub mod ast;
 pub mod attr;
 
diff --git a/rust/serde_derive/internals/receiver.rs b/rust/serde_derive/internals/receiver.rs
index b08c67096844..fc5bc1b89db2 100644
--- a/rust/serde_derive/internals/receiver.rs
+++ b/rust/serde_derive/internals/receiver.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use internals::respan::respan;
 use proc_macro2::Span;
 use quote::ToTokens;
diff --git a/rust/serde_derive/internals/respan.rs b/rust/serde_derive/internals/respan.rs
index dcec7017b315..41aca1250c21 100644
--- a/rust/serde_derive/internals/respan.rs
+++ b/rust/serde_derive/internals/respan.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Group, Span, TokenStream, TokenTree};
 
 pub(crate) fn respan(stream: TokenStream, span: Span) -> TokenStream {
diff --git a/rust/serde_derive/internals/symbol.rs b/rust/serde_derive/internals/symbol.rs
index 9606edb5f236..fb7cda06056f 100644
--- a/rust/serde_derive/internals/symbol.rs
+++ b/rust/serde_derive/internals/symbol.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::fmt::{self, Display};
 use syn::{Ident, Path};
 
diff --git a/rust/serde_derive/lib.rs b/rust/serde_derive/lib.rs
index d3d136cb092c..de83885b9a4c 100644
--- a/rust/serde_derive/lib.rs
+++ b/rust/serde_derive/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! This crate provides Serde's two derive macros.
 //!
 //! ```edition2018
diff --git a/rust/serde_derive/pretend.rs b/rust/serde_derive/pretend.rs
index d7b953d6384f..522fc8c2f2d9 100644
--- a/rust/serde_derive/pretend.rs
+++ b/rust/serde_derive/pretend.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::TokenStream;
 use quote::format_ident;
 
diff --git a/rust/serde_derive/ser.rs b/rust/serde_derive/ser.rs
index 43695dd0c39a..00a667cea7fa 100644
--- a/rust/serde_derive/ser.rs
+++ b/rust/serde_derive/ser.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use syn::spanned::Spanned;
 use syn::{self, Ident, Index, Member};
diff --git a/rust/serde_derive/this.rs b/rust/serde_derive/this.rs
index 32731d08969d..7a27a7c7dbc2 100644
--- a/rust/serde_derive/this.rs
+++ b/rust/serde_derive/this.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use internals::ast::Container;
 use syn::{Path, PathArguments, Token};
 
diff --git a/rust/serde_derive/try.rs b/rust/serde_derive/try.rs
index 48cceebaafe1..afed0fedb938 100644
--- a/rust/serde_derive/try.rs
+++ b/rust/serde_derive/try.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Punct, Spacing, TokenStream};
 
 // None of our generated code requires the `From::from` error conversion
-- 
2.40.1

