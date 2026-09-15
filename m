Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233445FFA7
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463114; cv=none; b=Yg8uhRwAiQm0s1oujvKJy7WCIboNJOdkymtp9gzcERntid6GxPGYoiBt4GUknJ4NOJzMKt6BIVsuPsq5V//SQM6E7zqBJqc0PBUx3CAY4rm4jvjgCnBuvXP1HbATu9MAELxn9Z/4xGa6n+yFL3kZzx4+bk3TBB5f/MWCS1qC6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463114; c=relaxed/simple;
	bh=wINWkLDSvaASvwcaEXuWAF3ftuB32SUM4N8LFPtrmBQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPy/9gzege5DyQrQWneqc7xUHAel1Zez2c5akF4TA6E/aLqjxyC7MyeTF/xHWTc3kDQPqevL9fKwahCtJwpqaisXjUcFOhQWrEx33S/ejJxrD9i5S1vnaWhrBcbsnsmWDlWPh4KErWb/tuly+BXk6sn+YKlKhAyDgOCnE8o4W64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNMovukV; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNMovukV"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so29167a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463112; x=1790067912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=ZNMovukVRDvYG+IyElYnle3F0CIUZsKf9jINHZRJP8ySiG8AoCdpdY8rar1DVLDWFG
         PJdh8+feh3vv/XuLaWSTYdOKaB1PHJe+OghUrtgRiUTqZv801rpqHfqIXdYjDRFxvDIT
         Ax04CVZBt5dBVWdBZ1Ao7nUlsTcVlKoiQV502icER+oX/3qml/DbKeKdRMEKxRrjpVrj
         sKumIuoL/KhTI0d8Kc478Iao41egZhuyDRagAupH1mVRuN7StNiFlJadLEk3jlwl+1ff
         4mnfTwxms5Ge0YxVB1pYH06+DgK3TMofV8hv32jqIByOG2TGu3nbBrkwt0B1YOodLXsM
         IQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463112; x=1790067912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=1jxwCdV7ZuQZUHUVsajCZO/Q0wV2xi3SqdExRhn4AhVF+N7EaGnJWv8VSC2PQ9Bmjm
         CP2sE8qiN/SAYPbVB909oKE3fgWbJPV1fM97ewTiGOuDNTSzgW6xTxRxeioqcJVjohdr
         /JaOU4mM0Wd1XN97fbTATMZyeuvZqon0iUX9M9bWNotNG1vv1Fzzha+msdhIQFTDlmBc
         3uhkpuh4FBjSicF7hujzqBRR0j5zzAuENxaxF17IO8DhssxhS6wpwJra+ew+Kj8Hhdx3
         AvzCRYcbhFBsfSguKTzp/ScFLXSTMv0Hv1xFXTklxs3/tJd1QgeFnrDF2VS0uAfBNfjZ
         z7Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwQyL0R/dYy6D9bZWUxJoP07hF1uTVYCESGyaoJB55ZmHOwmkYquyziI7oY4PhvpZW/S6t4OcnoAUYpnZ6IZA==@vger.kernel.org
X-Gm-Message-State: AFuF++ksPXRtQxc4X89IdfWRk0QeW7eu4cqihfiyzAjQJtNPkO6ykUY8
	a1D18qsklFtHt2KmsHNHZ2/3RY1j1oE+AVLv7ZlQuwDF8J15S+OiQCpW
X-Gm-Gg: AYBFou3tKaZDDVQLb6vuzUTSzgeY7B0W87+dEQNj0zOeJBHGVgb3EOm8iRj5fHU9cx/
	FZssEAmcrjAFTpCLFL9P60VaUF8tJA2pwV1ERc3AJk8Yk0ovlvJ/ufpztq28j3lOirkLJU12lyh
	m1Q6t4Zi4bCzgttDVUJ70VGNRMOKa+stZ0gO+uOgRleLfxzFpd+8gXX2Hxuoc7HwmXjiNm3fkr+
	aUvU9ftpaaOElmWobiaUvEuiMlQQ/YF+mnR6RuNTAt1zz/JuYWfu45wFXLMXyLFMxZgtT43haGr
	mWmsou7D45HrINDRKx28hxhuxiiCCcTmJ+7RXcDshOAaqXjsrltcvbs0OoIkr6p2xBMy/yhlC+F
	BwgoLMtxoo7Io9apocV/rwsWNHuRpDywGpWOhul/Ai7wejL3ccWOM47W33M0DbSSAsXIJW3bQ4L
	g0EyFT1tZsFzFmA8ZKtQLxc0guJVNNwcdXEv/2DsCVV0Hru9/rVPunsvhxE7alwJpT+XGqz9wE2
	MxPvR/A+FMzVsguFjjEQLAmdK0iB2J1Fn6E1pMe451inpiRiYek
X-Received: by 2002:a05:6a21:920e:b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3dd52a2a52bmr559662637.22.1789463111413;
        Tue, 15 Sep 2026 02:05:11 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:10 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Tue, 15 Sep 2026 14:34:51 +0530
Message-ID: <20260915090453.1227034-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

powerpc currently has no ARCH_WARN_ASM or ARCH_WARN_REACHABLE definitions,
which causes Rust kernel builds on powerpc to fail with a macro expansion
error when the generic Rust WARN() infrastructure tries to call
ARCH_WARN_ASM() through generated_arch_warn_asm.rs.S. Every other
architecture that supports Rust (x86, arm64, s390, riscv) already provides
these definitions. This series brings powerpc into line.

Patch 1 refactors _EMIT_BUG_ENTRY in arch/powerpc/include/asm/bug.h.
The old macro was a positional-operand template that hardcoded the 1b
label reference and embedded .org/.previous directives, making it
impossible to compose as a free string outside an asm operand context.
The refactored version takes explicit (label, file, line, flags) arguments
via string concatenation; .org/.previous are moved to each call site so
BUG_ENTRY() can continue to pass sizeof(struct bug_entry) as an asm
operand while ARCH_WARN_ASM supplies its own size string. With
_EMIT_BUG_ENTRY composable as a plain string, adding ARCH_WARN_ASM and
ARCH_WARN_REACHABLE is then straightforward.

Patch 2 adds five KUnit tests under CONFIG_RUST_BUG_POWERPC_KUNIT_TEST
(depends on PPC && GENERIC_BUG, covering both ppc32 and ppc64) that
verify the __bug_table entry emitted by ARCH_WARN_ASM is correctly
formed. find_bug() is called with the exact virtual address of the twi
instruction, captured at link time via a .dc.a relocation in a
global_asm! block. .dc.a emits a pointer-width word (4 bytes on ppc32,
8 bytes on ppc64); BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust
side so the same test code is correct on both. The five tests check that
the entry is found, carries BUGFLAG_WARNING, records the right source
file and a non-zero line number, and that the trap address lies in
kernel text.

The global_asm! block is split into four cfg-gated variants covering all
combinations of CONFIG_PPC64 x CONFIG_DEBUG_BUGVERBOSE. The split on
CONFIG_DEBUG_BUGVERBOSE is necessary because when it is disabled,
_EMIT_BUG_ENTRY drops the file and line fields from the bug table entry,
leaving the {file} and {line} global_asm! operands unused — which is a
hard compile error in Rust. The split on CONFIG_PPC64 is necessary
because concat!() only accepts literals (not expressions), so .balign
4 vs .balign 8 must be selected statically.

Changelog:
V4 -> V5:
 - Fixed a build error with DEBUG_BUGVERBOSE=n
 - Added a label for bug entry
V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/

V3 -> V4:
 - Fix Label with appending b at end 
 - Add KUnit test patch.
 - Tested on ppc64le pseries:
   pass:5 fail:0 skip:0.
 - Tested on ppc32 QEMU mac99 G4:
   pass:5 fail:0 skip:0.
 - Tested on ppc64le QEMU pseries:
   pass:5 fail:0 skip:0.
V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com

V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
- commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust
    support
  rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table
    emission

 arch/powerpc/include/asm/bug.h |  36 ++++---
 rust/kernel/Kconfig.test       |  13 +++
 rust/kernel/bug.rs             | 222 +++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+), 16 deletions(-)

-- 
2.55.0
