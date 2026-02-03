Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA736AB77
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045680; cv=none; b=bQnMwSbQIK0xx8nr16/VcfELVvmtXMxvhqIDRf8eWzDnEdLw5dyr4d3k+FglnAhOlefJSsV+Icfbd1GPBDmr0UV9Y84UdFHn0hU8BcUSsqggswyT004dAbzYcsq0vlmXKlihCsz4OcQNn/9RW71Yjf4UdsP+d6dpg+TjkOT7YsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045680; c=relaxed/simple;
	bh=uebF3W17W4iCpyRLsu0XOgJ0VFW9DspHARFs09C95Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhazHrcu9Hp9ojORyx5mL8vCtb3g0PZE8g0cL4aJmNdcggES2C6em8bcdrwmsXdOns0S8L7E1qo6qaO05cZzvbAxY/w25v/QOaX4LhTVt890vWSY0BkW8xDgDE5zrSl59G6gEEWUQxKCkH3PBWEqKKljQlPzhJgSdk9GfD5VjIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mszWFW8A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mszWFW8A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d52768ccso30742745ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 07:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770045679; x=1770650479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itEg1xdohDsfB71aoQE8M1B2USZb59oeY+lIt+9t/Zc=;
        b=mszWFW8A1AlIWBmeWB/6dlH9iq1v1IlH5IxUC/Dvt2PofBAli/Bce8ezj9fmNdNpRS
         /rkqqsQjIeT79qk4pyfAcpYNYMPVZr0YGIqwZtkBIu1hFpgZpvoRDarCbu1RcPdALDaq
         rM1ysjyicxvFkq/egqmoGZvm5+kw9UiE29VkhmDuKXQAU7jrfMXk8Y9NNcpBX5+vB1CU
         GHRpDIqlOUd52ff3zH5s91EMFO00Cr1pi1xcIhByRZRpWFe7JWcdGRWY1qZAyChOv784
         jHHbXFuYG142GHuCpbQJjvyYjYj/cLkJ7NyTEPgRL5ZM8CqYkLhXvLzRn7BB+H4ZzPWS
         inww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045679; x=1770650479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itEg1xdohDsfB71aoQE8M1B2USZb59oeY+lIt+9t/Zc=;
        b=eQkH/aLcCxUJu4KZCvrnRUiqDzN3xz7M1HrarWrc0vbcSrGo6ShKMPDfQdXL5LOPcN
         TpvMwdvpM/tGWPKsEk60M5dIAdAVvE2ezLI0rD398GSwPM4bD8C+Y6bms0Pk5jWu09nE
         qSlu9n6FWOhWBJ4/cBhYg12Yoe5e+vrDeNu/cwl7EvD+pLEoB8AumA2fAO4Fx+1ri5lb
         hDNbtSE9tPuavqYyweWl+Giy+YH74sZAi3i8AtS2eakf3wqXPEIiBbbGV7OZ5Ud+t0RN
         qT0cO6iZKzGH0Gpay95hXyFdgmuidiiSqH1PhkhPUKvk2gkny12OGokfbAY5r84vx4hC
         qkJw==
X-Forwarded-Encrypted: i=1; AJvYcCWYiwqApA4mbD24ejjCduzqp5yNyaU4K4YSIH0za78CMPjdF216Pg1C8lcFsxSVt5DrT3VE+UYGCuWpWmIDew==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkehpt4u5OvcAgBOxrR8sOcJZ+7D+LTf3MKV8CW7+qy8+WqhMk
	qJCdsr/t0XylOBb2dA/bq1cNZ/3YH24qbFNdnCLKZsB6XcrJ8noIc2GI
X-Gm-Gg: AZuq6aJHg8x2w5vu5Gas/EEB6VeOEFgMSZ9UKIR9cxijbeG/1ZTcKBh4XfcN97U9Njr
	WvB1wdxCsQj41NhfHV80eY9mtEhh7dSeUup5lVVTaVCWrujYyvug/EaBAW1TfKpDLlkXszKHJFj
	TEVdlc6pPgBXl7zsSn8tJwaprPTqqLlpIyPDKIzlsTqQQZdKx0phqNVZGo/qZ3GpHv9L1JMt9VZ
	VlINOwUqg4sUgdDL55kfKcFHK75k1j0+SPYkWr0QjmXPcXtLeRl4SiT1ZaeNS2c7kp1MGN1zGyn
	u9H/HkpEkA1K3364V1ryj4v60xGO/mFkr4gnt+7D12wEbr80VV9szQejxtjqCkq7YtwQ8Jo8m5H
	goVQwCWiUXDuHc5MugIPS1zfg2IQU07nQsyYx0nonwq1fCHouBRi6jpi9ye6jNlD2oZsGMXvwRS
	KR8OJYeDW7ZbNArQ==
X-Received: by 2002:a17:902:f609:b0:2a8:ec36:1a9d with SMTP id d9443c01a7336-2a8ec361b7bmr105127205ad.12.1770045678978;
        Mon, 02 Feb 2026 07:21:18 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4ac8sm144199275ad.87.2026.02.02.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:21:18 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: ojeda@kernel.org
Cc: gary@garyguo.net,
	charmitro@posteo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	dakr@kernel.org,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HeeSu Kim <mlksvender@gmail.com>
Subject: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Tue,  3 Feb 2026 09:21:16 +0900
Message-ID: <20260203002116.2703251-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222144.2689495-1-mlksvender@gmail.com>
References: <20260202222144.2689495-1-mlksvender@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug (rust-lang/rust#144521) where target modifiers
were not properly saved.

This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict
the workaround to only apply for Rust 1.88.x and 1.89.x versions that
are affected by the bug, avoiding unnecessary flags on newer compiler
versions.

Suggested-by: Gary Guo <gary@garyguo.net>
Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..55e2dc865207 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -136,7 +136,8 @@ pin_init-flags := \
 
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+# The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
+rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),$(if $(call test-lt,$(CONFIG_RUSTC_VERSION),109000),-Cunsafe-allow-abi-mismatch=fixed-x18))
 
 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
-- 
2.52.0

