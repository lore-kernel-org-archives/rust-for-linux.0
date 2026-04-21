Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF7363C55
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773447; cv=none; b=A5eG6TAr25vm3dZhG/VGgNdCX2ahPRTNedDyA3KT0QiKvSMLzepSLY8dKQG8FRCTTpVv/5qLXczXtyu5zKtO/mi5NAvh3eDIeWKlgpqJ3QDiJ52hyeeUi1J1s+A5qsl5BDmWo8Bg9og/Yqgbi1sBR3bVDpGajlf6zYssTCCrZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773447; c=relaxed/simple;
	bh=/H5PcSrC2tQdEl6SKLI73OsGEYqK/u2LFa7CaU6S+YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZzHCDWsQWb39VBjoE0D4eCDwRJJyVMdlC5pOztIX9tXyGIZIUkTbUR9dysPJDY1+ch5oNVcawAqVEutzg/6xwL6a0gLbUlRtI4vyeOJ5Tarh1HFFWEw518sdcfOXeoi6n9lb4nyM3A/s/0202PjqHIGEhNYmBvOIklkdEwFLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFve1YoF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFve1YoF"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so1494349a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773446; x=1777378246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFBtEobc7yIaM1eVkOtXcJsieQCaSzPZbTXZ7JIsJxk=;
        b=tFve1YoF7llEb09aBotqgR5cE1JxRCx2wh1xPNNa1/rdc8CltFVdnqtN8HU2L/rYjE
         o5TkEIIg2tuRGq2Bce3PciXOM4Qw/5bYzrq23TpZrH/EJiamomRidxM1kuTC4QmyFH8l
         h0i262R/0/Xi1Bg2sUfc93MIdqP0lxNm/3hg1Pnb+Dd4BM+1oIDg0p6mKbMDsNH/BQm+
         dvtuzZW3+UTfdeUv1KFxgMbtgAK3UAN8PulOIcpmqByr4qjNmlm7a6aLkUZJIhlcs6h0
         4QXSnKUqXalwzSLJIlmF/1J4wvW1E5y+7mW3MgkZ3wdwXc1Cm8iTC8RRZi3v19+szUg8
         wOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773446; x=1777378246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFBtEobc7yIaM1eVkOtXcJsieQCaSzPZbTXZ7JIsJxk=;
        b=AdLuLtL0I0/A5glT25tQMTGubToiDpXQFM/ULH3V6pCBvL5r5kLcAKMXZGqukpSlpO
         95mcuSH0UybNvRXrH0NSx9bY0Pnr+oQ+U6cq7jtWFMMV/Jayp3AHrXz59AlUVxczPXmY
         w7SsHKvLr+FcxlyFLrkrUSjdJFVeGN8OxFNc1SroBgT8evRaqYKqqWNgKdjE4cFE/g0a
         3LKsJ+cYFS3zJpItGopQHFdGYr5k0OHPzlh69c7A/XGwK//IpjbBjnMaNha1Zcb4RWWl
         kk6dPMD7feoTySLjyAEPHyN3XHKYevT+L2QzJQiAeWAIw+R8ihvrDUc+KgdVW1DCZjU7
         4Xlw==
X-Forwarded-Encrypted: i=1; AFNElJ96iIgo+Y9zUKbIQTmYHBt0MkQ7Msku3+5E8wFY3BW+J75/fkI4C8mR1mdkGCmjcGFunPlCuEJjWwmlybEcZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1JmLuFMWHlikVMRVxTRs1iJHWk4qzVW642iPCtRRkKxugh5a
	E0a2O3d7rY7wF5aquaLKJ5r7z9HJhxeKsoaRjgCaWmFm58HDRKwofgZC
X-Gm-Gg: AeBDiet+/DgMm8b7c4LOWVBuLpf/2tCooS0AK8QnYWaj7h3josMqKd16y/8DYBjmjjZ
	UQUckVEIqmJZrAq3s8DDU4VDZUKccPm/h+l086bl624jXOvgvRcOi5KX8LWZlhdQ9oFdBdixD42
	bYOEMGrI0e8G5VUsMHhvsDoOo3g1thyJRPn/TTfmKajimZ810oA8KE2PTlmDs9NKObPchl+dksT
	J8jrBPWaIJUAp9AEXq3DxjL1Cl2tqzhuhJIjgbc5DIOUqec/uZqJ8ol5Pidmk3A6w9/SFjNjdfu
	DEBfjds7avhJHVSuUIm+gQkUxuno5fpwQ4F2gLJVzolBO6G/XbrzwJ3eK4ypWReMzSIBsGxuUFM
	9jNYD3z2PFdShsnMMz3c9cr2545LKN05FfanopvdDUOLtMRowbo5YHNlKdUBg/QxwAm5rcUQUOs
	tfP3bu5CNW7xjJGXoLzKX8QTm8k+ZdbGIB6S/vkWPUMKADPeAOkM2uM+vv7mnFjHbAI2Jab0foB
	fdDfq8vcZfbqnKTIscvFph7fw==
X-Received: by 2002:a05:6a20:918b:b0:3a0:b9d8:966 with SMTP id adf61e73a8af0-3a0b9d83334mr11249808637.55.1776773445911;
        Tue, 21 Apr 2026 05:10:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:45 -0700 (PDT)
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
Subject: [PATCH V12 4/4] powerpc: Enable Rust for ppc64le
Date: Tue, 21 Apr 2026 17:39:58 +0530
Message-ID: <20260421120958.190430-5-mkchauras@gmail.com>
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
index 4ac897b650d4..2e3065bce9cd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -286,6 +286,7 @@ config PPC
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
index c90811a2f564..846fe1a45056 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -408,7 +408,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

