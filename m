Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29493A2549
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773440; cv=none; b=SRVM3GOUm/9yUvWlK+EfUfWbwYPFi1TSwxlu50ayBkEkXfsd6G2vCf7PUw22K7Os61BlcfGG+cN0/AcajozQ55kgJIb5f0voh+aeqJEBcJcnlwEti1T3s+BlGsbsTLlzQrltrMlpnkXTouniOhvGIoGLsEZ/lGBi3y0se9BVI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773440; c=relaxed/simple;
	bh=hGgphpE1DYmiUm/7ovOlTVs3V0qJFy1Wl3p3E1Kd9FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCtUCYsdAiJ7m5j4SES4xqWYzbIA1hfeqA7z3kXHY/Sn/AxFmwNxf60iL4pqIlOq3h7W8U4VABPBcho4RDDEF8Cjs//XjGMSlpbtIk2lEFu4mgZoxEOVlrAD+x1Z1VpEP9IV7rFByKq/xgPWlwBA23e91kFAJhZ3gPsEKk+bdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJzbJALT; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJzbJALT"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c79662668bbso1510846a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773437; x=1777378237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BeysMzI6zwGD6joEXhhGssagLKkCvhT6RVRv5CKQ4U=;
        b=XJzbJALTGkjeGs2TdeeH3TR5P901WQEesPFA8Sg+iuwg6ITH8aDxR90n9Zxdo1qS91
         eM2PVY9o9r7l/VkhqBtcnepN0Gxx23OXx7Lhb6Ual9oGe8CrxXQwtybbZi0sKm2kj0Dh
         F9zEcIofywqjLnidtrR3gc+WK+ZvI52ZEF9wk8uJ4a/7k002r1Tj0VaaS3OARTpNAnZp
         rsy1xCBTv/hiScyNompBpb7CK1E/JjLgnyKitLxtp6NNGTFLMBx3qcoxVdm3fV37ZauF
         jEIUt8cIuVFhne1N5RjW9iLuQL+b3P+ulUFDipNw5zuyNEsHBSeJQoEKKdgWzIETbd9v
         ee9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773437; x=1777378237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BeysMzI6zwGD6joEXhhGssagLKkCvhT6RVRv5CKQ4U=;
        b=UsVP4OKyKnOh1iiOFNZaJmPLIRgxWqORISzc5aOwQMxVFvsvGo7hXsk/0ecHPuX107
         /tdIAyTgFCeTG0eCZtqaV3yniy8o/Y8SV7wzgNnK/eqmGeAbre+i5w2Y5hbLHwvuZ1Ej
         Ew1pM7TQrCP7KIJ5rF3ab0iNSXNDqzg9iMS8/7pkjXk06zNCFjXJ2znkPNytp9OSJOBG
         hqgGXYefSxRHyd+ihQlmrfreB9Vzv1rCS4FEnh53uGniOlSlZkd4hdVba5sqbwjic/qm
         kFHdTxLepsohcu2WE/CFJ4Zj8HbiE6AjTKzWZAfZYJMgZcL/OhKXynyTHPCZe6QafoWz
         INyw==
X-Forwarded-Encrypted: i=1; AFNElJ+X5yoQmnvj6yopYmV8f72EXjjvnegDBTStRtYKcRGbF49lCWUdjtcKt34OsgwiiQMbRZJHOIHOPBmFFUjYZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7yyqjn257MOKkOyI9eL03uIjoKAbVCI1rAcdgNJSXEWtza5Hb
	sAmrfMSUd90p8ljqeudQkVD8oCjtJmFZTsJnQ2L+chOL3MC4dPjtJpaz
X-Gm-Gg: AeBDiesZdVYahdLcqfcQKm1u5ZLBpW/X8IwtnkCpbU6c+PrHdRiTgMCgVtdLjokd5hd
	hX+Mp2bRzyCUS3WE0/j68U1ghFE8W/3dtPkq+OJfA6OwB4SBQ3DNS9WmMP2rsIskSTxni1WIEQN
	/rqa1Trt86pbaDVmS1RP0I/FjCqOaKSD8EusOuEs9XDzx3g5m54Z5aKefAZajJj0y1kyIP/k4EN
	NEtBDjfnEHSkUK/EP4VNISMnr6u2d/cRQLeuztWUCZ+WYTYoA0ibWaXdQBfjrkr0tpCyhPGAEkk
	QtCKWF5pp8sP5NYznoeueOLzICy4g4vDti2MuqKHBjYkqND4ieW/eOajZ1CP4n7GB2gTc7vSO+/
	5uSqQg+qAD82qM1imAbUMwRvN1kdmQ2wIlDMc93WVHauywvpliUdiRbfIFmdxVT+/92Yt5W3i0R
	sK0o4NOUmS7lAziP4Ym/jn3OGFLVTrzQptbtJdZCN3SRVVW1ifPi8bEhuqtdaIKrqnzEjp1AI37
	lpreHb5H1NHydc=
X-Received: by 2002:a05:6a20:e211:b0:39c:783:e42b with SMTP id adf61e73a8af0-3a08d6eee6fmr19057917637.21.1776773436940;
        Tue, 21 Apr 2026 05:10:36 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:36 -0700 (PDT)
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
Subject: [PATCH V12 3/4] rust: Add PowerPC support
Date: Tue, 21 Apr 2026 17:39:57 +0530
Message-ID: <20260421120958.190430-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421120958.190430-1-mkchauras@gmail.com>
References: <20260421120958.190430-1-mkchauras@gmail.com>
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
index e93df95b79e7..4ac897b650d4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
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
index 2a5428a5503d..c90811a2f564 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

