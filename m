Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615222ECE93
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210309; cv=none; b=ume3KK+6KUE2SiyqPccBYdhDFRstw7MQNtN5pBpcAKb88NKa8iz5uYTFDr7Uo8Vx/D0cHn4YTzBWfVWmwLcWbjHft55L152n5HnfJVgZ/4gaMNBgfxlQE6vuhYGlQo43R7/IuUkl7RfSsKmoD+AV9oOVjJBxI9dE/QmPi4qU9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210309; c=relaxed/simple;
	bh=L++LTy00lMS0Z9lJGdmdFlMR2op6hVxOgn4kFHOj63g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ux0sGKxuTDAeuqiO0xC1tfC+KMbNg8+ZCoNxbzfBHkfmSkYDDlj6jKR4CJSkOFmyglXr6bnZwYt2v0bz+4tHQiEP8BjeDgqn7AQF4FWSlKkqxBX71WoRkXperBlHVCW1/l2LE74X6PL1DMuUfJKhdopdWlfRCh0tKEFQhK8eZrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luJNN9US; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luJNN9US"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so9933085ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 20:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778210305; x=1778815105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaECM3afZbtSVstcoN8c/Bxd1jLK8MEltAPqU9LiKz4=;
        b=luJNN9UStWQ9eytibJ2OU3m1xDtPOGuAPbgmn3NRUqFn2RXKSB372N7kP2zS/O6u1C
         tgqLNmqNVEx2lqTs9BpR4OGT+zvIfLsVMXA3BHVMPtyXBy/augp/ozTMwDHKEypEduug
         YH5q7aSwCCMWsne4haDQHyqksFulFOgJwTMzemcbKisWxGdSRr9shmy1NvPbuy0IdWBs
         IksE5SdWBACGQCSMph0m2zskToxWqo8/W/VJ23gsYl4lOr3AYqUDx+nkMoh0rgHKSa6r
         R+VjIpbJxzK1cOREGT4plIlq0prwY7DZFxi96aBpU9smY8SjAsIQqOPlFTWLEmTZBO3z
         K+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778210305; x=1778815105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DaECM3afZbtSVstcoN8c/Bxd1jLK8MEltAPqU9LiKz4=;
        b=FheIr6hvftORq8yRSrufAnQCVC023IW4NuaTlCkMueULxLwvzl40mDl71ebX/Wxynt
         Ve1Jz+IZJ0sY15gMoTYGo12zCy3tIsMN7+BJ5e7ewHxCGecBcLsClln82z9gYGGjv+bP
         oXvfnKR3tUwMkzsQkjJYh33hkpo+bSmqYFvYXCo+NgUSacBSPcJqQgzFWaf6jje2Wtgz
         SjFbTYaQcQ81gAk2MqPV7xHTF6qJ0moR2w1my7tOhCpn/20MO1XijQhA5/owVFoRNxUD
         CK6YmZS3Ij0LdfgFYsE6oMJF+CCaYStFioW8zPJiLLYrPFXWBkvFawt68QOiyQi/fijg
         Ypiw==
X-Forwarded-Encrypted: i=1; AFNElJ+ruEr4d60/PjsDe1L/x5qoZUHAjAwOUiru8kCNkId04Z2EOoCXN7JINIS1dxYxeSZSC/h72FBGwlOR9Vfwvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPendifahLweTPX7S1a+DhGtUV/q7la7s4SDCMW8PizI/eFFsg
	iS3Rb86q0W71EDVg1/5eo0ynN+GH/aMv6+o1GJwEUMGI3Qsw84h9iVcM
X-Gm-Gg: Acq92OFiYjdMKAqMlAlpKubjiBlmHwzjR+lRyE1BcfFEgO3+/+9gmLnAzD2eRRQ9mMr
	GNiwj2a/Y1Xafaxkg9ghBCh+PykCaU81fMdMVSonBoQmiv5dadJ+OkplGy8TWofJmMs7yMQOxUk
	lMs7GbqN0r0uwcLGM2zTrqfFz0Y3ef4iBpyrTZa5WOmkhGljSA9/2zSp2/Dr9EtD8OqMSitSaB6
	dTyuzNwt+RagIXNvJAIA65WYls19eRxvE+leNV4lo95KaeFt8maQy/sccJLbwiK1Q3d3dYwoFVv
	C99euA0kWGr1Rg2IcnKOoYDDlnxK1f5t0gsyOUSdlVw9UE6ZEBkrqtYb778w7otZXH4TrtlU8BL
	oK0TeExYNbb7PVYyFY6CgdyAQLp/lCYACPmAlwcWiSupMsd8goZe4CT/h0e0mlN3L5Yjz8U9IE6
	KIm4bUfL3gITRMvTOHBtmvKMyAFbCQ2h3ufVCcdfEH
X-Received: by 2002:a17:903:3bcc:b0:2ba:4e84:976 with SMTP id d9443c01a7336-2ba78f45b67mr104924825ad.13.1778210304563;
        Thu, 07 May 2026 20:18:24 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm3220685ad.74.2026.05.07.20.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:18:24 -0700 (PDT)
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
Subject: [PATCH 08/18] PCI/TSM: Support connecting to PCIe CMA devices
Date: Fri,  8 May 2026 13:17:00 +1000
Message-ID: <20260508031710.514574-9-alistair.francis@wdc.com>
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

In the next patch we are going to add a PCIe CMA TSM driver, as such we
need to ensure that is_pci_tsm_pf0() will allow us to connect to CMA
capable devices. These devices don't necessarily has DEVCAP_TEE or IDE
support.

As such for Root Complex Integrated Endpoint (PCI_EXP_TYPE_RC_END) we
also check for the CMA DOE feature.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/linux/pci-tsm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index a6435aba03f9..5059954e4853 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -3,6 +3,7 @@
 #define __PCI_TSM_H
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/pci-doe.h>
 #include <linux/sockptr.h>
 
 struct pci_tsm;
@@ -129,6 +130,8 @@ struct pci_tsm_pf0 {
 /* physical function0 and capable of 'connect' */
 static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
 {
+	struct pci_doe_mb *doe;
+
 	if (!pdev)
 		return false;
 
@@ -146,9 +149,15 @@ static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
 	 * switch.
 	 */
 	switch (pci_pcie_type(pdev)) {
+	case PCI_EXP_TYPE_RC_END:
+		doe = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
+					   PCI_DOE_FEATURE_CMA);
+
+		if (doe)
+			break;
+		fallthrough;
 	case PCI_EXP_TYPE_ENDPOINT:
 	case PCI_EXP_TYPE_UPSTREAM:
-	case PCI_EXP_TYPE_RC_END:
 		if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
 			break;
 		fallthrough;
-- 
2.52.0

