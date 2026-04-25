Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B8B3909A4
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112280; cv=none; b=mLLawvAa7Yki5Xc3yuTB4AMLnqetGPDTPdTl0Fdiy5G4vSxd1F+gSndWy5iCD7p0fYP316dLoS965UI7yRp9ZC4NEK6Ru2wZZ+0TmoyAaAlKhjb9N7Zo6WWAu0AB4sWm0fBAACD8zvwt0ZZYpHBKVZc57P7Akf4QnLn/9UQJbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112280; c=relaxed/simple;
	bh=s8KjmEQYf+VZYXAP8yocxXeGpoB6TvIEX1Vj6xLqnoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI227FFk1z9ZOsKnNsXMeLUIZBUJjZ1K2SfL7OTQZjMGmo+IKkvDaOrLz9nSaxvKCb2NQCX5sjbTq8rfQF2Bbb9gqINYntnDVnntpctMQPMOc6q2ySMYObI6dP7r7jHPwhCTvclDD0IbvlMubXS8kg5iezW98N3LAK2m66NfQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojp6VqnZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojp6VqnZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so6921091a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777112279; x=1777717079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKXXhI4T9TDmSWi350f0HPvFGpKRjitMhYHphfVVkCA=;
        b=ojp6VqnZjXsvRG5TFj+/3iuIn1W0DQwqw5F7Sg1hP+/EuEP75/xqCiVJPDFMatYZq1
         LSgwX1lKPISq2KBelv+P2hjKHeX/7g7dh8Rc1Yci7XWUAUWkqt9iLJcgN1d/BSO3yM2e
         ftPmHdHqezOn1RPY/ipCF6NMTLxDUBqzrT4BW5+sVs0pRG/Jrb3Rv1jygk2vkWVpydb8
         MeJaRqM1XK0WTAeDYJrzHC/AsACArd1Kbja8ylkcdIPycdUEaR45phiAyKII2UrdsYkt
         M8LAng3wfeWrgVhcBeTkj47yrJnf4ayY48z94U8pJ5M66vH6oBKdTr38qclgCJil3Tqx
         PZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777112279; x=1777717079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKXXhI4T9TDmSWi350f0HPvFGpKRjitMhYHphfVVkCA=;
        b=hDnISjynq6UNg0tW+yGHr0Hme4a8gigXDxBBPyhZcq0BrIR43jD85gesj4qSx3n0uG
         uiaEjXmwxdLdP0yUI2T6KcJ5esNSp9IfZcASnrhG9PLZ/d9DKBRW6sm67V4oEcBjNF1M
         rPQiyb7H4KmPUtovRAve5Dvk3U/ru8WpPWbUuentyeVsncfZmZMFR6cOQeEq8bUXqKjq
         yKTtdhwuz57xub/gdKbCi5/JLNoQGWnU8eND6QnNEG9Deu14MHIoR4usGTSL6nXwNrJW
         zHcm69zpbaNjAGA5wkZGBmuQn9b5yOQ9JTJDNCUlfGfJp9rOIL2VqNUSPVEO605WuDEa
         iXTA==
X-Gm-Message-State: AOJu0Yw1bJxCwu5d04DF0rN+J2Q2xND4Jz7HGwZTVYtidYbvAEoMW//c
	fmPl6eRop+yXnhVSl7MfNRcUPb0K3pMeVVacJ3nt2wohsAH35ylKv5Y3b2PKGBxD
X-Gm-Gg: AeBDievU15gwwoT7ddGrXS7BKydG1o1/lCQZoGYhtrRN+rHK2jLXceIuvevW13KHo9G
	lTVd6FC/HOSBUI/IfqsVe5olfDEwCiExPE1EkxRyES1y+olaAPCARORPj/OzotKS93W2+P/m1qe
	4zJ4ffOK11Hp+kepJX3fyJFqVDmWuSF3MWmJC5B6sNmE+Xz6+u+9PeLKhLwM0IO8RXWR1pXYCyV
	Jghk+qV0qxXeUbAsGCzTYlF7O4YkwbcZSI1RNuX5822nXRGItV1EDhZVRTHoiwC+iAyZq6F1Xru
	U8g5P8KJc+zW+wyyc19vIIgtGRxMda4+4vLUjETm5ejoN1e3mEOI5Qoj7Ai5mASmMg3aCbYC0nX
	9Ot/H3+nYzc7dAVEb2d5FjhtcdeYHdNuq958uva1fFeycixA/8c+1bKfc0x6G+EsA+CYrrXdDjA
	Nv4e0fKAVu3/oJtneBGVWf/oZ5yftkD2wDSUzahwaOz+qEiUQ2hFK3bv+tVA==
X-Received: by 2002:a17:90b:5865:b0:35e:27ec:dea with SMTP id 98e67ed59e1d1-36140493410mr39141418a91.23.1777112278661;
        Sat, 25 Apr 2026 03:17:58 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362bc4f9360sm9883027a91.1.2026.04.25.03.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:17:58 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
Date: Sat, 25 Apr 2026 18:16:19 +0800
Message-ID: <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777111268.git.yu.whisper.personal@gmail.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com> <cover.1777111268.git.yu.whisper.personal@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an incorrect operator in the SAFETY comment, changing `<` to `<=`,
since `Vec::reserve` guarantees capacity for exactly n additional elements,
so the equal case should be included.

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 408a51ad3623..fc4bf0a7934d 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -772,7 +772,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
         spare[n - 1].write(value);
 
         // SAFETY:
-        // - `self.len() + n < self.capacity()` due to the call to reserve above,
+        // - `self.len() + n <= self.capacity()` due to the call to reserve above,
         // - the loop and the line above initialized the next `n` elements.
         unsafe { self.inc_len(n) };
 
-- 
2.43.0

