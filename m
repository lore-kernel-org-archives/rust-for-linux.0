Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93039C83005
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjFIGya (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238547AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5002826AD
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2773; q=dns/txt; s=iport;
  t=1686293654; x=1687503254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wwJJcPRodlCQ2Pr/6agUms2oiGevxE3ZImaNWEGh4hk=;
  b=hv1mJiYB+CkWzH8xVNfJbhhLYkOT/iYtQqLDwF6snMbnDov4ssyqI0SS
   XcPkaX0XydYGSA2HOGhPxd+Mb/cWwJ3UfyhDspqyJUT88a6ysyftYd05O
   Rv4uOny+HTFVbPLv5FHcENTBRIUxvyaGCAFfWId/1zrVeZyFwSo7g/lPs
   A=;
X-IPAS-Result: =?us-ascii?q?A0AQAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IV?=
 =?us-ascii?q?Z1rgX4PAQEBDQEBOwkEAQGFBgKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?QEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAzIBRhAgMVcZgn4BglwDEa0Ig?=
 =?us-ascii?q?iyBAYNnAxgmTZprgWiBQowWhUpCgUlEgRWBPIItgmICAgEXghOFdQSOL48og?=
 =?us-ascii?q?SlvgR45aX8CCQIRZ4EKCFyBc0ACDVQLC2OBHYJVAgIRPA8FUghaGR0DBwQCg?=
 =?us-ascii?q?QUQLwcEMigGCRgvJwZTBxcWJAkTFUIEg1kKgRBAFQ4RglwqAj1vAwkDBwVJQ?=
 =?us-ascii?q?AMLGA1IESw1FB8GQ4EHF2OBfCAEJJ5GAzCCWmEuK4FgpHSgKoQSi3yVBBozh?=
 =?us-ascii?q?Vejfo8IiQ6LA4JXlgOELwIEBgUCFoFjOoFbMxoIGxWDIgkWMxkPjjmDW4Jkg?=
 =?us-ascii?q?zGJZ0ExOwIHCwEBAwmLRgEB?=
IronPort-Data: A9a23:kKIkDKofx+ogaqNmEUirHKBFMjVeBmJjZRIvgKrLsJaIsI4StFCzt
 garIBmHP/qON2KnfNkjbI+39UhU7MTcxtJnS1A+/3tjEXgS9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILas1htZG0k8EE/NtTo5w7Ri2tAw0YDia++wk
 YqaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9AvY12O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/RPjnRa70o1CBYTQWFy1imPnoxj8
 4VEl7i/bzZqAqLuuOtIBnG0EwkmVUFH0LbKOz20ttaeihCAeHr3yPIoB0YzVWEa0r8oWicVp
 bpCcGtLNErra+GemNpXTsFlg8UoMc3iJ6sUu2prynfSCvNOrZXrHPWXuoEJjV/cgOhsQffhP
 uQgcwNufR/5PBFyO1EqE8gHybLAan7XKm0E9w39SbAMy2/RwQB4+LvgKtzYfpqNX8o9tlyFv
 X6D8WPjRxUbMsGP4SSK/2jqheLVmy7/HoUIG9WFGuVCiVCJg20LDwcKEF2yvb+yi1W1XJRUL
 El8FjcSQbYa0mn2Ut/8Aw+D8HemmhE6aplsHM8a51TYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mNlefu0VVSDV5XIFRqgGqeoQSCaZHJOcz5SDcMQZVZfuoOyyG0mpkiXJuuPBpJZmfXTPVkcK
 RijqC0znbhbttIC281XFnie2GvxznQlZiAx6xvQWmuj4mtEiG+Zi26AtAKzARVoddjxory9U
 J4swJH2AAcmV8vlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk5bJxYKGeyM
 BKC42u9AaO/2lP0NsebhKrsW6wXIVTITrwJq9iNNIMVO8gtHON51Hg3NRX4M5/RfLgEyPFjZ
 sjznTeEBncBAqMv1yutW+oYytcWKtMWmwvuqWTA503/i9K2PSfNIZ9caQvmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJdglXdSVlXM+pwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:I05KAKB+RcoYiI7lHemD55DYdb4zR+YMi2TDGXocdfUzSL39qy
 nAppomPHPP4gr5HUtQ+uxoW5PwJE80i6QV3WB5B97LNzUO+lHYTr2KhrGM/9SPIUDD398Y/b
 t8cqR4Fd37BUV3gILH+gWieuxQp+VviJrJuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:s7NyaWGMVt/hNxurqmJB0RMIHMF5YEaNxVX0LGmJSlpmap2aHAo=
X-Talos-MUID: 9a23:5ipR/gSfKdyApiaIRXTO2DBdbelR+Z2vGUs0zpk7us+5LnZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857699"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:43 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDJ055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:43 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 25/80] rust: quote: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:23 +0300
Message-Id: <20230609063118.24852-26-amiculas@cisco.com>
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
 rust/quote/ext.rs            | 2 ++
 rust/quote/format.rs         | 2 ++
 rust/quote/ident_fragment.rs | 2 ++
 rust/quote/lib.rs            | 2 ++
 rust/quote/runtime.rs        | 2 ++
 rust/quote/spanned.rs        | 2 ++
 rust/quote/to_tokens.rs      | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/rust/quote/ext.rs b/rust/quote/ext.rs
index 92c2315b182d..977d2f0c5919 100644
--- a/rust/quote/ext.rs
+++ b/rust/quote/ext.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::ToTokens;
 use core::iter;
 use proc_macro2::{TokenStream, TokenTree};
diff --git a/rust/quote/format.rs b/rust/quote/format.rs
index 3cddbd2819d6..9fbf9c5949a9 100644
--- a/rust/quote/format.rs
+++ b/rust/quote/format.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Formatting macro for constructing `Ident`s.
 ///
 /// <br>
diff --git a/rust/quote/ident_fragment.rs b/rust/quote/ident_fragment.rs
index cf74024b4825..e4a8d6cd30e9 100644
--- a/rust/quote/ident_fragment.rs
+++ b/rust/quote/ident_fragment.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::fmt;
 use proc_macro2::{Ident, Span};
 use std::borrow::Cow;
diff --git a/rust/quote/lib.rs b/rust/quote/lib.rs
index 35594827f869..ddab15fe4ebf 100644
--- a/rust/quote/lib.rs
+++ b/rust/quote/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/quote)&ensp;[![crates-io]](https://crates.io/crates/quote)&ensp;[![docs-rs]](https://docs.rs/quote)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/quote/runtime.rs b/rust/quote/runtime.rs
index f3cdded3afb2..966025bc44ab 100644
--- a/rust/quote/runtime.rs
+++ b/rust/quote/runtime.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::{IdentFragment, ToTokens, TokenStreamExt};
 use core::fmt;
 use core::iter;
diff --git a/rust/quote/spanned.rs b/rust/quote/spanned.rs
index f64c8f5dfec7..aac63de0ba2f 100644
--- a/rust/quote/spanned.rs
+++ b/rust/quote/spanned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::ToTokens;
 use proc_macro2::{Span, TokenStream};
 
diff --git a/rust/quote/to_tokens.rs b/rust/quote/to_tokens.rs
index 57487217eeae..a91ba61573e0 100644
--- a/rust/quote/to_tokens.rs
+++ b/rust/quote/to_tokens.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::TokenStreamExt;
 use core::iter;
 use proc_macro2::{Group, Ident, Literal, Punct, Span, TokenStream, TokenTree};
-- 
2.40.1

