Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329D74BE1
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595022; cv=none; b=RrYjEtz9z1zOcfsHCuvqs2I0rnkRy0LFpFTYEod4PUTOJp5sW3Upg863F4udS5DmOjIh1w2zeXe/IkZzDChCTwONp6NEpZ0t+KkgGC8Mea0nwlEF2h1HcJXvWC+uwo8i9iAntJoGyYpYOn6zgGEvR7s4OP0hhZoQ9qd8zTqLjl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595022; c=relaxed/simple;
	bh=X32PXM6CIYzypQR5TwfD7Jn/cbq77OlrCWR99DHxUpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcbDVsngojzJm/2byi+Gz7u/6K7ZKsTLrWFMDi0+r+NdC6s4jJd3imB+Srs6LVDwY6s4Qdlp5nyJCVpuBQu6V2huXqAp5YRD5Eyw9TqFgb2OptsSV8BgHvhDVff4chbW7umjzsIYsZaO+AiIoGG7tJwoCnYabNjh+LLNu/9O2Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkP3s57m; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkP3s57m"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3860453f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595019; x=1774199819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=bkP3s57mdv06Q8pGVWI4sO1FcTTW0j4zh+8kzK4R0Kpp+g8bHG1yntDaZr+QWoE5BZ
         +CtFml9JkkNytDIZEJqKa4MeJ3m4zFKaZt0klCzfeZaEo1KCiakxbgaV2NoKjnXU7otn
         rr+SYvK4ssEnc1oxI0xCByyWzzsTFU41my6/fvn0ZdD5hhoQe1sSv1jsT58Bf0ByHtj+
         WvL2wSTQ27qYrzk1BjsVr9PCQvp0NF/1ESdZsOUxwR0KjvVwLsvfIGDUdPgSiOVVkEzn
         MupnbYA45bC946+Fh0djNXW66NMPP/1gYgk+JFKeCz4keggXKP0N9sdY99ByzigsffOF
         Rx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595019; x=1774199819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=gK6NYo0S9+lNtNyoGz4w2ebc/BU/Iqb9qAjMyMPrRCg/VrmgxkG+D+6Jyt9oBHuQj9
         WiEGQIMsbinbK/Q/JDVst+RY+jjH6YifF1Y5HKqweGVl26YPm2QTkHStAtBg4Vj3Qnfi
         Ok4NWVAGj56aeBoj6ZBkh5UkSnOuaKAEssk0oGtDPoGTrCxC/FZuxph9kzmG2q+ZuL6e
         bNP51UMeGVoCqRe3SLXaKyyKUs0m4MzjjJieeaaUD+/NwWqTzKcLAwDzSdCKINwMS1LL
         hsk86OKeVk5wKaE92yAyOt8R6bS0Rnh7Xuxn5JanqbnrM+69im0iIKPFHgXUUuJtoeOI
         SO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6LHRtzg4vHh1sX3yuh1b7RfXKCZag3G+xnpWvLO4sYwYn/RjyqaSrT2Vrj9Q5/bOUvgOrU7lUZT0nKPCYUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq230JQ/MqQ6mYQv6gn2LAiH8ILXk9L1Ymtd5mKV2FM86SCJLW
	XC4aWQZiCVmufblBnBpoyPzTy+ZmePcmnk8ZDt65v/RUBAveu8d420do
X-Gm-Gg: ATEYQzyUZCgSP5gw9ySCr7ukBddh2huVL2srjWsOZFkdeBKIPbTuZBomIclfxfpH2dp
	4jcsQ7im9n6a8f0uREhswWYTdew3Retjc+wDG7EaWM2CH0ntWjdoNDmePvbJ0XK9JbUaJZiUxRo
	3+lptXDrcuqAUhQgDKBA9WAlprxfd9xHVSoIGKAlN3YCFeb+XLKKF6pkYe86SxW564ZgR4HBlSX
	1Bc4oXtaezyK3b2CXnW4GmKFTvSgJmT97qlEyRrGhapbfn6cBNoF7cZVgqmNKx25b0ds81aJT3u
	DwyLGLspcPjkunmcE3DjSKsbHrvhTatap+vwxKeeFbmoXe/PLRUgyVtiG9DKRh56MX+fzdzFCCG
	hcZtJs0OEctRbPSbKnRf7iyraODuy7Swrj2s1c1BIZJJArHIvDVANIeLM4ITB2PB1zBgH6ztrsK
	JxgGvluSDkn56uHuDqbCDrUVigf1ADVVJzbQ==
X-Received: by 2002:a05:6000:200f:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43a04d79252mr18547646f8f.6.1773595018822;
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
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
Subject: [PATCH v2 1/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:16:50 +0100
Message-ID: <20260315171652.269020-2-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/mmc/core/quirks.h          |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c417ed34c..d736bb4be 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -15,6 +15,10 @@
 
 #include "card.h"
 
+#ifndef CID_MANFID_KINGSTON
+#define CID_MANFID_KINGSTON	0x70
+#endif
+
 static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
 	/*
 	 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3

