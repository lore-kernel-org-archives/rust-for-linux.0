Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3C1DED49;
	Sat, 25 Apr 2026 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777088556; cv=none; b=dcLEUXIWCpVPufpMV4HDVphRlVF33bt85B+MKGIA7lKuIwfZp0nTatwkQoW690+w+U2KScquSc9J5tH2gldXNVUhRt+MmWzYVg3Y+uugbBcvoSRyjeEJZxB4FLSlHfifzXsQPi8tXQymPlu+fH03R0pAc+wnBZheNBU0tougpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777088556; c=relaxed/simple;
	bh=G/zToooWqj7mh84RSSASjaLKt8CwDepv7//5sF8bZ5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELyfpnkaQPTMK32LuLDukNkOqsKTwdLCwKiqUOjwRarHfIfDwAr3tcnjt1JfjN8kinp0MxyQHRK8xQ7aSO4nIHA3gm265y6xQoIxl7Nfs9mxW3LpHMAaBZQ/fR4XuWtABBGaTv6R5kCLbt2Eaf0G06WXWl1kPr30UJm/63hIMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=FG14c7MB; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=IYc/LXRU; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="FG14c7MB";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="IYc/LXRU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088546;
	bh=G/zToooWqj7mh84RSSASjaLKt8CwDepv7//5sF8bZ5g=;
	h=From:To:Cc:Subject:Date:From;
	b=FG14c7MBjTPD6Q0ZAfE9AdiJeuPPUXfKFoo/mXIFWnaLn3X0tFN1/OCosV+7LxYnX
	 5o08gBVHw4g0ViOJuA7R6IjQQElCnzHDc34GGKZdCCEqvzYTEU+8Q9Tm2jfxsOaPNd
	 QvCrcVioGB4QESn50zkUrMckJNbpwrQyt65DagXh450HrOPFU3XW+ql6ezg4OdxCPP
	 1Iw4ykm0/cL1OIWpltoIJMKkoYrkIf04ossZTFg38EjFQ76u1p0IY3AZ7Zvdv5lLjC
	 D61xeglt3OtfqHoCbFEmfbJaMV7GFbmbb8+iRURbCkgQ/b3O+UJe1gtmnMZfa+8DgF
	 kKa5YnKDoUyKC/FkjAcCzqHt06vBx6+Ge1Gmt8eihE/wYwo8ULwu5hAlUeuDtUkCGx
	 9QDG49ORmyyuDBsSxcHnZYKotHSeaZx0eIMRRZebpHfaZDArWvO5gbQdG9x/zmnw1B
	 ZvXy8aH76uhQIUi734lVJtJ/hYCzIY2zSOonEeXOCPhWIkIFhELjtBZWbDGl553mZh
	 Q7y9irYvxn3azvu8Glt314kcUuFYnmpN48HHhbrZ2peTepMJjaNYSTFLsLkFeZVukW
	 qzNyGd5ZmsNkj1S/5TmXbDfQvIPikz8z9gwZfuRjJb7AQuEEnTWJj52R4pOHd3Vx/5
	 orgp310/GH0ptow+9QKscw/Q=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 0D7241E8F14; Sat, 25 Apr 2026 11:42:26 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088500;
	bh=G/zToooWqj7mh84RSSASjaLKt8CwDepv7//5sF8bZ5g=;
	h=From:To:Cc:Subject:Date:From;
	b=IYc/LXRUA4ZYsZpFGxSTgJ8dRc/Tv0FSV5+eSo3K34sP3kqR0/ems5EF05ZLQdZ7B
	 19l7IVxTsxOXJeG6Z3iVAheE27f3copYWKDvgscdute2gGNOoCw61WHdwRBTl+5Aer
	 Wx1ZggzPWP27QPZ2JSG46atuZolXwgPGlRrlMCxhwZAeHkWHmqB1PKc7kdD1chSPjk
	 ZR1I07LCwaN9+/DyuBSyzgsbPN2sP+h4hogIniP+TKi2e9o+xXeDzso4cGg5pH3wn7
	 9WzeBPT89dPNxknTMnaMOzotec8ebogCtc6oxewh8l9fANrUW8rHrmVwf0TkVx1q5l
	 2Ca2D40cE05xjP9fwTJVKurrRBNACNlIUywJVFw9AwqGSjLNuM3gD/wwZeL4JsJULc
	 xtUPyp+nv0hekBCObVy17fsayLammrUNVuGVdUJOFkD5B6b9NL/OBfVchYZSmXEN4U
	 G8/4il7B8LNWWx1Dy/TFmH/5P2x0AzTt+Dg96YCGYtwsh78MdCvrehGkk0RLioevk3
	 Qaynz74TEDEoV6wI8JO1vInvqb93dy3+YBt7TYhB4Nbk+5RzcHLVHRKbTxzzkQ0iu4
	 lQCMQo+ENCr5jzSetXokmTvCEOiiN1UZOoHUZ08Hdix0J1deqBEgPATChCI518NjKJ
	 eLX9Wf4jJo0/6oWZhM0orcLI=
Received: from localhost (pa49-196-90-201.pa.vic.optusnet.com.au [49.196.90.201])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9DCB31E8F09;
	Sat, 25 Apr 2026 11:41:39 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: David Gow <david@davidgow.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	rust-for-linux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: arch:um: Fix building 32-bit UML with GCC
Date: Sat, 25 Apr 2026 11:41:23 +0800
Message-ID: <20260425034125.53866-1-david@davidgow.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

32-bit UML builds can be configured either by setting CONFIG_64BIT=n or
with SUBARCH=i386. Both work with Rust-for-Linux when clang is the
compiler, but when SUBARCH=i386, we don't set a bindgen target correctly if
gcc is the compiler.

Add the appropriate bindgen target configuration for i386, as is done in
Makefile.clang.

Fixes: ab0f4cedc355 ("arch: um: rust: Add i386 support for Rust")
Signed-off-by: David Gow <david@davidgow.net>
---

This could go in via either the rust or um trees. I suspect rust is less
likely to trigger conflicts, though.

Cheers,
-- David

---
 rust/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index b361bfedfdf0..b9e9f512cec3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -403,6 +403,8 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+# This is only for i386 UM builds, which need the 32-bit target not -m32
+BINDGEN_TARGET_i386	:= i386-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

