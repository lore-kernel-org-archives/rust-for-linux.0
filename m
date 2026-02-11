Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE1346FCA
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780722; cv=none; b=HMtUY+LdVMkOVf5yPe/mZH8f9XQJRjROc51CllOSwME5xYC9B4GGhjhXE5CZWd/SMBpzQKa7GQvLAcEFzL5VGHQrJ7btAH6BNMkM3ahodaP/Z0L2NfkCV8eeYV3XKrQZNLiMiv+UDcTeRmcr1B6x9NgO2he1pOE6Z2ZP2MOOW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780722; c=relaxed/simple;
	bh=Z69UWGSO1FnIFTybZW2ptY5C1ZsV33yAkveZ4NGbphA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ur0rxkj+vaSfTCzGfubwSo1tmcH25JyCS97KKQJYH5Pix6kEAxyvdsWyqtBpNtNgNysa8heh2sSsfgsZQLIvGA0kCTTQJd5WC0fTHH4jye9LgZPsPssQfEU3MLkhSqUsRVftipNEREtWG/UDA/fKeDAYyciPcTWDgmVjiruPKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr6rQlEl; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr6rQlEl"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c5513f598c0so2278231a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780721; x=1771385521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sfIotc7x/caqwXPwf+nk7Gcfnkj95FCCwlgWI7Ef+4=;
        b=Mr6rQlElHo1gqS78wcZTyeup5THY7lSLHcPWChE01TknCEKrn1eCD0Grj9iU2C8rsm
         XvP296reOTZl4ixWbiKtD4aFq8G0opqku07f8rzUTwm/l+1NNuRUTu4yDr+3CGwfxdAu
         vHShWYw3Y9dN+2/YYgVNqn05MAygKBd5aJZXv1M890ZAgERi3wSSoW7nkYAIgnrV8hh+
         A44syj5b1T0miAhEOlNI0fY3i0M/UGdoXe0zXu/SCfIFbLMytLP2qhnkI1tfoloQdo3M
         h4e4WjPbZ0r9sWOy4EzHLeMXXqH7XmKg3Ba5WexPir45XQpAFvhLHSDDP0VmxYeDIObN
         mx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780721; x=1771385521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sfIotc7x/caqwXPwf+nk7Gcfnkj95FCCwlgWI7Ef+4=;
        b=hzyTTtz3vt5LjOsZseFE0rJ1JdU1xRUPYgD25EGRx/Om0opXkEkAvO9WdXMHA7+QRv
         O8CHA7TR3lW5loiuo+LrKb58P5ZMb/2aZau0KPKQu+NVvD7dPVsrVumeZl5PZCr3o8qq
         X1ys0SV7DjmCWllcKaVBphGiRIxylipprCqB/JO/hfR7XBq5rW+/Bbw5CKGirjPri753
         xC9aTJTehOgMQPpbRtW01YLPCwcpwF7aM9VFEjp+jZBHDAbduUfvh1GLQcqWzMww9Lrx
         FbHP6qPIWUMbmEKJQk+pFipSezwygmZKSrRawYZaAVROfYEe3yFFbtF5h8NEK8MARIbZ
         5QIA==
X-Forwarded-Encrypted: i=1; AJvYcCV+vqLUJ14NfeUEEtO1rNoRPIiLYaub+WBxE3M33dDdTdhs0LVoRc07ZV08fAIS6N/hegDCpXLgD+MrCkdkoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJ7Bo2fOFoACo94qL062twIjl9Kn972GIaiIurlaZsS4b++5k
	O8Cf66uOjHW5CU2Wxw2kKHJxdnasrmIUcHUp9qU8Xoaw7RVrrfBf2mkC
X-Gm-Gg: AZuq6aKHDupUScgpi9S3lpIMFfuxj/KHGV12pMTBnAz4fMVjMB0KpaTpa8EkYb4pJ/C
	SikuYeyTq9EHsRamf/r4Bonii0khEwYZcy1tsVhlZY2V7I2AwOlgoCQX2IDJ07v21hya+zGvjuB
	ZP4Tw8CwcMXV1hk8v24JhG7a81ASHe936I4qBbQLEvGnHM1EdOIT6v/X8Cv8GiV1xHvJhU4o+S6
	vk+D0gcaQGzujPZbW/KcE/wirgD0LeXSsyXW9ir9Ls2LwOHcsEv9Q7EZfl7lH/E6cx6MggOVg6a
	5/OOziCOAd8YXlMxMH4SYVR8Xt5OzAi4Ayju/DDsMtQT5ycscnJezD7FISy70nxro+PsxKDjT6E
	r+TagywyxC+FDSXU/5aFo9UW2taSVAmuSCfP0AD2jARpjl8Ps+EI3HIjzKtcx5uaK4zctsxil42
	JH6y3JOb2kAAlHRd9jTa2aGFOHWy3xDWWfqFl6x1msFw==
X-Received: by 2002:a05:6a20:2443:b0:394:3001:8b59 with SMTP id adf61e73a8af0-39432412df1mr820541637.53.1770780721130;
        Tue, 10 Feb 2026 19:32:01 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:32:00 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [RFC v3 19/27] PCI/CMA: Support built in X.509 certificates
Date: Wed, 11 Feb 2026 13:29:26 +1000
Message-ID: <20260211032935.2705841-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

Support building the X.509 certificates into the CMA certificate store.
This allows certificates to be built into the kernel which can be used
to authenticate PCIe devices via SPDM.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 certs/system_keyring.c        |  4 ----
 drivers/pci/cma.c             | 28 ++++++++++++++++++++++++++++
 include/keys/system_keyring.h |  4 ++++
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index f3d8ea4f70b4..adfc24139133 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -28,10 +28,6 @@ static struct key *machine_trusted_keys;
 static struct key *platform_trusted_keys;
 #endif
 
-extern __initconst const u8 system_certificate_list[];
-extern __initconst const unsigned long system_certificate_list_size;
-extern __initconst const unsigned long module_cert_size;
-
 /**
  * restrict_link_by_builtin_trusted - Restrict keyring addition by built-in CA
  * @dest_keyring: Keyring being linked to.
diff --git a/drivers/pci/cma.c b/drivers/pci/cma.c
index f2c435b04b92..8d64008594e2 100644
--- a/drivers/pci/cma.c
+++ b/drivers/pci/cma.c
@@ -10,6 +10,7 @@
 
 #define dev_fmt(fmt) "CMA: " fmt
 
+#include <keys/system_keyring.h>
 #include <keys/x509-parser.h>
 #include <linux/asn1_decoder.h>
 #include <linux/oid_registry.h>
@@ -218,8 +219,31 @@ void pci_cma_destroy(struct pci_dev *pdev)
 	spdm_destroy(pdev->spdm_state);
 }
 
+/*
+ * Load the compiled-in list of X.509 certificates.
+ */
+static int load_system_certificate_list(void)
+{
+	const u8 *p;
+	unsigned long size;
+
+	pr_notice("Loading compiled-in X.509 certificates for CMA\n");
+
+#ifdef CONFIG_MODULE_SIG
+	p = system_certificate_list;
+	size = system_certificate_list_size;
+#else
+	p = system_certificate_list + module_cert_size;
+	size = system_certificate_list_size - module_cert_size;
+#endif
+
+	return x509_load_certificate_list(p, size, pci_cma_keyring);
+}
+
 __init static int pci_cma_keyring_init(void)
 {
+	int rc;
+
 	pci_cma_keyring = keyring_alloc(".cma", KUIDT_INIT(0), KGIDT_INIT(0),
 					current_cred(),
 					(KEY_POS_ALL & ~KEY_POS_SETATTR) |
@@ -232,6 +256,10 @@ __init static int pci_cma_keyring_init(void)
 		return PTR_ERR(pci_cma_keyring);
 	}
 
+	rc = load_system_certificate_list();
+	if (rc)
+		return rc;
+
 	return 0;
 }
 arch_initcall(pci_cma_keyring_init);
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index a6c2897bcc63..35a33412e175 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -130,4 +130,8 @@ static inline void set_platform_trusted_keys(struct key *keyring)
 }
 #endif
 
+extern __initconst const u8 system_certificate_list[];
+extern __initconst const unsigned long system_certificate_list_size;
+extern __initconst const unsigned long module_cert_size;
+
 #endif /* _KEYS_SYSTEM_KEYRING_H */
-- 
2.52.0

