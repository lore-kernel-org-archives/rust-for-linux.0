Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FFF3A2549
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773414; cv=none; b=nlNY78Lk3EiplV02rq1PKmReCb3WaZNEmvF7yQaUiNZ9FdVgEL+A8/gJ5XfozAgJtbvGbET2JHikprUHkyykZqjRtmNt2jxqrRDVPCQZ2k3ULmDYkInSSNsAGCEf2DEDl+40YU89Ed+VYDoqS3Qet5nrdM5PDTB7xFxzHhtlcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773414; c=relaxed/simple;
	bh=G+7npAxWSqcEL97/LfgOxKQnSNWCZCNbCO7e2cHdvoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oj+MlwLAe+DSVAT3EnXrgdJ4EtULXtMRwWTPODzx/ZonHw4FCAcnoKx4NB2ayJhwXRGsQzGsxDVrgetFKpbkQJYOMM4x6aI8mwFrdzPx9ehBWCD8sQiVq62DIn6W9YVBBo5V+8qA+TnVkXivwKURhrlR33/4J9D8vhRGo80m7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYlFZwX+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYlFZwX+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso2954763a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773412; x=1777378212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYvELhLaqGtSokpfPVRkmugugq4w5jY0uoduoY+P08E=;
        b=pYlFZwX+cOLqAOrbnW552pv8yFdM2WD4oPA352QZ7ilQCgoC4x0wo0nGRn0/EQ9T3W
         aIcWHPW93up6W72mT2VHdPyavwDsyY597+IstZAjZmIyqNTlm0MEYxUzjdiijriJH5Pg
         A5zhmfzDAswH9JSPePsOTUGMIp/FpR+TxzkPA+dy5xWHOItr58AirjiDzwuVFOZpBAGT
         N31/H44nKIMwikeV7qfMxaEM0UpDNfsHyHMRKm+xl4+T6SsiLDEXtlwqbcClqDvUl84+
         o1Rs3CGH/zb1fCynqGi/J0zjcg2K1qcXG6FeRzEi4p/LjL8INJsTBJ3Re1skr4pQnR5F
         cBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773412; x=1777378212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYvELhLaqGtSokpfPVRkmugugq4w5jY0uoduoY+P08E=;
        b=fnZlyDyHsR8moBbXbNE07+fOE6hudd4A+Qxdw00MnUorMhtNUaiF5rLPeUClsXhCQS
         R6dxt6cIZrPtKcb/Jc+QiNJV+SiQMN/04lA+pt6y+6Nc6nbPw6+JX6fT3DYCtro4MBNQ
         OIv1k/tBB0A7j43emLKE/2jZLlRbEFPpCgOXBmzdO22YqmnzoolgtoRjdnn2geMOZ4Z3
         SUNzlArVIRsvOzZZLBrTrIYAyn7EbqumMxAzT1PsHd8aNdU4TOkYlmPj0Mq9VUqwtHD+
         RYYcYgPcjih/CCcuWy94CtDchpQbm+BQz/1odW0kxtaWYCDp8vkQcDiGoow8d2Ob28lH
         nV8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+JdYT6auR79yTa+jfQaf+LLlyz5PObpC/Ha2fFeC/T0LYxi5+0Ba489hwkkJs0CW2lMbia7R54dDN+vYKcoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUr/kOj9PySn4WuFoPjGYvIaSI6VMQLllocXMtJidPdlqYtal
	EASEP1gjZu2Vkj2g7e/xj7aiCTV8QyUoWjHs67OxTWhhC5CaTj237o0u
X-Gm-Gg: AeBDietpznVTCPhlvbndaS49hMgYZhZyr1NfpOVrIBeKzC0LCvvFN0fU5Rn47XORcTw
	ytxdKR/l9iIWU88IVwhZz/8LBDDrNsw6W2aBnpesYUWO1UwfP6pBPwLEH1eSvj7f5nLaJM5yWdM
	nT/96te3MmP7cRkGRYuhsGcZOutEY2uxyVHsQTLeuLWafo/UEGHU0R99Yzq2SzOwok1GhsVVlIY
	PhhTiL9+Upg16VXWSS1zg2um/OY2vA7BkWbd4KB0XVzM1sGpZeoHeTkUMUO82R68G6iSimFNpQ+
	MNKXDHS9cIZ8HY0VouKrf3iizm237dr5Cz6htoxm8xr9FRleXxb+x47rfyM690BzZdHWe3YV8V6
	RriKdE9iHGQNEdCE1ZwQROVxBCnmwwwyU9Wa4bqZI6sRZUCenJYB9kQ6ZoRnc67UJttoADm4/Wp
	5DTrUn6J/7VWju3bd0t3nHbIVygn65Mo2LyMpOx1VU4+5fvzskLFtfguf9cuMGhfIF+Tu6A+W45
	pv7GurjkRvnPaU=
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr18545775a91.10.1776773412415;
        Tue, 21 Apr 2026 05:10:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:11 -0700 (PDT)
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
Subject: [PATCH V12 0/4] Rust support for powerpc
Date: Tue, 21 Apr 2026 17:39:54 +0530
Message-ID: <20260421120958.190430-1-mkchauras@gmail.com>
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

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++------
 rust/Makefile                         | 48 +++++++++++++++++----------
 4 files changed, 52 insertions(+), 28 deletions(-)

-- 
2.53.0

