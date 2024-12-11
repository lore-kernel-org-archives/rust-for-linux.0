Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CB7F4FA
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882734; cv=none; b=bUFJc5G+PfEZXBWssNaKbXSK1IZqewe1l3S1Yojm3zMvZaXndg1nIqsCqT6feINMzu14kXXjxhjAQ/0wcMgbPEOGm4tRF9HIlg4BFosSi9qTVcEhsB410PPpDXqli2Od7JoIa8z2VXSxButKKkJCorThDHue9TXN3q8a10lXsb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882734; c=relaxed/simple;
	bh=zwOPh6L4wAZKEn1MN4nlYZUeF6se+MyrXwjKZYmzvNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bE/7ce7/2m2DkXZUc5ZB3x8am7jcKo9x9/9bB+II1g061Kxq+WacfyNDBUACFoO9uVCnRDnaaO40QbUADzwdSwN8TtzHRIll5yDfVvF5lES6UJWcfLNw0Hx5MLI83cKRXa4ojkkjgqE/px7ZL+/HqPJd1+e/w0XaTwwG03q2mF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvmKEuFn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvmKEuFn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ef0397aeso2533538b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733882732; x=1734487532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5GnSENPSB6pdczR3q0r2fT1dwaOE9L01riJX8p9Jqw=;
        b=jvmKEuFnJc55vmenqjw3fDTSPr9nxF0hJTPP+Acwsws+umanizfj9HTKTyhhHCK0HT
         5BYpx74ITIH10HjUiXvdFEoR08IyhOfm52ejgaVkNOZcywo2hurLacF03qgSfRx2bSW7
         sp+GXeLeBI2zOz9h0tJIkYB/axWjcXShgTvE7QGNbvYmByVo6Gw3yBNkkG8tIQH5yQY6
         61x+Gi3O/BEzylhb59yInYcMTznixwxuuCQHNynyo1sIy2Qoi5Qqgpa+YsNH3Vov902I
         FoK5GGX/V1Sv0vkjJ2lzooTEws5YPfcwpBis3KDWIPP6MFPvmL1iLll9Xpaadj4wSKz0
         FBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733882732; x=1734487532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5GnSENPSB6pdczR3q0r2fT1dwaOE9L01riJX8p9Jqw=;
        b=vQiFpoVyy9i6wQxMBTObzZXXHfczs9HS1AnuKpTmGANKetpOXKZw99tLWxg4VDUr76
         BkL47HgUpew+koHdk8LvEhhXbftSfglqG4mNc/slBR5n8PiqWH/4vmyPEqnSStHWKNah
         UNW+eqirUFZPGUcHrxcE5Rk3YCXxK73ePrPPEVdkdSxCXw2BMnV+1NxS3j/PF3lGZQdT
         CLmLZVtfV1naYq+iMw3U2bbYWfP1/yldm93BzvJfia3aHmRn/TDYTQ2Z+Q6hNmIlWwQt
         MwZIE46S1CJHv9BrgPkujbSlI7Em7CrcxbuNsCjnkiRWn14h2kBZuLyorDlWFFG2xbXf
         StTg==
X-Forwarded-Encrypted: i=1; AJvYcCUD63rMrPyvtrHh5oUvnJFakA2XCKBEm4ky4zAzUETJm2RV9bFQUA238d4NHm3t8kF1qz2Nr0huivN8Y2YcJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEDafqrf2GdTU/qSO2weNabiF3+a7J3GwUObWL/amlmO/sTN/
	MyvcEt2Y+jp59mbsldaSgnk4lDHrB2Mlfa5mSqoaSNkzAIawo90R
X-Gm-Gg: ASbGncuj6UK+sJtCjaFj5GdOsxBXqm3IWEZMZw/etiksoYXPuFvHuOeQttdXtWZuNZM
	9fMmxcv6JIAZryv+UIkn1+WTFLnMaCmYXfYbfejBnbr+4+DauskJ9a1gPydv7h1xJBlXKjvR563
	TPbioxXm9I0PTZNsfMbJDW6s785sJX7ZfYLBBuLshA6brwW53493GTFMcY4VHcuJRCZQ4Oi1XD2
	+fqzgDYw53P3aWbfLdlL8WOy0JWVVWsD1tphpq11EVxnpwAsrR0mwFaiFsA/+PNiA==
X-Google-Smtp-Source: AGHT+IGygoymb+X9yhdVGMWOYS346bmYt3v+7ZQVghB7Jm80S3wbUTiIE3ks8WHEEgI0i0HDCQFTRw==
X-Received: by 2002:a05:6a20:cf83:b0:1e1:a07f:9679 with SMTP id adf61e73a8af0-1e1c124a789mr2411396637.4.1733882731988;
        Tue, 10 Dec 2024 18:05:31 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd313f0ffbsm6946674a12.82.2024.12.10.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 18:05:31 -0800 (PST)
From: Jason Devers <dev.json2@gmail.com>
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
	boris.chen.czy@gmail.com,
	Jason Devers <dev.json2@gmail.com>
Subject: [PATCH v4] rust: sync: add #[must_use] to Lock::try_lock
Date: Tue, 10 Dec 2024 21:05:07 -0500
Message-ID: <20241211020507.103687-1-dev.json2@gmail.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
currently does not issue a warning if the return value is unused.
To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.

Note that `T` is `#[must_use]` but `Option<T>` is not.
For more context, see: https://github.com/rust-lang/rust/issues/71368.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1133
Signed-off-by: Jason Devers <dev.json2@gmail.com>
---
 rust/kernel/sync/lock.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..39f8c07d2287 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,8 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
+    #[must_use = "if unused, leads to an empty critical section"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

