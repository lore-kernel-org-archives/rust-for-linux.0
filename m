Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565D7C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbjFIG5D (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjFIG4i (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:38 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D212D7C
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4214; q=dns/txt; s=iport;
  t=1686293796; x=1687503396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qqSPWvUICblJ0RSuaDrTt6YeyEqWBIHxQhgiZQnNniY=;
  b=hM6XPJ43XILgw1T6vph8CZGSQC1g728hf2iWZ+Y++Gm7xoI/90TxEy2m
   zfpIVz3w7/wocdd9yeGi9/FMnMaO/4aqFoLk5+sQdnhkVT1XB9qmnGkKS
   AcGkQIw8hA/ygeuarb94zWfxcUh9+Oq0Wdm69IeL7w2SX/BSZwFAKO7r1
   E=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453680"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:49 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDY055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:48 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 40/80] rust: serde_cbor: add no_fp_fmt_parse support
Date:   Fri,  9 Jun 2023 09:30:38 +0300
Message-Id: <20230609063118.24852-41-amiculas@cisco.com>
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

We do not have formatting for floating point in the kernel,
thus simple compile out all that.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/serde_cbor/de.rs        | 8 ++++++++
 rust/serde_cbor/ser.rs       | 3 +++
 rust/serde_cbor/tags.rs      | 2 ++
 rust/serde_cbor/value/ser.rs | 2 ++
 4 files changed, 15 insertions(+)

diff --git a/rust/serde_cbor/de.rs b/rust/serde_cbor/de.rs
index 1c9a9acc8eb5..534f9d53aa3b 100644
--- a/rust/serde_cbor/de.rs
+++ b/rust/serde_cbor/de.rs
@@ -2,10 +2,12 @@
 
 //! Deserialization.
 
+#[cfg(not(no_fp_fmt_parse))]
 use core::f32;
 use core::marker::PhantomData;
 use core::result;
 use core::str;
+#[cfg(not(no_fp_fmt_parse))]
 use half::f16;
 use serde::de;
 #[cfg(feature = "std")]
@@ -566,14 +568,17 @@ fn parse_indefinite_enum<V>(&mut self, visitor: V) -> Result<V::Value>
         })
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     fn parse_f16(&mut self) -> Result<f32> {
         Ok(f32::from(f16::from_bits(self.parse_u16()?)))
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     fn parse_f32(&mut self) -> Result<f32> {
         self.parse_u32().map(|i| f32::from_bits(i))
     }
 
+    #[cfg(not(no_fp_fmt_parse))]
     fn parse_f64(&mut self) -> Result<f64> {
         self.parse_u64().map(|i| f64::from_bits(i))
     }
@@ -756,14 +761,17 @@ fn parse_value<V>(&mut self, visitor: V) -> Result<V::Value>
             0xf6 => visitor.visit_unit(),
             0xf7 => visitor.visit_unit(),
             0xf8 => Err(self.error(ErrorCode::UnassignedCode)),
+            #[cfg(not(no_fp_fmt_parse))]
             0xf9 => {
                 let value = self.parse_f16()?;
                 visitor.visit_f32(value)
             }
+            #[cfg(not(no_fp_fmt_parse))]
             0xfa => {
                 let value = self.parse_f32()?;
                 visitor.visit_f32(value)
             }
+            #[cfg(not(no_fp_fmt_parse))]
             0xfb => {
                 let value = self.parse_f64()?;
                 visitor.visit_f64(value)
diff --git a/rust/serde_cbor/ser.rs b/rust/serde_cbor/ser.rs
index 9f5bb67f0479..8c2273f9f544 100644
--- a/rust/serde_cbor/ser.rs
+++ b/rust/serde_cbor/ser.rs
@@ -10,6 +10,7 @@
 pub use crate::write::{SliceWrite, Write};
 
 use crate::error::{Error, Result};
+#[cfg(not(no_fp_fmt_parse))]
 use half::f16;
 use serde::ser::{self, Serialize};
 #[cfg(feature = "std")]
@@ -311,6 +312,7 @@ fn serialize_u128(self, value: u128) -> Result<()> {
 
     #[inline]
     #[allow(clippy::float_cmp)]
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f32(self, value: f32) -> Result<()> {
         if value.is_infinite() {
             if value.is_sign_positive() {
@@ -334,6 +336,7 @@ fn serialize_f32(self, value: f32) -> Result<()> {
 
     #[inline]
     #[allow(clippy::float_cmp)]
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f64(self, value: f64) -> Result<()> {
         if !value.is_finite() || f64::from(value as f32) == value {
             self.serialize_f32(value as f32)
diff --git a/rust/serde_cbor/tags.rs b/rust/serde_cbor/tags.rs
index 057765b9d2f8..81f749fa68e8 100644
--- a/rust/serde_cbor/tags.rs
+++ b/rust/serde_cbor/tags.rs
@@ -129,7 +129,9 @@ fn expecting(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
     delegate!(visit_u32, u32);
     delegate!(visit_u64, u64);
 
+    #[cfg(not(no_fp_fmt_parse))]
     delegate!(visit_f32, f32);
+    #[cfg(not(no_fp_fmt_parse))]
     delegate!(visit_f64, f64);
 
     delegate!(visit_char, char);
diff --git a/rust/serde_cbor/value/ser.rs b/rust/serde_cbor/value/ser.rs
index e52987778288..b4ff47c2e106 100644
--- a/rust/serde_cbor/value/ser.rs
+++ b/rust/serde_cbor/value/ser.rs
@@ -101,11 +101,13 @@ fn serialize_u64(self, value: u64) -> Result<Value, Error> {
     }
 
     #[inline]
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f32(self, value: f32) -> Result<Value, Error> {
         self.serialize_f64(f64::from(value))
     }
 
     #[inline]
+    #[cfg(not(no_fp_fmt_parse))]
     fn serialize_f64(self, value: f64) -> Result<Value, Error> {
         Ok(Value::Float(value))
     }
-- 
2.40.1

