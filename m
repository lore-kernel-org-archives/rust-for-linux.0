Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E921CFF6
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494590; cv=none; b=pqw6+ytk9vcfj4x9cB6kb2yL17K3W8lQ7ZvWougSQGvwEMHAQicwN9olt7WhSOs+A4ljBL0HNL7zF+XQ3LwS/rfhr7nLrhhnrZ+VY9EGqlvPx6nTLj6N40W/IrkfQof9pZOTn7CHB3wQKG9BTxVSTfAaj/3qNVL4bjyki9WZ5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494590; c=relaxed/simple;
	bh=XrHlDIeHXrtoTfUPvFo2H3StxlGlQyO5U+SYe768N3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjF2B2fmzzxA9t+9UVSJ0QOx8HCTwV/2cFi+QcvEoIH0bIOnbaV0gksxhr7ecIp/ooRarN/EqkM/I6TI+8neV4cpA87xj5Kskf00UrhL5rahGHYbbumVe2hQp37Z48cOHKWaI2GN4PhWk75AiwUpXn/7NG+Q3so7F/czgeQWCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A16Bjawz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A16Bjawz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7baf61be569so725454b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 15:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765494588; x=1766099388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CphybPCV5+h99DA6h0TRroFOtdJnxifOtSXldtCMDuU=;
        b=A16Bjawz/r82DMHexVSheZhtj2GhLO0txjNsGMPVe3sm98Fdm3hPAsoC24+VngMFGU
         Qvm3rBNGBOO+Yf700KWKjDcdXIULcQnovzUYymRGmfQ3mXq5AouqUpXCmYfjU09AUIPb
         Q3Ec3gx77cgfIJfhNHKBafFVv3Ru38W/PKILRPiV4E+1I9Iy6mMH8P6+26HiZQnZaJEr
         UTuQoSK2FduyJVm24l8ruidoeCsFejy0Kt7GHRZHoGQDKJmBeEcKdRd9BR1fmUa6XCpk
         mIvOgyD9AriGP4CP29Zn6TE6xft/JXPJO4yfn23C3Pi8aall1ZvEjB6t0j3YXMD6g7xo
         U/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765494588; x=1766099388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CphybPCV5+h99DA6h0TRroFOtdJnxifOtSXldtCMDuU=;
        b=LAhmB78T3ozscEXHhazcv8hbOKvvqa9dwBQ1kl0/MZX/ScqT+pPURubNHEVJ++pAB9
         y9UYspCepnO9Wlso2sZssKorPe4P8MCvl/GP83DnbVVhTB20P5AjtZmXvbZ8dpNiPyT7
         bT4AY76m1Xzq6nqDMAw+pvv1ZTD3Z9Q/TmJ68wbojCiRi2OjTQ5fI2qZLnkDrzZSXq+F
         uFp7yDMiH66A8XqRnxz0dyCNuKUBWqBCrh/x8h0x9GXFMKqZkgpG/1QTYy6GKZa2xwOb
         734uhwWDj9i28iRUVqgqkQuK3lYjX59f2fyoLhIYh3xl/s0pRszvo9KlK+5JX8QikWNK
         7BOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYvomAwtVGUupmToPrwjT9dyD01bLpzJLlj9obqAfa43blUIh0J78ulDCS0fI1XhgOKpowh9tbYTaG3E5ICw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUxm6vJB9mfYntQjwSD1fV7OLqKTeqs0yP/8Xw0SelmzQEtiQ
	kJBRvBcIWdtTAm+6ViA5tilaNAydeniQRcmrVkeoeyR8eSNbbjTFa6gt
X-Gm-Gg: AY/fxX6ZON4tPSTb800ds5mVKEgC3lM7VBE4g5W2JT9FqFkT+vDy892mwBkHibqR5Qq
	ZNU4KfSZ1xe2+if10pvOm+gfAD/kHKGMHurBqniZaqmsOgr9AL7e+xQqM6SiqMZm0OrwNZBKCWX
	nyeQ7FnqdjT3klddZ9nF9uzBq4F5YkmUjYtcYWKHmsob4abUumhn3wJGNQSFn1sYBmf4OH6g1ie
	jDwncMBf8PcRseWxRGuipYLS9W6kFjI50knaHqi+yvEs58Yn3IQY00Mc6Qart0iHU4ML33TxM2R
	H/3H210+vXg5XAdu9dsIdKNyMVnXlNIdTBSxJNDS5HN9EvlioIaVlyWTNrTxNUMm4HJ1yhjbkah
	RVjeYYsr/01wDSq/7uqthioJ6gGT7upLUF7Y+6VfgXvpExYFwrKJFym/ow1gUFa9xyouj9CI8Zj
	cGU7KtUSF6/QNiC9Xh0/mbKYMhEFsIVH8BRU/ASgBI9Z7l7tkJoZDH0gs5yx5zYQ==
X-Google-Smtp-Source: AGHT+IF73CAGn4pVzpaQKKkdjB+PEdQZDAwLviOnnMC6MmyEBGI+rdm/5/pY4Nufs7W4OmqRIzWj3Q==
X-Received: by 2002:a05:6a20:4326:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-369adad03c8mr128085637.12.1765494587621;
        Thu, 11 Dec 2025 15:09:47 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0845sm3247728a12.28.2025.12.11.15.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:09:47 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org,
	a.hindborg@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 2/3] rust: sync: set_once: Implement Send and Sync
Date: Fri, 12 Dec 2025 08:09:18 +0900
Message-ID: <20251211230919.1303926-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
References: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement Send and Sync for SetOnce<T> to allow it to be used across
thread boundaries.

Send: SetOnce<T> can be transferred across threads when T: Send, as
the contained value is also transferred and will be dropped on the
destination thread.

Sync: SetOnce<T> can be shared across threads when T: Sync, as
as_ref() provides shared references &T and atomic operations ensure
proper synchronization.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/set_once.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index 889d37dfd17f..5894d0dda14e 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -127,3 +127,10 @@ fn drop(&mut self) {
         }
     }
 }
+
+// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
+unsafe impl<T: Send> Send for SetOnce<T> {}
+
+// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations, so it is `Sync`
+// as long as the data it contains is `Sync`.
+unsafe impl<T: Sync> Sync for SetOnce<T> {}
-- 
2.43.0

