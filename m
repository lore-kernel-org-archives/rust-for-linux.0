Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CB33DEF2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190494; cv=none; b=s+nDqE7X7bcgK2RytLUVF+pUFpXX9eYlCngxVpDUCgwhS51E22q0/GCqkt1D8EG6nyz1+zkwohhMWcoplN7Fu5HGYK+BkruQIWDbfzUxvRC0x48oqr4mqMpkWlfoFGtMq+NdxohixJVd6TqHhMFgFdq9dZoOuZKJmTXPzGBs6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190494; c=relaxed/simple;
	bh=OLXs3Fufa2MbacrwYlnD48/27+yJ2MkbIQw8G8Ag99o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPNayQEdjdC8LCHKWAgV+tztTxOPwfymwlO6mfcKFzRSWBzBzczwJQJDhxW5BbAjWjvM3X2be4s+ctwm+I3lClvsPmuUWVc/8iK3JZw1vV5FGZ34CKhP1MCF1HqbYQyajyuY/VxiSzw/WxMvo9e8jGfFcSrEnyB9vPr8rogkDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoLT+sMA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoLT+sMA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so4495398a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 21:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782190491; x=1782795291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em+GgXcAR5Bq6k8M2WoqxbNFVjEAu9j/BAUf/d9vc7M=;
        b=ZoLT+sMAGM5SxmQCiOKTrfXio6huyA6o0wFzSy6NShs7kDPXjhqcugB2VAdNs7F3s3
         rOAioX6Y0d5V7g3PWU7CW66OiXUg5n9kFZTOn8WjS+AjhiwjGUh7nQ5b3Gn+2A6D5Bji
         uAj/BSuotuDlEUJWj/j+Ury8ORf92Gm6IkqHBfAXC5bndwMZ4lnv+tojQOP9BPXFV+Mz
         kESnZwKRBm7NFp4f7itq/E0QUMuclSq05a6WuGBCCachvRwsYbgP8EGXMWcJ+d5aqnsm
         CPJScm7dMD11k38EChBJTJXjam2+fTerFfkxG5YKCbzokarn0PJmhh4M7BL4w+Em2m8k
         POXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782190491; x=1782795291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=em+GgXcAR5Bq6k8M2WoqxbNFVjEAu9j/BAUf/d9vc7M=;
        b=ccYV2BYGd2loNev/+WDRFGULXSDJnTc/J/hNOgup2gmVE+gkLK+1tfs1vzaWWOgrCs
         FWOoevi8lduVcpeLOkZpgewgKJ3TEkRxuiZYunRdS0xjHXpPyQpUhodDin9toxERLSCt
         QncRtUOW12jtDWyXQGOY1lBmNc8m3IYT+KDlgFjFRsO6njJfZWSN5byQG/eVwXCfxAVc
         ODNE+cLY+3nL+1lRJ/7ppBngBIPTMK1v9cosL92aiq3x4gKKGJcW49DOBEMB6p8b8VLp
         H35TyhZnMy2dmUxT3XfB6QocUnoZFqm0pRqNIpm+6cDaDaoAOV0V2lWh6+LrbvFYtAz5
         mNaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3OeQ4t1Eqeww0jE6d+gdQdZm1/Srtz9JgvnQenrB77xzpqfjn5tK+5PdfdW/cE7sZcJRPBrqffOKh3+G9Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTTL9Yda3Saf/QPHz3SqZhnsbSpHIoIUpSkAo4s8QNGvsgWzW
	t84RNmRm4uZ7yrINk+CSWl9+t3ZJM1vnhoSPK84Sk59gSsOKIjr/KNdAIOnvhg==
X-Gm-Gg: AfdE7clRpHiD1II4X5JT7w+GY9TFi8OW7ce9ifn5w2deG1eyErJM2zReJT+IM4G7f6A
	9hetnkOp6GHO6YLJFo1U9k11NqOC1kXGnV5j8aXzAwXJAWeuz5D6IeXtjk68OyyWZewKHga3oIt
	gpKePSjRj+x9hNYVFt6bniu3azJDXSSy+EfroZu5JQMAeWyHjQQSNTaHvhh9Taz721jmjb+j5zq
	jUrxGWEHlwHkDC4IwmwkiMs4NP6rNdPc0Xs6cKmodKB0n8MkSS1XoQhMWfPmkyXaYBXl5+Y08cy
	EjAq9/NCcZjZZG3INgadX7+skUUVoiUfBOWT1VZZ/QbzRE2fdRbh8c4BTUK61iF1Npo3JDcdie/
	URZwmb5KQOBZkvdNTtfZlApOK2Wxb/MEzNlCsQ+h1zjtcZmRjK2HrTcv2omx93eOhnNK4YP0ZhX
	5a5CeQaezfYqnBgadNZRrzdAKI7B6CoQ==
X-Received: by 2002:a17:902:ce02:b0:2c6:a97e:1c24 with SMTP id d9443c01a7336-2c7c758b9bemr14124315ad.7.1782190491545;
        Mon, 22 Jun 2026 21:54:51 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cf0sm89734785ad.50.2026.06.22.21.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:54:50 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com
Cc: alistair23@gmail.com,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	tmgross@umich.edu,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 04/21] X.509: Make certificate parser public
Date: Tue, 23 Jun 2026 14:53:49 +1000
Message-ID: <20260623045406.2589547-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623045406.2589547-1-alistair.francis@wdc.com>
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
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

High-level functions for X.509 parsing such as key_create_or_update()
throw away the internal, low-level struct x509_certificate after
extracting the struct public_key and public_key_signature from it.
The Subject Alternative Name is thus inaccessible when using those
functions.

Afford CMA-SPDM access to the Subject Alternative Name by making struct
x509_certificate public, together with the functions for parsing an
X.509 certificate into such a struct and freeing such a struct.

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 crypto/asymmetric_keys/x509_parser.h | 42 +--------------------
 include/keys/x509-parser.h           | 55 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 41 deletions(-)
 create mode 100644 include/keys/x509-parser.h

diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index b7aeebdddb36..39f1521b773d 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,51 +5,11 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
-#include <linux/cleanup.h>
-#include <linux/time.h>
-#include <crypto/public_key.h>
-#include <keys/asymmetric-type.h>
-#include <crypto/sha2.h>
-
-struct x509_certificate {
-	struct x509_certificate *next;
-	struct x509_certificate *signer;	/* Certificate that signed this one */
-	struct public_key *pub;			/* Public key details */
-	struct public_key_signature *sig;	/* Signature parameters */
-	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
-	char		*issuer;		/* Name of certificate issuer */
-	char		*subject;		/* Name of certificate subject */
-	struct asymmetric_key_id *id;		/* Issuer + Serial number */
-	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
-	time64_t	valid_from;
-	time64_t	valid_to;
-	const void	*tbs;			/* Signed data */
-	unsigned	tbs_size;		/* Size of signed data */
-	unsigned	raw_sig_size;		/* Size of signature */
-	const void	*raw_sig;		/* Signature data */
-	const void	*raw_serial;		/* Raw serial number in ASN.1 */
-	unsigned	raw_serial_size;
-	unsigned	raw_issuer_size;
-	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
-	const void	*raw_subject;		/* Raw subject name in ASN.1 */
-	unsigned	raw_subject_size;
-	unsigned	raw_skid_size;
-	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
-	unsigned	index;
-	bool		seen;			/* Infinite recursion prevention */
-	bool		verified;
-	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
-	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
-	bool		blacklisted;
-};
+#include <keys/x509-parser.h>
 
 /*
  * x509_cert_parser.c
  */
-extern void x509_free_certificate(struct x509_certificate *cert);
-DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
-	    if (!IS_ERR(_T)) x509_free_certificate(_T))
-extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
 extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
 			    unsigned char tag,
 			    const unsigned char *value, size_t vlen);
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
new file mode 100644
index 000000000000..8b68e720693a
--- /dev/null
+++ b/include/keys/x509-parser.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* X.509 certificate parser
+ *
+ * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#ifndef _KEYS_X509_PARSER_H
+#define _KEYS_X509_PARSER_H
+
+#include <linux/cleanup.h>
+#include <linux/time.h>
+#include <crypto/public_key.h>
+#include <keys/asymmetric-type.h>
+#include <crypto/sha2.h>
+
+struct x509_certificate {
+	struct x509_certificate *next;
+	struct x509_certificate *signer;	/* Certificate that signed this one */
+	struct public_key *pub;			/* Public key details */
+	struct public_key_signature *sig;	/* Signature parameters */
+	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
+	char		*issuer;		/* Name of certificate issuer */
+	char		*subject;		/* Name of certificate subject */
+	struct asymmetric_key_id *id;		/* Issuer + Serial number */
+	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
+	time64_t	valid_from;
+	time64_t	valid_to;
+	const void	*tbs;			/* Signed data */
+	unsigned	tbs_size;		/* Size of signed data */
+	unsigned	raw_sig_size;		/* Size of signature */
+	const void	*raw_sig;		/* Signature data */
+	const void	*raw_serial;		/* Raw serial number in ASN.1 */
+	unsigned	raw_serial_size;
+	unsigned	raw_issuer_size;
+	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
+	const void	*raw_subject;		/* Raw subject name in ASN.1 */
+	unsigned	raw_subject_size;
+	unsigned	raw_skid_size;
+	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	unsigned	index;
+	bool		seen;			/* Infinite recursion prevention */
+	bool		verified;
+	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
+	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
+	bool		blacklisted;
+};
+
+struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
+void x509_free_certificate(struct x509_certificate *cert);
+
+DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
+	    if (!IS_ERR(_T)) x509_free_certificate(_T))
+
+#endif /* _KEYS_X509_PARSER_H */
-- 
2.54.0

