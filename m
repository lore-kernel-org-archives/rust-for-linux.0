Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330FB7E765
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 03:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733973089; cv=none; b=GFz50GLn3Xk3xhsu4tgq/4dOMsgGEeAR8xVHPAFZKSdMhpr55RTEF6H7g+d51ZvoVWsvqWcs0r7GcFoFI5x/pVJLs7YYFkKkrjh+KQfkCy/A1r/Y21bpyu/jI354nHsmHSB77ZBeoKs2a0x0COdwzpF+EkvJef8M3qZR0s9+FtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733973089; c=relaxed/simple;
	bh=tItQARTpscHK38iuPFgcUi3OudApMLG99XMyOBTgIO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAkN2MX/xPs0+6bdlVjw3xjKL0AhjLAqImO2vFcLPhUBHagURN7emEnEJdA3UfHGYslCK2Jna4V7IBSMNb6T5O6h7FZ7uQ5yJOMigHqbmDhmgpHB5IQOFsOM0B26eBw+4q58HQlDWtnsaTLtNMrZw5LX7pm7wgtkA3l5cjUNfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJufDIHM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJufDIHM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21683192bf9so1287375ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 19:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733973087; x=1734577887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vibpjLvx+aPG1lUM0+vY3BinXBDDKRJ8RHw7vA+NIuQ=;
        b=XJufDIHM6a5Z91f5PSs8axLCGEZ6J4/VoVY/rIsA+YU8lE2Sc4mQK2UU6YsBTnXram
         OXCqj/OOceKJtN8h6t7Pk0YHGj4TG2BsL/uVgxn2+xlstMTOkJHEDbh6Rk/4e71PsSwp
         T9kAu0ZfWubx6eKQxQIZ1SW7fIxpw6m+LTNLXGoM276jFQeel4ECvu+wFPUgoH6m5ysd
         l5upr7JiU0b3R1cSA/xSfPQzUuY1u2XhmTz5hMcsPKVigjTWRis1QIbTZi1FvKsAVthb
         pCpVfdGwjssCMdzxjExLLKRKbtaCY+jQ9ktYO82yoD7IMZQipyW64fWSm3mIqkY340PI
         u/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733973087; x=1734577887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vibpjLvx+aPG1lUM0+vY3BinXBDDKRJ8RHw7vA+NIuQ=;
        b=ZqeMs9XsKId7X6YRdTP7+nfAN4dzT0pXbtQtdNMnuB6/KemRMjdV9HSed2d80APDMP
         cqq8XzeEQLC/c/no33kgHZxDEplSuDkCrcam8bJUiw+G/k1s1OVrYKLIS7l9OunOj7kG
         hQWSpufwUvckvRTtWSn6FHzg6K6Qdrke2dFmE9E2mvSOVJrAz47ix0y4IPkSaS1QoNdl
         dIvzZ9f6ACgobG9iiHSZjvJFQdyngxfGz4w+FtgfRTye3xxtVPumVPARJd4mLcF9jtfH
         9+J6MorUK99NqfDbpzgEatmeo/0pGGfhreFKX1VyH7iw1AFcvSHTIB6NRIGQ46hpohWX
         Kz1A==
X-Forwarded-Encrypted: i=1; AJvYcCVchPeOZoKueEdZz0rSBqhC4G1DSXHccgr5PsvvI78XE+A1KcFZp/zK7fu/cmVNPYU26W/neLwc1fSjgT6d9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLC/xN92qdrpv9AI3crj94Ohvd8LrP5dVva5uJL1QHhnJmXsb
	odhQAcx0dY16NKYpvhqiI2fTWZQgITdFcihd9Go/HhyxPVpx/QIr
X-Gm-Gg: ASbGncv9gWoX4R+xRIl1xaoZvL+lLS2i0M/6g83qyNHoyPMbH7eRM7+uVT8B8Q4Do0h
	BKGRVPh3BR6VXm8JBjuHihgxyTpu4mGtfwbuSp9AVF+9+9X1D7qYqc0NOQxXY04SR09mUindeK1
	QNanlIvLk0KMkJlw+siWUwx8vL9RYxfCQb4uzvg2R54Jicn8AdHc0nGJ1Z6p4wucK9NQ1nEhUle
	+GbD+kec32LOrdE9WLpCwGQgNg9lbeWJyN1/Anbk6Psb4Qc9I13GRe5NzcyunytrScr
X-Google-Smtp-Source: AGHT+IGY24+S0E0OxdGShCkZmpxF1n8Rd0Z9dGKesEPsij2oGj0BDD6ZkOCsRJLVcji0ROHvDJLE1w==
X-Received: by 2002:a17:902:f551:b0:216:5b8b:9062 with SMTP id d9443c01a7336-217786a22c1mr75918165ad.54.1733973087405;
        Wed, 11 Dec 2024 19:11:27 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09339sm113249945ad.210.2024.12.11.19.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 19:11:26 -0800 (PST)
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
Subject: [PATCH v5] rust: sync: add #[must_use] to Lock::try_lock
Date: Wed, 11 Dec 2024 22:11:18 -0500
Message-ID: <20241212031118.127423-1-dev.json2@gmail.com>
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
index 41dcddac69e2..dd187812aeb4 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,8 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    // Note that `T` is `#[must_use]` but `Option<T>` is not.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

