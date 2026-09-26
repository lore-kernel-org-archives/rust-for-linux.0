Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800221ADC7
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444001; cv=none; b=hTMW28wcn1GcLZocX78O6oOAbE6SVt4L6CensR1Q7+bHqu2RTiPQ1FS1MJ0fqPfFPn0+VeaITwscy+WK+MZ+Sm1oW0N0VIUDjzppTlPYak5p4ZCsqk3oppDtnnRCCYIRJvZ5DPdVEV+npBFEdU2qAmYWKcJuuyXh8rBCvR8UGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444001; c=relaxed/simple;
	bh=qjlZJ639bP4madGVmc2k1ZgbLWYVq7n6GdvWsoP1Veo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icTTrXngXqfIaHAHvQ3FuNrototdBfsFqycbzdJoZ2Ul/rkbB/+7WD8zWjRXpDHtIi7AagzK4uK/JkcfDXHevuCo3bJdRbEEUa+6x6FQ4esQbrIRunVTkyH4jE8nk0Cd5IICucK8dun4zfWFe2QaFMvN68OVrtRwnbCFcKNRw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pyubcm4Y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pyubcm4Y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso16487925e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443998; x=1791048798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=paso3MHh8XUGJdfP/nJDVx+gtPLafb5aKnJ/gNlnGsk=;
        b=Pyubcm4YIY+aDJXWA6Cqq5iehVgJmKHC4f0kCxJw2HKChLvKHzwigGm8vmmSXSJGAp
         hYzBtV4Txms39gUuvLgd6r9auiWQGe/WPfyFfhI/+QgVZhufh9Hkn1a8i3+qU/ojI4qS
         2YD3WdO34hBNgbRWNIhFMWkmr38EYzsScwvEL5aB0bOy1lBTxLrpDNhf3S70SdgZg1mk
         srmFl92EJHhzVx+WgzJLpZA6QjtLvTSh45J3/2AAcu/Aeb7wESqxJnHb6+lqgTu208DC
         Gzug7vLcszZldEtT2+viT+RQdx/nH1w3JoKCLn/CWMT2SvSv4JJu2dbbSN4DHveg9VSA
         URtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443998; x=1791048798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paso3MHh8XUGJdfP/nJDVx+gtPLafb5aKnJ/gNlnGsk=;
        b=kBHPlMh3ZnUP9yua8dcL/tvo4JSUpJ/0n/jNAy7nJIYSnYA7SBV99hgQTsIDlnBxne
         AooxGcvvm4Kf5TwuqkqRovSvZGp/nzc4Pm8XBDZ05ZRR3PuLuNFkTu7WL45lhCM9QhN6
         K4YYZ8ES7mVHHKT3nJ16YBNo5a7unwbermoxW2OPgyaiapjkxi0k+PeYmL/bOrHd2hoH
         PF64hBTYsSKnoflXwBazVMVCQN8q0XNeP9eIbAch4COF2P3NptW6GadvAO6VinQXUKCk
         3OwiCEtpk340TzunVcUg7Ta93adV/o438Pa6EQ40p0S26h+NE8zLHnASIPl7paAeV5B+
         WLXg==
X-Forwarded-Encrypted: i=1; AKwUvBxMWfNzHdZoHeKK8DNEGvTawhE+I/l7/5vdtStQbHQ+1oz0FGqOs5utXvdDYfY9RS3eglWaWkClFrfZkH9SHw==@vger.kernel.org
X-Gm-Message-State: AFuF++k6apG/kNKiPN2heM8slH00oc35Yh7ACH07HRstFeNmKKJ+2ema
	Me0DTzLQnNCzftKc2qzPnl/qdRecoKMlxHX6saH64nPtzMH8635zbjf1
X-Gm-Gg: AYBFou1sSRjWeQqVRnvikHwKu3xo3tnmvI0/ykT9Oz2vLH1CVtgWy1h1c1dRbJc6utr
	X7dZk7+Aawp+KYa/fZG2ouLLTZ9rZYt5DdWu4L8DszKvfTyvMD17Z50ueIlBnCs7eT72HeE5m5+
	PNgryKRBD/O/h8oRo4Ngv2KG9deZe6iN7pQJwLLU+t9ZH7kmkt0qoGk1ToS89Pr+/j9hoUYTn2l
	FLtwnneeDT2IuThVOOWMB/KeKaSee4XJl+aWOtafLLR/8yJKHW7mBPMvVm0IE/3sUPLTDwYBqUK
	eAuP1VFPofHH6Vc1GIDRLqYAcLMTDSTwk0kZSWpJdE7ZyS+ZvCbHgr4MZ3kZSl2Zjp/Kwn3134W
	TP7CJ8U0bGR8W98VjHHK6YVxk+JcIWhzRDnqS2qg45TzYLMmZWSvdX73MMZrgQrbqVsrrDX/p1c
	vmUWN/SlbX/Mh+FhDOpv8JJz7XIPJZFgtGgV7rw8h4rUCBmHw/cmYN50j2bI3bNg9U2wZXXpgKl
	En9kPRFOyFilVvW+TmadO2mK29nfCadRe5iheWhJn67XXaoVeldWD4HbfOkRkZVTME=
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr153040265e9.18.1790443998088;
        Sat, 26 Sep 2026 10:33:18 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:17 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] rust: add DropGuard
Date: Sat, 26 Sep 2026 20:33:10 +0300
Message-ID: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Rust kernel DropGuard API and migrate the existing ScopeGuard
users in the block, serdev, and locking code.

DropGuard runs a FnOnce callback when dropped and provides dismiss() to
take ownership of the wrapped value without running the cleanup callback.

Changes since v2:
- Clarified why DropGuard is added alongside the existing ScopeGuard.
- Fixed the core imports in mem.rs to follow the Rust kernel import style.

The series was previously tested with:
- make LLVM=1 rustfmtcheck
- make LLVM=1 rustdoc
- make LLVM=1 -j$(nproc)
- git diff --check
- scripts/checkpatch.pl

The changes in v3 are limited to the import style and commit-message
clarification.

Mohamed Osama (5):
  rust: add DropGuard KUnit test configuration
  rust: mem: add DropGuard
  rust: block: gen_disk: use DropGuard
  rust: serdev: use DropGuard
  rust: sync: lock: use DropGuard

 rust/kernel/Kconfig.test         |  10 +++
 rust/kernel/block/mq/gen_disk.rs |  11 +--
 rust/kernel/mem.rs               | 121 +++++++++++++++++++++++++++++++
 rust/kernel/serdev.rs            |  10 +--
 rust/kernel/sync/lock.rs         |   5 +-
 5 files changed, 144 insertions(+), 13 deletions(-)

-- 
2.43.0

