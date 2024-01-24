Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0997C091
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115356; cv=none; b=Jp1tL5uL5K8IoIdgQCRBdW4pzakGDIjk7ctyX+W37/PEbUr6C6qFr3mCBqnEqBu8DAkN7GDBAs+eAhrok7MauPqBnHHbvjnZ74/k8k3mDZ8OBH99lJjSF92oDZX9F4vW4J4T6/4WiF4ls438aS8hEOp6aTKB0ZkoKb3TvkG5vlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115356; c=relaxed/simple;
	bh=KbPKt7C/cVvYtWg8E/5ggVRQjlMpi7AU+SMTZHPD7Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVTl1VYXb8GRi2ONlPdKCd5bgtFHmc2Zxm9NKAavofeNAyaYdPyFDOB8nD9JC9LSZuKGvG4yW2g0JN/M0BbITQvnlcs7V8++Fh+SHRxPp/zXVIlIslUE9K+SnOcDB3SX49efq3D8FismGjYFUR3sepEdtbuG+s0HPQ2vCqGumAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFuB8Ykq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFuB8Ykq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2906b859560so2307677a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 08:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706115354; x=1706720154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su3vRo063cdXQQPNody5ulpby9O8tXMdoZ1S6ACauI0=;
        b=iFuB8YkqEXpg3iry6z/7YUEUBhaKhkkm+u+xWScOIdISqWPQgFaBLQE+Ty6d8SHsEj
         WJivnk1x/VNyOhbpIstetspr5FvGRkf4jTGn2kSpLK/N8eqosg4MYG2uJ94ilzVgwDc2
         jGA6WSr3qmn1nonNbZmznKA41vCfZ6f1n2L0HM0jnO5lGkKvYyxrYm3e3Jbc1NpiLM3e
         84J5mMcMCbtGcArOzbg7VkcH64JYcE7sh9NW7V4QEcStn2CYA75ardKX6j2rQb5Rgbj+
         HmiFHzqbiCBu9xFLv+FiN0aJ1FGZ6oJvPwvKLHgQemmLCypt1g03doAQ0VRTJJsl74f1
         EhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706115354; x=1706720154;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su3vRo063cdXQQPNody5ulpby9O8tXMdoZ1S6ACauI0=;
        b=hhSKo4N0hjR+7RWbzIFLVHsLkNMl6Ib9fbHmFFzbANAhOC34RjwKgA9ShgavfNF5uH
         18ndYY6Vbuvl+FbIuuCg7EEhjq8+q0lJfPgTuUt5I39DuujG3Rl1J3O3/Y4jrDOhfrLW
         0pN4bo6pgZM9z/0BsENbjn+KZupT08Gn3hzW/afxzC+Stg3LKCd3yIv+r6IsSUipRFHC
         UIt7u9rxsgEesi1xBHfAjlImEJWRrl9hF2njkA30VDS4XyAUDEZiI3JRFa0ey4lJb9z3
         Eb0STFD14B2oEhaE8kGsnCDOEYgsN2sGaHV05KJ4d6L7yBPCW59ytehHAr3cblGn5A+c
         3NuA==
X-Gm-Message-State: AOJu0YzzBIyCKd8wK52sAYwK0RuoaUrlSS5RDusep5M8R+zrIlfhqiWq
	obeXxYA+aEKDltcnzco9fs1Bp4ZYLiF5E7Us00ghN+swFGN8fXkr
X-Google-Smtp-Source: AGHT+IFYyamYLqycPuM6etMhwTSw9OZs6rCtEU2oK+QIHRj0KMN7jGSLjI6LiGofbNFrQhnVvxBxJg==
X-Received: by 2002:a17:90a:1547:b0:290:1451:2cca with SMTP id y7-20020a17090a154700b0029014512ccamr4404951pja.11.1706115353915;
        Wed, 24 Jan 2024 08:55:53 -0800 (PST)
Received: from ohnotp ([2001:f70:860:4100:2e9c:7d15:1dd1:53f3])
        by smtp.gmail.com with ESMTPSA id si6-20020a17090b528600b0028df5c748e4sm14170492pjb.44.2024.01.24.08.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 08:55:53 -0800 (PST)
Date: Thu, 25 Jan 2024 01:58:05 +0900
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
Subject: [PATCH] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <ZbFBnXy7YWV0MFC0@ohnotp>
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
 rust/kernel/str.rs | 211 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 186 insertions(+), 25 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..0f0261e063d2 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -14,8 +14,104 @@
 
 /// Byte string without UTF-8 validity guarantee.
 ///
-/// `BStr` is simply an alias to `[u8]`, but has a more evident semantical meaning.
-pub type BStr = [u8];
+/// `BStr` is simply a wrapper over `[u8]`, but has a more evident semantical
+/// meaning.
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
+        f.write_str("\"")?;
+        for &b in &self.0 {
+            match b {
+                // Common escape codes.
+                b'\t' => f.write_str("\\t")?,
+                b'\n' => f.write_str("\\n")?,
+                b'\r' => f.write_str("\\r")?,
+                // String escape characters.
+                b'\\' => f.write_str("\\\\")?,
+                b'\"' => f.write_str("\\\"")?,
+                // Printable characters.
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
@@ -33,7 +129,7 @@
 macro_rules! b_str {
     ($str:literal) => {{
         const S: &'static str = $str;
-        const C: &'static $crate::str::BStr = S.as_bytes();
+        const C: &'static $crate::str::BStr = BStr::from_bytes(S.as_bytes());
         C
     }};
 }
@@ -225,15 +321,7 @@ impl fmt::Display for CStr {
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
 
@@ -255,23 +343,14 @@ impl fmt::Debug for CStr {
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
 
@@ -280,7 +359,7 @@ impl Deref for CStr {
 
     #[inline]
     fn deref(&self) -> &Self::Target {
-        self.as_bytes()
+        BStr::from_bytes(self.as_bytes())
     }
 }
 
@@ -327,7 +406,7 @@ impl<Idx> Index<Idx> for CStr
 
     #[inline]
     fn index(&self, index: Idx) -> &Self::Output {
-        &self.as_bytes()[index]
+        &self.as_ref()[index]
     }
 }
 
@@ -357,6 +436,21 @@ macro_rules! c_str {
 #[cfg(test)]
 mod tests {
     use super::*;
+    use alloc::format;
+
+    const ALL_ASCII_CHARS: &'static str =
+        "\\x01\\x02\\x03\\x04\\x05\\x06\\x07\\x08\\t\\n\\x0b\\x0c\\r\\x0e\\x0f\
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
@@ -381,6 +475,73 @@ fn test_cstr_as_str_unchecked() {
         let unchecked_str = unsafe { checked_cstr.as_str_unchecked() };
         assert_eq!(unchecked_str, "🐧");
     }
+
+    #[test]
+    fn test_cstr_display() {
+        let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
+        assert_eq!(format!("{}", hello_world), "hello, world!");
+        let escapes = CStr::from_bytes_with_nul(b"_\t_\n_\r_\\_\'_\"_\0").unwrap();
+        assert_eq!(format!("{}", escapes), "_\\t_\\n_\\r_\\_'_\"_");
+        let others = CStr::from_bytes_with_nul(b"\x01\0").unwrap();
+        assert_eq!(format!("{}", others), "\\x01");
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
+        let escapes = CStr::from_bytes_with_nul(b"_\t_\n_\r_\\_\'_\"_\0").unwrap();
+        assert_eq!(format!("{:?}", escapes), "\"_\\t_\\n_\\r_\\\\_'_\\\"_\"");
+        let others = CStr::from_bytes_with_nul(b"\x01\0").unwrap();
+        assert_eq!(format!("{:?}", others), "\"\\x01\"");
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

