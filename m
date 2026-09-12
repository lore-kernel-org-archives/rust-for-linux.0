Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5238E37B41E
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Sep 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196362; cv=none; b=TGrdsoFKvclO//c4UUte6okDwL62NXnyAdG6obYjhi9Uhd1h0cW+ciLzy1/GjkdVjU+Sul0id0kp0yQcblpzwOeLiHMnNEyR8jfxsBhPWA1VvFxo1U6adf4CavuImVcZGdtt0LgW2vQtMgpUvuq7hPy0EPmYjwsSq5FuTi8BLEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196362; c=relaxed/simple;
	bh=k5hpwsx+B1BmldwynOEu3ZO95bo2YrG+JYXgr8Zs1C0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aWhGE3IN5V2r3MIWwGvmH4sBSmD8mTIw//IObmxyfdjg8VZYGXPyQmN9EiJRCcPVcAdf8K5YrOI0rRu5DEvthr5jyYGt+zgUIiZvDFZeBLEn4GOTWfm96PUQaP16Z0UtD4cOMcQTrxYCYDA2h1mjyfVo0+A2YRwKZIeq+r5Gzgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz6clbIz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz6clbIz"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2419125a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196359; x=1789801159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=Gz6clbIzGGspqqlV1pC9TEl6pyF1NIwkLQ1PC/5va3Dcbz13hRp4+tkefkcnYa4oXL
         wzKIM4RxJbz8CG68cqAvMUNl6JtmOoEitYP7xSYDVgXlR3bby18YtLAZtiuBEFhRXo2N
         Z4NxhBXgftTjS/iRhaScAmzXpEL9U0dpqUPA4T/0CbGwIWRkbALiy6b3FdZ9ryrIoxz9
         s8hGjNBMeQ7fUFyd9emecrEld4oqAHiAyC6x2LaLrPsY4JZDTGu4YOccCkVzhtI7x0i4
         FeMtxQLFcA79WwI0iSc8YQwx1Qhcc91Giw0nDcNc48UacFeauU45pMGzJOEFajL3CPf7
         DDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196359; x=1789801159;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=NDbAseUTwHm2gw80vbT0l/rD96E58tAs8cBkY5y8vK7irSDSm6Rf2MTx+0Wry0LJ2r
         gBEieFgyzc39dsPf8+j/2Ll5Cm2et8e896hsLw3ZMsT5Bdh3rihCI/d+HQHI7fwRFTub
         fp4Nq1UPZsRLfMim+Hqg0c3CS6/TWFAGhHuUD+oQi89xbZeO1Hxf6eYmnyTuuBRky7+r
         2p+2zQF0Vh+xag7ZSQOMP3urEXIszGoFEe+TzVRtOIILjOxtsnrqi56gE4VKkUS+4frO
         7xPcrC96ErfNxY3kOrt3bVN5gShYNHD9jyDhOLkOImcO4He+YzW2pXmHnb+Dh9zRxufx
         ro1Q==
X-Forwarded-Encrypted: i=1; AKwUvBybZDd1nD2uzWqDBFnXqgmMQG6E75s7JXanmR4MJp7jYMbVjXD3WVGAjujnZi/9O8zTaBf1Ll41uzvoiC21SQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kVNzROMeGPXISen7fWXhq+Ct7n12tubY4wk6ZEw7uEIvF30mj6
	tUaVHy7SnwtRqm6vVUGlMCqAvdnBlXbz3x79TEPgHT+5jkv0KfU98/3O
X-Gm-Gg: AYBFou32VlPLM4ggZP2KhneerC46mPxuUK2iroNJkZIFwTp+y5UQ8zydq13tcExA3Kq
	5EwFvYp9427fUr0bs7Pyc1bBQEQ73a26ppTTynQrXRrq3pBwQPF40LXAxlA1bsBN2j+sNdnbsC3
	ExpFRzCi7jdmfGBhoYXabMKRoGs5I5qkYCRTUIrA1pVRlk+joRXmrNcmRlxI3xJYXCfgi+AYens
	vXrcZHenEAFOOfBCphstk7cJILSOwOjAIHqfVP3b3/N9Wj3BOWdJZ1ngrkikriQA9sPuiQnion+
	xuiW0gfkZk0GdwTUl0BjRFvQNq908Rl2Nsb2W/pshvwUCLoz1YOxbtSKZZfcHkREAZPO/IpuCs+
	6e5cgjwcrKI6v3WM+0gD1NVXfqIlLHOAwQrYMqGivFTUxXCSDCMr2587fcWgpaJDHtB+FBJPv5Z
	TvXxvWY6l1sWCerK/bMW5/4zg8ki+vtEARMi4qBuz6GQh2iG5Fnvf+RPwsxNLjRr9e6DLeMD4OE
	1k7RWDSSBvnfk7Xibswjrxgdlv/7G4GTYJkePKfEZxKWQ==
X-Received: by 2002:a17:90b:2d82:b0:39d:6c95:7e4 with SMTP id 98e67ed59e1d1-39d77d205f7mr15936166a91.31.1789196359477;
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
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
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Sat, 12 Sep 2026 12:29:00 +0530
Message-ID: <20260912065902.24017-1-mkchauras@gmail.com>
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

Changelog:
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
 rust/kernel/bug.rs             | 171 +++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 16 deletions(-)

-- 
2.55.0
