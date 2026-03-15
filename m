Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D1377EC3
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595685; cv=none; b=AOQwxfdSKMyDIxrNfK3pdmW70cC2t2VruuG0f0X3Znb0WrgGHam1tmIas+NH+ddsC7L62HixDcsgjq1mBpuereZe8DSeu11b3vzbkE+G7NYJ1SCypwDrTC9ZDZdCz4q1WcM7TS0GSWk3Wi6xxM+Gf/kfQlQvcgHiJav5Kto1+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595685; c=relaxed/simple;
	bh=QyIuFOJZx926p9XhEzOqnlY0Tjj4EaWSbZ1NmZeyRpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNys61LhxmG011mNTMV1UNbVsgCh2BYdDLYnI8uyezxe3aONdhjx1Ot3nEji+it1Lhga+DyIvVbTVZYoDPxCNy4cK0+4f/n2gndlYTwkFwhDrWh7GL5hIgqFjFBf4s0eYqyApVsR92KGDNKAWh3eV+x+TR6SrmrllVBq8KopmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaftvYRw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaftvYRw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29704725e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595681; x=1774200481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=KaftvYRwTkpwOyTOTR15hx72rP9U1+qsLRZwEpP0661vgIcqr3lg7EBVrhFxsnDwAW
         Ft3pAkQ+cP+XZtoiuCfViQGC+f/xf+2KTA2ggxz5v58oydL3P7jTYsWtexLlQIABT61c
         +p5UefG2DSeCjHyaUBPTYrFFFWrTXfWlct6SnQ3KuaemwET/LzDtFMb0ppqS5oxjCSmo
         LrMikbM9yaN+4a8pBiuoJda4Anh/iYvhBtUjFlKJmXk6hZiSGZ6nCOf7rZg0dTSv7H9e
         zm4zmFnWaJ6yHQcjovyZ8OTAGLBPYHXB89ydhmt6rdNd0tBkYjoIWYYI86Pv3sCq5YoN
         Ru+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595681; x=1774200481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=EZesiNxVl6Um+TTHR2vq4+Rd6I35OWOOSGOIRcQ78iRAcLhvaR9ZF18EXkyig8TARM
         TohVA5X2Gk4APffJUWbp5PeVBwWkzKmYRDTFjN5K3Ka2nhw+KehHfMIt6QnS8OFWhwJ2
         MQaEWVv9GgPUiGE6wRa4gMlEG41BKqNAF4p375DYR0u6IDSQWCpId2xsNwfQmkqhHEjh
         9IizFEWD0o14vXOX9bIFHpbkD2k1UZSFQ+9XhVjnG/S4VYtZ3Xo8U5dPdWYpK2ZYH8Jf
         wfB5OyFGvGn7Lrjg6P7CS7BA4qSCaBdyV4SLsdfPk8ctfoVSalIgP4mYKGz44YZAPUts
         ldoQ==
X-Forwarded-Encrypted: i=1; AJvYcCViYStN+/FobuAG63AKX4BClTOb84nWhtGjXVXna/Bkxws+PvWRrXXcsM3VcQv+gs0U6yEdtNjM75JbRyfotw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYTKLWyGXuOHeldIFV1uo9VjGQYh1L+ixC3ar+91d1bNpuNSu6
	UvAFc413Al/zdCN8lisKhz7vGaQ0TG1VfTMwrOTMZWQkw2ldCVRwktke
X-Gm-Gg: ATEYQzyOPJ3dO6AmICuVBV99biA+EFakxW1ZfVHSkYHSiXeo8lMFRkWoTDWx3FMjG99
	v7I7vTEKbnf3GoG1JtJ6vbYzaLpjzvuHk1GEO1gBwqmLHe5oZ2cY2Y6qnnxwW9DpLA8PK0P+3kM
	dMQSyt3WAWkt4fSjf8qmxUtDcAsua158uXK+PfJqa64GcukUhtJtGXpqbhq8JFXbDCtZ0NFhwhu
	pHJ3lA2wzqrugS+1rnqGo2oipSAryB5jHe/5/3XJoh95BNb3h+fgaKTSUB70D3hu9kWOSe3d5WQ
	f6WfpfQRO/d6dqQXHKSo7/pdCG2xcwotkIolrkt0HhHAWMINI4jHpXED0aoWYFmHRayjijydwt3
	R1jnL5M8ewL7YJZPTD0R3YfLhiCxxd3rdL7wFgHwm+Tj9HuvTcZQzTcWRlU+Z3t0kW++IN276Y7
	NK/u2bnVDUPGnYjsDfLnliq0eoAOcdqq2zTTs=
X-Received: by 2002:a05:600c:64cf:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-485566cf81fmr167182995e9.5.1773595681386;
        Sun, 15 Mar 2026 10:28:01 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:28:00 -0700 (PDT)
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:26:40 +0100
Message-ID: <20260315172746.270734-4-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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

