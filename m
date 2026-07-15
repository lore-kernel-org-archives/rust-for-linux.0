Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55433C3BF6;
	Wed, 15 Jul 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145331; cv=none; b=NELItIHwapohxwtW1mjvpQG/GhCf/3lsmUTXmU8UgAM9fHGJ/YeVSoRytZGYjrupaGMVT4ZnqdaRibOnPVQzzEAptSArZoYCPJzsEbrXuKYLBuHABxqr4hNbbv2jThsRa2FQurITPUhghIOsrAGrH+7E9sRDqHVpLV9nXCAGlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145331; c=relaxed/simple;
	bh=D8GSlqsmABCX6HH0/kPIwChuUbarXwm2ISjC5WCB7Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uIxDSnssDHSPwX8Tij7YxvHV9qcmkad/6OepFGc2agyEksHBF8JXHiP5flk0oLp2SV3eQbm+VSLVcaqL2pCR6gsbOmARC+pxMD2GncdL5tyOEkSqdr/JcW/fxu95k3zhzFt/R+g7b1Q4COIqhunucAAAuwvxEKj6tHu/8+Ir50Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 353A7F40D2B; Wed, 15 Jul 2026 21:55:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Andy Shevchenko <andy@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] nvmem: fix a const-unsoundness in reg_write
Date: Wed, 15 Jul 2026 21:55:16 +0200
Message-ID: <20260715195520.25410-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This callback used to take a mutable void * for no reason, which causes
the compiler to be unaware that the val buffer should never be modified
by the callback.

This was found while drafting the nvmem-provider Rust abstraction.

Thanks to the guidance of Andy Shevchenko, this now introduces a new
callback and deprecates the existing one, with the goal of renaming the
new one into the old one once no user remains in the kernel.

Changes since v1:
- Link to v1:
  https://lore.kernel.org/rust-for-linux/20260715175229.24672-1-linkmauve@linkmauve.fr/
- Removed all changes to other subsystems than nvmem.
- Added a new reg_write_const callback instead of changing the exisitng
  reg_write.
- Deprecated the existing reg_write callback, it will get removed once
  all users in the kernel will be done migrating to the new one.

Link Mauve (2):
  nvmem: core: deprecate reg_write callback and add reg_write_const
  nvmem: make all reg_write callbacks take const void *

 drivers/nvmem/apple-spmi-nvmem.c    |  2 +-
 drivers/nvmem/bcm-ocotp.c           |  6 +++---
 drivers/nvmem/core.c                | 26 +++++++++++++++++---------
 drivers/nvmem/imx-ocotp-scu.c       |  6 +++---
 drivers/nvmem/imx-ocotp.c           |  6 +++---
 drivers/nvmem/internals.h           |  1 +
 drivers/nvmem/lan9662-otpc.c        |  6 +++---
 drivers/nvmem/lpc18xx_eeprom.c      |  6 +++---
 drivers/nvmem/max77759-nvmem.c      |  4 ++--
 drivers/nvmem/meson-efuse.c         |  6 +++---
 drivers/nvmem/qcom-spmi-sdam.c      |  4 ++--
 drivers/nvmem/qfprom.c              |  6 +++---
 drivers/nvmem/rave-sp-eeprom.c      |  6 +++---
 drivers/nvmem/snvs_lpgpr.c          |  4 ++--
 drivers/nvmem/sprd-efuse.c          |  6 +++---
 drivers/nvmem/stm32-bsec-optee-ta.c |  2 +-
 drivers/nvmem/stm32-bsec-optee-ta.h |  4 ++--
 drivers/nvmem/stm32-romem.c         | 10 +++++-----
 drivers/nvmem/zynqmp_nvmem.c        |  6 +++---
 include/linux/nvmem-provider.h      |  6 +++++-
 20 files changed, 68 insertions(+), 55 deletions(-)

-- 
2.55.0

