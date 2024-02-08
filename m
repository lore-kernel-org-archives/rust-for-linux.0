Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC46D1BD
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707385999; cv=none; b=M0eX7/8h9jCepKAI/SUDG2tpgv8Ev1Fc63dJeDbED7BnAxNV7FVVlf+fZEu8LqUS1YQazqNxXFLcFcYN7pJ2sS5uM/pcEA40a4NITC3/Z5zq2e3RbAnLPFiTTwOFFhDBn3fBzINL8dqB+V273oUVmZFePvBgZZM7rScDE2VTCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707385999; c=relaxed/simple;
	bh=EeiV/QQV0Qib+BJjB1vCH2zXPmho+8cwrQj3raUHUgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2fUJnyP2mJ2muE65yxe+U8kktTnpa9mCO2GAJ5U+vkKDuOqgXVGgB7izbgHWMcs3Rn/PkYZXTuGe6qP/8oAwEXAkai93FJqB1cfKRoTSkH1QaUOocF6KqRt2/KzDYQ6He2TSCYsV3RcEcMnkgdJwo+Eq2oU4sSytpVxxM4oIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJaba6tQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJaba6tQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d911c2103aso10209535ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707385997; x=1707990797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb9NyDuZv0mMXWYb6bOD1PO8IIm+nzEnSAeJGkjvTYw=;
        b=UJaba6tQ+b4kwerQT9rbd+P8LnmPlafB0Aak914JjbAKfbvNwyrmrdGyRWDsZ334NK
         JvTu4bIEfpNyNr5IVcoBsGFE4imHfE+4V5+xZXI7YMoc/XKEF/1utc30WhJxzIJmGiej
         fWBMuXWioMhhM4/PkHd4gJMeq3HWdceKweWxrRrlBY0shkpbu3PWy60dvWFOxjbJQ4tH
         3Xwxf0RvviZa3xEgwn83ZEXnZvAV+11gRyVIV44e6+izxsHQ5oy00H4fSbxi6jTny9d6
         4CjILA64FfXEh2gP+azd8okMLoNtCbCEsQCCWgqbJU7I3E8oB0CqY4+R8AuU3477ih4B
         cmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707385997; x=1707990797;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb9NyDuZv0mMXWYb6bOD1PO8IIm+nzEnSAeJGkjvTYw=;
        b=OvCr+EL0DGIXFfWULUzGvIOlgGiCYoHVJm+aHp8OhH5w8eAUTE0C4j7RjJbSw4twI/
         cvvSrsmKqmNYcfpPump8cGAD7qI7lliQcY42c8TvK6Qhd6C6LtmbkqAK9rfrfKNA6PnB
         rRzXiKHhO1ZoXI8panzCskKFv2RTOsjWFV3ooMQLXP8SY1INIZ1hyKiiRRvumMCRE2ck
         m0wRZaNYAvxTEDv/cCXbSZ66mXf1H9gATr0pqcTKR4zC4rpNAUb4ZPw0pnvaajIGR6s0
         CDONIbc5o/9u8L//XaLzSjAB4TMaXViN5gICn1K0KU+Z5DHJFaFYRmQYgbh85GPdXovK
         6slA==
X-Gm-Message-State: AOJu0YxmOBkqa9jCN9y/0FeykKN9fZjoWdeo/audKCBHBRyZO+1Q5Du+
	ISR97KRyg6vE6TfxrfVF2DfhnH5rNJ/Ftxkjtmw/huVY4giR0a4D
X-Google-Smtp-Source: AGHT+IHqvRsPZiK57eTfEOr/hqqYdr1jE3gy/+sZM9lSjjjvghuGan9jwDRsnjUmWo+ObrDa7UGzeA==
X-Received: by 2002:a17:902:cf4a:b0:1d9:b9ea:a1ee with SMTP id e10-20020a170902cf4a00b001d9b9eaa1eemr9487012plg.14.1707385996517;
        Thu, 08 Feb 2024 01:53:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXICko7tNSWOTdl+Audves7y504K/xCL3aiVBwwZ70517S2iI/WFyCNgLNI4n/61lU+TGR/FBzzvtuzz+QewH/EH1LihDWCHPmWdb7s8xcjY/l6cOgf00nr+7Hv1VtdGSoyXuuo4jjgZ7tY5OJWVW71X1JwiDhXOWrix8PrpDqV42azhGkbN7vW5Z+gPJ9AsaAE8umRXFjeniYsxDXvUlTnK6v7tVh6f/IHlwT1kzwy2NnQ1l5HiEF2Ysxdv1uhU+mP4oiJhmfYlGBAwE18GcdevdE1Hr1tRVe2RROi+ltHANJ2p493Vzj06PdHu4X8lXu/ZRXyE00Yews0z5/xc2C6nQOoj8ZeYfvOGlIqnHKkUg==
Received: from ohnotp ([2001:f70:860:4100:d497:9118:219b:703d])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b001d8e7ebba6dsm2974482pld.112.2024.02.08.01.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:53:16 -0800 (PST)
Date: Thu, 8 Feb 2024 18:55:36 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, Yutaro Ohno <yutaro.ono.418@gmail.com>,
	Virgile Andreani <armavica@ulminfo.fr>
Subject: [PATCH V3] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <ZcSlGMGP-e9HqybA@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Currently, `BStr` is just a type alias of `[u8]`, limiting its
representation to a byte list rather than a character list, which is not
ideal for printing and debugging.

Implement `Display` and `Debug` traits for `BStr` to facilitate easier
printing and debugging.

Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
struct wrapper of `[u8]`.

Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
---
V2 -> V3:
- Added '\t', '\n', and '\r' as printable characters to `BStr`'s
  `Display` and `Debug`
- Escaped '\' (backslash) for `BStr`'s `Debug`.
- Made other few changes aligned with review comments.

 rust/kernel/str.rs | 185 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 178 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..a21407124315 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -13,9 +13,102 @@
 };
 
 /// Byte string without UTF-8 validity guarantee.
-///
-/// `BStr` is simply an alias to `[u8]`, but has a more evident semantical meaning.
-pub type BStr = [u8];
+#[repr(transparent)]
+pub struct BStr([u8]);
+
+impl BStr {
+    /// Returns the length of this string.
+    #[inline]
+    pub const fn len(&self) -> usize {
+        self.0.len()
+    }
+
+    /// Returns `true` if the string is empty.
+    #[inline]
+    pub const fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Creates a [`BStr`] from a `[u8]`.
+    #[inline]
+    pub const fn from_bytes(bytes: &[u8]) -> &Self {
+        // SAFETY: BStr is transparent to [u8].
+        unsafe { &*(bytes as *const [u8] as *const BStr) }
+    }
+}
+
+impl fmt::Display for BStr {
+    /// Formats printable ASCII characters, escaping the rest.
+    ///
+    /// ```
+    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
+    /// let ascii = b_str!("Hello, BStr!");
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
+    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
+    ///
+    /// let non_ascii = b_str!("🦀");
+    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii)).unwrap();
+    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+    /// ```
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        for &b in &self.0 {
+            match b {
+                // Common escape codes.
+                b'\t' => f.write_str("\\t")?,
+                b'\n' => f.write_str("\\n")?,
+                b'\r' => f.write_str("\\r")?,
+                // Printable characters.
+                0x20..=0x7e => f.write_char(b as char)?,
+                _ => write!(f, "\\x{:02x}", b)?,
+            }
+        }
+        Ok(())
+    }
+}
+
+impl fmt::Debug for BStr {
+    /// Formats printable ASCII characters with a double quote on either end,
+    /// escaping the rest.
+    ///
+    /// ```
+    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
+    /// // Embedded double quotes are escaped.
+    /// let ascii = b_str!("Hello, \"BStr\"!");
+    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
+    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
+    ///
+    /// let non_ascii = b_str!("😺");
+    /// let s = CString::try_from_fmt(fmt!("{:?}", non_ascii)).unwrap();
+    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
+    /// ```
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        f.write_char('"')?;
+        for &b in &self.0 {
+            match b {
+                // Common escape codes.
+                b'\t' => f.write_str("\\t")?,
+                b'\n' => f.write_str("\\n")?,
+                b'\r' => f.write_str("\\r")?,
+                // String escape characters.
+                b'\"' => f.write_str("\\\"")?,
+                b'\\' => f.write_str("\\\\")?,
+                // Printable characters.
+                0x20..=0x7e => f.write_char(b as char)?,
+                _ => write!(f, "\\x{:02x}", b)?,
+            }
+        }
+        f.write_char('"')
+    }
+}
+
+impl Deref for BStr {
+    type Target = [u8];
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
 
 /// Creates a new [`BStr`] from a string literal.
 ///
@@ -33,7 +126,7 @@
 macro_rules! b_str {
     ($str:literal) => {{
         const S: &'static str = $str;
-        const C: &'static $crate::str::BStr = S.as_bytes();
+        const C: &'static $crate::str::BStr = $crate::str::BStr::from_bytes(S.as_bytes());
         C
     }};
 }
@@ -271,7 +364,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 impl AsRef<BStr> for CStr {
     #[inline]
     fn as_ref(&self) -> &BStr {
-        self.as_bytes()
+        BStr::from_bytes(self.as_bytes())
     }
 }
 
@@ -280,7 +373,7 @@ impl Deref for CStr {
 
     #[inline]
     fn deref(&self) -> &Self::Target {
-        self.as_bytes()
+        self.as_ref()
     }
 }
 
@@ -327,7 +420,7 @@ impl<Idx> Index<Idx> for CStr
 
     #[inline]
     fn index(&self, index: Idx) -> &Self::Output {
-        &self.as_bytes()[index]
+        &self.as_ref()[index]
     }
 }
 
@@ -357,6 +450,21 @@ macro_rules! c_str {
 #[cfg(test)]
 mod tests {
     use super::*;
+    use alloc::format;
+
+    const ALL_ASCII_CHARS: &'static str =
+        "\\x01\\x02\\x03\\x04\\x05\\x06\\x07\\x08\\x09\\x0a\\x0b\\x0c\\x0d\\x0e\\x0f\
+        \\x10\\x11\\x12\\x13\\x14\\x15\\x16\\x17\\x18\\x19\\x1a\\x1b\\x1c\\x1d\\x1e\\x1f \
+        !\"#$%&'()*+,-./0123456789:;<=>?@\
+        ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\\x7f\
+        \\x80\\x81\\x82\\x83\\x84\\x85\\x86\\x87\\x88\\x89\\x8a\\x8b\\x8c\\x8d\\x8e\\x8f\
+        \\x90\\x91\\x92\\x93\\x94\\x95\\x96\\x97\\x98\\x99\\x9a\\x9b\\x9c\\x9d\\x9e\\x9f\
+        \\xa0\\xa1\\xa2\\xa3\\xa4\\xa5\\xa6\\xa7\\xa8\\xa9\\xaa\\xab\\xac\\xad\\xae\\xaf\
+        \\xb0\\xb1\\xb2\\xb3\\xb4\\xb5\\xb6\\xb7\\xb8\\xb9\\xba\\xbb\\xbc\\xbd\\xbe\\xbf\
+        \\xc0\\xc1\\xc2\\xc3\\xc4\\xc5\\xc6\\xc7\\xc8\\xc9\\xca\\xcb\\xcc\\xcd\\xce\\xcf\
+        \\xd0\\xd1\\xd2\\xd3\\xd4\\xd5\\xd6\\xd7\\xd8\\xd9\\xda\\xdb\\xdc\\xdd\\xde\\xdf\
+        \\xe0\\xe1\\xe2\\xe3\\xe4\\xe5\\xe6\\xe7\\xe8\\xe9\\xea\\xeb\\xec\\xed\\xee\\xef\
+        \\xf0\\xf1\\xf2\\xf3\\xf4\\xf5\\xf6\\xf7\\xf8\\xf9\\xfa\\xfb\\xfc\\xfd\\xfe\\xff";
 
     #[test]
     fn test_cstr_to_str() {
@@ -381,6 +489,69 @@ fn test_cstr_as_str_unchecked() {
         let unchecked_str = unsafe { checked_cstr.as_str_unchecked() };
         assert_eq!(unchecked_str, "🐧");
     }
+
+    #[test]
+    fn test_cstr_display() {
+        let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
+        assert_eq!(format!("{}", hello_world), "hello, world!");
+        let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
+        assert_eq!(format!("{}", non_printables), "\\x01\\x09\\x0a");
+        let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
+        assert_eq!(format!("{}", non_ascii), "d\\xe9j\\xe0 vu");
+        let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
+        assert_eq!(format!("{}", good_bytes), "\\xf0\\x9f\\xa6\\x80");
+    }
+
+    #[test]
+    fn test_cstr_display_all_bytes() {
+        let mut bytes: [u8; 256] = [0; 256];
+        // fill `bytes` with [1..=255] + [0]
+        for i in u8::MIN..=u8::MAX {
+            bytes[i as usize] = i.wrapping_add(1);
+        }
+        let cstr = CStr::from_bytes_with_nul(&bytes).unwrap();
+        assert_eq!(format!("{}", cstr), ALL_ASCII_CHARS);
+    }
+
+    #[test]
+    fn test_cstr_debug() {
+        let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
+        assert_eq!(format!("{:?}", hello_world), "\"hello, world!\"");
+        let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
+        assert_eq!(format!("{:?}", non_printables), "\"\\x01\\x09\\x0a\"");
+        let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
+        assert_eq!(format!("{:?}", non_ascii), "\"d\\xe9j\\xe0 vu\"");
+        let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
+        assert_eq!(format!("{:?}", good_bytes), "\"\\xf0\\x9f\\xa6\\x80\"");
+    }
+
+    #[test]
+    fn test_bstr_display() {
+        let hello_world = BStr::from_bytes(b"hello, world!");
+        assert_eq!(format!("{}", hello_world), "hello, world!");
+        let escapes = BStr::from_bytes(b"_\t_\n_\r_\\_\'_\"_");
+        assert_eq!(format!("{}", escapes), "_\\t_\\n_\\r_\\_'_\"_");
+        let others = BStr::from_bytes(b"\x01");
+        assert_eq!(format!("{}", others), "\\x01");
+        let non_ascii = BStr::from_bytes(b"d\xe9j\xe0 vu");
+        assert_eq!(format!("{}", non_ascii), "d\\xe9j\\xe0 vu");
+        let good_bytes = BStr::from_bytes(b"\xf0\x9f\xa6\x80");
+        assert_eq!(format!("{}", good_bytes), "\\xf0\\x9f\\xa6\\x80");
+    }
+
+    #[test]
+    fn test_bstr_debug() {
+        let hello_world = BStr::from_bytes(b"hello, world!");
+        assert_eq!(format!("{:?}", hello_world), "\"hello, world!\"");
+        let escapes = BStr::from_bytes(b"_\t_\n_\r_\\_\'_\"_");
+        assert_eq!(format!("{:?}", escapes), "\"_\\t_\\n_\\r_\\\\_'_\\\"_\"");
+        let others = BStr::from_bytes(b"\x01");
+        assert_eq!(format!("{:?}", others), "\"\\x01\"");
+        let non_ascii = BStr::from_bytes(b"d\xe9j\xe0 vu");
+        assert_eq!(format!("{:?}", non_ascii), "\"d\\xe9j\\xe0 vu\"");
+        let good_bytes = BStr::from_bytes(b"\xf0\x9f\xa6\x80");
+        assert_eq!(format!("{:?}", good_bytes), "\"\\xf0\\x9f\\xa6\\x80\"");
+    }
 }
 
 /// Allows formatting of [`fmt::Arguments`] into a raw buffer.
-- 
2.43.0

