Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43636920D
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634521; cv=none; b=frUsahDFM4w7g5loM+Of4FiV8skkrPmAQ184pVS+hL/KHnT/r3lhdZK88yP1GaxugMTK6WQ5ul/b1iIVz/ic1cz5Plt1FLJTyWwXi7AI+IhzmBiGFc+ZFkblUmrUGkkWpjyXBK0Z+LB0gtugbMufLk7DGkS6HXjxn/6WzNUY/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634521; c=relaxed/simple;
	bh=xG+iKu12LZBylrATKh/futyKH7FfBK8l0BhELtv+O7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmSJWo74lXgN7EZ278yjJ38GXQ3xv+8X6LhNZ/G32tJNXx/vc10em9qJ4VdJYnAT3aeSJfZIoNge8wHAYcT5UykRWwfGwzQvoyEPqpnf+FH9Shr+QRWOiPGT8SgZZejWuI4kPZ3wGHMK2QFOfNygt7TkeYyt64EvBPc6TDcT1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqWg/Tc1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqWg/Tc1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8220bd582ddso2909752b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634521; x=1771239321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=QqWg/Tc1BAOvbEr7rLeB4YJuRSFtgG4eIsRQ49ZjLGD7JtFXfakUrB39Bwzf3wjJDn
         oodm2jpiGVr5sQLlQWdcftJJZeIFr5jl72Y3UDTrDBiKYbasONfgYU2SPJZCq3UOEl6h
         XeCkzt3Fkni91SijVHTWKI4POrq7jBt3Y+a02eusHRHdYhsE5ONJz9TCIHyWMA54593Z
         Dp1Jks+Y3xKXdZ/v8O/Xd9b1GgxmPeC9c40mdkpJE9PFSdJ/eUJp0F+Aj1L9STQENmBC
         YTMrSbHLQMmTYtGpy+DJKgw6fgFxzvjdn8bf2gULFIVZ1xQibog4SNBi9rz1A0biLbGU
         ermA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634521; x=1771239321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=WNgyIhhYlJtH4kxVliRrauhLuupCU6nHD447diD7AhdmN45AgZe22E49B6XnIsLMIS
         SZeqBfMsvJVkn/aXnErorlQbqQd/YM7Xcf8g5KU0Jb3lIQRqzy/7AYuW/pZJHgCqKzA+
         bWkxIFpDEx9qntDT2c+zBVG9Y17VBx+1joFSkJcwLsgojDbbofjmxnw+G5kdbuaVE1tT
         Kt4OZsaR8Ejat6V544ECF7Jf6DFCxZgHZuuKZiEzmVRc7lT++jiMF36/peQi27C41Rp6
         OYW0P7wvMBkLlZXv8wHr3m3hc2AJRBfODBJ3QtCiveEr4JR4egqdKmS69gGNFF+IIkRr
         x+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWzVuM0zhgbayc7sGU8dciamOgg1eCI0IhNVinVTR4hUoN+u1wx53H+HhWSi5AJzOcomBVqDzlgMVxomnls1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQnhMZbni07u7B5pRxksJUSZRN2WfkvmVd0cLFQWLONY+nO4h
	Ky77UnCQ6hAgqK21+fpQGO1aDO3Ah4IH+c/bdQo5uryUL4qFqKP+kweX
X-Gm-Gg: AZuq6aIVppTgSAs6jITTf7gQ+rskREjh6i0e2XnLDEZEhps9RrIg+O8hlpDDIv5xt8x
	ti4BhicdHVMCciQw1X1lAjEXW+sJQKH9cABHLrYnbasysxVH8TlX08dY/8DuKjMRfmHPMsqVmLJ
	Y+jX4k3/d0r9PaUWKXp+iOd37qic4WqmiWgVcR/kpJW/9jNGLar2wS/+fka1AV6x3Il2cS4qeNJ
	B/iUrTR98SuG+UFkaOSXCAlbJHJ6m3oC7x6hTKGFQS4QZQJ8QADnfIXVCRmKKfAVNT2GhJKa5/I
	LP2tjpwBNe6h99lT+dj8MxRxDbOMCqqUSenaB21vdO8SiNsqVSUNSuwfDVhbZTIcCGzRLyEPOgS
	1cUkyqPrekeRdwK/43XfxgONQYSxjtmgRs8fKUwWL+DUuv2iDjg+HGcRbe4P1VeyeTGirpQdP4V
	R+HtTOueGRukkn6UcqX7SWE+PTLhoWjJEBBKxlokUc67s+jtmsgytPiFg3ggG50jQ333ZnfQ==
X-Received: by 2002:a05:6a00:17a3:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-82441612afdmr9001382b3a.11.1770634520745;
        Mon, 09 Feb 2026 02:55:20 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:20 -0800 (PST)
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
Subject: [PATCH V4 2/3] rust: Add PowerPC support
Date: Mon,  9 Feb 2026 16:24:55 +0530
Message-ID: <20260209105456.1551677-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209105456.1551677-1-mkchauras@gmail.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
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
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 2 ++
 rust/Makefile                       | 4 +++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..e26a94808e97 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Experimental      32-bit Big Endian only.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..17db23b82e91 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,6 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..9fd82c75dcbd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..ae22f2c5f0b3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -384,13 +384,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

