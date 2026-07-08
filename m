Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B78400E0D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498616; cv=none; b=UcwEUYYrH8VMmWki5LqOCGDtHKh27z58taSzRKdb0uHOO7kGcshHRFCWaxnSJS1Ds2MdwajWtvjYX8Ab+NFSi0lc+8yGq/pN/88FiJV17eIE+tXCoa9jT2dx6vqoiJJoekFZKrXYyykTDdPz4GGJtQW3VejRORt3nPbpNavxosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498616; c=relaxed/simple;
	bh=Uk3P3cfAEZT1XMtNlKwaeEhZkwpT2gRFnwjQYkAvRiM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Okexnz+L5cuUduAKi7Oc0kcSQfsEcuOSwPVX4N19IGYc0BVBG1ZApHhc00BpAkKg4CY/cDb6xzp/LHh8wz41F0L13oJOiBkmuf832LhpYvZAvuMCj3y8893h+RqY/feirH8WRL2gyyUbrfYmdGjSaL+rmdAfQ8+IA7OCmAbQ+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRzkj1Xy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRzkj1Xy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381ed661712so426743a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783498613; x=1784103413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKHyME7FzZLUkSII5idM6IXVqJSLJz+6sWzTPKllxxk=;
        b=eRzkj1XyOcAJyXTBrp4WkaK7i/UJwY6Qy5xghdGcwuHb32QHa8+UgNou8m4TgJeCOQ
         BGvRNn2T9SVM6ub17hqXkkYuUfUuKfmMyXC4eaRPGtZHjQvm4Jrzu7qjGPcuUcI5qZfI
         n0xon206MC2occ/gN1JofWr/zSuL/EmENA1nFXeJuUtBJyfbEg15K3r32d6Am1Jx84eO
         zoUfmBmyW8sGLqyXYIvP+e2C8/2Q4h1U1zaEKiJhHEOg+xbyCwwNYMLUS6xC4KOGQ0qF
         La3hiVdLCT4jSzeWq2eGG1SrgOZmyLTwPv/hixm3d9rfJLp1APvJ8EDaqI3xVCmVJgXC
         6t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498613; x=1784103413;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKHyME7FzZLUkSII5idM6IXVqJSLJz+6sWzTPKllxxk=;
        b=o45E3mkZIw5SfHsdSG0aku38X7xvUnNuOaU5Kq9W6+JpSryI+irOeqVnFyDQ+ezMtA
         1hPC/5s32SWzZDFmMqpsXZIS+6CFZLcDR1Uy+60KOv3B/hhm5imhE3gdPfWjeOS8hd+I
         HJG+MXPT+E8RmgcEiC1BO8wodvSUxXC5bQb931Cj5cT70Toiy3GsDAzKnUBqT3/MIasW
         Rpsoynu6XRHWmQfq7b9qrm4WioIqrxE8oy96vEsdo5yBbDuTDrJjmVTNAqDFEuUCyjxF
         4HtYyeEfL/w5Bqb/Tk5J1iGM+PWmoh2pl9izV37xSHcEaWCJaYddmih3X18D/vBSaEjq
         Zsig==
X-Forwarded-Encrypted: i=1; AHgh+Rq5BA/zqLZwwDaBA+gW+daY09Bu/GT13yQmln/XstguMd9mMT1UxAGJR6nuS+B3xseLnAAuN12LzfjSLHjKEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+FGCXpoq7hHT3q2Yevq7NMXst9Q0qVEtIMgmo9rqptV9ZEwr
	9xGSEzlj2BWY0fHafQbOFy/lm5fwEJZVFV85AgbW6XGydWWBCzz5zvHx
X-Gm-Gg: AfdE7clvG3eXSb8PSvdwUllTx4Cl/APGikBXBcoLRm3G+mMcO0e3Ze66qlHr786LVwj
	FQVCMjsx3j3jWSLD1q0QtdzQKcxkOY3afMwjnt4VoE52FFUmpJKZAKu+ftE0LJ+jz9UrFN6ZWsc
	VZfKUUAM7gQk4WngGEUBznsWQ5lIr7t4z3OeM+OLjG5TH2QER5vhxpLzpUvEiYotSfASt3Xfwrk
	MySS97nTwRNXjyoNTyTiMTkdYmcfn9xpyKg7tNTqI9mI0t+7373X8M45qgJbU9tXQDO6ltjFuye
	LHindsFWSEUBOAm+aacl/vZb3iQ5aeZoNqbvU6vYWFPbs0g2gfv+E7OJHMrc7cVc71ylbiep/XZ
	jhGDsFAtSDteaVNNzT0uEjaLY4XV+n3/npJr1H0e0RJH/4ourPruxqchiG0d08aiXrLzBrwmV9w
	HTTlKDxCvOqiF/r4nGEpxfr0TDUSZmeQQc9IUbLA5LsJcjiFAq68+Ei+qM907Vbqsj9A==
X-Received: by 2002:a17:90b:4b11:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-38941201e18mr1717208a91.20.1783498612611;
        Wed, 08 Jul 2026 01:16:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483e0a2sm16346132eec.12.2026.07.08.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:16:52 -0700 (PDT)
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
	oleg@redhat.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	msuchanek@suse.de,
	mkchauras@gmail.com,
	sshegde@linux.ibm.com,
	mchauras@linux.ibm.com,
	thuth@redhat.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	nsc@kernel.org,
	japo@linux.ibm.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 0/8] Rust Support for powerpc
Date: Wed,  8 Jul 2026 13:46:25 +0530
Message-ID: <20260708081633.1248382-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
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
V16 -> V17:
- Rebased to latest v7.2-rc2 

V15 -> V16:
- Rebased to latest v7.1-rc4
V15: https://lore.kernel.org/all/20260426105932.2270364-1-mkchauras@gmail.com/

V14 -> V15:
- Fix an issue with rustdoc build on ppc64le
V14: https://lore.kernel.org/all/20260426085725.2090827-1-mkchauras@gmail.com/

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
V1: https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com 

Link Mauve (2):
  rust: Make __udivdi3() and __umoddi3() panic
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (6):
  powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                   |  2 +
 arch/powerpc/Makefile                  |  7 ++++
 arch/powerpc/include/asm/jump_label.h  | 23 ++++++-----
 arch/powerpc/include/asm/ptrace.h      | 22 +++++++++-
 arch/powerpc/include/asm/syscall.h     |  6 +++
 arch/powerpc/include/uapi/asm/ptrace.h |  6 ++-
 arch/powerpc/kernel/ptrace/ptrace.c    |  2 +
 arch/powerpc/kernel/syscall.c          | 18 +++++++++
 rust/Makefile                          | 56 +++++++++++++++++---------
 rust/compiler_builtins.rs              |  6 +++
 rust/helpers/helpers.c                 |  2 +
 scripts/min-tool-version.sh            |  2 +
 12 files changed, 119 insertions(+), 33 deletions(-)

-- 
2.55.0

