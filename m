Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663E54DAF6
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923532; cv=none; b=PjBsTlYQjVScWxrfYHvHea2zimA4mQNjjClTIv6IM2CkgMwPBZriaMfpPNbEe21CI0UoYaEu+Pg7Jp00v9uZEcpn2bewchhwXuti/izpCUMT+3QszWDFcPrZG2A+LtHFVJ40/GU6NkLeJm+voRMABFRf64bhT/dZSUJYT0SCims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923532; c=relaxed/simple;
	bh=6jzevAkptcRlNrutookFDiIxJyIEnbNFeuEECc13Y58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DMDtneRiJITi2xJuYbqPB61Yl9aUgqkqwh5zaSjhPMO+c2BmgbgM4cPD0rvV8NNHTHfESqia3iW0N7w57RGoSJB/P9ZvxERw+0GhXKIXPdKnG10MvHVD7H8DlW/WHSzmahI1/fijjXU/P/06I4nnP6UcGJ14nleMpI8MEYdpXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnWzQacn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnWzQacn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso31666795e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923529; x=1792528329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=AnWzQacnTlfnex5R7FGfYHlsqwSHcjiFKxLS/DSBUfduRrIJmvV9YuMAoLXfj3fJh2
         LWSaTR6clmoAAQFE3bgxjC79Z5dE/8JPVGC1TO/HTXADhx90wUO2D2ETufps+8yjCrjl
         Qtos/tV/2tRLaogaJ2/9R2z1HYr0UHIi2ilaNliaYawhgw5okUlV7EKJexpb4tmKNZxH
         GMvHSEAs3ZH5fKdUVh8AUjQ8XAadSbdgoOLneURc8qtFSH5vyLizl+q+k2ca17/F8lkw
         fEpb4KsUaFrruwsz/v3xPYfhFaPph5tPkFt8wRxZumRFuYmb2+tgeUNtKBzNSP0UfsUw
         aPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923529; x=1792528329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=BJw+Wf7S94qdNlxxaxiUGNkyWuvw4S8RY/s8jNLMyapCe1ptgqGONhU+38tQXg0aX+
         N1NsZYeVvwhuSd6e/6lrfkox1X39lMFOXWpxpnjVIkCNl0Zd3aonId9jJuNtzPXhBLHI
         7ptAwUWC9XzPEi0R+7mOFVF+M228ZVX8tRq+M5moI8F9+utSxMfqF/s6PWI6X4vatk78
         0kp4RC0fr7Bvyqy4Gbet131nlfs9+M1MhGuXMpHs4lYxAjfybZmWdG2XsGpRgACkcyFu
         3RlrmVZXRJ+Zl0jbejwWhKjAYWq0xG2+eMhHr5T59OV5AAgpveHb59vyGTD03uSBgqCW
         M1hA==
X-Forwarded-Encrypted: i=1; AKwUvBzgRPBKy51JuRXkscFczSTAJNj+uJEd4dDw07FgWHY9b+qnYJ3lxIUbDwr+F5+8nFRfV0WulFLevxgT31PSEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeE4/PTLOfgG2qEXtIFxKcv/GJg7xvXSJU4HdFYCFrLLoOM9pm
	RglxoKaoat0TiOWfeJr4uEZYdhDEcyPY/tDhQBEwV1VZrdy2hay60t0u
X-Gm-Gg: AYBFou0aj7SxcNNcxmaw7K48JuPzGvkFgPSRX+JBSZ+vrjbUvdo5lC/EBM6s76lps02
	CVOKL6zZ1QmwXuzvdPOVPkD+vm/wW4VfqLm4Jy838RiBQszt4xs/iEoY9lc3W+j+Itjbavqdo15
	ugc4+HVkxGLbk0tJqn0WE8VP0rYzOSFiQgL/tHcoNWSL7PcSqQP57ixWyZpRMQXVOU13mhLx1vB
	NNWh8/GzM8j5Eon5QY62qBE1STGCMCEG+rDU2BBSM4rInlKMTNXzxGz5mivHw8IPUNq+MU/3yqd
	I8l9AWg1sRBzKq/Sg00f0X6kJZq2oPmJRxBO7Uoy6IVxh961vnhY+Mc2cG6TO6AqpVBdyVenbUq
	egsWmujZ0vFxVNqr8h1CMnGMFrKOlW958OSiHVgfKOzRazImgfTpViQvzvGirKzGt8gZIvxdY5k
	en2/0AyzEijXPxsj5RzqnZKdP6Fqrv6rBU4fip1mDWFMzaSBIcHIPKscYuK01HblSWTg2jbYifr
	pSan16xAhYsVb1FxVq6e0hbR5BLtMl8AkFA/Fc5tCs+BAW6d6AfgYZCYCBwDZMHJPWEeejGmeow
	CVrShFhSiUoTjUQXIi3/LKeUuWUfWjL2X6CQUDjNMZu9Cmo+P/sYLt7lIj0fT4hmnxGF2lQtygg
	0eLaqiQ==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr279439145e9.20.1791923528844;
        Tue, 13 Oct 2026 13:32:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Tue, 13 Oct 2026 22:31:38 +0200
Message-Id: <20261013203140.31741-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target enables +v6 and emits instructions
that ARMv5 does not support. -Ctarget-cpu=arm926ej-s does not remove
+v6, while -Ctarget-feature=-v6 produces an unstable-feature warning.

Use armv5te-unknown-linux-gnueabi for CPU_32v5. It uses the Linux
soft-float EABI, requires strict alignment and declares 32-bit atomics.
Select it alongside -march so Rust and C follow the same CPU selection.
Kernels containing ARMv4 or ARMv4T CPUs remain excluded. CPU_32v5 also
covers ARM1020, for which C already uses -march=armv5te.

The kernel crate implements atomics through C helpers. The preceding
patch supplies the missing 2-byte xchg() on pre-ARMv6 CPUs.
core::sync::atomic remains unusable because LLVM lowers its operations
to __sync_* libcalls that the kernel does not provide. No in-tree code
uses them.

Tested the Rust samples, KUnit suites and doctests in QEMU versatilepb
with versatile_defconfig and on a Microchip SAM9X75 Curiosity board.

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 8 +++++++-
 arch/arm/Makefile                   | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index bdc42a24bf30..d6d1bef44c8f 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
+``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b5816f28783a..9275a85f95e9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && ARM_RUST_TARGET && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
@@ -172,6 +172,12 @@ config ARM
 	  Europe.  There is an ARM Linux project with a web page at
 	  <http://www.arm.linux.org.uk/>.
 
+# The CPU selections for which rustc has a matching target
+config ARM_RUST_TARGET
+	def_bool y
+	depends on (CPU_32v6K && !CPU_V6) || \
+		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
 	help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..168779e9e93d 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,6 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
+# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
+# the +v6 of the generic target, so older CPUs need their own target.
+rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
@@ -150,7 +155,7 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
-KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+KBUILD_RUSTFLAGS += --target=$(rust-target-y)
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)

