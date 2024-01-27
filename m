Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449512B68
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jan 2024 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706328849; cv=none; b=c5kPSh36KeQtHsuytl11LLqIjLuTiVkvrm+0/m2UUG4iGa+CaVEgAYh4coCZwyVzn34J5jRsxS94fUPdeR6PwSQrPMNapK/+2qCSgAYeVMe2qoE09ear9ADwDpMHdqcExXyeXyY5GhFAPNtJXVu7Z4G880p7wJ+wXIXuGa2KZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706328849; c=relaxed/simple;
	bh=O01cpo+FtHzcEARwY53FOMmQjOUhONr/9M0PpctIp2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVKLBayDTKahlWm/9j7ZoEm3yiSN7Y8wyqmtvJoSce9sjoN5/2UMVVVEvf5JGfHVJEVCuGxTC2v1b4Lr7PpswIudUrrrj94YFCp+2bbyzW3vhRcnplVnkDDd+dkQbG8NOVanqKcPn3Aw3n7l9v3AEFSToEZHEWBYG00YCMnH6NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1Yz+maN; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1Yz+maN"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ff7ec8772dso15190557b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jan 2024 20:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706328846; x=1706933646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+yyNj8AZxBSer4Q2WSXJC59OeqYnV5Xuy0II0y+BkI=;
        b=X1Yz+maNCnPKU2bwh2wMhfnIJRvi7NU7eXI9auv2GeSqZS7vOGjN7XLoAoSkkIqZtb
         pdaevZ/VOUthV/mlB0q7gVhNMqzaqvmt/A0nA+0avXgKZCP7Tb0YeE4CYFRWLL29/3y4
         1XBDYV+fVZ1BJhvv2OqACHpk6v8yYPB1XjDhSA/cMRWB7RVBdd0XlwmRpZg7SH6Fojxg
         VbKLLN6qdxXony1ts6hTH7Rsb7RTjJWmwwf7SGo5a/53i5u1zd0eO5IGm580GLnclG7M
         O1ViCcHDqc0kcD1w0nkRRJ9NNujVieW6GW81/5kZgiCz8z9cCCIlD4+2BIKfRaidVXXx
         GvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706328846; x=1706933646;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+yyNj8AZxBSer4Q2WSXJC59OeqYnV5Xuy0II0y+BkI=;
        b=maxdOywS5ZF3YtVYBZrWeVex+uOETAuSMhsGsT7WyK3/FC7jf9badqXbztr5KVoScM
         hY3spze0D9N2FHHyjR6FGjY8Imbi8PW7Lacf6g5nzNYFkvSdeDd/6tQxLWFggei3j0ey
         Rer4CKOu93LzwW2VNDQLDr8++EcFpYXfGredM9NiZfeUkgIbHr5y1FqTQE88eLWN0n/x
         29NElilyaKXWpKbZXjAmMwdNP/VFUk6+WFQ7ZpcEZk4VkIXrXHhh6tHE5FH/nUU/kkr9
         ujtZMfFRJ91gSfxh+A0hYUnzZSRQssfAzl3vStzGbhKhEBGp3a13h0EKN8TipgStfQ6z
         R28A==
X-Gm-Message-State: AOJu0Yz/IN+tIJJFyOVPB6wyNkwNXy05t1OooPUs99/toq2AV/2LBAJn
	0XlPa8DWEn5OanpJ9e8FE6q0jLa+/KdFWngGji7oNtOaokZ5YTRT
X-Google-Smtp-Source: AGHT+IGQLBhPGQmWh37UpHLU0j7j8P3dIbtEARp8x0et3YDR0P9EO6sdXqTQgNGBHfJm7E4i8xgdDQ==
X-Received: by 2002:a0d:d242:0:b0:5ff:7cb4:d200 with SMTP id u63-20020a0dd242000000b005ff7cb4d200mr985775ywd.17.1706328846025;
        Fri, 26 Jan 2024 20:14:06 -0800 (PST)
Received: from ohnotp ([2001:f70:860:4100:d497:9118:219b:703d])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001d72f71e83bsm1633206plc.73.2024.01.26.20.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 20:14:05 -0800 (PST)
Date: Sat, 27 Jan 2024 13:16:18 +0900
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
Subject: [PATCH V2] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <ZbSDkm65LML4OWKX@ohnotp>
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
V1 -> V2:
- Ensured there are no changes to the behavior of `CStr`'s `Display` and
  `Debug`.
- Made other few changes based on review comments.

 rust/kernel/str.rs | 192 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 166 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..d5c311a91df1 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -13,9 +13,92 @@
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
+        f.write_str("\"")?;
+        for &b in &self.0 {
+            match b {
+                // Printable characters.
+                b'\"' => f.write_str("\\\"")?,
+                0x20..=0x7e => f.write_char(b as char)?,
+                _ => write!(f, "\\x{:02x}", b)?,
+            }
+        }
+        f.write_str("\"")
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
@@ -33,7 +116,7 @@
 macro_rules! b_str {
     ($str:literal) => {{
         const S: &'static str = $str;
-        const C: &'static $crate::str::BStr = S.as_bytes();
+        const C: &'static $crate::str::BStr = BStr::from_bytes(S.as_bytes());
         C
     }};
 }
@@ -225,15 +308,7 @@ impl fmt::Display for CStr {
     /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        for &c in self.as_bytes() {
-            if (0x20..0x7f).contains(&c) {
-                // Printable character.
-                f.write_char(c as char)?;
-            } else {
-                write!(f, "\\x{:02x}", c)?;
-            }
-        }
-        Ok(())
+        fmt::Display::fmt(self.as_ref(), f)
     }
 }
 
@@ -255,23 +330,14 @@ impl fmt::Debug for CStr {
     /// assert_eq!(s.as_bytes_with_nul(), "\"so \\\"cool\\\"\"\0".as_bytes());
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        f.write_str("\"")?;
-        for &c in self.as_bytes() {
-            match c {
-                // Printable characters.
-                b'\"' => f.write_str("\\\"")?,
-                0x20..=0x7e => f.write_char(c as char)?,
-                _ => write!(f, "\\x{:02x}", c)?,
-            }
-        }
-        f.write_str("\"")
+        fmt::Debug::fmt(self.as_ref(), f)
     }
 }
 
 impl AsRef<BStr> for CStr {
     #[inline]
     fn as_ref(&self) -> &BStr {
-        self.as_bytes()
+        BStr::from_bytes(self.as_bytes())
     }
 }
 
@@ -280,7 +346,7 @@ impl Deref for CStr {
 
     #[inline]
     fn deref(&self) -> &Self::Target {
-        self.as_bytes()
+        self.as_ref()
     }
 }
 
@@ -327,7 +393,7 @@ impl<Idx> Index<Idx> for CStr
 
     #[inline]
     fn index(&self, index: Idx) -> &Self::Output {
-        &self.as_bytes()[index]
+        &self.as_ref()[index]
     }
 }
 
@@ -357,6 +423,21 @@ macro_rules! c_str {
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
@@ -381,6 +462,65 @@ fn test_cstr_as_str_unchecked() {
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
+        let non_printables = BStr::from_bytes(b"\x01\x09\x0a");
+        assert_eq!(format!("{}", non_printables), "\\x01\\x09\\x0a");
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
+        let non_printables = BStr::from_bytes(b"\x01\x09\x0a");
+        assert_eq!(format!("{:?}", non_printables), "\"\\x01\\x09\\x0a\"");
+        let non_ascii = BStr::from_bytes(b"d\xe9j\xe0 vu");
+        assert_eq!(format!("{:?}", non_ascii), "\"d\\xe9j\\xe0 vu\"");
+        let good_bytes = BStr::from_bytes(b"\xf0\x9f\xa6\x80");
+        assert_eq!(format!("{:?}", good_bytes), "\"\\xf0\\x9f\\xa6\\x80\"");
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
 }
 
 /// Allows formatting of [`fmt::Arguments`] into a raw buffer.
-- 
2.43.0

