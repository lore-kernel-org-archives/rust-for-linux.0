Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92717C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238564AbjFIGyU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238499AbjFIGyO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:14 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CE830E7
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3072; q=dns/txt; s=iport;
  t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6B2aQQANyPEjE5y2MbRC2jpkEgxFQ0Q4s0WGt2DOmqE=;
  b=JmRjOfLAy1wX3URW4gjz2RpU7wLlUReJeHjf+WKmxPqfHIO6ERORspqj
   THx04WAKA8XwISa9rD8k/AelvgCvxOfCpcP4c4B8X2HRxOl99QJrSFulb
   L2YBQVqZntUKHywcRrjTAxodEu58AzhumYtx2+jB0e0RRWXxV9t/F8Ae4
   M=;
X-CSE-ConnectionGUID: rQ9Oda8QTMi9A4SXkxVuUA==
X-CSE-MsgGUID: gs9LeUOcQxen5jRuLw0BWg==
X-IPAS-Result: =?us-ascii?q?A0AiAwA2xoJk/xbLJq1agliDJFUuEkeNTYhVnWuBfg8BA?=
 =?us-ascii?q?QENAQE7CQQBAYUGAoV1JjQJDgECBAEBAQEDAgMBAQEBAQEBAgEBBQEBAQIBB?=
 =?us-ascii?q?wSBChOFaA2GBQYyAUYQIDFXGYJ+AYJcAxGtCIIsgQGDahhzmmuBaIFCjBaFS?=
 =?us-ascii?q?kKBSUSBFYE8gi2CYgICAReCE4V1BI4vjyiBKW+BHjlpfwIJAhFngQoIXIFzQ?=
 =?us-ascii?q?AINVAsLY4EdglUCAhE8DwVSCFoZHQMHBAKBBRAvBwQyKAYJGC8nBlMHFxYkC?=
 =?us-ascii?q?RMVQgSDWQqBEEAVDhGCXCoCPW8DCQMHBUlAAwsYDUgRLDUUHwZDgQcXY4F8J?=
 =?us-ascii?q?CSeRgODCmEuK6ZUoCqEEot8lQQaM4VXo36YFo1algOELwIEBgUCFoFjPIFZM?=
 =?us-ascii?q?xoIGxWDIglJGQ+SFIJkgzGJZ0ExOwIHCwEBAwmLRgEB?=
IronPort-Data: A9a23:7YGrLa6BQVwRlIzgQNztdAxRtHzGchMFZxGqfqrLsTDasY5as4F+v
 mdNXz+DO6qNZ2HxLdF1bd/joRgEscXUzdBjSwRo/ytjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa/lH1dOC//RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq+6UzBHf/g2QvajxMuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fdGCmYvcXD9nHjcirFn85eD1EIILAxr7Mf7WFmr
 ZT0KRgEYwrGjOWszffmDOJtnc8kasLsOevzuFk5kmqfVqZgG8iYBf+QjTNb9G9YasRmFPPfb
 NcdYCFHZxXbaBoJMVASYH47tLj31yijLWYwRFS9qrFmx2Xu6wdIwLXrbdjvZ/iVHe9qkRPNz
 o7B1yGjav0AD/SYyzeJ+1qvi/XJkCe9X5gdfJWi6+V2xVOU3CkXCRsLRXOlrvSjzE2zQdRSL
 woT4CVGkEQp3EWmVJz8RxqivDuCtwJaUNtLGOp84waIokbJ3zuk6qE/ZmYpQLQbWAUeHFTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:5kC9kqg2nlLikuJl4Cedt/ctlHBQXvUji2hC6mlwRA09TyVXra
 yTdZMgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7dZmjbUQKTRekI0WKh+UyDJ8SUzIFgPM
 lbHpRWOZnZEUV6gcHm4AOxDtoshOWc/LvAv5a4854Ud2FXg2UK1XYBNu5deXcGIjV7OQ==
X-Talos-CUID: 9a23:jKbdrmBZBXSUmv76EzNepWkYE5AcTljcnV6MGH+7GVh0dZTAHA==
X-Talos-MUID: 9a23:/FpluAgNtfk4JLUbUpDKoMMpO9w5x6mTL0s0gZgA5su+KAhvYx2ig2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799463"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:43 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDG055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:42 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 22/80] rust: proc-macro2: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:20 +0300
Message-Id: <20230609063118.24852-23-amiculas@cisco.com>
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
 rust/proc-macro2/detection.rs | 2 ++
 rust/proc-macro2/fallback.rs  | 2 ++
 rust/proc-macro2/lib.rs       | 2 ++
 rust/proc-macro2/marker.rs    | 2 ++
 rust/proc-macro2/parse.rs     | 2 ++
 rust/proc-macro2/rcvec.rs     | 2 ++
 rust/proc-macro2/wrapper.rs   | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/rust/proc-macro2/detection.rs b/rust/proc-macro2/detection.rs
index beba7b237395..3de448cb2dde 100644
--- a/rust/proc-macro2/detection.rs
+++ b/rust/proc-macro2/detection.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::sync::atomic::{AtomicUsize, Ordering};
 use std::sync::Once;
 
diff --git a/rust/proc-macro2/fallback.rs b/rust/proc-macro2/fallback.rs
index fe4f248d3d21..f795c7618118 100644
--- a/rust/proc-macro2/fallback.rs
+++ b/rust/proc-macro2/fallback.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::parse::{self, Cursor};
 use crate::rcvec::{RcVec, RcVecBuilder, RcVecIntoIter, RcVecMut};
 use crate::{Delimiter, Spacing, TokenTree};
diff --git a/rust/proc-macro2/lib.rs b/rust/proc-macro2/lib.rs
index 47b48df22272..d3b0454a9c0f 100644
--- a/rust/proc-macro2/lib.rs
+++ b/rust/proc-macro2/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/proc-macro2)&ensp;[![crates-io]](https://crates.io/crates/proc-macro2)&ensp;[![docs-rs]](crate)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/proc-macro2/marker.rs b/rust/proc-macro2/marker.rs
index 59fd0963056f..eea17649a9b9 100644
--- a/rust/proc-macro2/marker.rs
+++ b/rust/proc-macro2/marker.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::marker::PhantomData;
 use std::panic::{RefUnwindSafe, UnwindSafe};
 use std::rc::Rc;
diff --git a/rust/proc-macro2/parse.rs b/rust/proc-macro2/parse.rs
index 04c4833694dc..d1721a207da4 100644
--- a/rust/proc-macro2/parse.rs
+++ b/rust/proc-macro2/parse.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::fallback::{
     is_ident_continue, is_ident_start, Group, LexError, Literal, Span, TokenStream,
     TokenStreamBuilder,
diff --git a/rust/proc-macro2/rcvec.rs b/rust/proc-macro2/rcvec.rs
index 86ca7d8089ac..da2398c789d9 100644
--- a/rust/proc-macro2/rcvec.rs
+++ b/rust/proc-macro2/rcvec.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::mem;
 use core::slice;
 use std::rc::Rc;
diff --git a/rust/proc-macro2/wrapper.rs b/rust/proc-macro2/wrapper.rs
index 47d149473244..dacb2e59bd04 100644
--- a/rust/proc-macro2/wrapper.rs
+++ b/rust/proc-macro2/wrapper.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::detection::inside_proc_macro;
 use crate::{fallback, Delimiter, Punct, Spacing, TokenTree};
 use core::fmt::{self, Debug, Display};
-- 
2.40.1

