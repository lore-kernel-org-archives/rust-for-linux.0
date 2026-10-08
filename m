Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1A3BC68A
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437894; cv=none; b=VX4c3yx4ADXYKyyA7/Wepw6N22IHggRvdV+YXxhZJGs5FfsRMGaiaZ6RoHa4Fi6MiDj99RqUDLo6Dwgz636u9XFpGj8UZHvzMjF7HBSlNzPc0R3i9+Mmo5HFCIjgbb7aHi0czf+XIfPghA4WFCY/raEvgJQZXv3wkLuda2VxCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437894; c=relaxed/simple;
	bh=kSOdu2D/uPkkscs5ntFbdrqzzlXt7Gw83S0FPlHcMNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3WkgX2j04BlOch3DtuwszaJqs+HHp8/dM+H55D1I207+GzKTuRtl74lZbOGrapXrnrzc2ENguK2mgaRSf9UjWjN/Z1JDoiDMyFXtZNLC09ZgwEEj374QF2QcRXEh3E6MP3SubSILTCnypjeX7O8WzUmZkdFmpSwRzriLDb7W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/3lQRkg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/3lQRkg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so33873295e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 22:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437887; x=1792042687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=N/3lQRkgJlVGqQsrJNFpPj0dIZDnfqdtkgboXg3z0nfPvDxcFgqZ3r0x+/+8JH6Ymf
         I4pcOHr8AbLRI2Y4yXhTmR7QMXg3biaRd+kqupSlQul+KBtS+Tn988KyUnVm3EFMV5qD
         ohWs1n+rCXBMSYvXWaRzm/H+6lRngk3lW//2qh8Aq20Uviq9pHwm5iZE7wmk9Rtuog/T
         atOy7ePUOo30gGJql4U23v7B3BAJtzww00K3RXbm+nflbSbY95Ruf7RhtrV45nR5lXBB
         VdQB/yN4hvAoRWVg7ttRxEsa7Fj+F0HNOMboXs6FcUjmrogAd8SknKYK6QBRug60Q0eF
         uHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437887; x=1792042687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=e94dj3bGY23rVjXWiMP5VUBMX6YASZQf10f4crPvTs9Hc27CtqnOR+vFIRgMtmcXXe
         Zj0hBcw4gskpLdLikGSRVAhlGipW6WsgQAKtZsP5sOpsGt8ygbeG2SnWut17owvgTuYX
         xke8z91IUC3RZqKZGqOQznm9Dv8gMaCt6ruDSSo+1+1sE9ePHjvLhQGI/YPXsDxUFJAG
         epR7xKUQWi6BLMos/McoSX3EfQIwrJv+W0ko+HDW+B+NKtzu/KSVY7J9ctOeT/j8sJM/
         12ynbc5TW37tvDuJE/on7F8M/KjsF2RXPh3Cunmj33OhuWCx1qUkQHYjWt/i7Q+wQINp
         e7jA==
X-Forwarded-Encrypted: i=1; AKwUvBy7tx23E07oUeswkdgdvFxEaj1pcfhaxG/98j0n+QOJNvnhc1helgkWPn+Y4+u4Y6GlIMtsmQiMk0QBHl5vlg==@vger.kernel.org
X-Gm-Message-State: AFuF++nTY+PAbWd39gZQ2XSSnzYAvXmuuGZITL/2l+oUusMLM/LpPXNl
	labbSJNRi6n/Rqdc9m6/afYIXs+zmQZo79bbPjgSq7Ntu429xFjC3ShZ
X-Gm-Gg: AYBFou20+gBlmncFpBJiHmHobx0wUmIKE+R49wvmpCKl9CqktecKiFFt30i1qm037+b
	XF+6VyBromv+hR0yg7DMK7FtQdcluzIIjqlsYJlYWi25Qkbsp2miAqorUAH/jmTlG+mOslNm4H+
	FpdJhG0GnhPEokdnrGTv+1rfBFhC6pgJ2ZlRdBjqlrNlGJ5G7O08mYo4pPsK/4S/3Mel4g/pTfs
	xhecIZX4QH89zMH2gcf8aOPm2L0IYf5lulgwJ9MS0IQTffuBoYRuTWvhE+SRi0cV4e/F09up0df
	yrUVqz8Hne8HtLSBNwpST61/h7XVU2rZS1ZPViDsSI6CM4Jtkl4EiFSNmjfCVd1BhL7LRlMUkmf
	Bn9K+1TXEgl+eoNDSgXmRuoXIfU0/zK0kPbSinUztWgk5wHAT5dhd9Qe9wCKzPSmnBKVeihtEhe
	bH0Lk+L86GC7kowIo4XmBNsqCUZOmLQNKu6ujXXz0ZWRDHNM4CLLYP8ycOwD6YwpCOVIjQcZ8pH
	jK9qQ5BRth6+U4AH72W9Cj8wrUjvfOqpB2g64s87DtK2lrtWFYVkkX0F/OYKr9xdIuyBtbw8+rX
	DgeRPp4Qpo5uAdz+W/EEl/0mR6t7hXrU6f3KVXdIEg8LNVB9Hi+b0VsLxYQvrkL0rmUbrBSKk+X
	takpn9Nk=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a180649453mr74925515e9.14.1791437886819;
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
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
Subject: [PATCH v2 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Thu,  8 Oct 2026 07:37:46 +0200
Message-Id: <20261008053746.49631-7-kmehltretter@gmail.com>
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

The arm-unknown-linux-gnueabi target builds ARMv6 code. An ARMv7 kernel
gets that as well, because no CPU flags are passed to rustc. Its Rust
code cannot use movw/movt or any other ARMv7 instruction.

Use rustc's armv7-unknown-linux-gnueabi target when the kernel is built
with -march=armv7-a. It is ARMv7-A with the soft-float EABI and NEON
disabled. Unlike the generic target, it does not set +strict-align.
This allows unaligned word and halfword accesses, matching C code on
MMU-enabled ARMv7 kernels. A kernel that also contains an ARMv6K CPU
is built with -march=armv6k and keeps the generic target.

This builds the Rust code for the same architecture level as the C
code. In the tested Raspberry Pi 400 configuration, Rust text grows
by 1.9 %. Six small benchmarks range from 10 % shorter to 5 % longer
runtimes.

The generic target would turn a full memory barrier from
core::sync::atomic into the deprecated CP15 operation. The armv7 target
emits dmb. No kernel Rust code uses these atomics today, so this is not
a fix.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and
in QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules
load with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)

