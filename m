Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83324C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjFIG4z (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238656AbjFIG4e (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:34 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3081030D1
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7494; q=dns/txt; s=iport;
  t=1686293787; x=1687503387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YPeuf9AjRZwBa8G+CsVFznddKDMx9WAQpAn8VczNNoM=;
  b=bgtcdAPdUVo10lfrIgNaFyGDsl8SKw76GN5oBTO8Cjbh4LTADFYm5HXp
   knqGL6gKq4zgP4exK4jhxkIekLN/TIWtlmWnhxASibdsE67MYwCXg8dNy
   yMXPzh5yutfDi3OCPZt2easIH2/V7s1kSMdfDyihKE8XJ5LoIU4551MUI
   Y=;
X-IPAS-Result: =?us-ascii?q?A0AQAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IV?=
 =?us-ascii?q?Z1rgX4PAQEBDQEBMRMEAQGFBgKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?QEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAycLAUYQIDFXGYJ+AYJcA60Zg?=
 =?us-ascii?q?XkzgQGDZ0FNmmuBaIFCjBaFSkKBSUSBFYE8gi2CS4g7BIsuDguCaIM2i3KBK?=
 =?us-ascii?q?W+BHjlpfwIJAhFngQoIXIFzQAINVAsLY4EdglUCAhE8DwVSCFoZHQMHBAKBB?=
 =?us-ascii?q?RAvBwQyKAYJGC8nBlMHFxYkCRMVQgSDWQqBEEAVDhGCXCoCPW8DCQMHBUlAA?=
 =?us-ascii?q?wsYDUgRLDUUHwZDgQcXY4F8JCSeRoMNexSCaD2jWqAqhBKLfJUEGjOFV6N+m?=
 =?us-ascii?q?BaWRYwvaYQvAgQGBQIWgWM6gVszGggbFYMiCUkZD445iXCJZ0ExOwIHCwEBA?=
 =?us-ascii?q?wmLRgEB?=
IronPort-Data: A9a23:HpZF6KqAn2+qhBsRbyxzQAlTDUFeBmJjZRIvgKrLsJaIsI4StFCzt
 garIBnQPK7cM2D2eIsib96z/U5T6JLTzt4xT1dspCpjEChEo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILas1htZG0k8EE/NtTo5w7Ri2tAw0YDia++wk
 YqaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9AvY12O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/RPjnRa70o1CBYTQVlxgg7RxdJN8
 tRImJeVUhtuIrKSlt1IBnG0EwkmVUFH0LbKOz20ttaeihCAeHr3yPIoB0YzVWEa0r8oWicVp
 bpCcGtLNErra+GemNpXTsFlg8UoMc3iJ6sUu2prynfSCvNOrZXrHv+VtIcJgl/cgOgXOK+EZ
 stHYAFMfQTHZkRkB0o9DYgXybLAan7XKm0E9w39SbAMy2/RwQB4+LvgKtzYfpqNX8o9tlyFv
 X6D8WPjRxUbMsGP4SSK/2jqheLVmy7/HoUIG9WFGuVCiVCJg20LDwcKEF2yvb+yi1W1XJRUL
 El8FjcSQbYa6mqidYGnXSGCoXuptTsHR51MDLM00VTYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mNlefu0VVSDV5XIFRqgGqeoQSCaZHJOcz5SDcMQZVZfuoOyyG0mpkiXJuuPBpJZmfXTPVkcK
 RijqC0znbhbttIC281XFnie2GvxznQlZiAx6xvQWmuj4mtEiG+Zi26AtAKzARVoddjxory9U
 J4swJH2AAcmV8vlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk5bJxYKGeyM
 BKC42u9AaO/2lP0NsebhKrsW6wXIVTITrwJq9iNNIMVO8gtHON51Hg3NRX4M5/RfLgEyPFjZ
 sjznTeEBncBAqMv1yutW+oYytcWKtMWmwvuqWTA503/i9K2PSfNIZ9caQvmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJdglXdSVlXM+pwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:EQC9h6ieHf/x08pGjNjsR1u80HBQXvUji2hC6mlwRA09TyVXra
 yTdZMgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7dZmjbUQKTRekI0WKh+UyDJ8SUzIFgPM
 lbHpRWOZnZEUV6gcHm4AOxDtoshOWc/LvAv5a4854Ud2FXg2UK1XYBNu5deXcGIjV7OQ==
X-Talos-CUID: 9a23:pqF7im12T6+eZxr4mT07irxfBOYsSSWHzkvqIkqVAkNyVPqJVgGewfYx
X-Talos-MUID: 9a23:wmZ1ggu9orZdxx0/oc2n3RQ7bsZpva2VK1EdlpBfkPSZHylqEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279096"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:46 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDP055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:45 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Date:   Fri,  9 Jun 2023 09:30:29 +0300
Message-Id: <20230609063118.24852-32-amiculas@cisco.com>
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
 rust/serde/de/format.rs         | 2 ++
 rust/serde/de/ignored_any.rs    | 2 ++
 rust/serde/de/impls.rs          | 2 ++
 rust/serde/de/mod.rs            | 2 ++
 rust/serde/de/seed.rs           | 2 ++
 rust/serde/de/utf8.rs           | 2 ++
 rust/serde/de/value.rs          | 2 ++
 rust/serde/integer128.rs        | 2 ++
 rust/serde/lib.rs               | 2 ++
 rust/serde/macros.rs            | 2 ++
 rust/serde/private/de.rs        | 2 ++
 rust/serde/private/doc.rs       | 2 ++
 rust/serde/private/mod.rs       | 2 ++
 rust/serde/private/ser.rs       | 2 ++
 rust/serde/private/size_hint.rs | 2 ++
 rust/serde/ser/fmt.rs           | 2 ++
 rust/serde/ser/impls.rs         | 2 ++
 rust/serde/ser/impossible.rs    | 2 ++
 rust/serde/ser/mod.rs           | 2 ++
 rust/serde/std_error.rs         | 2 ++
 20 files changed, 40 insertions(+)

diff --git a/rust/serde/de/format.rs b/rust/serde/de/format.rs
index f14580b8d162..33233766fc27 100644
--- a/rust/serde/de/format.rs
+++ b/rust/serde/de/format.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::fmt::{self, Write};
 use lib::str;
 
diff --git a/rust/serde/de/ignored_any.rs b/rust/serde/de/ignored_any.rs
index 7b65792e77c0..d2cc83978b50 100644
--- a/rust/serde/de/ignored_any.rs
+++ b/rust/serde/de/ignored_any.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 use de::{
diff --git a/rust/serde/de/impls.rs b/rust/serde/de/impls.rs
index 002bbf74d65b..9377f5eee650 100644
--- a/rust/serde/de/impls.rs
+++ b/rust/serde/de/impls.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 use de::{
diff --git a/rust/serde/de/mod.rs b/rust/serde/de/mod.rs
index 017964f0d0d0..6da226da8ffc 100644
--- a/rust/serde/de/mod.rs
+++ b/rust/serde/de/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Generic data structure deserialization framework.
 //!
 //! The two most important traits in this module are [`Deserialize`] and
diff --git a/rust/serde/de/seed.rs b/rust/serde/de/seed.rs
index 13b7ea461b0c..e0ceeddb100a 100644
--- a/rust/serde/de/seed.rs
+++ b/rust/serde/de/seed.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use de::{Deserialize, DeserializeSeed, Deserializer};
 
 /// A DeserializeSeed helper for implementing deserialize_in_place Visitors.
diff --git a/rust/serde/de/utf8.rs b/rust/serde/de/utf8.rs
index 576fd03cfa79..1fb30488967c 100644
--- a/rust/serde/de/utf8.rs
+++ b/rust/serde/de/utf8.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 const TAG_CONT: u8 = 0b1000_0000;
diff --git a/rust/serde/de/value.rs b/rust/serde/de/value.rs
index d847b8ec071c..dc7be06e9257 100644
--- a/rust/serde/de/value.rs
+++ b/rust/serde/de/value.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Building blocks for deserializing basic values using the `IntoDeserializer`
 //! trait.
 //!
diff --git a/rust/serde/integer128.rs b/rust/serde/integer128.rs
index 904c2a233f8a..b47862335f28 100644
--- a/rust/serde/integer128.rs
+++ b/rust/serde/integer128.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Conditional compilation depending on whether Serde is built with support for
 /// 128-bit integers.
 ///
diff --git a/rust/serde/lib.rs b/rust/serde/lib.rs
index 699573d95e4b..c3694fef3321 100644
--- a/rust/serde/lib.rs
+++ b/rust/serde/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! # Serde
 //!
 //! Serde is a framework for ***ser***ializing and ***de***serializing Rust data
diff --git a/rust/serde/macros.rs b/rust/serde/macros.rs
index 6502a23a7af7..0b0a9ad823e2 100644
--- a/rust/serde/macros.rs
+++ b/rust/serde/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Super explicit first paragraph because this shows up at the top level and
 // trips up people who are just looking for basic Serialize / Deserialize
 // documentation.
diff --git a/rust/serde/private/de.rs b/rust/serde/private/de.rs
index e9c693d4dd31..707c053b7fce 100644
--- a/rust/serde/private/de.rs
+++ b/rust/serde/private/de.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 use de::value::{BorrowedBytesDeserializer, BytesDeserializer};
diff --git a/rust/serde/private/doc.rs b/rust/serde/private/doc.rs
index f597af84451d..271e0c4f7b70 100644
--- a/rust/serde/private/doc.rs
+++ b/rust/serde/private/doc.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Used only by Serde doc tests. Not public API.
 
 use lib::*;
diff --git a/rust/serde/private/mod.rs b/rust/serde/private/mod.rs
index e896902360ba..c05a0ea5c8e3 100644
--- a/rust/serde/private/mod.rs
+++ b/rust/serde/private/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(not(no_serde_derive))]
 pub mod de;
 #[cfg(not(no_serde_derive))]
diff --git a/rust/serde/private/ser.rs b/rust/serde/private/ser.rs
index fc9e7e6d7426..6efd84e5fe57 100644
--- a/rust/serde/private/ser.rs
+++ b/rust/serde/private/ser.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 use ser::{self, Impossible, Serialize, SerializeMap, SerializeStruct, Serializer};
diff --git a/rust/serde/private/size_hint.rs b/rust/serde/private/size_hint.rs
index ca71e616bb69..f050fca59deb 100644
--- a/rust/serde/private/size_hint.rs
+++ b/rust/serde/private/size_hint.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 pub fn from_bounds<I>(iter: &I) -> Option<usize>
diff --git a/rust/serde/ser/fmt.rs b/rust/serde/ser/fmt.rs
index 94c3054fe36b..7906cf76d99f 100644
--- a/rust/serde/ser/fmt.rs
+++ b/rust/serde/ser/fmt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 use ser::{Error, Impossible, Serialize, Serializer};
 
diff --git a/rust/serde/ser/impls.rs b/rust/serde/ser/impls.rs
index 639e480e252d..d70533eb41c3 100644
--- a/rust/serde/ser/impls.rs
+++ b/rust/serde/ser/impls.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::*;
 
 use ser::{Error, Serialize, SerializeTuple, Serializer};
diff --git a/rust/serde/ser/impossible.rs b/rust/serde/ser/impossible.rs
index e8df9ca7aad2..e25270ba70c1 100644
--- a/rust/serde/ser/impossible.rs
+++ b/rust/serde/ser/impossible.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! This module contains `Impossible` serializer and its implementations.
 
 use lib::*;
diff --git a/rust/serde/ser/mod.rs b/rust/serde/ser/mod.rs
index 13ea792c58ef..9a5e47d8c5c8 100644
--- a/rust/serde/ser/mod.rs
+++ b/rust/serde/ser/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Generic data structure serialization framework.
 //!
 //! The two most important traits in this module are [`Serialize`] and
diff --git a/rust/serde/std_error.rs b/rust/serde/std_error.rs
index 1055e0ffbcb2..b730d38a1e07 100644
--- a/rust/serde/std_error.rs
+++ b/rust/serde/std_error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use lib::{Debug, Display};
 
 /// Either a re-export of std::error::Error or a new identical trait, depending
-- 
2.40.1

