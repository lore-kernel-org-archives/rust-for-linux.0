Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3BD2931F4;
	Sun, 20 Sep 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902614; cv=none; b=jd0rx8uuWFyYgt4zcP0+VnVNeW7eKeq4IWQqXUzBOOx0ztLo5PSJN92+fvWsMgMTCFcMJfdAo+uE6HLjYq50U8Lwuloo4xtzP86uMXDd1g+J1CmnWlzaK5o4r+BSTj/2TyVXNO6NHvizs2DiPo41mdpIUzcG95R6/jjvcs2La2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902614; c=relaxed/simple;
	bh=fYybqLjSAZI7AvqUqCYItP4h4Y9EeCROjYr6s4wtruo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghyqmhvuHtuTWnStcOxPHu+QVaabX9TcF6jXaQ3VKAhwfoa+HOsBSNyxNBYtvOFrD+htyBbz+mIpiyjZpfvO9lIRmuu9lwFW9AgqaLcuTm56ceVnYqTm6M8YXognyt+vy0P1Qw8tIlJ+D4735+y24OIej5To0PKskj3m5Qp7ZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 88FA67189A5E; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v6 3/4] nvmem: make all reg_write callbacks take const void *
Date: Sun, 20 Sep 2026 13:09:56 +0200
Message-ID: <20260920111000.2404131-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous commit switched from a pointer to mutable data to a pointer
to immutable data, so let’s fix all users of this API in the nvmem
subsystem.

Other subsystems will go through their own tree at their respective
pace, and only when the last reg_write callback will be removed we will
rename reg_write_const back to reg_write.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/apple-spmi-nvmem.c    |  4 ++--
 drivers/nvmem/at24.c                |  6 +++---
 drivers/nvmem/at25.c                |  4 ++--
 drivers/nvmem/bcm-ocotp.c           |  8 ++++----
 drivers/nvmem/eeprom_93xx46.c       |  6 +++---
 drivers/nvmem/imx-ocotp-scu.c       |  6 +++---
 drivers/nvmem/imx-ocotp.c           |  6 +++---
 drivers/nvmem/lan9662-otpc.c        |  6 +++---
 drivers/nvmem/lpc18xx_eeprom.c      |  6 +++---
 drivers/nvmem/m24lr.c               |  4 ++--
 drivers/nvmem/max77759-nvmem.c      |  4 ++--
 drivers/nvmem/meson-efuse.c         |  4 ++--
 drivers/nvmem/qcom-spmi-sdam.c      |  6 +++---
 drivers/nvmem/qfprom.c              |  6 +++---
 drivers/nvmem/rave-sp-eeprom.c      |  6 +++---
 drivers/nvmem/snvs_lpgpr.c          |  4 ++--
 drivers/nvmem/sprd-efuse.c          |  6 +++---
 drivers/nvmem/stm32-bsec-optee-ta.c |  2 +-
 drivers/nvmem/stm32-bsec-optee-ta.h |  4 ++--
 drivers/nvmem/stm32-romem.c         | 10 +++++-----
 drivers/nvmem/zynqmp_nvmem.c        |  6 +++---
 21 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-nvmem.c
index 7acb0c07d6ab..63b2b11d78f9 100644
--- a/drivers/nvmem/apple-spmi-nvmem.c
+++ b/drivers/nvmem/apple-spmi-nvmem.c
@@ -26,7 +26,7 @@ static int apple_spmi_nvmem_read(void *priv, unsigned int offset, void *val,
 	return regmap_bulk_read(map, offset, val, bytes);
 }
 
-static int apple_spmi_nvmem_write(void *priv, unsigned int offset, void *val,
+static int apple_spmi_nvmem_write(void *priv, unsigned int offset, const void *val,
 				  size_t bytes)
 {
 	struct regmap *map = priv;
@@ -45,7 +45,7 @@ static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
 		.stride = 1,
 		.size = 0xffff,
 		.reg_read = apple_spmi_nvmem_read,
-		.reg_write = apple_spmi_nvmem_write,
+		.reg_write_const = apple_spmi_nvmem_write,
 	};
 
 	regmap = devm_regmap_init_spmi_ext(sdev, &apple_spmi_regmap_config);
diff --git a/drivers/nvmem/at24.c b/drivers/nvmem/at24.c
index 772c4d9fa651..6e3fe353c376 100644
--- a/drivers/nvmem/at24.c
+++ b/drivers/nvmem/at24.c
@@ -477,11 +477,11 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	return 0;
 }
 
-static int at24_write(void *priv, unsigned int off, void *val, size_t count)
+static int at24_write(void *priv, unsigned int off, const void *val, size_t count)
 {
 	struct at24_data *at24;
 	struct device *dev;
-	char *buf = val;
+	const char *buf = val;
 	int ret;
 
 	at24 = priv;
@@ -743,7 +743,7 @@ static int at24_probe(struct i2c_client *client)
 	nvmem_config.compat = true;
 	nvmem_config.base_dev = dev;
 	nvmem_config.reg_read = at24_read;
-	nvmem_config.reg_write = at24_write;
+	nvmem_config.reg_write_const = at24_write;
 	nvmem_config.priv = at24;
 	nvmem_config.stride = 1;
 	nvmem_config.word_size = 1;
diff --git a/drivers/nvmem/at25.c b/drivers/nvmem/at25.c
index bc2cfb75d9bb..bb5fb7b692f4 100644
--- a/drivers/nvmem/at25.c
+++ b/drivers/nvmem/at25.c
@@ -235,7 +235,7 @@ static int at25_wait_ready(struct at25_data *at25)
 	return bounce[0];
 }
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static int at25_ee_write(void *priv, unsigned int off, const void *val, size_t count)
 {
 	u8 *bounce __free(kfree) = kmalloc(min(count, io_limit), GFP_KERNEL);
 	struct at25_data *at25 = priv;
@@ -544,7 +544,7 @@ static int at25_probe(struct spi_mem *mem)
 	at25->nvmem_config.compat = true;
 	at25->nvmem_config.base_dev = &spi->dev;
 	at25->nvmem_config.reg_read = at25_ee_read;
-	at25->nvmem_config.reg_write = at25_ee_write;
+	at25->nvmem_config.reg_write_const = at25_ee_write;
 	at25->nvmem_config.priv = at25;
 	at25->nvmem_config.stride = 1;
 	at25->nvmem_config.word_size = 1;
diff --git a/drivers/nvmem/bcm-ocotp.c b/drivers/nvmem/bcm-ocotp.c
index 2490f44caa40..02adfd787de8 100644
--- a/drivers/nvmem/bcm-ocotp.c
+++ b/drivers/nvmem/bcm-ocotp.c
@@ -179,11 +179,11 @@ static int bcm_otpc_read(void *context, unsigned int offset, void *val,
 	return 0;
 }
 
-static int bcm_otpc_write(void *context, unsigned int offset, void *val,
-	size_t bytes)
+static int bcm_otpc_write(void *context, unsigned int offset, const void *val,
+			  size_t bytes)
 {
 	struct otpc_priv *priv = context;
-	u32 *buf = val;
+	const u32 *buf = val;
 	u32 bytes_written;
 	u32 address = offset / priv->config->word_size;
 	int i, ret;
@@ -223,7 +223,7 @@ static struct nvmem_config bcm_otpc_nvmem_config = {
 	.word_size = 4,
 	.stride = 4,
 	.reg_read = bcm_otpc_read,
-	.reg_write = bcm_otpc_write,
+	.reg_write_const = bcm_otpc_write,
 };
 
 static const struct of_device_id bcm_otpc_dt_ids[] = {
diff --git a/drivers/nvmem/eeprom_93xx46.c b/drivers/nvmem/eeprom_93xx46.c
index f9c3ab52c2f9..c8c15b91e624 100644
--- a/drivers/nvmem/eeprom_93xx46.c
+++ b/drivers/nvmem/eeprom_93xx46.c
@@ -268,10 +268,10 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 }
 
 static int eeprom_93xx46_write(void *priv, unsigned int off,
-				   void *val, size_t count)
+			       const void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
-	char *buf = val;
+	const char *buf = val;
 	int ret, step = 1;
 	unsigned int i;
 
@@ -510,7 +510,7 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
 	edev->nvmem_config.compat = true;
 	edev->nvmem_config.base_dev = &spi->dev;
 	edev->nvmem_config.reg_read = eeprom_93xx46_read;
-	edev->nvmem_config.reg_write = eeprom_93xx46_write;
+	edev->nvmem_config.reg_write_const = eeprom_93xx46_write;
 	edev->nvmem_config.priv = edev;
 	edev->nvmem_config.stride = 4;
 	edev->nvmem_config.word_size = 1;
diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index 517d83e11af2..57008228100f 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -178,11 +178,11 @@ static int imx_scu_ocotp_read(void *context, unsigned int offset,
 }
 
 static int imx_scu_ocotp_write(void *context, unsigned int offset,
-			       void *val, size_t bytes)
+			       const void *val, size_t bytes)
 {
 	struct ocotp_priv *priv = context;
 	struct arm_smccc_res res;
-	u32 *buf = val;
+	const u32 *buf = val;
 	u32 tmp;
 	u32 index;
 	int ret;
@@ -226,7 +226,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.stride = 1,
 	.owner = THIS_MODULE,
 	.reg_read = imx_scu_ocotp_read,
-	.reg_write = imx_scu_ocotp_write,
+	.reg_write_const = imx_scu_ocotp_write,
 };
 
 static const struct of_device_id imx_scu_ocotp_dt_ids[] = {
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 108d78d7f6cb..36d4a37aed93 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -310,11 +310,11 @@ static void imx_ocotp_set_imx7_timing(struct ocotp_priv *priv)
 	writel(timing, priv->base + IMX_OCOTP_ADDR_TIMING);
 }
 
-static int imx_ocotp_write(void *context, unsigned int offset, void *val,
+static int imx_ocotp_write(void *context, unsigned int offset, const void *val,
 			   size_t bytes)
 {
 	struct ocotp_priv *priv = context;
-	u32 *buf = val;
+	const u32 *buf = val;
 	int ret;
 
 	u32 ctrl;
@@ -483,7 +483,7 @@ static struct nvmem_config imx_ocotp_nvmem_config = {
 	.word_size = 4,
 	.stride = 1,
 	.reg_read = imx_ocotp_read,
-	.reg_write = imx_ocotp_write,
+	.reg_write_const = imx_ocotp_write,
 };
 
 static const struct ocotp_params imx6q_params = {
diff --git a/drivers/nvmem/lan9662-otpc.c b/drivers/nvmem/lan9662-otpc.c
index 62d1d6381bf8..f586ae4cd126 100644
--- a/drivers/nvmem/lan9662-otpc.c
+++ b/drivers/nvmem/lan9662-otpc.c
@@ -139,10 +139,10 @@ static int lan9662_otp_read(void *context, unsigned int offset,
 }
 
 static int lan9662_otp_write(void *context, unsigned int offset,
-			     void *_val, size_t bytes)
+			     const void *_val, size_t bytes)
 {
 	struct lan9662_otp *otp = context;
-	u8 *val = _val;
+	const u8 *val = _val;
 	u8 data, newdata;
 	int i, rc = 0;
 
@@ -174,7 +174,7 @@ static struct nvmem_config otp_config = {
 	.stride = 1,
 	.word_size = 1,
 	.reg_read = lan9662_otp_read,
-	.reg_write = lan9662_otp_write,
+	.reg_write_const = lan9662_otp_write,
 };
 
 static int lan9662_otp_probe(struct platform_device *pdev)
diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eeprom.c
index 504155e30bab..78a35ef095fb 100644
--- a/drivers/nvmem/lpc18xx_eeprom.c
+++ b/drivers/nvmem/lpc18xx_eeprom.c
@@ -87,7 +87,7 @@ static int lpc18xx_eeprom_busywait_until_prog(struct lpc18xx_eeprom_dev *eeprom)
 }
 
 static int lpc18xx_eeprom_gather_write(void *context, unsigned int reg,
-				       void *val, size_t bytes)
+				       const void *val, size_t bytes)
 {
 	struct lpc18xx_eeprom_dev *eeprom = context;
 	unsigned int offset = reg;
@@ -109,7 +109,7 @@ static int lpc18xx_eeprom_gather_write(void *context, unsigned int reg,
 	usleep_range(100, 200);
 
 	while (bytes) {
-		writel(*(u32 *)val, eeprom->mem_base + offset);
+		writel(*(const u32 *)val, eeprom->mem_base + offset);
 		ret = lpc18xx_eeprom_busywait_until_prog(eeprom);
 		if (ret < 0)
 			return ret;
@@ -155,7 +155,7 @@ static struct nvmem_config lpc18xx_nvmem_config = {
 	.stride = 4,
 	.word_size = 4,
 	.reg_read = lpc18xx_eeprom_read,
-	.reg_write = lpc18xx_eeprom_gather_write,
+	.reg_write_const = lpc18xx_eeprom_gather_write,
 };
 
 static int lpc18xx_eeprom_probe(struct platform_device *pdev)
diff --git a/drivers/nvmem/m24lr.c b/drivers/nvmem/m24lr.c
index 7a9fd45a8e46..35c66304399f 100644
--- a/drivers/nvmem/m24lr.c
+++ b/drivers/nvmem/m24lr.c
@@ -374,7 +374,7 @@ static int m24lr_nvmem_read(void *priv, unsigned int offset, void *val,
 	return 0;
 }
 
-static int m24lr_nvmem_write(void *priv, unsigned int offset, void *val,
+static int m24lr_nvmem_write(void *priv, unsigned int offset, const void *val,
 			     size_t bytes)
 {
 	ssize_t err;
@@ -548,7 +548,7 @@ static int m24lr_probe(struct i2c_client *client)
 	nvmem_conf.owner = THIS_MODULE;
 	nvmem_conf.type = NVMEM_TYPE_EEPROM;
 	nvmem_conf.reg_read = m24lr_nvmem_read;
-	nvmem_conf.reg_write = m24lr_nvmem_write;
+	nvmem_conf.reg_write_const = m24lr_nvmem_write;
 	nvmem_conf.size = chip->eeprom_size;
 	nvmem_conf.word_size = 1;
 	nvmem_conf.stride = 1;
diff --git a/drivers/nvmem/max77759-nvmem.c b/drivers/nvmem/max77759-nvmem.c
index 283000ec3a2c..86c025cfc2f6 100644
--- a/drivers/nvmem/max77759-nvmem.c
+++ b/drivers/nvmem/max77759-nvmem.c
@@ -59,7 +59,7 @@ static int max77759_nvmem_reg_read(void *priv, unsigned int offset,
 }
 
 static int max77759_nvmem_reg_write(void *priv, unsigned int offset,
-				    void *val, size_t bytes)
+				    const void *val, size_t bytes)
 {
 	struct max77759_nvmem *nvmem = priv;
 	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
@@ -99,7 +99,7 @@ static int max77759_nvmem_probe(struct platform_device *pdev)
 		.word_size = sizeof(u8),
 		.stride = sizeof(u8),
 		.reg_read = max77759_nvmem_reg_read,
-		.reg_write = max77759_nvmem_reg_write,
+		.reg_write_const = max77759_nvmem_reg_write,
 	};
 	struct max77759_nvmem *nvmem;
 
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index f71854f89950..5e056e707a96 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -27,7 +27,7 @@ static int meson_efuse_read(void *context, unsigned int offset,
 }
 
 static int meson_efuse_write(void *context, unsigned int offset,
-			     void *val, size_t bytes)
+			     const void *val, size_t bytes)
 {
 	struct meson_sm_firmware *fw = context;
 	int ret;
@@ -83,7 +83,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	econfig->stride = 1;
 	econfig->word_size = 1;
 	econfig->reg_read = meson_efuse_read;
-	econfig->reg_write = meson_efuse_write;
+	econfig->reg_write_const = meson_efuse_write;
 	econfig->size = size;
 	econfig->priv = fw;
 
diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 4f1cca6eab71..10febaf9e427 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -81,8 +81,8 @@ static int sdam_read(void *priv, unsigned int offset, void *val,
 	return rc;
 }
 
-static int sdam_write(void *priv, unsigned int offset, void *val,
-				size_t bytes)
+static int sdam_write(void *priv, unsigned int offset, const void *val,
+		      size_t bytes)
 {
 	struct sdam_chip *sdam = priv;
 	struct device *dev = sdam->sdam_config.dev;
@@ -147,7 +147,7 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->sdam_config.size = sdam->size;
 	sdam->sdam_config.word_size = 1;
 	sdam->sdam_config.reg_read = sdam_read;
-	sdam->sdam_config.reg_write = sdam_write;
+	sdam->sdam_config.reg_write_const = sdam_write;
 	sdam->sdam_config.priv = sdam;
 
 	nvmem = devm_nvmem_register(&pdev->dev, &sdam->sdam_config);
diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 1de3435df116..16b7f647a3f6 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -252,13 +252,13 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
  *
  * Return: 0 or -err.
  */
-static int qfprom_reg_write(void *context, unsigned int reg, void *_val,
+static int qfprom_reg_write(void *context, unsigned int reg, const void *_val,
 			    size_t bytes)
 {
 	struct qfprom_priv *priv = context;
 	struct qfprom_touched_values old;
 	int words = bytes / 4;
-	u32 *value = _val;
+	const u32 *value = _val;
 	u32 blow_status;
 	int ret;
 	int i;
@@ -443,7 +443,7 @@ static int qfprom_probe(struct platform_device *pdev)
 
 		/* Only enable writing if we have SoC data and a valid clock */
 		if (priv->soc_data && priv->secclk)
-			econfig.reg_write = qfprom_reg_write;
+			econfig.reg_write_const = qfprom_reg_write;
 	}
 
 	pm_runtime_enable(dev);
diff --git a/drivers/nvmem/rave-sp-eeprom.c b/drivers/nvmem/rave-sp-eeprom.c
index 9ecf3873cbb7..c703d303eb6c 100644
--- a/drivers/nvmem/rave-sp-eeprom.c
+++ b/drivers/nvmem/rave-sp-eeprom.c
@@ -278,10 +278,10 @@ static int rave_sp_eeprom_reg_read(void *eeprom, unsigned int offset,
 }
 
 static int rave_sp_eeprom_reg_write(void *eeprom, unsigned int offset,
-				    void *val, size_t bytes)
+				    const void *val, size_t bytes)
 {
 	return rave_sp_eeprom_access(eeprom, RAVE_SP_EEPROM_WRITE,
-				     offset, val, bytes);
+				     offset, (void *)val, bytes);
 }
 
 static int rave_sp_eeprom_probe(struct platform_device *pdev)
@@ -331,7 +331,7 @@ static int rave_sp_eeprom_probe(struct platform_device *pdev)
 	config.add_legacy_fixed_of_cells	= true;
 	config.size		= size;
 	config.reg_read		= rave_sp_eeprom_reg_read;
-	config.reg_write	= rave_sp_eeprom_reg_write;
+	config.reg_write_const	= rave_sp_eeprom_reg_write;
 	config.word_size	= 1;
 	config.stride		= 1;
 
diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
index 89c27112320f..3e76d33dff20 100644
--- a/drivers/nvmem/snvs_lpgpr.c
+++ b/drivers/nvmem/snvs_lpgpr.c
@@ -50,7 +50,7 @@ static const struct snvs_lpgpr_cfg snvs_lpgpr_cfg_imx7d = {
 	.size		= 16,
 };
 
-static int snvs_lpgpr_write(void *context, unsigned int offset, void *val,
+static int snvs_lpgpr_write(void *context, unsigned int offset, const void *val,
 			    size_t bytes)
 {
 	struct snvs_lpgpr_priv *priv = context;
@@ -127,7 +127,7 @@ static int snvs_lpgpr_probe(struct platform_device *pdev)
 	cfg->size = dcfg->size;
 	cfg->owner = THIS_MODULE;
 	cfg->reg_read  = snvs_lpgpr_read;
-	cfg->reg_write = snvs_lpgpr_write;
+	cfg->reg_write_const = snvs_lpgpr_write;
 
 	nvmem = devm_nvmem_register(dev, cfg);
 
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 1a7e4e5d8b86..f960fa8cb25c 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -192,7 +192,7 @@ static void sprd_efuse_set_prog_en(struct sprd_efuse *efuse, bool en)
 }
 
 static int sprd_efuse_raw_prog(struct sprd_efuse *efuse, u32 blk, bool doub,
-			       bool lock, u32 *data)
+			       bool lock, const u32 *data)
 {
 	u32 status;
 	int ret = 0;
@@ -321,7 +321,7 @@ static int sprd_efuse_read(void *context, u32 offset, void *val, size_t bytes)
 	return ret;
 }
 
-static int sprd_efuse_write(void *context, u32 offset, void *val, size_t bytes)
+static int sprd_efuse_write(void *context, u32 offset, const void *val, size_t bytes)
 {
 	struct sprd_efuse *efuse = context;
 	bool blk_double = efuse->data->blk_double;
@@ -410,7 +410,7 @@ static int sprd_efuse_probe(struct platform_device *pdev)
 	econfig.size = efuse->data->blk_nums * SPRD_EFUSE_BLOCK_WIDTH;
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.reg_read = sprd_efuse_read;
-	econfig.reg_write = sprd_efuse_write;
+	econfig.reg_write_const = sprd_efuse_write;
 	econfig.priv = efuse;
 	econfig.dev = &pdev->dev;
 	nvmem = devm_nvmem_register(&pdev->dev, &econfig);
diff --git a/drivers/nvmem/stm32-bsec-optee-ta.c b/drivers/nvmem/stm32-bsec-optee-ta.c
index f89ce791dd12..3184b976b1f9 100644
--- a/drivers/nvmem/stm32-bsec-optee-ta.c
+++ b/drivers/nvmem/stm32-bsec-optee-ta.c
@@ -203,7 +203,7 @@ int stm32_bsec_optee_ta_read(struct tee_context *ctx, unsigned int offset,
 
 /* stm32_bsec_optee_ta_write() - nvmem write access using PTA client driver */
 int stm32_bsec_optee_ta_write(struct tee_context *ctx, unsigned int lower,
-			      unsigned int offset, void *buf, size_t bytes)
+			      unsigned int offset, const void *buf, size_t bytes)
 {	struct tee_shm *shm;
 	struct tee_ioctl_invoke_arg arg;
 	struct tee_param param[2];
diff --git a/drivers/nvmem/stm32-bsec-optee-ta.h b/drivers/nvmem/stm32-bsec-optee-ta.h
index 3966a0535179..74658a54fe57 100644
--- a/drivers/nvmem/stm32-bsec-optee-ta.h
+++ b/drivers/nvmem/stm32-bsec-optee-ta.h
@@ -50,7 +50,7 @@ int stm32_bsec_optee_ta_read(struct tee_context *ctx, unsigned int offset,
  *	On success, 0. On failure, -errno.
  */
 int stm32_bsec_optee_ta_write(struct tee_context *ctx, unsigned int lower,
-			      unsigned int offset, void *buf, size_t bytes);
+			      unsigned int offset, const void *buf, size_t bytes);
 
 #else
 
@@ -72,7 +72,7 @@ static inline int stm32_bsec_optee_ta_read(struct tee_context *ctx,
 
 static inline int stm32_bsec_optee_ta_write(struct tee_context *ctx,
 					    unsigned int lower,
-					    unsigned int offset, void *buf,
+					    unsigned int offset, const void *buf,
 					    size_t bytes)
 {
 	return -EOPNOTSUPP;
diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index 82879b1c9eb9..622093b0755c 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -118,12 +118,12 @@ static int stm32_bsec_read(void *context, unsigned int offset, void *buf,
 	return 0;
 }
 
-static int stm32_bsec_write(void *context, unsigned int offset, void *buf,
+static int stm32_bsec_write(void *context, unsigned int offset, const void *buf,
 			    size_t bytes)
 {
 	struct stm32_romem_priv *priv = context;
 	struct device *dev = priv->cfg.dev;
-	u32 *buf32 = buf;
+	const u32 *buf32 = buf;
 	int ret, i;
 
 	/* Allow only writing complete 32-bits aligned words */
@@ -153,7 +153,7 @@ static int stm32_bsec_pta_read(void *context, unsigned int offset, void *buf,
 	return stm32_bsec_optee_ta_read(priv->ctx, offset, buf, bytes);
 }
 
-static int stm32_bsec_pta_write(void *context, unsigned int offset, void *buf,
+static int stm32_bsec_pta_write(void *context, unsigned int offset, const void *buf,
 				size_t bytes)
 {
 	struct stm32_romem_priv *priv = context;
@@ -239,10 +239,10 @@ static int stm32_romem_probe(struct platform_device *pdev)
 				return rc;
 			}
 			priv->cfg.reg_read = stm32_bsec_pta_read;
-			priv->cfg.reg_write = stm32_bsec_pta_write;
+			priv->cfg.reg_write_const = stm32_bsec_pta_write;
 		} else {
 			priv->cfg.reg_read = stm32_bsec_read;
-			priv->cfg.reg_write = stm32_bsec_write;
+			priv->cfg.reg_write_const = stm32_bsec_write;
 		}
 	}
 
diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index d297ff150dc0..54905a608157 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -183,7 +183,7 @@ static int zynqmp_nvmem_read(void *context, unsigned int offset, void *val, size
 }
 
 static int zynqmp_nvmem_write(void *context,
-			      unsigned int offset, void *val, size_t bytes)
+			      unsigned int offset, const void *val, size_t bytes)
 {
 	int pufflag = 0;
 
@@ -194,7 +194,7 @@ static int zynqmp_nvmem_write(void *context,
 		pufflag = 1;
 
 	return zynqmp_efuse_access(context, offset,
-				   val, bytes, EFUSE_WRITE, pufflag);
+				   (void *)val, bytes, EFUSE_WRITE, pufflag);
 }
 
 static const struct of_device_id zynqmp_nvmem_match[] = {
@@ -216,7 +216,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
 	econfig.priv = dev;
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.reg_read = zynqmp_nvmem_read;
-	econfig.reg_write = zynqmp_nvmem_write;
+	econfig.reg_write_const = zynqmp_nvmem_write;
 
 	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &econfig));
 }
-- 
2.55.0

