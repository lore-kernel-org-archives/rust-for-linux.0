Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06781D318C
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044989; cv=none; b=C5qZ7FNWb6jIaWLC2TI6bTuboF/KzJbP9SthtmE2cLJ6h5fN5dlY2Emg9I249Fe5lrqWRZH4Q7jUcOsTY1zdni+ozSl/PF5KpZCPMg7Xc2QZBx82lAoi1yC5qkK2KiUXoC/tnzKo0yDIPf8Six9Yt5cFty7z132xh4Px1mttFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044989; c=relaxed/simple;
	bh=KBpBpukD3hqn5RRhnhu8PuBbzQuz3Gic2HKYiaZdXnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5sqsaJtVfM6sDjclDwmF5PluuqzhA7ElFa2K2bN7HtZPjdgZGy5w3k1PR0RlL+zLH04EXuqs2g4No9XxDVnURyTK3/WeBQtwU/G0a8X4epDtUiR/afH5KxMvgJrrd6lynAkrpNh0Ctdbeh9OrFQFpla9I+tbY2u5jBuwue/j5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=TFYLSaK0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="TFYLSaK0"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso31720341fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732044984; x=1732649784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ijS4YF5LBiRl4QKL57y5/KnJRvVlKom7H+lXEr+hTY=;
        b=TFYLSaK0b2SykWlTadGAjx9qRcXg/4wfucJa8ZHDeSawh8KsUFCbJgtRde2Qd+cHmk
         aDo4VF0hhqDrk3kx2vLza63giqa8chyrNMtWC9b7vxpB+kzkw9QloyHzZkQnYF/5z1Al
         t6Das5oZVrhTHM0rKrF1IJ4OzkluPHSQ7EQUW01b5UG4ujCYbvlSDJLUgEWYesYo750r
         xFE7vjqGJgZpzBqJbizcREQ7D6oe3cSJJL8QseXGfvvQqaQInuwRwqJq6tn4N9RPFanN
         Pw2nW2eQCKTLe5MqRQ9bynaY1C5AYl6BeHMmlbiTJaiGllheiCmPFobgyoGVA+t+kX4F
         iBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732044984; x=1732649784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ijS4YF5LBiRl4QKL57y5/KnJRvVlKom7H+lXEr+hTY=;
        b=rK1KEVobcblzBCqRtD0SDW9NPOeZdgWk9M1siGNxxteT65bpwxTrkrbPGucJUUvfcv
         dfjJDRp+wlfYSgdONwOMghiY+A+97pmj4LSrFYqRQhwlM4kTOepvJK1iUmj/VPKEnBGJ
         IvjEx7IvbM5jjd7Y2Gepv0X1syq+5kGIC1IFORHy9meog1TXOVl4kTOgn5s5K6Fiv4QS
         w449qXkTvXfsDBRah9JQ9crzYRZH0JnHH6nYQWhm7aKc346We519PAE4cO5cYOSvHdJI
         hUNBKYv39JSHOhXfB3KRoveCzJOzoD6Gn5ME3sLYQBUUYrnV4/ihTI6yp7okUecibKDG
         RxKw==
X-Forwarded-Encrypted: i=1; AJvYcCUQWt0RnCV3FlO365Z3fNijBOjy4I2NS06zR2fd+oV5cwGqxh7yEHXVKCM8IaldviJqfjH7+K2kSgMDpWBsEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxUpj7qb6G+rphjmGb99NEzwbVjIlSaAT9yaAY+mD7tiJCqTE
	rhivPIJ5Naa/qaQzZvYeqF8wPaCkfndAOlCzksRc+5yYDjulXFUmfNp+s/6B/20=
X-Google-Smtp-Source: AGHT+IGmOcGCkjiPDAr9pcCrlN+V1gWgkhb2UAzuJnZbTSj8b89Dk5wpcvLAJfDJm/uMMumnXDyM6Q==
X-Received: by 2002:a05:6512:10d6:b0:53d:a9a4:73c1 with SMTP id 2adb3069b0e04-53dab2b9833mr7755249e87.39.1732044984206;
        Tue, 19 Nov 2024 11:36:24 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm203127355e9.22.2024.11.19.11.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 11:36:23 -0800 (PST)
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
	Daniel Sedlak <daniel@sedlak.dev>,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 3/4] rust: kernel: page: remove unnecessary helper function from doctest
Date: Tue, 19 Nov 2024 20:26:40 +0100
Message-ID: <20241119192715.38282-4-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119192715.38282-1-daniel@sedlak.dev>
References: <20241119192715.38282-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doctest in the `page.rs` contained helper function `dox` which acted
as a wrapper for using the `?` operator. However, this is not needed
because doctests are implicitly wrapper in function see [1].

[1]: https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html#using--in-doc-tests

Link: https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com/
Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off: Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/page.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index fdac6c375fe4..f6126aca33a6 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -57,9 +57,8 @@ impl Page {
     /// ```
     /// use kernel::page::Page;
     ///
-    /// # fn dox() -> Result<(), kernel::alloc::AllocError> {
     /// let page = Page::alloc_page(GFP_KERNEL)?;
-    /// # Ok(()) }
+    /// # Ok::<(), kernel::alloc::AllocError>(())
     /// ```
     ///
     /// Allocate memory for a page and zero its contents.
@@ -67,9 +66,8 @@ impl Page {
     /// ```
     /// use kernel::page::Page;
     ///
-    /// # fn dox() -> Result<(), kernel::alloc::AllocError> {
     /// let page = Page::alloc_page(GFP_KERNEL | __GFP_ZERO)?;
-    /// # Ok(()) }
+    /// # Ok::<(), kernel::alloc::AllocError>(())
     /// ```
     pub fn alloc_page(flags: Flags) -> Result<Self, AllocError> {
         // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
-- 
2.47.0

