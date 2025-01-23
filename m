Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7395D1CDA3F;
	Thu, 23 Jan 2025 22:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672014; cv=none; b=ulbVY9bPE4DnycCvMG8oJY/JgFO1mzd5pUXmapGMw/41KO+qmOXqPV0YhxFc/tsVajqwWaWQbVWQ0iM01vH5gRyzrx4c3vzZQ3IvYd07pZabi/evtf+Jf+DR25EhESykPu7GzOpXjFYWCGrLpTsjhrsi3q+SNMFO4QK1RFImarM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672014; c=relaxed/simple;
	bh=V/W/svs/p7WIzfoHkEUJoBxM4iBLCH0hgMoeQV/nLq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBb2UcPIOGoYezIItSYEiVW75gqOAJPCLrDKTBMDB/y8n/pV+CUheX1H/107PPGTSLNB6jYAGzSyJJH5AGgxlk3caZZwWxjbcuBA3c4TKQsEr5r9iQr0DcWKwzw4arkRjQh6Dh6hETbD/37nZs8Ws4Vbi8Gbf6eGQrJwMZy7/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nuc//Kso; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nuc//Kso"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1383956f8f.1;
        Thu, 23 Jan 2025 14:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737672011; x=1738276811; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpOgM1ZE1WoM2Lmj2fTpr8OCKz6dZVRt8SvhNOfjHns=;
        b=Nuc//Kso9t24fxQE+X0QSTsqMWtcvW87pMtjT+OdpUBakZt2kVTKRYG0wuOmnI0Zd9
         iRZyLXTlBQ675QXN8QywSUoPBhmUgiHRyrcv9RujqxOxdLZVW1H63rfVIsONObOHKS21
         zM5Dh10vo341sk/WWvRwB5P8BtxpyjGV/n1S+Kw8EFY6azCDUzJA8nqjxMtAqgBRObE3
         6BCXTBv2nUsfgWLeBq7UwMFOLpHT20+oYJmGlMsOE9K0xcWTZFRnTmjG5TyCtbnObSaH
         Uy8cJ2VJMkb2UcZ22VNJWlzL4K8wuVYcr2+ssfpuAeU2K0uQhbnUb0EtdAyhlc6Wy6L1
         k7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737672011; x=1738276811;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpOgM1ZE1WoM2Lmj2fTpr8OCKz6dZVRt8SvhNOfjHns=;
        b=SKNH7M7d+Smi/X4s4pzSD6wrHlmGdq3QpxYXn/++7D27+iWBDCLQ//nkoUDfDOQ+u5
         26hWfXL2fTooFcIAkmm5Ot8KdyPBxbvx1NkWdULwUr+a5QoYHpeJBO1/0C0z3SietpBU
         +hJHZZPE4oYll63ViTgNcpajZOqcdLLPW9KMabrsE15cbNvljr7rSFpF/jiXD7sGkojw
         owty1nRGdlyirVwkvxmcVUqaWMO5kX5I2XtRST2zZcz/uCvG4ZEw8EJ6hBkjOziPwutH
         VhVAZ4c7udk95zydclsdHEAYnOfrLlNwO1XXHsVHV+s13m1/ZuiaK44wztCRW46dLyOz
         UEww==
X-Forwarded-Encrypted: i=1; AJvYcCURePgY9Ef4XWGdSyP2VGg8R88IpfhiojtQwrg/OOKTuT3P50t2lsV9ylQG0mX1ma4+sbnUBwjt6QpYcDJL@vger.kernel.org, AJvYcCWcwmWMZWO2z8YeiceNM8eReObbI47hYNbKyJRe87O88miGVIIudQV0w8fK7C6paIyrDWs70HJca0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIKOJ1Qp1vwZTD7VdrKvLZIg3WS2Efw74bCZGrBf8qVhkRb5l
	8lFTlybCqlEUtn83PpZtVwjmGJongRg6HXywboa0xgYbyCyw5pvI
X-Gm-Gg: ASbGncsfOf7PfoJBC7f2MH93E2u5hNjkQdh0GP0VTizl2/J7pZWk3eHhxU/89Ve1dbq
	p76nMMrvs9qyJbg5Tl6r+MWl4uGCq0bm6tJaiZCe4Mj1XBEwOlIvJH5HlPxmBUMuo1LN2H/DAnJ
	U8JKeqCykMq7FDesXLhZjGaGU902J5zycq0U1TYN35CU6z0em7xP6ZbC3YimDP36CO0qNJpAUyq
	8d6Djh8mLXalduza/LYIoTA/uGh2Sqya7QpEF/lFfgWLcydNZ7h8rc623wQo4P81HPM4SqikdzP
	iQQ=
X-Google-Smtp-Source: AGHT+IFl7F961mwND8EifRVPoDNvLg6XuLzQ+c9+gtx8iFzXlkCo9ZHl4laxPVi7MFV+qKlriw7EOw==
X-Received: by 2002:a5d:58d1:0:b0:385:e394:37ed with SMTP id ffacd0b85a97d-38bf5659cd5mr20605391f8f.18.1737672010472;
        Thu, 23 Jan 2025 14:40:10 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c2a18931esm894942f8f.60.2025.01.23.14.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 14:40:10 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Thu, 23 Jan 2025 23:40:06 +0100
Subject: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEXFkmcC/02MywrDIBBFfyW47hR1jJqu+h+lC5+JkEfRElpC/
 r0mq24GznDP2UgJOYVCbs1GclhTSctcAS8NcYOZ+wDJVyac8pYyjpDjCCZPyCF2iCiYkCgVqft
 XDjF9ztbjWXlI5b3k75le2fElItDYdtV1yjoQWmnQkjtgTEtng/OK+Xs/mTRe3TKRo7Ly0+Tee
 iY6BvV4EAIddJpyUK3S0kiDVuG/ue/7D5zZa5vcAAAA
X-Change-ID: 20250123-rfl-arm32-f93334146367
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>, 
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737672009; l=7124;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=V/W/svs/p7WIzfoHkEUJoBxM4iBLCH0hgMoeQV/nLq0=;
 b=nhIktXdUhMTMuFdU4a6+ZC+2WOt389PL8u+sa9n9rI7AM3FVBZIfxJxvEY9hrmzTjFqfYS1Db
 s+lHbwwtBLLBok+oWdRIIxShhi6vrMKJ63LH/LEk8lsKoYvqyu0DHQu
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This commit allows building ARMv7 kernels with Rust support.

The rust core library expects some __eabi_... functions
that are not implemented in the kernel.
Those functions are some float operations and __aeabi_uldivmod.
For now those are implemented with define_panicking_intrinsics!.

This is based on the code by Sven Van Asbroeck from the original
rust branch and inspired by the AArch version by Jamie Cunliffe.

I have tested the rust samples and a custom simple MMIO module
on hardware (De1SoC FPGA + Arm A9 CPU).

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
I've updated my Rust ARMv7 patches. 
Not much has changed since v2 but I want to send it out again
before sending it to Russell's ARM patch tracker, since I should
hopefully have more time to work on this again.

I'm not sure how exactly the patch tracker works, I assume I
should just sent it to the tracker once all review comments are 
addressed and it has sat in the mailing list for some time? 

I've kept the Tags from v2 since nothing signifficant has changed,
I hope thats fine with everyone.
---
Changes in v3:
- Rebased ontop of v6.13
    Removing the rust/bindgen_parameters changes which are
    already in 732cd686cdd6 (rust: fix `ARCH_SLAB_MINALIGN` multiple
    definition error) 
- Link to v2: https://lore.kernel.org/r/2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com

Changes in v2:
- Removed unrelated whitespace change.
- Added target name to panic message in scripts/generate_rust_target.rs.
- Fixed the comment in rust/bindgen_parameters.
- Link to v1: https://lore.kernel.org/r/4e0f5932-c7bc-4878-862c-1186cbecd71d@gmail.com
---
 Documentation/rust/arch-support.rst |  1 +
 arch/arm/Kconfig                    |  1 +
 arch/arm/Makefile                   |  1 +
 rust/Makefile                       |  8 ++++++++
 rust/compiler_builtins.rs           | 24 ++++++++++++++++++++++++
 scripts/generate_rust_target.rs     |  4 +++-
 6 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 54be7ddf3e57a732dbbca85541b137c62e834d7d..6e6a515d08991a130a8e79dc4ad7ad09da244020 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
+``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -130,6 +130,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 00ca7886b18efe2d01f33bc079eda2483ec807a7..4808d3ed98e42d39afc676f2654381f288d1b5b7 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -150,6 +150,7 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
 
 CHECKFLAGS	+= -D__arm__
 
diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d603836e0ec9b42a1285916b60e45..71932a088c860b9a129b9fe06811f67f5771b984 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -243,6 +243,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,
@@ -394,6 +395,13 @@ redirect-intrinsics = \
 	__muloti4 __multi3 \
 	__udivmodti4 __udivti3 __umodti3
 
+ifdef CONFIG_ARM
+	# Add eabi initrinsics for ARM 32-bit
+	redirect-intrinsics += \
+		__aeabi_fadd __aeabi_fmul __aeabi_fcmpeq __aeabi_fcmple __aeabi_fcmplt __aeabi_fcmpun \
+		__aeabi_dadd __aeabi_dmul __aeabi_dcmple __aeabi_dcmplt __aeabi_dcmpun \
+		__aeabi_uldivmod
+endif
 ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 	# These intrinsics are defined for ARM64 and RISCV64
 	redirect-intrinsics += \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index f14b8d7caf89964198313deace1bcb06fea82964..dd16c1dc899cbc755630ef3bae71e6eb0fd2c62a 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -73,5 +73,29 @@ pub extern "C" fn $ident() {
     __umodti3,
 });
 
+#[cfg(target_arch = "arm")]
+define_panicking_intrinsics!("`f32` should not be used", {
+    __aeabi_fadd,
+    __aeabi_fmul,
+    __aeabi_fcmpeq,
+    __aeabi_fcmple,
+    __aeabi_fcmplt,
+    __aeabi_fcmpun,
+});
+
+#[cfg(target_arch = "arm")]
+define_panicking_intrinsics!("`f64` should not be used", {
+    __aeabi_dadd,
+    __aeabi_dmul,
+    __aeabi_dcmple,
+    __aeabi_dcmplt,
+    __aeabi_dcmpun,
+});
+
+#[cfg(target_arch = "arm")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __aeabi_uldivmod,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 0d00ac3723b5e5971acb47478d6c2a63bc4ed6c6..f8e7fb38bf160ab35c9331a732fcd2fe4023fead 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -172,7 +172,9 @@ fn main() {
     let mut ts = TargetSpec::new();
 
     // `llvm-target`s are taken from `scripts/Makefile.clang`.
-    if cfg.has("ARM64") {
+    if cfg.has("ARM") {
+        panic!("arm uses the builtin rustc target");
+    } else if cfg.has("ARM64") {
         panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
     } else if cfg.has("RISCV") {
         if cfg.has("64BIT") {

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250123-rfl-arm32-f93334146367

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

