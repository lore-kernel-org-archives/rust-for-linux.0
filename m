Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3E3595C;
	Wed, 18 Dec 2024 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481447; cv=none; b=kJhRrV2GJ4FD6v7Q4Gjw+H6Os+LlzOo/Sb1i5eE1HNINxX3/VDuTW+zShhrpBANgihyBPfqZk2cWC4CWrM/zAIerqEQ49jnJL+G49f/YhfUMfD5jvwai9dYVWMz8NVWT34HeWi5j2c9shl9vrJ+rEaB1vTpCD+2nMtWVO/CBNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481447; c=relaxed/simple;
	bh=bZkN/ldshJ2XGMrzLtpscqgo4qf3gTEXchW9hdaJ0g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di3HM37kzPiTTMiquwg5yIWrjyrtqYHk7mPOB6LtiraUA2yAoyMARze7FJiDo5gFHPsoreOgABnJrhSMFkW/0S72KKl+Fh16FRSwUmscx0LsEeSD9xq1+7vYiJbuhOSSMW4ngGnlg8ESu0qhryqX7+jxAOSKUmDmhu7z97MbA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyDIRgof; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyDIRgof"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so4265301a12.3;
        Tue, 17 Dec 2024 16:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481445; x=1735086245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mPuZLLAQz0xR+zJ7c0R2B3hpZ3ubpWOGBnCDdcBCfo=;
        b=YyDIRgofYUB2Sk5+wsCnPEAwGn2J5OEEW3GM0RjP/trmoVf46scGCgPZmetTanaOBP
         o2eSZpVZ66P+65z9Io23OHJzX4HvMSLOHHTSNEZH9o1dGmOiWj+vcSCde1cH9gPBD5hj
         Aelv/347602RnCDiwc6cDHQD+Qb+og92U8oPeWEU8fRzKhvTgM3iTTJy0ar9E64hZZUN
         YvVftCM9S/1gDK5saYnJkP3UQGIl0k//B2iMnw1ld6xNY48ajzQHtZ6Q5GL83yhP4UMn
         NL1aWVvjAmdYsbtxjBkI20+TUdDRgtTCrKcVcuVjECJqfeiS6BVKB5V9QPECeoRwmtNl
         ggIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481445; x=1735086245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mPuZLLAQz0xR+zJ7c0R2B3hpZ3ubpWOGBnCDdcBCfo=;
        b=dPwevm1Sy4hC74JCz22sVP2AyEJIOkIuu/iii+0U+f/blXf4rnhTepRktHb52fjsCy
         DlwY0x+lys9XzZDNW4K7M+uBWaKMWUZ97J9OfmZjkL5jvRBot2u7De4Rkw6YSiMeHnBR
         kL6MckrOAS8fR3hMBMfEpT0hUBCIT+6YjDnPV8IVRP5Vp7rRBGOI1CSIQ9EHA9IdQZHQ
         +Q4+6kTAWqbCigKj1bCZg2hQkifIPx/4nmCT3l1ZTxohC7iYVArYIBYd2KdjJBOhh8Ch
         2r6+ytNZwC4AyH6Bgtltajf6BIQqiUyf0YvZR9IXV7Oz69qvrs5VODvl5mtI2y2nMLAs
         M9xg==
X-Forwarded-Encrypted: i=1; AJvYcCVtqh/ObNoJal3doLzKA9wkrnBtSj7eNJvq+Bhdha6GjZ8K0tDrnAUUBXVmKZybOzPl5UzIhBxmiYdB8SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXiU/1jxBcy7sV42LVUuWpS4FKtSiqFdBzWFZnIWiVYJdBCqj
	hCiPOJVtTj6D/bAzW2sKMmQucbI9SyurCC2BONsdKfoG/iGwlOPC
X-Gm-Gg: ASbGncvaQholcb8k3UIlSE5qlHqmyN1JNPQU9W4RHZ9q0a2nslKh0d8iOZ1Gu1IwPRO
	Fl60AL7PFQDmNmypi1wkoWu0eJuyKmu5b9Dff5bPMII8sAdq2nrFhS7pC/GNBthp1BjKa9MzT4j
	1WozrB6FJtUIBqrzB8LZ7/zDDItDvN0V6cWfEOrHba0brsksLIzIpuHP1Cf+WlbTr7xr8++oQr4
	Fj+8MqTLBvwOte+dKWivGIE57OHS7acmJ1uJWDUiOhymW7qj6r5PPfqYPe5oRjnDA==
X-Google-Smtp-Source: AGHT+IFN022Ko1UAapR9BqL7ayjjA9V+SEsULzfCMncP62F7iYPlrGA+5vKE7Cq/bHIZNYRSSBj+lA==
X-Received: by 2002:a17:90a:d88c:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2f2e91a9af3mr1324795a91.4.1734481444836;
        Tue, 17 Dec 2024 16:24:04 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::5fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed6417d7sm97932a91.23.2024.12.17.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:24:04 -0800 (PST)
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
Subject: [PATCH v3 3/3] rust: alloc: Add doctest for `ArrayLayout`
Date: Tue, 17 Dec 2024 16:23:12 -0800
Message-ID: <e683a5df7d66cca81d762803d602fba62bdd5905.1734477232.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734477232.git.jtostler1@gmail.com>
References: <cover.1734477232.git.jtostler1@gmail.com>
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

