Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A17C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbjFIGzt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238392AbjFIGzl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:41 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4583A82
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4602; q=dns/txt; s=iport;
  t=1686293709; x=1687503309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7sEaNNV5em7wWEZCFqUWPD9f6jJoiOzJMEWnqSnqNbQ=;
  b=DmwvHLb4hO5l/gzCWITf58OKueXtpu//V0jmKNiGh/sBh7YMsVkRuQx+
   ubkiAhUtD0+4T3zLNrfVrN30WLLPvVSxoL+D/h2Rs523+xQEUBgJLfkUV
   gg6/T+F17RB6To392w8eY5a4JcWYsE5mR8FLLrSXIUUX/+BUAXNaprTek
   k=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857223"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:58 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE6055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:58 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 72/80] rust: hex: add encode_hex_iter and encode_hex_upper_iter methods
Date:   Fri,  9 Jun 2023 09:31:10 +0300
Message-Id: <20230609063118.24852-73-amiculas@cisco.com>
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

Add encode_hex_iter and encode_hex_upper_iter which return an iterator,
so it can be used in conjunction with the Vec::from_iter_fallible
function to (try to) create a hex string.

Replace BytesToHexChars with BytesToHexByteSequence because String is
not available. We need to collect the values in a Vec<u8>, append a NUL
character and the create a CStr on top of it.

Also remove the ToHex trait because it uses the FromIterator trait which
cannot be implemented in the kernel due to the prohibition of infallible
allocations.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/hex/lib.rs | 60 ++++++++++++-------------------------------------
 1 file changed, 14 insertions(+), 46 deletions(-)

diff --git a/rust/hex/lib.rs b/rust/hex/lib.rs
index 5cd90d622d16..18f5c240c46b 100644
--- a/rust/hex/lib.rs
+++ b/rust/hex/lib.rs
@@ -59,43 +59,18 @@
 #[cfg(all(feature = "alloc", feature = "serde"))]
 pub use crate::serde::{serialize, serialize_upper};
 
-/// Encoding values as hex string.
-///
-/// This trait is implemented for all `T` which implement `AsRef<[u8]>`. This
-/// includes `String`, `str`, `Vec<u8>` and `[u8]`.
-///
-/// # Example
-///
-/// ```
-/// use hex::ToHex;
-///
-/// println!("{}", "Hello world!".encode_hex::<String>());
-/// # assert_eq!("Hello world!".encode_hex::<String>(), "48656c6c6f20776f726c6421".to_string());
-/// ```
-///
-/// *Note*: instead of using this trait, you might want to use [`encode()`].
-pub trait ToHex {
-    /// Encode the hex strict representing `self` into the result. Lower case
-    /// letters are used (e.g. `f9b4ca`)
-    fn encode_hex<T: iter::FromIterator<char>>(&self) -> T;
-
-    /// Encode the hex strict representing `self` into the result. Upper case
-    /// letters are used (e.g. `F9B4CA`)
-    fn encode_hex_upper<T: iter::FromIterator<char>>(&self) -> T;
-}
-
 const HEX_CHARS_LOWER: &[u8; 16] = b"0123456789abcdef";
 const HEX_CHARS_UPPER: &[u8; 16] = b"0123456789ABCDEF";
 
-struct BytesToHexChars<'a> {
+struct BytesToHexByteSequence<'a> {
     inner: ::core::slice::Iter<'a, u8>,
     table: &'static [u8; 16],
-    next: Option<char>,
+    next: Option<u8>,
 }
 
-impl<'a> BytesToHexChars<'a> {
-    fn new(inner: &'a [u8], table: &'static [u8; 16]) -> BytesToHexChars<'a> {
-        BytesToHexChars {
+impl<'a> BytesToHexByteSequence<'a> {
+    fn new(inner: &'a [u8], table: &'static [u8; 16]) -> BytesToHexByteSequence<'a> {
+        BytesToHexByteSequence {
             inner: inner.iter(),
             table,
             next: None,
@@ -103,15 +78,15 @@ impl<'a> BytesToHexChars<'a> {
     }
 }
 
-impl<'a> Iterator for BytesToHexChars<'a> {
-    type Item = char;
+impl<'a> Iterator for BytesToHexByteSequence<'a> {
+    type Item = u8;
 
     fn next(&mut self) -> Option<Self::Item> {
         match self.next.take() {
             Some(current) => Some(current),
             None => self.inner.next().map(|byte| {
-                let current = self.table[(byte >> 4) as usize] as char;
-                self.next = Some(self.table[(byte & 0x0F) as usize] as char);
+                let current = self.table[(byte >> 4) as usize];
+                self.next = Some(self.table[(byte & 0x0F) as usize]);
                 current
             }),
         }
@@ -123,7 +98,7 @@ fn size_hint(&self) -> (usize, Option<usize>) {
     }
 }
 
-impl<'a> iter::ExactSizeIterator for BytesToHexChars<'a> {
+impl<'a> iter::ExactSizeIterator for BytesToHexByteSequence<'a> {
     fn len(&self) -> usize {
         let mut length = self.inner.len() * 2;
         if self.next.is_some() {
@@ -133,19 +108,12 @@ fn len(&self) -> usize {
     }
 }
 
-#[inline]
-fn encode_to_iter<T: iter::FromIterator<char>>(table: &'static [u8; 16], source: &[u8]) -> T {
-    BytesToHexChars::new(source, table).collect()
+pub fn encode_hex_iter<'a>(source: &'a [u8]) -> impl iter::Iterator<Item = u8> + 'a {
+    BytesToHexByteSequence::new(source, HEX_CHARS_LOWER).into_iter()
 }
 
-impl<T: AsRef<[u8]>> ToHex for T {
-    fn encode_hex<U: iter::FromIterator<char>>(&self) -> U {
-        encode_to_iter(HEX_CHARS_LOWER, self.as_ref())
-    }
-
-    fn encode_hex_upper<U: iter::FromIterator<char>>(&self) -> U {
-        encode_to_iter(HEX_CHARS_UPPER, self.as_ref())
-    }
+pub fn encode_hex_upper_iter<'a>(source: &'a [u8]) -> impl iter::Iterator<Item = u8> + 'a {
+    BytesToHexByteSequence::new(source, HEX_CHARS_UPPER).into_iter()
 }
 
 /// Types that can be decoded from a hex string.
-- 
2.40.1

