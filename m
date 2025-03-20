Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790641C5D77
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436485; cv=none; b=MrM3rLUFljzX4ccc5ziTaf+ZNaq49bJ54KFuR7Lgte/diFRN5qxEAE9kgY8K1EipkETFdLxjzn2P8/Bj3i8Vu8167pTy5BW0C6irT9VuCV3pUUddRLXs+9ldJmXuBnYPkThEkj9OEVOFiSfl0++/f/g7aa76wsy0mavV9Uh7v18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436485; c=relaxed/simple;
	bh=m42DtURYMZCXyWHkUzDgb3x5mmA/f+mhAyyGrxqczQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I69ddDv7MRxV4KcjRRxU42QUr4Omz+nDAgWQ9oyFFNZe08IW08Cj6Ezx4yKkIMJQyrlsbOT6tVpcxGLc1rxbLORM2SAloARdVxXw2/U/6QheSkKBXl7dEgak0C8GkoQ0Qq5VQpbpQ6l/Bc/udeXV2FErQ9nXvQ0mvCMGiCFLBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=UFjO01R8; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="UFjO01R8"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f47ed1f40dso2074167b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436481; x=1743041281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYfvvRu1GHzIQ/b+4BIBn6FA6Z0KJrVipVcw92I95Mo=;
        b=UFjO01R82Phi/zsptuvfQSn/vE7R8p+3ZHT+VM7PZml6YajaixBZq6427VCHKWAEr8
         Hwl3FyfNnZ0MqYP55JVL/ZlP1tEcHr7nRI1M/1RuJo0UhgtJRQkWVQSGhHYGZeTxCL9b
         /uhSvSzb2XwEzu44MgzIxVRVyzDlxi0rrtSJXtJYY9cqx5LXnwC7F2KRZyHuCMjzebPg
         /X/+cK13kTiL5Jbu303EXMpJaGhR77Yri1hKjCZJOJF0c4z3Omk+PhJBmaZhfLwwg6J6
         f8KcR5rEtkT3oTY8PWkVGb2dXKvkFAPflJT+nZt8KmNGVZKQuWSluSd8J5vBnGLNvmEf
         KCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436481; x=1743041281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYfvvRu1GHzIQ/b+4BIBn6FA6Z0KJrVipVcw92I95Mo=;
        b=Q0/TSvl/AgM4HmRSgIRTveJ3MSm3YBEwzddhwIWf1lTM1ct/idrMx6w3WIRRFsyBcW
         tzc/HI0GQ0onCyv+2nAfzBpiJhif5AJtx65lhsDM2IwcNt6SiD8P0vLPJs+9r9dLM3S7
         ZzzNr9cfNViev+uJcnz5C1GW2/oW6sSjtt/DAhAgqBGHC8cAG5fISzHjxFu03RcKTUxN
         WB3SsgMI+3GwLusuavAFaKPAhfyrrQJvPlHDvOogjkO8EE+1xZxivAztFOrF+UDc3loV
         OTs1PrAqgl6Mk5iFeHJrptI1ar4Yd5J7pLRkqVXNHOFpJpMt9fpztcd8v8WwJg6cSIKj
         DqSw==
X-Forwarded-Encrypted: i=1; AJvYcCUR91jkdwYfwTcObrqgwOEjc3V93zg4ZawJzfCg/+58ZpbrJPiJhuTonwJyNnjstJI99OYH1wUmKfSNCM06cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIKUakqOeu4vHsxE7NmXy5JCko4u4CMsKEijoQ5W06Stb8+qk
	UVtL8tzXGYibrKAxaD7A0KxroJcW2MT9j2o7IMF7yKl++5pqt6t7VC6+fBlq24Y=
X-Gm-Gg: ASbGncts12cv4k+/PTdn3f7C8j5w5G2+S1r/s7Vnae3za6oSdRMwVRRz7uiAw+nxxx6
	hk+ChXLdUbmMcHkyZEURi4aP+UiYOjhb0GGjfjxJqRgxszfJedcF/WGMp2IuC4sYNLMobPvCSIB
	01xNetNQtJ4TRrC4ajBPSum/q7AUW8SifHygyOHqwNETJQ3UghJ5hy8A3og2bzYw22yXIGmq+eu
	ncGygQ9exXZ7lPqwhmsHMQvYME/b+cjAGtgDuDnHPbyRYNDeM0bGalcCiz19f37ToppsTC+PUhP
	xZotHYN4NbE9xpA4q/aUlmgSZSCweELGjnPFsgqF+Yar6GT07WKJMCBVTtCowVeeyg+4KhjX3x8
	pARsbBZZZA5KxNwaUSko5qB9CkvDOkw==
X-Google-Smtp-Source: AGHT+IFDVdDbb9X/ieVCAhVOJq33/2ZkRWOn2SMlUCHTT1LWFdTkxTojsuUWjAEuoUU3PICEQ5tJdw==
X-Received: by 2002:a05:690c:2093:b0:700:a63c:641a with SMTP id 00721157ae682-700a63c6433mr37471867b3.0.1742436481396;
        Wed, 19 Mar 2025 19:08:01 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:01 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
Date: Wed, 19 Mar 2025 22:07:20 -0400
Message-ID: <20250320020740.1631171-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Rust 1.82.0 the `raw_ref_op` feature is stable.

By enabling this feature we can use `&raw const place` and
`&raw mut place` instead of using `addr_of!(place)` and
`addr_of_mut!(place)` macros.

Allowing us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are
similar to `&`, `&mut` making it fit more naturally with other
existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/lib.rs     | 2 ++
 scripts/Makefile.build | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 398242f92a96..1d078f69bb19 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -19,6 +19,8 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
+// Stable in Rust 1.82
+#![feature(raw_ref_op)]
 // Stable in Rust 1.83
 #![feature(const_maybe_uninit_as_mut_ptr)]
 #![feature(const_mut_refs)]
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 993708d11874..a73aaa028e34 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
 # Compile Rust sources (.rs)
-# ---------------------------------------------------------------------------
+# --------------------------------------------------------------------------------------
 
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
