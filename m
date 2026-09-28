Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF93347500
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557939; cv=none; b=dziHpqSYv1FJqLJ7FZGUxjtj+RjXEGHvjcWFCEol1jCdaGaRjqmQ0xW98fGq5H2m9LZBYzBrlTAk+NdTMIAUyXy0AxKZwzSlZ3pR8eE1M1eqdqx3o4vvLTRer0x7l5hj5K0Ra7k3x88UVXWWXMr9xpv0c3hThYz2EPD6Kz6KeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557939; c=relaxed/simple;
	bh=0JGUpE4k1PmLAxdyW1CDm+kOaSuNwlxy5EWP/0iy7YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6j7dK0d5EmRcunS2+0uYwjICmjMopvR2aHmOO6431B/PDxdSB/b/VWtO8cP2pUgDoYRszvnuG5ot+HVBspLbt9EFNg06mu43hRWXxS/lPo/n43W51dkouZTrwqThCDR6omDHcEfGGDyE4/QNDGC6IfT/QzSkxtgHVS2VViNzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkOp6dF7; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkOp6dF7"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bd71827eso1325749a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557937; x=1791162737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIcsSTZcRttPSVFsvlIP8uLVExwGwURdPEd6Mb7+UkA=;
        b=CkOp6dF7bKujR2NLbnCjDt2tRvCu2JAPqR7XsVkRKsgj/Y6vx9+7fz9kS7g1ZwNckf
         CXq7EHdTw6hD/VLldSwzMMH4453lagngjaTgnju2YDB3lIymxxFoXawaRe9szEh4UBaW
         IvHg2tAtsdC3inEFQHNDk+MQP8Vcldey7IwQ13qT0ClpbLBT2rQjaM3hJGRfINxUkVck
         SEeQ4u3JI8R8HIM7i6o44ve9nT2kM4pjXMk6gE+H8vctzEancsAf9oHsGkl1azGEXs94
         JgkgH4pj66AgFcWoKHLVM7BrDdcDFySGxh5edchXfVQJO4CgVJO3LafM9ZF5ahdLrPB5
         Pxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557937; x=1791162737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIcsSTZcRttPSVFsvlIP8uLVExwGwURdPEd6Mb7+UkA=;
        b=orzXtVvNrKaVkD/s5puVVF8t3zYPG16c9fk/q0ieZ8o1PlmZF5c0TP1+UKccRS5VyT
         qwIomMHFz7yN23Klk/3/ScTX7I+L5WMlvdelfqWnkbN8jMdPWS7H/5qKTAjTFgIW2lbF
         I0kA4cIArCtDah8FdVxJQwM+0sPjfHOVtUZxuVEjM0PwExQT56GPRRkre2ypdcZ+gNOH
         g6R2TxJ4qqeNTQaXIuf8ZQsLVIAz54JrSqxosJJFgq2TQtB6gqmKZSu0d5sP3BB1kiXo
         G0Ze6gWNFarqohjIodm2O884lAO6dSP1qGILOp3HJOgGsPS4c631IQMvXM+YSNyoodAe
         fRYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQUibgI+HG7VsnhdwyV7YCG8vJORcrJizmu6O0hyZigBIrRqCe1KjQVHYYw8leki9WrvxflyVTmFTBAvi8Tw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI92PBqQKk/Sb5k56k2/nfTqXJDg/caw33fLNWG6ZHE9g9ucLer
	LyU6OpqCBmKJ+ATCP6fHtG6tZFyPRT+JuiZH1hOwFtIOIxWnnC9X8RCS
X-Gm-Gg: AYBFou3OwElwq//tm99ry6JNOXV4fTmRJ4RFib59pjTBYdl9cWquHEigP2xMHzZR8AW
	U57I1vYDIGTGE46G724jBCxPL34QazVhjihES77x0NG1G1HABXpaW0Er8AilFK9NGpuMTnufjkt
	0sKNNwOth2tcciexrlVsJrjcXxiMQOivYSsX8bhffXaqzvUzUEpuRcIevHmm0JMcy+wLZlVUnzR
	SZlnvF1oPOqNwwaSJ08cafPxy5GoImFx/nSsIrgqBzVM53itnwe8tDSC+1nJDUginzLzqSAmqGH
	TeIKmwBuEu2qbJmvupPOb0wCnbmMVeeNHGbDNisxgus27hgxlxXaK//yqFqFpmj2cd4TX1xqeuP
	/yKMWyTxefODfTjzzR0BLV0LA7KPpuR2iS/cZIgjVlrh7oN7BhP5wBagefK7TEhoYU6qHrR1mWp
	z1YdHMua6ZKyJS54Fmq1NvemcVgoQ3uWFDSi3Oba8IpfKBFZ4FeVatYd0GC4zXPutLryHS4WfcY
	Rv9B4wPzZfPrI7R
X-Received: by 2002:a17:90b:28c6:b0:3a0:f2cd:fa3b with SMTP id 98e67ed59e1d1-3a0f2cdfd7cmr2894386a91.46.1790557937216;
        Sun, 27 Sep 2026 18:12:17 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:16 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v4 06/22] X.509: Parse Subject Alternative Name in certificates
Date: Mon, 28 Sep 2026 11:11:07 +1000
Message-ID: <20260928011123.450800-7-alistair.francis@wdc.com>
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

