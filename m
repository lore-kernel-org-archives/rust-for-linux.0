Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BC37DEBA
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800222; cv=none; b=Qmxf2FnZOtidPikxFRrfrTkrQXs+VSEPtwTLF3x06Os3W+W+pz2qi5iKB1BtlTlnTCGCmk3bECpDCciPgZfr226ouYXyTqPddwevz0fcJELirQWSaVo+4cVXbBEhA5Vn1ecTzoY3XToldnby/vyt429zW01NUKZdwmZ8OwptWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800222; c=relaxed/simple;
	bh=ecbEtlzPm6hYATR+caYly4KtcMF5qvruxym2U2T3B0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyQT6TgDtvd7TVq7d6wsamhJluHiXZKHrVISRR71LvKn8yO5/IttvTIV3n5qGGV/uabmHRAJ6Y3O4dEWeStMIv6nTxzcJdpt7U6ZEDF1y+WgwKhjy49Zw4yTW6dhzXHhP21HlEbdsQyuqEhQmbtLkjFGRKoJ4byZSna1hSX8u48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcQfhVsG; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcQfhVsG"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c757a9251faso1432992a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800220; x=1775405020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=288wnweBkfKS80Aih7eMbYVxj6PiM5xDcY9weWSozU0=;
        b=KcQfhVsGnDAy8TtB+xfPgxmlMxj+ItaBeAIGP/hAb1bCIlhdj6sBdwUS/EC8XmE7on
         gsPDY3Jea8ZZTfYKTw31UHtUWhddPCVgg1LzGFhVpOAGvRBXVtiX31A+uHk0Uly3c3zg
         y2SWEKYk3HwBK3wD7WpmCqFrdyiI6HeK6NGr/VxEJmrK8u/Aq7TaBW5ACGZUpnAKmm3k
         v7zQTSndGzqLt/r7MzSLJyeBSJLFQJrQj4et067hXTjw+Xaxs2PzbPcvcZWiQtoW+TRw
         TNUJjSKQsJ90pu8A2da3KQqKDX4JrS4bPNB4p2FJlJdWJuBsNwVuJZ79X7qV/WaU5g0Y
         +MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800220; x=1775405020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=288wnweBkfKS80Aih7eMbYVxj6PiM5xDcY9weWSozU0=;
        b=V1Y8Q+c5zxWkdvBy9gUb02mKjFMmjQjiOmjVIT+LpG6CBECQZE2T5UE4EaQ8vQs9kF
         TgZujKj8GJuYaY1qXnWji6fNJiucaGouth8L7u4W8rphHFvbwzl00DcUvxYaXXOmMyJf
         1s+OGWjcWX3mwoYlaNaR5vt8b+Tku4QSlU84P26o2g0f7KP1FLxj7EBb3LJtoFsMsdli
         PvDuefDNQT8ky+mJHuu05clhVNsgOXdQW9V3genGDaQIdPp519ILMuLxFde0j3ZkMcUA
         MHILJ2XrjSFDUOt4TMTCR763dWt3fToksPeUpQ4MZS6YWU1Iy+MPfDBfwUwBXAM1MN3D
         eQaw==
X-Forwarded-Encrypted: i=1; AJvYcCXktRRlvndI56MiWzYNmvcfmQhkFUXHqCvoUfxVcdmBrGgvrEWuZS1n0ZyXU6BrwkCje7hrgYF0DcPWO0hjEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7UoFcp4Z48iMg7iwFszfua76erZYdqbk8vRLbNO4+P2sugEU
	KNQRvxH0UxrSvf0JmxYVVPFJ6UjyvqF3a0I53gFltsUAFYCcC6RjL/Hm
X-Gm-Gg: ATEYQzxqOpTtF8UdEsxIoui6FVGfNRtGnqRga8hhQRkShzkZc8XoqZlmncuZ7uZr9yH
	6tWRTcJTGuoQlCOkG1dueyHIEvzY2IWu3PyUXs3k/l4pKpOFldl+BI01kur7ZxnRMwNvHghZZAu
	LilqCi5uA+aRXuQV/O6u0m/UKl/d5BdatOBkK7+OPWakgGc/TRtnA2lOduwPH6TA4loYb0NBzF7
	gsZhCFVGf9KGp8596aUr6lqHangkuRuKDu/mBBlUCyzm5fdyTOIB5Y1rFYjRwN1NAyijw7Mm+Kh
	TsDrtAS/d7v58VpbeVFVafnx1cy63tKCzeE1MnBBOlJDNKV5xk2a8ECNtu2skXNzS3MUc6w0hSS
	8f8X+k1YVhjr9glLp+H0mvh6abVUTfdlDkiEKG6Uud5T6R8zQWaq+9J90DE4pxYcDPyGQ4aBKbb
	3niKJb4chF13g7c/KDofP1q9CkuzVHoI28bT9qdKQGIcxTE+pqZVyfhLPLtDPbeCYPogJLExPfC
	cU=
X-Received: by 2002:a17:902:e847:b0:2b2:5124:d068 with SMTP id d9443c01a7336-2b25124d224mr13168265ad.10.1774800220154;
        Sun, 29 Mar 2026 09:03:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm52521175ad.77.2026.03.29.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:39 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V7 4/4] powerpc: Enable Rust for ppc64le
Date: Sun, 29 Mar 2026 21:32:54 +0530
Message-ID: <20260329160254.2592207-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329160254.2592207-1-mkchauras@gmail.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
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
index 7ea7570e3f17..7fe4cbbd176e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -410,7 +410,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

