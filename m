Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD436B07A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925924; cv=none; b=I7q773ZiJxXhvAN/EcBBuyx1DgKsUzWgyUdacb4xObC7XnWzfNPmgqB2NNRSrjkTDuEf5FpB72kgNmdER2KV6LvKkMeDDmMcTB4eM2H3ZcQCDiegI1uiuUoFpOgmGph2DActQOtlyDyoboqpPgPlGyMsHqzAqVxhGanmSuUcaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925924; c=relaxed/simple;
	bh=/Pd5qdMoC8dai1US2WNMLW9PKQDRgsuslw1OCghlh8E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SxPoRSE3jOTsWbAvebGNVN3+Nbz2SOA1jWt7eu5Fvl4Z+z42zlzmBeFkeD+PcDydB5DubQkRiLOoR34czse5Y01K+bkKLrWWFGdP9YOUfkRSXakZi7wEJHj9zJ2aqKPOALrZ5LtR9AcFVB3HSCgOr5T4wK1fOKP7zVqPhfSmE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mV+6Pf3n; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mV+6Pf3n"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65b9da5fffcso5192961a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 01:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925921; x=1772530721; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2nBTYgewDD+k/FZqoLYv40zZF4/giLnf5sajOtxAWog=;
        b=mV+6Pf3nUBSJoLykIGfS4Ium4wRs62Q7H4Hl9z0aE+xCXv+yQuC1xjuiKBPFd7EWUd
         m5a5WRdHoBkZMARC82KAy3J/MYKfdHtl0iLMfm8E81tALkYf4lNB+KSM0aQpd2IQVWy3
         3IGcGyoxGY7bvVUgDASzYy8/Smh9lMSbW3vi6v6WMhA2oKbq+OI2YUMlyi4Q7iV/ClyH
         RR1hYU69RyxZg6iM5sfySzo4cEOi1vscxeH+h6WM/fmt1lqWsfVSYAcYTKY0n2S2u1su
         I4phzdjnl/XI5A0HyQBixa7XVbyclaRrZ1okKgdv7Nfrbwc1KZgABfLUm4+HeWe9+W4s
         XCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925921; x=1772530721;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nBTYgewDD+k/FZqoLYv40zZF4/giLnf5sajOtxAWog=;
        b=j4KynfYuXt3fjrJ3F7KpuE9CkhVumnBtBi4F64uZ5A/JBNoyqY4hYEiiIp84Dqz/Ol
         nadytIVkEC7sIpyUcNcgpvZF4PWQ1Wao5sfzcz//RiCNpXrbHBhMeGoSGwhTMusolpO0
         ylewesBvQiIaQp1dbNMW7jPOKS5dYtgA81j+LWda3d8vap48TOf28TOyw0HUh3bYARWE
         vk2/MlbGxs5UMyj1pyPkEELcVRB/rEJMW6cjFZTDdTgfOcRRwnreGpbMf5kJr43wh7m0
         35h1fUIV9YYdb6utCYAJf6qE0bzDzsM2vH6FqAl/EhFzZYECNNUAgAT2v6DVotuhmGE0
         4gGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKQtMpo9KsUSk3KqzWE0yGxQ0qHfkCfexM2EdM5fQLACqTM3IbdS3a4knyv9DybzUGuEhH2zk7oOS6FLLTKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyko/0q1Wn65EEaT8l4YS5I4WyybuNT84Sx4V38DR4DCAgs1Eo8
	dN0hsxOcqKlFuVbhatK2zhA+FG8PybYLpKXnA5/hYHhFedXFvtZ34gE9/5TlrC9cvHXjpwhQuTP
	3zkKrYQ6pEGJwEIL5zA==
X-Received: from edub7.prod.google.com ([2002:aa7:dc07:0:b0:65b:a997:6209])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:f25:b0:65b:f5fa:afdd with SMTP id 4fb4d7f45d1cf-65ea4ebf12cmr6015503a12.5.1771925921333;
 Tue, 24 Feb 2026 01:38:41 -0800 (PST)
Date: Tue, 24 Feb 2026 09:38:33 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJlxnWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMT3aTMvJTUIt3kosSSVN28xNxUXUPTNEOTVENjk7TkRCWgvoKi1LT MCrCZ0bG1tQCU8p44YwAAAA==
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/Pd5qdMoC8dai1US2WNMLW9PKQDRgsuslw1OCghlh8E=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnXGcTowwOY0+D/3ZA6Rc6yffPQLTWTkhQohV6
 gsaYY84vLeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZ1xnAAKCRAEWL7uWMY5
 RpbtD/0Vn7ZCfpNguz42ozcDRQybhPFFkFIA9aDElyEshf5R23cijhhaW0YylZK2wE9jbngkWUj
 RiclyGj/LiznMrmT5vmoAjCku3Qs9/dCEq09iOg+W4Dnenhh07dNhiZjGL+G//8hmHTkN+POnHK
 bgfg6zdaDQlQw7ovZ4pnOrn05u5sPWooq7X6HfbMH7OrOU1XfMaETRKFY5+YaGZnXcx3aUxc7UB
 fHcaNrB08Q/1ko318a0Xpseg7pXvmesEIQAMnrZnDquuW4Uq/jzKqDwDdA1K/g3p5hhEuHAfiQ9
 CgHD57m7G/66pVMdiNOmyUKRBkJzuXrzZsGjvkFAazAzAq1JBTwYbRk5Xe0U7a93Bdkacn1mSNa
 NR6v/U8jUDuaVzCA9pmQinelFMjCtk2ozWf6gkiaRw6DyPjPSZftivsulhzME+btUjDD5PqAByp
 cWcNa6tzRfTeJYc8vxoYOLoLNXPkyGSoMIKvcEKXgIStCBu9FcCMMwf8RlNmUjwpxHjCXgcawKz
 hB87aPbA/7oxf2j0EAT2J9NaQPtml7FjshvY+6+3gTKPoP1TKN6SK+AVCx2E2nt3ZDMzWm9nfXu
 ZJuqgKrc7dp8dJRR3xqFMWE97ca3dOyuhg/+dI7JrQbGg6MDfbPc8Ist5BuXXtvUHNuf/puJTMB td/N6cCi7s+EeaQ==
X-Mailer: b4 0.14.3
Message-ID: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
Subject: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead. This affects e.g.
symbol names in stack traces.

Thus, introduce a RUST_CRATENAME_stem.o parameter, and set it for Rust
Binder. I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o,
but RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name
argument. (Even after changing --crate-name to be passed with = instead
of space as the separator to the name.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/Makefile   |  1 +
 scripts/Makefile.build            |  4 +++-
 scripts/generate_rust_analyzer.py | 21 ++++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

