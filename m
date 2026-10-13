Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2A54DACE
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923514; cv=none; b=HcyDCBqSRfHsxYvqnp75v+022+rukpRGsHEsx0nCHQZmBKH0NyWFsihtVTzuIx7K1Rm8Gh39U1AKn4qc/QtO6ulAE1Nee1l2Vmn2POVtjUAhhvgOgE1wYvQNKJ5uvVt/cyGGLhI+Xq0eGPDAz1nhRwlR7OkuIMkskzS77ec+xuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923514; c=relaxed/simple;
	bh=UgCffj0MEie889xroaqiA8aXOWlwDBGx7+dYNbaIx5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gWF5sN2lH1SWKRt5x7B5pgWzR3/uAYGPqHIdWp3+UEkmNMp9JDeBtLBzWNjSngDeLXdv2gl5VUcdddPXPRK8WpzDizhNB+9DMvF6GaLCWdp6mTKw4ortYT59iFs7YDVJPBhGLbak+IbCsM4jOdldjheU+cLho7l0850veFZgpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO+h3ZKB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO+h3ZKB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a061a13884so29480435e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923510; x=1792528310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=TO+h3ZKBrOYUXxJA7Qt2fuDcUyFxYohpWHXucAqjIWPToDSFqj62OPyHbMwvFIjVIZ
         PloZAPbhV5fIU3I4iZVGu1VENAXJMakO9WEr+QzAW4PpR2Aq0k5SbSOpcAmcbHVePT26
         RC0MvCazoisrI7xhBTgQB7/7Zbk217PV4mL+lwji1YI+nwwo85L5C5MHL0sklM8/nPHZ
         Q5Cph3UdSuuTeOfmKoJVMZlCdgeLzixz1tF8Ocf7+/i6U9UNBKnvio3IdTAZ3y+FZhcy
         ENJdAX2v3WK0H7RlkTwJTudqGUNNnq200k5Kxgs+va4C3cyw41QbCujFCehMGLZuXo5i
         ngFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923510; x=1792528310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=z/HQM2kmiLERKVO3UpP+WAtI7KU97r9gk2kTRWdkfNFz9GRo6W2qpIi0BlTDfgc15N
         aPMib8AjYv23XDM4RCiLX3q4MG1KoY/FFdBC4t8oTTWVNYSSpJ//H+3iVWK4nRbD9pzr
         8ZX6iMCihsJnpHaCsew6YN7MMi5D2JDG06nyOKn06hJY89joODU8poF+CH2O9ncHpLuY
         HHlsrEFDKVmPAfr/3ONJTcQP046MwnZhPRqn2WEzH5PtC1MwA1StVI75MMMTJfaje9NM
         kHkJEKpVS7GZPm8Vw2SAEAWSz5VrJb/Vr2VYdWcX/0Ks4ncBws/iYzmO+aOssbj98Jd2
         Bipg==
X-Forwarded-Encrypted: i=1; AKwUvBzxzvjrIQ0H+AXKsvNQVVlrHU8AUulqs5FeKsyDUcEvA/rTAX9HhZZucsZehbPUUv/V3toxIQ8FPNspvPO1mg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Fk3SSGWM5wdKXyHBdwW8+9vBa6Bnhnnt0fB/LLd//O6gK9bS
	LoyrX8c4l4Wvrk5VdyX20pa3xJRGPjMWKVw1VD9Vop51rHaFkJLrlkS+
X-Gm-Gg: AYBFou3Ic9I86qusY5rgMom+0a3j3D8OYEbA0xm5bR1Whey2Ve0ykO+YN5QRDDBPc9K
	xP5ec5IXmh27aeTj134OgdsJMixMxn+ZfzQaReSl8nMnE4mNQ7ZtQD8jF7O0snWQYkxulCwKjbP
	nxiy5l6NTG5q4ZvF10LpDqRfGpe1Ht44MnF3x832plJQrn0x7pNaY7FiRs0nYdlnbwnXYy5aSdL
	nrmP0GYs9ro00DzTJFvSlLlj5OW5dwdSW00QJZX9SgFLMl6CdY2seUnkC7eu3bbqaz3w7p4lObM
	1uyYXOJ+Z8R0BtMbN53NYbWCq5qBzjx2LElB2lsWUxRf+AeJZGuyuF1BM+8SoevZc/d64Ajpcum
	yJQ3SKpUEWUK/3Vlz0Py03gRxpXWsmw078fHmHIFOVqI5q3uGl0Y8tAq+xPyJqa+GvSMJIYhkUc
	J48lyJ+r/IFWbrbrxM/H3cmPC2i5dcoijaQWmI7FmQYS0BojH/YdHOhgWnn8QqfdD/Thu1Uzzvr
	ncFlv/LNE6iWwjzBozD1M/1lps/LDv4p5z99cFow0mtoqLvDR+OhS7OavthWfncbSY8r3rNJqRN
	4vJE5RhzORWRas1ydzyv2BzkE9hNJZPymwg/8H1XLulh11oYEXlNG7RipXTqJjnfBR+lagki8Q1
	G8+QbkQ==
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr246871355e9.23.1791923509703;
        Tue, 13 Oct 2026 13:31:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:48 -0700 (PDT)
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
Subject: [PATCH v3 0/6] ARM: rust: Enable Rust for ARMv4T/v5TE/v6K and change ARMv7 codegen
Date: Tue, 13 Oct 2026 22:31:34 +0200
Message-Id: <20261013203140.31741-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust on 32-bit ARM is limited to kernels that contain an ARMv7 CPU.
This series extends it to ARMv6K-only, ARMv5TE and ARMv4T kernels,
and gives ARMv7 kernels their own Rust target.
Based on v7.3-rc1.

Linus Walleij asked for older ARM cores during review of the ARMv7
support [1]. Christian Schrefl's earlier ARMv5 attempt [2] hit atomic
and ABI problems. The kernel crate now uses C atomic helpers, and the
*-linux-gnueabi targets used here keep the Linux EABI.

Patch 1 fixes a Rust build failure with gcc 8.1.0 and
CC_OPTIMIZE_FOR_SIZE on ARMv7, without the rest of this series. It can
be merged separately and is tagged for stable.

Patches 4 and 5 depend on patch 2 for 16-bit xchg() on pre-ARMv6 CPUs.
Patch 6 switches ARMv7 kernels to the ARMv7 Rust target and can be left
out. Combined ARMv6K and ARMv7 kernels keep the generic ARMv6 target.

Arnd suggested -Ctarget-cpu with arm-unknown-linux-gnueabi. Its explicit
+v6 remains in effect with -Ctarget-cpu=arm926ej-s, so libcore contains
ARMv6 instructions. Disabling +v6 produces ARMv5TE code but warns about
an unstable target feature. The ARMv4T and ARMv5TE targets also declare
32-bit atomics rather than 64-bit. The series selects the target next
to -march.

ARMv4 without Thumb, ARMv7-M and plain ARMv6 (ARM1136r0) stay excluded.

The Rust samples, Rust KUnit suites and doctests passed in the following
ARM-mode kernels on v7.3-rc1.

QEMU:

- ARMv4T: sx1 (OMAP310, ARM925T), omap1_defconfig, 360 doctests.
  CPU_DCACHE_WRITETHROUGH was disabled because QEMU does not implement
  the CP15 register it writes.
- ARMv5TE: versatilepb (ARM926EJ-S), versatile_defconfig, 355 doctests.
- ARMv6K: raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7,
  368 doctests.
- ARMv7: virt (Cortex-A15), 371 doctests. With clang 22.1.8, Rust
  modules also loaded, including the PCI and DMA samples on pci-testdev.

The ARMv4T, ARMv5TE and ARMv6K QEMU runs used these toolchains:

- clang 22.1.8, rustc 1.99.0, bindgen 0.73.2
- gcc 15.2.0, rustc 1.98.0, bindgen 0.72.1
- minimum LLVM 17.0.1, rustc 1.85.0, bindgen 0.71.1
- minimum gcc 8.1.0, binutils 2.30, rustc 1.85.0, bindgen 0.71.1

ARMv7 virt also passed with both minimum toolchains. No additional
toolchain requirement was found.

Hardware:

- Microchip SAM9X75 Curiosity (ARM926EJ-S), clang 22.1.8, 356 doctests.
  Tested with an ARMv5-only config and with at91_dt_defconfig, which is
  built for ARMv4T. Rust sample modules loaded and unloaded.
- Raspberry Pi 1 Model B+ Rev 1.2 (ARM1176JZF-S), bcm2835_defconfig
  without ARCH_MULTI_V7, clang 22.1.8, 368 doctests. Ten Rust modules
  loaded and unloaded. Misc ioctls, configfs, scoped debugfs and rnull
  I/O checks passed. The always-disabled KUnit selftest was skipped.
  No warnings or oopses in the test kernel.
- Raspberry Pi 400 (Cortex-A72), 32-bit LPAE kernel, 371 doctests.
  Both ARMv6 and ARMv7 Rust targets were tested with clang 22.1.8 and
  with gcc 8.1.0 at CC_OPTIMIZE_FOR_SIZE. With the ARMv7 target and both
  compilers, Rust sample modules loaded and unloaded. rnull read and
  write tests passed, and Rust cpufreq-dt switched between 600 MHz and
  1.8 GHz.

The optional panic QR renderer was disabled for the GCC build with the
ARMv7 Rust target. With rustc 1.85.0 and size optimization, its object
references __aeabi_uldivmod, which the ARM kernel does not provide.
An unpatched v7.3-rc1 QR object has the same reference.

Built-in Rust code ran on Thumb-2 kernels on the Pi 400 and in QEMU,
with both ARMv6 and ARMv7 Rust targets. Tested Rust modules failed with
"unsupported interworking call (ARM -> Thumb)", also on unpatched
v7.3-rc1. One open question is whether HAVE_RUST should exclude
THUMB2_KERNEL && MODULES or leave module loading to a follow-up.

I plan to submit the enablement patches through Russell's patch system
unless the ARM and Rust maintainers agree on another route.

Changes in v3:
- Shorten patch 1's commit message as requested by Gary and collect
  Gary's and Bradley's Reviewed-by tags. No code changes.
- Tighten the commit messages for patches 3-6. No code changes.
- Add Raspberry Pi 1 Model B+ hardware results for the full series.

Changes in v2:
- Select the rustc target next to -march and explain why -Ctarget-cpu
  on the generic target is not enough (Arnd).
- Add ARMv4T and ARMv6K-only support (Arnd).
- Add optional patch 6 for the ARMv7 Rust target (Arnd).
- Keep ARMv7-M and plain ARMv6 excluded (Arnd, Bradley).
- Test Thumb-2 kernels and document the Rust module failure (Arnd).
- Test gcc and the minimum tool versions (Miguel).
- Add patch 1 for the build failure found with gcc 8.1.0.
- Patch 2: unchanged code, collected Arnd's Acked-by and Reviewed-by
  tags from Linus Walleij and Bradley Morgan, and explained the plain
  ARMv6 exclusion (Arnd).
- Update the atomic-helper architecture lists and architecture table.

v2: https://lore.kernel.org/rust-for-linux/20261008053746.49631-1-kmehltretter@gmail.com/

v1: https://lore.kernel.org/rust-for-linux/20261003093827.77857-1-kmehltretter@gmail.com/

[1] https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/

Karl Mehltretter (6):
  ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
  ARM: rust: Enable Rust support for ARMv6K-only kernels
  ARM: rust: Enable Rust support for ARMv5TE
  ARM: rust: Enable Rust support for ARMv4T
  ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels

 Documentation/rust/arch-support.rst |  8 ++++----
 arch/arm/Kconfig                    |  8 +++++++-
 arch/arm/Makefile                   | 10 +++++++++-
 arch/arm/include/asm/cmpxchg.h      | 26 +++++++++++++++++---------
 rust/helpers/atomic_ext.c           |  4 ++--
 5 files changed, 39 insertions(+), 17 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)

