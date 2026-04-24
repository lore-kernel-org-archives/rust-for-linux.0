Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6633ADAD
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009745; cv=none; b=WORAVDtXYa0uwWbG41hrO4Ll5nSV/IEQKxZW3CbvVviSwxvyf+4srfmBlPhu33u8lDojFY5QHCSMC1aZ+RxWACoYLvPKf3Ky9baWWOHn8Xr7aujvLEBQplqZNRPGoCnGsXBtsDqtvLaXwMSZ5tjGdtBJ159zZBzdeXTjjY49uGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009745; c=relaxed/simple;
	bh=QL36iCxJvrAKverR2bsI02V8ii8bfBdNBFY2qQ0lS8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+IHnLh0ew91KyzVoT4XHUyhOCAXetdI7k0O7I+A1zpE4nVUziW7Zs/IhP3h/O5tF4gDh7vf571r3U+5E/nRijeoMmlq9HMvVTSvqMZwuvS5MY2ELFuY7Or4mPjqNlv1Ut7XAIIUEL7gglRVFITXuIDYXwBqwNX8Eltk2Oj5w4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giwRt2mu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giwRt2mu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab39b111b9so30968945ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009743; x=1777614543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=giwRt2muKV0aWZwVt68C/tVKGzzH9LcT3/8dgzXSZ4YBO+9F9EOsCDsP+Ox2M7+WHQ
         RqFy5s6Rbcx4M2OwLjb79iRcKyPfNKGYnbaR3tYrEsKfUuRCXsORvkWE476iv9vbwPn/
         z38aEDkXIg9+3V+0+pRi4Khg8Nkum2Fl5a92HNDK+R2DaG5J2pAIGLYB4w9sBm1PrpoQ
         IqbdD3RIHgMNKUjJ3Pt7NMTiDEEIXpQkOZoRjvQn4NcYIVQWoHbNoSvzyxpJefp1CC1x
         U21iDffRJ4kOuLIch7PgSB3pO85sAJ/GxCuL/gm5ZI8aySbOLxXiofqZKaEMPfco0T1i
         XaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009743; x=1777614543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=I2By0kqAS7i7MmzARuqwDFKQNIC2fCCC9U1H2/h10qHU5voPbtFih7PmGLFb3QBP+j
         9ynSVdssQO7DPGE7/CMsZv44iBr09a4wTNSc6DZwYONyqcr9q+cwguuVTS9cF0YZGUnN
         UUBc4bcAei+JftBaypEEuUGe8uRXMXbaOy0baWWf2fOG+qmLmfpYGbMLjltAKgFTPIsB
         xOOKBTi2bVr3gi1VbYWkRpLh2brbGWVTJBY+JLQeGwo3kxxP4ZX6Lz8nP1yulKXR2iA2
         beYgak+bkEbCDR0VlOICrJEZb/xeo2e/kXxCi5VRIkmmODWis43w+9fRPCwk+RjivksG
         /YcA==
X-Forwarded-Encrypted: i=1; AFNElJ9C0riEJ4ZGx+DyZ2XRcGZs36BgbC2Pt7MJLziiSpvG7zG71Y18zq/PbDm1XT2HwBZd2RhGPqQB4NSzsbGfPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUGYx9JEux73EaiqHKFD6xe+rD1D9t/FnZTgjlUoOmtkEIcZwg
	WNajCioyPnyPdKeh/3JlPHJN+L2OxkbCMUGQ0/tb7hbchtUZQ/vXMHKo
X-Gm-Gg: AeBDiesEH5IeWSAVrlbsCD3hkl3EAQo3aa6vGS4d6t44LL/ZtmjjnUYtHFD3ivaFfXl
	89nAhcf2v/z71AsysBpgufUm7b385vxyqRYgkCrj+VZ37f48YlfrWfeLOvKVN3BAlMuWgLLE3fH
	nctv7S319KcLFbEq0Mt8sdLRZXHOus2Rx7jTsyP30C2f+LDESt7+aaCjgQSjLZGqMKr7Ed2yfjn
	OL/mXjevCb6ewyQHYJNJRnvVKXQrhGYpvSLSFmfm1CUoiyTkqKBxN6olZMohYOPGyKg8xrAYck9
	RupqvcBrXKjotbc3FC7+YRzFQCLWrCkLYWXLY3ffM4tZHukChILptDjmnS+h1kUg3G9CzZRX9ok
	HHgusUiw//cr+//ucACtrdoAfNIhMcq9YexbfnBgIFNUnRkNhJ4WQ6SXSST6ZLSeft+kkb9iFD7
	QnoEgfJraCkLuM0uuVve7WDn+eZhF5NkjBzCAG9b4N2Nws7Ug0k/qw9STZ8hahcfUwzBMwaGHM4
	tQCPkpqLV4gtLs=
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr323157805ad.27.1777009743184;
        Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:49:02 -0700 (PDT)
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
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V13 6/7] rust: Add PowerPC support
Date: Fri, 24 Apr 2026 11:17:41 +0530
Message-ID: <20260424054742.45832-7-mkchauras@gmail.com>
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
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e93df95b79e7..4ac897b650d4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
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
index ee11fba7a03d..fd9c1bf026ca 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

