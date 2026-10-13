Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688254EED7
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923527; cv=none; b=bNyLtjxElZ75/15ADiIRnHnfeSN8pqvYHkhv+WxkkFIKaY65S956APFzGDI0DJQ8k6bTBQOpmtdTbaAFD7GwUdb1dErr21jcOx0Gi7lPO+i8rXNhnmTTK3jXLiy9cf7qRrVR03BpLX8Z3FyP9K8AVX+5twtvz2efaxtS5SWdrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923527; c=relaxed/simple;
	bh=Rx7kIxbLHXdF9I2gk45fdOzTLtgLKhJVtVTgxKv7ILs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WZdy9S48TKJQx77DHRahLKoBBmPFS+GcGr/5hNxRNS+U/IOM1mhfFMoy4LQIpFgqCi1IWfoZtSHm8frGUAfgi5Pw+Gk+WvuKlIOD8d8wbyHS+5Sl5S7EbU8xHB6nzuNlkWUvWZwimu///MmleWjZeRc5T59gDPiQ6W/vfDPB9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1HVjYer; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1HVjYer"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02718da81so27260655e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923521; x=1792528321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=o1HVjYer1A2FTOkZUN0Q9/m/f//XSkyGE6ST1wfuC+MoJwjKOtvgwDLQ03dcOX9MOg
         k5aiIs3MI809k64svOsgnbbttcxwmbmjwyjM4Um5UQyoYpYeSjqvEvRfD+V3LJr/UHAi
         U8MoDt4CSV2gsSaxRsKNHd4IH01FAg+R4x0cEe6Jxzby8SGVPJh8lqET0Fk6jn97I0+t
         O6hk04krPWrXWZ1eTrvbv7qGUGb2M/mlRtjJ6agOEMQ0fpANtxx8NFRCGPDOqDg8zl6o
         f6WcZGWTAnq9CShXnTWuMrjtOINNJZARZrxue2g8ri89EBm4H9TZkvakSij+fXy0w74M
         Q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923521; x=1792528321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=UY4qtzvv90d2e6d+mTxrFrmPmzTC+MupJapZCQEd3BOk+TDvkmYgfEZhKEDoympO5p
         856hNBgi8xoch18i/OmoY1oQVDu+rfMN6dsEodTqZYornMFbYd0RToQ2xxzMqEB8rjcu
         xDE0swKDFEBY9DhO6GWRPQcUuyk+lZyY4w1EqQeUUhdt3wTzskJdqC9uXyxsZrmo1Ktc
         mvGZRomiZucn/Nfws9Ul642x7xeceQGFx/tFWy7ha1AoN6E6Tv3xq1GwPUT4V+YC3A+x
         yDEtLuUhMh3b586PuEgICZj1GOwqnd1kr7Et4kyzIMM8bW5ApkJKABLaBgA3402CeFxM
         jjWA==
X-Forwarded-Encrypted: i=1; AKwUvBxxVdaCgQILHqqY2smiTDsnQFKEINOXgyG7v+RTqdEftmAf0Dk8uH+OF7XVHxPxNMFIMKc7H+Lr3HHPLR7F2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKp8PSgQkDT6QRhZaiwNefSj6CPwg6i1FflDbalJT5dS0GInwEM
	kH6nL3+nLEuAaQI0jXeyNpRGRAW0mZp5BsodRz5Sy2GECwC8wGoNpTK8
X-Gm-Gg: AYBFou3o3xt4al24fG9WPpZwua/zrssD14KTNVag029WTSrWK9IWi/KP8vhY5rIfZr6
	2KdvucCVGglngHxh734qiHsa48CMTP/9AlgBwNF9gGCFoOQx22HFgQAiTcUllPq6NjVeuitRTZ7
	CyNUZZddc0pFdLASnCWJiguiKVZO78TJ7NVWBk/3moQ65wBTiClgI1s2BXo5MvFeK+GydvCSmWF
	Esw5GOCDL0RpvCaEy5Xc7hJagnxYWEDdDaZZbOQPkyHhiM7APCfyY2sh1y8NjgH16t1TyhtwvB6
	3X9PDKFm1iwsGK0WjI3EG5e0OSN9Ttj8huRkrH2rY0t8xPZQ20NmOVZSnZ+lV1UdqjG+JnysWRC
	1QUL1WDEbwfa4IHqo9XqnSjniWimpJxJwCYS6Ks2giEjAZhyCUNvcf7Chnddr3xfTujKB6lyVvp
	3vMqEpAFrmoyvhGmPvxoxIfIDhJbHvszbxt6PHG/5DqyUyAXLsjuMcHLTGc5/+4bsoaiojrP6dU
	NOlAx06CUz5mT8B824J8xzGK/wWuNnHllDxmOvLxV7SQ5zOqRrGXFrB97r4aNGQGwER17QDy/Bf
	io3hlzu7soVXLAZxGtdUOBAE/fRygD+w6eJk20Twl4Z3miwi9TDdOhzIjxrbK+EWTQofFirGM31
	rgKsauw==
X-Received: by 2002:a05:600c:524d:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a18e4a95c2mr270482865e9.12.1791923520806;
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
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
Subject: [PATCH v3 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Tue, 13 Oct 2026 22:31:37 +0200
Message-Id: <20261013203140.31741-4-kmehltretter@gmail.com>
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

HAVE_RUST currently requires CPU_32v7, excluding ARMv6K-only kernels
even though arm-unknown-linux-gnueabi already builds ARMv6 code.

Select HAVE_RUST for CPU_32v6K. CPU_V7 selects CPU_32v6K, so ARMv7
remains covered.

Keep plain ARMv6 (CPU_V6, ARM1136r0) excluded. It lacks 1- and 2-byte
xchg() and 2-byte cmpxchg(), which the Rust atomic helpers need. The old
condition exposes Rust on combined CPU_V6 and ARMv7 kernels, which do
not link.

Tested the Rust samples, KUnit suites and doctests in QEMU raspi0
(ARM1176) with bcm2835_defconfig without ARCH_MULTI_V7.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested the full six-patch series on a Raspberry Pi 1 Model B+
Rev 1.2 (ARM1176JZF-S), with bcm2835_defconfig without ARCH_MULTI_V7,
clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.

All 368 doctests and the Rust KUnit suites passed. The intentionally
disabled KUnit selftest was skipped. Ten Rust modules loaded and
unloaded. Misc ioctls, configfs, scoped debugfs and rnull read/write
checks passed. No warnings or oopses in the test kernel.

 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 rust/helpers/atomic_ext.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..bdc42a24bf30 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..b5816f28783a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c267d5190529..1d157df29229 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -42,7 +42,7 @@ GEN_READ_SET_HELPERS(ptr, const void *)
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding xchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_XCHG_HELPER(tname, type, suffix)					\
@@ -66,7 +66,7 @@ GEN_XCHG_HELPERS(ptr, const void *)
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding try_cmpxchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
-- 
2.39.5 (Apple Git-154)

