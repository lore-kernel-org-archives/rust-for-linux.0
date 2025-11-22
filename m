Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB882C11C4
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763838585; cv=none; b=Ro7bRT7Evl6RLkURBBQA9sxQSEWrfBKb0Ad5SwGA1jhv/a706rGRQXyEFMR3Rwg/kW1au6PBGrB9FW0Q09rF7LCgzli9oKmJj5EjgFnqq7ovSdTdDqNk4tTevU2/VVyFc7cEOmtQVxOvTYc4YZMMCBy6fj6TqBVPIDkHHOi5i4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763838585; c=relaxed/simple;
	bh=qJ3U5f7S00O4PVFLpoe1rxGgXP76D4a2BQqXWP/boAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJ33qi16UFndq0tln3oDXVjjiO/61tY9dvxjHRI9vTNI1W7L/MmO50nZAWAo3B2jSLExRwECeF3fsanUjz/lL+GujxEOLT6XKDCgfZ1aizck+FjogIWCNdOOh1aWpTB0ReqmpfgXwu3mUwrmAXI1XdfJ89JG7WmGpE02jGpSpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWmnXgNL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWmnXgNL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-794e300e20dso2185268b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763838581; x=1764443381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9nHlyikDXQbz4KH8BckZerXrDqGPJUNjzdjJ/ii1Vs=;
        b=TWmnXgNLnjb45K71bwVEXsFEtfQm9F1h8RdRENmezwmDwaRNwjvwidAmu25jXJ3KwW
         dzg0oohiTh+Sz5TiMAKCFTNIzZdytqxf3Cax+zNj8sd7Mo61Sn8UpcPgHDdy29S1xWuj
         ZrRL1yEN9FG0di39JJKvY9DjG0mO0WDNwZ1geAF+ZPs6o6mEGsH019zOeW+x/D/SrTH8
         QssyINw7c+Bq5Fbf+QQlBbUOQBK+FUDnnWNq1IqTSgOco82jXkHQZBeqrhBZz0x1SsQs
         ulV32pf01E6ygHxjtoXenkAKhUyP46h7Wy5Pegel6udbOXjjjfHTT6n5w2QI7SBKAafO
         a7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763838581; x=1764443381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9nHlyikDXQbz4KH8BckZerXrDqGPJUNjzdjJ/ii1Vs=;
        b=TZr/QDh0rv2DcJsjXGQk431/xCTIMenGxXjWqwMACeS6Y8XZjlB+cb8Z0AYhWpn5Sn
         3Q4PqTqhy31AzwXZaToiu67+Anz9IzudMZnqjtVLiMmAJ/LJdnopZpOkE+388i4fTqlp
         XeO4L0rFDjeLR/iF2YniKKr1iG+uv+QKAhfYj9gt7445Q+loFlwAWYn38RjngfZtKr/+
         jyqrJx/V5rEjAXz/kYkPdGzp/mWIVAbMnj+IaScKNduA+LvSOqTO3dpohX9U8jebcMQ6
         Br/l35UaVEpZn9J0LDjpDyH3fwyXOuShNjin1h4EPRdQCzjP/4AbzVT51Ru7ODY7HnuB
         HNPw==
X-Forwarded-Encrypted: i=1; AJvYcCW5TEhaHLVUzRtAPu3Ea/fhixsnTrfAcZsZFm0b2uciInHnMRyNHRfzvTZTWp7RJ8wu+9fZUbUc3Bp/CJk4aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8mehNk3gmhtUGBAEqzkTzEs1EypxKLab1JIVZ58RfLFGo7Jj
	jFoRGlxK2aNXv2HPiXzoJ86sXqYOtXrSV81aOyGLcDcqWghPr83fBp38
X-Gm-Gg: ASbGnctwMHl//6Wo/GkjaWqGCYdE5j8VK6jaes79PFNE+YgvyNSg7+npJzghGW+HDlZ
	6IhvPmGhOG2avSvukODY2bs7opnO9zwNwLNeQC5tqdVIZ9x3OUid0d6ac26wLPld5wcc9PiBWRp
	4Smw2bGm2pOF9S/uKs0YVdqJh48yM1IkAMntbEjiRw8DVCS+PcdrzvqQXiEA06pBntHxDjbJjRw
	/UmwcSZhu4p6En0YqMikkJjsCD0gRVE73c2XGCAswkrZ4v1S+lL61FVyCfIPas8/L2/LYsxGQeu
	sW4+XLXQhlx92haVKAWl3L2F8C3Yk8rqQ2trqBzBNnFklKIF4E7UOm4WW5jUHW76ci0dpXIkXdy
	j5pMpdua6ZaVejeObEIIQf1Bdf/PgBJCRvOmn4QCiEJ8XkIw3PuT2HcIBXascCWpXynPNUGl41W
	DhThDvwNRKFuC/W0cyFf6KgfgYElrI09QTgYnBTlJUbCZiOqwhCu8d5jKtEhaOLh4JRsYuJDra3
	BqGJ3W8mtC89S/h+TQ=
X-Google-Smtp-Source: AGHT+IHb0z+PhBCccKtKvngozSyJyneBKff2ARjc3QTVZMUW2ZYA5yjzHM0fi+L0Ka1q21FMC8v9Zw==
X-Received: by 2002:a17:90b:1dcb:b0:341:1a50:2ea9 with SMTP id 98e67ed59e1d1-347298c120fmr10992972a91.16.1763838580709;
        Sat, 22 Nov 2025 11:09:40 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c1e9sm8869211a91.15.2025.11.22.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:09:40 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 1/2] rust: kernel: document safety for rust_fmt_argument
Date: Sat, 22 Nov 2025 19:09:07 +0000
Message-ID: <20251122190908.259929-2-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122190908.259929-1-knavaneeth786@gmail.com>
References: <20251122190908.259929-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a proper // SAFETY: comment for the unsafe pointer dereference in
rust_fmt_argument. The comment explains that the caller guarantees
the pointer validity, satisfying the Rust-for-Linux safety documentation
requirements.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 rust/kernel/print.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d220..49fa87dfbce8 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -24,7 +24,7 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: The caller guarantees that `ptr` points to a valid `fmt::Arguments`.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
-- 
2.43.0

