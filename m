Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773C3C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237570AbjFIGyH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjFIGyF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:05 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDC226B2
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8370; q=dns/txt; s=iport;
  t=1686293641; x=1687503241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YyCscb1CfLM0R9Yo+p2Hl9K34exQ/6ElEI+oS8Ghdm4=;
  b=nJxDtjrMKhwYcGmRXk1hyMJFgDDe6c6ECXXkFM/siMzYiy/RYlv8dPcU
   ++802FnGVa1PjcV82raFYMTl6u0XQba0QU5+jwAYf55xHYdlrdBvoNVuR
   uoUHiGKHsbs1B1VOdC5xFjMnMhy7E1SUloG0Q9248/SMkzu9v7YeeBc/u
   g=;
X-CSE-ConnectionGUID: xN2Wd3/6T2yT9jv4z/+2Pg==
X-CSE-MsgGUID: 9A3fF81uTw6poPqHyt7CFQ==
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799467"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:49 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDb055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:49 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 43/80] rust: serde_cbor: add support for serde_cbor's from_slice method by using a custom alloc_kernel feature
Date:   Fri,  9 Jun 2023 09:30:41 +0300
Message-Id: <20230609063118.24852-44-amiculas@cisco.com>
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
 rust/Makefile                 |  2 ++
 rust/kernel/test_serde/de.rs  |  7 ++-----
 rust/kernel/test_serde/ser.rs |  5 +----
 rust/serde_cbor/de.rs         |  6 +++---
 rust/serde_cbor/lib.rs        |  2 +-
 rust/serde_cbor/read.rs       | 18 +++++++++++++-----
 samples/rust/rust_serde.rs    | 32 ++++++++++++++------------------
 7 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 129d5a6dd07e..0b67547d8007 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -131,6 +131,8 @@ serde_cbor-flags := \
     --edition=2018 \
     -Amissing_docs \
     --cfg no_fp_fmt_parse \
+    --cfg 'feature="kernel_alloc"' \
+    --extern alloc \
     --extern serde
 
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
diff --git a/rust/kernel/test_serde/de.rs b/rust/kernel/test_serde/de.rs
index 84c98d1c1c66..68f4da2ace23 100644
--- a/rust/kernel/test_serde/de.rs
+++ b/rust/kernel/test_serde/de.rs
@@ -434,9 +434,6 @@ struct Test {
     }
 
     let j = &[2, 0, 1, 0, 3];
-    let expected = Test {
-        a: (),
-        b: false,
-    };
+    let expected = Test { a: (), b: false };
     assert_eq!(expected, from_bytes(j).unwrap());
-}
\ No newline at end of file
+}
diff --git a/rust/kernel/test_serde/ser.rs b/rust/kernel/test_serde/ser.rs
index 56abe7095a5f..56439b81d4e3 100644
--- a/rust/kernel/test_serde/ser.rs
+++ b/rust/kernel/test_serde/ser.rs
@@ -454,10 +454,7 @@ struct Test {
         b: bool,
     }
 
-    let test = Test {
-        a: (),
-        b: false,
-    };
+    let test = Test { a: (), b: false };
 
     let mut expected = Vec::new();
     expected.try_push(2).unwrap();
diff --git a/rust/serde_cbor/de.rs b/rust/serde_cbor/de.rs
index 534f9d53aa3b..ab7572f24002 100644
--- a/rust/serde_cbor/de.rs
+++ b/rust/serde_cbor/de.rs
@@ -21,7 +21,7 @@
 #[cfg(feature = "std")]
 pub use crate::read::IoRead;
 use crate::read::Offset;
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 pub use crate::read::SliceRead;
 pub use crate::read::{MutSliceRead, Read, SliceReadFixed};
 #[cfg(feature = "tags")]
@@ -47,7 +47,7 @@
 /// let value: &str = de::from_slice(&v[..]).unwrap();
 /// assert_eq!(value, "foobar");
 /// ```
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 pub fn from_slice<'a, T>(slice: &'a [u8]) -> Result<T>
 where
     T: de::Deserialize<'a>,
@@ -150,7 +150,7 @@ pub fn from_reader(reader: R) -> Deserializer<IoRead<R>> {
     }
 }
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 impl<'a> Deserializer<SliceRead<'a>> {
     /// Constructs a `Deserializer` which reads from a slice.
     ///
diff --git a/rust/serde_cbor/lib.rs b/rust/serde_cbor/lib.rs
index cf406a439340..c9751972dfc2 100644
--- a/rust/serde_cbor/lib.rs
+++ b/rust/serde_cbor/lib.rs
@@ -324,7 +324,7 @@
 #[cfg(all(not(feature = "std"), test))]
 extern crate std;
 
-#[cfg(feature = "alloc")]
+#[cfg(any(feature = "alloc", feature = "kernel_alloc"))]
 extern crate alloc;
 
 pub mod de;
diff --git a/rust/serde_cbor/read.rs b/rust/serde_cbor/read.rs
index 6c17282d2c5d..35ef08b84f31 100644
--- a/rust/serde_cbor/read.rs
+++ b/rust/serde_cbor/read.rs
@@ -2,6 +2,8 @@
 
 #[cfg(feature = "alloc")]
 use alloc::{vec, vec::Vec};
+#[cfg(feature = "kernel_alloc")]
+use alloc::{vec::Vec};
 #[cfg(feature = "std")]
 use core::cmp;
 use core::mem;
@@ -298,7 +300,7 @@ fn read(&mut self, buf: &mut [u8]) -> io::Result<usize> {
 }
 
 /// A CBOR input source that reads from a slice of bytes.
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 #[derive(Debug)]
 pub struct SliceRead<'a> {
     slice: &'a [u8],
@@ -306,13 +308,16 @@ pub struct SliceRead<'a> {
     index: usize,
 }
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 impl<'a> SliceRead<'a> {
     /// Creates a CBOR input source to read from a slice of bytes.
     pub fn new(slice: &'a [u8]) -> SliceRead<'a> {
         SliceRead {
             slice,
+            #[cfg(not(feature = "kernel_alloc"))]
             scratch: vec![],
+            #[cfg(feature = "kernel_alloc")]
+            scratch: Vec::new(),
             index: 0,
         }
     }
@@ -328,7 +333,7 @@ fn end(&self, n: usize) -> Result<usize> {
     }
 }
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 impl<'a> Offset for SliceRead<'a> {
     #[inline]
     fn byte_offset(&self) -> usize {
@@ -337,12 +342,12 @@ fn byte_offset(&self) -> usize {
 }
 
 #[cfg(all(
-    any(feature = "std", feature = "alloc"),
+    any(feature = "std", feature = "alloc", feature = "kernel_alloc"),
     not(feature = "unsealed_read_write")
 ))]
 impl<'a> private::Sealed for SliceRead<'a> {}
 
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[cfg(any(feature = "std", feature = "alloc", feature = "kernel_alloc"))]
 impl<'a> Read<'a> for SliceRead<'a> {
     #[inline]
     fn next(&mut self) -> Result<Option<u8>> {
@@ -371,7 +376,10 @@ fn clear_buffer(&mut self) {
     fn read_to_buffer(&mut self, n: usize) -> Result<()> {
         let end = self.end(n)?;
         let slice = &self.slice[self.index..end];
+        #[cfg(not(feature = "kernel_alloc"))]
         self.scratch.extend_from_slice(slice);
+        #[cfg(feature = "kernel_alloc")]
+        self.scratch.try_extend_from_slice(slice).unwrap();
         self.index = end;
 
         Ok(())
diff --git a/samples/rust/rust_serde.rs b/samples/rust/rust_serde.rs
index 0578f0fa137c..29286e763ca3 100644
--- a/samples/rust/rust_serde.rs
+++ b/samples/rust/rust_serde.rs
@@ -6,9 +6,9 @@
 //! one here ("local"). Then it uses both on a type that uses `serve_derive`.
 
 use kernel::prelude::*;
-use serde_derive::{Deserialize, Serialize};
-use serde_cbor::ser::SliceWrite;
 use serde::Serialize;
+use serde_cbor::ser::SliceWrite;
+use serde_derive::{Deserialize, Serialize};
 
 module! {
     type: RustSerde,
@@ -58,9 +58,8 @@ fn cbor_serialize() -> Result<(), serde_cbor::Error> {
     let writer = ser.into_inner();
     let size = writer.bytes_written();
     let expected = [
-        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d,
-        0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73,
-        0x68, 0x84, 0x1, 0x2, 0x3, 0x4
+        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d, 0x70, 0x61, 0x73,
+        0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73, 0x68, 0x84, 0x1, 0x2, 0x3, 0x4,
     ];
     assert_eq!(&buf[..size], expected);
 
@@ -71,21 +70,18 @@ fn cbor_serialize() -> Result<(), serde_cbor::Error> {
 
 fn cbor_deserialize() -> Result<(), serde_cbor::Error> {
     let value = [
-        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d,
-        0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73,
-        0x68, 0x84, 0x1, 0x2, 0x3, 0x4
+        0xa2, 0x67, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x2a, 0x6d, 0x70, 0x61, 0x73,
+        0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x68, 0x61, 0x73, 0x68, 0x84, 0x1, 0x2, 0x3, 0x4,
     ];
 
-    // from_slice_with_scratch will not alter input data, use it whenever you
-    // borrow from somewhere else.
-    // You will have to size your scratch according to the input data you
-    // expect.
-    let mut scratch = [0u8; 32];
-    let user: User = serde_cbor::de::from_slice_with_scratch(&value[..], &mut scratch)?;
-    assert_eq!(user, User {
-        user_id: 42,
-        password_hash: [1, 2, 3, 4],
-    });
+    let user: User = serde_cbor::de::from_slice(&value[..])?;
+    assert_eq!(
+        user,
+        User {
+            user_id: 42,
+            password_hash: [1, 2, 3, 4],
+        }
+    );
 
     crate::pr_info!("cbor deserialized = {:?}", user);
     Ok(())
-- 
2.40.1

