Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482C2DCF52
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 03:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210268; cv=none; b=DIlC4TG5ogh87hQ4MXrkQ2mOab3fFXRGKLmDnCYckRMYOzRdp1g7EYTw7gfz6dq+pkO4yjoyKfjEfk2yCSW1758z/2o3ouhBoqTaL4ioynGY7cF4nQlNoCrXTbV7k662+wBYcrgsfH7MOANafOtaJk/av+kTy1Jlj1rnjSyKHms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210268; c=relaxed/simple;
	bh=KQNEGxY9INaXySHb00KAS0/IBHXY6dy/wI2exWO1eig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DWstk7XkAW39fJimRvQ7s2Bv78GMn+JP1cElqX9Mcf4lolwi7iHRT7PGHMevpZRUMKL+R96r+DpOMh9rJxUWXBT6LIrblrzRxV7QzUIRenl9dN4H7k5CNXvi+e26vdzt5b5Bin6ghfx71M9kVdkNQdcyOkfPX7iWq4xWzi+YqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjAfJZju; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjAfJZju"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-365eecc5885so1443495a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 20:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778210266; x=1778815066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+exDoq3R7sORPn6CGzFv/4xCKwv+Zs0uPc325B74MH4=;
        b=JjAfJZjuCp3AqFLkx0KYP3+v+FYdh6/AMit6bMvm/eB7cVDO0hVqeiJ1NnJAJ7QpEo
         1Etlj16bnBEWTm7Ecw/sFz7hMRWybOVNKou22kDL8mkV/IpdJP0hpSE1pCSWxEo4rLGL
         B9a6YH3Ovw+qzTWcv/QpC9MzR3D/F6Et2wy/XlzamW+ARC4ls3JHJGDXkp8O6oIRvAwM
         /fx7GX/nInP1smdOC3RIP67O0kD0nWuvRynZKER8N3CJGFEoz/nrS2Qa5aYJVKbptQUb
         sQ3WG3gQmtCy3GO4AFKs4TMVFNFXISFWlapvDN6Zktdg9d28C39WBSPrEUMnf/jxr+R5
         Fovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778210266; x=1778815066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+exDoq3R7sORPn6CGzFv/4xCKwv+Zs0uPc325B74MH4=;
        b=BiL8YLBRCxKr/6u7THNRsSjze3o49OoV0Nv07SBcu7gch7rkvLU160Yxt9xxpqq4yX
         5s6A7FKbHXFjJdEmbbumvePKCvpDlgQcyVZqrIKYuBI+wd7gc0qWR2hgQWLDJ97pScV9
         2RwYtqT0k1O8q59gpadCYUif5vYsPNCUVX9hfkzS/2jne6Bd1JcrOTtShat/E7lsetHI
         2KOep9BZGddtKj+HFeELn+LcDLg3BofrvKMakvM+wil97hibpzvcPT2jfavWtUg3gyeu
         Bvj7n963B26mk5PxbXJIigbIP1LqsN8+FopKT2N4Zq1jGj6IL7rwDqQ99diz9cWc1VzH
         5ckQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lGwjVTxdf5azo+LNU/l8ue6gMDWafvuVie2a6eI4oFjm3qDOY8reyWs836DRP0BxTgLtGcerWjfUf8TmTPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEx/tIwJblVeGM8FcD/I1MlaPkSSkFmsZuO66jzrKhmOyeloN
	NfEsS6gez/+8BbiU8E5tyflthfRjqMC8JeJukm/7qbBYwSCZWZkE3wyP
X-Gm-Gg: Acq92OE7D4Q4voZlzRZVdiM+gVRKUaXeCNoJuUmU2T/cWiEmqGyL12ZHIUHgmuVkZRx
	rz7pgxL46oUUhdCP3Fa+4dOxe44bfra25NvRJjKnUNzjk0KZKuhRmei5djdBNROCBHSq8IuvKDI
	ExGn1Q9tfdXVkcj40dUEKjeBaqb9wPOmzSRcvjTq1fC1/B+4DLaI5Tk06DUeJaUTqgQY+SstLld
	LD2yTh/UPbqWdFhrzDa5hrpQabbVY+41JcWi+XCr45mSyKlE7X9Bh0cbi+ijbr8dHpStsuRfth1
	9khu03ToEL6qxtxXTIAjtyJwafZY4SY+ZxBGX12eZtLREPoYxjx+9qEy24a8ynYJwjb0R1kaK0O
	EyIhZyo88+v4Q0xgRKftQWOxUXEXg2qewz5eMcfiSt5OckfUrgFwLJ4zIuXtBieP915nZBVjU7E
	Gz+Dk81jN5rO0Ve8/681j8PWsvHy5TwXERFDvul+w8W6j84eG5NQ4=
X-Received: by 2002:a17:902:fb43:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2ba798d2797mr77415615ad.36.1778210266365;
        Thu, 07 May 2026 20:17:46 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm3220685ad.74.2026.05.07.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:17:45 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 03/18] X.509: Parse Subject Alternative Name in certificates
Date: Fri,  8 May 2026 13:16:55 +1000
Message-ID: <20260508031710.514574-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508031710.514574-1-alistair.francis@wdc.com>
References: <20260508031710.514574-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

The upcoming support for PCI device authentication with CMA-SPDM
(PCIe r6.1 sec 6.31) requires validating the Subject Alternative Name
in X.509 certificates.

Store a pointer to the Subject Alternative Name upon parsing for
consumption by CMA-SPDM.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index bfd10f0195e0..c3ec2846695a 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -596,6 +596,15 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectAltName) {
+		if (ctx->cert->raw_san)
+			return -EBADMSG;
+
+		ctx->cert->raw_san = v;
+		ctx->cert->raw_san_size = vlen;
+		return 0;
+	}
+
 	if (ctx->last_oid == OID_keyUsage) {
 		/*
 		 * Get hold of the keyUsage bit string
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
index 8b68e720693a..4e6a05a8c7a6 100644
--- a/include/keys/x509-parser.h
+++ b/include/keys/x509-parser.h
@@ -38,6 +38,8 @@ struct x509_certificate {
 	unsigned	raw_subject_size;
 	unsigned	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	const void	*raw_san;		/* Raw subjectAltName in ASN.1 */
+	unsigned	raw_san_size;
 	unsigned	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
-- 
2.52.0

