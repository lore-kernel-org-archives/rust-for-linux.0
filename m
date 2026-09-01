Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21538D3E6
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224677; cv=none; b=bWOaCKjHasVviTSxSdAovnM4TIEI0YOa9/ALZqlXvNlL5/DmL2qqfeSHGU8evz4ELZ+zs5QQVbI0dt3u5AqN4On/V2RtX+yX+g0empgHJwGfv+y8V6Oa/tWEdLTLmhODcdn+k7d61Xl57AoVjVQGyYxAKrWStWDlYaTO6pPmi5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224677; c=relaxed/simple;
	bh=CQFEUDdrBOr25kMcKMXOfOQ/OinpeF576SKItpXVsJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJIHEjoPFGWxlkf4CRQl98EKHGFJqNSTpx5p4z4LHkUJYqT4/AHEhUd+sBi/xfQjsDRMVNIlp5oheYs5UCn3gVygBDK3eg2QF4M+9pr5DRb28s/Ed8iQ8T317vLdD2ILe9Sinf2k1Xj9sUhfufQq+U90+HVTbOXyJKG5c95I+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsBDaC0/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsBDaC0/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3988952a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224675; x=1788829475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UyJ6OADjMeEJ9CwYlU3XCJzTi4L5CBgkg5gwk3kMxf4=;
        b=ZsBDaC0/+fQmyD8tSNma39eqdyThM8INc0UOACy2Uaxa6xkRXPoltbKVX9msgUyY4j
         HDRReL3Hu9mqFn0Lj7970n4SznkLZri3iVOHP9GPmteNf73PClvaBg61H2fabq4dyoOh
         cYPi10HRGV+j6vTQ7rWmH2UHTqmloTehgFJKpe6PB6tv8FJMQdvC77/IK/BCRxL2Sl2t
         3A/puScoxik8/IcLJKrXhZ9TikflCIgYwSe6qu73WcYbLMCspK75Ai4l2aiQkQz26Fvs
         6PDEbZjmMUOTG5oSZnWWwvYkyA535ABSgC0DEdMnaTdtOiMJ69mCj2T3m0CItNZdQnR5
         LT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224675; x=1788829475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyJ6OADjMeEJ9CwYlU3XCJzTi4L5CBgkg5gwk3kMxf4=;
        b=McXreR4X7bzyWXonduFt9Bgc/x6AAjun/4LzsVfecjPjNTXvjVDXpPhs4s8JrQ49uT
         XKTLOChgGduE1jp+if4Mxg+LjU+n/chaQGIAMW0WfQCTeJh6nK6ut+GezsDGHGjyGyuM
         /jeNci2Qpl9C3H1a9ObG0OnmB5H75m6VvUHWqV3pyusBYlOW3V/f7IiYyagWtDFkaFdZ
         Itoifm7MWQeGzKZIFXTRFUAUt1U15n0lyViHmWE9SmpEHdFdP+kMWHMq84K36DIE+6Nr
         a6uwcRa0AW5Lf8td852QOR1wXzQTjp1F4HtejsCOGAESvzhoWdKgpyox4NeBE5HRwsQt
         Q9tQ==
X-Forwarded-Encrypted: i=1; AKwUvBz25yTT4+bq56Mqgnoay9DLUzfzCtRNqhr6hW+IoEJOJIaikrIH21ZWzakkc8lQ4qzKw0ECVLhemKy16y+Kow==@vger.kernel.org
X-Gm-Message-State: AFuF++nOOrCOih+w+OWSPKg6EvsV4UwvpYHsPW3PkEfaonZWbEu15YZd
	ISmC9yD11wOi39ck9kY7WCUmCKdRszWnlf6oV7LmGxZq/Nf+fhms7EYw
X-Gm-Gg: AYBFou3UbIifIFhxg/FppCwoBDVH+O0mOiUSVOaz5IivWKX5F7v0f2NJhV9oVNqGNWr
	y2YMS9qer0KDe/5wVkWXH2h40yvso2qyWRXym34/VHlYrBVVh1h+o8z05Ovc3qDeIre5XXNMzn0
	zxuefsn95COQuy4xl268pi2fuyBFVQtWpc6J5v8/AVNAWYLTzR1LaWOgpLvhvDOIEIQJafsxWM0
	QSGcbpu+35xTqct6Ep34mlLLAqyG1WJ4vJTjMjMrTNTmIqFY1WS3o48wT4OIWn6YtGV6m53qaDi
	Barp/gQbz+QWG5aI6RjEG7joKp7ztTsTkuyQoWOjSg3dICvD+HEc8ITZR5P9Xe2BthFJ8lWWyvk
	lotq9MC/6Omw3WFb72bGeEfxqWZaandoF2vb5vyK8whHrAfGjHg7yVU5wCvImQ6mTmWgQlE6gjd
	z8RlqGuqd9c/+YsG6xynwCBU3EfKTBrU3SpAkAhVq5g5AzgKmOQYY9qpU6kHsGHWdgFeM42kLA0
	HYhxA==
X-Received: by 2002:a17:90b:54d0:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39907ab0ec5mr6643406a91.3.1788224675395;
        Mon, 31 Aug 2026 18:04:35 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:04:34 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 04/21] X.509: Make certificate parser public
Date: Tue,  1 Sep 2026 11:03:30 +1000
Message-ID: <20260901010347.2614656-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
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
2.55.0

