Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFD347500
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557932; cv=none; b=gt+n9CKaYl0IwRhvxP6xMJmq8UAGLIaNkyW58u/lCSrCjDw3uty3tbGyDa91Vk/30lt8iF3N8z90d6F8O1VviLtdrzxKrNdEjTBL3+rEsPJi5w1i1KCpWVPxu8r+IuZ9VnAXTzn1RoEJAO6Tph+EoDi8mUJJalA71ROlp89LJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557932; c=relaxed/simple;
	bh=CQFEUDdrBOr25kMcKMXOfOQ/OinpeF576SKItpXVsJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T39fgXSS2ky6+GBW1S8HSg2Hl7k49ZPtFltniRW4cU0ntskthZGOHYDkRDZiHR6uxwzkH4HIz0Ssj+xkVQbmpirqBhHmzo+igaEGfPt/kTT57cmDOG+sf6a+NmdIr8n1IdA/Lprb5IM3QTCnRk6pubFEJ4ukHVnzKpwzB5BBbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QimQiaZO; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QimQiaZO"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so1442100a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557930; x=1791162730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UyJ6OADjMeEJ9CwYlU3XCJzTi4L5CBgkg5gwk3kMxf4=;
        b=QimQiaZOLLaJvOSEn3LNuv8IPgkQgPPdNch5Wf+hnKaGb1nbWxJka6Yg4GMlFQNBAM
         3fveiI2zD6VxWCsDJ78X8bIvsd0IFE/SJ859WHHsDEXMzw2MnTHuf7uSTv68Ac0RAgvt
         k9g02DnXaC7zyGJ6PH4wJz5aWDmtqutvV78wtodj+W7WfN9qmNCEbBwJE0UqkFDanzM7
         cmmWP55W9Jfjas/QuiMCB73XhAay5+0VuxyHhO7zShSqVTYCNzZYGwc+aSUewRAItJ30
         M/G3mVaPYjvU5MiSxtMXfLTbBGLgnvb+iYFtRJUdK4+Soci1xskTbhCcnmGwoqhF54VI
         MWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557930; x=1791162730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyJ6OADjMeEJ9CwYlU3XCJzTi4L5CBgkg5gwk3kMxf4=;
        b=VolLHxTZl7PlRBx7Tj6+8P3NLEZOGBMV7kt/UVeHVrdk77wDJ249KnK9SRVIY7Ub7U
         sMCD7I3SkgWf5eMwhusL+krEPlt/dXWGDBhnm0xKz0ijT27LSEWRfKMB4kR/9eeXNYWk
         uRiJ1dHTbeitlwcsdA5n4yQS1V+SL6lDB8wob4QjuIKZk4jUvDRNwwIGRrXvrLo7sbrL
         ZIdykRIZPrjKHPyHd+bAQoAD9tJxo7eLrlItLNOrUKO9OmfnVXkH7zAWVxiEwfW0r21Z
         TgqSIh/Jz2tj1aGdUBGIEnAxKdJ6kcF7KB5ZBrMsGhgj4MHeGLSqi6r5Cg/7mH5Z+9DW
         j+eg==
X-Forwarded-Encrypted: i=1; AKwUvBzGY7NAFNOKBZO3h8thH7M42Th+to5aw6eDxWDA2bCRVLSlnYgmNPx2hvaksbLe4BpAgIR3hBcnsahvz21WJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4qqd9c1EwmcmIkSiY2x1QKnjwmulpu56kNUo0AS8lGaW3vzFC
	F0kNUrxhH/nUnvQNrvctRrLYZClAtqLI24gwBgyQNoEUE1BSUGUimJAl
X-Gm-Gg: AYBFou35Om1EAn0sr9HlNVyjdLeCPNWqhVk89U4iKT4n6XZ8AFeBZM+mgNc7AzsA0oJ
	TUD6YKSt2bsGDztOrXF3zvddyQH96WYBQKN7Y6PAOFw8y+dTSDsbuqB/rCqPkvmaFXgZRZ3ENBk
	o9YcH+ftS0enXfL5c/rUZnWs1iAAqesSrvn0P89fn0oLJcKTBtOSQqGnI8g3DSb2ipKfENk2gXK
	fFuDmv4gt3zPfs1pEHUXQ9hBKYtmKpRdhVgj8P2ZuP7qfEs/ikJ/7yCQj2bX+qSbu8RMQJLS0QG
	AGckkLEcMkcOadmYF8kdaAT1BVyCXXeTRB+4j74OUAGU8ltUqp+kjX77zSGI30B1Jqw8K4vNKwG
	0AVsQlD0A8X6mni5WsfivY1RMD8f7VWEQYecuvl4LjcsdQI1lwWmTcFdmw5pdWXViLdI+bONZ21
	h0qII5eijBg9n7wwSotaYrFFhXR8FAr5o3PouoOacfEzJ2e6l0w9YeDBqCT+cYr2a2VFxyXUfpE
	Wx2rBC9xaAvpWpudw==
X-Received: by 2002:a17:90b:3901:b0:3a0:80d1:28c7 with SMTP id 98e67ed59e1d1-3a098d508f7mr9517350a91.62.1790557929769;
        Sun, 27 Sep 2026 18:12:09 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:09 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 05/22] X.509: Make certificate parser public
Date: Mon, 28 Sep 2026 11:11:06 +1000
Message-ID: <20260928011123.450800-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
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

