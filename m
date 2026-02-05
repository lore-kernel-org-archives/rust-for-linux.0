Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6D288B8
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320758; cv=none; b=cb2Qu4CNsJFNC3nWTwF4bkp0rGeG1URhlIDOg0cnLjDOA+kOnE/ZU8wJKFN+bOsiwflwk4OwFxnzax3CqYrzvep+UeR+4BxaE5RfG+f7f7CpkCcFxFVKyFpLLihX8cJF3dbdVN1HVOe3MLoWmM74V+zdV4kHY8Gyex/aYMbbF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320758; c=relaxed/simple;
	bh=pZ1U1Cu6MPwvJitbLSTqOvwj/6OfA38gALmI+6KPpx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4h4/NMcjJfUoUhyvkpOR6BiPeGZ+bthlIHQpn1pF4QaHI6z8enGcuDTKB16AiP6mh+u72CEoJgcxbDty0eVsQxcLJZib3DTLlXVbeXJqLjoXODizSXFuMw50NurGJLGsUP39G/6NGiN0HnVlwl9AkSD2o7lbBhhMobQ4o/WiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcKk7IWs; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcKk7IWs"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a288811a4so14724326d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320757; x=1770925557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=YcKk7IWsO7NecNH8Oc/jh0ponNXbGKRd0d+2xwnJXoQ+jeGL2qOlJThADgg8q/MyX2
         kfSyyRXQnT6b+ZYnAKvqTN5+PqrH9K5HORWn7vl6MdIOkDMvrKdwDp5k3ahxVA4O76pA
         eBBzKq5tiS/0FYNbMEJs3+vmqg3cOQ4g6ZRaezSWNB8snOYWsPePmsmCE3PbxMXj0tt6
         NIHX4bKDK9Y3cUBy+GjU/slmx55AWJS0Vdgqtir5ns2F6nXBkyGQPwgzZNRZ8BYidAjL
         rCUiSWuds56tTkZzqjyZd2wkeXlQFbDM2Gqfia2Due6pcERDzcONhzpCSrBTzsQEg8tI
         7rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320757; x=1770925557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=Wg+o8N3HtGa1vsA7XIUpdKePslu0x9j/YtjP+tCTzMboLtBKKO1+1gH088EfyJnqo/
         gwqVDwe5PTFJR3oBs1u8zje/l0DqAQ0HfvorupTr6reJcr/WJ9qHrBQfFkjnxPKCk2oL
         yAPcDYxKcSEBOfyMmZ0NIMJid4uxEKdf2ZfXlt8k60X31Zuoij/vkVYbN/o0ebqZ/Ak3
         ajhakL50CZ01a5BJlYx9olnPLeJSVWnHQCArwuneFLqoDmDxZUsrMPmKITkli5FPdJ/H
         0eODBrKdkmxTXp1aHuAb9jyrf9lJ0Q58a5iPFUHmCZoILz28FLl9PPWerwKSQ8ZJgtLA
         oo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpREm2qVTsVGyyyWnrWgrU8JOBn+IPsiSUw8T+zdk+0S15wp9hPi2wzIcy5R2dR6nNrpUgrL76cCSm2k6stA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7+n0tClKGcr9hfhLVeLX/80zS/yGBEWPX08yTjisImYViB7g
	tWirTvYeMn/R6my6p2ILFvFujOQ++Usd7dKEFRohVbcOMrpAVaqRkWdh
X-Gm-Gg: AZuq6aICCNPHAm1gdnR4Jdua3Ypt7gBVorIAJflYayTVT2Xvlm0mb1MEmY9uLcn5tB0
	LcY9fCTq0QjZa3GECoIkjMh6xMBKJ3ETeivAWWDMYEkgoiIi5Husym+tI/ksws82G/YDEkMLXbh
	rNzCOzsYmFrk2ptiwWET/9qkC0XYCatkONO4GO/G17NTFay/O5fWNKLLPCM5wzpdejGI1a3YBFf
	jeNj0fq+QldpXZxOAexRNghlDwDd0yzZIbcpE99Y9/XlZ/I8Q9YeKplXIH5sqqzMXdT1oxA+rhq
	AqyYVbPIt6C+0CQ/JGHvoFXMxwbG8O20XDBiOM6Pz7QQq00EPssQ5ZUJRy1MG0TLdKk6jud7md/
	2VzbvLIhOecFK+NUAMQNOC6TbDYTloyVLrUuDnfTse0zgZGs+11eoZ571yfgWyMEda9mVDTqius
	GUTelolZd0fcH8AlmYhrHMqmxoq1mXpV/NNb9A7iOzNVhNSM2vbcGoVksXrhKYlw==
X-Received: by 2002:a05:6a20:d12f:b0:38d:f0f3:b96d with SMTP id adf61e73a8af0-393acf88673mr215443637.2.1770314709806;
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V3 3/3] powerpc: Enable Rust for ppc64le
Date: Thu,  5 Feb 2026 23:34:29 +0530
Message-ID: <20260205180429.3280657-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
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
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 8 ++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index e26a94808e97..627471ac9238 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Experimental      32-bit Big Endian only.
+``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
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
index 9fd82c75dcbd..f93816ddc036 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,14 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+endif
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..14febe9c7643 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,15 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+endif
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.52.0

