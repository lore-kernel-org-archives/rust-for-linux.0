Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284378;
	b=NrG9ltPekBQxMS2Vco4rDfDPLGXSXfuW3bR6xCFdDu3jwe9Ni/mSOb8uYOrVNtm7Rpqj
	 7VBoeAt36lcG69tTwbwYF6urUxj/jvp/C6p11RjJlGeOWYz3LI8rq7YmMjjMvSOHDw1i0
	 mEM2WMm9+vXSkfhvVMB4SZrum3oF14xaCcwtf/j9Q+uynZD677lG4coUd7upoLRtMpG68
	 9xzPimOWA+VnkmoI2NmYEyKw8+UXCsiDnZkyvqpUdwVrOLgYWSDhaylf5oeFNWLdDQFqi
	 s8mC9ri2IzBnyszJWKZ+REkP02S6tltUnCjoVdkTy62e3aCKzQEbFvo2UkXgOhn+PuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
	b=GcW+HMjz2zCDNAJ/WboAJUcTbOztIqvvP1Gz1zq9VCcF2wTvx3/uBQq73kSH60L2s4uv
	 Z1VA/rc/5cBX+VXC8LkiAw395YiJwBYYW64Et0r6Uqg3AfMpAeu/ajsZBpSyX/iEY4LWW
	 i6CO1wKrVWgPXkc4+M9yKQV1QIb1IBw6Lj+gn7IfebAoKP/GbtatCrejZemN3+wMyhys9
	 q0H2HvcRMGZzpdGbXz7vyiYesde0JwaO3QKUN3coQ5mN5CkG/0l8Nuc1VYZ0bpb5WgB1u
	 7XJzd9Kk0YnIjRYZtt78MFJo4BAAr/sY0/ZlyzgNv8PF89jE36i5vQzHKbQsHnw6wKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYW6ru18;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A3606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73A3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYW6ru18
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438d9363fbso947075c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284377; x=1794889177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=BYW6ru18H3XBx3AsTpAR8Xqn7UK+BaL7xpqsLxLhqN2QvvOiWbVZxKkyqDcuQPdzVW
         2+gpsIN6qgJie5m6wTOQRhX+fUPxLjgcxBll/ZY5p5UUbL0d50ye8w6dG9XoY+qrh79S
         vVkCKtAvNEplr6QFFbhPl5rlOHja0HaBtUjHnvmCGW4fMecoJaMuo0sRvS36ezUY3TJn
         rpl5lcuLVLu+51qXKbkEETsCX/Rp45x3aXYPZ5W9ze4MZOYCpD/pPMmfcTFNTa4MM7O4
         pVBCqfOAZdqwjRZmG0VMJWPLnctGlbgb+BcQqD5NJ7ofHiuG6bpYKdyv2tR/xhNzr2NN
         taMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284377; x=1794889177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=FNM+43PP1pg+0ke1/saBGJFgq9Ia/C89DWqMGqJv/WBi5OBcT0zXsR1H4UM3fZxwOp
         TWIojY3h6BVKSIW7cqy4IaRkg9HdpM2OC7yQPu9wkiuQqJvLp36cdVIVuTom53EYFDV1
         xycBO1zxoEYr/aHdY67mETvrvrnTHNWjRZdy8azB/pgLIiEcp/DZEtOFq3aNwGOZ+G7B
         6Qo4RoT8KQjOXsKwvYzkaFMaXyaxY07ComrH8Xf5MUZMSeZYfVRP1cz1uwcfHg7AFQpF
         lCGo4Ey4SHjIPYQIuhJfIHFFQ88tt/mTibyA336RuWYp1xgUUx0nCCvy7ioXDflWm/Ui
         +wag==
X-Forwarded-Encrypted: i=1; AL+hErG61dhXu2CzwK8yWvFL0623ciaefphNy/405wziGY1Uio6PvjmTaueDzeMzTE7oXMM9+M25cirve9IWkrXKug==@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUq9BM1FJYzoR3NTTYcasfiGPbhqyQe1lWX2Q4OZeUer2MaUa
	hKAoYlTJCEKIwTNSQyORwFTBbEUB2g2dNCLFK42FRhggkhvkPHOPaXGs
X-Gm-Gg: AYBFou3ID+sdGeZjtKcTG1w3Qkzy4/QZiVrjjLvbYqUhwHl1IcQybWAnCzsWZq/24uC
	Ub57BFOVlVkTDl/2LRrGBIJqJFo73mYhvAQ3u//UBInGzwJkyL4tyxpYplj+Cwwy9RUzdTEKzVx
	ySNPiXLtvuDRI/+CdAB49c8iOSpuJ1XOcMzM7p79CR85YPDXOK/RzCVRsM7ZWaEJw5hEzAft5iU
	uIJ+XqnpauF/3a40+CQfdoQuVTMZcAs1j8QuZWco6u+VWygtjKVIYojq9Su+gSmHpkJZYHvBUf5
	W89QDf87J8lbe2a+gNJX6IFrIYK6hLS/e1qaoCKpV8TxE8W77UrI7Vtj+V5X+f9YYSVc3MtuDs/
	7YjrfubZHv8ANACHRD9ead2F5LTUyUBe3EmFJrHsz5PnjqrTVYJ5gLlZZOvFZYvAT8LbSlN+mDo
	uQzXgponCvEfERENZLgEMQTT2vw9lBKTb6wUDZ7XmzTm9MuuAvNvwUSvbf91WACptk9zktpAASa
	FOqV4fuVtEaSCFQvSDhlua33Xb2iUCKLaYZYpuY7cyCjIZBanJNd7asL2C0+bWBo21lAIw5VXyR
	zWw/6jyj2iOH5tfKZpFp+EwT1nvtpbf3+piPfw6sIhvSjjo=
X-Received: by 2002:a05:701b:4502:10b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1b3b5e25dbcmr1978641c88.11.1794284376568;
        Mon, 09 Nov 2026 20:19:36 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:35 -0800 (PST)
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
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 06/25] X.509: Move certificate length retrieval into new helper
Date: Tue, 10 Nov 2026 14:18:13 +1000
Message-ID: <20261110041832.1730924-7-alistair.francis@wdc.com>
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

From: Lukas Wunner <lukas@wunner.de>

The upcoming in-kernel SPDM library (Security Protocol and Data Model,
https://www.dmtf.org/dsp/DSP0274) needs to retrieve the length from
ASN.1 DER-encoded X.509 certificates.

Such code already exists in x509_load_certificate_list(), so move it
into a new helper for reuse by SPDM.

Export the helper so that SPDM can be tristate.  (Some upcoming users of
the SPDM library may be modular, such as SCSI and ATA.)

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

