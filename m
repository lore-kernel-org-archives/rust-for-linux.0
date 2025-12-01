Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE87278753
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570363; cv=none; b=Zl17PoHZ8OKZdNW6s98W980hM/Nb0phj1E76HY5s6y8rOotZvKAkb4JTeLIjt2nc356Mf8ZQaZhpIolEOKSy2N71XEhpO7P+Zxx8vzZxSH1GKS68VJ/3d/wtLJyjQCDhPrVzQ27Lc/d9XrSa0Wt4kLtUz6zowsVXqyNg/L/fp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570363; c=relaxed/simple;
	bh=A7ro82FM1edXs+/+ownwRip2IpfdNYYd10dBFRcg04A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXgGJxhDB1QcfiUrzgzTmNdbD6BN1NurhNWOkdrreiUuZpR2pAJPuEkCYZ+18THPdTSk1m1yvLfi2ULL7HG72Lf0uS7QY9yJq0G4MPqED8at8IGiXjkFh/RlMfdH3WZMnoxxDmA+xJYUH2fd4+gegFKyS0QJ5D8SjF8yTDufNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLE23lch; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLE23lch"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2980d9b7df5so44987605ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 22:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764570362; x=1765175162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l24zPOGXcv+MrIeCvAd8PjXoruUegqSyldxNvKkr/XQ=;
        b=YLE23lchMsRdVZjaJuzjCQSLZ4UkJlWKKtdV3Wul/1l9txy+qJOVYr7vEZdd4h8762
         bcTpK8t2oy8y9Z6sreCqhM5J0EwJ2qMe4s2T1EQHNTDRrZT2beyTAscJtAVE4uzBK+lr
         ITa812mQdOzoq79L1UxU81YMFRR31SzOV4jHYQipv8JX3g8lCKvvl3/dPfInJks8z4Y1
         BkwQOpQyTeR2x+fVfyw4XKOyfoqavqHTEsET8JAGxAB1SYFKu6jgJF+OSfkke4pxDIwd
         Ddti4ByGoBlvZd6L5mrQdo1iTSq4Xffhg9QiDD6/Y4W66p7JbRowo/yKZabRYILtSu2/
         2x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570362; x=1765175162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l24zPOGXcv+MrIeCvAd8PjXoruUegqSyldxNvKkr/XQ=;
        b=PMkpIyIKPcPWj/lXnuoZYAxiE3D03Nsj+adLy8oHY9I5WP3cE/PSaJsTj7N3/vWloe
         eGwwbckBkHZ9vjzTUDFh2KJMnArtewLgAtUtEFtenclfx6f4zWoNmU6FKpKoQF5FTqp9
         +7+cPYFo/LqSwqMIg8UMb23f9LSN374ws00ILrOdiPeVHeJaZnReBoHh65Fa7Xd1nG0O
         QedhtUBcVfdWfJd4XvpDGJ0mIWtXgbLZzbzPvQe8jQATb6ZdZj54Rj2VxalUXoESFane
         Ncaibh/tAmLpwWwSx+0KhW81O3pMrdo+lerCX4Fz3Tn962c5QfjochQIjOOTGexEnR47
         Pi6A==
X-Forwarded-Encrypted: i=1; AJvYcCWyT7fO+KCOaRlAdki03vhzBmAH12VC34Ldu1Spx3N219MXnaTK8uo5PVekIuoysvCe5Dle1oCU63CgBfWj6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs57J7CYSyJRicCUxHHxiObaiA/uXmjvvMqh4Y9Drwo0d+aXlz
	1/FC35R/B/a28G4YWvEUTz9t264mjiO9Xgs0heZdGTcpd37uaRPIfd6V
X-Gm-Gg: ASbGnctvOO/qnH7VEQKMW1vpjizlTC3UmglLXVrpcsjgeNiE4xP8DVxaF8y1gU+r50E
	uxfFvvch9EJtqRnM2saHA0z54RF+h32ua6irV2TT90D6CXGjk/1b30qdQtUIRxzuqhDzhPI4ThN
	k4+1u8RKk1GPJezaLKs1vTFuVbD1Au9PTsKDwHOM9F2u8vh88ATOGBkvHx0CxyfRnkHBIKQ7jeV
	2qHYAGOdbNGFn554ae8uopeecpEAisAyf5BsU0T0Nf+A1ux8gavWiZ4QWLA+JsX/luGgix6MaGR
	BF5C1xUgGhunLLXpY1hcAK1dRRlZEPHRf6jGDUw0nBX80pOSV5JHywq2Uasj+u2oWL6hFN+x0jK
	nZt9ViDpkNWt58Ktd0q4JrSeVDDNolNiA1pKBTfXjOUhpyvAAoZcak3PvSY6nx84rBhl1DFXWBG
	UU6PwOP1a8LyuOwrkP2mYe1Z9KjFQw5nmuPWM=
X-Google-Smtp-Source: AGHT+IG3sV9Qt5fQfg3gW3GI/3a0A9MchGOswH6LWYTCdRWwXvAjK1iXO/TaAfq8zC1KmnmmrSyuRQ==
X-Received: by 2002:a17:903:298e:b0:296:549c:a2b with SMTP id d9443c01a7336-29b6be8be11mr433516675ad.3.1764570361740;
        Sun, 30 Nov 2025 22:26:01 -0800 (PST)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7bccbsm109831945ad.100.2025.11.30.22.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:26:01 -0800 (PST)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
Date: Mon,  1 Dec 2025 14:25:16 +0800
Message-ID: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `__new` constructor only performs a bounds check and stores the
value in the wrapper type. It does not perform any unsafe memory
operations, so it does not need to be marked as `unsafe`.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1211

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/num/bounded.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..cde1b8ba6880 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -284,6 +284,9 @@ impl<T, const N: u32> Bounded<T, N>
     ///
     /// The caller remains responsible for checking, either statically or dynamically, that `value`
     /// can be represented as a `T` using at most `N` bits.
+    ///
+    /// **Note**: This function is not marked as `unsafe` because it performs no memory-unsafe
+    /// operations itself.
     const fn __new(value: T) -> Self {
         // Enforce the type invariants.
         const {
-- 
2.43.0

