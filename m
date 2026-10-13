Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B728551982
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923545; cv=none; b=dx+6paqebVTJsbx/VZRbrQKtP0pv3IXGMQbEJPxtEEQDnn9EG+Ikmt56lN1gf2HXUrWFetBTYmjLeaG6YpNObF3UACpeqkHIQsMcVpL/PhxNW5++OiGVn3aH2GY98D1jHUML2+OJfptdBIQ+1XTCWTZw1k6sW8REldCyIgcxYuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923545; c=relaxed/simple;
	bh=6JajpgDfEBwfZ8sqZjkLO3o4yng9oDArTPI6I0e/LXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGGe0M1AXNBZTsWsEG3nBlapWRE4rxGTFOW5JInkt9zPWo8dZXz+p1PYWOcAN1m3+K8ER33R1CYFO3rgFDTL0VBJMqqcSJXfhImXHhKio8ZcS7sL8GV+WcA0TEowk4LADuKyjvpKkzthwOcHmJvSIJtzDf8AtRc6oi8G1YlP6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUVhdNQ8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUVhdNQ8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so33474165e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923541; x=1792528341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=DUVhdNQ8Q4JvcGMOe04dpHFK3ORX3KqjCiOru3PpjOdpQvhM+Ch4cwkV9hvgdWNi2Q
         KA9AHaq51HoR2HfJd6HvVEwa/s2UMtPfZvlnOPYUrL+akMoJNbwsVHvBWbmuHabwZPLu
         pbFlGAlswpGDYQzHC3xd4XwCNNQ32gmd3KqLt7+gUcH0xzr08BQ7uy31qKTT3H8DlHY1
         j6cKgnqAYhvwT154g74a/+WzU0JjbpN+eR65e/irUS8lzGteREEpSHpNOB5Y1P/LvLj1
         W8z7CJqPxg2kyAFeZz81G/E9BTvyFLiZThBgum0/aJEpq/uR+ngBvnp/svCLmTKeHAUt
         bxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923541; x=1792528341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=A0ZcnmAD4dzS3q5kc9X6UTBVOR09uDCLN/7/QPSa1TGAR7rg2qAPpTR//AWO1sbaZo
         QRMVlGFvWUhDDGZn/sElknEu2lND54ereMwJj+v3vDZ4AuOSy6oNEJU4rcR0owyoJgK7
         oTesQvWTVSF3C9gpgq9F+u9i4iCQBeKNv5OGSPf170zLwxurLGzvlhmIbZX06bJ4Tncl
         hGtvDWEXMKr4fqpqAJT5OkwASod0kVLyECNewwexoq67NEB0rSEAe6Zv5t95RC7MgD6u
         e43sw9sFH4oZup2DFNYE0jKLJ7UFQbyf+Nm6vFfogjHGvViopT1txYyNY8v8r7KTyIq2
         ozRw==
X-Forwarded-Encrypted: i=1; AKwUvBychB6b/bHVSoSZLlNS/BvT3HowniR/cM5AKrcQuKET9tjOeXtiuE8Q8PZYHqhM7W12O1jhX9LLRccJVNF5cA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWHL/zlGKrDxAtD9rJNAz/W5VgnrXpYvVUfpuc09h7L0jcF/p5
	A02uyj2oDQsP7IR5/iUquHK7piNS7Ehrucq9gXanbZDqDhuYMuoNUiTh
X-Gm-Gg: AYBFou3LJGeM2bxVAY0QrFC1uLbPu7StZHboMlKZse5up2X0VKekJYoHOwkYEnK2nCe
	CUmqE/I0ZgPiFztYTBJ7Sz1V0mYeWfT44hEE06RjtspyCWj3HhZdg0Rl1MRzA56kjtzhinJppX6
	OnuZz0+HeYdDKCUg/JN8fFASIbjGeIdD3tYpTiEOe5noQGYiAdiKJ+WKMDU3y/CjqyA3P86FXFS
	GXlmlaH06/MAhYyofrxRA5GUqLuDK25JEC8Yj8475wmVcDbalieER2xV6c006oquglRC55HP3cH
	r+Wi3AtnraZDsMP7WcgkzrWZu5sMEBuc5TrCuy0PLQxKn0ONLguEAHGpDjYUazgUAaXnD8EzNaP
	uz5SpZRiplELHVysRQe/yhDhXR60OK0CEFeSdNZuPKw1sBX3VGMKjoHKPBhDlan2Aepcr8djIVr
	21Y7/Gvky6RYY+k6DeMM0FwzschjtBW6FWWuwoxfcKv83Kvys1jg6+z+JQMSp0U/mXwCWFv7hNI
	D/KM4ArLQwa2JwMnR5WewNzf6sSgHnFdjzYLTuUNqjwWc47vTKPjnyg6WtL9OyD2pQvc9r6SAdW
	IMd1YJYsEWO3z0231PqNeL7olsBoKENlM5Tgv9cZcZXitkMbmvHJyIiKDSsrA8S1wVAJCYu/W15
	qiU1hHSOZ5pSNvb+mQw==
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr69814455e9.26.1791923541329;
        Tue, 13 Oct 2026 13:32:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:19 -0700 (PDT)
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
Subject: [PATCH v3 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Tue, 13 Oct 2026 22:31:40 +0200
Message-Id: <20261013203140.31741-7-kmehltretter@gmail.com>
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

The arm-unknown-linux-gnueabi target builds ARMv6 code, so ARMv7 kernels
cannot use ARMv7 instructions in Rust code.

Use armv7-unknown-linux-gnueabi when C is built with -march=armv7-a. The
target uses the soft-float EABI with NEON disabled and permits unaligned
word and halfword accesses, matching C on MMU-enabled ARMv7 kernels. A
kernel that also contains an ARMv6K CPU is built with -march=armv6k and
keeps the generic target.

In the tested Raspberry Pi 400 configuration, Rust text grows by 1.9%.
Six small benchmarks range from 10% shorter to 5% longer runtimes.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and in
QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules load
with the movw/movt relocations.

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

