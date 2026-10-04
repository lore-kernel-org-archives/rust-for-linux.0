Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC924248CE
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116000; cv=none; b=nLXb5ho97uQTYeXTjCyN9ZEyfc+lrRswCO3GIw1mnvaGvLe2UhQg/F7n5K2VRfrmDWPhEg+GywCeKvEoYwXkAcoQvcV7WqwbNIV9SL3GmENfaTxPigVA89A1HgkEgeNr+B6zT31P6io0G3VFJ6drLgSFbBYzYe6cCmw1QIZW2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116000; c=relaxed/simple;
	bh=ITA3OVcNcMjOC4ejeIYmsiFl6yGeCi0trPklszX/v3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBybYL97u1Ppb40hQsTTSb9jihmwhGq4Dc6HCqc/nPxzpCMcsmHFoHN0V1OdaJJtPLHT0jfBkrUHhL2ihgt2tG/Bz5rGHBMl+u/CelXrk5yqOWpMJro7c0iPMY7iaqt4VoKW127SSwnu6Pj7W9x3jTiJj5MsXr+L3KKE8nf/DXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=ddqMgXX8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FWhHOHp+; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="ddqMgXX8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FWhHOHp+"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F5DF1D0014C
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 08:13:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 04 Oct 2026 08:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791115994; x=1791202394; bh=1ZoTvrC2BNK9y0X6wptni
	XwBXAUofHrlvUBugHQcQFc=; b=ddqMgXX8Kibiw2pP4eOHqsJTHOWHBl2KABsRN
	XE9GqgnvNhK0c3LeLiiYsg9KRHDwCE5GBJPiuwDEPhiVL0vJ04FG34eyQ8CF7OBi
	nw8CZin96d7BMIQOCVEijrDjhjMOK770vA1WrrxQWQcidQ9fxmXGN6AQSIkUkLIq
	HFFf/rulJa9iFl7Tm4QvtJSn5vN89r/wACRIGNO2avTjTITMgddqutI+/2WnZIzj
	NDXfPIC7ot4/8OeR6ZNVND3RU/ohBnOq2LY8AS7PLR/InEw/Y3afiUDla1199RfP
	RP9e2Koxz229mTYiZgVd+jZH36DRCu9tGU0ADjofxZcnUYozg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791115994; x=1791202394; bh=1ZoTvrC2BNK9y0X6wptniXwBXAUofHrlvUB
	ugHQcQFc=; b=FWhHOHp+XiWtM+JjL7EWZhjGeC8E3yrkEv4IgMwzC0g2UMyDhMB
	pJ9e2bGOlQbTX3LkedDKLzhGfXCsGnkqrZK1Un5ie7Eg9T7qeodG21CKQxPVytq2
	gnSrZgbUkYE2D1Em9jnvjj+Sh4ret2I7VGn9W+9o/GZgpKkTo1l5+EGyl1Otjldy
	RgQVTdopRuKwkeTE49pDnwX3F6OxoAAnCTJzeL4EBVVt+UK60jqcUIxXZp06BUZi
	eII7yk4BqSzNHoM1/4RABD2zJVOZUUQOldEnGV05Hff7bsVsdQG0043WCJzsashd
	VjfjxkGcWL1ze8/w7JYGVM2n3CcZs8lEjzw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791115994; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:AA5+obKOlIybRfogICLBWB+oy7sX2RlkZ3qOqbNRrVOnVMJ
	Ewgpz+J/lroGWLvgKFENWJ+e4WM9/xev6qLjKYUkaXpm2ND/oOEpKz1H1mwkwk7R
	3s/6MBGrJUGJhpx4lPM2WpjZM5YD2bkLfLtpAQfw6X5z6D2YxDKN08nabQAqVPvs
	1tGcFSdkbrLEmq3Cu3R5B6UH7Rp4pd4x17rI3yPa1wtECZHILZLK7PEzr054aTgK
	7wS4bzuyxTYYPtxn/Jh5j6k/j/3EYwSk+JixO/BFOR8czf4MfXWNDmH2yd2DqsP1
	z7X04FQeVMPLGZHmbmBwfoWKyvAdll7O+DoDiOg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:sgwF9fJp3L4AUwDVUpiyd9Q4Zh0GR9FWPtAHGMc+C4k=:ITA3OVcNcMjOC4ejeIYmsiFl6yGeCi0trPklszX/v3k=;
X-ME-Sender: <xms:2ELCai2cV2__1Fxr14RP_u_1U3B_VJvhbsCK6DNeC04XqR2qWMvEHg>
    <xme:2ELCakUl0EKlaAW69hb57z6bGWZTjNnagOWRiZQhOryZgpTTEwu06BO2X2BuN0yxb
    Qi5YrJSENMzVulLLMkktzXf2ltqlejwPxm8LTHimRz28xSvRQgZWi8>
X-ME-Received: <xmr:2ELCatvQFsCLtcSHBxFqs5Wb6Z3gkDvLzzZoBQGNPGGA4ZdLyWXDwEZzl4LAVba7m0yjbvp0nDUJIxfALOw>
X-ME-Proxy-Cause: dmFkZTGEuSIb/FcWHjK3MYkrM93FyPS1RQ9Xtbd0J1NdUnSn+NhtL8G6aG4ljq0tgZmAOS
    NeiQk3VzgMLZ4cCu183M3FT7s0INEpjrCeS9qj1ViM3ovl8mdamj3YZuk+ruj4RYrmv6Tz
    Zlzt0s+vvgidwlidQxPfRCNmghtmV4onxaikaG3wnbtS6BExD+mxrSlcxs3p6i4pvb26Ba
    OnR7JKC4qghoHS+TauPbBqfkiFu0wEhPcT25R4wSei0e68xkS7mB0bdX9GZk1DJmbgKHr1
    M1qMW5m6mmjLVt9d1hwfcYkL6rtJhP+TiHlht4l2Tv/NTU6CM8dITD3U/Ea4H0ZbG/pqX9
    RD1Sn60J8E0BqIIoL9T6deRT8fNBY35qufAdNLTGdsS3DiHXnKRdNQQ/oV4UI/kfsaYx1D
    WPwlBA7c2hSCx/rvR9zaxxFEcgJ49FtNoPVgFLzukFmOxb9uhnROnfdul1b+Y3oL2AGEg4
    lCqbx1b/RIdmX8O6sA8+BBv5tFb1hiGnLcHsBD9u/wlxRG3jjpwzFn1IwAltZgfekvgoWV
    VLoXZPoelQKLsfeGr4ENKN4Rt8dghROnOMS5rmSYaq5FH/6JbUt34wWxp+b/WffrIw0cun
    4ZoNZOC3jEn7EoeLjJP0e/YHVhyJ0wacZ7+XnqoOut0/YyK3zIePLIyWP67w
X-ME-Proxy: <xmx:2ELCarWGEToPV8Qa0oAPircw3QrVgJxuYPHF5jlJ7yp0c6fig8A1TA>
    <xmx:2ELCapVBpdBD5-6GaJ1XADCc1h2SVhJ6Odne-Hc_t7ywZsDEsnVC7w>
    <xmx:2ELCalcZqNbQPVINUw2i55Twpfbb7UL076r962gjI42f8wcFxqmF6A>
    <xmx:2ELCag7bnkNG754p1UgWyiozInhyrfOflzVPwxVkHpKvArZsZLHuaA>
    <xmx:2kLCauapzFyEbfLQFxoLiIetFSAy6ZTZEEPeEtM4PfmnkLJWgXb9_27x>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Oct 2026 08:13:08 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	ojeda@kernel.org,
	richard@nod.at
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	david@davidgow.net,
	gary@garyguo.net,
	linux-um@lists.infradead.org,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: arch/um: Fix loading Rust modules
Date: Sun,  4 Oct 2026 21:12:30 +0900
Message-ID: <20261004121230.373216-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Rust modules fail to load on x86_64 UML:

  # insmod rnull_mod.ko
  subarch: rnull_mod: Unknown rela relocation: 9
  insmod: can't insert 'rnull_mod.ko': invalid module format

arch/um/Makefile adds -Crelocation-model=pie to KBUILD_RUSTFLAGS. This
comes after -Crelocation-model=static in the top-level Makefile, so all
Rust code on UML, both built-in code and modules, is built as PIE. In
PIE mode, rustc accesses statics in other crates through the GOT and
emits R_X86_64_GOTPCREL (9) relocations. UML uses the x86 module loader,
and it does not handle them.

Remove the flag. Rust code, both built-in code and modules, then uses
the static relocation model, the same as C code.

Modules still fail to load with a larger mem=, such as mem=512M,
because Rust code uses the small code model while C code uses
-mcmodel=large. This is a separate problem.

Tested with clang 20 and rustc 1.90: vmlinux builds and boots, and
rnull_mod.ko loads with mem=32M.

Reported-by: Zigit Zo <zig@iorw.io>
Link: https://lore.kernel.org/rust-for-linux/62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io/
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/um/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 937639edc295..c4a99073f014 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -62,8 +62,6 @@ KBUILD_CFLAGS += $(CFLAGS) $(CFLAGS-y) -D__arch_um__ \
 	-Din6addr_any=kernel_in6addr_any -Dstrrchr=kernel_strrchr \
 	-D__close_range=kernel__close_range
 
-KBUILD_RUSTFLAGS += -Crelocation-model=pie
-
 KBUILD_AFLAGS += $(ARCH_INCLUDE)
 
 USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \

base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
-- 
2.43.0

