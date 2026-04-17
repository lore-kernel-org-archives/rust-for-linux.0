Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26742C9D
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439437; cv=none; b=laMzeYbCBzn74pqa+0ulhOkM67lOGpq9r2z34ksn7si1PJkC+Jk8U2x8hU3m9vXXSMV98RqucVzZbnMXTX4gc8wXSHYnxCVGlivhx2JHvx8FaDttrPp7Bz1LlboslK7Ge3ZU5xGuG9rO/OXrUz63LMdwEQYxPwwFo0926H9xRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439437; c=relaxed/simple;
	bh=pYf+H/saGpsBMW8EFfQgaezWo01ragM5sMbBA4ndTm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=adEI7UcWYsEaskRjfa0cMvrSN6PqKmStLSu/sKqamCMOhjwbo2Jhp/b0wtRU7qTuTzaMnw1jis326mfjaJ76nIcdYj0Vb7H1WvauZTyCQZPm3fkZUA7ex38N3EVxfBLtN7gk+CFsD4pfU64NLyF0hZCKzWjnpTdXB2WiyXTMkek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhhsbqFN; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhhsbqFN"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so359419b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439435; x=1777044235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww02/jkdVLSyp8HOStmgEIcppt5LBeLhIRfQtuTFtSY=;
        b=EhhsbqFNIFHbTGyusyCpLuG5uRbZgt8Ntan+nPEj9jBfPhSdn1mzPAbcaNX9YPXzwG
         gKa+LBHWpwedp2cp+e++7ImHdaCt6Trwq3D93b5N1e+vtlq/hd1x0h0zIkVxuZ/P4L54
         4D/QFqQikhVbMZLHqxBIKNd7FqETm7OCGsH3s8+S27F0a67/9ZZnhcQRkCHgIIfvS1ns
         yw9R4EriPmS7tpdEdUG4uE7/DuXDYVB3ZFUP1OP5FnTsItTgo2Ow23/iIKNmqZBouyMg
         k94WODlcgD1puvTGHr8UwKjQrkwVOkuPxbBOAbsO1MlmK7oB/2AwKWw4siyrGq0+Qd+o
         U97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439435; x=1777044235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ww02/jkdVLSyp8HOStmgEIcppt5LBeLhIRfQtuTFtSY=;
        b=Ld4LCezDgydrlUxyl5aMJw1d1G5amLdgulHaVi8Qh6/mBQw/0LeogxAAJpEdp4Z9C/
         ScRFk/6JcaQdQqNi7qgFcg4IG5VsakJitTY+60ajuGJmx+hLLXWAcc2cwZqjBEhnNTLU
         5WbT45p8kJRMfdA9XB27zg+p50EUsT4o27Ub3WC2AT8E0Tw3q7HpMZW8mBAU/oAhuwft
         JCy9hpA3Tm6GG+ft5mu2Yins9YHdKiu48DckI5PbY4b4NwO6Q6jsJZURm83jtwtQTro7
         ykr2tGVkqOrwnGcNulO8qgsuv1Acns7obczqk5LBHzdZkMz9ZEFRfNvC/JlGBDDywoF3
         95ZA==
X-Forwarded-Encrypted: i=1; AFNElJ95ppzRYovJY7Q7qIvCBGOsOwLeTabWcfRL1sP7z4e1JfntwBryGbBNTiaVNGOEi04VOxU4xN9KeLSc8OSt4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfM1zxrMWHNfszNkZODNO4z9U7wcgfMV6blN4qD9PEzUbVGmWr
	MIpsO+OOXGZLF11TCw+67fGqWkX1b8/f70ntIs1pGNjGlvO2rTeZc/S4
X-Gm-Gg: AeBDieuWNxAoxHUUYv4xa77daylF1MdQq2h+11ZDE0yw6mTq2vciKN9IPm1fj4923kk
	9yQRhhocHpofkxHda4zQcmQ8omj27VD5kBNeNOskSyIdvbg7gRH4iGpgsNnQkewLOJkrQKLEQfy
	ZCV2dj+5Lv7iNoLWg8XmpzBQyArU0NYme4R2JWWBuZQMq7Rro32zQPL/kvWxDuPTnJCaW40Mz36
	zS1wuTKT12JytBoS2p1JXB4uUuX/2UDVs1dJ6ZblT1gpTg1nMksUCjDy6WHldaKzeKsAHeyQh2t
	vSFl+4j9R0o9i8Jz3b5OwhwMAXoajALBUi8zjGRV7A3oFnFjTU63hrLzpswNL8q/O6QNYaqgHT7
	ZpviyGojPHml1KlwnLRH/hwEc7MnVfblG4LLQkQbN5lhQHjLrBic57WGi71ikCsz1tEMUCVR4U1
	jYTqNPEM8xkYMhvQr/tRILMJXtGktHoreiKRofwRBblHZYLg6Pz/ruCo5oNMc0Wgusd8uHpImfo
	MrW5YnfceOjDsM=
X-Received: by 2002:a05:6a00:a883:b0:82c:e09b:3f76 with SMTP id d2e1a72fcca58-82f8c9b6728mr3532095b3a.41.1776439435073;
        Fri, 17 Apr 2026 08:23:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:23:54 -0700 (PDT)
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
Subject: [PATCH V11 3/4] rust: Add PowerPC support
Date: Fri, 17 Apr 2026 20:52:52 +0530
Message-ID: <20260417152253.2312961-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417152253.2312961-1-mkchauras@gmail.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
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
index e234b8a39358..af0c8ab2e5b6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -406,13 +406,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

