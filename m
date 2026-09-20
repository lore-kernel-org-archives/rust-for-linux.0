Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785113DDB03;
	Sun, 20 Sep 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902614; cv=none; b=PKh0n/roK34H7BT6gC4jbfhVprzoL9X5EPaO06WM09S4mtz5j1Qg5YG57aGu49lsXfTPPsVF9kG+yv/kZxeQ+QlhOtRkV97vz5cIK9kYjdSbxti7xZdqMKcu6/F6j6WYYemCt8iBbsoujpm8eZwJjFDEhj8Tk0bfG3EEcp3VKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902614; c=relaxed/simple;
	bh=lPF7X82nx6xcu6+jfTW15He4vor2gIJdixv2iZdfJWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D99TF9sQSJsIdLdnQ7NoaxtY7cu8lfQYQFq+0/knG6dTJ8mjhBqd3espOOE/krwAcb4gmkiZNwWFTQA5gQubJXyjW4MEaLraDBbtYFncjrhNO2U11MaLUagCQiXj4kWQ8/5Oc54/OoGf6I2EwbtMiJunCDhHMrIbfFEtUGLM5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 8E1657189A61; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
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
Subject: [PATCH v6 4/4] nvmem: enable COMPILE_TEST for more drivers
Date: Sun, 20 Sep 2026 13:09:57 +0200
Message-ID: <20260920111000.2404131-5-linkmauve@linkmauve.fr>
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

Three drivers had a depends on ARCH_*, but didn’t also compile when
COMPILE_TEST is enabled, making it harder than it should be to test
them.

Some other drivers also don’t have a COMPILE_TEST, but those have
additional dependencies and I didn’t want to investigate too much.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..d38097d6648b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -354,7 +354,7 @@ config NVMEM_NINTENDO_OTP
 
 config NVMEM_S32G_OCOTP
 	tristate "S32G SoC OCOTP support"
-	depends on ARCH_S32
+	depends on ARCH_S32 || COMPILE_TEST
 	help
 	  This is a driver for the 'OCOTP' peripheral available on S32G
 	  platforms.
@@ -518,7 +518,7 @@ config NVMEM_SUNPLUS_OCOTP
 
 config NVMEM_SUNXI_SID
 	tristate "Allwinner SoCs SID support"
-	depends on ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
 	help
 	  This is a driver for the 'security ID' available on various Allwinner
 	  devices.
@@ -563,7 +563,7 @@ config NVMEM_VF610_OCOTP
 
 config NVMEM_ZYNQMP
 	tristate "Xilinx ZYNQMP SoC nvmem firmware support"
-	depends on ARCH_ZYNQMP
+	depends on ARCH_ZYNQMP || COMPILE_TEST
 	help
 	  This is a driver to access hardware related data like
 	  soc revision, IDCODE... etc by using the firmware
-- 
2.55.0

