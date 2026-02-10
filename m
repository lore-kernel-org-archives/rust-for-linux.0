Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA8311587
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721314; cv=none; b=a7NweV1CFaX5WN0Sxua+C9nDXyRt3zov7yfynSddk9OBCFG9nGCzUFNux9KnmsM5EgkGN2pcGywnBlXD9OMK/dcA/pt2rj0aDxliXmrf1hL6Ak7p2o01jSy+FXuLNxiyyLE/Xm8PQiYNjYjxPX50MkEuaLEi5GPyP8uW1B2vRIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721314; c=relaxed/simple;
	bh=TeX6FpDhYE6FSzmi7IBpjgfnly62UeaRLnW4YBkuyHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ND0RGKQj+UzFtKOIOE+DjazoHX8gUdS9YKD4myZOv33WneSUhGl/otFxf43fknnn4OWz07CMXaDi5dB3eNkPZltGzqnZ2UsB6bTrulsphA8dKfuiuiXz9PdZt7LMdwXhGAYPow6oAVV06zck+X4OiI/VlELJP7UNQNLxwjWKAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbu5YUyV; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbu5YUyV"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45f04f1348cso2475204b6e.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770721312; x=1771326112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=Rbu5YUyVSaSGzdXM6khf9X6rbfVhcucgIUhDoiktjFScz5tHOdHxmtPs1hI5YnECbx
         IHGsq46wyr6B/b2E2lGXKz5VzJyYLQTfndPCjmuczbP/gkE05TXVz4b9990tFrujOTTM
         4P9GX/Y2QK6O6KdXqin7k+aORgQepvHTQ0xDNcVW3FZAI8s6/kP2JtiShN4Wmschk+jp
         pyNiZ8PoKETHDFXQ9korXFzM5KvJDGO1XLxyO1QVjK/Cm5D6NbVww6kpnptxKhVkIDMV
         5U8gTcYau+ITmFixgsGYg5aXjW9zfYQ9rNmblyJZelGrgqICTajUXM2zuEWgLZOSY5Nz
         LH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770721312; x=1771326112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=i6s+7x9VDyg6eMIdON3Zw0pmrFglGU6ava4faGmPXJMJ+JMqr8MqEJNKgXRY/4fUiY
         bAx/ObqfKTbTfRjrzyK9+bJ0ucUBTRe3SONXRbq/lTFvvuPOt1SVBU4rcpZkAeoK4ck6
         gEDE27VJYnowsth4obFKFsYrFaFvUD8gUIlOlc8S57fxGjETcmVeIDX5DfD0jqCcwoV8
         zflu9hmsVEwO6Ues4h3xskoxQ5FkLULusqYZ0GSkkkPYnxDD9foITkN6O9qrXK4hQNS0
         xrMSUpJxYHDCnyUqbZIBB9pCGLpWeZFwcVPt+OJ3cRR1CAf/SHuPmPhFz6zR1TQdNe0Y
         dAmw==
X-Forwarded-Encrypted: i=1; AJvYcCV4mZUCIUjOl7H4LNQgse28FN41dpHI8HRuUddsj68QF5v4wJivbPicoJTsK4udDLujkhw0yFgrt3noMGVBNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LQTBExXrDUgR9rZNTvlwcH0JHlu+ZcruXuCWy0avYOZIla/g
	Ru0y5l0ANuTxB21IAf+q/S/Sro51LTnwnE1RZEzncUD1hpjgkw2ooJKd5v0aMg==
X-Gm-Gg: AZuq6aIp35hkBh5mUkCOGbTViEcn96DzXGyKXIo81FK5ioqw/3ggsr/yIO40FPjADRu
	ToapL7Tw4NGGpybDk/UCOmagsLvfuinTAD0uXtVoXeUNtBvXkma4aCh6qseAdcYoyiwxQleNDui
	lsPvqwGn2HUsZdzaD2yuuMYQrNvp9EdpOkiN22D8p9REYwxcpCUoEZr/x7RzdXokcYBvikr/YlF
	4+Yk4GqTPNXulYAYOf6oLrN6xzowScgFsIBu53qOLFp/HDZFk9opabC0fy0H1R4oc/DhBJrS2vI
	ywYrbk6AWwsN6haJIauMsZtHoinqe1NurMVdT8u+RPsjHHcApXn1CWPDEESbyVdMslPwWLZ7EjM
	goIXs85rhD39eYcu7/FGkPqNjQ2LN0fhNrg/IFdw+VCEB+WT1H3XU8Slj/y8RV1ONlbHj8wt8fM
	gxIwKknRqy7Yg+uCMqe6aXJG+qRTkTVh8tF/9fuAYhjjKPzts4VocRSRyCk92ro19b01Lrl8U=
X-Received: by 2002:a17:903:b4e:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a95194aaeamr120907585ad.55.1770714055465;
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V6 3/3] powerpc: Enable Rust for ppc64le
Date: Tue, 10 Feb 2026 14:30:22 +0530
Message-ID: <20260210090023.2587534-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64le only.

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 7 ++++++-
 rust/Makefile                       | 6 ++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 70b9e192a7a0..70bcd726ad0e 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Maintained        32-bit Big Endian only.
+``powerpc``    Maintained        64-bit Little Endian. 32-bit Big Endian.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 17db23b82e91..954af27e10c5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9fd82c75dcbd..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..0aef472c6cf5 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

