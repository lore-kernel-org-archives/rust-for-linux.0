Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDF33F580
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009756; cv=none; b=hq93hYw4TCJHiYokSkPZwrHgsGNno1MQvwZ1Xazn18GHir/U6OEm8rmyGd73ycCJOLouxAB6WLQP/Mo7nf8jjTmhBYdUp9vJUh3Q/t3SXzZIHbelROjyXgey/75EHv3mCP+J7pqtwCEY0w1jH9LHs7TGDBxpSfc5uSrGQaAp7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009756; c=relaxed/simple;
	bh=Ln7XoFFRgbpVTzwb9HPAuoSFU75gRiPCvs2/RLkCEsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcEc9gE9dbcRTznhRWrCVkzGO588JkC4jGShcgAifeXcXRTdnFXIcp48w5AJ0DzQjr7mxwEgx9zuSdOEOxoGezcGjYLqgl+rjhpgWBW1raeTAl0/zogLfFsIeqooB3at4+cDVnlgmHZL83ZF9EsDerF8AdpqPe1P9E2lR1+1NyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzSNeVEr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzSNeVEr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso4954827a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009754; x=1777614554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoXnYHhu5OJq+pQQ/T7jeG1ntNKoLYxlZRpY7d5kjto=;
        b=jzSNeVErcDeX2ZGTIQOUdHQdB4Vxrx5ct/o3AX+z7z338ql3tuPM5q1FkkTKL0ohun
         tHmuMXPPEIxoMjvuraoKiqw5ucgWuZ+wTm+2+LeJ5mTARgAo2p69yeGvUr2qsU3dMGC2
         wtpLdQqSsXTeG+0kr+7ILeE+10yvdVzEKApcyUgoZOTTfJt7tAPaknuQcBEZ+b2Nvz0t
         tWmWog/4ccDiBvWmaUIiEHuN00coTljNQu95YK2KUs+xrq6eACRf06a67RHsMW9vJ6W1
         GHqfv8J+WuBrwSq+o3AGe8pJEUBBcSykP1NhAYmyVpVPVYtnlPefZlJb+UG2kBSSbfSJ
         IBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009754; x=1777614554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RoXnYHhu5OJq+pQQ/T7jeG1ntNKoLYxlZRpY7d5kjto=;
        b=CE0D/CKjtzrU+tPA+dY09G3q1lM5R1qyBZ7Z1GXXtoYZwkk6KOZaKk8xgcKzF5xVS0
         3Rt3wj5r4NQMzY58q2Vuk7sVTP1GAHeQA2vcVMz7RTDK6PDzPaBVIgm+1QAMZzUkyLpf
         f0YC4lR5jxo67j/+gwyg6QN9nlio6SdYS9r76lKfIbSsW4327MKJrIwRR6jSqXZsUd8L
         v9jK+8xFeS94R4FWFzDT08ZnC9lh2/4VgUeMy1Dlc4YYnsXpVD2omozW9E+3tvzhj1ND
         Y0fQLn6ES34Ew+r0yaomAfkMN04NNRbcS4sXdbVBEeOHDTuJp3nvTcsBSdaKHf5FWJY6
         AP5w==
X-Forwarded-Encrypted: i=1; AFNElJ9KLQ//c6/yA15LEMsaxeKFfEYwhVYForFjP4Z/f/gCrXbwA+x2pzwKCmyYA0H/w3XPY/3NpgS5TzVXemQTsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0QtHhMGNDqsg/gUKyXkWqz9t7MfV5ocW9TMjOdB//1vRk/OL
	h/fyzPYQsQmLZMAGXsYzQyEYMaJG99ocYbpBtfho87IvZFuGlOBT6MFa
X-Gm-Gg: AeBDievD8WNbYL5nXW9vQxF1Z4Bf2LgdVFae7TqOhMFbtXkRI64BZJZ68nwJVCf5gFx
	XGr6+m9M425/OI1PV4Ila+M6DjAdhVpB6qNXGoYtkGriM7V5xJNqg/O2iYC9EcncNYZZyjILXz1
	D6SqR0iNBwWPDoCUY6l7ySFtOXaTrsXy4PkkZjEGa/lwWddSH4U1Zma8oZrX5gu5NTNQvKG8s6C
	5rHo6h6qwtkdeYNQxqmPtKxn5iylsvkk99euLAhAGWnJ47+mGKMkcsk4jI+Ty0+0sWDziACU3pN
	5tO0stw+UJThZ6QSv3cAvNqyvoBYhR4EcKk6Ca4zV++W0MR3wdw+zBOflCePw+xF9pMk5tpZiqn
	zAFsVtAxFJOOXoEoM4Aa+44u5CkdmUiuI8Rb6BTu6n2i8lyHWdw+LsubmXimqAp3v9med79XSYI
	AMsLg2yf6F5uH5CpAMoKt24wa9jUN0XaJXZkuWOSAXoVNzAWUH0q3/7B5DjnadABI3CgttZvwjf
	stfW3O2gNGzIbo=
X-Received: by 2002:a17:903:1446:b0:2b2:42b1:ad95 with SMTP id d9443c01a7336-2b5f9ee2835mr352292775ad.16.1777009754030;
        Thu, 23 Apr 2026 22:49:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:49:13 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V13 7/7] powerpc: Enable Rust for ppc64le
Date: Fri, 24 Apr 2026 11:17:42 +0530
Message-ID: <20260424054742.45832-8-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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
index fd9c1bf026ca..d7b74b209a33 100644
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

