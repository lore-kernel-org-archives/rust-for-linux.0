Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12057335555
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557902; cv=none; b=DFWhDSrQuy19eKW6ngzfVsMN0McNXSyXww9UAzUPFk3rI94ILXKILDBI2lwXp2Cr5my0HyvCLp8yJ6Z1DaIwEIVaWe2j+SZiPoAFALaHFar4jUHVSw23kmQYspgoqoXS4ntuIYsmFkZOH6c+k7wrwM3zRHLOW7QYBH//En9MzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557902; c=relaxed/simple;
	bh=Q+vE+X+sG/ZYk8rkcS5IYVR/ggcGiu0wbko6eWTdm1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9HaMaE5D8A4BTF8jqmfCLdGD5ZH7bQcYsm59FrGKciRQJKsDvI8Kn4CXzvIYy9ahO0WjyKazO5KSGlqlA+GX5U2gNNKGRVdxt0mckotHwtX1qdoD2Zn6L1CuJnI9bbgmic1p0qJn+U4tGLqi0+myqsCSnLuJ7+cHqR3YfBoDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyA0CQA5; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyA0CQA5"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso793509a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557900; x=1791162700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=DyA0CQA5/RoSi8Er7zAnoUk+cMdJzB+KWXnCL2wg2iGIKAHgI2ciiGI/4lv5izrz/y
         vhohoQZcyAT0wJpn5T4+G8kt+8qopFtC+3aCMCA7KDgEfRPeapT+gG4KJkwmD4AfpRpO
         bKi8VIi84yvIK9F95Y1b83oH7k5diNv3AEP6H/DcHF0UTuInXAwFmLpH4yUWt5nc+Igq
         6JmM5+N2ZC2rRCGkkcopUn6qV05hanK6GcEAUOL7rxcxJtru6of0yea55d5FtWhhgesz
         2FZgitqovIaF9nlXx+Hwm2Piyu/zLxcXVIIN3vVbx0tCBshXt1byzeyIQR9FRFikkRej
         uQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557900; x=1791162700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=yiXkL81cGfXeqOJcA9EKGLts1fdY3yxYFF0+CdIK+Op8z9e9Ul5sck1VEUTh0JJsSA
         7eZEr/3+PK0Ho9YG0obCaEprNnyCUEKV34LgzDVnO7mGjeDOQ5GJ0sOGka2rEjaDiB4y
         SQMjI4MLE0sPOUy8lDYEuEJiw+8qM6vsBDZ5KhNwkwBBawF9QgJBTidb9eQyZD+QHg4o
         0+TREPw7AtWSJPGm4NVPPbgbwpBhIZyVNuZE+MLtTNj/vyl+hWTk0vcHpuGKqZvN9V77
         eUO1eZLgF8vd9GVg66ndBpE+C/gXPBv45dvzn7c3Wkvc51zRLfEgn8Dsy+luf2LYqWbo
         RIzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/FXgL5glojBz86p7tGVFaB85AXhO0bmnuPUyBM5NKBB7eJQGP+yTSbfu2IpSKC2dMRh5g8UHvpaqwHqlVOQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLC6wIEUgpdpCucTfpME4d96uKR478XJrJ7s5il1ASX6kvIMxQz
	p6wJgRfu94vpGkN59pJ7ZarJ/7DJdLCVNaudLiSAfYyGuBm+xkc0iO6j
X-Gm-Gg: AYBFou3ARg84rBnc+2rxZrGtXRVuA3Ard+bHOgZJ0KJUoOIO9joEc/OeZPKTjwkJGlP
	IXREr1GPyXP5SOk81DTPZ1WZv1kMJuG5XHkve1tywxqXBqKt9dDmf+QAGggfFmvGjNdLgDcx1uO
	Ej/vSZQN52vQVbCrn1a1+VuIIYb55pPaFoIL2J84T85yuXzPEH1L5Zda47aLvryK9uvYkouLXP+
	4FVAiK62icT7984OYYDl9gd8TpCbpXGDq7fFLWWwSetZ4TLlyPMq0pCJ47zm5HYAm6TMJVevRkg
	nCYQWkwNBeUN/D/xOmp/dQd7cP862RJPpAHQYje+NTL9D4/hp4m8KuQPDJOjnL5Tk/E2/vcw0k7
	qN+Bx00w/oga3mrv7gWpYuD0ZAqCTpQ60oe7WMRoGENjwwYyC0PhBt9BxnjX+eDPpJ9iB5SS8ri
	FQ+ShiFi+yBdvtXxCmSqQ7c/XjzK07xWV0ByiL4Lxvns3jFpvcpwQRZfVjsSJUuyCE2scHpJnHx
	ZON4uP1XTKNhzps
X-Received: by 2002:a17:90b:2b44:b0:3a0:c276:1ed1 with SMTP id 98e67ed59e1d1-3a0c27622bamr5274078a91.3.1790557900399;
        Sun, 27 Sep 2026 18:11:40 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:11:39 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 01/22] virt: coco: change tsm_register() to use a const struct
Date: Mon, 28 Sep 2026 11:11:02 +1000
Message-ID: <20260928011123.450800-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5a..48df8c579c74 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..6b735ac2a814 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c83..6ac12de8c4d3 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.55.0

