Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0616FF44
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355444; cv=none; b=O1+hpvQXMrNHIhMF/SB2OKH+HLaPHx6RICnhyE1eI8sl3mvUTMWRd4XGx9ovknzrOFj/H6f7Vg8ePQpKBE/pdmnuYrkigYWwRIIMuhoHP1kxYuf/vSuD+hCePzOUHCzD1ZUfYOUMuppofS1emgUTjZ2l9yHq3o69quwFEqtckbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355444; c=relaxed/simple;
	bh=4N6XbbFHfS5XVvuOR6n7LR/lJMzriVidhSXiXcHE27I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDGeVwxdTK0SIQ1mpz7g9j1hR8ZGm81RDiUmavUY4iQYdR0DZI5DmBIxKODXiw0Bg/VgDfQBOYg14F1XMGSzr1FmfXlKK/p2is7EXqSMkIQ+g+nzyhQew9ZsF1stUWTvP/8rpArhNzuzeyKkBgGuJkxZpOeBup2JDgS9SQL8G70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=kz9sqhRi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="kz9sqhRi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so3262828a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732355441; x=1732960241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC8m1A5+fdpb9ETJv8ndHzgp1VpjAlkQAfdkiQ7C/YU=;
        b=kz9sqhRid/Lws6qo8MUw8+pBA+CF7INtx0N/AE2AL7D6FB9PaZnrmKzhLOkSOGboKU
         I+978XEhNDuExh6Po8QG51iIIlgQglLdWZaKTI8QTEIcvFjMHs97MWmJ0pRfoTFy/Day
         hkhXabBRIF2zfSAstDBqx86O0NJCOdoRZbYuaHl+Pc7JOR1sQkCLAdEoBVB0FRkGHV9C
         TULyGEoHpeW+Jvn0nVlwMTNITua62Fgxo1iJQ1b9dwCF5IsOtCe+gWjoeLThFBdzLAAM
         ajhEVFApnXrHR6VYRy7OscBirHHI0ovVXAoLO7tAAr73h9sguZaUp55hEqGwnMnYByOg
         i3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732355441; x=1732960241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC8m1A5+fdpb9ETJv8ndHzgp1VpjAlkQAfdkiQ7C/YU=;
        b=lKwVXq+1s6kP5GIaDl3QoScrYvTfUq7byQY2WDyY/0HJItKBHqdupMh395lfMicoGd
         XCeGBGtU9TsiAiZZmMI/Bm+komzDGDDMUBWLBeBHudGlHKfkFwf/aH0mIOPmlTRq+EED
         mMduA01OFpe1m09pJD51Qp87aDiJsD2cgam9t87Gs/agwz3YMNLx0eVle7cj9232H+vx
         Yut8F7XhQ9MTByONG9SNIRlooOgOh7haM3piSnxBuSQnHLJ3ZNwGI2zmACSu988Oz0Ml
         7RcjKNgn8ubeFc097U7mlqNWbgNpfvCrcAjQF8GQZAi54cS0K3o7sTJkAfegS7KcqshG
         TWmA==
X-Forwarded-Encrypted: i=1; AJvYcCXrJm40dqcJ0AHsncRcsKSbv817omEXa4vO3W0svvngImqSy9QZ1NujZmHYg+Z5dP5qugRzqB48a7JLv7HAMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fKkVbX9Nj9aIWcjwBHrJCl5gOGcIAPkXe5qKs0o/VrF/kfnX
	g6clErAlhOHNcxUdi4gBwru4HqyauaGIh8X0VWdFveKpU6fnjXP1QRu6FX4lseE=
X-Gm-Gg: ASbGncv2t+xE3vNU0tng6DjoL7YhMcYZ4jAsbYAtNzd4pSlA3DFTC5O3cjx9WX0VnFJ
	7wZMyGoTH5otZxJUZHxqnuIUJVMULz0rJN2bZ4dKGZN3RWswGPbNQf4KljEj5kcB5J5wfKUl0rX
	A+zC7tk0Shui/DFzWMCM+N0lltlCweLnbo3PkzuQ8A7Uf02t1RKg7ZdBf6R7oLBa87BEhgz3ZgZ
	Vjd+ATh+bWlMwPfZTL6F7IR08MmUPqm/mGpmrT6rKc=
X-Google-Smtp-Source: AGHT+IHkqrc6ieDBbLFaYFoAnC8UBU65UkzX6CqMRz3pvjL9cz3vv0Fj86a3YiwRDFH8vf1sJcUdAg==
X-Received: by 2002:a05:6402:4492:b0:5cf:c97c:8206 with SMTP id 4fb4d7f45d1cf-5d020695181mr4930200a12.25.1732355441496;
        Sat, 23 Nov 2024 01:50:41 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af39sm1806918a12.82.2024.11.23.01.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:50:40 -0800 (PST)
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
	Daniel Sedlak <daniel@sedlak.dev>,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v3 3/4] rust: kernel: page: remove unnecessary helper function from doctest
Date: Sat, 23 Nov 2024 10:50:30 +0100
Message-ID: <20241123095033.41240-4-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123095033.41240-1-daniel@sedlak.dev>
References: <20241123095033.41240-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doctest in the `page.rs` contained helper function `dox` which acted
as a wrapper for using the `?` operator. However, this is not needed
because doctests are implicitly wrapped in function see [1].

Link: https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com/
Link: https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html#using--in-doc-tests [1]
Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
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

