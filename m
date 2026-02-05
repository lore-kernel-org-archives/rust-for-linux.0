Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB430DD3C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325678; cv=none; b=Cz29kbwAqRQ9KY5r2NPvEha48yMNfveeEiBm0YjJcSx+OMBjf0j+EK184bdpQ/yrgCZwDhe7Mdgs2HGzvcyd9QNg+m30j80X69ORrMtkRkmoOryAKd7vPHm9G+Utx/A6YLX761WvebVChJKhzKk0cJM5uYht2i/9yy/FbcZ8ytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325678; c=relaxed/simple;
	bh=rV6qi9tLa8BSeGhd9naq45rlh6qRoKLszIak7MQlwuA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=A+aJFd6HaxWyLsmS3AUVAcLBKM+RAdz0DCfUgTwhI655FDoYjIGe8Hy8sryyoskhfZYLsCiV1jRQLyNSWGQaVbwmkIqm7P02hfIqF0McAKSwuv3YP+4/jKcQYUC7avR31BwiJPa3RBK1iCJmKWNo5O7UHvTa1+0NotjP+fleXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CbmbXjKM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CbmbXjKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
	b=CbmbXjKMchjFZBkcKwVyvk39fbYNd//vbzJ6mEW1i8CRifxzF8brHFrAJSNZKd+cyZxOvn
	ppPYa6+RkqtivFiuDrNM5GWtuyN/s/SclLguLY2rg2LTjjo5TSZXYlBCrQ4Q0smlfvzpc/
	XniejhWAjPdmd2XwQx6GiqIyjdtH3kA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-NLugeLWxMOSQwA-lz00zpw-1; Thu, 05 Feb 2026 16:07:56 -0500
X-MC-Unique: NLugeLWxMOSQwA-lz00zpw-1
X-Mimecast-MFC-AGG-ID: NLugeLWxMOSQwA-lz00zpw_1770325676
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89462dd72a6so52814856d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325676; x=1770930476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
        b=WLAfaL3TO97vowirI+m37OP4asXqizvwVL74c038zmFRkPFDt5jmQg6YDqZWNH42vP
         h3iu59d2RCIKLW4F6M+TzyJb0dxwqjDZ7Jr95wIxDVTER/4nBnw+Ct7p5cCyXXyauBR8
         lgzYKonGX6TEiiG+6dFhmNaZ26o9l5k/S5oarpbaXHb9cRYAs2KYQQBoYhtHOphTwGzs
         otfSIVKLTE6wxCYEh4kb2aFhpOqFwTdByvMqQY0zBYKFovktY9PI0avGtkcw7/ciHTK0
         rPGQ5RwXCe6dl1b8rDN1oAILNMA6zCQLc0Y1n26Lzbr0CzhM2Htbo0h3Unic58fE8bAX
         MuAg==
X-Forwarded-Encrypted: i=1; AJvYcCWlsbxqJF8G8/R+CCqVbWeTccYkD+A7nfRocdspGcPYto3QP+ithJp6nTaOzw/H/iH1/cNQvuLcpgOuuAHK4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUl3nq1Wia6/d38+/xt70rxqAgsh7r0ur4oE2QZ3hA01Zs1heC
	bA611cEGYQjn9GV0GVcSt3Xq1/iqPEXBZYW9opdcyvEuOWR6zdKmtTKPPneoxY2TU5rQP5OxSNP
	k8+aKzdJ+05sh12U44UdPiuDqj+87amwUZxirLVuWduPp+x30GOs081JGoK40yMzhZEhhlIIEvg
	hf
X-Gm-Gg: AZuq6aLoWeASo4vn2MN3Oxxg0L/i8h4jxYB31i+8XhWCG7uYcuLyUyur3qi6jm4wPGL
	b9T79oZeK4j0LJbSDtrKH5zKsr9+0PtyvVbxI3t2O90FLeDjk6OMU7ZwOXrTdYj0nB7VYGlY+x0
	Ry+CqnOnl3sze74m//OGUs2TNUCx22xh0hTskB38p7iCf2cAKQLhjDVpRHxRyzOMaOojaC+FrLM
	DpLWwmGXaUgNF/LjqjoWqHijwvUnmgCed0yQ/FzXJq+VdGJN2ygj2e95z9qeNHL0s/Gv/Gn7Rt8
	Aw6Xe1DKfN1ZhoSmLWOx3nJWQ8O1+bXrpxLEnKUCWwKYV4xVAfQN0CMhDZRjDyxsahAY1nIXyrA
	QJ38PM9wGKhQit7w=
X-Received: by 2002:ad4:5ae6:0:b0:894:7798:8fc with SMTP id 6a1803df08f44-8953d0aa832mr6847526d6.58.1770325675526;
        Thu, 05 Feb 2026 13:07:55 -0800 (PST)
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8953cc8c1c3mr6669906d6.44.1770325225055;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:49 -0500
Subject: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4GoX3j1k7j9CcnPD8_i4PjpDYtzVgQMF2g5hLHf0rU8_1770325676
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.52.0

