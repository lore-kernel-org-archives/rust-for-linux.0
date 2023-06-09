Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19F3C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjFIGyN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238151AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE0026B1
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=74633; q=dns/txt;
  s=iport; t=1686293644; x=1687503244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mYeVGjsGrW/qTidDeUhQGweIx7vLQ8TkevNj60I+kA4=;
  b=GawpTrzb5CNZZUOuwgXLZ1CKclzbfyP1f++aRX3jHH7ZuwCEwjyQBBTR
   +dfhEGDqUYL/kKxzkgca0HtcwlyAVpgwEDcxaP1bXVa3pDTMg0yYf/E0Q
   ReF3ORBnULZPBEYIp8ql9Jqh8drJbV0bibVF9nyLS4gw3fbEkw65fXcKV
   E=;
X-IPAS-Result: =?us-ascii?q?A0ABAAAixoJklxbLJq1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXsFAQEBAQsBggaBHVUuEkeMbl+IUgORLIw/FIFqDwEBAQ0BA?=
 =?us-ascii?q?TkLBAEBhQYChXUmNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBA?=
 =?us-ascii?q?QEBAQEBNwUQNYVoDYYFAwMaAQwLAUYQIDFXGQmCdQGCXAMRBq0CgXkzgQGCY?=
 =?us-ascii?q?oITmmuBaIFCAYwVhUpCgUlEgRWBPIItgQ+BUwKBI4Z/BIkdhRJMjlyBKW+BH?=
 =?us-ascii?q?jlpfwIJAhFngQoIXIFzQAINVAsLY4EdglUCAhE8FFJiGR0DBwQCgQUQLwcEM?=
 =?us-ascii?q?igGCRgvJwZTBxcWJAkTFUIEg1kKgRBAFQ4RglwqAj1vAwkDBwVJQAMLGA1IE?=
 =?us-ascii?q?Sw1FB8GQ4EHF2OBfCQknkYDghdGDRkHATwqFBMBChEKBQEXGCFIQg4bAQE4O?=
 =?us-ascii?q?gOMZYVRPI5TghWec4E3hBKLfI4NhncaM4QBTIEKkgKRGmKYFo1aiGuMADMLW?=
 =?us-ascii?q?oQvAgQGBQIWgWM6gVszGggbFYMiCUkZD44pEAmBBgEIgkOFFIEBiWdBMQI5A?=
 =?us-ascii?q?gcLAQEDCYhuLYFMXwEB?=
IronPort-Data: A9a23:0x+aAa9ZHNVHTrSsQ6ySDrUD+36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mIaDz+EO/2KYWfxKt0lPoy08EMFvp+By4IwSQBuqH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYngZqTNMEn970ko9w75h2eaEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y4iLMc7LkcNqw+CuNdg8
 I1W7pK3aicQa/ikdOQ1C3G0Egl3MLcD87jdLD3i98eS1EbBNXDrxp2CDmlvYtZeobYxWzkVs
 6ZCQNwORkjra+aeybe6QfRoj98LJ8jwN4RZsXZlpd3cJal2HM+cG/yiCdlw8HQCgZFjLfPlR
 5AEdGFJPBefWTtxEwJCYH45tL742iagG9FCk3qSp6c76kDQwRZ33byrN8DaEvSQWN5J20ifv
 CfC/mLkEjkEO9GFjzmI6HShgqnIhyyTZW4JPLS17LtrmFqJ2ikVAQFQXlqgqv7/gUm7Mz5CF
 6AK0jM2kI919BaLdNLaWAyA+GXfsBk/e+MFRoXW9zqx4qbT5g+YAE0NQThAdMEquacKqdoCi
 w/hczTBWGAHjVGFdZ6O3urO9m3jaUD5OUdfP3ZeHGPp9vG5+OkOYgTzosFLNordYjfdMDX1z
 iqH5BMijrl7YSUjjv7ioDgrbxqCopXXSQo84Am/Y45E0u+bTNP/D2BLwQGFhRqlEGp/ZgLY1
 JTjs5LEhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOsG8keBYxaZZZKGWBj
 KrvVeV5usQ70JyCMP8fXm5NI59CIVXITI68DamEMrKinLAoLV/clM2RWaJg9zm9zBdz+U3OE
 Zyaas2rRW0LErhqySHeegvu+eFD+8zK/kuKHcqT503+idK2PSfFIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHKOrNZOcwlVchDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:Nqp4+KqMytxDw03sU6TUHaIaV5oEeYIsimQD101hICG9vPb1qy
 nIpoV+6faaslgssR0b8+xofZPwIk80lqQFhLX5Q43CYOCOggLBR72Kr7GSoQEIcBeQygcy78
 pdWpk7IMHsDFR8kMbx6BS1HpId2tWdmZrY4ts2t00McemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:MIjOW22PSHkp+Ntyp9jC9bxfA9gYVTrdllfqKGi/GF4xU+abTnywwfYx
X-Talos-MUID: 9a23:vSrCWQh1d10HPjwu/LzfNMMpGIRa5PWDOEU2sc8bppKiZS8vARGjpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857701"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:47 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDT055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:47 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 35/80] rust: test `serde` support
Date:   Fri,  9 Jun 2023 09:30:33 +0300
Message-Id: <20230609063118.24852-36-amiculas@cisco.com>
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

A trivial example based on `serde`'s `example-format' [1].

It contains both a in-`kernel` data format later used by
the kernel module, as well as a local data format in
the module.

The kernel module gives an output such as:

    [    0.801425] rust_serde: Rust serde sample (init)
    [    0.801634] rust_serde:             original = S { a: (), b: false, c: true, d: () }
    [    0.802079] rust_serde:           serialized = [2, 0, 1, 0, 1, 1, 0, 3]
    [    0.802506] rust_serde:         deserialized = S { a: (), b: false, c: true, d: () }
    [    0.802718] rust_serde:   serialized (local) = [2, 0, 1, 42, 1, 43, 0, 3]
    [    0.802895] rust_serde: deserialized (local) = S { a: (), b: false, c: true, d: () }
    [    0.808954] rust_serde: Rust serde sample (exit)

Note that this is just a quick draft/hack to check the previous
commits work. It is not intended to be merged at all.

Link: https://github.com/serde-rs/example-format [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs                      |   1 +
 rust/kernel/test_serde.rs               |  26 ++
 rust/kernel/test_serde/de.rs            | 442 ++++++++++++++++++++++
 rust/kernel/test_serde/error.rs         |  73 ++++
 rust/kernel/test_serde/ser.rs           | 469 ++++++++++++++++++++++++
 samples/rust/Kconfig                    |   8 +
 samples/rust/Makefile                   |   1 +
 samples/rust/local_data_format/de.rs    | 422 +++++++++++++++++++++
 samples/rust/local_data_format/error.rs |  73 ++++
 samples/rust/local_data_format/ser.rs   | 443 ++++++++++++++++++++++
 samples/rust/rust_serde.rs              |  73 ++++
 11 files changed, 2031 insertions(+)
 create mode 100644 rust/kernel/test_serde.rs
 create mode 100644 rust/kernel/test_serde/de.rs
 create mode 100644 rust/kernel/test_serde/error.rs
 create mode 100644 rust/kernel/test_serde/ser.rs
 create mode 100644 samples/rust/local_data_format/de.rs
 create mode 100644 samples/rust/local_data_format/error.rs
 create mode 100644 samples/rust/local_data_format/ser.rs
 create mode 100644 samples/rust/rust_serde.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 08f67833afcf..a94fb784d576 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -178,3 +178,4 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 ///
 /// [`PAGE_SHIFT`]: ../../../include/asm-generic/page.h
 pub const PAGE_SIZE: usize = 1 << bindings::PAGE_SHIFT;
+pub mod test_serde;
diff --git a/rust/kernel/test_serde.rs b/rust/kernel/test_serde.rs
new file mode 100644
index 000000000000..012bf58213a8
--- /dev/null
+++ b/rust/kernel/test_serde.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+//! Test `serde`.
+//!
+//! It contains a data format used by the `rust_serde` sample, as well
+//! as a quick check that `serde_derive` works in the `kernel` crate too.
+
+#![allow(missing_docs)]
+
+mod de;
+mod error;
+mod ser;
+
+pub use de::{from_bytes, Deserializer};
+pub use error::{Error, Result};
+pub use ser::{to_vec, Serializer};
+
+use serde_derive::{Deserialize, Serialize};
+
+#[derive(Serialize, Deserialize, Debug)]
+pub struct S {
+    a: (),
+    b: bool,
+    c: bool,
+    d: (),
+}
diff --git a/rust/kernel/test_serde/de.rs b/rust/kernel/test_serde/de.rs
new file mode 100644
index 000000000000..84c98d1c1c66
--- /dev/null
+++ b/rust/kernel/test_serde/de.rs
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use super::error::{Error, Result};
+use serde::de::{self, Deserialize, DeserializeSeed, SeqAccess, Visitor};
+
+pub struct Deserializer<'de> {
+    // This string starts with the input data and characters are truncated off
+    // the beginning as data is parsed.
+    input: &'de [u8],
+}
+
+impl<'de> Deserializer<'de> {
+    // By convention, `Deserializer` constructors are named like `from_xyz`.
+    // That way basic use cases are satisfied by something like
+    // `serde_json::from_str(...)` while advanced use cases that require a
+    // deserializer can make one with `serde_json::Deserializer::from_str(...)`.
+    #[allow(clippy::should_implement_trait)]
+    pub fn from_bytes(input: &'de [u8]) -> Self {
+        Deserializer { input }
+    }
+}
+
+// By convention, the public API of a Serde deserializer is one or more
+// `from_xyz` methods such as `from_str`, `from_bytes`, or `from_reader`
+// depending on what Rust types the deserializer is able to consume as input.
+//
+// This basic deserializer supports only `from_str`.
+pub fn from_bytes<'a, T>(s: &'a [u8]) -> Result<T>
+where
+    T: Deserialize<'a>,
+{
+    let mut deserializer = Deserializer::from_bytes(s);
+    let t = T::deserialize(&mut deserializer)?;
+    if deserializer.input.is_empty() {
+        Ok(t)
+    } else {
+        Err(Error::TrailingCharacters)
+    }
+}
+
+// SERDE IS NOT A PARSING LIBRARY. This impl block defines a few basic parsing
+// functions from scratch. More complicated formats may wish to use a dedicated
+// parsing library to help implement their Serde deserializer.
+impl<'de> Deserializer<'de> {
+    // Look at the first character in the input without consuming it.
+    fn peek_byte(&mut self) -> Result<u8> {
+        self.input.iter().next().ok_or(Error::Eof).map(|v| *v)
+    }
+
+    // Consume the first character in the input.
+    fn next_byte(&mut self) -> Result<u8> {
+        let ch = self.peek_byte()?;
+        self.input = &self.input[1..];
+        Ok(ch)
+    }
+
+    // Parse the JSON identifier `true` or `false`.
+    fn parse_bool(&mut self) -> Result<bool> {
+        if self.input.starts_with(&[1]) {
+            self.input = &self.input[1..];
+            match self.next_byte()? {
+                0 => Ok(false),
+                1 => Ok(true),
+                _ => Err(Error::InvalidBooleanValue),
+            }
+        } else {
+            Err(Error::ExpectedBoolean)
+        }
+    }
+
+    // Parse a group of decimal digits as an unsigned integer of type T.
+    //
+    // This implementation is a bit too lenient, for example `001` is not
+    // allowed in JSON. Also the various arithmetic operations can overflow and
+    // panic or return bogus data. But it is good enough for example code!
+    fn parse_unsigned<T>(&mut self) -> Result<T> {
+        unimplemented!()
+    }
+
+    // Parse a possible minus sign followed by a group of decimal digits as a
+    // signed integer of type T.
+    fn parse_signed<T>(&mut self) -> Result<T> {
+        // Optional minus sign, delegate to `parse_unsigned`, negate if negative.
+        unimplemented!()
+    }
+}
+
+impl<'de, 'a> de::Deserializer<'de> for &'a mut Deserializer<'de> {
+    type Error = Error;
+
+    // Look at the input data to decide what Serde data model type to
+    // deserialize as. Not all data formats are able to support this operation.
+    // Formats that support `deserialize_any` are known as self-describing.
+    fn deserialize_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match self.peek_byte()? {
+            0 => self.deserialize_unit(visitor),
+            1 => self.deserialize_bool(visitor),
+            2 => self.deserialize_map(visitor),
+            _ => Err(Error::Syntax),
+        }
+    }
+
+    // Uses the `parse_bool` parsing function defined above to read the JSON
+    // identifier `true` or `false` from the input.
+    //
+    // Parsing refers to looking at the input and deciding that it contains the
+    // JSON value `true` or `false`.
+    //
+    // Deserialization refers to mapping that JSON value into Serde's data
+    // model by invoking one of the `Visitor` methods. In the case of JSON and
+    // bool that mapping is straightforward so the distinction may seem silly,
+    // but in other cases Deserializers sometimes perform non-obvious mappings.
+    // For example the TOML format has a Datetime type and Serde's data model
+    // does not. In the `toml` crate, a Datetime in the input is deserialized by
+    // mapping it to a Serde data model "struct" type with a special name and a
+    // single field containing the Datetime represented as a string.
+    fn deserialize_bool<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_bool(self.parse_bool()?)
+    }
+
+    // The `parse_signed` function is generic over the integer type `T` so here
+    // it is invoked with `T=i8`. The next 8 methods are similar.
+    fn deserialize_i8<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i8(self.parse_signed()?)
+    }
+
+    fn deserialize_i16<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i16(self.parse_signed()?)
+    }
+
+    fn deserialize_i32<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i32(self.parse_signed()?)
+    }
+
+    fn deserialize_i64<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i64(self.parse_signed()?)
+    }
+
+    fn deserialize_u8<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u8(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u16<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u16(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u32<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u32(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u64<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u64(self.parse_unsigned()?)
+    }
+
+    // The `Serializer` implementation on the previous page serialized chars as
+    // single-character strings so handle that representation here.
+    fn deserialize_char<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // Refer to the "Understanding deserializer lifetimes" page for information
+    // about the three deserialization flavors of strings in Serde.
+    fn deserialize_str<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    fn deserialize_string<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // The `Serializer` implementation on the previous page serialized byte
+    // arrays as JSON arrays of bytes. Handle that representation here.
+    fn deserialize_bytes<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    fn deserialize_byte_buf<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // An absent optional is represented as the JSON `null` and a present
+    // optional is represented as just the contained value.
+    //
+    // As commented in `Serializer` implementation, this is a lossy
+    // representation. For example the values `Some(())` and `None` both
+    // serialize as just `null`. Unfortunately this is typically what people
+    // expect when working with JSON. Other formats are encouraged to behave
+    // more intelligently if possible.
+    fn deserialize_option<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // In Serde, unit means an anonymous value containing no data.
+    fn deserialize_unit<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        if self.input.starts_with(&[0]) {
+            self.input = &self.input[1..];
+            visitor.visit_unit()
+        } else {
+            Err(Error::ExpectedNull)
+        }
+    }
+
+    // Unit struct means a named value containing no data.
+    fn deserialize_unit_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_unit(visitor)
+    }
+
+    // As is done here, serializers are encouraged to treat newtype structs as
+    // insignificant wrappers around the data they contain. That means not
+    // parsing anything other than the contained value.
+    fn deserialize_newtype_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_newtype_struct(self)
+    }
+
+    // Deserialization of compound types like sequences and maps happens by
+    // passing the visitor an "Access" object that gives it the ability to
+    // iterate through the data contained in the sequence.
+    fn deserialize_seq<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // Tuples look just like sequences in JSON. Some formats may be able to
+    // represent tuples more efficiently.
+    //
+    // As indicated by the length parameter, the `Deserialize` implementation
+    // for a tuple in the Serde data model is required to know the length of the
+    // tuple before even looking at the input data.
+    fn deserialize_tuple<V>(self, _len: usize, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    // Tuple structs look just like sequences in JSON.
+    fn deserialize_tuple_struct<V>(
+        self,
+        _name: &'static str,
+        _len: usize,
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    // Much like `deserialize_seq` but calls the visitors `visit_map` method
+    // with a `MapAccess` implementation, rather than the visitor's `visit_seq`
+    // method with a `SeqAccess` implementation.
+    fn deserialize_map<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        // Parse the opening brace of the map.
+        if self.next_byte()? == 2 {
+            // Give the visitor access to each entry of the map.
+            let value = visitor.visit_seq(StructFieldsVisitor::new(self))?;
+            // Parse the closing brace of the map.
+            if self.next_byte()? == 3 {
+                Ok(value)
+            } else {
+                Err(Error::ExpectedMapEnd)
+            }
+        } else {
+            Err(Error::ExpectedMap)
+        }
+    }
+
+    // Structs look just like maps in JSON.
+    //
+    // Notice the `fields` parameter - a "struct" in the Serde data model means
+    // that the `Deserialize` implementation is required to know what the fields
+    // are before even looking at the input data. Any key-value pairing in which
+    // the fields cannot be known ahead of time is probably a map.
+    fn deserialize_struct<V>(
+        self,
+        _name: &'static str,
+        _fields: &'static [&'static str],
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_map(visitor)
+    }
+
+    fn deserialize_enum<V>(
+        self,
+        _name: &'static str,
+        _variants: &'static [&'static str],
+        _visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // An identifier in Serde is the type that identifies a field of a struct or
+    // the variant of an enum. In JSON, struct fields and enum variants are
+    // represented as strings. In other formats they may be represented as
+    // numeric indices.
+    fn deserialize_identifier<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_str(visitor)
+    }
+
+    // Like `deserialize_any` but indicates to the `Deserializer` that it makes
+    // no difference which `Visitor` method is called because the data is
+    // ignored.
+    //
+    // Some deserializers are able to implement this more efficiently than
+    // `deserialize_any`, for example by rapidly skipping over matched
+    // delimiters without paying close attention to the data in between.
+    //
+    // Some formats are not able to implement this at all. Formats that can
+    // implement `deserialize_any` and `deserialize_ignored_any` are known as
+    // self-describing.
+    fn deserialize_ignored_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_any(visitor)
+    }
+}
+
+struct StructFieldsVisitor<'a, 'de> {
+    de: &'a mut Deserializer<'de>,
+}
+
+impl<'a, 'de> StructFieldsVisitor<'a, 'de> {
+    fn new(de: &'a mut Deserializer<'de>) -> Self {
+        StructFieldsVisitor { de }
+    }
+}
+
+impl<'de, 'a> SeqAccess<'de> for StructFieldsVisitor<'a, 'de> {
+    type Error = Error;
+
+    fn next_element_seed<T>(&mut self, seed: T) -> Result<Option<T::Value>>
+    where
+        T: DeserializeSeed<'de>,
+    {
+        // Check if there are no more elements.
+        if self.de.peek_byte()? == 3 {
+            return Ok(None);
+        }
+        // Deserialize an array element.
+        seed.deserialize(&mut *self.de).map(Some)
+    }
+}
+
+////////////////////////////////////////////////////////////////////////////////
+
+#[test]
+fn test_struct() {
+    use serde_derive::Deserialize;
+
+    #[derive(Deserialize, PartialEq, Debug)]
+    struct Test {
+        a: (),
+        b: bool,
+    }
+
+    let j = &[2, 0, 1, 0, 3];
+    let expected = Test {
+        a: (),
+        b: false,
+    };
+    assert_eq!(expected, from_bytes(j).unwrap());
+}
\ No newline at end of file
diff --git a/rust/kernel/test_serde/error.rs b/rust/kernel/test_serde/error.rs
new file mode 100644
index 000000000000..a1eb3720ce67
--- /dev/null
+++ b/rust/kernel/test_serde/error.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use core::fmt::{self, Display};
+use serde::{de, ser};
+
+pub type Result<T> = crate::error::Result<T, Error>;
+
+// This is a bare-bones implementation. A real library would provide additional
+// information in its error type, for example the line and column at which the
+// error occurred, the byte offset into the input, or the current key being
+// processed.
+#[derive(Debug)]
+pub enum Error {
+    // One or more variants that can be created by data structures through the
+    // `ser::Error` and `de::Error` traits. For example the Serialize impl for
+    // Mutex<T> might return an error because the mutex is poisoned, or the
+    // Deserialize impl for a struct may return an error because a required
+    // field is missing.
+    Message,
+
+    // Zero or more variants that can be created directly by the Serializer and
+    // Deserializer without going through `ser::Error` and `de::Error`. These
+    // are specific to the format, in this case JSON.
+    Eof,
+    Syntax,
+    ExpectedBoolean,
+    InvalidBooleanValue,
+    ExpectedInteger,
+    ExpectedString,
+    ExpectedNull,
+    ExpectedArray,
+    ExpectedArrayComma,
+    ExpectedArrayEnd,
+    ExpectedMap,
+    ExpectedMapColon,
+    ExpectedMapComma,
+    ExpectedMapEnd,
+    ExpectedEnum,
+    TrailingCharacters,
+}
+
+impl ser::Error for Error {
+    fn custom<T: Display>(_msg: T) -> Self {
+        Error::Message
+    }
+}
+
+impl de::Error for Error {
+    fn custom<T: Display>(_msg: T) -> Self {
+        Error::Message
+    }
+}
+
+impl Display for Error {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Error::Message => write!(f, "message"),
+            Error::Eof => f.write_str("unexpected end of input"),
+            /* and so forth */
+            _ => unimplemented!(),
+        }
+    }
+}
+
+//impl core::error::Error for Error {}
diff --git a/rust/kernel/test_serde/ser.rs b/rust/kernel/test_serde/ser.rs
new file mode 100644
index 000000000000..56abe7095a5f
--- /dev/null
+++ b/rust/kernel/test_serde/ser.rs
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use super::error::{Error, Result};
+use alloc::vec::Vec;
+use serde::ser::{self, Serialize};
+
+pub struct Serializer {
+    // This string starts empty and JSON is appended as values are serialized.
+    output: Vec<u8>,
+}
+
+// By convention, the public API of a Serde serializer is one or more `to_abc`
+// functions such as `to_string`, `to_bytes`, or `to_writer` depending on what
+// Rust types the serializer is able to produce as output.
+//
+// This basic serializer supports only `to_string`.
+pub fn to_vec<T>(value: &T) -> Result<Vec<u8>>
+where
+    T: Serialize,
+{
+    let mut serializer = Serializer { output: Vec::new() };
+    value.serialize(&mut serializer)?;
+    Ok(serializer.output)
+}
+
+impl<'a> ser::Serializer for &'a mut Serializer {
+    // The output type produced by this `Serializer` during successful
+    // serialization. Most serializers that produce text or binary output should
+    // set `Ok = ()` and serialize into an `io::Write` or buffer contained
+    // within the `Serializer` instance, as happens here. Serializers that build
+    // in-memory data structures may be simplified by using `Ok` to propagate
+    // the data structure around.
+    type Ok = ();
+
+    // The error type when some error occurs during serialization.
+    type Error = Error;
+
+    // Associated types for keeping track of additional state while serializing
+    // compound data structures like sequences and maps. In this case no
+    // additional state is required beyond what is already stored in the
+    // Serializer struct.
+    type SerializeSeq = Self;
+    type SerializeTuple = Self;
+    type SerializeTupleStruct = Self;
+    type SerializeTupleVariant = Self;
+    type SerializeMap = Self;
+    type SerializeStruct = Self;
+    type SerializeStructVariant = Self;
+
+    // Here we go with the simple methods. The following 12 methods receive one
+    // of the primitive types of the data model and map it to JSON by appending
+    // into the output string.
+    fn serialize_bool(self, v: bool) -> Result<()> {
+        self.output.try_push(1).unwrap();
+        self.output.try_push(if v { 1 } else { 0 }).unwrap();
+        Ok(())
+    }
+
+    // JSON does not distinguish between different sizes of integers, so all
+    // signed integers will be serialized the same and all unsigned integers
+    // will be serialized the same. Other formats, especially compact binary
+    // formats, may need independent logic for the different sizes.
+    fn serialize_i8(self, v: i8) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    fn serialize_i16(self, v: i16) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    fn serialize_i32(self, v: i32) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    // Not particularly efficient but this is example code anyway. A more
+    // performant approach would be to use the `itoa` crate.
+    fn serialize_i64(self, _v: i64) -> Result<()> {
+        unimplemented!();
+    }
+
+    fn serialize_u8(self, v: u8) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u16(self, v: u16) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u32(self, v: u32) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u64(self, _v: u64) -> Result<()> {
+        unimplemented!();
+    }
+
+    // Serialize a char as a single-character string. Other formats may
+    // represent this differently.
+    fn serialize_char(self, _v: char) -> Result<()> {
+        unimplemented!();
+    }
+
+    // This only works for strings that don't require escape sequences but you
+    // get the idea. For example it would emit invalid JSON if the input string
+    // contains a '"' character.
+    fn serialize_str(self, _v: &str) -> Result<()> {
+        unimplemented!();
+    }
+
+    // Serialize a byte array as an array of bytes. Could also use a base64
+    // string here. Binary formats will typically represent byte arrays more
+    // compactly.
+    fn serialize_bytes(self, v: &[u8]) -> Result<()> {
+        use serde::ser::SerializeSeq;
+        let mut seq = self.serialize_seq(Some(v.len()))?;
+        for byte in v {
+            seq.serialize_element(byte)?;
+        }
+        seq.end()
+    }
+
+    // An absent optional is represented as the JSON `null`.
+    fn serialize_none(self) -> Result<()> {
+        self.serialize_unit()
+    }
+
+    // A present optional is represented as just the contained value. Note that
+    // this is a lossy representation. For example the values `Some(())` and
+    // `None` both serialize as just `null`. Unfortunately this is typically
+    // what people expect when working with JSON. Other formats are encouraged
+    // to behave more intelligently if possible.
+    fn serialize_some<T>(self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    // In Serde, unit means an anonymous value containing no data. Map this to
+    // JSON as `null`.
+    fn serialize_unit(self) -> Result<()> {
+        self.output.try_push(0).unwrap();
+        Ok(())
+    }
+
+    // Unit struct means a named value containing no data. Again, since there is
+    // no data, map this to JSON as `null`. There is no need to serialize the
+    // name in most formats.
+    fn serialize_unit_struct(self, _name: &'static str) -> Result<()> {
+        self.serialize_unit()
+    }
+
+    // When serializing a unit variant (or any other kind of variant), formats
+    // can choose whether to keep track of it by index or by name. Binary
+    // formats typically use the index of the variant and human-readable formats
+    // typically use the name.
+    fn serialize_unit_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+    ) -> Result<()> {
+        self.serialize_str(variant)
+    }
+
+    // As is done here, serializers are encouraged to treat newtype structs as
+    // insignificant wrappers around the data they contain.
+    fn serialize_newtype_struct<T>(self, _name: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    // Note that newtype variant (and all of the other variant serialization
+    // methods) refer exclusively to the "externally tagged" enum
+    // representation.
+    //
+    // Serialize this to JSON in externally tagged form as `{ NAME: VALUE }`.
+    fn serialize_newtype_variant<T>(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _value: &T,
+    ) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    // Now we get to the serialization of compound types.
+    //
+    // The start of the sequence, each value, and the end are three separate
+    // method calls. This one is responsible only for serializing the start,
+    // which in JSON is `[`.
+    //
+    // The length of the sequence may or may not be known ahead of time. This
+    // doesn't make a difference in JSON because the length is not represented
+    // explicitly in the serialized form. Some serializers may only be able to
+    // support sequences for which the length is known up front.
+    fn serialize_seq(self, _len: Option<usize>) -> Result<Self::SerializeSeq> {
+        unimplemented!();
+    }
+
+    // Tuples look just like sequences in JSON. Some formats may be able to
+    // represent tuples more efficiently by omitting the length, since tuple
+    // means that the corresponding `Deserialize implementation will know the
+    // length without needing to look at the serialized data.
+    fn serialize_tuple(self, len: usize) -> Result<Self::SerializeTuple> {
+        self.serialize_seq(Some(len))
+    }
+
+    // Tuple structs look just like sequences in JSON.
+    fn serialize_tuple_struct(
+        self,
+        _name: &'static str,
+        len: usize,
+    ) -> Result<Self::SerializeTupleStruct> {
+        self.serialize_seq(Some(len))
+    }
+
+    // Tuple variants are represented in JSON as `{ NAME: [DATA...] }`. Again
+    // this method is only responsible for the externally tagged representation.
+    fn serialize_tuple_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeTupleVariant> {
+        unimplemented!();
+    }
+
+    // Maps are represented in JSON as `{ K: V, K: V, ... }`.
+    fn serialize_map(self, _len: Option<usize>) -> Result<Self::SerializeMap> {
+        self.output.try_push(2).unwrap();
+        Ok(self)
+    }
+
+    // Structs look just like maps in JSON. In particular, JSON requires that we
+    // serialize the field names of the struct. Other formats may be able to
+    // omit the field names when serializing structs because the corresponding
+    // Deserialize implementation is required to know what the keys are without
+    // looking at the serialized data.
+    fn serialize_struct(self, _name: &'static str, len: usize) -> Result<Self::SerializeStruct> {
+        self.serialize_map(Some(len))
+    }
+
+    // Struct variants are represented in JSON as `{ NAME: { K: V, ... } }`.
+    // This is the externally tagged representation.
+    fn serialize_struct_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeStructVariant> {
+        unimplemented!();
+    }
+
+    fn collect_str<T: ?Sized>(self, _: &T) -> Result<()>
+    where
+        T: core::fmt::Display,
+    {
+        unimplemented!()
+    }
+}
+
+// The following 7 impls deal with the serialization of compound types like
+// sequences and maps. Serialization of such types is begun by a Serializer
+// method and followed by zero or more calls to serialize individual elements of
+// the compound type and one call to end the compound type.
+//
+// This impl is SerializeSeq so these methods are called after `serialize_seq`
+// is called on the Serializer.
+impl<'a> ser::SerializeSeq for &'a mut Serializer {
+    // Must match the `Ok` type of the serializer.
+    type Ok = ();
+    // Must match the `Error` type of the serializer.
+    type Error = Error;
+
+    // Serialize a single element of the sequence.
+    fn serialize_element<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    // Close the sequence.
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Same thing but for tuples.
+impl<'a> ser::SerializeTuple for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_element<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Same thing but for tuple structs.
+impl<'a> ser::SerializeTupleStruct for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Tuple variants are a little different. Refer back to the
+// `serialize_tuple_variant` method above:
+//
+//    self.output += "{";
+//    variant.serialize(&mut *self)?;
+//    self.output += ":[";
+//
+// So the `end` method in this impl is responsible for closing both the `]` and
+// the `}`.
+impl<'a> ser::SerializeTupleVariant for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Some `Serialize` types are not able to hold a key and value in memory at the
+// same time so `SerializeMap` implementations are required to support
+// `serialize_key` and `serialize_value` individually.
+//
+// There is a third optional method on the `SerializeMap` trait. The
+// `serialize_entry` method allows serializers to optimize for the case where
+// key and value are both available simultaneously. In JSON it doesn't make a
+// difference so the default behavior for `serialize_entry` is fine.
+impl<'a> ser::SerializeMap for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    // The Serde data model allows map keys to be any serializable type. JSON
+    // only allows string keys so the implementation below will produce invalid
+    // JSON if the key serializes as something other than a string.
+    //
+    // A real JSON serializer would need to validate that map keys are strings.
+    // This can be done by using a different Serializer to serialize the key
+    // (instead of `&mut **self`) and having that other serializer only
+    // implement `serialize_str` and return an error on any other data type.
+    fn serialize_key<T>(&mut self, _key: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!()
+    }
+
+    // It doesn't make a difference whether the colon is printed at the end of
+    // `serialize_key` or at the beginning of `serialize_value`. In this case
+    // the code is a bit simpler having it here.
+    fn serialize_value<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!()
+    }
+
+    fn end(self) -> Result<()> {
+        self.output.try_push(3).unwrap();
+        Ok(())
+    }
+}
+
+// Structs are like maps in which the keys are constrained to be compile-time
+// constant strings.
+impl<'a> ser::SerializeStruct for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _key: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(&mut **self)
+    }
+
+    fn end(self) -> Result<()> {
+        self.output.try_push(3).unwrap();
+        Ok(())
+    }
+}
+
+// Similar to `SerializeTupleVariant`, here the `end` method is responsible for
+// closing both of the curly braces opened by `serialize_struct_variant`.
+impl<'a> ser::SerializeStructVariant for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _key: &'static str, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+////////////////////////////////////////////////////////////////////////////////
+
+#[test]
+fn test_struct() {
+    use serde_derive::Serialize;
+
+    #[derive(Serialize)]
+    struct Test {
+        a: (),
+        b: bool,
+    }
+
+    let test = Test {
+        a: (),
+        b: false,
+    };
+
+    let mut expected = Vec::new();
+    expected.try_push(2).unwrap();
+    expected.try_push(0).unwrap();
+    expected.try_push(1).unwrap();
+    expected.try_push(0).unwrap();
+    expected.try_push(3).unwrap();
+    assert_eq!(to_vec(&test).unwrap(), expected);
+}
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 05ca21fbba06..a408f098fbfd 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -48,6 +48,14 @@ config SAMPLE_PUZZLEFS
 	  To compile this as a module, choose M here:
 	  the module will be called puzzlefs.
 
+config SAMPLE_RUST_SERDE
+	tristate "Serde"
+	help
+	  This option builds the Rust `serde` sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_serde.
+
 	  If unsure, say N.
 
 config SAMPLE_RUST_HOSTPROGS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 364a38dbf90b..bc27f97d71ad 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_FS)			+= rust_fs.o
 obj-$(CONFIG_SAMPLE_PUZZLEFS)			+= puzzlefs.o
+obj-$(CONFIG_SAMPLE_RUST_SERDE)			+= rust_serde.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/local_data_format/de.rs b/samples/rust/local_data_format/de.rs
new file mode 100644
index 000000000000..32cfc53f98b3
--- /dev/null
+++ b/samples/rust/local_data_format/de.rs
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use super::error::{Error, Result};
+use serde::de::{self, Deserialize, DeserializeSeed, SeqAccess, Visitor};
+
+pub struct Deserializer<'de> {
+    // This string starts with the input data and characters are truncated off
+    // the beginning as data is parsed.
+    input: &'de [u8],
+}
+
+impl<'de> Deserializer<'de> {
+    // By convention, `Deserializer` constructors are named like `from_xyz`.
+    // That way basic use cases are satisfied by something like
+    // `serde_json::from_str(...)` while advanced use cases that require a
+    // deserializer can make one with `serde_json::Deserializer::from_str(...)`.
+    #[allow(clippy::should_implement_trait)]
+    pub fn from_bytes(input: &'de [u8]) -> Self {
+        Deserializer { input }
+    }
+}
+
+// By convention, the public API of a Serde deserializer is one or more
+// `from_xyz` methods such as `from_str`, `from_bytes`, or `from_reader`
+// depending on what Rust types the deserializer is able to consume as input.
+//
+// This basic deserializer supports only `from_str`.
+pub fn from_bytes<'a, T>(s: &'a [u8]) -> Result<T>
+where
+    T: Deserialize<'a>,
+{
+    let mut deserializer = Deserializer::from_bytes(s);
+    let t = T::deserialize(&mut deserializer)?;
+    if deserializer.input.is_empty() {
+        Ok(t)
+    } else {
+        Err(Error::TrailingCharacters)
+    }
+}
+
+// SERDE IS NOT A PARSING LIBRARY. This impl block defines a few basic parsing
+// functions from scratch. More complicated formats may wish to use a dedicated
+// parsing library to help implement their Serde deserializer.
+impl<'de> Deserializer<'de> {
+    // Look at the first character in the input without consuming it.
+    fn peek_byte(&mut self) -> Result<u8> {
+        self.input.iter().next().ok_or(Error::Eof).map(|v| *v)
+    }
+
+    // Consume the first character in the input.
+    fn next_byte(&mut self) -> Result<u8> {
+        let ch = self.peek_byte()?;
+        self.input = &self.input[1..];
+        Ok(ch)
+    }
+
+    // Parse the JSON identifier `true` or `false`.
+    fn parse_bool(&mut self) -> Result<bool> {
+        if self.input.starts_with(&[1]) {
+            self.input = &self.input[1..];
+            match self.next_byte()? {
+                42 => Ok(false),
+                43 => Ok(true),
+                _ => Err(Error::InvalidBooleanValue),
+            }
+        } else {
+            Err(Error::ExpectedBoolean)
+        }
+    }
+
+    // Parse a group of decimal digits as an unsigned integer of type T.
+    //
+    // This implementation is a bit too lenient, for example `001` is not
+    // allowed in JSON. Also the various arithmetic operations can overflow and
+    // panic or return bogus data. But it is good enough for example code!
+    fn parse_unsigned<T>(&mut self) -> Result<T> {
+        unimplemented!()
+    }
+
+    // Parse a possible minus sign followed by a group of decimal digits as a
+    // signed integer of type T.
+    fn parse_signed<T>(&mut self) -> Result<T> {
+        // Optional minus sign, delegate to `parse_unsigned`, negate if negative.
+        unimplemented!()
+    }
+}
+
+impl<'de, 'a> de::Deserializer<'de> for &'a mut Deserializer<'de> {
+    type Error = Error;
+
+    // Look at the input data to decide what Serde data model type to
+    // deserialize as. Not all data formats are able to support this operation.
+    // Formats that support `deserialize_any` are known as self-describing.
+    fn deserialize_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match self.peek_byte()? {
+            0 => self.deserialize_unit(visitor),
+            1 => self.deserialize_bool(visitor),
+            2 => self.deserialize_map(visitor),
+            _ => Err(Error::Syntax),
+        }
+    }
+
+    // Uses the `parse_bool` parsing function defined above to read the JSON
+    // identifier `true` or `false` from the input.
+    //
+    // Parsing refers to looking at the input and deciding that it contains the
+    // JSON value `true` or `false`.
+    //
+    // Deserialization refers to mapping that JSON value into Serde's data
+    // model by invoking one of the `Visitor` methods. In the case of JSON and
+    // bool that mapping is straightforward so the distinction may seem silly,
+    // but in other cases Deserializers sometimes perform non-obvious mappings.
+    // For example the TOML format has a Datetime type and Serde's data model
+    // does not. In the `toml` crate, a Datetime in the input is deserialized by
+    // mapping it to a Serde data model "struct" type with a special name and a
+    // single field containing the Datetime represented as a string.
+    fn deserialize_bool<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_bool(self.parse_bool()?)
+    }
+
+    // The `parse_signed` function is generic over the integer type `T` so here
+    // it is invoked with `T=i8`. The next 8 methods are similar.
+    fn deserialize_i8<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i8(self.parse_signed()?)
+    }
+
+    fn deserialize_i16<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i16(self.parse_signed()?)
+    }
+
+    fn deserialize_i32<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i32(self.parse_signed()?)
+    }
+
+    fn deserialize_i64<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_i64(self.parse_signed()?)
+    }
+
+    fn deserialize_u8<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u8(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u16<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u16(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u32<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u32(self.parse_unsigned()?)
+    }
+
+    fn deserialize_u64<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_u64(self.parse_unsigned()?)
+    }
+
+    // The `Serializer` implementation on the previous page serialized chars as
+    // single-character strings so handle that representation here.
+    fn deserialize_char<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // Refer to the "Understanding deserializer lifetimes" page for information
+    // about the three deserialization flavors of strings in Serde.
+    fn deserialize_str<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    fn deserialize_string<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // The `Serializer` implementation on the previous page serialized byte
+    // arrays as JSON arrays of bytes. Handle that representation here.
+    fn deserialize_bytes<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    fn deserialize_byte_buf<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // An absent optional is represented as the JSON `null` and a present
+    // optional is represented as just the contained value.
+    //
+    // As commented in `Serializer` implementation, this is a lossy
+    // representation. For example the values `Some(())` and `None` both
+    // serialize as just `null`. Unfortunately this is typically what people
+    // expect when working with JSON. Other formats are encouraged to behave
+    // more intelligently if possible.
+    fn deserialize_option<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // In Serde, unit means an anonymous value containing no data.
+    fn deserialize_unit<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        if self.input.starts_with(&[0]) {
+            self.input = &self.input[1..];
+            visitor.visit_unit()
+        } else {
+            Err(Error::ExpectedNull)
+        }
+    }
+
+    // Unit struct means a named value containing no data.
+    fn deserialize_unit_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_unit(visitor)
+    }
+
+    // As is done here, serializers are encouraged to treat newtype structs as
+    // insignificant wrappers around the data they contain. That means not
+    // parsing anything other than the contained value.
+    fn deserialize_newtype_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_newtype_struct(self)
+    }
+
+    // Deserialization of compound types like sequences and maps happens by
+    // passing the visitor an "Access" object that gives it the ability to
+    // iterate through the data contained in the sequence.
+    fn deserialize_seq<V>(self, _visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // Tuples look just like sequences in JSON. Some formats may be able to
+    // represent tuples more efficiently.
+    //
+    // As indicated by the length parameter, the `Deserialize` implementation
+    // for a tuple in the Serde data model is required to know the length of the
+    // tuple before even looking at the input data.
+    fn deserialize_tuple<V>(self, _len: usize, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    // Tuple structs look just like sequences in JSON.
+    fn deserialize_tuple_struct<V>(
+        self,
+        _name: &'static str,
+        _len: usize,
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    // Much like `deserialize_seq` but calls the visitors `visit_map` method
+    // with a `MapAccess` implementation, rather than the visitor's `visit_seq`
+    // method with a `SeqAccess` implementation.
+    fn deserialize_map<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        // Parse the opening brace of the map.
+        if self.next_byte()? == 2 {
+            // Give the visitor access to each entry of the map.
+            let value = visitor.visit_seq(StructFieldsVisitor::new(self))?;
+            // Parse the closing brace of the map.
+            if self.next_byte()? == 3 {
+                Ok(value)
+            } else {
+                Err(Error::ExpectedMapEnd)
+            }
+        } else {
+            Err(Error::ExpectedMap)
+        }
+    }
+
+    // Structs look just like maps in JSON.
+    //
+    // Notice the `fields` parameter - a "struct" in the Serde data model means
+    // that the `Deserialize` implementation is required to know what the fields
+    // are before even looking at the input data. Any key-value pairing in which
+    // the fields cannot be known ahead of time is probably a map.
+    fn deserialize_struct<V>(
+        self,
+        _name: &'static str,
+        _fields: &'static [&'static str],
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_map(visitor)
+    }
+
+    fn deserialize_enum<V>(
+        self,
+        _name: &'static str,
+        _variants: &'static [&'static str],
+        _visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        unimplemented!()
+    }
+
+    // An identifier in Serde is the type that identifies a field of a struct or
+    // the variant of an enum. In JSON, struct fields and enum variants are
+    // represented as strings. In other formats they may be represented as
+    // numeric indices.
+    fn deserialize_identifier<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_str(visitor)
+    }
+
+    // Like `deserialize_any` but indicates to the `Deserializer` that it makes
+    // no difference which `Visitor` method is called because the data is
+    // ignored.
+    //
+    // Some deserializers are able to implement this more efficiently than
+    // `deserialize_any`, for example by rapidly skipping over matched
+    // delimiters without paying close attention to the data in between.
+    //
+    // Some formats are not able to implement this at all. Formats that can
+    // implement `deserialize_any` and `deserialize_ignored_any` are known as
+    // self-describing.
+    fn deserialize_ignored_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_any(visitor)
+    }
+}
+
+struct StructFieldsVisitor<'a, 'de> {
+    de: &'a mut Deserializer<'de>,
+}
+
+impl<'a, 'de> StructFieldsVisitor<'a, 'de> {
+    fn new(de: &'a mut Deserializer<'de>) -> Self {
+        StructFieldsVisitor { de }
+    }
+}
+
+impl<'de, 'a> SeqAccess<'de> for StructFieldsVisitor<'a, 'de> {
+    type Error = Error;
+
+    fn next_element_seed<T>(&mut self, seed: T) -> Result<Option<T::Value>>
+    where
+        T: DeserializeSeed<'de>,
+    {
+        // Check if there are no more elements.
+        if self.de.peek_byte()? == 3 {
+            return Ok(None);
+        }
+        // Deserialize an array element.
+        seed.deserialize(&mut *self.de).map(Some)
+    }
+}
diff --git a/samples/rust/local_data_format/error.rs b/samples/rust/local_data_format/error.rs
new file mode 100644
index 000000000000..8d913580f713
--- /dev/null
+++ b/samples/rust/local_data_format/error.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use core::fmt::{self, Display};
+use serde::{de, ser};
+
+pub type Result<T> = kernel::error::Result<T, Error>;
+
+// This is a bare-bones implementation. A real library would provide additional
+// information in its error type, for example the line and column at which the
+// error occurred, the byte offset into the input, or the current key being
+// processed.
+#[derive(Debug)]
+pub enum Error {
+    // One or more variants that can be created by data structures through the
+    // `ser::Error` and `de::Error` traits. For example the Serialize impl for
+    // Mutex<T> might return an error because the mutex is poisoned, or the
+    // Deserialize impl for a struct may return an error because a required
+    // field is missing.
+    Message,
+
+    // Zero or more variants that can be created directly by the Serializer and
+    // Deserializer without going through `ser::Error` and `de::Error`. These
+    // are specific to the format, in this case JSON.
+    Eof,
+    Syntax,
+    ExpectedBoolean,
+    InvalidBooleanValue,
+    ExpectedInteger,
+    ExpectedString,
+    ExpectedNull,
+    ExpectedArray,
+    ExpectedArrayComma,
+    ExpectedArrayEnd,
+    ExpectedMap,
+    ExpectedMapColon,
+    ExpectedMapComma,
+    ExpectedMapEnd,
+    ExpectedEnum,
+    TrailingCharacters,
+}
+
+impl ser::Error for Error {
+    fn custom<T: Display>(_msg: T) -> Self {
+        Error::Message
+    }
+}
+
+impl de::Error for Error {
+    fn custom<T: Display>(_msg: T) -> Self {
+        Error::Message
+    }
+}
+
+impl Display for Error {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Error::Message => write!(f, "message"),
+            Error::Eof => f.write_str("unexpected end of input"),
+            /* and so forth */
+            _ => unimplemented!(),
+        }
+    }
+}
+
+//impl core::error::Error for Error {}
diff --git a/samples/rust/local_data_format/ser.rs b/samples/rust/local_data_format/ser.rs
new file mode 100644
index 000000000000..f4f17eb6da66
--- /dev/null
+++ b/samples/rust/local_data_format/ser.rs
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+// Copyright 2018 Serde Developers
+//
+// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
+// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
+// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
+// option. This file may not be copied, modified, or distributed
+// except according to those terms.
+
+use super::error::{Error, Result};
+use alloc::vec::Vec;
+use serde::ser::{self, Serialize};
+
+pub struct Serializer {
+    // This string starts empty and JSON is appended as values are serialized.
+    output: Vec<u8>,
+}
+
+// By convention, the public API of a Serde serializer is one or more `to_abc`
+// functions such as `to_string`, `to_bytes`, or `to_writer` depending on what
+// Rust types the serializer is able to produce as output.
+//
+// This basic serializer supports only `to_string`.
+pub fn to_vec<T>(value: &T) -> Result<Vec<u8>>
+where
+    T: Serialize,
+{
+    let mut serializer = Serializer { output: Vec::new() };
+    value.serialize(&mut serializer)?;
+    Ok(serializer.output)
+}
+
+impl<'a> ser::Serializer for &'a mut Serializer {
+    // The output type produced by this `Serializer` during successful
+    // serialization. Most serializers that produce text or binary output should
+    // set `Ok = ()` and serialize into an `io::Write` or buffer contained
+    // within the `Serializer` instance, as happens here. Serializers that build
+    // in-memory data structures may be simplified by using `Ok` to propagate
+    // the data structure around.
+    type Ok = ();
+
+    // The error type when some error occurs during serialization.
+    type Error = Error;
+
+    // Associated types for keeping track of additional state while serializing
+    // compound data structures like sequences and maps. In this case no
+    // additional state is required beyond what is already stored in the
+    // Serializer struct.
+    type SerializeSeq = Self;
+    type SerializeTuple = Self;
+    type SerializeTupleStruct = Self;
+    type SerializeTupleVariant = Self;
+    type SerializeMap = Self;
+    type SerializeStruct = Self;
+    type SerializeStructVariant = Self;
+
+    // Here we go with the simple methods. The following 12 methods receive one
+    // of the primitive types of the data model and map it to JSON by appending
+    // into the output string.
+    fn serialize_bool(self, v: bool) -> Result<()> {
+        self.output.try_push(1).unwrap();
+        self.output.try_push(if v { 43 } else { 42 }).unwrap();
+        Ok(())
+    }
+
+    // JSON does not distinguish between different sizes of integers, so all
+    // signed integers will be serialized the same and all unsigned integers
+    // will be serialized the same. Other formats, especially compact binary
+    // formats, may need independent logic for the different sizes.
+    fn serialize_i8(self, v: i8) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    fn serialize_i16(self, v: i16) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    fn serialize_i32(self, v: i32) -> Result<()> {
+        self.serialize_i64(i64::from(v))
+    }
+
+    // Not particularly efficient but this is example code anyway. A more
+    // performant approach would be to use the `itoa` crate.
+    fn serialize_i64(self, _v: i64) -> Result<()> {
+        unimplemented!();
+    }
+
+    fn serialize_u8(self, v: u8) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u16(self, v: u16) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u32(self, v: u32) -> Result<()> {
+        self.serialize_u64(u64::from(v))
+    }
+
+    fn serialize_u64(self, _v: u64) -> Result<()> {
+        unimplemented!();
+    }
+
+    // Serialize a char as a single-character string. Other formats may
+    // represent this differently.
+    fn serialize_char(self, _v: char) -> Result<()> {
+        unimplemented!();
+    }
+
+    // This only works for strings that don't require escape sequences but you
+    // get the idea. For example it would emit invalid JSON if the input string
+    // contains a '"' character.
+    fn serialize_str(self, _v: &str) -> Result<()> {
+        unimplemented!();
+    }
+
+    // Serialize a byte array as an array of bytes. Could also use a base64
+    // string here. Binary formats will typically represent byte arrays more
+    // compactly.
+    fn serialize_bytes(self, v: &[u8]) -> Result<()> {
+        use serde::ser::SerializeSeq;
+        let mut seq = self.serialize_seq(Some(v.len()))?;
+        for byte in v {
+            seq.serialize_element(byte)?;
+        }
+        seq.end()
+    }
+
+    // An absent optional is represented as the JSON `null`.
+    fn serialize_none(self) -> Result<()> {
+        self.serialize_unit()
+    }
+
+    // A present optional is represented as just the contained value. Note that
+    // this is a lossy representation. For example the values `Some(())` and
+    // `None` both serialize as just `null`. Unfortunately this is typically
+    // what people expect when working with JSON. Other formats are encouraged
+    // to behave more intelligently if possible.
+    fn serialize_some<T>(self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    // In Serde, unit means an anonymous value containing no data. Map this to
+    // JSON as `null`.
+    fn serialize_unit(self) -> Result<()> {
+        self.output.try_push(0).unwrap();
+        Ok(())
+    }
+
+    // Unit struct means a named value containing no data. Again, since there is
+    // no data, map this to JSON as `null`. There is no need to serialize the
+    // name in most formats.
+    fn serialize_unit_struct(self, _name: &'static str) -> Result<()> {
+        self.serialize_unit()
+    }
+
+    // When serializing a unit variant (or any other kind of variant), formats
+    // can choose whether to keep track of it by index or by name. Binary
+    // formats typically use the index of the variant and human-readable formats
+    // typically use the name.
+    fn serialize_unit_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+    ) -> Result<()> {
+        self.serialize_str(variant)
+    }
+
+    // As is done here, serializers are encouraged to treat newtype structs as
+    // insignificant wrappers around the data they contain.
+    fn serialize_newtype_struct<T>(self, _name: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    // Note that newtype variant (and all of the other variant serialization
+    // methods) refer exclusively to the "externally tagged" enum
+    // representation.
+    //
+    // Serialize this to JSON in externally tagged form as `{ NAME: VALUE }`.
+    fn serialize_newtype_variant<T>(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _value: &T,
+    ) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    // Now we get to the serialization of compound types.
+    //
+    // The start of the sequence, each value, and the end are three separate
+    // method calls. This one is responsible only for serializing the start,
+    // which in JSON is `[`.
+    //
+    // The length of the sequence may or may not be known ahead of time. This
+    // doesn't make a difference in JSON because the length is not represented
+    // explicitly in the serialized form. Some serializers may only be able to
+    // support sequences for which the length is known up front.
+    fn serialize_seq(self, _len: Option<usize>) -> Result<Self::SerializeSeq> {
+        unimplemented!();
+    }
+
+    // Tuples look just like sequences in JSON. Some formats may be able to
+    // represent tuples more efficiently by omitting the length, since tuple
+    // means that the corresponding `Deserialize implementation will know the
+    // length without needing to look at the serialized data.
+    fn serialize_tuple(self, len: usize) -> Result<Self::SerializeTuple> {
+        self.serialize_seq(Some(len))
+    }
+
+    // Tuple structs look just like sequences in JSON.
+    fn serialize_tuple_struct(
+        self,
+        _name: &'static str,
+        len: usize,
+    ) -> Result<Self::SerializeTupleStruct> {
+        self.serialize_seq(Some(len))
+    }
+
+    // Tuple variants are represented in JSON as `{ NAME: [DATA...] }`. Again
+    // this method is only responsible for the externally tagged representation.
+    fn serialize_tuple_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeTupleVariant> {
+        unimplemented!();
+    }
+
+    // Maps are represented in JSON as `{ K: V, K: V, ... }`.
+    fn serialize_map(self, _len: Option<usize>) -> Result<Self::SerializeMap> {
+        self.output.try_push(2).unwrap();
+        Ok(self)
+    }
+
+    // Structs look just like maps in JSON. In particular, JSON requires that we
+    // serialize the field names of the struct. Other formats may be able to
+    // omit the field names when serializing structs because the corresponding
+    // Deserialize implementation is required to know what the keys are without
+    // looking at the serialized data.
+    fn serialize_struct(self, _name: &'static str, len: usize) -> Result<Self::SerializeStruct> {
+        self.serialize_map(Some(len))
+    }
+
+    // Struct variants are represented in JSON as `{ NAME: { K: V, ... } }`.
+    // This is the externally tagged representation.
+    fn serialize_struct_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeStructVariant> {
+        unimplemented!();
+    }
+
+    fn collect_str<T: ?Sized>(self, _: &T) -> Result<()>
+    where
+        T: core::fmt::Display,
+    {
+        unimplemented!()
+    }
+}
+
+// The following 7 impls deal with the serialization of compound types like
+// sequences and maps. Serialization of such types is begun by a Serializer
+// method and followed by zero or more calls to serialize individual elements of
+// the compound type and one call to end the compound type.
+//
+// This impl is SerializeSeq so these methods are called after `serialize_seq`
+// is called on the Serializer.
+impl<'a> ser::SerializeSeq for &'a mut Serializer {
+    // Must match the `Ok` type of the serializer.
+    type Ok = ();
+    // Must match the `Error` type of the serializer.
+    type Error = Error;
+
+    // Serialize a single element of the sequence.
+    fn serialize_element<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    // Close the sequence.
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Same thing but for tuples.
+impl<'a> ser::SerializeTuple for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_element<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Same thing but for tuple structs.
+impl<'a> ser::SerializeTupleStruct for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Tuple variants are a little different. Refer back to the
+// `serialize_tuple_variant` method above:
+//
+//    self.output += "{";
+//    variant.serialize(&mut *self)?;
+//    self.output += ":[";
+//
+// So the `end` method in this impl is responsible for closing both the `]` and
+// the `}`.
+impl<'a> ser::SerializeTupleVariant for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
+
+// Some `Serialize` types are not able to hold a key and value in memory at the
+// same time so `SerializeMap` implementations are required to support
+// `serialize_key` and `serialize_value` individually.
+//
+// There is a third optional method on the `SerializeMap` trait. The
+// `serialize_entry` method allows serializers to optimize for the case where
+// key and value are both available simultaneously. In JSON it doesn't make a
+// difference so the default behavior for `serialize_entry` is fine.
+impl<'a> ser::SerializeMap for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    // The Serde data model allows map keys to be any serializable type. JSON
+    // only allows string keys so the implementation below will produce invalid
+    // JSON if the key serializes as something other than a string.
+    //
+    // A real JSON serializer would need to validate that map keys are strings.
+    // This can be done by using a different Serializer to serialize the key
+    // (instead of `&mut **self`) and having that other serializer only
+    // implement `serialize_str` and return an error on any other data type.
+    fn serialize_key<T>(&mut self, _key: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!()
+    }
+
+    // It doesn't make a difference whether the colon is printed at the end of
+    // `serialize_key` or at the beginning of `serialize_value`. In this case
+    // the code is a bit simpler having it here.
+    fn serialize_value<T>(&mut self, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!()
+    }
+
+    fn end(self) -> Result<()> {
+        self.output.try_push(3).unwrap();
+        Ok(())
+    }
+}
+
+// Structs are like maps in which the keys are constrained to be compile-time
+// constant strings.
+impl<'a> ser::SerializeStruct for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _key: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(&mut **self)
+    }
+
+    fn end(self) -> Result<()> {
+        self.output.try_push(3).unwrap();
+        Ok(())
+    }
+}
+
+// Similar to `SerializeTupleVariant`, here the `end` method is responsible for
+// closing both of the curly braces opened by `serialize_struct_variant`.
+impl<'a> ser::SerializeStructVariant for &'a mut Serializer {
+    type Ok = ();
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, _key: &'static str, _value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        unimplemented!();
+    }
+
+    fn end(self) -> Result<()> {
+        unimplemented!();
+    }
+}
diff --git a/samples/rust/rust_serde.rs b/samples/rust/rust_serde.rs
new file mode 100644
index 000000000000..3d4957dd0822
--- /dev/null
+++ b/samples/rust/rust_serde.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust `serde` sample.
+//!
+//! It uses a data format from the `kernel` crate, as well as defining
+//! one here ("local"). Then it uses both on a type that uses `serve_derive`.
+
+use kernel::prelude::*;
+use serde_derive::{Deserialize, Serialize};
+
+module! {
+    type: RustSerde,
+    name: "rust_serde",
+    author: "Rust for Linux Contributors",
+    description: "Rust `serde` sample",
+    license: "GPL",
+}
+
+struct RustSerde;
+
+pub mod local_data_format {
+    #![allow(missing_docs)]
+
+    mod de;
+    mod error;
+    mod ser;
+
+    pub use de::{from_bytes, Deserializer};
+    pub use error::{Error, Result};
+    pub use ser::{to_vec, Serializer};
+}
+
+#[derive(Serialize, Deserialize, Debug)]
+struct S {
+    a: (),
+    b: bool,
+    c: bool,
+    d: (),
+}
+
+impl kernel::Module for RustSerde {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust serde sample (init)\n");
+
+        let original = S {
+            a: (),
+            b: false,
+            c: true,
+            d: (),
+        };
+        crate::pr_info!("            original = {:?}", original);
+
+        let serialized = kernel::test_serde::to_vec(&original).unwrap();
+        crate::pr_info!("          serialized = {:?}", serialized);
+
+        let deserialized: S = kernel::test_serde::from_bytes(&serialized).unwrap();
+        crate::pr_info!("        deserialized = {:?}", deserialized);
+
+        let serialized = local_data_format::to_vec(&deserialized).unwrap();
+        crate::pr_info!("  serialized (local) = {:?}", serialized);
+
+        let deserialized: S = local_data_format::from_bytes(&serialized).unwrap();
+        crate::pr_info!("deserialized (local) = {:?}", deserialized);
+
+        Ok(RustSerde)
+    }
+}
+
+impl Drop for RustSerde {
+    fn drop(&mut self) {
+        pr_info!("Rust serde sample (exit)\n");
+    }
+}
-- 
2.40.1

