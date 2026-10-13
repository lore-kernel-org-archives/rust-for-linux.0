Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22495522EEF
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923542; cv=none; b=k4i1Z7jt1wrX8umUyPpK/F+wXhQ3nGu9S9nxuw0DnrXolJa1iOkuyWW/v5k3rn7yyNdsSYwYzKOTv6Zjuid+lnaNVdQ4bK42lDRfK1Txhsh6/GXfyP1yh2cqTcT1xV7V3LWjc3NA5riGlaJsHkF+x9PWmVS1/UClNzONonvQYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923542; c=relaxed/simple;
	bh=f7ap597eqe9kIeMvfJIQIfj+KMtkVG+gOZihvU7+3hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bg98vbfPcDPIKZMQKbJzzLrsAYiYJ+zBxJ2xknohQ8dwiU7jgLS8Yc6G7SrZB2fa5txZyk1pZMuCbc/8ZsTYqeDIWV18FwmthjEnOtvY6BAvnWdionNj21SA+LNK0YxSXWS4Wc1jIVp5/omsmp4t/HGkYiBfTeUb9jSwdl0XuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3uh9Xmk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3uh9Xmk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso2078955e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923537; x=1792528337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=J3uh9XmkboTkSVQEwa0GJBx4qTtgEsxRgiHuWu/vP5lB3aOcMRCyn/kQwblM43fAe3
         XCA2or6PIXAB+tbILkZaKmBW30LWf+m2NpdUHgwC59jlla6rLdQ739gZ9+JoSd/52qEp
         79ZeDW0lzaTGsW/0rWZ3N81WvLwOiMUgCA2/obwQ05jBUM0VxMxAQI+1XeNAAm8ZJUii
         tiFjmd9yDhbphhPrut0BzcNwVfGJccPKGTaNoy3QDtHRXXSe6O/Ft9zTvidx8I8iwLtJ
         Q6YKIp0A98tp9bQgkcScZArClrSvvFRB5/7Hrt4CWB3gUKu3u5pRpW1yf+ghhPsqUAgz
         a6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923537; x=1792528337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=EatHwwqDUppHtUUIA7cwfnG9CPaBfO1ahyZCk6nrM8SfXqsV8Iuo3HMQt9inIjZ4Xl
         RMEZdZ88aqgW0aADlep/0c6Zco+DdYIRmUpFIiLY7dXCmhFu9LvkyNsHbDhVFrdIq4lv
         1JwReXgdPVbj3wURSSpbCNbqJw1UXgJd9xmDoctmxv0/b9GqcdN/3Xh7e8sPvJAPvQEl
         1dmXzgHcokpvGKwQkVj+EqtTiNVBcPg5Y4jSbg4obqsVvtis68jLnefgOsvu/87RYZbR
         YHQlDae/NA4gOm0ClERPNjpvya7hsiy1cv5hFzH2KMJ/JrHw/4SMF4uDZ0dCRleA18df
         ZPcQ==
X-Forwarded-Encrypted: i=1; AKwUvByfSduCFF5L5nDLG7ANjuVOPOTCHcg3t9Mxv0V+/de5qw9GIXRoKHOeeZskxS4o6IzMjOu0T5vtbw9Gn+GBVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLLAKaqZqJVP7s+vmuYfZ7BCwtBCXRENyv6aNKhBRQUZnLevkD
	dxay2ZjtjuTMq/+jdbwrSWgtiUC7k81EgcYD6vLzENFGTctmgCV7WZW1
X-Gm-Gg: AYBFou2dSIGDF0tj/RTeXCggxXKcdyYHMH/ZwUog390onfFnluac0m6llehf9F3WRnu
	rld3Ebi3p0RGtCYp1luxUdiTlga/U+Qm0iCJ9beVgL8SkK+r4HqA9gsJRRgSPfy3ZV4NmW5Hys+
	wF2WLg0eBsd4aSJUb87U73JTY9jM2GuAoEtT+pBa+evQKTFMLmXxbkxrmgRH7bPi6Mm1dwsfxnb
	pRQarnW3w9wFvj4kStjKXNGQXgtA8N8HDClLjF1dO2ilRCaphQheTQrPphD3wewzcMJDVtJu8s/
	7f9G2Fo2t5b7T703VUIkndeZfV/tHiheRNYLIfUfUb8q9CiyEdFtjerRZV1vi0+RZD289uXQ9gs
	OnwkQ20ITCVwswnsPq7n5p+dX6eyFz+JhwjNQmFp+85AYGkQu3m5KsJj4TZf1srVuohGvOc8LRm
	MotUwka+lHiBcLA+p/EoAdcx39dO9t8rlHO2gdRFcKWQMcPbQR5VHAoZzwoBWmIO0kEa934Y9Bq
	+CvFDAvge/5XdDJCcyJF8gl5gfN4M5y/fBGyIPK4vOFKUjRFEmWJJQqpECQ0RvaJS5OYlWk3FSJ
	YsEMfZmWDl337myKHQbpo1TRi/3WHtrehyYyatsReESRRFmAIdpiVusoHCt8DNvKZSrIgQFFoMG
	Oqf8CQA==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr72732765e9.33.1791923537100;
        Tue, 13 Oct 2026 13:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:12 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Tue, 13 Oct 2026 22:31:39 +0200
Message-Id: <20261013203140.31741-6-kmehltretter@gmail.com>
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

The armv5te target emits clz and blx, which ARMv4T lacks. Use rustc's
armv4t-unknown-linux-gnueabi target for CPU_32v4T. A combined ARMv4T and
ARMv5 kernel then uses ARMv4T code for both C and Rust.

Plain ARMv4 remains excluded because rustc has no matching Linux target.
This also depends on the preceding 16-bit xchg() support for pre-ARMv6
CPUs.

Tested the Rust samples, KUnit suites and doctests in QEMU sx1 (ARM925T)
with omap1_defconfig and on a Microchip SAM9X75 Curiosity board with
at91_dt_defconfig.

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

