Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284428;
	b=jyQSCa1JdHa1y6L3rS9Q1FiUxBeMqrCAnvcYQwiC5UaT0/NPrfx1R6pfwBJjg8OPtPUc
	 3bk35YHdOn9hoVhcWxREw0hmBa+r6o0oSkr/hzoqQ5FadX8l+YbY9T1+vOfhfAIGkI1sX
	 9pkYA3H0Una0t5e656p+5mDA9jHVzLweTc7OSMmBZKxVQKcwtu/6TbhsV3Q1i4lEUl2g6
	 rwD6txgZbWB35YTV3yYYz7x6ACa/fNvb1/ZO8Vr1Fijc9Bb8loI/DIJdUruwlNOkruAPM
	 t9Mv4xBI8DCXhOTh5Hu1aZIJ1P8ctcXWZ5lEAml2SLyR+IkbgYqaYEOZP5FYz8pmhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
	b=oyPmbDdiFeN1fcPv7Ywl+2shLhjyDTVy4xPvHNcpGYeKhF4b6Vu+Sk4SuYEw3RHvB2T5
	 fY9vkPKT9yxsLeZlGzt+5bY2BBnbcTBm44/DJ81vpEr/3MdQH7Y/WjbrwF0RjL6nodfdY
	 ye5337kk6KDivM/igCV/0GW7uvnLL5FJzjjUn4bd6fPv2/4pEx1jrqwNFBcpIJZZguKxZ
	 E2uH9eUCFLJyymoOo11NysULu8z6JxAYEsfYdExrbKmLdqRNO830VoVnxwc00T786/+1O
	 MFHMwBXJ6BAvoeYDtUS0ZBcxSc31gEqfqN13bgixxEs5+of95evopWX9lYq1kIs/wOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEfM8X4;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD3606A9EC
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FD3606A9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEfM8X4
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3720addb068so2721487eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284427; x=1794889227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
        b=uvEfM8X4IxWaMOOCG6rWQCcu+jMa0IxtQ3RvzoErXFfQZBgBlvlfZcyXCeUtI/XcJN
         uUgT1Qk4i/ZwyY++oO+ltVDxZk0KgIMJtHKLw8frZ7eqNtyeF7/2D2PJWhS6NrI8TJST
         Z3oxFoC4ozbyy9Z/HcCusVncRl3oJFymmij3cWA0Y4yrxgHQAemAVDECBU2zbAKlLJtU
         G/P/v1MpiJD/nSWbB0vXucFpk7L4bx1gsRU1f263VxHG47QynsshxJd/uoBMsbHmCmBA
         IgtYyB6zvHw89AK9UQ9QeILZTXFN8ckF0sQKBlCKOKxH/3piYR79IdOaW505FomMX47l
         3EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284428; x=1794889228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
        b=QJYZpkOzPI+/O0Y2ID2fgHIcggxcqQhNtdhcfjhcMhvzdJM61xm5/dKZ9YaUGY2k+K
         AuZAQvW1Ys5cUe73Mgt5oAUociPYdKKAHbVCyJL/rxzEHpkUvFVQ9ZN7AbXtfzORDNE1
         Nt/Q7tllPep67bq9rvJ0IxEZmhNlR9f89BQ/d9vNKH/xBEUOJHr9Lkt57AbOODLrZ7qu
         msfSoJEMMX4/yb8+tkY0cqspscNbX6GxDiv1bSCimbq8NIMg6u9cHcrVeiT8LOSFgSUv
         BnBCWne0N+QA7crgdzL2JUEsQpqfTqk4vq4Goc1q7GbS1HJUlftLLMkbC+YOF3ghvH4f
         mxiA==
X-Forwarded-Encrypted: i=1; AL+hErHM0PmINa9fyOVNckzHfvzGx7jCgQWRG+KqUATf0GL8hhCa9v4HTTDqZxQ8hMyPioy7L/8/EHplVvvxZdJuBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+aYBBx5F36s9l44w1NCm5pmnoE8aE8rraGEfg26YnHQtXsWnNR
	jLLVvn/MSNAVjNbVN1UZKIXZ9O19JLfNt8tWsVQSbEZEbtz9Ns2QI547
X-Gm-Gg: AYBFou036bDK4x+Bp8NxfeWtdT38+yUrnpFUAh/tFCa2VqvUFNiob2fIERJ3acA0GNT
	ZYPeUgtNnPKB8hq1SzgiY6IRq1N3rxVkM8+5/bob3OjVsfQacm1w7UK+xn9oyqpiyyvysU+YLy2
	Bmo2XelxQ5MulHVr6qgZ7UgsLFEHbM73rNapvThP9K8vjrOZDQMxPYQm+ZRbnzAL7ddDK0H5ko+
	jo+FLIiTJ2u/Jmo3ZiJ23RWb7Xo2eR2rWIqguEk3cgTnNVBdHfCeYEhjB6PEd1cOBzmJPYMz31h
	Wf2B/pERyahQelLokS3ZC0XBWs7k1WdfFN2CEy+FSE66Mg45TuDuJ2z8MPhUJAu/yerVq+k2IG0
	DJaXif5KdeNk6CWDExmwxmxWWondCzYXURL3eu3Y0/9BZ299l6hZ7qP30Hpsz1q9BKQvp+3QKat
	kNVrRc38FqtljQZ3GNvgnsaOtkpdsPu/51Yc3l0ZdpHQrg3lXCCdrOjlaBPxDkGDnPWfKVepEEs
	hjXkSmufZwnArteV46i3Qf/B3HU7axTMhSovwf5SZwCNK0jqBU3l7Xi87IGq43HNm0bzwkDjVrJ
	gKon44ew5Weta9K2aD9ZW2QaRwe79s4D6xHanIE6dq57c88=
X-Received: by 2002:a05:7022:3b84:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b3b604c358mr2166039c88.25.1794284427436;
        Mon, 09 Nov 2026 20:20:27 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:20:26 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 12/25] PCI/CMA: Add a PCI TSM CMA driver using SPDM
Date: Tue, 10 Nov 2026 14:18:19 +1000
Message-ID: <20261110041832.1730924-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

Component Measurement and Authentication (CMA, PCIe r6.2 sec 6.31)
allows for measurement and authentication of PCIe devices.  It is
based on the Security Protocol and Data Model specification (SPDM,
https://www.dmtf.org/dsp/DSP0274).

CMA-SPDM in turn forms the basis for Integrity and Data Encryption
(IDE, PCIe r6.2 sec 6.33) because the key material used by IDE is
transmitted over a CMA-SPDM session.

As a first step, add support for authentication via a CMA TSM driver.

This was previously discussed here:
http://lore.kernel.org/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch

By utilising a TSM driver we get a lot of the TSM driver probe policies
"for free". Currently there is no mechanism to provide evidence to
userspace, as the TSM system doesn't support that at the moment. That
can be added later when support by TSM.

Credits: Jonathan wrote the original proof-of-concept for a CMA implementation.
Lukas reworked that for upstream. Wilfred contributed fixes for issues
discovered during testing. Alistair reworked it as a TSM driver.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-developed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Co-developed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS             |   1 +
 drivers/pci/Kconfig     |  14 ++++
 drivers/pci/Makefile    |   2 +
 drivers/pci/cma.c       | 150 ++++++++++++++++++++++++++++++++++++++++
 drivers/pci/doe.c       |   3 -
 include/linux/pci-doe.h |   4 ++
 6 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 drivers/pci/cma.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7af01251af461..43ac4c0a1ae3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25393,6 +25393,7 @@ L:	linux-cxl@vger.kernel.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/devsec/spdm.git
+F:	drivers/pci/cma*
 F:	include/linux/spdm.h
 F:	lib/rspdm/
 
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 0c7408509ba24..0862ef69aa3fd 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -124,6 +124,20 @@ config PCI_ATS
 config PCI_IDE
 	bool
 
+config PCI_CMA
+	bool "Component Measurement and Authentication (CMA-SPDM)"
+	depends on RSPDM
+	select CRYPTO_ECDSA
+	select CRYPTO_RSA
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select PCI_DOE
+	select PCI_TSM
+	help
+	  Authenticate devices on enumeration per PCIe r6.2 sec 6.31.
+	  A PCI DOE mailbox is used as transport for DMTF SPDM based
+	  authentication, measurement and secure channel establishment.
+
 config PCI_TSM
 	bool "PCI TSM: Device security protocol support"
 	select PCI_IDE
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a5182..16abfd0e17e19 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -41,6 +41,8 @@ obj-$(CONFIG_PCI_NPEM)		+= npem.o
 obj-$(CONFIG_PCIE_TPH)		+= tph.o
 obj-$(CONFIG_CARDBUS)		+= setup-cardbus.o
 
+obj-$(CONFIG_PCI_CMA)		+= cma.o
+
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
 
diff --git a/drivers/pci/cma.c b/drivers/pci/cma.c
new file mode 100644
index 0000000000000..3f0c989b52c5d
--- /dev/null
+++ b/drivers/pci/cma.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Component Measurement and Authentication (CMA-SPDM, PCIe r6.2 sec 6.31)
+ *
+ * Copyright (C) 2021 Huawei
+ *     Jonathan Cameron <Jonathan.Cameron@huawei.com>
+ * Copyright (C) 2022-24 Intel Corporation
+ * Copyright (C) 2026 Western Digital
+ * 	Alistair Francis <alistair.francis@wdc.com>
+ */
+
+#define dev_fmt(fmt) "CMA: " fmt
+
+#include <linux/err.h>
+#include <linux/pci.h>
+#include <linux/pci-doe.h>
+#include <linux/pci-tsm.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spdm.h>
+#include <linux/tsm.h>
+
+#include "pci.h"
+
+static int pci_doe_transport(void *priv, struct device *dev,
+			     const void *request, size_t request_sz,
+			     void *response, size_t response_sz)
+{
+	struct pci_doe_mb *doe = priv;
+
+	return pci_doe(doe, PCI_VENDOR_ID_PCI_SIG, PCI_DOE_FEATURE_CMA,
+		       request, request_sz, response, response_sz);
+}
+
+struct pci_cma_tsm {
+	struct pci_tsm_host host;
+	struct spdm_state *spdm;
+};
+
+static struct pci_cma_tsm *cma_tsm_from_tsm(struct pci_tsm *tsm)
+{
+	struct pci_tsm_host *host = container_of(tsm, struct pci_tsm_host, base_tsm);
+
+	return container_of(host, struct pci_cma_tsm, host);
+}
+
+static struct pci_tsm *pci_cma_tsm_probe(struct tsm_dev *tsm_dev,
+					 struct pci_dev *pdev)
+{
+	struct pci_cma_tsm *cma;
+	int rc;
+
+	if (!pdev->doe_cma || pdev->is_virtfn)
+		return NULL;
+
+	cma = kzalloc(sizeof(*cma), GFP_KERNEL);
+	if (!cma)
+		return NULL;
+
+	rc = pci_tsm_host_constructor(pdev, &cma->host, tsm_dev);
+	if (rc) {
+		kfree(cma);
+		return NULL;
+	}
+
+	cma->spdm = spdm_create(&pdev->dev, pci_doe_transport, cma->host.doe_mb,
+				PCI_DOE_MAX_PAYLOAD, NULL);
+	if (!cma->spdm) {
+		pci_tsm_host_destructor(&cma->host);
+		kfree(cma);
+		return NULL;
+	}
+
+	return &cma->host.base_tsm;
+}
+
+static void pci_cma_tsm_remove(struct pci_tsm *tsm)
+{
+	struct pci_cma_tsm *cma = cma_tsm_from_tsm(tsm);
+
+	spdm_destroy(cma->spdm);
+	pci_tsm_host_destructor(&cma->host);
+	kfree(cma);
+}
+
+static int pci_cma_tsm_connect(struct pci_dev *pdev)
+{
+	struct pci_cma_tsm *cma = cma_tsm_from_tsm(pdev->tsm);
+
+	/*
+	 * The DOE mailbox lives in the device's config space, so the device
+	 * must be runtime-resumed for the duration of the SPDM exchange.
+	 */
+	PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
+
+	return spdm_authenticate(cma->spdm);
+}
+
+static void pci_cma_tsm_disconnect(struct pci_dev *pdev)
+{
+	/* SPDM state is freed in pci_cma_tsm_remove() */
+}
+
+static struct pci_tdi *pci_cma_tsm_bind(struct pci_dev *pdev,
+					struct kvm *kvm, u32 tdi_id)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static void pci_cma_tsm_unbind(struct pci_tdi *tdi)
+{
+}
+
+static ssize_t pci_cma_tsm_guest_req(struct pci_tdi *tdi,
+				     enum pci_tsm_req_scope scope,
+				     sockptr_t req_in, size_t in_len,
+				     sockptr_t req_out, size_t out_len,
+				     u64 *tsm_code)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct pci_tsm_ops pci_cma_tsm_ops = {
+	.link_ops = {
+		.probe		= pci_cma_tsm_probe,
+		.remove		= pci_cma_tsm_remove,
+		.connect	= pci_cma_tsm_connect,
+		.disconnect	= pci_cma_tsm_disconnect,
+		.bind		= pci_cma_tsm_bind,
+		.unbind		= pci_cma_tsm_unbind,
+		.guest_req	= pci_cma_tsm_guest_req,
+	},
+};
+
+static struct tsm_dev *pci_cma_tsm_dev;
+
+static int __init pci_cma_tsm_init(void)
+{
+	struct tsm_dev *tsm_dev;
+
+	tsm_dev = tsm_register(NULL, &pci_cma_tsm_ops);
+	if (IS_ERR(tsm_dev))
+		return PTR_ERR(tsm_dev);
+
+	pci_cma_tsm_dev = tsm_dev;
+	return 0;
+}
+late_initcall(pci_cma_tsm_init);
diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index 365634fb0df7a..5f79307e0f087 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -31,9 +31,6 @@
 #define PCI_DOE_FLAG_CANCEL	0
 #define PCI_DOE_FLAG_DEAD	1
 
-/* Max data object length is 2^18 dwords */
-#define PCI_DOE_MAX_LENGTH	(1 << 18)
-
 /**
  * struct pci_doe_mb - State for a single DOE mailbox
  *
diff --git a/include/linux/pci-doe.h b/include/linux/pci-doe.h
index bd4346a7c4e75..7540396336def 100644
--- a/include/linux/pci-doe.h
+++ b/include/linux/pci-doe.h
@@ -19,6 +19,10 @@ struct pci_doe_mb;
 #define PCI_DOE_FEATURE_CMA 1
 #define PCI_DOE_FEATURE_SSESSION 2
 
+/* Max data object length is 2^18 dwords (including 2 dwords for header) */
+#define PCI_DOE_MAX_LENGTH	(1 << 18)
+#define PCI_DOE_MAX_PAYLOAD	((PCI_DOE_MAX_LENGTH - 2) * sizeof(u32))
+
 struct pci_doe_mb *pci_find_doe_mailbox(struct pci_dev *pdev, u16 vendor,
 					u8 type);
 
-- 
2.56.0

