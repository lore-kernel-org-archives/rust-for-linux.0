Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4263BFE3F;
	Wed, 15 Jul 2026 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145331; cv=none; b=ONHvZThiNRu+oa/zzk4VmlCk761WZJbYdTPg7jYyBqe9BRxlYw6ICKde18eh0hKPn96d+3NykD2pyNiBQSofdSWTPQ79zgTOOgiOq+aFM1fn89qRYFXCQhH60MM8RZwDyMJ95ZWLd3ZU4oCuW36djcpt2k8UPWYTfhncgncAU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145331; c=relaxed/simple;
	bh=HQ8beO8wCBli7U4Gv/H+UsbdWNrMMNBM0UF46d21HpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+WaqfopA0W9iFTkJIZuNGs6PD/6YFHzwZYFWbcRauZiU1zPSJe3SQvxdRTn3nRnBoAmGl5Sm/ocmukoni15MQi0ilATPlm4yfbdclFNImnU/Eg2J1pnGQFYhz1j+LWSwwWRP3erC5tRjb3gAADL22y1Oif+fk8cW02BnaOJDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id EC76DF40D2F; Wed, 15 Jul 2026 21:55:24 +0200 (CEST)
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
Subject: [PATCH v2 1/2] nvmem: core: deprecate reg_write callback and add reg_write_const
Date: Wed, 15 Jul 2026 21:55:17 +0200
Message-ID: <20260715195520.25410-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715195520.25410-1-linkmauve@linkmauve.fr>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This callback used to take a mutable void * for no reason, which causes
the compiler to be unaware that the val buffer should never be modified
by the callback.

This was found while drafting the nvmem-provider Rust abstraction.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/core.c           | 26 +++++++++++++++++---------
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h |  6 +++++-
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e871181751f3..24c9e6f953c6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -62,13 +62,20 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 }
 
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
-			     void *val, size_t bytes)
+			     const void *val, size_t bytes)
 {
 	int ret;
 
+	if (nvmem->reg_write_const) {
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
+		ret = nvmem->reg_write_const(nvmem->priv, offset, val, bytes);
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
+		return ret;
+	}
+
 	if (nvmem->reg_write) {
 		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
-		ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
+		ret = nvmem->reg_write(nvmem->priv, offset, (void *)val, bytes);
 		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
 		return ret;
 	}
@@ -264,7 +271,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 	count = round_down(count, nvmem->word_size);
 
-	if (!nvmem->reg_write || nvmem->read_only)
+	if (!nvmem->reg_write || !nvmem->reg_write_const || nvmem->read_only)
 		return -EPERM;
 
 	rc = nvmem_reg_write(nvmem, pos, buf, count);
@@ -285,7 +292,7 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 	if (!nvmem->read_only)
 		mode |= 0200;
 
-	if (!nvmem->reg_write)
+	if (!nvmem->reg_write || !nvmem->reg_write_const)
 		mode &= ~0200;
 
 	if (!nvmem->reg_read)
@@ -321,13 +328,13 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	/*
-	 * If the device has no .reg_write operation, do not allow
-	 * configuration as read-write.
+	 * If the device has no .reg_write or .reg_write_const operation, do
+	 * not allow configuration as read-write.
 	 * If the device is set as read-only by configuration, it
 	 * can be forced into read-write mode using the 'force_ro'
 	 * attribute.
 	 */
-	if (attr == &dev_attr_force_ro.attr && !nvmem->reg_write)
+	if (attr == &dev_attr_force_ro.attr && !nvmem->reg_write && !nvmem->reg_write_const)
 		return 0;	/* Attribute not visible */
 
 	return attr->mode;
@@ -905,7 +912,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->dev)
 		return ERR_PTR(-EINVAL);
 
-	if (!config->reg_read && !config->reg_write)
+	if (!config->reg_read && !config->reg_write && !config->reg_write_const)
 		return ERR_PTR(-EINVAL);
 
 	nvmem = kzalloc_obj(*nvmem);
@@ -950,6 +957,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->type = config->type;
 	nvmem->reg_read = config->reg_read;
 	nvmem->reg_write = config->reg_write;
+	nvmem->reg_write_const = config->reg_write_const;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
@@ -975,7 +983,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 
 	nvmem->read_only = device_property_present(config->dev, "read-only") ||
-			   config->read_only || !nvmem->reg_write;
+			   config->read_only || !nvmem->reg_write || !nvmem->reg_write_const;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	nvmem->dev.groups = nvmem_dev_groups;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 18fed57270e5..184711dfd6a6 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -29,6 +29,7 @@ struct nvmem_device {
 	unsigned int		nkeepout;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	nvmem_reg_write_const_t	reg_write_const;
 	struct gpio_desc	*wp_gpio;
 	struct nvmem_layout	*layout;
 	void *priv;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index f3b13da78aac..c6e77ba1a8c1 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -20,6 +20,8 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
+typedef int (*nvmem_reg_write_const_t)(void *priv, unsigned int offset,
+				       const void *val, size_t bytes);
 /* used for vendor specific post processing of cell data */
 typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
@@ -93,7 +95,8 @@ struct nvmem_cell_info {
  * @root_only:	Device is accessibly to root only.
  * @of_node:	If given, this will be used instead of the parent's of_node.
  * @reg_read:	Callback to read data; return zero if successful.
- * @reg_write:	Callback to write data; return zero if successful.
+ * @reg_write:	**DEPRECATED** - please use reg_write_const instead.
+ * @reg_write_const:	Callback to write data; return zero if successful.
  * @size:	Device size.
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
@@ -128,6 +131,7 @@ struct nvmem_config {
 	struct device_node	*of_node;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	nvmem_reg_write_const_t	reg_write_const;
 	int	size;
 	int	word_size;
 	int	stride;
-- 
2.55.0

