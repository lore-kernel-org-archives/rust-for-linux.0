Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0C1552ED;
	Wed, 18 Dec 2024 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502865; cv=none; b=bSKmqX8dmOy7dofnAhqMXYsY41VVQAyIl3AdRgl4BaVxY4x58veBsXHsDl5gP1Rn9bgV6hZDBEozbtYdOz+ame9xSZtGICzXd71FeACIw0EwEqXA0dxWzBHsMZHHN6LP+9eX8DTMGdFSAf85F4tuETtdd1xCS1NBF1B0ftCcLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502865; c=relaxed/simple;
	bh=axHHrpgUD7v1zaF4eLQM7Od/Mfp7jOaevM6Bc4L5QyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVlupHTyXC+R5DBIGYbrFKVXxMdGDbpQV2NtaOAv9H9SO1lylX1RqkIBvxE/1nGMz060gnSvTEOWaOJpyS1s8d+edIitjO72BOb3sz1ZFFCAEySyQbn2T3vXknqbbktET83bzK9ZiKyBm2SbwTJiCiZa3gsknlgO/mAZpLCDdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iULq8ZmO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iULq8ZmO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728f337a921so6352088b3a.3;
        Tue, 17 Dec 2024 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502863; x=1735107663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=iULq8ZmOL0BwdSNJmBWijbYUu2MGhiUodsQxnSEh4dhkv9FGIgwdlKo1u7oVEqi6ZZ
         9jQl+7suUVC890kPE7m8RgWvQR/GXHrtJ/HeLx5GSd6vgLsrdpCtfnX52crMsPM/1PWl
         VZeqQZRh1H7PTJDWf27mT0SXPT7RYr2AgLlnY5nFTV5JWnUztFqgUyTC39rQHQonzBQ1
         mqXxeL+LiC8a6Gnr4HKzu0uW/Gp8Q5hFBFwICpCcQeVJGJgjG9ZiTlAOMEbwmNWCIST8
         dp3t9/HCXiW0cl6ajgOEzLPeX0QvCKuUj43OfmP8Ftdrs3oMU0mtp9ScnvV4CMyTIyqE
         uH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502863; x=1735107663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=sl5YIMgbShQb7StCNUf7AWRWH+3uwkjD4ush+kmQjK5PSFfnpw30jbaIARbF38eBoO
         uLDBKKS0oC0QE+HiSzuB3DTSV5uAdS30zmUHVlh6r7b1ry/uYsNfJcCtoiYRfNDDpauS
         6LQN8FzOVVZnwHiI+KvrluY6OJiVsHx/BOyH4CBPgvoOw/Vrj7kWlHVc2008sqtM3yCu
         +qm1NYNo5xAkJ6IUBvBFznWuTqY7WQpgjklisDneb5+DtWl9tuLDrsOK1QuEbLU+Lkko
         CeXLg9DH98ZRHgDxoyVFRq3ZDZ9mdtPAKOYcAdIczE+cjL6BR++xke6kRcTQJ19mgve8
         GlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO77cazt8zvxFhnmK6Loz3RGcdXmdFazTcf4GatPJvjgGhta5lS3BNVOvF1jkdXZFpIDiRT/LbR9olY2OWTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8L6a4OKeys3u9WbA0mlEQmC2Hjb6C4sgSp8ekBo4srZc5Qxm5
	bbwpZWp4bmtlFZM1CdWUp3A0aMk1ngcSVVqgxDwYNWvs81XAPhkHx0VXUYzF
X-Gm-Gg: ASbGnctZYmcnTCpqW1F4FrPLiVHoFxBzsymtLnZ8bnsyP6of/vzv6n5DwjpPMxZKEMT
	P5qNKM8yeNH+xYnp5cWs21R8pEV5iUkPKyXiOF8w9/Ghj6IwnhJ+QpQM+l82jsuRIyG/meijOzO
	FdIRzWUdo+ez+G3nRbc+9A+aL1uJwkagx8WiXV8xAKgPwYnbihfYFjmzIQl1gI67+hG5apcsJTg
	DfvlKNKPpnnXJ1Fud4gJ50+5gnH0FfBhF2+D6IxfoTHhZqsVq6WbMA4nFm8K2+7ZDszreWudoZY
	6LS+rNV8JSQ8sedwUg==
X-Google-Smtp-Source: AGHT+IHh5VfbLc1bzyNkDoQn4Y2IW8LvraCE8/Q1ywB1dqB6a07VG5XuZlyp8536+909iPa3S+qOgg==
X-Received: by 2002:a05:6a21:6f87:b0:1e0:b5ae:8fc1 with SMTP id adf61e73a8af0-1e5b47f9601mr3440480637.13.1734502862615;
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v2 0/5] rust: Add bug/warn abstractions
Date: Wed, 18 Dec 2024 15:20:04 +0900
Message-ID: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds warn_on and warn_on_once macros with the bug/warn
abstraction.

Wrapping C's BUG/WARN macros does not work the same way on
architectures that support Rust (x86, RISC-V, ARM64, LoongArch). Rust
code needs to directly execute the same assembly code used on the C
side. To avoid duplicating the assembly code, this approach mirrors
what the static branch code does: it dynamically generates the
assembly code for Rust using the C preprocessor.

The 1st to 4th patches export the BUG/WARN assembly code for Rust on
each architecture, with no functional changes on the C side. The
changes for x86 and RISC-V are straightforward. However, the ARM64 and
LoongArch assembly code are designed differently; they are used by
both C inline assembly and assembly code. As a result, sharing this
code with Rust is complicated.

The last patch adds the bug abstraction with warn_on and warn_on_once
implementations.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.

v2:
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (5):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing
    with Rust
  rust: Add warn_on and warn_on_once

 arch/arm64/include/asm/asm-bug.h              |  31 +++++-
 arch/loongarch/include/asm/bug.h              |  31 +++++-
 arch/riscv/include/asm/bug.h                  |  35 +++---
 arch/x86/include/asm/bug.h                    |  51 +++++----
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 224 insertions(+), 49 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 517743c4e303252cd8c1a1fb1bed28e7d94d4678
-- 
2.43.0

