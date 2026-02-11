Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29377344040
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780617; cv=none; b=MORFLSsU6Tkbb35C5XU/ONO6SV+2T93WMxsHPjJpkD6indH8QGiylT2epyO6IQVkIEikTtULAJlsnHWZdnRJlYcqeN0Eupoh2+c8EzmRcO7srQN2L6TTyshM3tyZYTbsmewGlDvmmk4aiV0rE+L67//suPITxMZgfC96dylUFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780617; c=relaxed/simple;
	bh=ywX2QQkJINgcF5rI6352/2UoVw6y6LLcc5xcEUpnPLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rl+a3D+IR52IsrxRZsk3+3oQB8hBqbCvzroLk5DJOomQbkFPhZgbJsZDXrk7lIPuqe8g/LEX8uB4J0zkLeZ8CArl6U+lUm/KljczaTJcd4uci9zIqNFGLB6xK1ynzeKHpucTwuzn4uc/tb1TJRFJjxJLvpXcpjrah1a6GWgDJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgBBR4jU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgBBR4jU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso582751a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780615; x=1771385415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pamfLAjX62QtHOtvvGRA+RHxyD1vV0e3dMD4KWIMlE=;
        b=lgBBR4jUmLdS/ZJqcJEbs3xwcm2d3xrOv86huUcb+L6/yMG7cKGeV6PIfLNEUbYnay
         piwLgQCJuVyexOn0lJS2+ZLbFIYEViTN1sYiIg0DbQJoJbzm+bnw6itwtTFK6tZj9FJB
         NCebZvynBcnZ3RSrh1xBJrUAWqaPuNGZCeOZOjiceiYv6aVm7B7iMuT1KGmOXnQsysUc
         UHooQ841IS2IqLBAGIy+wBYMl5I+HrRuDLF7uy0pPhjbqxMx8oGjwtUtwGjW2TQTIu7P
         ywGKm87Q1eI3IbkWj6SkQtKFtqzP2eUrdU9Z4IEf9bCzAeiMaeBFDTPRG8X1eOBNnhPp
         fkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780615; x=1771385415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0pamfLAjX62QtHOtvvGRA+RHxyD1vV0e3dMD4KWIMlE=;
        b=eBkNs+nahicr2qiEHt7O4axl5lzCgLpiFUoEtu2I7mlqxaPP4X1QglHFhHQtvuI/Sa
         7L1jq5SJj4gn7NFP21PjSaYkEKtI2mtYBpQWzT6L0TaLxG5LzdchtH3C8NObT1GAFaMH
         17hUPwVONGJTZ5oYmhhozzmXvSIoaPEk4O4YZcXZhlGxcj7xbtNOpf4At7KK4hrbPK0M
         eKeFPtJFnrjFLeiKT/JC2uNJkdEBCEJcbqYEFZVnYQ7kBUaOZw4vjY+2mwIsEa1gSHZX
         NB+RYxNb4XyTmIPHPtef56KJzThhw0ArdxL5erglDbfUyP5LcR77rZ22riov3rehB7BT
         2YHg==
X-Forwarded-Encrypted: i=1; AJvYcCUX43xl51k0Ul3G35E2PnE0EECUd8nwHoa5jBluhyG86EiEr4cMvrA2GdCsvQ8J+RoWRjktJtZrTycsTkRe3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyzw5Nghcepg3rJ2CHflFcvXTAeBmPU00xrJ8TNFG/5uKO75o
	9SYGqWQfRTnfTNeFXQ9OGBeNDrglTmV6wM+/D+b4vbn0F0BbNCumkEun
X-Gm-Gg: AZuq6aLCpX8c+JMY3lbFsxtRu5RNUWHrUrDOoSw/gUKiofyggVxtn09/YqpDI6EYDd7
	H1sQs06XVFCDQ4en0pJ1sQuGNjxGm5TG+HyIRU0fs4KiGSm57p03/NgE9mvFe0ORkllOGsUlkQV
	fQ7KRppZndR6WZfcOcg3GkPNlYAgqogqGvqDPAVE3igXRlpUuu1ysQjgW0mHEJfEAeeK/0MihJE
	kNajZOQxGs0KM2mp0dXth+MM262b4EHoQQQArAN1CE3hXZhKpV98+u0JkE07fuEiBUXZqh6zLhb
	hvUdHuhbL6wyNYqkLMDxCSgf2A+Uc89wLTUJ+yX0JCC099abfmQj7cpEn+c2AMOZH0T49UjkYFY
	aRxgDcQAdaaJSoEwySpyO1+rgpYdO8gwKpDEqXhtM5QuLFq5h2gYjQNp52F20T2X0RNtGyrspok
	gVm+4+prpRvvQbJ4WaR3krfbhXvt1Q1jaFZ7yLGqwhww==
X-Received: by 2002:a05:6a21:6016:b0:366:14af:9bd8 with SMTP id adf61e73a8af0-393ad3ec860mr17499551637.78.1770780615453;
        Tue, 10 Feb 2026 19:30:15 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:30:15 -0800 (PST)
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
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC v3 04/27] X.509: Move certificate length retrieval into new helper
Date: Wed, 11 Feb 2026 13:29:11 +1000
Message-ID: <20260211032935.2705841-5-alistair.francis@wdc.com>
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
---
 crypto/asymmetric_keys/x509_loader.c | 38 +++++++++++++++++++---------
 include/keys/asymmetric-type.h       |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index a41741326998..25ff027fad1d 100644
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
+	if (p[0] != 0x30 &&
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
-		if (p[0] != 0x30 &&
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
index 1b91c8f98688..301efa952e26 100644
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
2.52.0

