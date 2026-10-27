Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078793;
	b=zUnSMTIImgXzKIUJDeNvlAz5RLktHZ6gfGiOUgiUrNkbY4vHMZfN+3O5Bl5gYy4NAj9f
	 FU8LYbS36FHSQFUm4GENM2abZUndhfbCOZWzgWcbRiOlkfmD9SHxoqVDqUymQ6BEDK0W8
	 wk0GLFZKfMCiA9aJA+UPvEvzqHjeONibzPUSfgjuk6BmHHA6slC+GlOwsBxuwFOtiVc70
	 EWHhoWuUfR7aMyu/crVPtaucqDXQktX2IscQtgswgNRrfOub+FFKiUo7/Fhf752LeCJbl
	 /QWK4aiJBh4wh2HkxPl1BH4yL1jYTDkE17ofA+Nemo5yN9iUdOCmUz5B3n03Cvqt4fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
	b=hEDKMvOzjdYyPisJbXWl+3TK21CKsztMIlECB/K4RNFyMydufzvIjnoEHEGQM0CNy+fA
	 YOT1rKZzso6+ei8dfMypEMbKcM06zi6mz6iWcPfMhnPr4M38Qt+aQtsXWNALcaYkxaCgb
	 loFj+R8Oj7jhCBQigcH4s2zq6ygc1m8z9LPVIEf2qtqwyvVs5HVja+QbXhUwty/NwhKPS
	 eUwU71SXXuXnyVBLBNQ4cmFZ0KSGbMRPHJEM+d6utnDIgK7bDgur4JTx8//PL/8h/7sdP
	 JuMnxiE6dNxE94nqz8kLIu6YrTqK5E9Jv2Rkwac0zJTNuvr8DyIicake1mnejEcPC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrICPA59;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A61606A325
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A61606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrICPA59
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so23857135ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078792; x=1793683592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
        b=JrICPA59gqLNarvkqoO6weEHrW/zx/EtXlFr41nnZZhTOrquJH+7KlJpdvFvK/0UcH
         Dh5tNFTgPHYmXFKvUFewJIi2XvEK8rLKITKXSbOkrM3tI+SRkVR5oEMTKMAZb+VhmfnA
         rluifilPnZR2HrA4S8rDrLOLFcEIqm24Mc/Mp67k+86FnLlq+Pxfhy0Ov5ayl9ME4LYi
         RxR/iKU2aFqvtDs2/s42VfPtOGh0zFNvFu7m57mUq/IEpvdZT6da1uFfplL4oOx2MdkI
         ip7NjXTlg7qYq5uigXCZ+bFxBy6qDV3BeFpncVkIDluMNLte1MR4h3C8r3vHc0TileXf
         1xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078792; x=1793683592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
        b=tAuZzscpYDyuOFjwcftZ5EryAmsedd0YXQ4IQQebL2foArfAB45wHqCKg13aZtukV/
         wd0WUN/N9olQdRGaA0uGpSUEoyRU8WBKkyejplcMJRvLah8LkB6825mi4702MBtLtSN/
         V4+gE8brbJogW6qkcZcOujln/V0brSMVsCxAVXNx/qW8cQ2KU93ePEs7Elac+0E0ncoK
         SAzW+M0nwiYuR+M1GEuS0gQnjWrYScJ1PwTT9lfUaIzETeV9JkDOe3o+EeP01bgaWPKt
         lgC4TRE8yEOcSDFPHx1+/V4upee+v+KiI6FvxWjdWzcyaA2rbilgvs0ecJl6xoIiIKai
         HuIw==
X-Forwarded-Encrypted: i=1; AKwUvBxh24721N1P6m96l4ewuowSb2gWWYWscLoJkjqSSXsEN6iq17vxHL0Y5SNiNZ7QfVrFH+RnZq2SQIZy2KS/rA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI76b2iPzrWCy59YRRPte6TXQE8I9gtWh7DQ6K7R2xlZ5Ybtibd
	QDFb53l+GKhdjutXiNzcK7koGflFRvP/eXT+NakTk02ReRKtLRBxwwKT
X-Gm-Gg: AYBFou1GQaLLuXFpPhskn31UHm69gTcNz/+r2hoyN56GPZxQqixfpUpxJft5OP6a9nJ
	0tAH6BCQrjd+13XGN0oFzR42VVu/fvMxnznOXc+AuCo6W7NLkfLqcW/R52iWnKtcFh6w+nUPjwl
	XPZmPGvWpnuTOgxrKjRh3OViM7q2+Dd4qz1mnIwcflIXAQ2B46n/9dNuFmD+1c4bUHY0SkIjYcg
	GTW70Ga6y0b2J774egntWrIBlhSW4REsfTbinFBafymERJ6JLqmzruzxcLHwaRtZJCf0fKllJth
	Oxr5sv28J377yYWBr7Oi4U5/1OHVJEGdOLQ29ZK6fBIcm5WO5FzJAD3zTvSiZwsUeKchxU5Taeq
	D70kdnvTsljWfqR36QOV485/qeAqyJphW6xLQ+mxwgGBsu6ahUEU97hZQ5dfc+Yr+Ap/qtxnzto
	7oyGmcA4Dtiy3o61FWFEz7ZVqlZGqa5TpKz3dSkJzcB9x+LN54McH0tf11dmn6axT1aXy7Tfby6
	ur7N68LQgYNMG2qwRnZs65lqMYV+/P0CjDeZdkA8/Eo8oHbXNJSalmg3ZtGV+NXFXwuR+Rngg==
X-Received: by 2002:a17:902:dac4:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea9c7c46e7mr64891145ad.48.1793078791992;
        Mon, 26 Oct 2026 22:26:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:31 -0700 (PDT)
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
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 06/23] X.509: Move certificate length retrieval into new helper
Date: Tue, 27 Oct 2026 15:25:19 +1000
Message-ID: <20261027052536.1722081-7-alistair.francis@wdc.com>
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

From: Lukas Wunner <lukas@wunner.de>

The upcoming in-kernel SPDM library (Security Protocol and Data Model,
https://www.dmtf.org/dsp/DSP0274) needs to retrieve the length from
ASN.1 DER-encoded X.509 certificates.

Such code already exists in x509_load_certificate_list(), so move it
into a new helper for reuse by SPDM.

Export the helper so that SPDM can be tristate.  (Some upcoming users of
the SPDM libray may be modular, such as SCSI and ATA.)

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_loader.c | 38 +++++++++++++++++++---------
 include/keys/asymmetric-type.h       |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index 0d516c77cc26a..174451b93edad 100644
--- a/crypto/asymmetric_keys/x509_loader.c
+++ b/crypto/asymmetric_keys/x509_loader.c
@@ -4,28 +4,42 @@
 #include <linux/key.h>
 #include <keys/asymmetric-type.h>
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen)
+{
+	ssize_t plen;
+
+	/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
+	 * than 256 bytes in size.
+	 */
+	if (buflen < 4)
+		return -EINVAL;
+
+	if (p[0] != 0x30 ||
+	    p[1] != 0x82)
+		return -EINVAL;
+
+	plen = (p[2] << 8) | p[3];
+	plen += 4;
+	if (plen > buflen)
+		return -EINVAL;
+
+	return plen;
+}
+EXPORT_SYMBOL_GPL(x509_get_certificate_length);
+
 int x509_load_certificate_list(const u8 cert_list[],
 			       const unsigned long list_size,
 			       const struct key *keyring)
 {
 	key_ref_t key;
 	const u8 *p, *end;
-	size_t plen;
+	ssize_t plen;
 
 	p = cert_list;
 	end = p + list_size;
 	while (p < end) {
-		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
-		 * than 256 bytes in size.
-		 */
-		if (end - p < 4)
-			goto dodgy_cert;
-		if (p[0] != 0x30 ||
-		    p[1] != 0x82)
-			goto dodgy_cert;
-		plen = (p[2] << 8) | p[3];
-		plen += 4;
-		if (plen > end - p)
+		plen = x509_get_certificate_length(p, end - p);
+		if (plen < 0)
 			goto dodgy_cert;
 
 		key = key_create_or_update(make_key_ref(keyring, 1),
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 1b91c8f98688d..301efa952e263 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -84,6 +84,8 @@ extern struct key *find_asymmetric_key(struct key *keyring,
 				       const struct asymmetric_key_id *id_2,
 				       bool partial);
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen);
+
 int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
 			       const struct key *keyring);
 
-- 
2.56.0

