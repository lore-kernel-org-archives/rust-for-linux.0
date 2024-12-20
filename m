Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9911A7AE3;
	Fri, 20 Dec 2024 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675957; cv=none; b=L3q7AuDmNTM15dfeoZuodzS64tLd6fMOx8YXdsa4WEBHS942v5KcXoK9itNRUTehxqLh66kyJj7PFCygt8cJsABPFs1c0b3AFq7+zUsLyZ2CFk9Z872QPC7EtOwVvy/R59bWaplsS2I88vsy4qaKMfEjoIUMQ9MZtWk50do+sqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675957; c=relaxed/simple;
	bh=45r5CkfXaRfA8k6UPfZo/AYWxfTBHCuIBcIPhexJu6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBO5zXqwJsMIkqJUkOOPQJEX1n3bpBWRgfealwy0P5et5XVNJKKs3Xg9di2w1F48eDFABLOXRYfEAP1aQcLkmxwNdgggWUdVdN3xCmxxr7DapZI77w/HpBCITYMv9ktureLjWoiNvwo7lDDg61VUhcuHevvaZMVK6eXGnIOstBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3SCSb5T; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3SCSb5T"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so1469485a91.3;
        Thu, 19 Dec 2024 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675955; x=1735280755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyT4mYXo1YQCFF9gA4c96TOQBnOi8nuKXB5eYWwMmIc=;
        b=W3SCSb5TnHgKd/P7Vzi82XXui/2rpyxSy/RT+82Fp4pxFhu86otldI/kinn90vFOr+
         Gv9IG9YWaPaYQDuMQDITrU9Zs7dcKPvvK/LTs3WcnmTdbNjWnAsMrLESYIfKgiXvQYOG
         VQC9HTT5SUifm6V5gNeNYaQ7RpmT3NuvpOJqxkPorKc9p9mcAhEW3ysUC8daCtwnInSQ
         V7mSsDgZeC/Tj4wdVfoCseCO0AyGWdyiIn/yq09PLqNypFLA0MGTDR3qcCe4qhfQbafd
         +GfnQmtSNuVckb5SAhtfXLAUFyOoCAmugnd/Stsfp7NGXtSqAu4dq7Ve4mXPLxAMq0ic
         Zwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675955; x=1735280755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyT4mYXo1YQCFF9gA4c96TOQBnOi8nuKXB5eYWwMmIc=;
        b=lykWncfwTKZ4bKWGY+h0HV4N4oHl3zhbUIXNJSk2hMd/ewYUbOTsilPUVxJ6/UHHdR
         Ouh0wRBmEl6Y0GHFAblKfEwWKVgi/vu8GTyTOQZqng6ldiQuA1aaB7ubvemxVPgCdNyo
         szYCHpm+VHUOZRAcF+7DJfzDOxgfAvTAkbhqKUyldsEhdn1iXI/2FxlpTUrIQhhAW+OL
         +qxGrBzdIOc5dxJLZH6MU7mMzoLhuEpJOky3p95rG29lQjR8z0p6vS40easpJj+pNnmG
         1fRwLnX1DORrmDFJ8OrdIzTp4fJoXyevAtkX4145onHzaBINN2/s2zZhElC9WBpz6IkR
         rh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvtlz/6By61kNE2GKAQo78Bqpecx5mXQl1d+3EPyQsOIVawJZBwxVht1SQxU7suQYEc0HSYhfp6T5Ficw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMQD+Nqz/tYyvjSncqb6idjJo4P8DmJJXfgJvOf/G0NSEQRq+
	x8NQEe5YHFtXMohekZ1P8c/Fajfh9X4/uxIzBVHmUjX6ryEhz4HV
X-Gm-Gg: ASbGncvEYIu1UnXxaIeUs7d/rZ1N5zkQZ+6a1vefvyHGYHW6gtWhWMW7BRD+rMSw2Nd
	8potXmkKyBBWTeO5jZDKkHGrZbIvs/ebZJU9fQM7AM96kmCqGL6lkk8xur3PIOYjiHTm0zmijLo
	t87/OU5XtlMISCsJzHQHczHwaq1FaVUi2ZgJCbtvH1AldISw8NNdz0k88cCUunbXayCAUVbA04u
	BHPmIJf92fk2BnQHpMPCah+KiYWtaweIXexPx7kGYDGvffU+2Z3qzsVF76vTspa6dQ=
X-Google-Smtp-Source: AGHT+IGkFL/ahSvpPa+HcOrq1SI9TntkFeUytxDlgy8T9FLcyGQS561knvKv2eD0hGEXHKeZaY5CQQ==
X-Received: by 2002:a17:90a:c88b:b0:2f2:a9f0:40b0 with SMTP id 98e67ed59e1d1-2f452eb3dd9mr2487101a91.23.1734675955144;
        Thu, 19 Dec 2024 22:25:55 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::b10a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca007f3sm22001755ad.228.2024.12.19.22.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:25:54 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ostler <jtostler1@gmail.com>
Subject: [PATCH v4 3/3] rust: alloc: Add doctest for `ArrayLayout`
Date: Thu, 19 Dec 2024 22:25:33 -0800
Message-ID: <f1564da5bcaa6be87aee312767a1d1694a03d1b7.1734674670.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734674670.git.jtostler1@gmail.com>
References: <cover.1734674670.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a rustdoc example and Kunit test to the `ArrayLayout` struct's
`ArrayLayout::new()` function.

This patch depends on the first patch in this series in order for the
kunit test to compile.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1131
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
 rust/kernel/alloc/layout.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 4b3cd7fdc816..0e053dcc7941 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -43,6 +43,25 @@ pub const fn empty() -> Self {
     /// # Errors
     ///
     /// When `len * size_of::<T>()` overflows or when `len * size_of::<T>() > isize::MAX`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::alloc::layout::{ArrayLayout, LayoutError};
+    /// let layout = ArrayLayout::<i32>::new(15)?;
+    /// assert_eq!(layout.len(), 15);
+    ///
+    /// // Errors because `len * size_of::<T>()` overflows
+    /// let layout = ArrayLayout::<i32>::new(isize::MAX as usize);
+    /// assert!(layout.is_err());
+    ///
+    /// // Errors because `len * size_of::<i32>() > isize::MAX`,
+    /// // even though `len < isize::MAX`
+    /// let layout = ArrayLayout::<i32>::new(isize::MAX as usize / 2);
+    /// assert!(layout.is_err());
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
     pub const fn new(len: usize) -> Result<Self, LayoutError> {
         match len.checked_mul(core::mem::size_of::<T>()) {
             Some(size) if size <= ISIZE_MAX => {
-- 
2.47.1

