Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2102DB7B4
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193864; cv=none; b=Gn+PN4521B9tbIZO9c0mZVD1tp4EmN2b+XMbdw2YwOQWjhWo6lVakmIKLp/zCucMp6CxH10guToXXNdKqHLt9T15/D9niKLZpBffrjSKxh/7gpac9JKQbhMF7XV/eyPrkyzxVQPT6GE1aCNBOTbJfcJbrPT7uEXEZ2Lm0YGqncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193864; c=relaxed/simple;
	bh=g9siYUbQ58cNl0Jrd/fk6s7kG2U4m8FwDlgbsCIlbYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mfgQsQVQx1JUcaqIa8mcOFb/o/QXEwywNbm2I2Na1qLDMiAHCILtFSbhU8nZwHcLLk+ilkYTk/ApdTR6jFFdCZLkYoehCd7L56xtxCkCsRK6Xmm+K3vIapqHWcEtGigQgeae4TAlrUS/WcbjzSDiHbASUdu3UlC20BMA1QRzi1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqWxk2HX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqWxk2HX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso5811939a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193862; x=1777798662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1TNDhheCgYQwNZEg4xsaQHtI58WnlBldGT70w7nMF+s=;
        b=FqWxk2HX60DkQcEVZLi9t1cVeMQjWroMkPxKah+n5IWHw4SVfU3PU4lnWvEA6FhJBe
         /1DHc/aNYYmTGB3qmbDmPDN0wziOmFF+RFuztQsD6UgL5J1LrsejXih971EZx0hJrBN+
         IJpZwsVPqW3ZXlILnVRp8Ia3wr35knm1HCeo7d7W1WvSNf5DtPg3geQmF1W01KRPUx09
         p/i27tViGk4WmtojiGit3Fiwd0H8oaz1Mx5k3wgmA5VAsSJmELtFkPJ57htRyIdEgy6+
         EmJkKlkmyD6NkajEyDBK++3vUteLt9Xwu5Fo8/gAZdsZv4DqaQC0EztPYe2tcCXgh/Ls
         4QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193862; x=1777798662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TNDhheCgYQwNZEg4xsaQHtI58WnlBldGT70w7nMF+s=;
        b=k0DrXYT3HCdURRX7wxVKrHrsivspgkVp5+6gzraAPmueMc0n+yiEHhF/CFgWWI67Y2
         WNOVBlnNoAaFI98mQ0967CcYGwgAndVhySWiTDeimfsaAHKc89waDiWCwoCLeg5Mh0lO
         qeKPnKHMCAnnSBBd8AQDYicvAR8ufPSM6vSbEBfjRIDDpFhWmRgAFl9oCfIqkEl0IayQ
         7pmtvpoev8Ndn7GLJduWLUvDTMlr//74TQ3sagSQbqvbuiuo5pPcT6vVN3qJXpUAIlsO
         kSLCaBj0Ul0Hvy81k8Kzc8+2Em1k6CAtpiLZ/pCvux9KhkOGgnZG/32zcWxCRfyr/wRt
         pWzw==
X-Forwarded-Encrypted: i=1; AFNElJ91F1KsyPAQONmUOrshsIUcEBPMHqtkcwCOgTdcEUHSXAa5Z5kRbtgLMpoyVX7TzwkBnunbp7WSXl2N5TCAPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBewJWv4Nj3CHusfqLBo8nHcgPqeJTvoFHLatmpwvtQ7YO2AA
	Yr4C+fcr6IIkfoTUOk4PtT4jUx5tP8R8UOx/ZcBVGVhWwv5sWrQj2OJ0
X-Gm-Gg: AeBDiesHGfltnYDNufFNVCMyU2zeiNKhciMYKU3Zm7rjSqIUhLAKT+pyPINjaw5ohMI
	VoRvS+E960mcUodQtToNNtLwjfVpZH6mFXhm6HN9JYkdLOlJgn+O6/OP8QBYp71Ho8rejoZYjiP
	gelRCIKfZchdndlPzYJkFYtrDme8egxZzz1orNpmdiumF9bX585kHodVyvRuKdQxh0vEoktGskC
	FrWoeqwHXQlDgtJMaz9+IDuVlNjtmDEp/Em9Y7lik/DFZEqPQbs9AJUyT0Aq2ytXKbyEiFtX5XA
	W4DTHyWyKODH4Zn35mjOxaFuDYk/MLJC0A0jQPM2dy7N2TRb9aexwCHxHhzdhZZEodbmUwTd3sG
	y/8beU7BywsjBGCBPtZxebE1JtvXztl1q0Q2RHlVCVJq1eqvHPdeyg0Mo7rQMgXImbOwcrjnvtE
	+D8yR2pcvZd7og9CqQTQYRkJGNvZe+ssvSFkl4wy5OfH1Br1OdBl4Z+lbGjhdU4MoWnj/prtjCA
	f6J6StgXBh0i2k=
X-Received: by 2002:a17:90b:5490:b0:35e:594a:5b6b with SMTP id 98e67ed59e1d1-361404992a1mr45071909a91.24.1777193862298;
        Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 0/7] Rust support for powerpc
Date: Sun, 26 Apr 2026 14:27:18 +0530
Message-ID: <20260426085725.2090827-1-mkchauras@gmail.com>
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
V13 -> V14:
- 2nd patch is rewritten (Christian)
- Fixed a small typo in rust/Makefile (Sashiko)
- Fixed commit message in Patch 4 (Sashiko)
V13: https://lore.kernel.org/all/20260424054742.45832-1-mkchauras@gmail.com/

V12 -> V13:
- Added a patch for fixing build issue on ppc32 by Link Mauve
- Added another patch to fix a build issue in dma-buf
- Added another patch to enforce minimum `rustc` version for powerpc
V12: https://lore.kernel.org/all/20260421120958.190430-1-mkchauras@gmail.com/

V11 -> V12:
- Rebased to mainline (rust/Makefile conflict resolved)
V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/

V10 -> V11:
- Updated `rust/Makefile`
- Not all libraries are move to `rust/host` directory now. Only
  proc_macro2, quote and syn are moved
- Special handling for pin init is added. Details in commit
- Removed mkdir for `rust/host`, this is now handled by toolchain.
V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/

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
Link Mauve (2):
  rust: Make __udivdi3() and __umoddi3() panic
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (5):
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++------
 include/linux/dma-resv.h              |  2 +-
 rust/Makefile                         | 52 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 ++++
 scripts/min-tool-version.sh           |  6 +++-
 7 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.53.0

