Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48152C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjFIGyo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbjFIGyl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:41 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB85358C
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8316; q=dns/txt; s=iport;
  t=1686293668; x=1687503268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ajNzV3x4Aj/ehnkEt4kXsqLaG/100gpOMWxNtovFyx4=;
  b=bvXrRzTIiuREppvZgnrkkAQPh8ikW6WbMCSXL7oEbN/gbudGW1HIyCCz
   lKY/XPAdWtKgczwGJ5Kb/xPzodHGM0xxlRmuUxC+fI3KWl1UL1f6yP24i
   8+riSxUtbc+Kxoc0nc+i6Gtrmawr2uJP5mEoJdDNiDFwUHPiuFpaJq+Pv
   s=;
X-IPAS-Result: =?us-ascii?q?A0BOAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IV?=
 =?us-ascii?q?Z1rgX4PAQEBDQEBMRMEAQGFBgKFdSY1CA4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?QEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAycLAUYQIDFXGYJ+AYJcA60Zg?=
 =?us-ascii?q?XkzgQGEdZprgWiBQowWhUpCgUlEglGCLYJLiDsEji+PKIEpb4EeOWl/AgkCE?=
 =?us-ascii?q?WeBCghcgXNAAg1UCwtjgR2CVQICETwUUmIZHQMHBAKBBRAvBwQyKAYJGC8nB?=
 =?us-ascii?q?lMHFxYkCRMVQgSDWQqBEEAVDhGCXCoCPW8DCQMHBUlAAwsYDUgRLDUUHwZDg?=
 =?us-ascii?q?QcXY4F8JCSeRoMNexSCaD2SOY8MghWgKoQSi3yVBBozhVejfi6HOZAvo12EL?=
 =?us-ascii?q?wIEBgUCFoFkATiBWzMaCBsVgyIJSRkPjjmJcIlnQTE7AgcLAQEDCYtGAQE?=
IronPort-Data: A9a23:8puWvar9tRvqoLV/jH0rfToiWTReBmJjZRIvgKrLsJaIsI4StFCzt
 garIBnXa/6PYDf3L4slbNu09E8A6MTcy95nSAZopH9mFHgU8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILas1htZG0k8EE/NtTo5w7Ri2tAw0YDia++wk
 YqaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9AvY12O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/RPjnRa70o1CBYTQRd52geIxfNb9
 NVqjb+8WwZ0J/XQhd1IBnG0EwkmVUFH0LbKOz20ttaeihCAeHr3yPIoB0YzVWEa0r8oWicVp
 bpCcGtLNErra+GemNpXTsFlg8UoMc3iJ6sUu2prynfSCvNOrZXrHv+QvYIFjV/cgOhfI/ryW
 /BJMAE1aTDrcjdiCFk9FL4hybLAan7XKm0E9w39SbAMy2/RwQB4+LvgKtzYfpqNX8o9tlyFv
 X6D8WPjRxUbMsGP4SSK/2jqheLVmy7/HoUIG9WFGuVCiVCJg20LDwcKEF2yvb+yi1W1XJRUL
 El8FjcSQbYapGL6fNinfDeEoFm8nRIOWodJS/En0VTYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mNlefu0VVSDV5XIFRqgGqeoQSCaZHJOcz5SDcMQZVZfuoOyyG0mpkiXJuuPBpJZmfXTPVkcK
 RijqC0znbhbttIC281XFnie2GvxznQlZiAx6xvQWmuj4mtEiG+Zi26AtAKzARVoddjxory9U
 J4swJH2AAcmV8vlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk5bJxYKGeyM
 BKC42u9AaO/2lP0NsebhKrsW6wXIVTITrwJq9iNNIMVO8gtHON51Hg3NRX4M5/RfLgEyPFjZ
 sjznTeEBncBAqMv1yutW+oYytcWKtMWmwvuqWTA503/i9K2PSfNIZ9caQvmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJdglXdSVlXM+pwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:AKPj36MZ83zbJsBcTu6jsMiBIKoaSvp037Dk7SxMoHtuA6ilfq
 +V8sjzuSWftN9VYgBCpTniAtjkfZqjz/9ICOAqVN/IYOClghrLEGgI1+TfKlPbdhHWx6p0yb
 pgf69iCNf5EFR2yfrh7BLQKadG/DD+ysCVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:Kg6Xr2zhS6hALNcRuJUEBgVENJEXcyf+5kvQBHebBXRoFaTNVUKprfY=
X-Talos-MUID: 9a23:b9mFzApzvJb1ySYgUrYezyBcOOtU2fT3MxoItb4XkeS2OwZsFyjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220559"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:46 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDO055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:45 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 30/80] rust: serde: add `no_fp_fmt_parse` support
Date:   Fri,  9 Jun 2023 09:30:28 +0300
Message-Id: <20230609063118.24852-31-amiculas@cisco.com>
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

We do not have formatting for floating point in the kernel,
thus simple compile out all that.

Probably we should name it differently, more similar to `integer128`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/serde/de/ignored_any.rs |  1 +
 rust/serde/de/impls.rs       |  2 ++
 rust/serde/de/mod.rs         | 16 ++++++++++++++--
 rust/serde/de/value.rs       |  2 ++
 rust/serde/private/ser.rs    |  4 ++++
 rust/serde/ser/fmt.rs        |  8 ++++++--
 rust/serde/ser/impls.rs      |  2 ++
 rust/serde/ser/mod.rs        |  2 ++
 8 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/rust/serde/de/ignored_any.rs b/rust/serde/de/ignored_any.rs
index 9ed438e79795..7b65792e77c0 100644
--- a/rust/serde/de/ignored_any.rs
+++ b/rust/serde/de/ignored_any.rs
@@ -152,6 +152,7 @@ fn visit_u128<E>(self, x: u128) -> Result<Self::Value, E> {
         }
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     #[inline]
     fn visit_f64<E>(self, x: f64) -> Result<Self::Value, E> {
         let _ = x;
diff --git a/rust/serde/de/impls.rs b/rust/serde/de/impls.rs
index a2e2c4856df3..002bbf74d65b 100644
--- a/rust/serde/de/impls.rs
+++ b/rust/serde/de/impls.rs
@@ -350,6 +350,7 @@ fn $visit<E>(self, v: $ty) -> Result<Self::Value, E>
     uint_to_self!(u32:visit_u32 u64:visit_u64);
 }
 
+#[cfg(not(no_fp_fmt_parse))]
 impl_deserialize_num! {
     f32, deserialize_f32
     num_self!(f32:visit_f32);
@@ -358,6 +359,7 @@ fn $visit<E>(self, v: $ty) -> Result<Self::Value, E>
     num_as_self!(u8:visit_u8 u16:visit_u16 u32:visit_u32 u64:visit_u64);
 }
 
+#[cfg(not(no_fp_fmt_parse))]
 impl_deserialize_num! {
     f64, deserialize_f64
     num_self!(f64:visit_f64);
diff --git a/rust/serde/de/mod.rs b/rust/serde/de/mod.rs
index ca29ec610bfb..017964f0d0d0 100644
--- a/rust/serde/de/mod.rs
+++ b/rust/serde/de/mod.rs
@@ -344,6 +344,7 @@ pub enum Unexpected<'a> {
 
     /// The input contained a floating point `f32` or `f64` that was not
     /// expected.
+    #[cfg(not(no_fp_fmt_parse))]
     Float(f64),
 
     /// The input contained a `char` that was not expected.
@@ -400,6 +401,7 @@ fn fmt(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
             Bool(b) => write!(formatter, "boolean `{}`", b),
             Unsigned(i) => write!(formatter, "integer `{}`", i),
             Signed(i) => write!(formatter, "integer `{}`", i),
+            #[cfg(not(no_fp_fmt_parse))]
             Float(f) => write!(formatter, "floating point `{}`", f),
             Char(c) => write!(formatter, "character `{}`", c),
             Str(s) => write!(formatter, "string {:?}", s),
@@ -996,12 +998,20 @@ fn deserialize_u128<V>(self, visitor: V) -> Result<V::Value, Self::Error>
     /// Hint that the `Deserialize` type is expecting a `f32` value.
     fn deserialize_f32<V>(self, visitor: V) -> Result<V::Value, Self::Error>
     where
-        V: Visitor<'de>;
+        V: Visitor<'de>
+    {
+        let _ = visitor;
+        Err(Error::custom("f32 is not supported"))
+    }
 
     /// Hint that the `Deserialize` type is expecting a `f64` value.
     fn deserialize_f64<V>(self, visitor: V) -> Result<V::Value, Self::Error>
     where
-        V: Visitor<'de>;
+        V: Visitor<'de>
+    {
+        let _ = visitor;
+        Err(Error::custom("f64 is not supported"))
+    }
 
     /// Hint that the `Deserialize` type is expecting a `char` value.
     fn deserialize_char<V>(self, visitor: V) -> Result<V::Value, Self::Error>
@@ -1446,6 +1456,7 @@ fn visit_u128<E>(self, v: u128) -> Result<Self::Value, E>
     /// The default implementation forwards to [`visit_f64`].
     ///
     /// [`visit_f64`]: #method.visit_f64
+    #[cfg(not(no_fp_fmt_parse))]
     fn visit_f32<E>(self, v: f32) -> Result<Self::Value, E>
     where
         E: Error,
@@ -1456,6 +1467,7 @@ fn visit_f32<E>(self, v: f32) -> Result<Self::Value, E>
     /// The input contains an `f64`.
     ///
     /// The default implementation fails with a type error.
+    #[cfg(not(no_fp_fmt_parse))]
     fn visit_f64<E>(self, v: f64) -> Result<Self::Value, E>
     where
         E: Error,
diff --git a/rust/serde/de/value.rs b/rust/serde/de/value.rs
index 5d88862159b8..d847b8ec071c 100644
--- a/rust/serde/de/value.rs
+++ b/rust/serde/de/value.rs
@@ -298,7 +298,9 @@ fn fmt(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
 primitive_deserializer!(u16, "a `u16`.", U16Deserializer, visit_u16);
 primitive_deserializer!(u64, "a `u64`.", U64Deserializer, visit_u64);
 primitive_deserializer!(usize, "a `usize`.", UsizeDeserializer, visit_u64 as u64);
+#[cfg(not(no_fp_fmt_parse))]
 primitive_deserializer!(f32, "an `f32`.", F32Deserializer, visit_f32);
+#[cfg(not(no_fp_fmt_parse))]
 primitive_deserializer!(f64, "an `f64`.", F64Deserializer, visit_f64);
 primitive_deserializer!(char, "a `char`.", CharDeserializer, visit_char);
 
diff --git a/rust/serde/private/ser.rs b/rust/serde/private/ser.rs
index 528e8c125a39..fc9e7e6d7426 100644
--- a/rust/serde/private/ser.rs
+++ b/rust/serde/private/ser.rs
@@ -46,6 +46,7 @@ struct TaggedSerializer<S> {
 enum Unsupported {
     Boolean,
     Integer,
+    #[cfg(not(no_fp_fmt_parse))]
     Float,
     Char,
     String,
@@ -64,6 +65,7 @@ fn fmt(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
         match *self {
             Unsupported::Boolean => formatter.write_str("a boolean"),
             Unsupported::Integer => formatter.write_str("an integer"),
+            #[cfg(not(no_fp_fmt_parse))]
             Unsupported::Float => formatter.write_str("a float"),
             Unsupported::Char => formatter.write_str("a char"),
             Unsupported::String => formatter.write_str("a string"),
@@ -150,10 +152,12 @@ fn serialize_u64(self, _: u64) -> Result<Self::Ok, Self::Error> {
         Err(self.bad_type(Unsupported::Integer))
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f32(self, _: f32) -> Result<Self::Ok, Self::Error> {
         Err(self.bad_type(Unsupported::Float))
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f64(self, _: f64) -> Result<Self::Ok, Self::Error> {
         Err(self.bad_type(Unsupported::Float))
     }
diff --git a/rust/serde/ser/fmt.rs b/rust/serde/ser/fmt.rs
index e7e09a1bfe94..94c3054fe36b 100644
--- a/rust/serde/ser/fmt.rs
+++ b/rust/serde/ser/fmt.rs
@@ -55,13 +55,17 @@ impl<'a, 'b> Serializer for &'a mut fmt::Formatter<'b> {
         serialize_u16: u16,
         serialize_u32: u32,
         serialize_u64: u64,
-        serialize_f32: f32,
-        serialize_f64: f64,
         serialize_char: char,
         serialize_str: &str,
         serialize_unit_struct: &'static str,
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
+    fmt_primitives! {
+        serialize_f32: f32,
+        serialize_f64: f64,
+    }
+
     serde_if_integer128! {
         fmt_primitives! {
             serialize_i128: i128,
diff --git a/rust/serde/ser/impls.rs b/rust/serde/ser/impls.rs
index a79326e5c558..639e480e252d 100644
--- a/rust/serde/ser/impls.rs
+++ b/rust/serde/ser/impls.rs
@@ -29,7 +29,9 @@ fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
 primitive_impl!(u16, serialize_u16);
 primitive_impl!(u32, serialize_u32);
 primitive_impl!(u64, serialize_u64);
+#[cfg(not(no_fp_fmt_parse))]
 primitive_impl!(f32, serialize_f32);
+#[cfg(not(no_fp_fmt_parse))]
 primitive_impl!(f64, serialize_f64);
 primitive_impl!(char, serialize_char);
 
diff --git a/rust/serde/ser/mod.rs b/rust/serde/ser/mod.rs
index 5c45426e802e..13ea792c58ef 100644
--- a/rust/serde/ser/mod.rs
+++ b/rust/serde/ser/mod.rs
@@ -644,6 +644,7 @@ fn serialize_u128(self, v: u128) -> Result<Self::Ok, Self::Error> {
     ///     }
     /// }
     /// ```
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f32(self, v: f32) -> Result<Self::Ok, Self::Error>;
 
     /// Serialize an `f64` value.
@@ -662,6 +663,7 @@ fn serialize_u128(self, v: u128) -> Result<Self::Ok, Self::Error> {
     ///     }
     /// }
     /// ```
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f64(self, v: f64) -> Result<Self::Ok, Self::Error>;
 
     /// Serialize a character.
-- 
2.40.1

