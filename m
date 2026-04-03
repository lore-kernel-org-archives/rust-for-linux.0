Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883A2248A5
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228035; cv=none; b=nbGib2A3dyP99gl3lqHoFhxyj/QNJL8+QqJuh01eSK0WGXwlusJYbBnRy7smKrM6n0qrKOXv6EXaNuz+SJ6bzeFcjMv7m8xoDui6IJrzirkC3kCPF6XyzeQMj/MyNWELYsD2UCBz2lQndzE7hhoSKG9jtF9LlbSZencHL2k8a8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228035; c=relaxed/simple;
	bh=gAH5/sosVHs04ukM5lyiU/gDdyJ8q4IPrDsf9t768/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GfR5F4yaMWGa15/r5Ja6LlCFNppXApm/8QRc//Z8U+hWpv5k2M4QMJ9i9DLXBzMvqZx84wTYfXEBgE+96/Q5PEIHCITfv7L9wjEfvxCIz4UnHjgWXXvE+mg9CW3733WsAHD22u5vGz73/S2qYavVb7BGVKiSLFdkXJLxDaKuhRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECqK1S3t; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECqK1S3t"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1459795b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228032; x=1775832832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk/c1eJYvsg8D8dqxhQYhJf46vVg1VoFShzT3q2jtfA=;
        b=ECqK1S3tfqmVd3uyAnjMTZKqK/c1Ww/9d6gEgKtrcmSf3KtVIcY8JYZ5nvSZI1cApG
         T5ORYYrTZ/s9lRr/Y0otSoNmbr9ZoP080BvbdRUgXkeqqMhe99muOk9d+BEKUHhUoW03
         FcId0qozZbcEPk0d/CWpPNY0puj4UJCSfFz7KTma21/e/eNIdDQVC3MCJl/2HleLHeBd
         sUzim2N63oWv02WiCvC38a24ZL3wMehcyHPxtPuAb78sNfI1HTedWP0icduLhxNeYrTT
         uZ7cWAtZwvxuImjlQ2CQKksf+JCtXas1+mqYmp3ABuXzomOcHri1MKWWcxlcGrGkCl3x
         n8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228032; x=1775832832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mk/c1eJYvsg8D8dqxhQYhJf46vVg1VoFShzT3q2jtfA=;
        b=anf4U8Z47MNR8OrYJRHNQrhOlozEitEYVMUCKXyFb09iheP+AhHNk75DwO6NsO0YvE
         u+1lql1ax/SypktEQKvIamjy6X5oZlgc47ThajdwpN6cwmgbtRpeYD2wQPKJ7HxnbV3J
         63igOXn0FEMgbar456611gN+S8g/dghBQxgXx6XVDiZIwcWtWLjRq1tSoPEaGe66r1EH
         NHFXoXvsHPVTjTx1YPGxNC1U3hPooev/RG7KG6AakHX2/0t9b8C7rbYTD2L1gmp1wHil
         M0iXcPBmmFdQMN+3ck6FH+eFBdYnX51zhGF3n12UF8h90cnrQqfe5fV3Q5UjqLeAQ6fn
         b9RA==
X-Forwarded-Encrypted: i=1; AJvYcCWofEIR8cer7iEX8kEH34UT4NfdCxVOxXXkEAl6iu/9jwsUIT+iA71oOmSC2ct2ni8Ld2hO+F/VowrWEW0KKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0c1Ig6oLrji7c5wsJMYRl3nbmODjC0Cd5jtUZqdkzFCBDjOVf
	t8xP8KwgPp7h4VWc+XkXWOy64S2j+mtqd/o80DMT7f6u76YpIsw4jsy7
X-Gm-Gg: AeBDiesYMP7mkSxTU4AbbBSdG6p+d+89xvcTePvzqmx7usEeKbb3kawkMp+lQNCrXMm
	O8yQr2fPR7X6docGMADzyVj5iuJWMBs6xOPKY87nw1/c6/IFdx6MAw6byATjWRAUengb8BjjWCZ
	ND3mNPls/cnxf0BvHETdB+jFwfHwXujBTs7COqPqravH3RKPyuiHOrTlLwycrZsEFw/GgZ56lIg
	IcwGWB947mlKMRS6P+6bu3YJeAPAMT9jHS+gewsio3H3/v/A4P4ru6QrrL4rzOjWvovRBTnF8fb
	cu9VadkOkdBfkqs1dl/Eojtd4JQ0vjiq4Givk2EiAuV9hkuyshTSQs+/nxD1WcxQmqBtpZsQyjD
	igzA1yUw6f6nv7TliJjealilsdWffHcPV2RvFeqpJZnyVkYC+DOW8AP2BoAiEAu9FmlaC+eTDrS
	YhU4lM9so0vt5KPk8UqL8AS8NOgwgD/j7H3ht8kN8ty11RnmpNTNCSaL6AQ3RwQqt11iUOuX0Fj
	3Q=
X-Received: by 2002:a05:6a00:f93:b0:824:a635:4181 with SMTP id d2e1a72fcca58-82d0da84bafmr3123650b3a.15.1775228031997;
        Fri, 03 Apr 2026 07:53:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:51 -0700 (PDT)
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
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V8 3/4] rust: Add PowerPC support
Date: Fri,  3 Apr 2026 20:23:07 +0530
Message-ID: <20260403145308.1042622-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 10240cb80904..1246b3add8ff 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..589613eaa5dc 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 762bddc868e4..d05e76df15a8 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -413,13 +413,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

