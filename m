Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF4361DA0
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259611; cv=none; b=YWjsazjNCcdfO/TTIUPaYxeY6f4HdIJzeWnQGZ099QA7uPP741A9QSdqLZ26De0yhGJ0jqs+x9lD2xjHi7oqV2W+piOJnDny6IBCRm2YW1aZ35WX1VzbqOeY6lo0BV621oTPKIjLV56cln7fVkf0xuQYoqHkw1Yw+v3Ma8NAc08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259611; c=relaxed/simple;
	bh=B2/F0vhSfzR11C22X79ZPAvy7Q08RGzr4S7B3Mp/HgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FHaAW/6FOahxeVv87z0SRgL2VuGo6vLZOTpIpnSk8U0D6DeaB8m1VoPIpfZ/riL9MbHlhNPB23Iw/kg4YCxcb2EIqImLKXWnAk7njcPtl5o7dTS6zE2blczrU6+PvLH+ttFHq0kNZTl1fewfOxkYj77IaQsDnu++qapbKiODTec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3QSkOiN; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3QSkOiN"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36974221f93so2292076a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259609; x=1779864409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDx5HOJPuqRAyZ1SBpaIcm1vCWOl9Riz0JdHBJ7QyUM=;
        b=i3QSkOiN5hPTne44kNfTWUCdZ+p2hWr+/ZARhraOMcC7i5Vm1h3u4xsdr2v1i5qAA1
         sVETLDlD/+0nOTAqPfsrrkD82htediQKFxENV9WeXn2pjMSQgIKAaQe9zExkw/v2AgMD
         G1+tjJHcp71Yj/VoxL9x5w4HLNhI3TKfo4pHvFhTzuhkJz7BNlwKwDsjeuca7vrDEkWJ
         RK+0yFvrB8RDIujl5Y3ep4zFlpATAeqxMRfNHs51rLRmAAA3SFHqK7jzFDk6yMhKh4Rp
         zPr7FqF+VvY2Th7R+1yyYiFERF1JukJBBJTgTQ+TpKgaJcCHyrU0J7lxtlIx+JMPGTcW
         Opaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259609; x=1779864409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDx5HOJPuqRAyZ1SBpaIcm1vCWOl9Riz0JdHBJ7QyUM=;
        b=cfM/BWlKnejmL2raKe0cFy90t6IGjMgH7UhR/8kACl0hMpp97TYOw3Rndiv2wNbPos
         MODkoqbZbjHqDktkh4ZUNbEnVPvYbM48zI8fZcDDa+E1iOD6Ul6UPRXrgFzk/JoF0PT5
         rI8423tHPgljAXmPSroSCE+zPhg4FWa3OIUnmSODnKtdA3xjg6zgOenXz6wtBUI+VaGo
         T497x0KvBwpYN1HN1wEZIKjkG1dG5Gb0lTQPATkUm+c0Q3G0WI2WqucHvrD/VGYFbLuU
         ARTFbw8MXSkNuhHW8kiffeRtrp8qBHkUQ65p2xFolavlzjBN+BhZRCN1W3BnnNU/o3mh
         1VUA==
X-Forwarded-Encrypted: i=1; AFNElJ9nzCYC2NaRhPUywGQamHwRStLPa95VzEqAqb6gw9iHPCLa0to4sQ7HaINofNQLKphY0ehprc64lupF5ClKdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZOciLvHNPv2ToNeaYbq4ev9+OrOWk+efuSho4/lpyFl5COhf
	iESa6SG4W+NiYDeAlijLPsSZpti2cEYZ+OJVFIe3IzPi29K89K1EkCfG
X-Gm-Gg: Acq92OGr8JE/I2O1gVlj4QAXFuLpTRaGnHDzSfV9XlYtte/qETdI8I/XrEHy++UaeU/
	7g+5za0/A0wEz4s0g6s9zQLqa7i7S9xYq/LfOf3BaXy6rvA4mcobZWy/JuKw+HxCyhT0Jc6A6UM
	0GxJvvEBs9hiipwZiTUNbmnL0M6TVxewvjU0GIAT4b91fsyDo40KXNIf8jBPg+JEToAaQrE5nP5
	/lsYsH/U5EFjy83/0x1D/FGBzt2f/S8dvW9aNzsUGXFVLOYQtCVJEIQh2r37zw1dZQY1IzUfexb
	tzxW4HjhTb5wxwlzttCz4k30jDwhztP6mQgHppP8sq5OZQTp1NqoeuuZkM4fif/EwvUK6QblCd4
	s6Jf+tuDYEmAu49vAsAvf3CAdliHn3dc1fdDOIVUS8OjlbaSUF4LpQl/TzsH6Q0/ghjmB2HChdi
	a6uhGiFAA2waGt2wjMw2J2233WgqJFxI7yy14w4CS9jmRF/nThQJnX3teSYj+TpWEitKJCzbWS+
	sJsCvMt5KjThaE=
X-Received: by 2002:a17:90b:1810:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36951ca602amr23738159a91.22.1779259609374;
        Tue, 19 May 2026 23:46:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:46:49 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 0/7] Rust Support for powerpc
Date: Wed, 20 May 2026 12:16:22 +0530
Message-ID: <20260520064630.1785283-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
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
 rust/Makefile                         | 52 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 ++++
 rust/helpers/helpers.c                |  2 ++
 scripts/min-tool-version.sh           |  6 +++-
 7 files changed, 69 insertions(+), 29 deletions(-)

-- 
2.54.0

