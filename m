Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED12377551
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595518; cv=none; b=C1msUUgkUo4VG65bu0kGauIjMImqgMq/WzBsi8QtQDG/Cq9yNt/PjuQOCnpkHuK2gf5Ap3OoaSW2PMiyiKkAjp9OTZAYwU5OxM+E9qU6WTB7nx1utCz2BId+f9j1bPcZZqO+fzpqJF47Rg5x32D+RhkiyoWFqm4LroFb9dtl/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595518; c=relaxed/simple;
	bh=t4IEjrlPC/zChObroSpygBEwzjH0OsQxo5JZHzvQ1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VV26TY3xIMoDnlBNKJvaNku8LvJkAXJd5lNveyrPr/qoWxXfay2RgzOGozBzc5IpjNe9p01Bq07fV7QXZt/6umYLmBBjFRdKuOSqQK13ejoIrmpYqIjOs5PmcqHAsUUhus6G4G0fcK3sm0kFqfpfe7NYW+DhU/IWbe0Qk82iX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFJKUc7m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFJKUc7m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c56e822eso4056856f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595514; x=1774200314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=PFJKUc7mj/jOLsLlx0u0TGb7O5VMQ83GWjJicV52NVFxFjGZ7jqvKmGPXxbz5yMEWz
         R7FQQsrdHqcx5nuCYm9wspa0/1nuz1zFXJGo3PUcJDs8hAS9xRvvJ5vG/1D9b1vNBrzS
         N+E5QMy9GUBapnga4VofMPLgcpuisvI3S5zOSJ93EY8WXDkdAe6oammnMRMdN1TyGn1y
         oAaTgz3xRPu5Z6VBGdpsoaZyuADhws6RT4MAfEagM9V1a6IM6sc9dfr/G7coI9U+oPTJ
         mfoKyDWCpu45R2undLLqM7aMNRYYxlKRO7WKN2JlhXR+bTWmlp5ge+AhIQ2q7x7iuSw9
         hbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595514; x=1774200314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=Rc1RLy4XCt0g0Ax7LoNC+7pVzTlIO9cgoZMJmmXOKneQNt0qZkQpDSrL8MDS+Kzfhr
         BTcbOE8GpyIdFvsxugezAXmBU0mx71XlRJFyykdPz7tYLugNzXUrc47eIRC7f24qzXw5
         TBX893RqfmqctViEhqA91gB8ju7cicfZL3PsdhP0FRrhaNN+Ru2aeDBqjyP2+5E/U9Kh
         sXPJMMungMIi4A5eXBG51ecObmJvNN1FvPMcnbLStJRQuKT0J0XwW6Xo8mwQtp8Qe/kZ
         E0yyrZ0eozlkeOFF2JK81NhJ9BvgHyc/ZoxduhWmwQrzZNSc9FoRxEyEFDq7b/k4BUDT
         +INw==
X-Forwarded-Encrypted: i=1; AJvYcCXaISw73bkxYF/6ssZOJGuBDqo90bEQGg31UGNDIYjGeU8o0StzPEU1NI4q5ESPldfT4XNDWwpyL03DUVIO9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCh/Z4amghvT4QbfIv2rzSzNm8D6tK4JGQ4eNuwtxy1c5bE4KQ
	NQjJdpx6zh/c284tklR45TR/nY8cMGSMVbIXUkyVS/NeocCn335DnCK4
X-Gm-Gg: ATEYQzwLAAitItE3Qtz7+54aDa4b3T3afl5M6leFd92HnNw8VWVFiTrzB08kpcgIaqH
	jmhX6NVm+gvSabudoPOTbLugcM0mBUpkEXibwyLtms2zEffnjFBTgXW+TE3zsbVT/csQO7ZVJ4n
	tHaZvW4gF6lFgUJ8bDVp/y9x/ya+G+aZvHzd4KYpQ9rBZ5XM1097jlIlsWcr3pkICfNDk53161f
	XVCBKdPI1eP4rd6B9hFU6kn1lzdDdFW1DVm1Fa2lXCfk0crQLNsVfgbFPMK7vqXNv8yTtJg8n9K
	HmevFEQ2QlS6sMBbwxsN2AtLqWIJoaEJ93LBIQ8Vq2P9c9/W4F/YIb4psyP9zJ4g48KrgpwvuSx
	d7Y7m9X4ZxF4c5kAsDhbqAu+W/kKlVRB42QLoX+IcgNJljtj3RXV5iY9hdNpcPFqBqiJTDCZc8h
	u36+mTHTD/JjdsTui+z/QM6oQITwJ3pF3TP4k=
X-Received: by 2002:a05:600c:45d5:b0:485:40a6:442e with SMTP id 5b1f17b1804b1-4855649c956mr173044125e9.0.1773595513423;
        Sun, 15 Mar 2026 10:25:13 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:25:04 +0100
Message-ID: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series provides functional optimizations and alignments for 
multiple kernel components, specifically targeting MMC quirks, 
Rust block driver abstractions, and iwlwifi interrupt affinity.

These changes were previously submitted as a single monolithic patch 
but have now been split into logical, atomic commits as requested. 
The code style has been verified against checkpatch.pl.

Summary of changes:
1. MMC: Consolidate imx25/35 quirk data and add Kingston CID support.
2. Rust: Update rnull driver to use Pin<KBox<QueueData>> for alignment
   with kernel 7.0 zero-copy initialization.
3. iwlwifi: Optimize MSI-X interrupt affinity mapping by skipping 
   the boot core (CPU0) for high-rate RSS queues.

v1 -> v2:
- Split monolithic patch into logical commits.
- Updated author and email to Adrián García Casado <adriangarciacasado42@gmail.com>.
- Removed accidental addition of nested kernel repository.
- Fixed Rust code style (line wrapping).
- Fixed iwlwifi white space issue.
- Wrapped commit descriptions to 75 characters.

Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-mmc@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-block@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Adrián García Casado (3):
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.47.3
