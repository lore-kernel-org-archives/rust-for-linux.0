Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748636682C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107803; cv=none; b=u2pyjGqzw/SFbbZlhDLwPBDBfXmQbVIVcCnJXzzqtf80mKtuJiVkcckuIu2uHmQN3n/Eps9fhg/+tofebIJb8Ltzu85Y4TNn++BFOSr+en3v6g0Sf+jJuibZkVzDl6p3vKBD2Fk4ONTnDzdbnerYq6Y6t/AzXwKWq0YhYs8dM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107803; c=relaxed/simple;
	bh=KkgNV+9XnsJthpYdREMu1pFIo1qNSX7K4guiTPBi6xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhNcLou0ACl5KOZu7804OB8QM1ApOcLVOLWXQoFmUnHqza5Z37dg9FXsAV7HxR06Lda6wz1ZcHtWrdGMHTRdDeDCg+WkT/9CDS9dTUc6WLVBNavGVqknUj26udbcwy4+R4dMYE7c4BKLBRwoqqwb2GGEbJDp3LsKPy5QEyI8T7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b24FUTEm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b24FUTEm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7d98c1879so5063065ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107801; x=1772712601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NliQdJsXOfSkSTd/LqvQJ0RqLozAkGxmffNgMFgruY=;
        b=b24FUTEm89Q8fZdL8PRrgYu1eck9FPNSxeuEvftkBP/38011BqU7Wj7mBeI4dgHsll
         98WdKogAb6o0nJb1NZMYxFdHb6PNwFT6qr4shuv8GpJVV//WzLt7MZGETxXnkpOLzPbD
         G5BzTp0Yuw91x02pS1v85S64Y9/9tnMM+rhm3ekWeo2aeuUwwPthQzlb2BFGoK+IrX8n
         Ic93kEBQJMprbhR4/1hPnCBUNk1CyqOedzStjka87DyKSec/YSNjnY6jcuyN+4iqowLZ
         qlVWvm4LXjnIwVw+eP/Cd6RpNHQPfLSgDdxsPGbFnZIRcvYyNnhwHUl8EhAdpG1GFMxw
         rmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107801; x=1772712601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NliQdJsXOfSkSTd/LqvQJ0RqLozAkGxmffNgMFgruY=;
        b=SPxgCnEL4UxMV1RHJ9sTmJi+VFEbkV8UgNkKxFA9lZeXHrHotLuwdboT+Of8/ibGDX
         LoIClQvm1UcM4rMtE86gUrjssYwGrX8toiTHQ/mu72M+BBXnlCZgm2nbEdRewvdKMi9G
         de2YegJToZKudyDMdt97AE6amCvm6VcsupaRBGj40razNs3g6K6I90b7pBCctkvIOIt8
         qSHqJe9d1fhl8UpuZePIs4gX8lvtpQOlGAyUlZw859e0bKksiXvwdTN2jcLwutmNkDfN
         fD0gIGTO84h34rndgs3osyWVmlS3Uh5XfDoyY+w7gRUjz5POn//wrXvTTKNTVru5T+tk
         KIkg==
X-Forwarded-Encrypted: i=1; AJvYcCXnniJ2GiP6Mv4sDDDSw9Qs9f+oEBCB7o2SPVEA43nUnRAoQTxHiXghNU6uO0TJbZMqky473/S+pKBbV8Q7/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82U/5uk5MkEjhUrgvoLVuOGhpzuSJLohFFsVJEr4AnI7/STEX
	qwZQmScnTh/we9Ljso/RsFvWNrhiUEmzI0xo08HZGk1KRYU4pBPvfCDz
X-Gm-Gg: ATEYQzzJdov2+5DsHKLCwILODcXW/J1n6rGRMcYUtcHBLkSQYur5W2Nby0H3Onuj5H7
	SDxJE0QzRDvMWKW6zX7ptWDl9J0quTbA+U3/s84nM1B/RSifKKpWqNm/YXv3PbnmPXK5yHVmrgg
	YYFrEnYTTQe8+2nFe/lDj+FKtGfh925Yit2ySY11yqvcqP0D1UK1MnzKY6nAvo8g8qhxYw2Fsgz
	xZcpsHTTlu4GPr6YRCdVUcBBg8nLsLHLadgxkd64nBCvUUYnE6lq3wxq+EZY+NSv8/mGUqyisyy
	mh93h6aC7MUx9Ip17rQoIEorbFB9p+KEJPKBYmU0rjULRtYon2deO4dNzKXOI7BPdWlKNPriMPs
	uNekjZsSuyEEs9YdhPibLtl5Z1UtwaznHAcVv1/QMVASiQFyHwrvbkC/LA7NpibFltRm4g0P05L
	vPuAE5wHIXlMtkmLpJgVJAaluI
X-Received: by 2002:a17:903:1b44:b0:2a7:919c:34c6 with SMTP id d9443c01a7336-2ad7453c0ebmr195383715ad.38.1772107801489;
        Thu, 26 Feb 2026 04:10:01 -0800 (PST)
Received: from archlinux ([103.208.68.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6cd476sm24199525ad.75.2026.02.26.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:10:01 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH 1/4] rust: error: use `pr_warn_once!` instead of `pr_warn!`
Date: Thu, 26 Feb 2026 17:38:45 +0530
Message-ID: <20260226120848.82891-2-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226120848.82891-1-adarshdas950@gmail.com>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the temporary `pr_warn!` call with `pr_warn_once!` and remove the TODO comment.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 rust/kernel/error.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..562e6daa9151 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -124,8 +124,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
         if let Some(error) = Self::try_from_errno(errno) {
             error
         } else {
-            // TODO: Make it a `WARN_ONCE` once available.
-            crate::pr_warn!(
+            crate::pr_warn_once!(
                 "attempted to create `Error` with out of range `errno`: {}\n",
                 errno
             );
-- 
2.53.0

