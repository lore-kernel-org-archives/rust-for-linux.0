Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D723750CF
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607561; cv=none; b=JwVGjp95sbhEJ1fj77cw5KphS8qoCCJmv+iMCX7UzHt1NK0wD95GStZkErpQsD3VykomMcA19FYupkDEI7eIKCKe9gQncQDvHKHnzfhBB6i9LWSvyh8owO8CBjrGrj2KClPpqgswLo3pUSxVocnvVeKkskz6Whk+VMklTm4gpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607561; c=relaxed/simple;
	bh=6GSGT8vDPiYQI4YGHLluie648X2Cni+IOPr/N/E3cXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmkcc4n10zDJFct7Uq11qlFuRpCdTCmZnk29G5y6utfljtG8MiNGJJa+ywCdDEmwARwxb2zkh8olx+J+/kpSn5wVr8kXMyV7CeqqIHAo1g4tjPUbSCz+xKmO9rAfW/uaRnCa+BG3SxOZdgxW1ZY0ZCrSuRqs8ZZBhXose4eOeAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIk/qiH+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIk/qiH+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso1123790b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607560; x=1777212360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=CIk/qiH+TtF0CDrdlL6GN5tZFW+JfcNKbAMOrgExu4gssLHfpm7rGJ2VwZ+X+PHCeB
         o+jI+q8/0UXQDbsVLK76hgydBOHvPBv4GyJSUzwTLBM6SPbLEXr1GH3nsMBHcRxgBZSz
         mtVjmqrUtYE2IPCDZw8bn50a7o0tZHI2DIG/ZF99xTU/nyizP2E99EzgeKAGp+LCcqGi
         TibV+NbWOjGeunHYdErng2shKrbwh86K0IuFv1axiErhSMuCY9OAMBMf9c5OCyGE0IiJ
         v9K9BNx7IVx+369r71PiVOmrIzs1dT46Z+j6K0msJVksbD2zmqnoJpypeyIdbZyN0BXI
         LTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607560; x=1777212360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=lrMr19yYaF5j0XMml/MWogHmJF9TXz+ZwrpphsYGjWDLD9gS/Pbo3o3n3FoT+IX84y
         BZbwq3z4R/Ok8Z3F0qN1YpmaV7wg5clwu95vMXldz/7Qs6By72Nk479pnKkPWSlURogi
         0t0NodPOb3arMenOCNuPPnx/qL7SpxtQdBn1T5Xz0RNmJ9Gi5IGgt72JQlFJUdpthSku
         0HDxPIaOVWgkrpzjkSMKxPITB/mbrBUESxDWtpdjaYE5N+qJMyazhGnr0/0Ng/mps8Td
         BADAebu5qswwW3BLnhPF/EPNSyzxOwK71oK8BnqQGGpFKAaygM7R5pYKfduXa7wmI6Av
         JwEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NIRyu8p5pWhGLFTG3jW7Iubr2swJVgGkGWpBZmuXdRa46oLnqjugifu/S5SZU9RoTb/A4Fu1fH30+BfR28A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3GsWgr6nG+RfLnms1rGIZkwcyMeRUX724UieIxTp3zNWvJRV
	NdDqsNPK2vGunVklaUBeeeCalkIKGh0LtR5VweHVrrYkoG03S/SuoXDT
X-Gm-Gg: AeBDieuIrjXNyQxRzVzE1a5CaSPy32eRZaYqZ+qJzSROuRRTwAAlml0JQrVYq9FBAnz
	NIKRp5YBeQwvCQBLOGku2TklFxfV+NwVnD+sc2xCveZN//S2Ac2zI+u6csmxj5uK+Vfm2FHF2TY
	qFyNkApAJNhkXNrlf+zfuJwzG4vUgujMO1FoAc5lMGqbc6atCGF6LnL96wgnitSnKD7U+PWwc/i
	Z93rjuFPP20EXhhURpMeFuvgCJUaWG6njwgxF0hRJ6xGrQd/kiq7KInVnaUmTM+/oZ1rac0zqJj
	snmjhMxfcqVcX9BeWOx315BYm23t6JAebgxmw2wUaUC9cjWpy3oriDBC5uA1K8wrbbsGgksRrF4
	rnDiCzEakORAZIE/JnEkv0YQ+tQmkO/n9pJcIz67Tx7lj9QZR2u5EzZgZi27XyRiVMx2flVOfd7
	OONSKteRYv4J6sdAiWHWEUs6R/3A==
X-Received: by 2002:a05:6a00:91d6:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-82f9985d570mr6233840b3a.24.1776607559756;
        Sun, 19 Apr 2026 07:05:59 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:05:59 -0700 (PDT)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 0/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Sun, 19 Apr 2026 23:05:52 +0900
Message-ID: <cover.1776607331.git.mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
References: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series bounds the `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround
in `rust/Makefile` to the compiler versions that are actually affected by
the rustdoc (#144521, fixed in 1.90.0) and doctests (#146465, fixed in
1.92.0) target-modifier bugs, so that ABI compatibility checks run again
on newer toolchains.

Changes since v5 [1] [2]:
 - Patch 1/2 is v5 1/2 renamed from `rustc-max-version` to
   `rustc-lt-version` per Miguel's plan to rename on apply [3] and to
   avoid the `99` form. Nathan's [4] and Nicolas' [5] Acked-bys from
   v5 1/2 are carried over as Miguel indicated they would be preserved
   through the rename.
 - Patch 2/2 reworks v5 2/2 to fix the doctests case that Miguel
   pointed out [6]: the v5 form reused `$(rustdoc_modifiers_workaround)`
   as a prefix, so on rustc >= 1.91 the doctests variable expanded to
   a stray `,sanitizer`. Use Miguel's suggested explicit
   `ifeq`/`else ifeq` layout with `rustc-min-version` +
   `rustc-lt-version` combined inline, so each affected range is
   visible on its own line.

The `rustc-version-range` macro Miguel mentioned as an "improvement on
top" [3] is intentionally left out of this series; I will send it as a
separate follow-up patch once this lands, as Miguel suggested.

Tested by building `make rustdoc` and `make rusttest` on rustc 1.93.0:
both succeed with the workaround disabled (empty expansion), confirming
the bugs really are fixed in 1.92+ and no regressions are introduced.
Macro expansion was also spot-checked across simulated rustc versions
1.87 through 1.93 to verify each range matches the expected flag value.

[1] https://lore.kernel.org/rust-for-linux/20260205131522.2942928-1-mlksvender@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260205131815.2943152-2-mlksvender@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com/
[4] https://lore.kernel.org/rust-for-linux/20260203221224.GA2703490@ax162/
[5] https://lore.kernel.org/rust-for-linux/aYS9bRugxr1rUvA3@levanger/
[6] https://lore.kernel.org/rust-for-linux/CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com/

HeeSu Kim (2):
  kbuild: add rustc-lt-version macro
  rust: Makefile: bound rustdoc workaround to affected versions

 rust/Makefile             | 18 ++++++++++++------
 scripts/Makefile.compiler |  4 ++++
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.52.0

