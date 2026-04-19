Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82C37E2EA
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607565; cv=none; b=ZlLvWxHJD0EkChJnI/zgHqlVmQtS1Hg4nzsGupyuFqN2+DXG/2XN8273wIeqydSmBtI1h0Duci+M2t4zN/L54ygr5ZYKd33FW1f9h7liOpUu1QjMu7o4OEJQjDDW0zqbiqiNk5IvQcrsD8DaBrAoizwWjDpE19zAbuDkrSYA0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607565; c=relaxed/simple;
	bh=3WWp9rUozTrqD9jYJJIxf3iZIrIrmP3btVTinVMXXjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II0346l0OQYKqjtjWRHp18cRi7ldpGHjASR4j/iRSShWOw3e7v2yIeDeR7Bnc3SzSRm+MjerpT83WRrkcUz+lrrekm5HNN1XnPwt3lMRyW00j6tqPS+LLXv3ZU0LOMS0BfRScH3214gKSw4SaY83BH3C7kYh8k6GFx5n1CAlyFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6igzAJp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6igzAJp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f8893bff3so974153b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607563; x=1777212363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=e6igzAJp8bKEpr2lr3+2LP6ZSnvTPdMrBjnszXlyd4gXd9jWisN+TDU762mpX1l3Fd
         94jLIvepvcKfd+/LfTqD2+M+UKmtYMCtiuWBRUUWWgty681OV5FvszUHmrWZchBdrB0e
         OR873LrxxNo5Znmukn/8VjJLjqD9rQyx0lr3syFa/TWWDPAcJFlxO12oenX3qZOGSxD3
         fMwfdYoH2t9REkP4y03gJGF5W6+Ekv6cWrXCxeGul3TIuo9cATFc0srD2WcO+w/ic61o
         gsGjlgg/JYpUMAkqGsLeQVngkiR5QFBsXXAa3haGKr1nNdqytKabNp1ib5Sd3JfKGhVR
         whPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607563; x=1777212363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=ZqDTnxks1xNQvP1ysEJ8wWYQYvGgoXqMSRW5Boxo9vno3ng31y2MlnrzBuGLOPvEGs
         E94FgePAU46LYWQOceA1A7Prtd+iu5sner8TU7Vjw+qbUTqv2MyT099gehoGfsiWBYrE
         bl6pBYe2GdlI+PoANJiJoErRZYiuoxHcdi6hQWNhaZFNjKw0LSwRel2Q0JFsEhFTkXk8
         pv5QOnVL/bKyj3LpEsFqKAYVBO7oIihnzOKgqaZy98qDMAxmCO+M66ekFx2qJrVEYna0
         jeXXPJ25viuOLG/uiwCJeo6CiA5NGb2xjtjR2c6TIg/3rDyBFFYyWP/jw+HIFMHjGTC8
         9ezA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZFt7I/kooaIhjGwcuScf8oCPjDINaxWQZ0hye+YUisUSwCFNrEVhWKM3noBG3zjVkZ+9AEVgzHVcnZfStpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzujv7neUxYtpqdHiJJ9UBCG8iM/qKsOFzPzMJTl7YYqQ8Dyqap
	HrK/HMnd89uQudqFJu7IlNmeRoVdg+S8hJKfFyIIPazgpx78Zl0ogHPi
X-Gm-Gg: AeBDiesdjlfUe4+cywUQI17UrUDNbHErqZsX03ioxOA5PB34iNvSyc0n1DRLDbu/DwB
	U2ywv+sBh2pXoFS1e7YCP/wg2EsqEkIssqTihSiV6ilVgZZGEDH+ugB7qgRS68X5R3yl3en6Hzk
	MmCBZZfcnN8+por3ULgfDfsBTVisBj97G2daeTaJVg5HUUsAkTSWaNbv7Jmf5/pfd5djdRYpowT
	WP0OoNiUmutMKsIrp+BhbC+luY40Uq/JEhD4pVbcGW4P1HoXxGMbrlNw++W2CD3D+ZrWKo00+hy
	Gval8rlEaYNE6fXUUH1mtvgMJL/h8H7Sls8kC1hczJUuGfoLnfnoahJakTHVL+7MnkmwjxGlCXL
	6z0HE5E/r1jzvV1a/FaOOOaMHO+dXkMp9K5jd1L4PteZj6aGJAhcRtYzflOP9V+S20yb8ILzp2X
	DN62MY7uwrjERASQcHwideVswIaw==
X-Received: by 2002:a05:6a00:6de7:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82f8c8893abmr9989689b3a.18.1776607562984;
        Sun, 19 Apr 2026 07:06:02 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:02 -0700 (PDT)
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
Date: Sun, 19 Apr 2026 23:05:53 +0900
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

