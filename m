Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE930C62E
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439447; cv=none; b=m6hmsFHf73RTUq94RzWGKqkBQfjQr8vz+tmOLGSQXvkrcKpkl39k/y20P1S5OS7sYKc2HbLw/VNx6QugQZiNTgL2CkCz9vL5MTRjmJEDTA5PaaZZk/QCk5fNXQEDsk5HOXCxXO+ex2uUspgzeCHiUB/i2yPr39UEKBTR6vTgTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439447; c=relaxed/simple;
	bh=KGTavH2N2h74JlTQWyY6Aj3TbwX/gCXKETtAzErZUN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du29frsfaxsAHfHyAIdx4kS74BzjCQn1hAUdi0fsglW/SsybnHCw6vxU4Jdrhlajv0Zo1r5C4MU24ByzA4gL9OhIz6FSeerL6i9noFEp4DQP9bfnwIyjshQe/mTwrv7Q1OsiaPujYE524C7PCED7cZ/qCQ9+Wg7jIBTMCkxQhnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evfatWVN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evfatWVN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f138a6d5aso399775b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439445; x=1777044245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B58d6JHjS7h5Y5vjFZ6dbGJt4nx8a8vTRSygt806S6s=;
        b=evfatWVNJIwhCz3eoV9zYs9feh7z+15ry0DxqSb3dYhvNgytkgfq5lTqJzCLuHqQcD
         8Aibbp7dPbJuHD0rgLAJM8iUAtLRdFvWbEeXEXXfi6VBkpMnXlxj5IW4avUiQfLrPCdh
         2mpyXPQU47TrPK2FvYtE6Bo+YfE3bLf7eXgAQa3qJSdOGFNJrhWqIMNs2o0GeqPcixI+
         9kUzn7iw+4zOPkq6Q7cfpScbNzbkPZBknvEsPNrhDKEQTE7kMtNfIqRafk7c7GI982aN
         eOxJFajt7XsVsGSxBSHZn9Gt9B1smbEPh+GEYbHe2/7PNwDivyudIkwvSA/Uq/Mzvg7e
         Rw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439445; x=1777044245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B58d6JHjS7h5Y5vjFZ6dbGJt4nx8a8vTRSygt806S6s=;
        b=BCycmlutRAZPfrYcz9WyHRsnS9uq3JFWLn+4ZJcrulvHNgxno0RCA2Kl9LAFfCJujg
         uy/20GCXMgzy8wwbFmk9/Ziv8iZUaNVD4hdY6a9tW1HUjgnM5YDi0p/i1yfDPMOjasjt
         42n3rnxVQfgFH0On66WLjlLn/j8obH99LNQDz/HCL8mqKttEIX12VMZNippHuF/2/JEd
         ivRw62e13gMhRG3jOPaqxNqYOsWb4IKrifaF+ccuVHmGHQjto0N01BfDiHLBszjb/gO6
         wBzDNvapNSZeWmxe90/CfFQRyJ7QNlsSQ/1cvfaGcuPs0Zhf0gUqj0Xykrigbb8g/a1v
         5VIg==
X-Forwarded-Encrypted: i=1; AFNElJ8oRZOD1Q+nNxX+agSxfN1RSg0BV0RsWsxLBGtgU4snKoB2NKpWn19FOWev3v6942VvYDsfzh9fFNCeKJu/Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5QEJZy8hcKVcSr8juOqu/prhLa3Lk4FIjkFFBko+vyHA+CiZ
	qki28CNmULddAbGxRAIx6zIULPFtBYZ4UEjqSdw7AD3WPcoRoXtRQ95t
X-Gm-Gg: AeBDieulPUgnt/2dN0NL4qEPK7Odp2myjyBerqWClPV5gFcT3qMIWzXIpwjTp1l15rZ
	ElxV+ltXRfSA9yIGFPbcmcfBw/CHDbwdiQ8DQWlIMbCTh+BsUi3oWTxAlp/e8fU/hvkxmj1hCmS
	Yk/CQTQMkXEpK3NzuKgyf1yF9UdJJBzZLtb2KlYErh4j2j6gtx0PmPASEkT5i3bCeCysUFPnGbr
	8L3x/pH1gu/8JIDP2A/kKFiZjFE3AvM8lQXiMRhOaVmZ6l1pJZN3NUYOrwM8GLJvqhaWJRMYC9p
	9T7fc+1+nWJyruqjR4o0hB1tJpJBlXxX2uoh3W5FuvAakOMLWDD5Yg84oyH9So6WadKUd6mi6Z0
	W85g4WQogJCGjt1xrz4H1vjFhadlvrrTszKcJ04mHUnkAovBshJcQ2IZD0HT0R7Vut521JaH2Ue
	Vfj5TPamQTYvdwfJOnMhRS7JQxUSlvQJVh50Cl0tSaRzPmb1IC5g4D6Tcy8fhNJbd/8xGi0D3fE
	G8HuML9rRpSpg/Q3pl+qu/nMQ==
X-Received: by 2002:a05:6a00:984:b0:82f:6cd5:1ead with SMTP id d2e1a72fcca58-82f8c86b573mr3320740b3a.16.1776439445297;
        Fri, 17 Apr 2026 08:24:05 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:24:05 -0700 (PDT)
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
Subject: [PATCH V11 4/4] powerpc: Enable Rust for ppc64le
Date: Fri, 17 Apr 2026 20:52:53 +0530
Message-ID: <20260417152253.2312961-5-mkchauras@gmail.com>
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
index af0c8ab2e5b6..99537c2c55ee 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -414,7 +414,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

