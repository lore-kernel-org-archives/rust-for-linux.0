Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7F2D8DA8
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009681; cv=none; b=cNS3mEyicFQn30dGyK4S8MJqifWnBZW9l+waIFZpz2y2OkVnTQE35o0WL4GCa0CfkmwaiuiawYStj5g6QD5ZliY6wcF/JjpnX3bupgQyWXoD9p6mpWjbE3B7tTkS0uujnzOPjoS/F0INDS02p+3pxYCxT1nJJSSADDzCNXMzD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009681; c=relaxed/simple;
	bh=Wbj58W73Rvn11UjYWl9yYv7iLUdHME6E7yi35WzUH1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GC0Hpd1e7hqcXl9VDFUrYAMMwlEq2zTEsnYlzKRJ5KbDVTTQwzYPYaTodO5o8+x6yASd3ZtKjyrbofqLnzpjvxoHUQjqeOKEKscmHyn6Jub+EcQjQD1ph95KttLRirIxgFerC2L/aLRxY1/dTrE9MK1uwcHzKEGswP/R5ZOLxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHMqY7He; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHMqY7He"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so5920279a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009679; x=1777614479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=cHMqY7He+W2KB9nqyY8WWga6dOfHRzrhkB2ojWV9hG4/tUkwbWI8E3xNEUv430vMug
         hJb1hnUxJ7CxHksmxdFV/NgfRch6aXRo9JxJQxHkdUxTt4DVIZCY1qaY7SbGCZktpu9R
         ZnpEGZjyy+Pak3g6YS0CjQTKUlNJG1EC4Cv/VPpf2SD5bJE9ZIERx2Gkjupu6cb/dFFP
         Lb9m3iFpFQD43/mjg8cgJ4lgV4yq34z2aogqpXizwJWHkc/RTpqYqk/dqW2HsVsND+md
         4aHzWgK84BgRpYdu48MLUznmzmmk2akOAb0BZtYimhb9zVjH8W3yjwgoFd5UxNKizgb5
         BI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009679; x=1777614479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=JNJio1zE6SmqMUw2+df5aSjmP6VLT1S5L9qJynx4jRw7BuEDXCAa04bji7Y8sU9NoB
         4DcSql/O9eu8EjnlF/5Q1vw1DjiNjl/b/i03QF2skXLUFXqccgYrg3iTb3ky7lKAmdu6
         d0L431tNDUH0IqLOQNyn73Sq+Y7yA3Nfpe7DVZuYQi9HyVb7q6DXqZ0YmHqTTd5yrtEQ
         8+XkSenRCBgMaKlMG4u5zInJHdcQQMvhEcK+wSrSowOmMT3IjUh3MxTY1k7wxJsmqRs0
         M3WldOgUlpm1zQgnbxlrLMkUl0bG8aSJ7DjNJBi7uJ1xrYCZjPOMYukG2JXVk91+/DD7
         wC9A==
X-Forwarded-Encrypted: i=1; AFNElJ9llgKmzKGrb43bgoOZBW9XG/db+M3eT/bCiGa17SK087UuUSG7YYMuVEiXtNj4ZLZGyUq/k8L9oQ37duZ70A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIXeEYoi5NI+ZfmevSEZbbO9JNOFmIVQlGfZn8p5Q8aIor8w+b
	K2OexqG2BG4iL+7BjWrJwvP7glOsIfdwKjC5YKjoK5mUXblG3L3foIVa
X-Gm-Gg: AeBDiesee/kCPDLDotoVvwcRCFP1ZOSq2j46PLLGoXeyQFGugX7H3eAy7gsIp9WgOtG
	7z4V11m5EuF/G8mUKgepI5bDcaA0IvzUWTnSkSUYq8vou7EuZdFlL0Q8V3SPTDt6eIpP0stkKsb
	31BB0qbBB9TqPjqelMoMRU35nwJJjzQscxc/pI1DTho14lWgkEYkauo5V/Grfr546T1BIO5Eqhy
	R+yrgHVIKY6m4jAPp8uw7MskjKarO6qwIZRqlUi3hpOgvixyBilzMtfexTpvpGJDIhHroxvBPu2
	3aSktLx2O1F0ZRxiSj0pFZW64y/gt0rC65wgzEm1gk3fZ4BJx6Qhrn4yKGhE+rceLkDt23NkBze
	3GjbAzBu7naaigbodpg2F4nFAZiTfdvBq7ossnjoTdqkQPrX01Fm3ZQeHRFgvvmfYOcpgtyqpXr
	IXA3kMOMsPKAUNY6kUnr0gDNi6rG7lHYw/SaPJCAt0tIi1DsAN9fMdZOYrpwaQw2t0T47uK9HzB
	RUFdt7HHmY7LT4=
X-Received: by 2002:a17:903:28e:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b5f9f9f125mr305572665ad.41.1777009679150;
        Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:47:58 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 0/7] Rust support for powerpc
Date: Fri, 24 Apr 2026 11:17:35 +0530
Message-ID: <20260424054742.45832-1-mkchauras@gmail.com>
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

