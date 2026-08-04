Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883F24562A2;
	Tue,  4 Aug 2026 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851987; cv=none; b=J3HKHcfLbF9UmrvI/zMHDHCNHjxBJwQ9zM90w0CNqxd8wPssmKztbxlodXutTWmQje+RV9ft5Z67lgdCbg/0de5jFDjF9H++kAC1SH8Zn/kDhQ9gjvozPa6MmgDcFkbkc46peZqjCkAadeWMLUXkaCopMGijj54henxZamw0g9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851987; c=relaxed/simple;
	bh=UXCjROxh2rU7C913/ER3JX6Vop6W+uMGBVP8AKZ/HAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYROBt/A5PGGMppkIyjHG7wMJot0WFLkUodpjm9kHudagkbaCEBLRTw/zPBux6PTuWsMZVeYyPausRlVaPQHdMQyJEsOO9CJ+AcjKijiG7aMSEsrwwd8Vuem8sxwFE/wbnZVdmfZH4l7rgRtU8SIC+NT+XVh3ER+70e5PR6Yj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 5101270A0556; Tue, 04 Aug 2026 15:59:42 +0200 (CEST)
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
Subject: [PATCH v5 2/3] nvmem: core: deprecate reg_write callback with reg_write_const
Date: Tue,  4 Aug 2026 15:59:36 +0200
Message-ID: <20260804135940.2378737-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
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
 drivers/nvmem/core.c           | 28 ++++++++++++++++------------
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h |  6 +++++-
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..08f235874ce0 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -66,19 +66,22 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 }
 
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
-			     void *val, size_t bytes)
+			     const void *val, size_t bytes)
 {
 	struct nvmem_operations *ops = nvmem->ops;
 	int ret, wr_ok;
 
-	if (!ops->reg_write)
+	if (!ops->reg_write && !ops->reg_write_const)
 		return -EOPNOTSUPP;
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
 	if (ret)
 		return ret;
 
-	wr_ok = ops->reg_write(nvmem->priv, offset, val, bytes);
+	if (ops->reg_write_const)
+		wr_ok = ops->reg_write_const(nvmem->priv, offset, val, bytes);
+	else
+		wr_ok = ops->reg_write(nvmem->priv, offset, (void *)val, bytes);
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
 	if (ret)
@@ -111,7 +114,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 			kend = min(end, keepout->start);
 			ksize = kend - offset;
 			if (write)
-				rc = __nvmem_reg_write(nvmem, offset, val, ksize);
+				rc = __nvmem_reg_write(nvmem, offset, (const void *)val, ksize);
 			else
 				rc = __nvmem_reg_read(nvmem, offset, val, ksize);
 
@@ -143,7 +146,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 	if (offset < end) {
 		ksize = end - offset;
 		if (write)
-			return __nvmem_reg_write(nvmem, offset, val, ksize);
+			return __nvmem_reg_write(nvmem, offset, (const void *)val, ksize);
 		else
 			return __nvmem_reg_read(nvmem, offset, val, ksize);
 	}
@@ -164,7 +167,7 @@ static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
 	if (!nvmem->nkeepout)
-		return __nvmem_reg_write(nvmem, offset, val, bytes);
+		return __nvmem_reg_write(nvmem, offset, (const void *)val, bytes);
 
 	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, true);
 }
@@ -299,7 +302,7 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 	if (!nvmem->read_only)
 		mode |= 0200;
 
-	if (!ops->reg_write)
+	if (!ops->reg_write && !ops->reg_write_const)
 		mode &= ~0200;
 
 	if (!ops->reg_read)
@@ -336,13 +339,13 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 	struct nvmem_operations *ops = nvmem->ops;
 
 	/*
-	 * If the device has no .reg_write operation, do not allow
-	 * configuration as read-write.
+	 * If the device has no .reg_write or .reg_write_const operation, do
+	 * not allow configuration as read-write.
 	 * If the device is set as read-only by configuration, it
 	 * can be forced into read-write mode using the 'force_ro'
 	 * attribute.
 	 */
-	if (attr == &dev_attr_force_ro.attr && !ops->reg_write)
+	if (attr == &dev_attr_force_ro.attr && !ops->reg_write && !ops->reg_write_const)
 		return 0;	/* Attribute not visible */
 
 	return attr->mode;
@@ -893,7 +896,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->dev)
 		return ERR_PTR(-EINVAL);
 
-	if (!config->reg_read && !config->reg_write)
+	if (!config->reg_read && !config->reg_write && !config->reg_write_const)
 		return ERR_PTR(-EINVAL);
 
 	nvmem = kzalloc_obj(*nvmem);
@@ -937,6 +940,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	ops->reg_read = config->reg_read;
 	ops->reg_write = config->reg_write;
+	ops->reg_write_const = config->reg_write_const;
 
 	nvmem->owner = config->owner;
 	if (!nvmem->owner && config->dev->driver)
@@ -972,7 +976,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 
 	nvmem->read_only = device_property_present(config->dev, "read-only") ||
-			   config->read_only || !ops->reg_write;
+			   config->read_only || (!ops->reg_write && !ops->reg_write_const);
 
 #ifdef CONFIG_NVMEM_SYSFS
 	nvmem->dev.groups = nvmem_dev_groups;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..c1766f8fa482 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	nvmem_reg_write_const_t	reg_write_const;
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..e944530999b4 100644
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

