Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C392BD5B9
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 04:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770265103; cv=none; b=iR00GX+c96loNv5xM8SssX34AqwD07D2CuPQnCvbY02OIcWkhCeeepYHcUkwW9HWQwtv4gfPGIkTWxPaBwKoVuJX03rQFiXSD4zNBfcPr9xkKFbyK8MNyZP1vde4gAelh//Ynr+wlSOOrSSP4zFGtsGPjId5BM6wqvQQwZNLhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770265103; c=relaxed/simple;
	bh=SE1wJiKFUbwmRhEJCp7iSLKdvgEcrpon2J3lDhjSELQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp4G8hQU8qAToMjRqrqN5yG0flavnUyvBnaLiQ3rDyXgZMuPqbg/4iBxEZfd41yKt2FCkTGgyLe1bUvmWuK3Y7W1AjQfCMiisITINxT9dqtmv0N4rmdzZv/p40DU+R5KUdacNIQfKKVVYzZGxFmJkK4crKy9u6GHMQwVC2yffYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNSstRse; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNSstRse"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a9004e4239so2056775ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 20:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770265103; x=1770869903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmoelReQ9efimA3AVqzRHYairlBZ6Gd+e/kQdjhRrb4=;
        b=lNSstRseGd933pQvrTVtfZH0pXDyb8IxLXEshlWpLDQ9pY9rc+F16CfG1iZfF35tg+
         j+k2/Uk/new/dXj4K+cHUSBUnhb7MmDr4dKlgAVkLsdsbII2+g54Z2TlP7rwvZJvabBe
         3fXir0ua2gRb9ti6nOSVqtFs8G8g9RH+Hwg/xVv/lgKvzIwRetqHubED/r+wpj/okf2x
         dN9jYZ2gZTTT2xJxmNlUdbUkNuDCTIaiZIxgzxXeKTa5jESsf7L6+op7y8XK5PQRwpx8
         hBlbmX6BRKltGAc+ClCgbHgA8ALivJuDojqh0yfJmPg+oejBKhu9OTUBeUxg/esAii89
         V02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770265103; x=1770869903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmoelReQ9efimA3AVqzRHYairlBZ6Gd+e/kQdjhRrb4=;
        b=xLvy2OlSEGqHp+CcZfJ8zoUoSmoAQJ9Jru2HKMNPoNV9CuTUQexBigTaEACD4GF5Co
         TyjF8XVlhsgRUE5a1YHGtiDx/eznwp3prra4o/E8Nd/l/fqtkcaa+vAdW6c6LTd/xzH+
         mZIs3QwAakdCTsOjsALQpmvgBMStmjHLMQjitiMWvDXmhE3ARA5l/aDpKGwhY/e3zWSF
         Z0P1I4duAJSpDglqR9WlCYfHk2jVEHR/VYOpxtKLeA8OSfz3W/O4etODYpduJj3VxV9H
         0POUrbky+ZKChSrxMuKxI9qszWnYu6mDyci+w/xWodH0Q2omqHAOkcu783h10KQ8PrSd
         jXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9lXmY6c0F8xsUk5o+d1rt3LYG+ou25JUuMXhqTdTljKs80cZ7dzyptzxW9vi/h2mpezHM7NtyDx5epUK4gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tVHmamf6OOq9FgAyCoZJbI9iWgpoj1kDmVLG6alTyA2F97Gx
	P7BIgoJVY5w30aKQxtn0CfT63/IxKdj3iIiypbYuksY0dSxR+6BsFdqL
X-Gm-Gg: AZuq6aIXuQe5utOwtNMENcZVGtqAiK4qjmvMqZwdYqdgLmVr5CYhx2pu4GG7WmGKoAy
	+gRg06qgwVxTQPx98jgh5jCm0w3NMoxMnvQue3rEQqBZjslDo6tFUQLfkegn5XEzTUQ/wji0STG
	fMHb31QTivScO+KJvxx1rSDodEf2w/KlqWqmJXHTzLz1aiB4iCJt+3pqaN+s9wUCngbSGw/N6rb
	+WkUdoh3KHzTUnzmMmBLuwVNPCEJvtAAhE80J0QQlQvECATAV6quIrMwbF8kb2qq7oaJJGhHrSg
	321SoQg/zGEeyJUDFFg0THJKViUD3876mQLVxrr/jVjSxe89kyPjsswgkEduKTI6SWvX5WVudC4
	V2NrSo00L05H70w+Oy7Knddw+PLBU7SpwLeOHSKdeOOjjyHNU/NdLa0k3mpEE4FLtEnbpOiQU+X
	Uy278=
X-Received: by 2002:a17:902:e88d:b0:299:e215:f62d with SMTP id d9443c01a7336-2a933b9d409mr62869745ad.5.1770265102795;
        Wed, 04 Feb 2026 20:18:22 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93396b2eesm38037785ad.78.2026.02.04.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:18:22 -0800 (PST)
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
	stable@vger.kernel.org,
	tmgross@umich.edu,
	HeeSu Kim <mlksvender@gmail.com>
Subject: [PATCH v5 2/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Thu,  5 Feb 2026 22:18:15 +0900
Message-ID: <20260205131815.2943152-2-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205131815.2943152-1-mlksvender@gmail.com>
References: <20260203221224.GA2703490@ax162>
 <20260205131815.2943152-1-mlksvender@gmail.com>
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

Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v5:
- Split rustc-max-version macro into separate patch for easier backporting

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

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.52.0

