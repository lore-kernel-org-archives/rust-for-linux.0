Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F892550CD
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770265100; cv=none; b=XyAm7zDRrbWua+ibiTy+XzSChvoDw9QN07pQv+TWOb9lbuc1tYH771mr7UQndTIUB7WjcRtBySqEPAWt+kiKfazu3/QlnCbtrfCv+mrJhtmw7lAqPfZhgvA/C9W6FLCnQ79Uze3jAaZHXsfI+Uv8NjBD3OsRXC1KRcU1SZSsIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770265100; c=relaxed/simple;
	bh=31cre535scK5YHPD5e8RzFX5ialuBer/1VI0lInaE4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWoD5Ke4AYjjdlbL5QoMXg6fAeecWo/Ri30VCI3Una/u3OHZ2nwViUXIAR340h16DQ/zpWtukU3jR8dGjdDQh3b3PqzZ1hbWGtf8aFLfK6t4Yofd5sm36jsjh4hvtBts/s07lVTRq2DX14gPF3c8/8buAZDIaf4A3Nwakl6+JP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVXBsMdD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVXBsMdD"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09757004cso3821565ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 20:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770265099; x=1770869899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/ASwzBhyPImq3zCtz6w37YhpkrghJ23tPd6aSVQhgI=;
        b=YVXBsMdDoJQvtLN2Pw8sC5fTbdRM6sH7LZERAESET2uSy6fwY2T7FzhEY8QW90lnIf
         EY/n0BwVJDzN1S2bW6KkI4eq0H4PXN3KkCbncNT9SSIm3yZS3jLC6rokBUVzy+C3ASnw
         5dpH0a1QhoMhkTDmLsT1C2BA0VPTagyWGsrTfJEsZiblw8621wNHifQ6lfg/egtm4QBP
         GGiPv/iS4vw7P6JlW3sP3m2uPbGMrqlQUaOOPo99BULZGfFGIadvfygLUd/bUk+PFpUs
         K5854mR0gVY13lBrgaOc9N42GiMZNnwn6DC0f59nbc0le05X0tA7mvdj+4Bit1IqKFVw
         jQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770265099; x=1770869899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/ASwzBhyPImq3zCtz6w37YhpkrghJ23tPd6aSVQhgI=;
        b=I4H/Zr/DjXXASUvU1DhYkrSFJUFIno4o5IY1FMDasn4M6l72Lr9txvem0t6Rgft2bJ
         rQE0o88rA1AqGuelSonHGFo8u/KvFyXkUYx0i3CWkXWdnZtuE74Ms8SKvmhAnnq8yr+4
         VSuv0SUjtSXSqXQBgj2N/WhRd1Veh2IGzD3f0A8v2qam4MIiSqfxlIZgXVDWGzIiDwk0
         yvwM/fDgYGSIF7GU3Vcg5tczdP23lP89tf7GSW1Kfx84H3c0RC5U095BDvQ2WuEnEv2t
         sErAtKWisYxYpAsJPe/33p3DFQgAfrhj3LMl8G5wmj9hRrLRurhj1Zen6UIO5D9hxJW8
         spkA==
X-Forwarded-Encrypted: i=1; AJvYcCXSsQtIxq3zN/15IbeelvzzOaP3BmTlKhxZMyMQ1O30X9HMWo45OFNnE2vPCvcKtG1zEOm3ZepoPY1Vees8pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/JCcLV+Y+sq+n1Fe1IvIp6BKUyPWNFaq9dUjPXwJnXLveHow
	Ih9NNKB6Oi2WuVvC/mCL4+BR0EjagOBDXeghKli6d3UOT6GjKiLVHNP1
X-Gm-Gg: AZuq6aLQ9+q+bHuMEWt469/1bWE1wikkv1DUEIpdBIFyQSVbg1H55JR2l8T4sYnv+vd
	hCr7JUmzCbMctmnz9GOSKGyEq8zlUO0PQrZL7+EE3KHLz0mtovAF1kN1yCMJCSnp6bYpDjOZ+D9
	c2jkQHGX4ySGQFbUl0aAI0G5iIhi0dDACiSRGm/TZ1wWEUXentm4uRrB5Ck+boozsZBmGDdwhof
	Zi1zXyEddtPvhyEGwm62ylDDTDzFZnsk9yNy6uQrz/h0wK75bhWCfZVzOmX5oK37/fWEN7e0nlR
	CFpilIBZb43A9rWu+Y6UmkmqJ7CrZUjZrjlRNnen6CCK3FCUBoOdILxuDigj9zpMzI9qa4oMVfi
	FJgDLZoLA1zgs9sE/4PmAj4qaHeAG9b6QTzw+ATsOmLYut41Z1DEopFzWSplVe//vuGmU8Eox6d
	SbM1U=
X-Received: by 2002:a17:903:b4f:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2a933cf7dd5mr46866155ad.16.1770265099390;
        Wed, 04 Feb 2026 20:18:19 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93396b2eesm38037785ad.78.2026.02.04.20.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:18:19 -0800 (PST)
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
Subject: [PATCH v5 1/2] kbuild: add rustc-max-version macro
Date: Thu,  5 Feb 2026 22:18:14 +0900
Message-ID: <20260205131815.2943152-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203221224.GA2703490@ax162>
References: <20260203221224.GA2703490@ax162>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
version upper bound checks, mirroring the existing `rustc-min-version`.

This will be used to bound workarounds to specific compiler version
ranges.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v5:
- Split rustc-max-version macro into separate patch for easier backporting
  (was part of the workaround patch in v4)

 scripts/Makefile.compiler | 4 ++++
 1 file changed, 4 insertions(+)

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

