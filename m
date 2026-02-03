Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98A394463
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130136; cv=none; b=SVuu7ao+O9hA37j36pYDrlABRajiVreOfvsotiSVXjOrc0k1/jWtQPIBuM0UmCdP54ymgAZaqBwqwRnWBeI+WjQkXeI4GPUrEJYDPJ61noFovn13mQuK698O2OjSV1sH4cP1yFRpAhOc+Bk9FZ5P80TnZ8mXZlsBfDEq7ODgwno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130136; c=relaxed/simple;
	bh=ZWNMIok2mtbaI2PfdQpsK+ox9X80WS5ALkwyK2qpfR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrYVRh9ls3qig5y5rEtJpoDgC0BX0u7AOGXMtyfEfmHZf8WK8QeNKXAWR1L3/Gev98j184l95/lMx4lphTKNoa/bj/VsnbuCPIsVhaXHYhG6+g9gll++QNdXaXWt+/8yqKt/jBd1ZMK09iJbTbBmfnESvWzhFm/6joKb51y06zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJXmnnbG; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJXmnnbG"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45c7c841904so3819668b6e.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 06:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130133; x=1770734933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8iLbQX1XIXI1v0KLe0qd86D4q9L/49u2ODU5DqPEiU=;
        b=VJXmnnbGQZkZ6Yt2HNy1Qy/Ioy19C7bhNXIKKtsE3JaAzOBzdowBHJg1ZGpk6vjvvQ
         cxO+KNxPvnxLpg8qnAWwno1CXvuoPTnEMzObYrnM1YaTjljGKXTRYkIDvvTAsdvuvuTs
         F9QuXm1B/VqessOMrtsLyrljzfbsr9RHRNhsx8hJKEGX6KZoQ3GxymGuZEeHU92NziG5
         TNyIt8sWNEgXj40Q355kNXcNtQ8WacbE1WOff/079Nx6InW2UZWuZHnOdpwmpAbggAct
         2vt7+XsHX4VRlazsYNidMFX34dIoh8gbJHQHkVt1aTSLZqhHY4JWroBrlIl6ck9uoCB9
         l+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130133; x=1770734933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8iLbQX1XIXI1v0KLe0qd86D4q9L/49u2ODU5DqPEiU=;
        b=KBoPKm+xPvixvQn8IE0B4BkbOJrmJKRt/lZ8gfYfgEJ1at9tGQVLMbWh80EFWs1QsL
         09DGUreiTnKq5ixA8xvV8o1h+aPHZ/8oBLcBINhO+5i8izTzWIjeCmQiZvV+Z3ZAC+QA
         XSriAKUwacpdUd16QCG3D+pN4IPC59oq3z8n6+3OC80J7B34URtTdw5PxbLiDk03OCAP
         7xWkpiygluP9fsWwsJr8Wqsj/+GEBMog0N7IE1o+kIqE6EQO1thbpH+bQD+zGpnAcMws
         fAS/Q6q5tVpdIFEyEWlm6HqcyGkb4YGjrs1Tu6vrnMMxduvVUG1KsSt0IFh0FLazQ9BG
         9UBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzzwVedtVK1hlDoPVdgUAxGMANhdcks0dvHFfJBcXKPt4DiF5F4iDXllNNJoiEM8zpZNjj2KvfaPnZU7sUeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+BYEKVqPcc/hqe8BveWJFRqH+EmLSfGdpinjXaQyAg1KkR90
	1HvOSNQmLlHUGvtxeH7igf2Q4ReqmYsrqAhJhjDp40dQ8xI6FKkTWkUK
X-Gm-Gg: AZuq6aK8nKxCO16c2LNlf4cddNTKentGTUVpBd0MPgY2Ci1ZcksmaImFy+8Qx6Gko/M
	W2oVb+wGeXhkYWuQWcX15hvUK+CUKJfFy72PJAeENPLFBuIejN3nfCNkTxJwuMYq0oBB6+Hn7fJ
	1Nf+et3TeETxp03q0sGNgCNfZXi33Lin0aWRWDDlMOySUonmWi2K7BQAfC6H7Vn2u9hLdB/fBQu
	IKCfSrytsSTpz33EayRnYZqQzd+C1p1DTOw7TZPgYDr6uerBA7NImOD2jhZb/S2/rx/hN3V68v0
	xc/gn0aFeQqffULejOtGg4b/05qCdIdtdtSqo3TLYT5LsqETJJx1FRYBCBHq1IMulrbLJKrkRoA
	e3QAsHHiEj1CWy/H60YAfhWaIkYR/I2P7cpPDLhLdIiEmFGJRmfaA1nlHcp8yXnQNyK1S2PRaYd
	+dd/hHDDnMQDVpAQ==
X-Received: by 2002:a05:6808:4702:b0:459:9961:5114 with SMTP id 5614622812f47-45f34bcc989mr6716499b6e.16.1770130133211;
        Tue, 03 Feb 2026 06:48:53 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409575f6551sm13788352fac.22.2026.02.03.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:48:52 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: nathan@kernel.org
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
	miguel.ojeda.sandonis@gmail.com,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	HeeSu Kim <mlksvender@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] rust: Makefile: bound rustdoc workaround to affected versions
Date: Wed,  4 Feb 2026 08:48:43 +0900
Message-ID: <20260203234843.2834885-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203005627.GB52989@ax162>
References: <20260203005627.GB52989@ax162>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug where target modifiers were not properly saved [1].

This bug was fixed in Rust 1.90.0 [2]. Restrict the workaround to only
apply for Rust 1.88.x and 1.89.x versions that are affected by the
bug, preserving ABI compatibility checks on newer compiler versions.

Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
version upper bound checks, mirroring the existing `rustc-min-version`.

Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v4:
- Add rustc-max-version macro for cleaner version bounds
- Use rustc-max-version instead of test-lt for readability

Changes in v3:
- Remove Fixes: tag (this is a feature, not a fix)
- Use full URLs with Link: tags instead of GitHub-style references
- Add Link: to lore.kernel.org for Suggested-by attribution
- Add Cc: stable for potential backporting to 6.18.y

Changes in v2:
- Change approach: bound to affected Rust versions instead of ARM64-only
  (the flag is simply ignored on non-ARM64 architectures)

 rust/Makefile             | 3 ++-
 scripts/Makefile.compiler | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..1e8a75bc2878 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -136,7 +136,8 @@ pin_init-flags := \
 
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+# The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
+rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),$(if $(call rustc-max-version,108999),-Cunsafe-allow-abi-mismatch=fixed-x18))
 
 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..85268f6f1494 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
 rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
 
+# rustc-max-version
+# Usage: rustc-$(call rustc-max-version, 109000) += -Cfoo
+rustc-max-version = $(call test-le, $(CONFIG_RUSTC_VERSION), $1)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-- 
2.52.0

