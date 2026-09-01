Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA338D40F
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224687; cv=none; b=qBMk+HhUa62izYR+tec1Zi+2dl3SRPGbYQvhqAgLvpZYre0RBKy0WtOhb2ARp+Z5F+MyOSOrD0QqQswgHhUEjoEzQIaeybKJrP/zJ1MCBG9VD0/MaUUUhO6xQVeHmT6jdkIiATiBqg3fcqtF/rTeLbTTgFneM6F2xSH9s6ttiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224687; c=relaxed/simple;
	bh=0JGUpE4k1PmLAxdyW1CDm+kOaSuNwlxy5EWP/0iy7YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjh43FNHyHp/C1Hw49b85mY2WDtV0YIvwAIZF/V+yqxYnUHP3uWVAdRGjG0OG/s1WliniU26sO1GuEtG+SxGMpY17AKdoBEcFeEvYO7rG64oCaDhNOjMicXZh5fUzRx5Yx5/jlAjpIxXUPEDawNGsbtzt6o0jdfGr/xLI3cXozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH/KDUO1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH/KDUO1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso271906a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224685; x=1788829485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIcsSTZcRttPSVFsvlIP8uLVExwGwURdPEd6Mb7+UkA=;
        b=ZH/KDUO1OJqNyRRHjzC3y73qmUoR1g2KaffL5ytGdfTG1zYhN6QbNTJaivUMq/fIPM
         dV3KeYx2AzQ8DSmt+WOy0VzUMTv4VLQz6PqN9S74fROy6FYg0oIOyLA+YzYVASRKWjAZ
         LHuFbnYDNVf0tHJfIwTp/Ro0c8LQMXo6p2wojDvEx0nniofuD3TXYO48CgwHbhR62VJq
         QJoKoDckeLshKSmuD9hXLcKfCh3fguWu/h6v+vU2qSAVHxRYC1x7JP7z0i0vipxcWCf5
         Wfp0Df0fnEekfKgCIGZN8VNGMW3pwLXfNnPMvllz/NlGymilnXXl2QCyJPvC9IVpzSCb
         HMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224685; x=1788829485;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIcsSTZcRttPSVFsvlIP8uLVExwGwURdPEd6Mb7+UkA=;
        b=JYIIxSeNui+2MZCEMPqIYNiEWjAmsjSlqun6J2hDVNMgzYW//srPh25wTV22RyTvRw
         0pL8ECAmpOae5wr/wXsKgKGh7fGoKNMIoxdvGvfe7hvzPu93GlkqA9kiDkkl+Qzto+4s
         JETd+eotlaxPpSTqlpYoL4CCHwZgFq4oGy+TTMtsFtXRbd9nzBkuOuAgu6g/ZmvOkzet
         kin1rsITApsZ4aIJpZJBKs9ckouACHXgOnGWEZeXfQPmBi9QzyBLggARJi0E0rjEwaxc
         vVTCrYYrar1a/ItlQWLEX+sAfhl+zX3V0+mqmC1AjKkfwjuUVE4VytOStor94WEtIGT6
         8a8A==
X-Forwarded-Encrypted: i=1; AKwUvByj+6i+1GP8NuM5UakKL2Pta7bAkQcL5Hg1ugCEcFOVq/O8kS6aVOMarzTUu5enork8t3RDOjTZQd1sxLiqmg==@vger.kernel.org
X-Gm-Message-State: AFuF++lTyZu4alN6tf5v2Bboluq8rGrrRDFfBb2xDlXKTvUj06LrHRvl
	czozTUtlxI0H4z8P8mAHTOoVfY1u1ioz6K5GGgVO9LBVTwCCGCB/d8z5
X-Gm-Gg: AYBFou2K/zEhnABIC0ynhn6U1P+K7ojd3ZaXMaOqPZUQdF2o/fAS0l8SS+2+C2+6nss
	tBGgKtkYIeysI2B+X9CjG2ZwREdvBVIX6c7EY8aTgV9trIQpxsGUCuuZ1c2QfLa4e724FIKEDur
	n6hIswDadOFOIsyzOC5ZvPvupKkkCAywQF8nYbQ90G+Z5VqPtkf7tBWZKZzRYeBvDUQiqI8P9X5
	lEtMoX7nnRVATZASBDrLYT10lg6Ezhy2UOmPDBbkCPf5g3e8rbAJEqo0BVK1N/A2klMOTuvNHhR
	SQs6CUoIHeypuCpQD9dgpPbWYeJr69DY4JvvXiYsOqlyx5EygrSnY2lFI/TjJ2blWxdfRLqpm1X
	dg29ws4tLz1E8rwWcKn0Hmuna2dVr0v+pfeID1eGDAcn3KHFt3Meo4bBDX8dpd8xIWJPpFk504g
	QUuHhoAkB9tuzN9MIu0T0WuD2rAncSdRMeIvj0i7yAeL6futlQqquG3Lq5NYhDTuVgu3RABjb0P
	CDSiA==
X-Received: by 2002:a17:90b:4a81:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-3991f8bd96bmr528414a91.5.1788224684691;
        Mon, 31 Aug 2026 18:04:44 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:04:44 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v3 05/21] X.509: Parse Subject Alternative Name in certificates
Date: Tue,  1 Sep 2026 11:03:31 +1000
Message-ID: <20260901010347.2614656-6-alistair.francis@wdc.com>
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
2.55.0

