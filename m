Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED124028FF
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499118; cv=none; b=TFPn3MsG36+XKvYgXOY4/tMO8sjAoqmlVXL3B+rI/o8zSACpjPMuAqrlIUWViM6+mBFrG2rvnA5qq7dbI6ufXvO42lOAaVLqemJ44qEXWTuvTQPaxsI5gYBnbu3WE5tDroatNHH53awjhNfh4m5cjLSgrhhwwmCYeolwjWb9Sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499118; c=relaxed/simple;
	bh=AoiLGkk6ERpoZrsTXdLKlIi8dXjBoc9CmxC7x0DV5pc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRff/UWieNsiSRRqH69PLqnFBExsJZ/th74KrBd5+bgvUNTyV8qqiLmEplqxH0Y9tAT5cA0tBB7DCvXbxVx5s5hsyQklCI9sYOMOw6iC87QVuk5+8opmXxtwBWzDLcxo3Cw5RKLXUs2j2DisxL1CtjJBmp5LWf8ZEuHUKJHXewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOqSaoLQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOqSaoLQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so363438a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499112; x=1784103912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unhRE1bbaSsT1YMYJtqH3njUIuLKUE290GOc7N1/y2Y=;
        b=kOqSaoLQNDzH7wuByTLcLhHXt8hLfCAaiEuDaQO0eVk3Coe9soMyYTD+nYWz503xVy
         OFou3GDHx92+7e7ZhYqPsOmCiGqgF2MNsWFWvM/i+Ak4dDQham/JZanOZl2ab4EUPRXU
         Sv0pYuRjpPhoObqa2HBW2Fz5txRQjjNhjpiwMeJq/8KinelXU+1wiKBD7SMWe22izJml
         14veydahZJh0yOe7+kubzMSn4EZIWz1/MfjHVcI5Ns2n5hsKKncqVk98gWpFeGUQ9i9c
         zMGLrhAfOUe5Kv3KLY0ZxpKdN5QFP95A9HatTcsrtldqgoMSj3ZWvVZk6nIeHuKQwnCn
         RcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499112; x=1784103912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unhRE1bbaSsT1YMYJtqH3njUIuLKUE290GOc7N1/y2Y=;
        b=mVf+RO10HwS0Ne5KY0bdGJ6Uzvl7E6gQGdAIACPhgeW1TWAImDkCY4SWx/l/gcBSK2
         brTKIvnEy3esAJwY47i6YvLhKH4tqz8874///5kig5T81WoHrEYSmVQ3Pi6YlJ3bK3pO
         wtmmYEhntoMkQtK3P9sMu6057IIUBwTxtOKzDhyuw4KVkEPA2i1QFG/s/atYERSwAdAj
         JYfjXut0tZaSOQXFuPtlijK9PzraDTr8nUBab2BQuH8XoD/0Z2N0HX0apIhcYDMEKKNk
         KSu3l2Nyo7uatcfdx8YyJKrbmbPOpLV3jnb1BZZqeBWCVakuMw+zlftBFGEyuxH8G6vk
         ul1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Nb4Dn3Aeev64Pr7GZvpCzhZ+G0J7VYKm9SD4FtGMYR7C782bNYMdoJAQ7O4vRT67+3Z+7Wum4dIyl40p8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzDdCMKVt/eS2f4VjJCErlTYqj0tVGx1zRDWWao6GKiTnf7EC
	14btiyCgcFzwkfyxowCbVn//x4E8ddr6ECUbQgitOg6LsUG2Wl429AJl
X-Gm-Gg: AfdE7cnjFyGygoSnNa5cg95Hp9aX1Z0ALGZzDiDzubhNG/hZEE2b8Xxtk1cW/fIDVmw
	fl2KgENZ8C0uVQpVuqJ/psd/iW7abT63CEwmpJvKMOWPiTgIQr4ijhJGTDL2hOaPQ3bs5bjUwM1
	F/CIuWNsCKCrA0bMtJhZh0oFGUKsWalCe5xKxsG2BtWDxOK7VDWzoYvDsUbPHL3iALlpfJJClUp
	hjvTp5N5zJQCKKgFnFoM4vKTxw4Wi6sZpi5EdaqtJ419Y+mkvNUoxzDp1aSnYXhCCV+vekrcLsS
	CCiJE6Y8mS2AoYrgUPh8xE5wKXh8sh766ysFONExrsp+ao1sB7SGZ8DZd43GmFVexPgPOv6UgxC
	eLFQpFwN2QZ+cUUat3GQhWYVBMIrv/tq4znVUfXHg/BYtKVUNIRPXBv2h+u4bElpNbUzerpMJYY
	qU28tGP+zhjphoXU9kOx18cnKXX8xiWKpoE38cw5f5V3IThlzUmlh27mrm+ff+USrEVA==
X-Received: by 2002:a05:6a21:6e93:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c0bcff3977mr1796917637.26.1783499112244;
        Wed, 08 Jul 2026 01:25:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:11 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 0/7] Rust Support for powerpc
Date: Wed,  8 Jul 2026 13:54:47 +0530
Message-ID: <20260708082454.1254320-1-mkchauras@gmail.com>
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

Mukesh Kumar Chaurasiya (IBM) (5):
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++-----
 rust/Makefile                         | 56 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 +++
 rust/helpers/helpers.c                |  2 +
 scripts/min-tool-version.sh           |  2 +
 7 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.55.0

