Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08929D287
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800190; cv=none; b=LH5I0PD08O1OytEil6WGpZnbW4kNnobjVmAZvU5dZzMFtDaAp8xrCJWrP9DSZzOo0Q0/bRjKNQbCkGXBhJovHp2ZtkziZ5jWVSpYzniXtz8MMDb08B8KS9g3o3Uq05TMynwZ/MowcREX2sJEWJCbnHdKUy0UjVhPZH+TnDi8WZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800190; c=relaxed/simple;
	bh=E3cR9PlmK4WXfjtrOLk286ndwkSip9NU9mq7Vbx9+TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=psHjJENIsC8h5CJz8Pk/cfOpqevMxxt0zvzjrfrb1KbffHZuuGpUo9UHVK9xTkKP1kGtlT5bUoK/7iM+hLCYbFQAVszJsutfiW/E5BL1eFY2QqDbWyjE6yXnglK6pUsm+VqrLgEo6jnV7/+ynf9BLKd/CGeRDGG6EdNRnyXj/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRui/iFa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRui/iFa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b0c8362d93so19547615ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800189; x=1775404989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJWuo+9xSqQU3Qf5pjDrFaLqDSLZxCVWVnyQisupYyM=;
        b=LRui/iFap+hP0OLFugl1MFmTuPFw/TR7IkcJIuK6sawdDZY3N0lPsmC83B0bobpFFw
         Y2n/MD/kwUgYtCTEnb8IAUS/IlaHuw7LYx7/ReZE5zSTjMeDDOFzQxv0xAR5K/DAj2Ne
         G7ng7bUEod6LFRcen8ZTwoxaB4JV5PLABsMtdwvihhs/sbUPqB8b0pH7jPvGYEFBuhtr
         Pwv0g51hC/AveHpWhzc5tYrD8C03LM2YXtoN9hnRn2jTDTpw+lvVnmr00DJSgDiN+y3o
         k5XecqGLrzlM6/8SFr/TZWErnQyKTIUQTi6wxZixZ/XstNEtl40Tb5xsFUnvaoEymWyx
         jtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800189; x=1775404989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJWuo+9xSqQU3Qf5pjDrFaLqDSLZxCVWVnyQisupYyM=;
        b=qSlHaddvkrkcGbv/6ck5mu1HXNEvt1AqXEpOeetkZu57m1t/RJY3g9OqKgZ3EGynpS
         mPlw7/5x/DfoD9jhOOAPVaEuQwgknAci+VwU1l7o/9XiIAUgrUcqelFwKa8xXn7ddiH5
         HNKAQnUFXQF9u73KEXihMCsKuq+4LOtnET22GlK9o3OuANPphjSd8/tUsxHoTQG5jJE3
         lT9gckqRfpHl0DBQgSCE7DeCZdWBoxJ5M5et6b4ANojlrFH176jnc82jEGXmfT6rWubV
         /r1Xcd0O/Ddqrci6RLq/0/oIRm2ZsPq5clNqc2a4g0Z0R22PPTTJoVXvRN5UuMsxX1dK
         hLZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkarCSKthugOmyJjAKnklwfJFJpggl3IQojvLeLcPwAHubdDwc+fZBPtQeVkagFiwc950B4XHhOt+kAVA40g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqSTrj4lsx0qp1IaoG0TxpF21BzxR/hjSh6qYITIkoLXU0xoe
	EKzGg+4Gi58XPzULIJQjwdE+k4QTs6+1gPtnEdhQyAzYHJzrIEa086Hq
X-Gm-Gg: ATEYQzw8Vp1RzqjZwW1g+L6lttZULVxrSie7sliQiF3oh6N0sHijWBUYYE4xQBnEjJH
	/NKZEq+k/+i8zPnyNRPiMqMaNpF7GQwZlflKQ81t38TW1RkRnOPnzBkXTxMYNy6qCIIjBZfdBES
	SIjIpDvkmR2QD0J5pMDdowjiFtlPc/jbu2Gw4xhOkj6XmtwWZLlvU4sVZdoN+S4sq8cU8Non+y2
	C6xq5SowFzN6ZvGzkkg6+6PJ6ymS0ITNERNOL+YQggkfN3s61nvx2CFYbZX0EGF/byjmDw1smfb
	/dPX0ZYO75E6AAyru8Rs1OGGnKbYpWCMbzGkvCa6eWnbNF9j+q9eQ2lZRh+E3yHHA2bdUC1O0ca
	aE/5OvSuG3khkpF1X/AIO+bbMXueZbkobMGyI/P52cuUMhvSkCP5qDK9hQHKVkShqB4Aw4oIxgE
	iitasKrvkP9y1GQIzbWAL7XtrXo9ZKSIL4RS4iZh3OAQjFZbRCysto79z+A2CYpUFDQ21eJUHCe
	Ck=
X-Received: by 2002:a17:903:19d0:b0:2b0:afb4:7d41 with SMTP id d9443c01a7336-2b0cdc02e54mr102192735ad.10.1774800188509;
        Sun, 29 Mar 2026 09:03:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm52521175ad.77.2026.03.29.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:08 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V7 0/4] Rust support for powerpc
Date: Sun, 29 Mar 2026 21:32:50 +0530
Message-ID: <20260329160254.2592207-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on powernv9 hardware and power10 pseries qemu.

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.


[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V6 -> V7:
- Documentation removed as powerpc is still under development
- Added a fix for race condition in rust/Makefile
V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com

V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix a race condition in Makefile
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 +++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 13 +++++++++++--
 4 files changed, 33 insertions(+), 12 deletions(-)

-- 
2.53.0

