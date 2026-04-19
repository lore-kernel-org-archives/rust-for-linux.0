Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1D37EFE3
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607568; cv=none; b=FovToZMSEZF9jGc+HQxcNldwMTsRtUeZx4VW4BucjDYF8uwVACeXK5R6OteAs35KS11OA+fmAgcfvAZ4ETSM4o8oTQFJ6kVbdyMQXDU1GIbf0wcJWGa4vSbZCnT+/8S1/4UPdmB1v3SV8PCbh80ESP4Eqc5pX3lngUnc7Mksnbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607568; c=relaxed/simple;
	bh=RkV2A4r75HXuxD8QxkqtPSd3I5Hi+PWFKHt1H+BH2rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvlalkQH/GOBc5p+WaTsbBOHgSDf4duCTW+AoOYLPg+Evzy20QG5cetRDbeA6/bJk+f9vzBmloznYVNJC/qVBQb8oJiH0aN4K63yXwptJhlC6dO4T8b+OVNsmRSOB4qEiznCW+R1xguxWibvdGCJ8jGC9M77svtcYHHYYHzQJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtAa0/vq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtAa0/vq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f69a286dbso1721218b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607566; x=1777212366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=dtAa0/vqDi4chnbjopfSXz2pJxhk8domfh9vOveJBNkS3oi6RXkZCrWQdwXXfiKFWZ
         flIG8IIM9vfBfvkcNybv5Z0aPBA7oNNn2ClqOAaSPKgZtoCt7ieo7wk38xGf3U8PM5CJ
         i4E4TZNvfo8AdzM3kdBfpAVe5LsXSVJYtxGlgBd4FIoOzIt/GBp2g9wBM3iR7hhHdavt
         so5Fd1HmJEKM+/LBKwnwBWRkshjbwXx95SbCKtPMun3WBDx/5UkrNgNu7zKcgGx+9WJp
         R306PtYv/NdswMP++sDL8mHcimmIw+13kZwC6m6dsASI02sYVlKoLgENFgiRj08/PNwc
         y1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607566; x=1777212366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=agFeyEKsFuwKh0dd+g978RggNOV62ofpKuy7egNQBzXNqZukLJz4WODmJqla5bTkkk
         XBJaxt28YDOHo6cHJGXDlmB+8wR5aSeeQI00INH5tmZiz5HG5vH71aG6ytlKDQqvkWML
         a/XWxlS5ks07kSKL0Thc2faT4OsMDtBNOt4xJRFkBDRMKeROfSRVAD53z/1q4wCoya0+
         41DCF3paYiVTUtmXUcBsg5wZP6e3bqmWB1SEU9S2xtm2O4f8R8BopNSRQRzFQjSX+Iqr
         0ZyyLMUF/OcoUYknYYn0dbggQ94gXRXpi4qNy5PCsH/3Q8NARZQvqtiok6smrduDrqKH
         Qrtg==
X-Forwarded-Encrypted: i=1; AFNElJ91BdroG5+SLvpuekWfjJw5f7i7bZEvcGbIwV4VzoGD/ZoEt/H3ZS0VC0q9sZEKkCZU6UITDZyY9gWrFvgzuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqC6TeYvNFGU75P1GAH8c0Mv73+PveZ7Gf7y3ghmhWZDNTYmPy
	LJwCq91fRXue9oUX80cnXBzOx82zkXbRgAWMLQrcDWJMDp84yYBs6cDZ
X-Gm-Gg: AeBDietiZ4v2jjKdKNpn3u2xHphOnbv+dKOf4wMSfKIbf09OH9JOp5VkequvCEscJiM
	aTZsPW7Xe6zF1KrBHqLgfj0n0JOD81H2qU7w531spZpZpbfpgvDR5MW7cHCD/N2TmvuSG+9/dfn
	exjpoVPv3RZiBeJ476qNYUkqnO/jG2YVhmWvxPTHWOGDppVn+fIA6BOJ6QSMF5RC4PrWOgsy+Tu
	Hkk7zeurRx2Qqx5OeA+w+bFJgNI3HKs/ZDb7JkcW4Gh86U4YaBKbmwa9cVt9PKLeCNB2Zj46xbc
	dfTaSC+bmOewq5GKvEWKm37IQ1VVPmplffd1ZwO9JxEIjeIXXsmX2lLvcBC6vKQNlNokViG9np1
	aZj/tmtv2HppUHcskKOKnJLciNy11HQYcuC0BSWbuQN5jWHTkUesDaiqbJZSe0LPULLUyTflBes
	uwPr95vB85TbH4PXAzKMOH84kWZtEVTnaI1TKv
X-Received: by 2002:a05:6a00:1995:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82f8c84b34emr10387529b3a.19.1776607566240;
        Sun, 19 Apr 2026 07:06:06 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:05 -0700 (PDT)
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
Date: Sun, 19 Apr 2026 23:05:54 +0900
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

