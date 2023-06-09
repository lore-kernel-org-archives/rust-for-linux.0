Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD63C7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjFIGy3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237687AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6640926B1
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=18399; q=dns/txt;
  s=iport; t=1686293651; x=1687503251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4FZjIVxNnX3BZuNlkH1rmHpI+WKKnvS93eu4QDmp6pQ=;
  b=FDLHw0tUzZMPvNemRQVJMNmEA6pjlDRLtFL+K/8KucSjB48e0CumxS+c
   4UPfuLi6+Cth2iuYFIsiMZaFXkMNb55VsO+/K7IUtJgwAZ4sTzUQWNpbR
   +ZDJACHHnZRifbFmCuUe10+5Qg5chdXMn6TILGJau6zXnkj6d3RfQMz9B
   A=;
X-IPAS-Result: =?us-ascii?q?A0ARAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IU?=
 =?us-ascii?q?gOBE5xYgX4PAQEBDQEBOwkEAQGFBgKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAycLAUYQIDFXGYJ+AYJcA?=
 =?us-ascii?q?xGtCIF5M4EBg2oYc5prgWiBQowWgSKEKEKBSUSBFYE8gTd2gksXAgIBF4gIB?=
 =?us-ascii?q?I4vjyiBKW+BHjlpfwIJAhFngQoIXIFzQAINVAsLY4EdglUCAhE8DwVSCFoZH?=
 =?us-ascii?q?QMHBAKBBRAvBwQyKAYJGC8nBlMHFxYkCRMVQgSDWQqBEEAVDhGCXCoCPW8DC?=
 =?us-ascii?q?QMHBUlAAwsYDUgRLDUUHwZDgQcXY4F8JCSeRgODChYbMBoTASuBWgakdJ5zg?=
 =?us-ascii?q?TeEEot8lQQaM4VXo36YFoR+hgWCV4hrjDMVUIQvAgQGBQIWgWM6gVszGggbF?=
 =?us-ascii?q?YMiCUkZD44rDgmDUoJkgzGJZ0ExOwIHCwEBAwmLRgEB?=
IronPort-Data: A9a23:I3JJoqyQVazmVHImLDt6t+dMxirEfRIJ4+MujC+fZmUNrF6WrkUHz
 DccXziOOPiDYDH1c9h+O46+pkxT6JCGz941Gwo5/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJloCCea/H9BC5C5xZVG/fngqoHUVqicYkideSc+EH160Uw7y7Zi6mJVqYHR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyV94KYkGE2EByCQrr+4sQKNb
 72rILmRpgs19vq2Yz+vuu6TnkYiGtY+MeUS45Zbc/DKv/RMmsA9+okWJfc9dXwIsgmurc92m
 NhO9rGoFj58a8UgmMxFO/VZOyhzJ+hN/6XKZCX5us2IxEqAeHzpqxlsJBhpZstDqqAtWToIr
 6ZwxDMlNnhvg8q/xbOwV+1lnewoLdLgO8UUvXQIITTxXat+EcGZE80m4/dRzAg1gd1+DMzSd
 tg0Tj5MMQ7MbTdQbwJ/5JUWxbf02SaXnydjgFWXqKY+y2ve1gp81P7qKtW9UsaXXtkQkEGC4
 2bH+XnpKg8VOcbZyjef9H+owOjVkkvGtJk6HbCis/9yh0ePg2oaFFsdVECwpr+yjUvWt89jx
 1I81Qc/oIkuzxOScv7PQBrorX3HkwZDYo8FewEl0z2lxq3R6gefI2ELSD9dddAr3PPaoxR3h
 jdlePu0WVRSXK2ppWG1q+3P82LiUcQBBTJYPHVVJecQy4O7yLzfmC4jWf5FNMZZZPXcHTT92
 T3ClzQ3i93/ZuZSjPzmlbwrqxyoq4bOSgcz6m3qsoOZAuFROdTNi2+AsAazARN8wGCxFQDpU
 J8swZL20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4AvmsidR8yYptVI1cFh
 XM/XysPv/e/21P3PcdKj36ZUKzGMIC5T42+D6CIBjawSsEoJFTvEN5Sib64hjCxzxdEfVAXM
 paAesHkFmcBFali11KLqxQ1j9cWKtQF7TqLH/jTlk3/uZLHPS79dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkOXCKqdNNdA9VRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:lJC8NajVAwDagMmvUGQ6VhaXBHBQXvUji2hC6mlwRA09TyVXra
 yTdZMgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7dZmjbUQKTRekI0WKh+UyDJ8SUzIFgPM
 lbHpRWOZnZEUV6gcHm4AOxDtoshOWc/LvAv5a4854Ud2FXg2UK1XYBNu5deXcGIjV7OQ==
X-Talos-CUID: 9a23:EI1KH2EsItYV0K5hqmJI2V8ZO9weLUTh60XPJB+1CiVEUOKsHAo=
X-Talos-MUID: 9a23:qsHIRwa/fLyUteBTvi/TgTZ/BNZS77W8JWcJssgct8euKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508928"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:45 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDL055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:44 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 27/80] rust: syn: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:25 +0300
Message-Id: <20230609063118.24852-28-amiculas@cisco.com>
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
 rust/syn/attr.rs               | 2 ++
 rust/syn/await.rs              | 2 ++
 rust/syn/bigint.rs             | 2 ++
 rust/syn/buffer.rs             | 2 ++
 rust/syn/custom_keyword.rs     | 2 ++
 rust/syn/custom_punctuation.rs | 2 ++
 rust/syn/data.rs               | 2 ++
 rust/syn/derive.rs             | 2 ++
 rust/syn/discouraged.rs        | 2 ++
 rust/syn/error.rs              | 2 ++
 rust/syn/export.rs             | 2 ++
 rust/syn/expr.rs               | 2 ++
 rust/syn/ext.rs                | 2 ++
 rust/syn/file.rs               | 2 ++
 rust/syn/gen/clone.rs          | 2 ++
 rust/syn/gen/debug.rs          | 2 ++
 rust/syn/gen/eq.rs             | 2 ++
 rust/syn/gen/fold.rs           | 2 ++
 rust/syn/gen/hash.rs           | 2 ++
 rust/syn/gen/visit.rs          | 2 ++
 rust/syn/gen/visit_mut.rs      | 2 ++
 rust/syn/gen_helper.rs         | 2 ++
 rust/syn/generics.rs           | 2 ++
 rust/syn/group.rs              | 2 ++
 rust/syn/ident.rs              | 2 ++
 rust/syn/item.rs               | 2 ++
 rust/syn/lib.rs                | 2 ++
 rust/syn/lifetime.rs           | 2 ++
 rust/syn/lit.rs                | 2 ++
 rust/syn/lookahead.rs          | 2 ++
 rust/syn/mac.rs                | 2 ++
 rust/syn/macros.rs             | 2 ++
 rust/syn/op.rs                 | 2 ++
 rust/syn/parse.rs              | 2 ++
 rust/syn/parse_macro_input.rs  | 2 ++
 rust/syn/parse_quote.rs        | 2 ++
 rust/syn/pat.rs                | 2 ++
 rust/syn/path.rs               | 2 ++
 rust/syn/print.rs              | 2 ++
 rust/syn/punctuated.rs         | 2 ++
 rust/syn/reserved.rs           | 2 ++
 rust/syn/sealed.rs             | 2 ++
 rust/syn/span.rs               | 2 ++
 rust/syn/spanned.rs            | 2 ++
 rust/syn/stmt.rs               | 2 ++
 rust/syn/thread.rs             | 2 ++
 rust/syn/token.rs              | 2 ++
 rust/syn/tt.rs                 | 2 ++
 rust/syn/ty.rs                 | 2 ++
 rust/syn/verbatim.rs           | 2 ++
 rust/syn/whitespace.rs         | 2 ++
 51 files changed, 102 insertions(+)

diff --git a/rust/syn/attr.rs b/rust/syn/attr.rs
index bace94f43c85..cbcd158f45f6 100644
--- a/rust/syn/attr.rs
+++ b/rust/syn/attr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 use proc_macro2::TokenStream;
diff --git a/rust/syn/await.rs b/rust/syn/await.rs
index 038c6a5d12cd..1aae244cafd3 100644
--- a/rust/syn/await.rs
+++ b/rust/syn/await.rs
@@ -1,2 +1,4 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // See include!("await.rs") in token.rs.
 export_token_macro! {[await]}
diff --git a/rust/syn/bigint.rs b/rust/syn/bigint.rs
index 5397d6beee1d..d8f7b8ca6863 100644
--- a/rust/syn/bigint.rs
+++ b/rust/syn/bigint.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::ops::{AddAssign, MulAssign};
 
 // For implementing base10_digits() accessor on LitInt.
diff --git a/rust/syn/buffer.rs b/rust/syn/buffer.rs
index 0d5cf30d5794..9a600f527f7a 100644
--- a/rust/syn/buffer.rs
+++ b/rust/syn/buffer.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A stably addressed token buffer supporting efficient traversal based on a
 //! cheaply copyable cursor.
 //!
diff --git a/rust/syn/custom_keyword.rs b/rust/syn/custom_keyword.rs
index a3ec9d4cb701..916f4c1bb820 100644
--- a/rust/syn/custom_keyword.rs
+++ b/rust/syn/custom_keyword.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Define a type that supports parsing and printing a given identifier as if it
 /// were a keyword.
 ///
diff --git a/rust/syn/custom_punctuation.rs b/rust/syn/custom_punctuation.rs
index 118a8453daab..5cb8281623f8 100644
--- a/rust/syn/custom_punctuation.rs
+++ b/rust/syn/custom_punctuation.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Define a type that supports parsing and printing a multi-character symbol
 /// as if it were a punctuation token.
 ///
diff --git a/rust/syn/data.rs b/rust/syn/data.rs
index 3b466618f8ab..e4002648c635 100644
--- a/rust/syn/data.rs
+++ b/rust/syn/data.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 
diff --git a/rust/syn/derive.rs b/rust/syn/derive.rs
index af9bb91b7a8d..455e72938067 100644
--- a/rust/syn/derive.rs
+++ b/rust/syn/derive.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 
diff --git a/rust/syn/discouraged.rs b/rust/syn/discouraged.rs
index a46129b6a159..9843c82d54d2 100644
--- a/rust/syn/discouraged.rs
+++ b/rust/syn/discouraged.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Extensions to the parsing API with niche applicability.
 
 use super::*;
diff --git a/rust/syn/error.rs b/rust/syn/error.rs
index e301367d5e4e..262f3ab8cab7 100644
--- a/rust/syn/error.rs
+++ b/rust/syn/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::buffer::Cursor;
 use crate::thread::ThreadBound;
diff --git a/rust/syn/export.rs b/rust/syn/export.rs
index f478d091ea12..5ea4dd75eb4a 100644
--- a/rust/syn/export.rs
+++ b/rust/syn/export.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 pub use std::clone::Clone;
 pub use std::cmp::{Eq, PartialEq};
 pub use std::default::Default;
diff --git a/rust/syn/expr.rs b/rust/syn/expr.rs
index 93a59b0e20d7..54155892fe04 100644
--- a/rust/syn/expr.rs
+++ b/rust/syn/expr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 #[cfg(feature = "full")]
diff --git a/rust/syn/ext.rs b/rust/syn/ext.rs
index 98d5550f4836..c30a89902f7f 100644
--- a/rust/syn/ext.rs
+++ b/rust/syn/ext.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Extension traits to provide parsing methods on foreign types.
 //!
 //! *This module is available only if Syn is built with the `"parsing"` feature.*
diff --git a/rust/syn/file.rs b/rust/syn/file.rs
index 280484f980d1..39796e1e3862 100644
--- a/rust/syn/file.rs
+++ b/rust/syn/file.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 
 ast_struct! {
diff --git a/rust/syn/gen/clone.rs b/rust/syn/gen/clone.rs
index a413e3ec700c..82a3f51d8c52 100644
--- a/rust/syn/gen/clone.rs
+++ b/rust/syn/gen/clone.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/debug.rs b/rust/syn/gen/debug.rs
index a1f0afa790c0..488433cd8f01 100644
--- a/rust/syn/gen/debug.rs
+++ b/rust/syn/gen/debug.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/eq.rs b/rust/syn/gen/eq.rs
index 20acb809d858..4af1c9c6a3d1 100644
--- a/rust/syn/gen/eq.rs
+++ b/rust/syn/gen/eq.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/fold.rs b/rust/syn/gen/fold.rs
index 98bb5794aab9..d503f617d631 100644
--- a/rust/syn/gen/fold.rs
+++ b/rust/syn/gen/fold.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/hash.rs b/rust/syn/gen/hash.rs
index d0400e19d6d8..8fbc237079ef 100644
--- a/rust/syn/gen/hash.rs
+++ b/rust/syn/gen/hash.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/visit.rs b/rust/syn/gen/visit.rs
index 19ddd2e72602..0285e4dbee23 100644
--- a/rust/syn/gen/visit.rs
+++ b/rust/syn/gen/visit.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/visit_mut.rs b/rust/syn/gen/visit_mut.rs
index 239709d19410..4a46346c1807 100644
--- a/rust/syn/gen/visit_mut.rs
+++ b/rust/syn/gen/visit_mut.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen_helper.rs b/rust/syn/gen_helper.rs
index b2796126a339..3850100b247f 100644
--- a/rust/syn/gen_helper.rs
+++ b/rust/syn/gen_helper.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "fold")]
 pub mod fold {
     use crate::fold::Fold;
diff --git a/rust/syn/generics.rs b/rust/syn/generics.rs
index 9c2802f87b8e..de8a4b2ce1d5 100644
--- a/rust/syn/generics.rs
+++ b/rust/syn/generics.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::{Iter, IterMut, Punctuated};
 #[cfg(all(feature = "printing", feature = "extra-traits"))]
diff --git a/rust/syn/group.rs b/rust/syn/group.rs
index 7fd273c1de00..b02e79db2c20 100644
--- a/rust/syn/group.rs
+++ b/rust/syn/group.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::error::Result;
 use crate::parse::ParseBuffer;
 use crate::token;
diff --git a/rust/syn/ident.rs b/rust/syn/ident.rs
index 8e3d8bda9746..6292a05f59f7 100644
--- a/rust/syn/ident.rs
+++ b/rust/syn/ident.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::buffer::Cursor;
 #[cfg(feature = "parsing")]
diff --git a/rust/syn/item.rs b/rust/syn/item.rs
index a1ef7ab43eff..b256d94a25e2 100644
--- a/rust/syn/item.rs
+++ b/rust/syn/item.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::derive::{Data, DataEnum, DataStruct, DataUnion, DeriveInput};
 use crate::punctuated::Punctuated;
diff --git a/rust/syn/lib.rs b/rust/syn/lib.rs
index 7d4df7110c6b..c32d6b3cb8cb 100644
--- a/rust/syn/lib.rs
+++ b/rust/syn/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/syn)&ensp;[![crates-io]](https://crates.io/crates/syn)&ensp;[![docs-rs]](crate)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/syn/lifetime.rs b/rust/syn/lifetime.rs
index 5dc1753a84fa..23b644e8ea72 100644
--- a/rust/syn/lifetime.rs
+++ b/rust/syn/lifetime.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Ident, Span};
 use std::cmp::Ordering;
 use std::fmt::{self, Display};
diff --git a/rust/syn/lit.rs b/rust/syn/lit.rs
index 130b40ed1fb7..51229eb165f1 100644
--- a/rust/syn/lit.rs
+++ b/rust/syn/lit.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::lookahead;
 #[cfg(feature = "parsing")]
diff --git a/rust/syn/lookahead.rs b/rust/syn/lookahead.rs
index 0cf5cf5a83be..118fdbbe11ff 100644
--- a/rust/syn/lookahead.rs
+++ b/rust/syn/lookahead.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::buffer::Cursor;
 use crate::error::{self, Error};
 use crate::sealed::lookahead::Sealed;
diff --git a/rust/syn/mac.rs b/rust/syn/mac.rs
index 3d84f8e48bf1..99dd6accd95d 100644
--- a/rust/syn/mac.rs
+++ b/rust/syn/mac.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::token::{Brace, Bracket, Paren};
 use proc_macro2::TokenStream;
diff --git a/rust/syn/macros.rs b/rust/syn/macros.rs
index da10a1a55057..86e64dc38992 100644
--- a/rust/syn/macros.rs
+++ b/rust/syn/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg_attr(
     not(any(feature = "full", feature = "derive")),
     allow(unknown_lints, unused_macro_rules)
diff --git a/rust/syn/op.rs b/rust/syn/op.rs
index b8ef9a7fbd08..96ccd7d3e1f3 100644
--- a/rust/syn/op.rs
+++ b/rust/syn/op.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 ast_enum! {
     /// A binary operator: `+`, `+=`, `&`.
     ///
diff --git a/rust/syn/parse.rs b/rust/syn/parse.rs
index bac4ca05abf9..aa07edc885dc 100644
--- a/rust/syn/parse.rs
+++ b/rust/syn/parse.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Parsing interface for parsing a token stream into a syntax tree node.
 //!
 //! Parsing in Syn is built on parser functions that take in a [`ParseStream`]
diff --git a/rust/syn/parse_macro_input.rs b/rust/syn/parse_macro_input.rs
index 6163cd70af7b..8c68fdda2f71 100644
--- a/rust/syn/parse_macro_input.rs
+++ b/rust/syn/parse_macro_input.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Parse the input TokenStream of a macro, triggering a compile error if the
 /// tokens fail to parse.
 ///
diff --git a/rust/syn/parse_quote.rs b/rust/syn/parse_quote.rs
index 8deae4e52652..4eb592d099f6 100644
--- a/rust/syn/parse_quote.rs
+++ b/rust/syn/parse_quote.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Quasi-quotation macro that accepts input like the [`quote!`] macro but uses
 /// type inference to figure out a return type for those tokens.
 ///
diff --git a/rust/syn/pat.rs b/rust/syn/pat.rs
index b279186aa063..a2c2004e2b64 100644
--- a/rust/syn/pat.rs
+++ b/rust/syn/pat.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 use proc_macro2::TokenStream;
diff --git a/rust/syn/path.rs b/rust/syn/path.rs
index 6cdb43ac5416..b69c9ceb11d9 100644
--- a/rust/syn/path.rs
+++ b/rust/syn/path.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 
diff --git a/rust/syn/print.rs b/rust/syn/print.rs
index da4e07e3b3cb..abc287ee9501 100644
--- a/rust/syn/print.rs
+++ b/rust/syn/print.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::TokenStream;
 use quote::ToTokens;
 
diff --git a/rust/syn/punctuated.rs b/rust/syn/punctuated.rs
index 0fe1078cf404..b1ad84b301fa 100644
--- a/rust/syn/punctuated.rs
+++ b/rust/syn/punctuated.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A punctuated sequence of syntax tree nodes separated by punctuation.
 //!
 //! Lots of things in Rust are punctuated sequences.
diff --git a/rust/syn/reserved.rs b/rust/syn/reserved.rs
index abfdf43a91e0..f6bb508a6907 100644
--- a/rust/syn/reserved.rs
+++ b/rust/syn/reserved.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Type for a syntax tree node that is reserved for future use.
 //
 // For example ExprReference contains a field `raw` of type Reserved. If `&raw
diff --git a/rust/syn/sealed.rs b/rust/syn/sealed.rs
index 0b11bc99a1e1..02abcb1cd90d 100644
--- a/rust/syn/sealed.rs
+++ b/rust/syn/sealed.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 pub mod lookahead {
     pub trait Sealed: Copy {}
diff --git a/rust/syn/span.rs b/rust/syn/span.rs
index 27a7fe846d39..0574c49d7835 100644
--- a/rust/syn/span.rs
+++ b/rust/syn/span.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::Span;
 
 pub trait IntoSpans<S> {
diff --git a/rust/syn/spanned.rs b/rust/syn/spanned.rs
index d51ffb3fa5f5..ee65ea85841a 100644
--- a/rust/syn/spanned.rs
+++ b/rust/syn/spanned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A trait that can provide the `Span` of the complete contents of a syntax
 //! tree node.
 //!
diff --git a/rust/syn/stmt.rs b/rust/syn/stmt.rs
index 58bd013ecf4c..41b9378537ba 100644
--- a/rust/syn/stmt.rs
+++ b/rust/syn/stmt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 
 ast_struct! {
diff --git a/rust/syn/thread.rs b/rust/syn/thread.rs
index 9e5d8ad85efc..d535c913a9aa 100644
--- a/rust/syn/thread.rs
+++ b/rust/syn/thread.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::fmt::{self, Debug};
 use std::thread::{self, ThreadId};
 
diff --git a/rust/syn/token.rs b/rust/syn/token.rs
index 2208b07d0454..b9984c5782fb 100644
--- a/rust/syn/token.rs
+++ b/rust/syn/token.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Tokens representing Rust punctuation, keywords, and delimiters.
 //!
 //! The type names in this module can be difficult to keep straight, so we
diff --git a/rust/syn/tt.rs b/rust/syn/tt.rs
index d87c0ed4dc1c..b4a9a3876f7d 100644
--- a/rust/syn/tt.rs
+++ b/rust/syn/tt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Delimiter, TokenStream, TokenTree};
 use std::hash::{Hash, Hasher};
 
diff --git a/rust/syn/ty.rs b/rust/syn/ty.rs
index 4068be3c754b..ecdf93b952a5 100644
--- a/rust/syn/ty.rs
+++ b/rust/syn/ty.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::*;
 use crate::punctuated::Punctuated;
 use proc_macro2::TokenStream;
diff --git a/rust/syn/verbatim.rs b/rust/syn/verbatim.rs
index 58cf68d17af8..15e651164a02 100644
--- a/rust/syn/verbatim.rs
+++ b/rust/syn/verbatim.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::parse::{ParseBuffer, ParseStream};
 use proc_macro2::{Delimiter, TokenStream};
 use std::cmp::Ordering;
diff --git a/rust/syn/whitespace.rs b/rust/syn/whitespace.rs
index 7be082e1a26d..99c2d3ab28f9 100644
--- a/rust/syn/whitespace.rs
+++ b/rust/syn/whitespace.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 pub fn skip(mut s: &str) -> &str {
     'skip: while !s.is_empty() {
         let byte = s.as_bytes()[0];
-- 
2.40.1

