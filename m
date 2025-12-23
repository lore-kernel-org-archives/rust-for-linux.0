Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12322FFDEE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470943; cv=none; b=UEr2KHjtN+geHSSaxVvwsQyB4eYt+NlvPqq0pASYnNh1yMowO5TtLLUT/lZ/ygr5T/FfSXCMjS0b5GnuD/HTZDHu2JXhGQK1dYdyK3WobIHTlzU1fkXF/1rY5d4OTlNF5nTnbqgz6r9Bbn9kOU/rDunafMFb+XYQXrTDTxVDWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470943; c=relaxed/simple;
	bh=DOVkPJG3lvTG1P1/w1DxTKFAXHDLe2qBnB3vVI1BMHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tF20OXM3v05sP9rp+iLurLKC3ddk0ce0MgleXiiCd0oVKmz338CS4Udoqqng/zrH4s/iF4QzcGA08Crq3/FKG/K2NvT02gLVzwUL+tGjZ80IdPoK0PcgNZ8tdNJ07F0eb6VWPSYt2DR7eSP3gHSCXXcy/vf6LPJDgeEcr084V60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3Ou3jbl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3Ou3jbl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ade456b6abso3883644b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766470941; x=1767075741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3T+YNpQoIpsOk5YdZgWkJdrxHL3UXeLUpUXbUijkBM=;
        b=E3Ou3jblsD1RaMb+GiNIY2EY33gggn4B77VNroWkyN6ewgv33zjPdr6MDMvxATVv3j
         +kifwO4H7AQNc8fqw3T6XNhkhod1NWaDF7mH5TwvyQncJFStl5vpP/B5Hna/KlpSKo6H
         PkeDYsnfkfQw3SyyuZCkdobpWy412mY9YDxYONhKcB/rSQ8oIqZjteGOQXxWeATbpXjH
         LZwy9qKvPUveLJMD6SfpUyQUngNMF4RlE65c9b/VquEtpAhylfKMf03ocFodTP4boSvt
         OzrGA0BjaOsHWz/qVlRaJOB7PndUktEULtLT7NtaWr7M14dHErTmCrWTCSiYQ7+xv614
         T2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470941; x=1767075741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3T+YNpQoIpsOk5YdZgWkJdrxHL3UXeLUpUXbUijkBM=;
        b=V+piGkP4jpjFKzPg8sv+0oIwSWR3iIYn5l3+eaLyIAIEbhMY4lRi1+bdUbkdpdDf4F
         MOdFsAdicoZQ6Y17OG2dV2ARlAQN3dMFto4nqYtloJdc56hPyc6szz0J5XliRjfeRaqr
         kp+yTScAh5P7E7k1S2rJjYHYxmHa+jQJ596+rE3rucvpeBeR7Wq2LScEKeFz6Rvt0czG
         RS7jObR/8adj+AfecUCtLMyIHK9yThA5YSh2/XWXy0e+eCpdwdirseya4nTbeIAHxT3D
         beEW5EhopP0MjDwMEwx3myncJaa6hR2tqKqTwVtiSILAYBZvTEjuviqgJx9zfjFszWud
         x1yA==
X-Forwarded-Encrypted: i=1; AJvYcCWrp30cI5RnYijjqt65SW/0Oqy6WyPWjqiaSZrCEotzSFs1UjI+qnBT+iHoJ3Uhuh4PiInr4akEcbxU3rTEOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3/AakEpL8/24C0aACRM8x+qo8zey4WAJxkLZ2+v9sYNAJZ4m
	aAiXM6cWNlBy0pLNmxCf1ulv2cZfn5aBebEui8y9glGd4MAuKkcDXNpB
X-Gm-Gg: AY/fxX70XqGofjp4qYzsdLlgMTsQ6i9tf+82qWzFnLSPRTxElea5lDDTrAp+aSM/37m
	XKUM1nlFI0yt3/TrKBKYwt+WdQg2xAQwsoQj/LKC/Kz5LW1DkPTmqZgnP9QLCejBz1u7EfjqRtp
	mDut8sdJR1b+2r8uopdTlkRQ9m/1pzSmOV+yqLyFMIS5oBx1lfWR1oXP8rgilJt+Gt0FFSv8M7N
	aAS24l6436Yh9Z1hum8fW4KlhZSFrvdOZvflMMwzeG4NAmzwc0Cy8JX1MVuggnXnDha8NrQ/YL5
	LGQZmHncvFNoDTaDY/O8OoCI2UnZUDoffAT3Q3mLt5kZWnijFDeHAui8LBZ/fCaSbqClff/KOfd
	q+KDZxkDMpKjqwoIwLYJLwLrnkYlsHUtbe23EEjTMNec9mobqk9nUh2XUMd4oTxpi2kNpGhzcwR
	Mut7xDstN3jz1eE8SEZcHry+/mnq86FJJT3EujI11FDypJIwJ0YmtnQ9xXdW7xeQ==
X-Google-Smtp-Source: AGHT+IE+AnsHPGT2gHmseMSQVjaFwvryWLOJ6QpIC1PfRgT/9tJ+p+HB7RP5errRD/T1gUNACNSGQA==
X-Received: by 2002:a05:6a00:e11:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-7ff6420d8b0mr10972124b3a.7.1766470940944;
        Mon, 22 Dec 2025 22:22:20 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm12395362b3a.35.2025.12.22.22.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:22:20 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 2/4] rust: helpers: Add i8/i16 atomic xchg_acquire helpers
Date: Tue, 23 Dec 2025 15:21:38 +0900
Message-ID: <20251223062140.938325-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223062140.938325-1-fujita.tomonori@gmail.com>
References: <20251223062140.938325-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic xchg_acquire helpers that call raw_xchg_acquire()
macro implementing atomic xchg_acquire using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64 and riscv implement acquire-ordering xchg.

arm v7 only supports relaxed-ordering xchg; __atomic_op_acquire() macro
is used to add barriers after the relaxed xchg.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index b1ce7c038ac4..538e0b10a15b 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -60,3 +60,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
 {
 	return raw_xchg(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_acquire(s8 *ptr, s8 new)
+{
+	return raw_xchg_acquire(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
+{
+	return raw_xchg_acquire(ptr, new);
+}
-- 
2.43.0

