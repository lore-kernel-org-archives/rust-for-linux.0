Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7237BE7F
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884310; cv=none; b=CJsaeR2DcgFvxFABC2Kei9ZZjemuMZtVhOcwFDkGXW4SyECdNNw9ciRtnw7ztNSoPXj2oFKm1CSb0/oJu8sKd8ALb//+MEPlvXcxkWreTa+/+mBzC5M0AAUiPreCqCLAMsWMzT7XA/SoE08KZgf5F9TXKwsE1n16e9wsL1aI7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884310; c=relaxed/simple;
	bh=lYSFLw0xah4h/+68xrRS+X6hzYryo1L2cUiMAzxuTP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeV8alrA4knyfIX7fXazzIzOm4E5OqVInJnorJUHhWhgcYrb6g2YwZk6HLIIjbyQR7LGlA9l7yF60z6HqXDQuvWtKLRT6cZsCv/ULFJuwkPf/PQ9XAxflbWY2taEuMF2WCZ0WH6nLLXGouEHqPgKhFJ9V/NvTQEsgh3G12eo8zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QowjejyR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QowjejyR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8845cb580bso739151966b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884307; x=1772489107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=QowjejyRTTc9BS6FZeN7E9Y5jwGARU7qjwgy28bIrUw0z4c3MdRo77dMOjApo1nD4u
         PuE+7WdMXXadbLmVAlEskYfZbW5oUTYSbeSzWsF4HPjeZDp9B+Q1DKNBr+cHCZf40CWV
         H+IcDC8xlwbzHhw2YtsmhWag46ZaSoxKJ6o8wUtV8grqiyBSuT132lVUPnv4aA2aQ9sr
         +PhidkZOwx/MTQpvNuy4JfUxyeclUnYH4fvVhLLkZqfcadQa1NQHhewdOifecgnRuMYx
         TFjbTXuyGZDQXx2lEy+F3/IsPHKy6Td2OaHfhAbBLnIpJiq3r651EG3o6T6OuKEX9yM0
         LF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884307; x=1772489107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=Q9QN1APjNsGoXKXWKFkAQhq11XuBlhUu1oqlw9nIARvkqudKI4lwQOBzqsPIRQcLWg
         O9aKfF5vyjZ7QQyc0JbmVeaEkmq8ju1cWGGgcVCkIdPEj0D0LT4irQ3RGy+UAjLcK7Sw
         6TpoN9hWPCv62hMAIVPkvv3kwal5aozaFNZxzHSzLETRwc4v2LWYViiZIRsFIhNrJcJx
         ACgqpXGZsgwhxQBlO+cQHwy26J1Hv6ANcNo3Cwhg01PbNAJh1aOvyy3STG7o2xReTmdB
         QhzmhYvaqX7yXq+TOBWRudxuNJ2fD4e6F5lJdekvYYuOAxJEn/ypGoPwHKZVkcvVFFu9
         7JPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8d40JEARX8bGj10MzmeCMg/+y/sH+oW3mhHcObegAUX9MSh4a1xNPbc85jJXS34jIdzf5W3WENo52mkPYTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73V9l5ZvKYqFkBvjvyuPJZhs3dtcGX4Uj4MYxu7ZU7LWOyTOJ
	mou/J6vIAvAUiXnU2joRVwLVDy8ONQyPQl/4juZIqjB2n6CdLDhpgd0q
X-Gm-Gg: AZuq6aJGmw3IxWClprLfPp4KSFnIbXNlIKHArJDGFAlmHVfstSpQ77NfGqyPKCYl3RL
	SvujRtaR6nf5LbPl5AUNxm7tBncDi+ni8LKgKRafs1rhShBIt2RmvCyOsHi4IM5ov8mazlfBEuz
	vpNR/p5/kEqhxYCyMO3XRJBPR8QPOKNmeqKA2si+BTsGi2SA3oZ3GdcflPoKAR+ss9OcbRyXQKd
	5NKui8VCImOEbXVt6K5pHF9D3/zuCQ6T+E9Y2iOv8nBSYiuTTWh2WHwEbrDfNmlZSIs8SH8+B/7
	sy0WC6h6ikXuIg90Gil/bNGjdoWv/t75SfqcX1at2Isub8bxkwQlYGATMNnXI1ZiIEjz6lY4wx6
	p89Hu29+J9P93dQjzc9kKOibyDFf1H7GjAmPO4wpLbuTHmyEX0S97C7HeajrHE0AGadVSkTJrJM
	AUfpq1TzgrPqu6do6RVVAidyAkAbtPn3Xg88ABKv9pqusC+2aLA0b5oIXs3j+XnJ/20YKNaR2Xs
	cQjbYE+h6Jp1hV++R7QC5BJKz5mFpZBVkvX7/tF9mh/vEFprTuVODPqRDpm1tnF768pJVI=
X-Received: by 2002:a17:907:a4e:b0:b88:317a:3f40 with SMTP id a640c23a62f3a-b9081aeef7amr610431266b.38.1771884306860;
        Mon, 23 Feb 2026 14:05:06 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (230.86.12.34.bc.googleusercontent.com. [34.12.86.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm359394666b.67.2026.02.23.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:05:06 -0800 (PST)
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
Subject: [PATCH v2 2/3] staging: most: dim2: use dev_err_probe and proper error codes for clock
Date: Mon, 23 Feb 2026 22:05:03 +0000
Message-ID: <20260223220504.2102-5-iprintercanon@gmail.com>
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

Replace hardcoded -EFAULT returns with dev_err_probe() and PTR_ERR()
when devm_clk_get() fails in fsl_mx6_enable(). This ensures the
correct error code is propagated (e.g. -EPROBE_DEFER for deferred
probing) and avoids log noise during probe deferral.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index cea1ba99caf7..e4c8b4995c61 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -921,10 +921,9 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "unable to get mlb clock\n");
-		return -EFAULT;
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "unable to get mlb clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
@@ -936,9 +935,9 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
 		if (IS_ERR(dev->clk_pll)) {
-			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
 			clk_disable_unprepare(dev->clk);
-			return -EFAULT;
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk_pll),
+					     "unable to get mlb pll clock\n");
 		}
 
 		writel(0x888, dev->io_base + 0x38);
-- 
2.43.0

