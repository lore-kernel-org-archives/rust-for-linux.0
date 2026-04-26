Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5024926ED45
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193938; cv=none; b=pLwHT8R6YNiytNVQIqNkjlozHSc24S2tdj2XImESxSsynEjO4POEBAOWiIAJM66pBOnQs4Rf09u8HoJ4NL/N9BDnDlFqZRESTJVUJ7yAyGwTax7kb0cVe7IvIG1BklYQSwgFNMeVzK6U9E2fmQwQ8LgtzPuTs8siG6nQ3/HB+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193938; c=relaxed/simple;
	bh=WhlwkXNuyZCQ6C5N8eUhev/OuBv5UthRFAKgfmLfnq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppwYHyCZ1k0Koi7ukUNZPJRIXeqLCHtbHaxVCNJLyVe8wNtfL7C58exgpB6VX2QutWZwtDfelu7pQTubJBFX1lERpTULIJKSSkR7sADnaBObR6G5BLHQGBGpTc0kdSDlt3LQPEfp/AKIP2LcYH3CtI73QgsPkTpmiva1DTtrOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4JcW8nk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4JcW8nk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so6010830a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193937; x=1777798737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMHiysWjfyDRuRD5lpg8f9BCP2bUjUGrNK0xtp2jPK8=;
        b=G4JcW8nka/IIe6TLkx8SZgKpDb4hObHrq4l71i4ZY5vBKqlAinmeJefOjLPI9TlfvC
         U56Dnih9fuwvFN9RvmEhAvRflGT9Y4zN38Klyrei7sHwF1aAKgL/ALgGAw0rHBChUPHG
         bjQ9s8nvC5HKwEnodSAxwVam9fWQzJHzln0Fz0X7QVplDQXxgkz+eR96vmOYivqhL82K
         4MMUgQRIF4qJcnokES6l5F1xYNKuBJyvOwxHEsMhElbRivsewQbEub/gv+Di7FItiyFX
         TvuzCMfhq37odOpVZNbXIXxqaMVzzr8cwy/rmD4Bw71KI+NkgvAw0bpCEhiPIx1PYVir
         oI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193937; x=1777798737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMHiysWjfyDRuRD5lpg8f9BCP2bUjUGrNK0xtp2jPK8=;
        b=RCHQaWt18bG4L3rL/Keelem5XrBWyplZxaMnLzl4gWwP0eAF+BS3Cst6nd8OJp1DQb
         85QacOz3ZE9aoLm9yqcFasgIAsxuH6qMhbEp2ZHS9Qy5Ia+/kDr9MQmVsoqv/LhkLKpA
         JA3ePoJ/ayWh4e4RRG/bcLlzsjefzt7ju76YaD/02xVHwi7wsdKd4Wk6GlY3Pa7tI363
         ZnOU4hV/K9r7TpGw97KKOkIUhcTn/HKTrAzn5s4abzsEiUPcomjiA+W5JVuY6dR2GBoq
         NVSF5Wy9uuK9Zc+A90ep9wAcsvvlvCeZ3OTiBIqmlvSBT3qQ01nQ7pIRhHsCiw+If7ZO
         4uVg==
X-Forwarded-Encrypted: i=1; AFNElJ+0bxl2f4w4SrwjNaB+uV9AMBlrXSpaLefaAMyc3uXhaIK9td4GY9haG13dBC2Ldqq/VGCTNZHCGNYz59/xuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhkTzXU4o+8sWitbna55o4hTM1XTCq+mnozXNApf7QifIQifbW
	2UJhe6mhQSIJ2L7hxOTXGNs+KUuw7xjJW0EElADZdfTvuuyuG2l5NObO
X-Gm-Gg: AeBDieuaEFn53TI9Rz+9GAV9ngzyocGlOI2YPJQ4U3uIQ5iubatKuOXdNIQzdszpn1K
	TgjHANY3EX0FuoMJ0tfVnRzABh3Debl4RovsaYoMwdRAfiH65KRYwzvIjWJD/VGdR/GG66Hc+ho
	7iMY2NIOpWN+MZh9sMUo8S0heM61J45ubZUOqVsaqrQTAq/zK4ltcouLBbHyp+pyLb+vXtWitwf
	FU0ywO+7r2WkmSCQHwhezFZ7XHn3KJsvnU78P6rlu3jyBsngO2rvDbf2co/g8qqdGoM/i5QY6zK
	nbpvZxDFaAHB3SLp0kvmwy1hfxSyoMKyRqIAIPNlaQWpMXCoCFAIB70r5WAZetWsibpAylcjAeG
	uDS08PxlQWudcTkPEhXUo2FrC3BMuUlvNzvXJj6e04YFM61jh5MMD7ucVJOjJnvxeWDpjiiXz/+
	lddrpe5LP2vnaN3GkxWAP/WHL2rtmpC5SnByWdjPJ1eg3AYyW7ZJeEdozktiJZRZmgBDAD2qT/r
	3GGP595/Mxnpss=
X-Received: by 2002:a17:90b:1809:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-361404a8241mr39217733a91.25.1777193936535;
        Sun, 26 Apr 2026 01:58:56 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:56 -0700 (PDT)
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
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V14 6/7] rust: Add PowerPC support
Date: Sun, 26 Apr 2026 14:27:24 +0530
Message-ID: <20260426085725.2090827-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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
Acked-by: Gary Guo <gary@garyguo.net>
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
index 9aa18cff2fae..03926a451bac 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -399,13 +399,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

