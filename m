Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEFF373BF7
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595020; cv=none; b=LiYe1f7zo5C1wLdT/Ld/RGxZQ4RgpkNkaj2Fk2ZHIq0IbMhM1Q5YTUUMCY99tTKHBW7klzlFGwsE68gVkACeh4/3KGc6pgIGWGiweIo49F92bZV0PTVlB8nnUlXbof8XkEAJq78SpkKS+g4N+JfjV/gN/eAcZpgwicx+k1fR084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595020; c=relaxed/simple;
	bh=Da/cK6OQrHU3pcAlgLxrLXJu8wvJOC9tkJMNybOwlek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIJLPkGWtxXFE6l0UFvCouq7L48LDDMZ4pxXLNQBl504uQYjd6G7X+p0W4WV1BEhhPZiJTPnJOTt0dQdudJ/WLcMKlq3/dqSsihVd0VvSKkksb3g0C8Aaf/pCCTeuK7GTytBZN9eH3PLRhCr2XShI189g9qjA4jawQFDXcpzez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbt4Z7J/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbt4Z7J/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485345e1013so34483855e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595017; x=1774199817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=Hbt4Z7J/pTX/JBJKLFLkJhcHX8Te9jRBHsvSWNnUlQiuRHV3hP7fQZrm7OkUBSD1Gb
         J3QJhFaH4HXXRowOLMg71+jZcION16MfaioBo6ogIdcHvkjDQ3UsgTsi2eGVxWEWqQmS
         HLZxSm6wwatviSEX2YQHF3Hb7wgoWzj11ZNwc4H8W5wME2A0YrI+z8jIkeXLrt0vkP2+
         NeStjmEDeM1kzfwwi6sloXfvOc7UfLjjF9P1HQCyV0QkD+FSnsi35hKLwDg39V1JL6NL
         aQpf01uSQxxmO3PfSiCOLHBPAP+VTzxAYeaGBWNCgq2O287yZG9fg3Sj0v2phZcaEPdZ
         QCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595017; x=1774199817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=sud/IuKe8osLeWsZEOT0sn+ty2fzfZVg9BXMC5h/+SQYvzDeHdajtk/vMMVT8AaCXS
         +7w0IZ86Ipa2F4pi8DLiD61R35B7p0UkQ0AfeRZ0OGmHDILsP7yBKzc6uMJ4bVgxXw7j
         cNszAdkYi37QWGzQieSIh84HQWEn/CscTux4JbmOgXl5sMhEahv+98KTz0qAkogJvmCL
         OrcgLWEyi9r2QR2NZApS+RVaHQa8t3xjVjiLuCuD1MbGVv8M0qpbs3kfE6+gxCx2fVS7
         KFnQ2f22eYdF36nLtR+tEHHqCYFY0466e51HhO0Xe1841uKeLXGpAJh48pUeddV5NAPj
         l+vg==
X-Forwarded-Encrypted: i=1; AJvYcCV1YyPMXCfWJATVzSFpP8LwAXVmI1A91viPO7uS/40aFG12xP2wLy3zfLRlfkAQafQ49LcVjY79dYe76pnLFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsYAz7suAuDVzDNlB6t9kBcvHW8w1YmJj4H0A4P0JtGBw81cD
	SuFo9sV9ewE1tK2NmXcA+da7jPJdxlltRL/VlgCLFm3EMNGL/dzCLxwF
X-Gm-Gg: ATEYQzz+uHVOblr5x1NcTUXUI+lMNTCG8vviaQ+yf1pkbQdcVO/bPcZFf+DgiZ5uQRy
	hFH6sqyuDmfpuZr1UjQLFz6QIVkQWd+QUAN27c81ku1i+DqCBDla0uajVU5kNwDVCTITEeTU2/+
	diHobPSkfSW/lDH7t7acyU7+2b9OGffU1LZCMJ5kywbaLGdHlVrVn/KgOiw3FAvguKnEgqYyGDJ
	3hCdJgr/VaAM1K31e7VD1EP9+2gU/CVlMqsriXmgCIu2PawPncgm48z/Sr5LDcirKsC0fYD7kqk
	11aoO1AlgPprsq3godH8o7XUNnWFNLNm881G0VHP0FeMfgGp8BtczkzV7yl9mOvleWeaPhCYslP
	wwQiKBYEQv6dpEXO5L8sghsmWRk2QSPVkBFJYmZdBnRdYln3Hx//UOK80eVIlc+ZPWSDQhLAjp2
	UOSUxRjZbgBznNMCGh5A45/sHd3EE5MvQbVA==
X-Received: by 2002:a05:600c:230c:b0:485:3a4f:8bfb with SMTP id 5b1f17b1804b1-4854f56bf7bmr178045195e9.6.1773595016983;
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:16:49 +0100
Message-ID: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

Adrian Garcia Cicuelo (3):
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.34.1
