Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F937B413
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884308; cv=none; b=pzx0OTLQmr8MolWH7KiDxRPUGPX+26M4w62r85VMyMX+0uk+IqdckQa5XxzCXuWsTvtSb3YZuIhcnxeoHB9lD2w+s3oCFSY21k6lZX/UM//yqz0k1Tsonc6uMV1QU0VrBp0Ddk/3ZBlIJWZ3BoUzMhpXqLXAIpuMmrlH9j2P3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884308; c=relaxed/simple;
	bh=6rrKwA7t2xdnfxQdEHWUilDFPRm0gP2abwyKcFsi1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxjWX+1rnUDZLi57ysewanmBW4z++3g4oojTMXwlDUppg5gdFr6bD4g4s0DGLQqr9j4BkRZ050F2xgDdAYWzCgy/bAxus7aSseM3aMup7YaVpxkJzA+k6vsRlCsM1iVGMlsSaUr9GvpSvAxJGlSdeGwBWhgdgvPmKxysFG9XQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFs7CI6c; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFs7CI6c"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65bebcbffe8so9171439a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884306; x=1772489106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=fFs7CI6c4y6EvfLMVIy2PVMDG4ceE5hvJ2vAUJwosNx6Fj0XNY3F9ScvF3QiXFIj+q
         STUYwq0ALicMOeocRtdt48KFZjO+bWIXx7WGqW3reTu5Zl35Vpj4KkBpGIKVpVtm0LhQ
         GBRioi8mT2DMEkzJlW6qeBe7bZ4fhT/xk/xb3iRoK1AzVhDXnAf5Nzyt13QABjjfpYFv
         bwkYZZ6B5OBpXftnWVdy6C6UIVje5iX2daEskUDZg+yMAQ2QBq7hthibmf5C/Kk8DMu7
         o+rYg4K5nuR7y+9yCuXANgOntMCfHSqGiRXQxoxwhVNT02gZsqcNEOb+mHCo19HOiO9D
         u28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884306; x=1772489106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=s4XugV/a/a9xVhB2wmEKlzaYvxRqUFAFyCfbjoa2kRNrCqt7aAdu9XPS4z59fjjRWI
         I97k/y2j+P94+ddqX5nNLd0w7FR9c+qrzpGZsgk91HgZ4mLMjkuEIktabAPnic+xgh2b
         ziD6JcqoylTKbBLhg+9sfRt4SLk0/iiqx4910FZa2KDqjeN02QOBPOdhBRTCS8z6JES1
         u7PoOwkSrukd6dIfP6hiN1lkZ86oTenNhvayJxCzidjxR/BRlqOu1hxRJyv1RGvtcshq
         mCU1Cq0Ft7QAtY8kcITl+nWdkLlnoD+Bggx0eVwVU5Pq/3RnS/rFp5Yzz9k1Zhy3zTDv
         ZNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV859JB79mwprxD2YTAXwWBMIylpmnOrqdjGCJC5G10piUslxxyxgjFU8bEEd0WVHu0WS8w9Ah2BTD+gMBzOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxYfa5BNcaB7xsDbhPIEzC0AJTDBfxEDIuhyV/TkNgqHz8hR2
	yPnj5S80VkGCxuprzOid1c4YOWEtS/I84BUf3L4eAWBUUrve6QzEtNp8
X-Gm-Gg: AZuq6aKFwEns8NuBYEgfIXlX3GoXQ/Qz+XqXwCGQyjhMa6fap2GEJpyeTm3HzurnbmH
	13U0MQCQnNNXlYt3RIhotS5yNp3p4UEk85GQlVO5/10KYBA20M5rQ0zeorMx1EcYUPubTieXKkW
	4t53l6wKfkHbDZZlzyZJ754ReEUvsHU4ngirB8k/NUf4/wMQE1AJbPQsrspGr/b0pJtl17JZm8W
	57Qo+PIDF2m0viFWWDqwzf9OosLQWogjBqOpME3RxfShGCbs4w0AIQllX2S3TtRZhamBMc8X6Kb
	wEchjKqssN5Y7mBGco7/wFc8fKkwT64tf/C15spgEKl+AUy5LJcQQ//EssM4Y4RWIn7SiQ0aOwq
	2rLoXO4KiK442x8o492vbLzTvAQhLRKZRMh5AZKQoUdxuhhQ3lJj/3TDrb5wwuYJxoQUc/4mBzg
	e/Tj5ixevBx/D17vjfBfSDaHyGqJAnng31Z8gWnMo1sGJ+1xRRF/FMmpxoCDwnd/o/WPiGa9AEk
	t8qWzX1z88iBhNXu5mbbCRsXPFQlP17VqD6brEBjQtcNCVT2k/M3JhO9eB07NRkKZMMc+k=
X-Received: by 2002:a17:906:9f85:b0:b8e:36ec:88db with SMTP id a640c23a62f3a-b9081a40e99mr609037966b.22.1771884305881;
        Mon, 23 Feb 2026 14:05:05 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (230.86.12.34.bc.googleusercontent.com. [34.12.86.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm359394666b.67.2026.02.23.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:05:05 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 1/3] staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for devm_clk_get
Date: Mon, 23 Feb 2026 22:05:01 +0000
Message-ID: <20260223220504.2102-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223220504.2102-1-iprintercanon@gmail.com>
References: <20260223220504.2102-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get() never returns NULL, so IS_ERR_OR_NULL() checks are
unnecessary. Replace them with IS_ERR() for both the "mlb" and
"pll8_mlb" clock lookups in fsl_mx6_enable().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 92c7a7d8fe7e..cea1ba99caf7 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -921,7 +921,7 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR_OR_NULL(dev->clk)) {
+	if (IS_ERR(dev->clk)) {
 		dev_err(&pdev->dev, "unable to get mlb clock\n");
 		return -EFAULT;
 	}
@@ -935,7 +935,7 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	if (dev->clk_speed >= CLK_2048FS) {
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
-		if (IS_ERR_OR_NULL(dev->clk_pll)) {
+		if (IS_ERR(dev->clk_pll)) {
 			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
 			clk_disable_unprepare(dev->clk);
 			return -EFAULT;
-- 
2.43.0

