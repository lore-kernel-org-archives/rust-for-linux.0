Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56937D416
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563447; cv=none; b=BSF7nLbwLji/Ge4yvxY2IYwQ5GGunf+p/kNZcASkuR36q/jf0e0G44Xd5e2vUBSY5ILCdOIRNpLEfbvmyfZsszmXoT/I5Rnxed5LaOTL0coKX1Jz6KUBkpcUwp0IoK5npG9W1wxCFpOLgcscPJaa/vI93n/lNOU85z09EbtxxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563447; c=relaxed/simple;
	bh=Kq8AG7ftk62gxISwDOayClNg1CQl8G0b9dA50bKbDSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YN8lmQzx9vvJrv3MPi2o5Cxy18p7lvyEgWD643XixOMd5/x2LQcPzrm6GPU1rX0XaBoeNV+8gfkCCJliuJUlopkACt2fz+wWmYmSQ/PQ1opcjzyzmG7qIhNCT7++v6LwYGfM28TsRyTczkc6ZbOVOILyXegQEbwzjW6l47wx2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3IGdJB1; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3IGdJB1"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-36a205e0f16so8774705ab.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 14:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713563445; x=1714168245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPmzvXZhN1kTjA9FKdbEWAiwLYXmNCXu/WYkKo4cjIw=;
        b=A3IGdJB1NCaf2cqJEhOBSwIiWk9mqIZqRbWQM7BYPN0zXMZ2BYC2j7uGDMbFKcK28D
         AraRx90nFYRWcd8TbbqayUgnR3hrwKcad7fGHA++4r297PcgVKDQfwSot5cLrfGvonJf
         X2GL/yAqQPBYQPgvoALABHXU/xb2Q0eElU2l9Sw3rAOt9yqFnzs4SZmv0NhpsX6W4srL
         w8Vs++R+1de3MhbiXpRlApkPWh9Dl7Eff06l7q2k6Lmr2Fe7Qnwpq+COB+J1kc7mBQnV
         B6n9YWgV2qIUQ4CIJqNfPp+PMKvbb4DDYQrLBJNkjmwnA7kxg+NBAtpRhvNDPj3pNXsz
         REDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713563445; x=1714168245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPmzvXZhN1kTjA9FKdbEWAiwLYXmNCXu/WYkKo4cjIw=;
        b=Ar74pBpW9yky1hSBJgkX5zXbKNlL3J+Q3Z5YGd2Rd+CvYivBSO9d5ZGOaraRmG9oJ+
         OKiuElxL+682jBC/cswRcJxt9XNzZvDrU1L0gQXjS4GxM9ZM8iuUMj1/pY0ClBJOPaxm
         RijjvSfkVKgv0PvGEg82Sz1vb4ygNg64r+5K/hW+6vPwmwIzrgW00X0jn8k05cx2/rCY
         HrtRKdeHl+xOkWkmz4+P5OpVZbUu7Hjw2AVkXO2ZEN3kOZ9ay1/T9rA73YepTti09gm0
         hwe6nHCksdDtxaPYwp8+LGkOvlywj8Sl9e1zwg+w38OtNReZuoRF9qQcpPXvUVOdXnWO
         MjDA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRsA2gIZTRkVk5V/QFQmWAf9juqYyvCj54IpC3NssXLNT2NQDDTXxT/3Fl3Bt8oTjJfnlaq593oXJzxPnEncYvlj6nLe9SkDfMs4QsV8=
X-Gm-Message-State: AOJu0YwKR8SS+RyoLkjNiE5WajEAXtPrBd8GaxAHoLSffGr5BPmsQOlB
	RNB17YSzGcZuA9aQWyxImphF3K9yIydmthgtU4WXjWa8BY7whrc2
X-Google-Smtp-Source: AGHT+IHL1LeCo8sIbcEHUtK3FQfoYonjcBtuDBZTTvNj0b977xZZVXOfBVBFya5B3drobrxrW+MVYA==
X-Received: by 2002:a05:6e02:12c4:b0:36b:2efb:c1a4 with SMTP id i4-20020a056e0212c400b0036b2efbc1a4mr4696698ilm.28.1713563444756;
        Fri, 19 Apr 2024 14:50:44 -0700 (PDT)
Received: from rust-for-linux.vcn03240917.oraclevcn.com ([138.1.69.80])
        by smtp.gmail.com with ESMTPSA id y17-20020a056e02129100b0036b37f8b2d8sm971281ilq.51.2024.04.19.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 14:50:44 -0700 (PDT)
From: Aswin Unnikrishnan <aswinunni01@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Aswin Unnikrishnan <aswinunni01@gmail.com>
Subject: [PATCH 3/3] rust: fix datatype in docs for `module` macro arguments
Date: Fri, 19 Apr 2024 21:50:15 +0000
Message-Id: <20240419215015.157258-3-aswinunni01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419215015.157258-1-aswinunni01@gmail.com>
References: <20240419215015.157258-1-aswinunni01@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the mention of byte array as datatype for `module` macro arguments
since the arguments are defined as string, and `alias` is a string array.

Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
---
 rust/macros/lib.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index aa89b41fa10e..da7cd6378288 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -58,11 +58,11 @@
 ///
 /// # Supported argument types
 ///   - `type`: type which implements the [`Module`] trait (required).
-///   - `name`: byte array of the name of the kernel module (required).
-///   - `author`: byte array of the author of the kernel module.
-///   - `description`: byte array of the description of the kernel module.
-///   - `license`: byte array of the license of the kernel module (required).
-///   - `alias`: byte array of alias name of the kernel module.
+///   - `name`: name of the kernel module (required).
+///   - `author`: author of the kernel module.
+///   - `description`: description of the kernel module.
+///   - `license`: license of the kernel module (required).
+///   - `alias`: array of alias names of the kernel module.
 #[proc_macro]
 pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
-- 
2.34.1

