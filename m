Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E72DB7B4
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193952; cv=none; b=sLW4ke/p7kPtKqAkwI5b/Su1DXU1CxyN6xW5jJc+ANdvStu+EBXiJbWzPITJboRQSdup8pT6YUy6Rz70gO8judC7FxTdcKVKtk4ryikLeSYBbUZMDOa/dTRsU/fmFm434j9XqqnjRoaZhxP0gNzyHLzGqwpQOiqJ/12qRC+cToo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193952; c=relaxed/simple;
	bh=Tc8sOod0krNItOJV2MA2sQK3bhEDWu/YmKLDcz4nh/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMOXYJA0BG2Ryiia21laUMujYG3jKcC/vPbZeK5UAxFGHfi28wxpFiJ0BZU4HPdWA9ginqKBTvujCPILor62RC5GT9Ir1i4B9KivtxAnH4R6XE4bIhbV7UAdwLFAl+nB+ohXcmXMYQ95nqt3bJGNAxek5yvQNzHf4oc/TisheG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mhd/NIHO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mhd/NIHO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3614826eca4so8192412a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193950; x=1777798750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55+b7l5F3zlZQ0yMZrz5rEYbg5vrZhPlJC+KY+nm9CU=;
        b=Mhd/NIHO5WcLtT7pxleLaeYNaNoqNJ27bnm5uQkCC+RUdn0OSUKtOHbtfJndmu03Pl
         AGH0PXiadDDNWYVFJ9rv4kPhG8UOKW2WMqSfcyQLrakyyvjvOTcrbHAvyHXmPzCuMj1V
         uaGAB94Ey4TTOT0N66e0gKv+3yk+qdsIuQVHI2wunkodZYo+ScPB24PDXqyJKqnLIDqp
         6Vvqs6xATLTSaEdYuE9l6ZC+N0wgdTfh5KpCTjLqN/vLGzpmy1V6Pwiw5RGgEOZwlAW4
         aubFLLyh1Ll7kl5pVnwgXeaJ0i6gWMIk2zgbn6bj39m+qfNYY+/HS9EZB2+Yx9da650D
         Ia/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193950; x=1777798750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55+b7l5F3zlZQ0yMZrz5rEYbg5vrZhPlJC+KY+nm9CU=;
        b=bdovjRhclICGFsAHfXM9aknv3GIc4TgPwk4eAPqJn3pqFpJM9Ty7jm99hmvmXf9CMF
         MjKZSecjSskSns9yy9ph6erE3fEwGvMoCj1PKoGsRA5FuayU3/DDt1dJ+L9v/KhIcvl1
         U7UmshwIaBZ+1RTPLv/59SYiNEWnDrM17Z1aonn/DekdKEpbUTNvh3ytFHwEpHo48SuF
         9/tJ37EksnyQFCoMT+g+JFhaZYJvjLN6vT9riBhewvedX7LMzI35ShhPkLSCYsQObnl0
         9FWboUZIjh24ug7GslJyG3mGO88c9DSN9HUGT6RsYi0P6X6cWwmnZZtS57BDkdoes/HP
         xh+A==
X-Forwarded-Encrypted: i=1; AFNElJ8alIBFjct1rwhuX5ciI0h+JboSQzoU4JFnbPUpU3ZzxmyYrE+Xw0R4xqooNUtV72kBh0+wolNErVXdobdcTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsMDmNvvkc7y++WZ1/SvbnD6KguZwTo85UW5dqExbyPfuP8OW
	q9Q0KQSLIn7NOA8M04abgyk4sFmWMcOjskQ3aKvik5CHIuNOv15mkUif
X-Gm-Gg: AeBDietNR+vyLPmmyM6jkoudhiTBRgv5kVSx6B2gMZCSR4hkhHgGD4JQuq2ymdBtPXV
	K1jF9pPgK4B/o57xEw8uC3Tc6rz5z8TEa9PJ9v8TCJdnvQ3GuRsx0fEQEmdTuqzWwFg0aznqGK3
	0Qp4IwH05XPRs85TXM+x9pZth5rB3GlcWBysdAxOrpZeykPMypkIiy0jpwHAPJFI+tvBLtFGTCj
	XPhA8iGMillusIYoeWqPluNyxr4lwFuf6F33+zg6vl347+O55mP8ZIKTI9R5EwifhovcD6CImqT
	9Jwka4Di6w6/kGH9RromArWquVppm8gz1zLwhUC+PcRC/c+BWmtW7QTQG73WF3eBx5f+tum1VXG
	id/cxwaAMTf/U8jaRIjnqvMG13Y3TsngTeuc5n4gB9o4oNAko2WxnIQ6S0ZFxKIxmP90Qv6GOKa
	YCSMWcXcPJ0BDUYY3zkOGSR6Xm3W/pTvWXhwAUAIRhFEOAEwi0bi5SwKWE7zQLH+r8GCuzF5IZe
	oUThJ5kwXW3m4c=
X-Received: by 2002:a17:90a:e704:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-36140478a16mr39086684a91.20.1777193950059;
        Sun, 26 Apr 2026 01:59:10 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:59:09 -0700 (PDT)
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
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V14 7/7] powerpc: Enable Rust for ppc64le
Date: Sun, 26 Apr 2026 14:27:25 +0530
Message-ID: <20260426085725.2090827-8-mkchauras@gmail.com>
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
Acked-by: Gary Guo <gary@garyguo.net>
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
index 03926a451bac..8e5891563777 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -407,7 +407,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

