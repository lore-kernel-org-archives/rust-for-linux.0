Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF8E37BE98
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607583; cv=none; b=W61NyOAmHT7HM1amQFHrY12IxIQbIQe2qmLEy4O+1NlxsxFikUZOGrjRlhP0ZEZCxY0wcK+PF1pJRPc/sssOWzJbZJtHMJbOqpcK+YxhbrWgm2/Kf+YtbABNXb6dyFv5cFM7wT/TlkV3CdPQsDNZfeN2drb5ceXfiwSPqzz6FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607583; c=relaxed/simple;
	bh=3WWp9rUozTrqD9jYJJIxf3iZIrIrmP3btVTinVMXXjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIygIH9mrhMnyjQk1f3AjxaCeQs+f7isULDY0Ogup9A6tJc4X55v014ecGtaXHYhXm+osqnancQ07TuvfBaozGGLkXJkHFJs4DlDOOjtd9U92W/VYUd3p6dBNb42ubSuexWH3YjNQds4JNLlTXP5x7sQF5TzPpwyewCESJU1OIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+xnDSv+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+xnDSv+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3591cc98871so932305a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607581; x=1777212381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=J+xnDSv+u78mVhjouID8LyShxnk7yOdGHPy/vsXV0tS4t6S2DgPFdA2qYYi9tT/kUd
         7V56H12W4WTpoKwO6QVSOvWfWhIcRjnaIRg8KSiXEJL3PYNICnrm7UwO37K9vY9aDhb0
         kQXZqSXfqHck0CheFLhnTUaXCc0vy1kuBXNDHtjic+9UdeAlFL3/6fE5u2JwSJV4OEIZ
         5e9NVY6sIQ90KKpZPmBUj/shW5iaiYSX0ixYxskYV8MkZnSmJlle6b7Nu7uY0uPJG7wl
         WPEudXqWW2912nkL14wbt4xpfE3cVNHoNCrpI/EkAhMIwLv67wKbd7/BjvjbHQS3jUVs
         EwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607581; x=1777212381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=eLlqi4hzj+uTNWJ78bw25vN0/hkK3xYKn5hy2EEK499jQvczksWaLkiW10Hr16sWVh
         mfFG4yE74CDWBwJh60xSfcMadOE1nZ1A39W35S8NnwPjZWtjRiliL9UTDM4dyaHLu6AJ
         EudGU8H1mo4r4WP3d6PTbVzZK5u9qdhxvnCxMGdidPBUzujtG8gLjBlVlSKeFmwsToI/
         eqV4F4vvCp7FQ3Pr1kzKoZZUZ/aZRYW0uTcsdTGIdlaKNIAFZN5ygVuKGjZfpSjXddvY
         pnqICmxQUd4uFPWHUoeuLQzOv8r1pTiMkD/hWtYa/WWPN2VHvGQtYB7akwibi5eVtHDN
         lbmg==
X-Forwarded-Encrypted: i=1; AFNElJ/44tBorxMEYY1U3i+rCd2o4ojE5G3J2YsGGswAcnlNax22COMU+AEG8x/e7iasUBl6IGsjY3xqW+Ak8tbndA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp05f4O/6fsJdUQmFW2Nve6NYrz6ivdhRQuK3hmn9Uq8N/lQNd
	YqHTUTkB7FqsUn2e7gtKfgG3KNnrgSC0+hbY/06q3K+j/+NiTPavim1U
X-Gm-Gg: AeBDievK4lLuL9AK9bGOV616jhFtBiDsEBwi8v+oPjQAVKXCYfvPg2D2uc5OdccQFoj
	7zx//SECgLWiTwjuyjiMigF1o5pprhklWjUG2MmGSIG6dVZEMlcoliLk0g7WsGr6ypKNLQQInU1
	kv8C9R0J0IC+E8Ua+C9ex7g8VVGJXE57y5pUrMZ0pEMweMc8p7VJmSDU41Syvmo1HZZ+ECqYeKj
	nHiEXXbSp2n7vN5t+vbHJ2U88JktaxftVC4V6qQuhkYlgNt8XVGq/8E/D6sN/ERj+rxBKYIWn3X
	h7TXb+dSXxCE4t7AaGR9SfoZQL9kEdufn7o8GKQ8JkV2yUBPBbMzqBBFOz30NV3zjTM4zIVVH92
	rGq1hdAYynmcpRrh9izqFBVDCrqwa8F48xQcrrxgSIWpnmt81QlFYlua8MyJAOj9XeVbjqXKYS5
	TgBHjl6XmmuOecT5xT0ZYIpeBzR1EIWTqOlOi8
X-Received: by 2002:a17:90a:d09:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36145df0c75mr5534160a91.17.1776607581141;
        Sun, 19 Apr 2026 07:06:21 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm7718121a91.7.2026.04.19.07.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:20 -0700 (PDT)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 1/2] kbuild: add rustc-lt-version macro
Date: Sun, 19 Apr 2026 23:06:12 +0900
Message-ID: <498f49f1c0b34535309f9dedf87ac4de8e7c132b.1776607331.git.mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776607331.git.mlksvender@gmail.com>
References: <cover.1776607331.git.mlksvender@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260419140612.5zAiR8Y4GTRAhfiOUcADEsCnh-P3LnS-QuLurhKUGpA@z>

Add `rustc-lt-version` macro to `scripts/Makefile.compiler` for version
upper bound checks, mirroring the existing `rustc-min-version`.

Use a non-inclusive (less-than) comparison so that callers can express
clean version boundaries such as `109000` (Rust 1.90.0) rather than
`108999`, which is also easier to remove once the toolchain minimum
version is bumped past the bound.

This will be used to bound workarounds to specific compiler version
ranges.

Originally posted as `rustc-max-version` in v5 [1]; renamed to
`rustc-lt-version` on this respin per Miguel's direction to simplify
the delta and avoid the `99` form [2].

[1] https://lore.kernel.org/rust-for-linux/20260205131522.2942928-1-mlksvender@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com/

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 scripts/Makefile.compiler | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..fd039e228800 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
 rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
 
+# rustc-lt-version
+# Usage: rustc-$(call rustc-lt-version, 109000) += -Cfoo
+rustc-lt-version = $(if $(call rustc-min-version,$1),,y)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-- 
2.52.0

