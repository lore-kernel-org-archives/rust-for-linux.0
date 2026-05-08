Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0D023AE62
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210283; cv=none; b=j/eHiT2e3tCBhgP4N4H1Rjhe75GOA3RmcRTFydtA33x4NUpZzD11C5lEYx8IpWB99VS6kJfSAw205b1mJx4Xhdzy9BcCKJ3MbRBD7PnMA+RSW2cotUHhDqVqOz+8P3gxVStH9cna4bdO6o3c3T5Rwp5YOrfVbsfMGQOeFcQlzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210283; c=relaxed/simple;
	bh=UJEK4Y1OhR+erOD7cv7y2WCfgF+MLsewlMFQ+GFgGZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9JfjY2VyD/VCP8A5OXyc6ETkSktfxRU6Tr3xA6IMz4WFkCE8U7eOfNLwP9z+Nz5o8rQ45kBRMQNBGm+AmFYfOFXKu38LBvGrXg1aVYZHuBIhQYLNqurAmckwswd8uX1RG8atS51VdgXWVpsphk2yKvuSgnCTdw5ntgC0rjf1jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAatbeSc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAatbeSc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso14671925ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 20:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778210282; x=1778815082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ea9CQEMVfcK8wVMyEmmugnqFDUXoP6diCNpcvc9CFc=;
        b=KAatbeScxFvridVADwksd9gbbG5nTUFqMbvunoN8z7guixrtGU+2LMpreIEfZO3dPn
         SRESKEXFzKT7MFT3ZBAP5qX1HLz2Ccsy+x+dMHTcUtsp4ZefKx8qcVoMgnUKraeRh+hX
         vAp2zw6Px8fbeUZYEHLJS6BwnXRDnb/L/dYkWbMJipLe3xB6Np8w0xW3yQw88dIHDkBR
         yr+R4e18z9zsWZ08WvvKsGRXF5p3cXDhf3hUsPX5SHmvClRBX0ET1g0G+PNMTi7wds3/
         joFS4xDU6anoh420k3HKoVqii8cGDNW06uUO0Iifq3Qrr2R/oeB+PnmppBm3+go+lWLG
         sN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778210282; x=1778815082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ea9CQEMVfcK8wVMyEmmugnqFDUXoP6diCNpcvc9CFc=;
        b=L73K/lzPheVRDftTcPqERNkAtMvBgb6NxEumEtUYq7e65HYgabXZL8l9EgKAmChxFL
         oksi6K/3ZgMPwRbm0PT/fLCdb/rykalHOBro7X/jQiT9ROxKAF+m3x/o/BARlJ5uSv/h
         IpfK44T60YeITm0YFyYPQbtuV71x+SXRRk0kFeq7kXU0jRvMM6OLQAaxGc6OZHAsERMh
         CGpliM9zWwvkOdFDYJZRReTLGnjg7ZG1hD9vjrY5tBJ9qNsTd155xsdMk9AExAREcfrZ
         fT/sPG2bsjUaS0g4YhnPQF+Qahcda4B3oUXug1dCDh+pN4xmhX6dxhx1rafcYmssMY2r
         gJbA==
X-Forwarded-Encrypted: i=1; AFNElJ+NXF11gYSGXmQzJozUd3d976yFFZ7SYlZPoIUIYe661gTizRp5cwo6TrBQNuL83BwvuhiYKsUqPbzfP2F4sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/0F2+fgvRGwyER0/lryv5Hn3+CxNYcGv9Sy+U+IAN5WqEIQ/
	iihuMKFDVd7bSJVh+C8D2m752Uln2we9N3tKVhBw1JMEp/XhR3esXvoY
X-Gm-Gg: Acq92OFDQrTiIPbVGNQ3TEFZ5khwsxbE3RW+2aNe3m98apE04JuLib5YocOpdCBBzhu
	j5uEawj4b2Zt2+SWFNuomsLEQJlCEdGTPPvzvoMzOvrs4udMTZogrBiTZ/G7jP1/nw9x+qSNewb
	MB83uj3lFkue5+6H5HUrJ39SZZdAKlXMn4NoE1fvU8Fu+YxK63syWQr36/2XBhXn92xZWe0N4V3
	vU475fwQRCgqjHzQQ/MOPMoRaftcMlhzY02x9/HIrUM+kxvN9iT87w938xHzbBweUcmDYBE5QvL
	l7TF33pcDgUEZlEMg3irb61RMRnqxpNJWC2aWBaQ7gMMxGdIAXwn0La6QI+ykdNlu521noTKgam
	lYdzfoWOJM5LeD8eOeahLl4cV/7yxQEhCG6rYYLd6g7YWOa0d8wB0VpWP/ktns0khThmFERA5qN
	odrZLyUqONTfQEnS9272IO3fulwIEZJhU5MPJ2luVj
X-Received: by 2002:a17:903:1a88:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2ba78f54deamr115997225ad.13.1778210281888;
        Thu, 07 May 2026 20:18:01 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm3220685ad.74.2026.05.07.20.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:18:01 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: alistair@alistair23.me,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	Jonathan.Cameron@huawei.com,
	bhelgaas@google.com,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	wilfred.mallawa@wdc.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	ojeda@kernel.org,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 05/18] rust: add bindings for hash.h
Date: Fri,  8 May 2026 13:16:57 +1000
Message-ID: <20260508031710.514574-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508031710.514574-1-alistair.francis@wdc.com>
References: <20260508031710.514574-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/hash.c             | 18 ++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0866..d73142078240 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -30,6 +30,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <crypto/hash.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -60,6 +61,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/hash.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 000000000000..23a63618a370
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..6372e14f8419 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -60,6 +60,7 @@
 #include "dma-resv.c"
 #include "drm.c"
 #include "err.c"
+#include "hash.c"
 #include "irq.c"
 #include "fs.c"
 #include "gpu.c"
-- 
2.52.0

