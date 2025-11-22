Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E42C1584
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763838588; cv=none; b=TCjLWQAzjQzfbs+a7BbZQ3ZS80kwEZsU8V0MTY1xYobN8wpTjBxOyeLvoS4NSxrRb1dezUN5ZfaJOIAORGCNwxjUjZAdvaRo+2uC+yRbFxWm4GLGy6mMnP8BqQ/gQTRDH1bsKH4gFERRHkqUtWVAgjxI0CVHq36HIkVDSOvuYmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763838588; c=relaxed/simple;
	bh=RZsgM80J0Egr4NbtBLTBbbMXEw9RXfC+TWU5I6gRC/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwgQK+bNOuoPsgmUhQxiteMD1409IyHsE+xgqbRqc7XDuQekHZ8qi17OgA6yOo+QQFSbh8h6dNlx/5ngXjcriAeNRIX6bYmiBoapLM8UkSQQV+JoGlLJSfY05ribhbmHgcguCYXBQmmEf/6esIIK6uM1WY+z1ZffFSq8fiq2bPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUValAEA; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUValAEA"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343ea89896eso3328345a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763838584; x=1764443384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KIU3JzkgUX7/zqerWohTpAVjCoV5JKRdjXZA4NoDZ0=;
        b=kUValAEAji2d+oH4hWoGzT3IQsalX5I8+WGboKGdVC9HWvRx4flp7qFtwEsenazt2s
         3mGa2aef39N7gHemq7AGc5gV64++mV8n7V1+l38J7abAFGVHbrYp5npZJbp/MIwrwLpF
         Rwe8PoBGRjMVJfdUUuqdw2bI7UwKSbeJn7fMg5qFXQTWFJlacN5OBJH5WsZS60SWs9YO
         OSJI99JP/q90teZc5nrMNs65XitT/+Z41q+Sdu13nXNLaK9Tpq3bY8k4AcMe/od+nB9z
         Nczpr1BxDasf6oTUVwb+dOaMYsTof4wVSqSO4u9eUNVFGoz3KJ5aVRpNEy6BbpAUJLco
         6T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763838584; x=1764443384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/KIU3JzkgUX7/zqerWohTpAVjCoV5JKRdjXZA4NoDZ0=;
        b=d5Cw0bU49JmFwlT54rDM3G6PLr7dX9tA7ZGP0RW63s1BcJrgDfB0dkQ9oyCUx5By5C
         LLqeMCA64tCnorUIP9wLndBO1Rj42Yzl+TNNl5BqNOm9svPx05/8mgN5kVtdS1Is9KMM
         V05tIYbbEB2zwS4aKOw8bhcaAL7JhILzYuc5lokjktI0sJwDk3J2d3acDjQesJWeAjZA
         0+ayTZ2p4J5MWU7H+fbbzHOg7OVhfDCXa0F8esikztElSP4SjnDFABve3mK+uyhNlt6D
         9d+sgS2KOHoFRQEtA2ZDXen6Yd9zLCwp+QfdITKGHJ1LetjdPbGC9TQrUWc6P1lPu6cZ
         pZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCVKokXXNWVRZY2IfiicXT7AVkDiEGPa0yRz5mKBHjeNyNGmBl2RLmd5QKipXaFl0xKkt5cnyP+8W6rhPSPbvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyywt5vwwwwySW4eYHM9NHCHGozWsptTxUm9Hk4YFxjhiht9K0C
	kL4ZqhxuDL6Qcb98f28ib5DPyO9GuuPUx3dlW9Mjf4s+Sd3Zly91MvyM
X-Gm-Gg: ASbGncs8lFtsyAiSBOGqEBgqmH4lvYipQoxm+IqhkZLZt3eenUiZfjmHW+6H0Fs+DVz
	cHbYD1EE5xo7dMVXhHXUpHlsxxRtB6rvV0oOlJoNeSfAsdzVWy1j28mpRQHeJf68Jmc1ecSSwnu
	2nnMBYBO9yJyKt6hs6dbfIx60Lz0nJGUxblUyi8pq/o5jZ68WEf5eegvSJlUzUapqLWFewlpcCj
	fvnmw/0HEdxVAsuz7LALH7OqiGy3ZUpFcOUEx8/FlU6PzZH3aZmKh1rsQ1KQKPtlkz/44DAGE7L
	dm9X0Qz/5jA557psoshvlfAK4JiMijP8jPUYquuwX85NsHJTwZEWBL5VuHJLZ3Fogjwu0APA1ui
	LRd/mguWVFg6ydHtrpzSMgoNfURPmSJ8JIVT5rguP6cmwgk2/2prMaXhqxIrN21yEXH/yVdZtn/
	R0UsrA5TRfWjamtZkyFXBH/Fd5IqoZ+z4Bsq1cOLzzr2N1VclHoBBvYe95h4NpfohCn/CvI1u8N
	zE5sdaB+d1qIxwuVEaSmnm7SiC6aw==
X-Google-Smtp-Source: AGHT+IFojcUrIOa64/eFaDsbKJQK4vmvJH0g5hX/KQVDz0MaurFL9dG3fOF6cFrtJEs/mj+OzZO84A==
X-Received: by 2002:a17:90b:3510:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-34733f225d6mr7329215a91.26.1763838583713;
        Sat, 22 Nov 2025 11:09:43 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c1e9sm8869211a91.15.2025.11.22.11.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:09:43 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 2/2] rust: kernel: document safety for as_str_unchecked
Date: Sat, 22 Nov 2025 19:09:08 +0000
Message-ID: <20251122190908.259929-3-knavaneeth786@gmail.com>
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

Replace the TODO safety comment with a proper explanation.
The safety of from_utf8_unchecked relies on the caller guaranteeing
that the input bytes are valid UTF-8.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 rust/kernel/str.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 5c74e5f77601..2801388c6bd1 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -385,7 +385,7 @@ pub fn to_str(&self) -> Result<&str, core::str::Utf8Error> {
     /// ```
     #[inline]
     pub unsafe fn as_str_unchecked(&self) -> &str {
-        // SAFETY: TODO.
+        // SAFETY: The caller guarantees that the contents are valid UTF-8.
         unsafe { core::str::from_utf8_unchecked(self.as_bytes()) }
     }
 
-- 
2.43.0

