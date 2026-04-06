Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F630CD82
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505725; cv=none; b=hMkvGvWzpJK5wRn6k/ThoQBX0Dbl81j2MQBSdRQtl691wRF/aU/AMETgwsSDYIBxMFg9yjyoBSFN18DStOyMjPZmT7QJ742h/uJXWsxR0PurSpGABT0Ud8CqmXM5uUjPqf+1JE1yV2E5rX8+nggG5oX6cLt7s3I8TNCPYRXXykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505725; c=relaxed/simple;
	bh=+REJAKdU5+YCJbYdz5FziJBHUtrKgQD+sRosct4p2Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fOhlaWCWxhSunNyByqUEI8FqCDHJgLC6mbyNvkvs3JqMXdmafKutv6jJcGcX7nC6CJfjJfQUOFl68L9R7bKaW2cUXJkZlSX7XtC7ftkq294z6oTC2Fn1eBV3dhOBB1dkntx98ABf2RBSbiyZzhM7CuWqG2+Yd7s8oTPKULYE37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9uCLzIX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9uCLzIX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so1372645a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505723; x=1776110523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8aqgt9jJm3l4gnx6c9t2i53dMaxCBMnYxyV14FUwpPQ=;
        b=q9uCLzIXEJcLVGp/pXMPc3gQbxc4pVWTDVZF/rvgJlDf41Ihpm2ZL0Wx9vcNvDab7r
         c9TzxbYNXAo5WgSL/w6qUvJXbh0N9k0iWfN+emz7BkY068+p9UBwLQRgcJbtY4A8M6gd
         OYR29qIBBakVEvlJjvgWKqsLYwwILZXWm8tVWw9gTYA5V0JPRmIZ/aTCNJmUwnAq1Q5t
         wl5xTPubgyuApkLSA2qwFDJ+ygOC24LqQHaiNCqeY5iORcW0xi5hee/4qrWESonIHI0A
         AVbAA5W3sER/WCAOc4K5q6pRCkv+0AVX1vVjkdQf0Rd7bO/Tip5piHB9RwWDGcv5Q+6f
         YdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505723; x=1776110523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aqgt9jJm3l4gnx6c9t2i53dMaxCBMnYxyV14FUwpPQ=;
        b=Ya5Cs+peZn3lgKyipOZ5PIGCkVe4bEsGa/64dQAbl2cqzIrWagr9y5sQVJYj1eucrI
         F+9Atl+QqB7pPpFK43ZW1z63gw+R/lODGfeGAG9chWOx8CHeWhX671AfPbriPHKKb9LV
         OVwEY6FXq7gHhhrRjr9bwEaSajvcHYDHH+KAb4Lme7MJY7uY1/OPgHhr7tMy9ceCtQax
         zHG0Vy0Q4f+jHruASb/XPaetiKXmbkzhru7DL7cNCiEHwu8/R97ebnKMIBtPwNYdA39y
         janu1nWHLPwTpcG/ead5ekBHZhel1ALFoA9JVZ3wnZhRHO4edmHm/jp3ngRdbMSPjvAK
         SlVg==
X-Forwarded-Encrypted: i=1; AJvYcCXBDR5CtJ1z2MheJJvqwXPsdwdK7sdT1bK48kLcnd8ZPcTvRPE643vzT2a/++BaRwosTtHNUWxHV1LkiAKc1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBe9BmU1XoACYWswUeuAb+TpsSBhCyU3vewZH6tr37ROJXVuj
	aLPGTJ7rJ8ureMmIl4VDAqmyOqgtKYa8yfU3KzKXNGkG+P5n6MM/TLsn
X-Gm-Gg: AeBDietw8wrncllefAWkHwrk1BhzMEYoQsePgFVdRna8kWytqgjZveKq5uAjShxnWCI
	Ps+Nl0Qif1PZLJ4lI1zhkRDQeTyBtRgsv3z5wQvpFFtGDnqhku8PyD6zeNesDvbnS+2jT+CSUqw
	A2TW00gU85PlBOi4dPv81c+CXu3rPDRQh9Ju/CRtrTpDo2mY6WmCHoF84/hmqNsG5+WKzl5cvYJ
	BEr99KHjWq/CQtE84iuz1V578VNq6GPPxTLjCgoJCAlJEXPgTwd9F48/CfzcfUU0IfFAsNz1EJZ
	BPZQ2wSLAG+MvEq5Fdvp7tJ7F41K/04pLdJbFlJR/3LxAhqzlz7yUcaJaqNgk3q9Z4vihpsLrHo
	6sHOcdPS7If8OY9et2J6o0P8xrwaKKdKW765OJDU7gKeZWCCRFs4fDut1+HZFRADhhkvnZfeeNH
	gznTnD+q3htDmIOzkIze+MsWuJXUyXeRa5jp5071W+kor4xEwiicDfiFpq+cIzLUuG0+33jdlTl
	PA=
X-Received: by 2002:a17:902:da92:b0:2b2:5256:9ce7 with SMTP id d9443c01a7336-2b2818e65c4mr147102775ad.36.1775505723315;
        Mon, 06 Apr 2026 13:02:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:02 -0700 (PDT)
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
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V10 0/4] Rust support for powerpc
Date: Tue,  7 Apr 2026 01:31:45 +0530
Message-ID: <20260406200149.3727922-1-mkchauras@gmail.com>
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

This has been tested on
- powernv9 hardware
- pseries P11 hardware
- pseries(9, 10) qemu
- powernv(9, 10) qemu
- rustdoc on x86 and powerpc64le
- rusttest on x86 and powerpc64le

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.


[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V9 -> V10:
- rust/Makefile updated with review comments from Miguel
- Patch 1/4 updated with commit message and subject
V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/

V8 -> V9:
- rust/Makefile updated with a directory instead of abspath
V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/

V7 -> V8:
- rust/Makefile updated to separate host libraries from target
V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/

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
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 +++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++----
 rust/Makefile                         | 66 ++++++++++++++++-----------
 4 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.53.0

