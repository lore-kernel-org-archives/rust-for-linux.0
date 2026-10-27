Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078754;
	b=K7S8F6eYODIhDA7fL6sGLEdVCpA3DZgpOos+gFdDyBdMLZuhAD4Yuz0JAuejBE8RtDp+
	 UdkK22LQ5gaIfhMu5XugDcFaDP0aFmF+FD8iYPklxpI2YFsVkC8JLmTEkw9NGuH8Y/gGs
	 SEssQFJpOHAUGfGtFYDEuzypBAhetAfOyj+vHL3mbMspc6puWmytkV5LDx0CeaqH9hAYc
	 Mzo/8N8/tPoWhI8oDldvU86UobnvG37a3Zaz7RiOd8ItXBi5zT5wD4xZZNUNlqUTXFCps
	 kLrxlNkx2isbZef9bpVus9abPkM5sGpqC4jHRJ3jiFL03OHytskX/8CKPjy29ObpoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
	b=V+kONi1OH2ANvcXTj8rF3ee57P6q+YzzuAv3sk/NGMiN/owDDY181ZunC92fwwPa+Sre
	 pUSBs8aCWal0/e6Jxxrhz6QYjF4bxogvAvjDstVjrZEfZXsZhPzIFKP0ESPFLOKpqH+W6
	 Ox9Ng8O5oc/c1Uf4EPb7NucW1AVMQU7WhLlcNBYT4aonazjGDY/mmPT19zvz0BoKXVG2y
	 4wAz5M8+cfhE/1XEFusUod9Kg8MKiCoMsylPw+7CCp7p1dj0riAvMxZ/1yMX62sMqve+X
	 1tjsRZkPd+oAbciwJ/zjwucyI4hqE7mu2GEVjHtOSP9jRGkllmdfeUqept8nNGRCyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cz2btDR8;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F1606A31F
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cz2btDR8
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso24313145ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078754; x=1793683554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=Cz2btDR8XV2eezXzWRlq7mbSvagoFv+4MtQfyrcCn7L4Haf3pdebXhwFFcMA+fiAoI
         nNym5bMFgAm6rEppUfIigN//XpHC9ruj35Ed6Ve+0Q0JhUswR98+bZorurlfG2FazHVi
         ziQibUSnNZzwIsS8pgeY8ZpwnqSMKD0Fcv13o317DItLWyEaK3e7sEHJEKlyNMENKuu8
         27AWXQByvboKoYM5r93nHfR9FwfezhgVBEPVE4oDs+ozM0O4fg8OYBmOHKwH4R8DrNka
         0zLj8jAwl/gpVw7mSunoRfESjwWHrwvwtm9EETHzkkT3Gi6N4St+LRscwDcyxk8bepH0
         un9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078754; x=1793683554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=opqpjeEt08ysUqyfMzZUst6bqukhpb2FgjOfqye01uLLiCBYhFk42ENWM7PRRfXWer
         vaSTzYq2yDJIhlfxsXOrsHVsfFhgkmPOTj/05uP2fDI5RDt8MJy9DgJztbu4T7mHbxrp
         50kzPQ+imdeYBVspE5Gw/tSZqayNMnOYVhClNZ5yLVMD5NvwKUqB5uFrTEQQPzUC2+lG
         7tPj0RADmZgNbXKJUIB3BgLRTnga4INQOnga8fr96CuVhac22CiM/PiGlxk2ZvuDv6ZE
         JqitgmzTgi8ZVe3Ne5qPW/axyDYKUWKdltWIDXvnySIW+CDzvK0JB0SWUiB4F4zPBxwF
         D5XA==
X-Forwarded-Encrypted: i=1; AKwUvByI2nFrJ1urX1wYHNlH7XbSGF9S6ECDrfIzNjtglRT233QQOVg8kd7/QZwqOTwCzVUA85q7FHpuABy2z7iWSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQiasyjsXZLnoi3f17Cht50vBoatTZM0okjgff+PP39cnUAn6p
	S/ufuKTu5Uq05XuLoxnPr1pTXSVU7oMHSqr12lKHJum6nqZVeN0ElVCB
X-Gm-Gg: AYBFou2bFvIcNpATrLIZzSebiSYOS6Mp2SfBXMqqqEDSpbArKgyltSKHqjfbQ/2zp4t
	w8gR3eKPLGYV049rTbPqRJ86bNQLSnwwyuYNJVB8xFOGr9/KrU0Icyv/tuyz5guIYoreJLmMrXm
	NBwUFQV2mh8WuklpqwA2wlC9V/XyzAqcye67hZJNgbK2YI1Gn1KLV+4qbK8tZ5k4x3/edCZ7r7u
	AmeN1yhfnMlPUrIYhcp0oliBn1vU/+s43rU2Yj/M9m/0HK75J89XQM56wU7sA/OZtDGAW2xYKkj
	zlsJALGVRj1g194c6gx7vKXn4HMINK6RBKvqDXeTeSDAZT9gKLit0gmqDKRKm5JvzxuTIDY0Tuh
	eP4G4zf1Zg+LvjzrCiosyRmC8bc8D/AYLXZFigEJAHmiJ+nqTjGpDWLNGk0HZhI9+7CPt3O0gk0
	TvlWk5r3zMplwgVLdJ3wZkeu9A09wSMbKqA1I/94pPBljZz1A3GZFXK7EcQHROBwdWxR5X6TRIS
	yEPxEpy8VGuLJvBpeCmtmY9115SOM9L5ttDWTzz75rdUTnDR4kIY7jQ8ta8yRqKyf5BRQgJtQ==
X-Received: by 2002:a17:902:da85:b0:2ea:71a7:7f21 with SMTP id d9443c01a7336-2ea9c6c245fmr69254805ad.13.1793078753628;
        Mon, 26 Oct 2026 22:25:53 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:25:53 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 01/23] virt: coco: change tsm_register() to use a const struct
Date: Tue, 27 Oct 2026 15:25:14 +1000
Message-ID: <20261027052536.1722081-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
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
index 46f2539d2d5ab..48df8c579c74d 100644
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
index e784993353d8f..6b735ac2a814e 100644
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
index 381c53244c835..6ac12de8c4d36 100644
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
2.56.0

