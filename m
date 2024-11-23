Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC416FF44
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355447; cv=none; b=Boiza4F4TwXzqbZve3/BR23kDVcbw1MBitio1XRysyHtjcJMXD0EwNmbwnmNg28xI3J/VL9S74BHfQdFYyl6lUjqiDrCs22ic2/JhPuunRS7zqUfntGvBiKnlK6A7/QGpryz+DhWfUcIL2s/V1OgVkzvexdQIimARU5+LYwNk3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355447; c=relaxed/simple;
	bh=Og2fJghikD6+J4Dp7uCB/WaU5qfZE8DtE5bFM4IsrxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTInyofTGAcH5TPQLsZscFss5e6T0A/XTuKJ8M7TgZERX8cwALYofTeAVX/bFtGtchRvgXMEi3OlDb9sZPzs2sDdQ0GOEwIWEu5lIlUpb3X/ztU5BYEVqi6m7FykOZEDQpxP5ZHbIg8JEkel/CTSWPNv+xzGoRY93KW3ahQL2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=lYOKuh8O; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="lYOKuh8O"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa4d257eb68so555886366b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732355444; x=1732960244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ys/iiArATBe2Fx202hD2VmJy2d8ZRlrtaINi9qw8ShU=;
        b=lYOKuh8O9J9KJ/HM0SIIC0y5y3HiPbEJ+vWEC3/1jJTqvweBemWH0tzYF/I0Acmnpv
         /4TkTLMqHIHpne59EscsbTkOpWanu1vcQmpQ6yvUY2yUQzqzvHC0v60mYpGP3EvLeA9r
         LzheImq3csssw1Kg4MPvW+GPh1seu0eph6olJ2Xx5241WWTj9bV8H4fRl7Vanoq/5i04
         vX56nFHt8RwypA3+P3vseX+tc63oVwBqkPU6wbYn0ff2HJUyaRO/P8bC7ETK0Ob6HLU5
         aqpJUedCHe3my9uKa3qHI6N/GHuJ8EQmef8w/udzNJmbw9wwE1H8Oxdfd2ohRWeX3vp4
         wTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732355444; x=1732960244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ys/iiArATBe2Fx202hD2VmJy2d8ZRlrtaINi9qw8ShU=;
        b=RQqBhTHp6f+UBMMLhd4uO2CcGjUp1mNag8RzRuMC2ns2D6skrAVta+sAnueZPd/OS5
         XIDxH3Gf0JGtS5nn1owVla6njC16mDz0R9+8XHfcwOYbESTvHGW9eJmd9hb4m5ChBUee
         2vJZE3PpoT1V0M+4uwdLjzjTxSwXaMW/jXH45i1Gr07oeYxnUpxPgqZFnpJvKP1Ic4YL
         Slfbr5fe5pQJDv062n5AHdonaNcrXSo3wDqLEb4Vk9aQ7Is0KK5pFoC0zdHFZipA2LLO
         gzBksqmH4r/sSZIwq3lSuIesurxnFEHD/xfl6E7sE//9IXo+bq+ljdiBpNRZmkhPDfU/
         uiUA==
X-Forwarded-Encrypted: i=1; AJvYcCVhHMmJbBwAQRgER/GN+sjhUiClHl/x+x5Da66ZSWAZu5lWC5HAqBrBOJMcC40JuddjnprIVeTwvjT7A6Lzrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnEJayVyVNeFuxRJzUaOe+MLXvXuntDnIExmhyNSUxW+40KE1v
	xtcq156ptYQAvv+S5kWPlOUjFH542qFjpn9bu+LFZa4abemjLboIPJm/IRhydFY=
X-Gm-Gg: ASbGncs4oA5GvfueVRe67SxlqZ9u/driJ1F37v7ckP/rdZcIoJH7cMxRt4Yx8z4jjwe
	cw2aKsqVSsA2CFC/mRVKEcXRA+lbgU+V+aS9XvKvNwsWHsNW5WLTkQ74IOq13dpqLn4/6KyX1l1
	N3e+Ptq2LHKlN2Jm/fLOCPF9JAytfsbOPHgVV22ZZx+ydnOkaL1Z0EwjgdAPVkmOQfrYoBbHUrN
	L+Vfk0jiyUVNtSPUCzNxktVaooNBfCr/0hdnNH2GMw=
X-Google-Smtp-Source: AGHT+IExvASD/p8e8EZoh7qqhunDNc/RYK0BY1SjabzHOX/1jywSxFMuhKoaR5yg1JIIv7dGB4f3XA==
X-Received: by 2002:a17:907:704:b0:a9a:7b3d:705 with SMTP id a640c23a62f3a-aa4efea8835mr1099820466b.30.1732355443994;
        Sat, 23 Nov 2024 01:50:43 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af39sm1806918a12.82.2024.11.23.01.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:50:42 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v3 4/4] rust: kernel: str: replace unwraps with the question mark operators
Date: Sat, 23 Nov 2024 10:50:31 +0100
Message-ID: <20241123095033.41240-5-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123095033.41240-1-daniel@sedlak.dev>
References: <20241123095033.41240-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simplify the error handling by replacing unwraps with the
question mark operator. Furthermore, unwraps can convey
a wrong impression that unwrapping is safe behavior,
thus this patch removes this unwrapping.

Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/str.rs | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index d04c12a1426d..55755f008675 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -39,12 +39,13 @@ impl fmt::Display for BStr {
     /// ```
     /// # use kernel::{fmt, b_str, str::{BStr, CString}};
     /// let ascii = b_str!("Hello, BStr!");
-    /// let s = CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
     /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
     ///
     /// let non_ascii = b_str!("🦀");
-    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii))?;
     /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+    /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         for &b in &self.0 {
@@ -70,12 +71,13 @@ impl fmt::Debug for BStr {
     /// # use kernel::{fmt, b_str, str::{BStr, CString}};
     /// // Embedded double quotes are escaped.
     /// let ascii = b_str!("Hello, \"BStr\"!");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
     /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
     ///
     /// let non_ascii = b_str!("😺");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", non_ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{:?}", non_ascii))?;
     /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
+    /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         f.write_char('"')?;
@@ -273,8 +275,9 @@ pub const fn as_bytes_with_nul(&self) -> &[u8] {
     ///
     /// ```
     /// # use kernel::str::CStr;
-    /// let cstr = CStr::from_bytes_with_nul(b"foo\0").unwrap();
+    /// let cstr = CStr::from_bytes_with_nul(b"foo\0")?;
     /// assert_eq!(cstr.to_str(), Ok("foo"));
+    /// # Ok::<(), kernel::error::Error>(())
     /// ```
     #[inline]
     pub fn to_str(&self) -> Result<&str, core::str::Utf8Error> {
@@ -384,12 +387,13 @@ impl fmt::Display for CStr {
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
-    /// let s = CString::try_from_fmt(fmt!("{}", penguin)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
     /// assert_eq!(s.as_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
     /// let ascii = c_str!("so \"cool\"");
-    /// let s = CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
     /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
+    /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         for &c in self.as_bytes() {
@@ -413,13 +417,14 @@ impl fmt::Debug for CStr {
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", penguin)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{:?}", penguin))?;
     /// assert_eq!(s.as_bytes_with_nul(), "\"\\xf0\\x9f\\x90\\xa7\"\0".as_bytes());
     ///
     /// // Embedded double quotes are escaped.
     /// let ascii = c_str!("so \"cool\"");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
+    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
     /// assert_eq!(s.as_bytes_with_nul(), "\"so \\\"cool\\\"\"\0".as_bytes());
+    /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         f.write_str("\"")?;
@@ -799,16 +804,17 @@ fn write_str(&mut self, s: &str) -> fmt::Result {
 /// ```
 /// use kernel::{str::CString, fmt};
 ///
-/// let s = CString::try_from_fmt(fmt!("{}{}{}", "abc", 10, 20)).unwrap();
+/// let s = CString::try_from_fmt(fmt!("{}{}{}", "abc", 10, 20))?;
 /// assert_eq!(s.as_bytes_with_nul(), "abc1020\0".as_bytes());
 ///
 /// let tmp = "testing";
-/// let s = CString::try_from_fmt(fmt!("{tmp}{}", 123)).unwrap();
+/// let s = CString::try_from_fmt(fmt!("{tmp}{}", 123))?;
 /// assert_eq!(s.as_bytes_with_nul(), "testing123\0".as_bytes());
 ///
 /// // This fails because it has an embedded `NUL` byte.
 /// let s = CString::try_from_fmt(fmt!("a\0b{}", 123));
 /// assert_eq!(s.is_ok(), false);
+/// # Ok::<(), kernel::error::Error>(())
 /// ```
 pub struct CString {
     buf: KVec<u8>,
-- 
2.47.0

