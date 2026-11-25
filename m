Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646893;
	b=Ghy8oUBip3p3XZDJjRM1I/Lc9IuJ3eXKzIgA6GFNfjHNQDfYXUL5VnHyB8nkgMiHYSl3
	 4i4Xt0R6Of957ZEV9BlPfaN/eNtIAybbrHiVPQTispD+8TU6W+Wmwx+gdcKVtP4k/yLz0
	 wK7RlFrewMkVWwOo+GhVIPEHSbEcJTdrBPgpO4HUGSFTzuLtk1DPR4FxpCHbK/IlUDM+Z
	 LE7ElafiuXsztZnmT7lJekf7sdXaaqgE97VRGbkcJJ4hk5wbK2jrvUZ9/+0axU4n23FBf
	 Gi3/ke78uFwFOrVI5/nUYMEfzIrFXQZu4w3pfXVjxZTEj8JgyQxA/v25zLF4o1vL9/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646893;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=7MpowVD7efdjNqW0NrD+m1eC1gnks6tFFlNBjocTkCA=;
	b=IQ4PPB+zoekjI7/4/Lv9+nyGgZjuJoLkQGnjQS4CMDhNI6/mJFNRu8GbCh1c1p9xU8la
	 WRZg5vLUw+oemmrydSXKSu5PJkoCzJNqkO8tHl+SA+V2Hy9zJAXUioX0r7k1CyqfY0QPB
	 Lsb1gxAx9tsZQ+WLkvUJS6YKXkYcRAJs3QW3nJ/+SA3UOwllSTHncPsF3CvY+pjwprlXR
	 La0x6jAtwblWtfzfLqBgiDq7LZRtGDC0Q8u3k2pMd72CVeYEXr7CxL1ZoAHYdbnnziNVw
	 zl0bA59tdtt37+djsMd2eBT8aaAXlbfZ/Zv42+gVK3+hr/d+Ich8iYNT8uWpzIHdgwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jDMbtTk6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3DE606A698;
	Wed, 25 Nov 2026 22:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3DE606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jDMbtTk6
ARC-Seal: i=1; a=rsa-sha256; t=1795646849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XXlRjbhkljT7etH7GNXJdceHZlse8/feQ+u4YV3bugrCpXxJtph6iDNqzrW9wfVi5nJlpUULwRg3CldSK/sbDMhjhSxLexRiW6Aw39Ym2l7yNhPjUWqBeyWggj7Cnz+P/bmBERcjJA9d3Rd7PMYn/IQraccaSKQ7zV4DK1qt1mQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7MpowVD7efdjNqW0NrD+m1eC1gnks6tFFlNBjocTkCA=; 
	b=kKlAaaN/ZZJJhkjFAN1qNbgWTcFVCNfsncdZxuJayd+5GUxz76PlT/8UIiuaeeJFmPdvDFx/2v3ONcrMgHkw7Z8lAqKzV8uUsO70kUjtqgOf86SOjxyVHdPZh0bTcv/7DcKs7FPjvoxUI4I9L1jZHvOPke68JVVLTZTrBaNEevU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jDMbtTk6elP+xDXdVtlSoeta/S9J+n/liLKXdmOqKIw5sim9+Zf1hYQ3N9ADXwSCvsqLvIVs5w/E9ex+cK8LjSIA0wUPptgAN+9ELA07pPfUMLq29KHZY4EAj3dEEcY6vpPVuzxNnYzWNBvtK7CAIwuzqNe7zoQYoTRJq2Lpv7Q=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=7MpowVD7efdjNqW0NrD+m1eC1gnks6tFFlNBjocTkCA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646846948569.9407795930365;
	Wed, 25 Nov 2026 14:47:26 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:46:55 -0300
Subject: [PATCH 04/13] drm/tyr: convert EntryHeader to `bitfield!`
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-tyr-as-casts-v1-4-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, convert
`EntryHeader` to `bitfield!`.

`EntryHeader` wraps the `u32` that starts a firmware entry and extracts
its fields with hand-written masks and shifts. The entry type is
truncated to `u8` with `as` after masking, and the size is returned as
a `u32` that the parser casts to `usize`.

With `bitfield!`, which `SectionFlags` already uses, the fields are
`Bounded` values that carry their width. `EntryType` converts from the
8-bit field, and the size converts to `usize` with `From`, so both
casts go.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/fw/parser.rs | 49 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/tyr/fw/parser.rs b/drivers/gpu/drm/tyr/fw/parser.rs
index c4d0ad1d7899..89de560bf192 100644
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -16,8 +16,9 @@
 };
 
 use kernel::{
-    bits::bit_u32,
+    bitfield,
     device::Device,
+    num::Bounded,
     prelude::*,
     sizes::SZ_4K, //
 };
@@ -234,12 +235,12 @@ fn parse_entry(&mut self, header_end: usize) -> Result<EntrySection> {
         }
 
         let entry_section = EntrySection {
-            entry_hdr: EntryHeader(self.cursor.read_u32()?),
+            entry_hdr: EntryHeader::from_raw(self.cursor.read_u32()?),
             inner: None,
         };
 
         let firmware_size = self.cursor.len();
-        let entry_size = entry_section.entry_hdr.size() as usize;
+        let entry_size = usize::from(entry_section.entry_hdr.size());
 
         if self.cursor.pos() % size_of::<u32>() != 0
             || entry_size % size_of::<u32>() != 0
@@ -291,7 +292,7 @@ fn parse_entry(&mut self, header_end: usize) -> Result<EntrySection> {
                         dev_err!(
                             self.cursor.dev,
                             "Failed to handle firmware entry type: {}",
-                            entry_section.entry_hdr.entry_type_raw()
+                            entry_section.entry_hdr.entry_type_raw().get()
                         );
                         Err(EINVAL)
                     }
@@ -526,31 +527,21 @@ struct EntrySection {
     inner: Option<ParsedSection>,
 }
 
-/// Header for a firmware entry, packed into a single u32.
-///
-/// The entry header encodes the entry type, size, and optional flag in a
-/// 32-bit value with the following layout:
-/// - Bits 0-7: Entry type
-/// - Bits 8-15: Size in bytes
-/// - Bit 31: Optional flag
-struct EntryHeader(u32);
-
-impl EntryHeader {
-    fn entry_type_raw(&self) -> u8 {
-        (self.0 & 0xff) as u8
+bitfield! {
+    /// Header for a firmware entry, packed into a single u32.
+    struct EntryHeader(u32) {
+        /// Entry type.
+        7:0 entry_type_raw;
+        /// Size in bytes.
+        15:8 size;
+        /// Optional flag.
+        31:31 optional => bool;
     }
+}
 
+impl EntryHeader {
     fn entry_type(&self) -> Result<EntryType> {
-        let v = self.entry_type_raw();
-        EntryType::try_from(v)
-    }
-
-    fn optional(&self) -> bool {
-        self.0 & bit_u32(31) != 0
-    }
-
-    fn size(&self) -> u32 {
-        self.0 >> 8 & 0xff
+        EntryType::try_from(self.entry_type_raw())
     }
 }
 
@@ -571,11 +562,11 @@ enum EntryType {
     BuildInfoMetadata = 6,
 }
 
-impl TryFrom<u8> for EntryType {
+impl TryFrom<Bounded<u32, 8>> for EntryType {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self, Self::Error> {
-        match value {
+    fn try_from(value: Bounded<u32, 8>) -> Result<Self, Self::Error> {
+        match value.get() {
             0 => Ok(EntryType::Iface),
             1 => Ok(EntryType::Config),
             2 => Ok(EntryType::FutfTest),

-- 
2.56.0

