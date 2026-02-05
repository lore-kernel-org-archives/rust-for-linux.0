Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467C2E7631
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 04:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770265416; cv=none; b=A9tet2d5fufI5ZCtmx860BPWZzzvILiA00y7x0+3VqYA/kuihSZ0cRx1II20DQM3d2sSBD6omj5dYS9Y4RB4eB+yvl2L58jwYuc5DRtyyj8NvpbWVM+OFbyGGZqtQE7irdJZhWDigqf+1lAhJICS5M1nliY3S1pgL+fCNd5HGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770265416; c=relaxed/simple;
	bh=jebVDHQiMzpD9h1nlRU1tfea/zh5UxIJ4reuJJpTc/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krAT1PNwveidQ9DCefS8JTEfHmRlcBuVc60fj0qyZPG1yDwDGZPDEXIObENx5D0G9ZlttzfBnKZylwDyuiePQRw3luVgkakVG4SXKk2iUZCjZKu/mCnrm8tClMf7LsEGeT1QK8MM3R7wY7HwCqOhVTJyHYieoDNAb+MiW0TntFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ker/U3JZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ker/U3JZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09757004cso3855565ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 20:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770265416; x=1770870216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUj8Ofs9pFmUDpSvtcIVhk+ld3584XT2y4BejegH4Kg=;
        b=ker/U3JZZS+emZkJRaDsy0OaXqgYfHFkKaZJk52ejDIC0H/ZbiImdRF/hdaXVsZHF3
         e+YXgBi32Tg8XO9LqOyJYWGg5rLmAhmCiXPNbtugq29RmJdaHaIL6dVRxjPymML3HdKg
         wH049lGXLYRiLbohBFZPrn3RpA15VFBqyIktL5rTBs+TjYRW2ac8P023y/P2wZwwg1pS
         1iSHSZF6X80wBbGzsQcTN1bN4iLdtS908YApoauABNMEraKz8py+mzF4ShK9euwvVRGU
         L5Zsbr0uls1H0QFIo/LzDBlPQ978thOElYNKI/BFX3iZ9OiyhXj0AGfBn7gBlrn3aqZo
         yAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770265416; x=1770870216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUj8Ofs9pFmUDpSvtcIVhk+ld3584XT2y4BejegH4Kg=;
        b=Fcp3n38UeriX+ZvCokEN0IpLNbLi1QBj6j9nlHm5bSkbBlCs3aEB4lCrVg6wo79XES
         iK0JsI+7jWi1TkX+TR4QEOunU3MEzRzj9oQP0G2sNUszhWrAR/vsVIjimvnbv+Av+dQ2
         lsbF51uSsgHHAnxgJ7bN8dDIJw2Y8O7revWP8pnSYVp1bbiSgYWhK7lozueoiB58rc1u
         6/aSoJG39yDd64U5ARcsdwjipe0i9r/UTExeHSfGHsED58KZLeyss4myr9bosz2mj7xp
         4e6iNfBrWOAIaTYIoVINmYxbiRuZukQ8RMCQqUGC0CRFcU0JyM2hdC3PnNSSrrXBldxl
         RSOg==
X-Forwarded-Encrypted: i=1; AJvYcCUdMQxIunTT2iw8b4wIwx/QDdRI/PETbE4wgOSG14az+r5FMT2yXLIlc5kMih8D++xUar2+lN7R9vmyFRzBlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YdsH7fg2Vajwwj6a9GedMC7R+ZZOXPGOPUNYGo2gDsWb0Kzq
	IFyvaNJLENz5xLx6s0AktgEntVQTjDTOSV/Q6j7ZhoytdEiwy9QRuxhD
X-Gm-Gg: AZuq6aLtNiQcMx2RkaJFfrGn/6gMuYUfO6sQeJuCVpRYzB0g7s54ixebTJn0n6NIk1Y
	QTcCq6Db8avNStd1abwQJWhqdi2Jv/UmDjHeTxcsI+HpZo517p8LsjVfgfJsp5Z+S/nyH8caRbf
	fmeDFQBUKSj+44f3MJoshHNlvBoGU7scySw2jCf/NYaqb8YrWWGKVjoOF5BzMQuJxA3bAd2RO/z
	k5KQK4xeBp5jOXFPtjoZZUf4jULCrs9xgMG/KgLTi+lz0/SgvU73JqzYkZBJIabHzK7nq2yS9w6
	YJFfmgZELoCRBpUzbQD3m/SOQGL38pyArNigvfLtcKgcOwQVz05RqGmI6r7y2BBAkrmNOuPwSEV
	NNl8bIOnriY+m2qAKj4mFdVs9grobrDnVMxXruK8drMIQMfSCvULyiwp1zsKeTy+uB/gfBCcotu
	RyUSUOSIkgN6sBW13vY5yBCGPqIR6PPumx5Cn870lCeUpPg0Y264H3Lg==
X-Received: by 2002:a17:902:fc86:b0:2a9:46af:2317 with SMTP id d9443c01a7336-2a946af2a48mr2457845ad.46.1770265416039;
        Wed, 04 Feb 2026 20:23:36 -0800 (PST)
Received: from localhost.localdomain ([103.143.106.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9339664b1sm37658665ad.68.2026.02.04.20.23.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Feb 2026 20:23:35 -0800 (PST)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	gregkh@linuxfoundation.org,
	fujita.tomonori@gmail.com,
	andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [PATCH] rust: print: add safety comments for %pA formatting
Date: Thu,  5 Feb 2026 11:21:32 +0700
Message-ID: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety comments in `rust_fmt_argument` and `call_printk` were
previously marked as TODO.

This patch adds the missing safety documentation explaining why
dereferencing the pointers and calling the C `_printk` function
is safe in these contexts. It clarifies the contract between
`lib/vsprintf.c` and the Rust implementation regarding the `%pA`
format specifier.

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/print.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..3e6ff8f42d95 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,11 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: The C implementation of `vsprintf` (in `lib/vsprintf.c`) specifically
+    // calls this function ONLY when processing the `%pA` format specifier.
+    // On the Rust side (`call_printk`), we guarantee that `%pA` is always paired
+    // with a valid pointer to `fmt::Arguments`.
+    // Therefore, dereferencing `ptr` here is safe.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +113,9 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: The format string is constructed to use `%pA`, which corresponds to the
+    // pointer to `fmt::Arguments` passed as the third argument.
+    // Since `args` is a valid reference, casting it to a pointer is safe.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.50.0

