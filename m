Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E871D3192
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044989; cv=none; b=UyBZW+mnLG5+bCVFix6YWS/UdDWHpmRvYjAKGAmCibdJe8d73uSdF6EzWa/x42nOYOJbtpMEDD/fLR5UHb8KFnZLzcPbwzsHkO1ZFvLwhblH2DQt+K3pXa3KJtwLXAVDVY2TgoeMS4LSNnOtkfYWbWQJ4Agmmwlx5Kb4TOzCNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044989; c=relaxed/simple;
	bh=8DhgBGzjY+cmf2eT35WwIZSRpJJBMu49b3ijoxeACYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgJb2OpjFKE6WgNNjAb7dWR3Ho49L57wlP8Gw/Drxk3E1mQJ1jACpbG3yDfOUtImxORyegiLehyWmP+BMWyelo+pYgrhKOIshlBKlATjix75FocfJrd14Nx1euD2RaRgizuRXG3fJ+Gr8hZ9lOqVXiyqgNx2mjrQ+nLTzTz/qOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=0olL3S+1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="0olL3S+1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so42248785e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732044985; x=1732649785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+8PeyXEDbpEt/VZCFUEn/OvPZCajVrLsLpcq+S6oCc=;
        b=0olL3S+1mpsMgJlmh4URh52KYgs5tjDYTSHO5UKnCT2/iTMwrZSU8nEVfaFdQjnQN1
         vQm9etZtKY30nh+r1ETTRbrYGmhhNOrfbMd/uCGfS9XxGB49ek561x7A5ztEG2VNQzZ4
         KCjeNu+TVJz4oFjRKtX7BdasQuwTsD7W+zR5KSPjS9lBlF0wXexTUE7gMk+WerreElST
         VJj1jF2frU6vA9oIvRgMNMq9bLSLNguMCtzO1GPs8Olm6v5BHGLFimMwDFL6eqO8m6wz
         msrknoJ0py1W2G2MuOaBcx/Q2S2E/uUWWDixVr2XaCmGmqzEDEXEM5hJxy0Bo6kNaC0Z
         2z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732044985; x=1732649785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+8PeyXEDbpEt/VZCFUEn/OvPZCajVrLsLpcq+S6oCc=;
        b=jq49yCT2bJZ/xguleD1FYnY/y3k8y87gmaGeT/RUeWGtcEkU/eU5WSqpBvqTzDv6O4
         U9tNqDv6lAsJszl+ISElkqZ48Gvh8O6mT+IzTksbmTqXHsiNckbmTOd0gnc3TE7j4YpV
         gapbRrwIAl7m+fMm0Y25ODcZcArcQgIbFK4kNhpbmzbYEWhhAmR4MmPHGucCHmxNiK6M
         Kz7MLM9iQgH8FnjZiPFjhcjn1EKvBNZWzKhjHbb5L4nAvPcIAhnkVRPXFYCguV/zv1Yh
         SBpxadNZxmPnWQNLBX1pVXpF9cieDLf3AaO0tYIPhtAvvSdFW3ZZrNU4RkMiYKQvfZ9c
         si9g==
X-Forwarded-Encrypted: i=1; AJvYcCVD1VPOwBsyDbIqSIbuc41jYz/V4DAGRRqU0jK1n62k8bwC0Gg353Fcuhcw3EKREQkmjVSYeWQVPPBmQkNkQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2o9LWh2Yi7oIPIFbvKjwJJ64oFe2oOF4qfQAnSUotZ9IcpBu
	f5+U84zjYNOGmmUphj3Xsg2E8xIkNpg/NRNde1sl0D3tOJvA6gUxp1uve5kjFBY=
X-Google-Smtp-Source: AGHT+IHFIo1ztw5WYX5ldSciiOko0f1TT35SKX0vS2x28TkxBtE4CFqtlcBoHS3qRs0k5YfajSxjlQ==
X-Received: by 2002:a05:600c:5115:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-43348986b59mr1687805e9.3.1732044984993;
        Tue, 19 Nov 2024 11:36:24 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm203127355e9.22.2024.11.19.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 11:36:24 -0800 (PST)
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
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v2 4/4] rust: kernel: str: replace unwraps with the question mark operators
Date: Tue, 19 Nov 2024 20:26:41 +0100
Message-ID: <20241119192715.38282-5-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119192715.38282-1-daniel@sedlak.dev>
References: <20241119192715.38282-1-daniel@sedlak.dev>
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

