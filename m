Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853083B7760
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 05:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437878; cv=none; b=ps3UnZiWm6F6xQHAwSPYY/1a2dvrwH/M9BDF7EOoBxcWYpsS/PSqZ6Pr3wltoNOa6l0I4rRL9xXMD584aGlRkfqjWvN0o8XYFU+HhVYeiwoMXvJkJXCY64lUQ6Llj1JQtIloDy36Uj0ZFdXqp2KBhZ7xA9AXUQFQeQ294PseQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437878; c=relaxed/simple;
	bh=E+Z6phyE5KtVT1dh0BRUp8GniqmY3N7HTAQ1ZDrVxXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ixPsT5tzILVB84m6huZw/corqN0fx6LsigEpsIe11H136sNQwGkpUp+oFUfbVJ2Y279s1KfzHRrkHzNmiPr8hvPzwLnxOJoDrhA86anBaj2lEmseaOg3NccBTCLnbOGKYvsyaleIMOm2GUTCg5BkWXDi+ilo+SBkujVEAw+81Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoxW+9io; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoxW+9io"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2505456f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437875; x=1792042675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY5H8Ld+yTEStTJ845AFIVQiXLDAAM2/XkAD8HwKJ8I=;
        b=qoxW+9ioLaqKc7TtWCDQpoGQtZA6oNJZ329NByvU1jtZUxssnxl+vrgpNgmyd9C+P+
         a2b9teFBn8riaFmJH7UKdIR6ZQwi0z1UgyiLbAMQ1Q+Z5MIA//V/oojAhhspVoa/0qYc
         Aw1xpg6ADmko5Htp2WUWcQL5VL+hHGgpm+HjBarPVbF2iJTiRLQF3Zp0aFP7oVrAHXFd
         sNj8DryUzmQMb1LNtxQnar+A2kg8O8ucHbgnq3D6+0FhLa/Vl5HOvXuTSQIk9EB3AzWA
         UVV8awoJ9HNxpbcqTLVQMZsBKSYTDM8qoedt9tHsXOr4+XzC6mBeJDJBwgZbz49kHz0V
         /xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437875; x=1792042675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY5H8Ld+yTEStTJ845AFIVQiXLDAAM2/XkAD8HwKJ8I=;
        b=kmCsfs1jXxfe7ISTr/nGTSMSnsQ+2HEDSRwEeQHlT1GVWk7huEYRs90q7azjrdYKEJ
         w7xedPwHiP7ZrKh3Z8BMkm1Bk3OaT+EHgm672UthPBcI3bxqNGzHNT5Eht+8LtAJSNUF
         c0FBeBuXf26yAHP8ifLw6Ly7H6Yuqua5Pk4i6TdxkW8aDfVBq6R3QKVSJmVQkfgfLNJR
         hjybz45YE4UAsAqNtg0J1bXVaf9zEYVdglgiJ003WLlrf5hW4YBpySvOSgv+6Y+9DqOi
         kbAmmPnciv+Z/IKmxDVEs08+rNjUj6oydX6VgNAAXzQNp0YwbxOxPkJew4BQ5yW4ioxV
         MO6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwl7cU65oqNGem1RZCHILp48ASz1MQH9T4lDOEkaBUx76LrdvOsk61MSamx3KksT2szh9Heb902Srbyd/cBmQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIox1RtAgzp8MbZWH29OamGF8mMLya3J/5vlUX6KGPxVuYu5IU
	/1PTtwOcysrcbyzPTOQvxGHVLNnZ5hJu/nuy7YovW9w15+5YA4ww4sbV
X-Gm-Gg: AYBFou1fCictF+y+TfWSqEsjaCSDUux0+9KVhzg8AumiTxV1dN8VpdvxnQZg1eaTdpj
	4AqVFwwHagh+nTB9W+kn7bOOt2FWkacPApoewJsIdNLZ1hI5qGJXlicrQH/AeRm1jU9x9RYFaol
	/18dpKGYunRFAhVm9t4zwSsh0oZ8lpJ7dsl5cQBfDolyLDtpRXeOw1/j2ro1iaw9ICYsflB8clr
	tIbjisqXJaONIWkwCSkL3b9ZTDw69W8LZrJUUmHhtJhg3UI9d+UUArGYmNmJBQuqiznoiC521r0
	bNsLUkxaSjtvibPbAgiM7H71YVh2hIIce1H/mgOMFjSdOdFwnflIwFRjZFZQ/kRju4X7lz2pVHD
	rhauqHjsqwiwnWPx8vKRY5a2g61gOSuhQec+VT31IRhKeAWW7kbG5ohDLO9aNOB7q/kX9lmRROi
	ggKSN1KG47f9dJdhMTBCPFuAZq4eCsAM7I4tXzZa4ol0wzeoSg3PCHQA9Pab/E/EZRNxZ3DZXgN
	WZQfbOSqb9Gym+Qe54UJgjD3yBg3UmmVON5Ag7kxGEN0ukejWEpmirv1LBuSmUdNPuG5deH8+IF
	5rlhJa8em3VW7CloqbtJBPS/4d4F+AZDowhHjzTEDijvMb9RhDhL6eImjPrtWqoPH3LiRq/Y9/u
	+7oghSeg=
X-Received: by 2002:adf:f001:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48c72897157mr6171337f8f.54.1791437874320;
        Wed, 07 Oct 2026 22:37:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:53 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ARM: rust: Enable Rust support for ARMv4T, ARMv5TE and ARMv6K
Date: Thu,  8 Oct 2026 07:37:40 +0200
Message-Id: <20261008053746.49631-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust on 32-bit ARM is limited to kernels that contain an ARMv7 CPU.
This series extends it to ARMv6K-only, ARMv5TE and ARMv4T kernels.
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

ARMv6K has been tested in QEMU only.

Built-in Rust code ran on Thumb-2 kernels on the Pi 400 and in QEMU,
with both ARMv6 and ARMv7 Rust targets. Tested Rust modules failed with
"unsupported interworking call (ARM -> Thumb)", also on unpatched
v7.3-rc1. One open question is whether HAVE_RUST should exclude
THUMB2_KERNEL && MODULES or leave module loading to a follow-up.

I plan to submit the enablement patches through Russell's patch system
unless the ARM and Rust maintainers agree on another route.

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

