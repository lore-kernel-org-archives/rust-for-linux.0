Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183553B7760
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437892; cv=none; b=a1696AHkE+ypbYfb5+dUVlMMtxmWGmrsRUMyN2oALtfjOHcfc/QdjvhIVKnvXZtuJTmU02SswqwNvh1DZl/A+5yC7w/WpaFB6EILfM8TToYMQIQjPq9sQNyI6xZO2tsQh5eK22oHcci8UZcys3bpIhZOdGCehKKmD5oSCsJ9Dw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437892; c=relaxed/simple;
	bh=x/su43TmMUkJUZgcKoaIOqCX48ZiVCOwVIkzl9S0tHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A4gwZ40bGr/2jeKcYY1/feUSYDAMmrPKCWCESSORUf75kaKJ6SOuNzuGZhy3RDSyHjdo/5G6U/7Nq7NBJmcML5p96x+HAmMEgGAUok2ut/eMlZoKn0QPqNZ8M7IUdpQnbvQ2QRkux0MSrTmBOQWQVae0lCy1CzJf7LrYzJM/K54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k86O6mrY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k86O6mrY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e73611928so1862865e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437886; x=1792042686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=k86O6mrYJxPbqs80UKEmXbnLLtqJAAeppIwRigL3YPON7xRXHXyHvR6Qu/vDM/E9hs
         GBgNXTVZTEAC7USpfBu4nbioh3N/HEKNm6Wj+OQvBFLFqDrKwQFmL9oeYJhbbztDRUUg
         O5ilFk+MkXW0rPEzDld5UfjkKE4DumHlKFRzdfdSFVJzcxzE+0FHJV4slyhpIo9Vzsdf
         q1Ck5tllaGKkUV60cRgcjGGpeJOGyzbBh1kx3UGtk9OLKTW7UkY/1ZXP+zxNJXmXB704
         7WUbWTCmFNhB/Vol9o/hLDKPlls3hyDLtWFx1kWvOjFj2fTIc+QuHe4WK5F1cst9xG6T
         dPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437886; x=1792042686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=VRr9/jr4/n4m923x6G3gQL4Va+oAHmB4oemd6PpX6Y/fsUpuGGpoaUkHjfAD1Lqlry
         f/6Ak+m3LGaw/wx+vH5VhUtLvFDL9BxcqlaZ4+ROmfCj2ifm4N4zgnAZDutO2w50rM03
         r0gJm3wde0Ks3ZKHc8wM1s2F30PZZ5cuFV7rgNLhBtectIFp7Ux/08MqwG0bqsqUZ8ZF
         uRtW1xSDRjBlMY2HpH1gU1rBHt3QLv/gkhdV2u07DWSD8kgXEs5oOiEO5LZ9AkGq2AKi
         eg0pVCZqpCNXVuDO25CSkTEOoUs9k1WbUQ1LUQXkFUASgr3AHix5pXYXP720GW5C5HYO
         s/gA==
X-Forwarded-Encrypted: i=1; AKwUvBzgxIsF50tGTgGN0lvr0ZOdzApyhr3HOplAAIdCQBBOZI27xMB2kNXHGPQoowXBBWgVen3/L0VyC0zWbDB/Fg==@vger.kernel.org
X-Gm-Message-State: AFuF++naK8B3yItJvC/5BLUn5yu4pL+I+0w5edAq+QQlmcaOcNkbjdGA
	QURW3I4KtZ8HXJqsrJyJnXIUQmi0W6wepqa/PVT37tVLjHW8wAYdRXdg
X-Gm-Gg: AYBFou1uYGLvfT5VKJALP5zSE4jRri0quHONf/vRH9PacYoXaoDjAxV223IMuvLRrwg
	z1nh3Y5RQ27gK8AYIs8fH+2mf2AogSVkB/uaaz0XJTS6phyOSq35riytBhulkl3XfpOD/hDTHO4
	AOjwFTrDMg883gzSY+OwzKnBCaCTyRoo65FmN9tnRIDsajmprio7sd6Y1ri79vC9qKGebpgnnsc
	Ijcps0mq7L1cfzQjihuLvJ0YcGwijZS01x/CXy816z0OmcHQnG24ffCEOQ6IlM1ZpOqgiQleUXl
	PalDjmJCZaB++EjwZ908O7URZnMd1RnbmTBr4uR/yTgO2m03QWrHjD3UQRvcKfoYsSQRh/f0MZQ
	Q4k8rM2lrZ1Ehgyg5h/mznRDOt7i2vw7+YZHzz5cZplppA0L+OZYYHdgZAtegDlsApTkC7fMqWd
	T06CSmud6Aybp94ZTpykoZy4QeZKA8hPqFueHWboLWcJ6n9zPAAPCA/epe/rmwc5nY1p+V6quRZ
	jDpTdZNGYaL2WSYpvnW4ZbShHTifWetoKM3a0sQP53I8tfNqv8t17fENSi/FN3+2lq6pYXyXIB0
	8xHDxzIT+QJfbyJoTcZrbb1wq9xYu6mEIszxZDloCItFb6XZCXOhJQd2FgeWMQY4vAFcxSmw8B7
	swI56qVU=
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr26848495e9.9.1791437884887;
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Thu,  8 Oct 2026 07:37:45 +0200
Message-Id: <20261008053746.49631-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
contain an ARMv4T CPU are excluded from Rust for that reason.

Nothing else in the Rust code depends on ARMv5. Use rustc's
armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
ARMv4T.

ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
target for it.

Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
samples, all Rust KUnit suites and the doctests pass with the current
and with the minimum tool versions.

at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
That kernel passes the same tests on a Microchip SAM9X75 Curiosity
board (ARM926EJ-S).

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)

