Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E210E37EFFF
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607586; cv=none; b=dZjFEuwSNoaOG0ealQOippO8xxzaq/SXpw0hZzWSuuCjZ7GERub//laAe2MCZ2EVhMadHBE+HGdRxsN7DZ6zQHNgbjS4QhKEvLMnp5rSWCyZWrZo95uJw8pGlxXNFz7Ux492gk0Mp5SsSmQPkPHvqoVBA3BgchQrqxKbS8sox00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607586; c=relaxed/simple;
	bh=RkV2A4r75HXuxD8QxkqtPSd3I5Hi+PWFKHt1H+BH2rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq/PBB3oco57OGihtYKwOB87W9iJiAAi3LlyWbr4nwraYm/tnT7KK7HEerVuG9b/s2sXaVncn++5RF9TjbljU8t4bHSzEgbi1DRxVjCrrAwC0HqWjLXyAWKSoLciQ3FyMO5hwca4WYEvKc8t8xubu8Mi6Vc2gzkNhEJVXsJB24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCVgnu3j; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCVgnu3j"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1794480a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607584; x=1777212384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=UCVgnu3jrZxAzO8r5CgxU+MCpVETYbYsTfl8lqLhkZEy+/g0TECLv5hd/qy3Feh356
         0VrALkSjdxhK/HK+xy4T9zy10OQC6BP+VpI/t+vifXdPTREznk/Bh5EKmdhN/POyIQXU
         3r40Xs04Xs8/q6Y5bnT3eCiwRtsDbGiSBztcJ0ZhtxuRFpRmc//MT4NMPRKxAx/9Q2xg
         1RPJTMRR15hjtI44KvV6W8ngbODj9sfCxYs4PTLb+JDyiO1woxEExYyFB4pde657SSo7
         tMNAjb6477vHQeqgN4RDZoAf9YpgfR0adN6N0jG6uvP1SrFghvuNpnQCCt6P96z9/4jx
         fy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607584; x=1777212384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=dblbri29F6T2Gw+i5/LQ9NfYCwD9DfunDvXfEnG2KYfgqs1BE6jSKkI0Elaj/sNK8u
         svufFTeHAWeYp+d14+p1/4RDRd/lZjqQRLfHP5nc68oaC/VAYKb1RqI0UHGV7nTLqF9c
         PlI6y7NlaFc0DvLqqum9vaGGjQizHRYa3W/1bDCI+ofOvd614Leh3Rg1JfDgb+b8ySj6
         G6u+3eUI4IVsH6CrL4VNTtPtuxPUR9T0IiYgfwhyuj3twRfM58thes0Z2SeRjA/ekNI7
         HKnrsUIkWhBObvgpf6TljuYv3y/2KEMHALmWo4eZx3HY3L/yaiySsO9M7oMSEq6KmBD6
         LAIg==
X-Forwarded-Encrypted: i=1; AFNElJ9JqmM4a6yXN8eqBVeJij/uHiwSrznBDP6VZnHGw92WDJPj5UgE/6XmWVB++VS9v7Ib3XYgDpQjTglxKUkBOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9WhFxXh+KIJMWCm+H7P0XjZ7AmtKCbquko7Ezc6XrJt+bdO7
	ZOV16zwqhTS7AgIUUTyXy/t9cazFmnOqIaiHHY+FXZLlamlbH2AmThQD
X-Gm-Gg: AeBDiet7wh0OIi5aQkRsnOOXNWSNlLE8eHuorc7Wt1PHa2Man0awMEfLEKOwGuJ5C//
	NzG/2HNwsMOZ/HWjGuvm6fvjlksAyHFZPCA6429w5P/Cr6h8lK78P21jStIUqGYqybITOZRtWEK
	bFleRsEFOxARGY2HCBgI81NWoR+2EPU9xqHbVFh0SUIU1UMAJs8FouADKlhzjpZutyV+St3vni+
	D89EquEw/QqC5RCCGSxp4EcqK36SMgSgftyHvnTl5fUynhJT9MMl7KKi13tr95GVMrHI0Xl8ABx
	ncupbCTSqGOUYIibxnISq5nO6R/7IG6ScKmcorv9RqvLfSFU0jDuzNGwFv/bwqtIp3VRlHrbpBK
	3401U9Cx4fDmhjZaWIG8HIB5wNY6zjU80cFHProov2KLVX7Oi7X6BmafqI45Q0MzRZoX4ko7iyB
	EXm5hHSU5rzGTXwjU+5aDjeOa7+A==
X-Received: by 2002:a17:90b:4c52:b0:35c:30a8:31f with SMTP id 98e67ed59e1d1-361403bdd28mr11318429a91.2.1776607584360;
        Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm7718121a91.7.2026.04.19.07.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
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
Subject: [PATCH v6 2/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Sun, 19 Apr 2026 23:06:13 +0900
Message-ID: <e43a36ea08eba20b9b6c675cfcb5856201994c94.1776607331.git.mlksvender@gmail.com>
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
Message-ID: <20260419140613.onH8_jZSGl6Rloo8P3ihVGg3zaC4v73SB-lBwc_UkGA@z>

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug where target modifiers were not properly saved [1].
An analogous workaround for doctests was added later [2]; since Rust
1.91.0 the `sanitizer` modifier is also appended.

The rustdoc bug is fixed in Rust 1.90.0 [3] and the doctests one is
fixed in Rust 1.92.0, so restrict each workaround to the compiler
versions that are actually affected, letting ABI compatibility checks
run again on newer compilers.

Split the cases into explicit version ranges using
`rustc-min-version` + `rustc-lt-version` combined inline: the rustdoc
workaround applies to 1.88.x and 1.89.x, the doctests workaround to
1.88.x through 1.91.x, and the `sanitizer` modifier is only added
from 1.91.x onwards (when rustc started recognizing it). This layout
makes it easy to drop each entry as the minimum toolchain version is
bumped past the affected range.

[1] https://github.com/rust-lang/rust/issues/144521
[2] https://github.com/rust-lang/rust/issues/146465
[3] https://github.com/rust-lang/rust/pull/144523

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 rust/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..14acc9c57c60 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -134,12 +134,18 @@ pin_init-flags := \
     --extern macros \
     $(call cfgs-to-flags,$(pin_init-cfgs))
 
-# `rustdoc` did not save the target modifiers, thus workaround for
-# the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
-
-# Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
-doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
+# `rustdoc` did not save the target modifiers
+# (https://github.com/rust-lang/rust/issues/144521, fixed in Rust 1.90.0).
+# Similarly, for doctests
+# (https://github.com/rust-lang/rust/issues/146465, fixed in Rust 1.92.0).
+ifeq ($(and $(call rustc-min-version,108800),$(call rustc-lt-version,109000)),y)
+rustdoc_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+else ifeq ($(and $(call rustc-min-version,109000),$(call rustc-lt-version,109100)),y)
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+else ifeq ($(and $(call rustc-min-version,109100),$(call rustc-lt-version,109200)),y)
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18,sanitizer
+endif
 
 # `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
 # since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
-- 
2.52.0

