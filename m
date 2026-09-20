Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50434B1AD;
	Sun, 20 Sep 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902614; cv=none; b=P25cW84wW1aSjvoCK1Cz2gKKL9wCmV7WszZFxBjyPdjgCfNrEApu08AA2uFPI5vKeyCNkdcI6LCPAPstnQqsNLyBagZlqccALmUe2uB4/QhSCg08JgEJ9hyIswYIyZJNfuZzkGYDbcFIdmPd8r/TNMTr+B800peYGEzkReKI6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902614; c=relaxed/simple;
	bh=8jtHXts22NMPFAisUu0L5owsq6SoZk1pOpwgPhZuu7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pprQExI3WV0TwCdt8U8hHf9vHmQjWgpnwkXZzacQ8Fx+lRsb8l87OwqPnvv/FDf1KTBFOw6uifxvTybi0N2gfWd80jyJV9PHczkN+MD1jDkMbrRsZrADK+KquIbyi2/4ZuK7JNiMSUa8ebB0V9djxbSlZc0SGKNSkQS2NarbBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 7ED297189A58; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
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
Subject: [PATCH v6 1/4] firmware: meson: pass a const buffer to meson_sm_call_write()
Date: Sun, 20 Sep 2026 13:09:54 +0200
Message-ID: <20260920111000.2404131-2-linkmauve@linkmauve.fr>
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

This was found while introducing the new nvmem-provider reg_write_const
callback in meson_sm_call_write()’s only user, in meson-efuse.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/firmware/meson/meson_sm.c       | 2 +-
 drivers/nvmem/meson-efuse.c             | 4 ++--
 include/linux/firmware/meson/meson_sm.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..5d4da2e3c3a9 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -196,7 +196,7 @@ EXPORT_SYMBOL(meson_sm_call_read);
  *
  * Return:	size of sent data on success, a negative value on error
  */
-int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+int meson_sm_call_write(struct meson_sm_firmware *fw, const void *buffer,
 			unsigned int size, unsigned int cmd_index, u32 arg0,
 			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index d7f9ac99a212..f71854f89950 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -20,7 +20,7 @@ static int meson_efuse_read(void *context, unsigned int offset,
 	struct meson_sm_firmware *fw = context;
 	int ret;
 
-	ret = meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
+	ret = meson_sm_call_read(fw, val, bytes, SM_EFUSE_READ, offset,
 				 bytes, 0, 0, 0);
 
 	return ret < 0 ? ret : 0;
@@ -32,7 +32,7 @@ static int meson_efuse_write(void *context, unsigned int offset,
 	struct meson_sm_firmware *fw = context;
 	int ret;
 
-	ret = meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
+	ret = meson_sm_call_write(fw, val, bytes, SM_EFUSE_WRITE, offset,
 				  bytes, 0, 0, 0);
 
 	return ret < 0 ? ret : 0;
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..92cc61f3a1c0 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -21,7 +21,7 @@ struct meson_sm_firmware;
 
 int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
 		  s32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
-int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+int meson_sm_call_write(struct meson_sm_firmware *fw, const void *buffer,
 			unsigned int b_size, unsigned int cmd_index, u32 arg0,
 			u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
-- 
2.55.0

