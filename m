Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A43043C9
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145064; cv=none; b=CeNtu5JhA+rbVOr/Mzie2IkyoRM6GbtM5Ptjj1PRa5VDVjYkohs5s6Uqk/99DfmqNy32iazGwh9r9DELktafKs1aq85upC601ZVI1YrKRBRYjgrYwTDnLgYQ4VSaIYZlLgolDZHWBZwdIEo2ocdYU827iNknhwjzxfeKp8Lgt/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145064; c=relaxed/simple;
	bh=+w9QwEk4zvSVaMdjDmlZ/K6s7S7CFY8N993UQ78kOZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNk+mk5usAax2yOHv8+JgpEVWTtv8/yFwx6yaJag5oyniOhbhvWPWVN4U0ka7CpB7jb5VdWP6CmH2UDoOdrDVfwLDb5t5gBGXLfdXumEvgyYTOqWaE1mFinT7Rtl35tW0yReKJP6VphDLnKfqwSfOdA1qNJh87S2hOYYBmfCnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbvs9QcC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbvs9QcC"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso2205717a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145063; x=1779749863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vA3/Eqe1Mp0NBO/19aHa7UFm2sJUwwmMficp1x1Bk0E=;
        b=jbvs9QcCMzVMDWc7hwaKtsOl+cedZ4BzP3cZhrsg4CJXNpyXl0z5VAsKGye2wyk7hZ
         12kqVKEEdlxSSQSlMSEHS5bjSjS5Y3F7d13p6AcHe8NI4rIJZxiOdJJcisHiWJaTZfl2
         i5Hbb79hWQLRzLOBO/jvjk3qyxItrCQtFdNs4sjNOMabKjUTLnxWYbNwQ5mplBqBXX0b
         TT676QcA27pz1biLrnmjfvwqeevPYwftsfLblnaP4Td1l1WVDt5+V5GQhubaG/BcG13d
         PO5n/b2aBkWp2l6DeFd3b7db/fHQ9mocgOw6aNzhljxg02t8okXJYo2jLIwajJyk4PLU
         gPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145063; x=1779749863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA3/Eqe1Mp0NBO/19aHa7UFm2sJUwwmMficp1x1Bk0E=;
        b=sRffCqLqAIN4XhpmEf72jTAl41ufAi9uq3RZD8qc7g1e0PJNah7O4K7asfqG0DFgys
         5Xd5i1Jkblftom58ljirMCOD0Hlp852MKW4CWKqhVqljsHzxuf7buo2kEQropy/5+SCO
         I769ULZJWht+chTesP/+mKDGWjsMbAgKs3xF6cyyw1Xa4t0by5JNFS7O1SkMav3PU9EH
         ZIJOhatgihgAHbnqVAjJAF0Hha9LnmHou7bfmso1jQlXELITmZjxejBRE8aZP5DVI+3w
         4cgJHL1kx3sQINve2JRU6NDXks1C4uEedavDN/OmeQCJQvW0TOXM9MqVzY9Tt24hFALq
         SdkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+y+xmFn1JXq0in3gGNeh1ZoxerZK799Dh5y98gZ3L+/1TH8A1gYsUtV0cY+m8EPb62OsNl3jjpThq8Mp66tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Dx0nQrry9cRx1Tf0tsYKebHNJrQXOhRRJBSXpeIrAKMau721
	eaH9X5/Sa1utoGL8zQmpQuTdJzLCH32vXgI24OhwHB38po8I9dmMts2S
X-Gm-Gg: Acq92OGEgtl6jdTj4tZ7IgHYeOFrqazVj1D/ZP8OCokhSw+aYmTxHQUeoeEco/aZS//
	NXzz8BAksILVWSkaBwZnACiFQtX0SF76dG1LsA/Z+zQSmP7gkHHkBHxw4lQMdpz0TFWXvJ9nDNI
	1Hz/h++/1G15E7mDEoajx6N9Nt5n91q4sgFoFUqkD4pDkToioV5FB52gWPeym9dqdLVv4LqBBqL
	D6V3ofrIcmi7fdUf1Kw/KiMbxMH0xi/zj8zUy5Sp9rwUnMaYg8XUDVtUQ+dyhj9b0s7cdEbQsnF
	jgsFfsLEbPlQ1qdVBnHypD6S9jw2AgJvHqSRJ0iIW5zQcYI1FHdGEivh05zbnjc94CIpGa8vMQL
	7ij6Wlgkamz0a0P5h+zEDmL6TMuVTwGZl5Z8iABNyCwoBa5EYIlM0MS5HiiuUUpWpNfgNHGUrL6
	PS9+/k6kfjZFdOfh5zlDT6EH38owI0zgyg5gjiyIGRr5e1Lw==
X-Received: by 2002:a05:6a20:6a13:b0:398:77ae:8d8b with SMTP id adf61e73a8af0-3b22e687d5emr18786008637.10.1779145062840;
        Mon, 18 May 2026 15:57:42 -0700 (PDT)
Received: from fedora.localdomain ([2405:201:5501:4861:a13b:83fe:88b1:ec13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bafb0a3esm14729648a12.0.2026.05.18.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:57:42 -0700 (PDT)
Received: by fedora.localdomain (Postfix, from userid 1000)
	id ABB6B65249C; Tue, 19 May 2026 04:31:25 +0530 (IST)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: tglx@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 0/2] rust: re-export `unsafe_precondition_assert!` and use in cpu module
Date: Tue, 19 May 2026 04:31:23 +0530
Message-ID: <20260518230125.476165-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series consists of two patches that together re-export `unsafe_precondition_assert!` 
macro from the prelude and use it in the `cpu` module.

---

Changes in v2:
- Split into two patches
- Add new patch to re-export `unsafe_precondition_assert!` from the prelude.
- Fix message formatting and copy-paste error.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260518174414.204573-1-ritvikfoss@gmail.com/

---

Ritvik Gupta (2):
  rust: prelude: re-export `unsafe_precondition_assert!`
  rust: cpu: use `unsafe_precondition_assert!`

 rust/kernel/cpu.rs     | 22 +++++++++++++++++-----
 rust/kernel/prelude.rs |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.54.0

