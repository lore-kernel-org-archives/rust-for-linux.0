Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D639C7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238488AbjFIGyS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjFIGyN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:13 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89C32D71
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5438; q=dns/txt; s=iport;
  t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hxuqVcwCjWUzUlwRYcONPA8gF0oGkUvuEJxwXgto1Dw=;
  b=Wo2juIxMs/Ngb+o1tQHEBLOCgpWfmyRdNuuABCVwQ2RTGV3UzHyPMWLh
   AUBNDoWK/fIFasDZi1LLt7uCL24B/LQ+xdG3XKJ9HZ9iTxBGUuizvpQtQ
   LNasDaRwcdmxvlVm1m+gpDXlQvaWVZla5BkpE5XbceU4siy3OdIaA4HAN
   k=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857707"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:58 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE5055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:58 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 71/80] rust: hex: implement FromHex trait and hex::decode using a custom kernel_alloc feature
Date:   Fri,  9 Jun 2023 09:31:09 +0300
Message-Id: <20230609063118.24852-72-amiculas@cisco.com>
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

This commit also adds a process_results function for Vec<Result<T,E>>
which transforms it into a Result<Vec<T,E>>, collecting all the values
inside the Result elements into a new vector which directly stores the
elements.
For this to work, the TryReserveError was added to the FromHexError
enum.
This is probably not the ideal design, but since collect cannot be used
directly, it's a good substitute.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/Makefile         |  4 +++-
 rust/alloc/vec/mod.rs | 21 +++++++++++++++++++++
 rust/hex/error.rs     | 17 +++++++++++++++++
 rust/hex/lib.rs       | 19 +++++++++++++++----
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index ba7f911d6919..9b3488764d68 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -144,7 +144,9 @@ hex-skip_flags := \
 
 hex-flags := \
     --edition=2018 \
-    -Amissing_docs
+    -Amissing_docs \
+    --cfg 'feature="kernel_alloc"' \
+    --extern alloc
 
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
diff --git a/rust/alloc/vec/mod.rs b/rust/alloc/vec/mod.rs
index b755cf0b936c..2761f8bf5a9e 100644
--- a/rust/alloc/vec/mod.rs
+++ b/rust/alloc/vec/mod.rs
@@ -661,6 +661,27 @@ pub fn from_iter_fallible(iter: impl Iterator<Item=T>) -> Result<Vec<T>, TryRese
     }
 }
 
+impl<T,E: core::convert::From<TryReserveError>> Vec<Result<T,E>> {
+    /// Iterates through the vector, consuming self, unwrapping the individual values in each
+    /// Result and creating a new vector with them. If there's any error value, it returns it
+    /// immediately
+    #[stable(feature = "rust1", since = "1.0.0")]
+    pub fn process_results(self) -> Result<Vec<T>,E> {
+        let mut vec = Vec::new();
+        for value in self {
+            match value {
+                Ok(v) => {
+                    vec.try_push(v)?;
+                },
+                Err(e) => {
+                    return Err(e);
+                }
+            }
+        }
+        Ok(vec)
+    }
+}
+
 impl<T, A: Allocator> Vec<T, A> {
     /// Constructs a new, empty `Vec<T, A>`.
     ///
diff --git a/rust/hex/error.rs b/rust/hex/error.rs
index e553a046c9ed..c0dc2f558c4d 100644
--- a/rust/hex/error.rs
+++ b/rust/hex/error.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+#[cfg(feature = "kernel_alloc")]
+use alloc::collections::TryReserveError;
 use core::fmt;
 
 /// The error type for decoding a hex string into `Vec<u8>` or `[u8; N]`.
@@ -17,6 +19,10 @@ pub enum FromHexError {
     /// array, the hex string's length * 2 has to match the container's
     /// length.
     InvalidStringLength,
+
+    #[cfg(feature = "kernel_alloc")]
+    /// If an allocation fails, useful in the kernel context
+    TryReserveError,
 }
 
 #[cfg(feature = "std")]
@@ -30,10 +36,21 @@ fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
             }
             FromHexError::OddLength => write!(f, "Odd number of digits"),
             FromHexError::InvalidStringLength => write!(f, "Invalid string length"),
+            #[cfg(feature = "kernel_alloc")]
+            FromHexError::TryReserveError => write!(f, "TryReserveError"),
         }
     }
 }
 
+#[cfg(feature = "kernel_alloc")]
+#[allow(unused_qualifications)]
+impl core::convert::From<TryReserveError> for FromHexError {
+    #[allow(deprecated)]
+    fn from(_source: TryReserveError) -> Self {
+        FromHexError::TryReserveError
+    }
+}
+
 #[cfg(test)]
 // this feature flag is here to suppress unused
 // warnings of `super::*` and `pretty_assertions::assert_eq`
diff --git a/rust/hex/lib.rs b/rust/hex/lib.rs
index a23def3f80db..5cd90d622d16 100644
--- a/rust/hex/lib.rs
+++ b/rust/hex/lib.rs
@@ -41,6 +41,8 @@
 
 #[cfg(feature = "alloc")]
 extern crate alloc;
+#[cfg(feature = "kernel_alloc")]
+use alloc::vec::Vec;
 #[cfg(feature = "alloc")]
 use alloc::{string::String, vec::Vec};
 
@@ -186,7 +188,7 @@ fn val(c: u8, idx: usize) -> Result<u8, FromHexError> {
     }
 }
 
-#[cfg(feature = "alloc")]
+#[cfg(any(feature = "alloc", feature = "kernel_alloc"))]
 impl FromHex for Vec<u8> {
     type Error = FromHexError;
 
@@ -196,10 +198,19 @@ fn from_hex<T: AsRef<[u8]>>(hex: T) -> Result<Self, Self::Error> {
             return Err(FromHexError::OddLength);
         }
 
-        hex.chunks(2)
+        #[cfg(not(feature = "kernel_alloc"))]
+        return hex
+            .chunks(2)
             .enumerate()
             .map(|(i, pair)| Ok(val(pair[0], 2 * i)? << 4 | val(pair[1], 2 * i + 1)?))
-            .collect()
+            .collect();
+        #[cfg(feature = "kernel_alloc")]
+        return Vec::from_iter_fallible(
+            hex.chunks(2)
+                .enumerate()
+                .map(|(i, pair)| Ok(val(pair[0], 2 * i)? << 4 | val(pair[1], 2 * i + 1)?)),
+        )?
+        .process_results();
     }
 }
 
@@ -294,7 +305,7 @@ pub fn encode_upper<T: AsRef<[u8]>>(data: T) -> String {
 /// assert_eq!(hex::decode("123"), Err(hex::FromHexError::OddLength));
 /// assert!(hex::decode("foo").is_err());
 /// ```
-#[cfg(feature = "alloc")]
+#[cfg(any(feature = "alloc", feature = "kernel_alloc"))]
 pub fn decode<T: AsRef<[u8]>>(data: T) -> Result<Vec<u8>, FromHexError> {
     FromHex::from_hex(data)
 }
-- 
2.40.1

