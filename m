Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86253C3BF2
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228044; cv=none; b=YO0UXHmoPZwJLqOa5s/F8kS0N+QkNBgmv+bCxlHxhhVA0hKnhYhx69uI1WaN5H043hAdtaK/SUiG6ztpnK9l66I7NkZleI74zDvyK/q1ykZ47ACKJfa7LNKxEkmRmjmv6wGSizG2dfw67r1tONFZv+zpu+QGIjGSH4cVgPZR3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228044; c=relaxed/simple;
	bh=NGYv3H0EXTwhJvQQa1DncgXYejzSc622oLZjrI5r7nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVZzDSgQY8eRF7MLjCKRXmKkx+YNhqJCQqh0ykI1OrHS5Dpo2nT5jwM6WXq60nNkjO2B/JOm6Zn2rUvVLvsBTVOFIxhOeMnVxz1h51o8pqGO+rTCz553uepF1S5ebSG54t74YzSozIflciCCXsdYU3dpoHLzNVtoTceoLmkiu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBKy54Dn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBKy54Dn"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c766a95a72dso1172079a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228042; x=1775832842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5MnNEuF4jTrufZ1xjxpgz9Hp8B6c1d2sPYeGOGoVeo=;
        b=OBKy54DnLFCls2YqSEwGHFIGw+3UH7f7RVQBPwayHrU9fezLjDAFgJropWOcpgxKpE
         SRUoF1R9NqU3PVd6JlcFDnncH9Rz/nUgup763RiXJyOkY7ezi6Hz9k2HZi/tNQuaehMR
         3vJTcPkWuuz99ISKGP+PSIewbU4kAMS+t5KKytA8Eyqg8tY8LCyAC2D2ofD+ksVqdkHM
         zHy74RRgV3j+p1TQmrZODUdFC/EqZiZ3D8EL6F95Pb3xabzyhMHnMnEBwonV+jdZAU1j
         3NCuBEy+QlzHilFjU55ix8tCQST/cruM8k59jFshxyqa3/IzN/Ytspsvrauv/xkB2SPr
         gPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228042; x=1775832842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5MnNEuF4jTrufZ1xjxpgz9Hp8B6c1d2sPYeGOGoVeo=;
        b=R4cZAMJOws7iQj6QsbseO5tRW2rV+pThpScLniVbjxrP+vcHxI6UEK0wxugS+0vsjz
         +VZGUapAk8XwgcnV0eQ5KX2AF975UdvEw0scnwS4QnFF6awhSq3x8apu8/k69tj8jk/B
         xmKoRzxeNzR8Xf+ut+ZfWsXR1FE3kLKklu0d1VdOA/u9FQBmpqDki/OdQkzrlb7Awkj0
         T1c9waWyzIbUFkpX2jvb/N2vSwADHSETpOY7MplmC7grBloIpzbOQuuvHCbcUpCdgZra
         LSInj4Lzh3cdcF50TMVsKccQvLSNPjfFRSS9OYGW/nhQWdPnoTL1CjM0pgpRLFp4H4iE
         v+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWDhnFbsSK9X8qceV9293Ysl+MXs3RK+Vb09sDNzkJ/MH7mYjkAFmK7BN6aTGbr2zIbgWS2S4i4+IpKYGMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx35IoVn7qfpSALkbMAeFFsUrPY0wOqb9dLrrksnX65fIFLsFbc
	lPtCU/rPeXcEDSP9vDhOBtDkvr17Uz10rmDjFHqeA3/izp/bTlwY/Yn+
X-Gm-Gg: ATEYQzwlM4nXF9l/zB1QvVbGNcn2HKzGm6u0NXFoan9X0dZy4Wd74P2e0+xIhxwfeZ1
	NLNtrP+hfzDeafTC3ngFJM6KFCHvORTRutqK9CBDCBBSbglV4A8evTbJPBpp3y54+3JfkPRY0de
	dDyiTeBbWkX5gTC51w1WZL7FaFM2Dj5imN/SPB19YAYRDX397UvrrNg/+9DxqcQGNlxXiJd1ckj
	xxE3fGAKHIs7RslnzZLzMCHCKGn6nrrKkZvg0ngjGflPAFhL4pODyiBVEbCvNut58tLpyPkcMFP
	kR2ql/4GzK/FlOWLHxRxzwsxYzFLIY9EgQw4BTs6h5ZTl/MXd3XhPWxDmxprWumrkcOvyniXrtA
	LSDz+Ztu8BoEm5msocWKh0URcxRoUFIPTn+HPDVOn/N3Njiag1C2QStvmCyE9os4PDZCPQXPzYp
	PKDrNdQdOYuupZYnpD6ZRtytDBV2PNKeMhKJHuNW9CUiII/7gJ/cLKrusilNX3PYz3uDwnjjcWs
	3E=
X-Received: by 2002:a05:6a20:12cd:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-39f2f0ff7d9mr3381106637.48.1775228042226;
        Fri, 03 Apr 2026 07:54:02 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:54:01 -0700 (PDT)
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V8 4/4] powerpc: Enable Rust for ppc64le
Date: Fri,  3 Apr 2026 20:23:08 +0530
Message-ID: <20260403145308.1042622-5-mkchauras@gmail.com>
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

Enabling rust support for ppc64le.

Tested on pseries Power11:
╰─❯ dmesg | grep rust
[    0.225728] Initialise system trusted keyrings
[    0.270961] rust_minimal: Rust minimal sample (init)
[    0.270968] rust_minimal: Am I built-in? true
[    0.270974] rust_minimal: test_parameter: 1
[    0.270983] rust_misc_device: Initialising Rust Misc Device Sample
[    0.271012] rust_print: Rust printing macros sample (init)
[    0.271019] rust_print: Emergency message (level 0) without args
[    0.271023] rust_print: Alert message (level 1) without args
[    0.271026] rust_print: Critical message (level 2) without args
[    0.271030] rust_print: Error message (level 3) without args
[    0.271033] rust_print: Warning message (level 4) without args
[    0.271037] rust_print: Notice message (level 5) without args
[    0.271040] rust_print: Info message (level 6) without args
[    0.271043] rust_print: A line that is continued without args
[    0.271054] rust_print: Emergency message (level 0) with args
[    0.271064] rust_print: Alert message (level 1) with args
[    0.271072] rust_print: Critical message (level 2) with args
[    0.271077] rust_print: Error message (level 3) with args
[    0.271083] rust_print: Warning message (level 4) with args
[    0.271091] rust_print: Notice message (level 5) with args
[    0.271097] rust_print: Info message (level 6) with args
[    0.271102] rust_print: A line that is continued with args
[    0.271110] rust_print: 1
[    0.271113] rust_print: "hello, world"
[    0.271121] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[    0.271129] rust_print: Arc<dyn Display> says 42
[    0.271130] rust_print: Arc<dyn Display> says hello, world
[    0.271136] rust_print: "hello, world"
[    0.271198] usbcore: registered new interface driver rust_driver_usb
[    0.271207] rust_faux_driver: Initialising Rust Faux Device Sample
[    0.271227] faux_driver rust-faux-sample-device: Hello from faux device!
[    0.271297] rust_configfs: Rust configfs sample (init)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 7 ++++++-
 rust/Makefile         | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1246b3add8ff..a5f50434daf3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 589613eaa5dc..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index d05e76df15a8..321b7d0e15c7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -421,7 +421,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

