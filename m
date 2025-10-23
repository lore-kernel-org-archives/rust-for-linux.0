Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C44D280018
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199975; cv=none; b=Uk11a0oJ1zUo2mV4bTvziXFWsghinoBST7/HniKO3EwenL0Gujq/TIbSFjpO/B/l9WyoN73TTrOz+r1tLiO4G+KVBMCoX4DAZltiqMUg1T0+L7MwwPSSZzrLtjfycKEoMRLEuTJXu9oMtRwg/KhKS1yhZxuezusTwMc2m1LzCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199975; c=relaxed/simple;
	bh=KoATpDXgD0eICdcJM5inRvL2fvIiA3i0kNJNlPHqUSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zs+P/6PrMwe3Zb3QeecWQgg7XbZeXcK59RRViYNzhYwgQJex43QkyfOVFKFehNbQLIh9/RpEKYaBFpOiQcdPepYKnu7vAIp2cNDRNbVdahJvr2z+vzWqoSvkDV06M+Wv/DPJUeTxUh9OCBEr1Y6lwY5uzP36EzvH3Loq+S4XSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZVlYTuJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZVlYTuJ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso379310a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 23:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761199972; x=1761804772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NADfuFtteUA7bCNNPpUSoQKsHB22B6aekqVwkYXKY6Y=;
        b=MZVlYTuJNTXbgrQTL7ijPqREhF4M0b9H84nLoykoFNb9FWwjksuqnZgTRfNRTY6w3K
         47RM4+T6ufXawC+rrI1CCat2IIvEoqdzjr7oSPdNTCky5I8jSpMOawQ5KRNVl6NgQr3d
         q5ae1OOyymkNeyWpv7GVvGWMe8tY4tfv5YJaZ0WqT39SldLhn5RFund0+E55RtUSGlAh
         FJ3uxGV3egwKiZscr0Msv7Li8k2Bgd+KX+MRcAAWLUtMWTQ3hyKMeNe/7aESmO2X+LdQ
         LU8hiIoK6A2aAy36LDftqIONZsSdazVkgfB7keNlPrNXqmAaN60rKdCP55CWL82rH83N
         3xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761199972; x=1761804772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NADfuFtteUA7bCNNPpUSoQKsHB22B6aekqVwkYXKY6Y=;
        b=xNId1O/HRj61107xCZX6+I4tj3BbaW96Hpm/bSFx2sicdSNKlgYrRJzslYxi/bJ5Ly
         TwbnLAoyEZb5+7KUbL/+4bebH5f/JZU9tPkCiZNR0PCZB5Q3lnWvulkay1Kuv2Bp5kIt
         VIUwPV7ZWQ5/6QkxoFebK6ZeXafo3nRSOPz44D+gMQ8W1T+Zo/CV+FOqDUU/MQU9wIHl
         kKE78NQnQa9JoNETwfI4Q7dtt4PpR9ANpPdA7IWknz7M5pGy4mmJkKB+SvlH8cHUdEEo
         Bv9PGeUupKTPjLMCc4CvD3vgIFSdlaD7JlT8LLUr8HO50DJtxkCozgX0sWY8My50d3Ld
         wRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkvb+npRqRK+XjBHFmI/XMkiuQr7YLcDUsQ2Lrg1KMonvNtLYGVx68TfL4AcNzgCtK+5aJ9/l3Umb/s4t2Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XZYZMSqku9npQLgnJO+UEsoXDcSx645e3uO36vvj2gS21sln
	o50eG4tUiuZMYlqOBNGSBqEfGHywOaoLXPOi4vIqkQKKS+avUpjluxzT
X-Gm-Gg: ASbGnctjZKQdPsixOnW6swvbJCtyJzeOc4KPklhDM/SI7DpSz3dFzeH04kNxp16+nSe
	zMogQvnN7eMO+OmDggh/xl0VNQ9i8r/GxUiYSCXfax6IlR2Id0PCcQ8U7DRPGLMzbPn+gCwzM7K
	F76prcNAq8uJPNgO04vAhqQV0vjzUEoyaesrnmVq4tLPdsvUWve4I7MoXcoZ/1qjIjYA+NmTSxJ
	6BqYgTAxPhUz+v9TV3UaMT1rggSGWRswzU+zC3S3ZxD5DLFNHriA+uqUnb+C/Dbsc3fhCtnWT9B
	MnQSjHDFAlJIGqUYpoJg5VML+2wkpmpVYRNYoEbkmx/CMXRkTrMiMGP90DttjOfqfqxgw5DurOH
	1oBDIUVx7NNx8x16V0ttsCJebSqUYUKMS0uTGimJIwj0X+D7hR27Yvziheg7zYZRAMBgTecWURq
	efLvI/D5ri2jErBx07FkJoSiwbUtluYBASxfFfxwg7vq5uHp3y
X-Google-Smtp-Source: AGHT+IHSXdbLU0tL8k9h8r5tSVaUPj6efh7Pr+tdaBBKoXSuQZ8Sf66MxxP6tm4nocpzwXTiSdWirw==
X-Received: by 2002:a17:902:e5c8:b0:290:c5c8:941d with SMTP id d9443c01a7336-290caf851a8mr364554975ad.39.1761199971663;
        Wed, 22 Oct 2025 23:12:51 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de10b53sm11453255ad.23.2025.10.22.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:12:50 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1] rust: simplify read_poll_timeout's example code
Date: Thu, 23 Oct 2025 15:11:24 +0900
Message-ID: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Drop unnecessary Result's '<()>'
- Use '?' instead of match

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/io/poll.rs | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/io/poll.rs b/rust/kernel/io/poll.rs
index 613eb25047ef..8f8886543f34 100644
--- a/rust/kernel/io/poll.rs
+++ b/rust/kernel/io/poll.rs
@@ -42,8 +42,8 @@
 ///
 /// const HW_READY: u16 = 0x01;
 ///
-/// fn wait_for_hardware<const SIZE: usize>(io: &Io<SIZE>) -> Result<()> {
-///     match read_poll_timeout(
+/// fn wait_for_hardware<const SIZE: usize>(io: &Io<SIZE>) -> Result {
+///     read_poll_timeout(
 ///         // The `op` closure reads the value of a specific status register.
 ///         || io.try_read16(0x1000),
 ///         // The `cond` closure takes a reference to the value returned by `op`
@@ -51,14 +51,8 @@
 ///         |val: &u16| *val == HW_READY,
 ///         Delta::from_millis(50),
 ///         Delta::from_secs(3),
-///     ) {
-///         Ok(_) => {
-///             // The hardware is ready. The returned value of the `op` closure
-///             // isn't used.
-///             Ok(())
-///         }
-///         Err(e) => Err(e),
-///     }
+///     )?;
+///     Ok(())
 /// }
 /// ```
 #[track_caller]

base-commit: 6d0ef68955d30be1e218caf160ec32eec23ebc6e
-- 
2.43.0

