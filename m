Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078785;
	b=JTTkENp9H3smdsYt7UYS2XqeMyeA1py5q51aFlsunIt5Af4rQ6NGqAqV0cK3xDppvBDa
	 PpaVk2B5vVv/GyPm7uoE4VXKAE6l3a2jEfj50Y6GPrgWPr/9Z4Zwb8M/8P8FfePn4FazG
	 snV+K1O+V1VcodPx7MJD5z7/wG7EES6A8sVgEJUWBfi4XSX4Z6M9wkHJfBlS9Rabdt+SL
	 kg6kQz1cykH3pSvOkubmSdfZ54sQttRBJfiaxng5Xf/cFnAEQLPAoUuPgZuHdJzvX76gk
	 L+91yDukmSwAePA8YqDJF82SvRM5BCAHWPvUxw0arRUCXMvzXC29NO8Kmryxw4Gu1gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
	b=ABCVEEENA5Qmyng6apEc25Qiq2eHzPJkaB23/6p64mj8w1ipb5hSaaPvh7z6toxxqdAi
	 oLHEm+MLIQcWi88fbc+HJnK9Yexw+Wtd6+KDb2D/O63ZqqAi2XGpjG1NnfxhHvvgUcLeO
	 58Stz+IPEg1NjHDnFAI3kLznIHk+A2Y8RXJAoedeBIU74ouShWtvRcuW/4xzTCRqDveR+
	 wdNzpFP0dE+Uyh+ME7ir6j4gqHfrmksdmKsy1PryGLyGnTp+GzbnOS0mZSU+ZdkvL8V1r
	 Z5cFIL0sa72OPCb7fzjuG12IkUqSzFN7b1hruE0W3g1Vrutn/H/yH9Kg51EDUqowkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppBUU5Jt;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D991606A31D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D991606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppBUU5Jt
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4312765ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078784; x=1793683584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=ppBUU5JtRQffnmvz2rPfVCMM0am1iKNTT99vWsxtfGruBwur7u+9uMc877XNtqKgWx
         nIVOk9/LHIxR2M6QwA5WZvMpE75bn2BdBs19T+/oTV8He95F8ZGDE0Blcw5sWb/8pZC/
         c8ujYPR/A99kQKfnnuCMEUueJWGXuEmq+WzbTUqJzCrVRNDPORf8hL6d9SAx5WS++S4m
         GdnHr557QDvgp4i5dRMmTe2xa5zvSPTz24vrxafPuEG5UHK1fTBQwqOgKYqnF+/UNTWp
         7lzZQePJQVfpNjfYh0hTJDCZgTmefumMec75BK2aGFPYKLmN4nZdkL/8el6bwtDSqldb
         qUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078784; x=1793683584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=xNPUvC+H2rYkVYcgsxF8TeJUPqDDMEGgXsFqQcfBqmCk5LmGyjaVejuw6TCEJbZr8Q
         ruZ1oNdZ20S/jqs0LNFeTr2+NvMAul4z9USvhPo6ut66kLLlxOHt9AXYXx2hFMMcb5OG
         FWYHKapZ2C17PC3jJT+geigdg/uWE9RP/qX/TMLZml/0uUu/WW3mxkoNYQWWXQwzvxHX
         qZO63NjT6wrvY5PTjKJz28x1hZhXcIzxuvDL7BWU3e4Hg8Hm43PRGLGoNOTyLcjvP/TA
         5OvsAj8AjBuIse8liRGqqSmbS+uBkXanmOfxYbZITBLFozpBXgh6k5A/Rdu955LwH/RJ
         UjhQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+IYVv+imc1FUwsOtZatFzsy+9kvnYcSehpGC7IG7BvsNd/64gbnCJKlXldTzXr+AM5nBJJp7/9zAFzMgBEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9QyT6kV7j+frAWfRiRe9Pfp/JL8adjwAksXjwNvuQTGjmhNh6
	4KlsOXE0xFGrCOUTWaiySqTpBaqgBcL4VGzOcvdxK11St+Vd+gcGqL+T
X-Gm-Gg: AYBFou3BWJlyYC+G4/5LJ9vDOhbtojDx5xf9QcKZ3EEV57ssAQ1Me4dIzI9nKQo4xuq
	eya9e9NKPTbCljN7U+HSdYhVsFEZF6MeXWfJMr9+1Z4kbbXqxiO9eWhRmiKV8aifiqDyy3Te20z
	U+oMIqoF+lQTHOplwHyWMrEvBcN6rODLRDnjHu5UwC0WtNWe6TQyAaCmSvh5BU1bZy42vtixvHG
	5K/rPUDUyYyO1oyx67GRoNJWoQy+TpU2GFOMR9IYvm6g9wW8NaA0Z1NpZFch82owAWC1mAQqM2C
	Osxoz8tfgVo/D0krOB9jjLoxxgGEhDsXOSqQCFEiEA7SPTExEjeyAzJ/MlmSH3MTHI3j85OTVxv
	BEWtvsRaMSQZRwATOy/sd1o1MsZWVBPmXxw4K7nxHazn8C3ewa3HEBwUA9p6JQRI9/FVmrCZj48
	c58FNJ21MOmx2zo+7lwZTbFPuGtkvEfcsB2s8ggcwAKZtc2yAVjsjat38ghZzPMjoYPAFKgZDNQ
	pLJfEAMcef8wFlQU/ih+UuWZzR/PZluTM6ccmsPcbbxa3EUY1wVSD+gkpXw9UneRYU1tVyd2w==
X-Received: by 2002:a17:902:e80b:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eae3d1de56mr9703925ad.6.1793078784280;
        Mon, 26 Oct 2026 22:26:24 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:23 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v5 05/23] X.509: Parse Subject Alternative Name in certificates
Date: Tue, 27 Oct 2026 15:25:18 +1000
Message-ID: <20261027052536.1722081-6-alistair.francis@wdc.com>
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
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index bfd10f0195e01..c3ec2846695a5 100644
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
index 8b68e720693a6..4e6a05a8c7a66 100644
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
2.56.0

