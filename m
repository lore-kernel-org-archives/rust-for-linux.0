Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284368;
	b=wbwuxL6GDdno66GHPLdzeG1dpRNRz4jiN6hCxhR0KExQkLFBMZlz40eKAYbqG7z+vY7f
	 BCAkLAOtk5vxU/iErhqjfgPYzSf20TSP9FkaQOt+CCu9LOeSC9HiQagHmhsM6W0891W3X
	 JepqxfCag5arPwkf4zNBuvSmL65hu7z5um9T9nDW0ew4IRPncHsFWn8TQK/E5ignEeOrM
	 zw6OfxgQ3Gzr01R+O1ojqP4pT02e4K992p8V8Zj949HVPznV9IxNLblTMTc7YR6Il46KU
	 tjgOXczwdlLkRlzw2gmcBKuVl+AOoQYaWHZ8RymUPqUbIhUkw2OPyJpWMPn5Te/d2Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
	b=GwmvjaZeuTm/YBRpZnewVrAoPvjv4qfMBvWZSBS4uUyqwd42i2CVJg4zq3pGPHTrGm2V
	 Ec4GmWiL8I8LDEe8FOQvY8BRP/xS/1BZvzNROeZe9IN4l3RhIpgg8sYZRMk1kK5KarFax
	 9tYM3aZ33+t+O+iNJmhHqEwLQR+RvpEPqmvC82ZOfXHtLgSS06cPe6yiZP+jU9iXiq8yK
	 /WBD/3W9Z7T2Kt8cHoRWTCCw1E50r33mvdJa4PrnUSnyqiF4ZYoMdZN6Y5Ow/4VmQEGPj
	 XinFOlcwVSAuD3trbC/UbAqG8I0m0wcXggMql7XADioCnLdwEXe95mFRjuc8QGp3ZFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWXI6nx2;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34760A5BCF
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D34760A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWXI6nx2
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2710003c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284368; x=1794889168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=RWXI6nx2GRh58cVQ3eVAqSiKzpFdhkGcuKrUVqZBTguWwL8ORLFBkqpFpvsZzQAr6f
         X/Bv16dT0jJgVH8v9tpsi8ml2u3NKo3LG84JzfyJR+PNTP6Vz4FBCEnh3wE/VrulnPoN
         d45MtlsnuEnECG87c1Lr5YwwY3DTHN2Y60/Z6kamzxkXxCoV5ICJIbfu3b1QLPPJpv0h
         bvDjZJ6ql5VEcKz2loy1jpu1R4doD4KIYOe8o8dMdZTwysoc63QTufoThjEcBPmF2tVA
         h1vkE846+i+TR+k5UutlaqiTFcqY0tjUa52de2g4aTAD4MWmzmbYCS6vyViMR2XhakZb
         4O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284368; x=1794889168;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=QxLsySiv/0SWwGLlARAiZSbUIJ0Qilw8PCK63uoItrqVOSL1FnzG8ze9w86tJae+q3
         1TpJoe75prr5OTFq8cpairhMmHAutnByPXUj13Kmdj6qakuSMMUq0OpSpIAk0Ew7AO+9
         bRuUFVYzvP+2aFb9sQzvyfI8PfZD8Y3yN52QJH22a5wgbkXzm5gL6RPInYqP2jnJtMpY
         U40m9rrBDgrq2pWz+h6YOV059LRMsBV05fj7poUFHeKyBZ8tPReZEx2ERTE10rfpNZZ4
         EuQ+42/lcIcybeYx6avYLzSPrdetnDxDF11W0etQJAVtdCaPzUw6B2wOI/QC+bj3UHYn
         kU/A==
X-Forwarded-Encrypted: i=1; AL+hErHx/G4fQYWrhAT4sAr2RaLcM+2ODkTuCsSriUpTFEr5A5syqpHap/v7S0FFojf2Fx4qrAKbSHa+0lF0WYObFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9k+ddoRXxPziDsY+LoKlLSI8kQynGRmmR5fn79kimRrcuCDtHE
	PhNqI94zlPJsOaVkCs6+Q6opqt7r3PfAY++f3zacs77NLcQUa2cl3QUD
X-Gm-Gg: AYBFou2WbVPWWksAxENigBNIfa6ILjHTvwrJlwBe1Nl2Xzvx3rKqxTorX/I03g0TJQ+
	vvegCHkUEfw+KelKHxa+5uHvhK1k6UqwdbRG9DZgtSfVdxKquTgm2A3h0NeMe2CAT1/1gZOCWIR
	lbiG715aAsB1jM/q8aZ/WXC8TcKzf/mUT9ylAgY1eDOch5N+ldBA0oZpNzdnXi+hP8IkhYZaNSe
	+08drACctlXWOfv9z/WQS1IRGDF7VE47yE40gw6GZrq8jTZuwCbQLDZAP+SK4Q4Rk7xVvs92rav
	SAw93HOOByBECrrzUEa/O0DzYd22Uyf8k91zNy/cVwh31/INfka3NA1aTWfUD8nNHoMNhcBstM3
	RWi0Jki8zBMgu2C1eCNQNB3ca42Mv+OF47vTSGWJ4U+taK8OSdHxVaVsfn9UHwGJGhGraIgX3nI
	5m3rEEGoLrjkMKzEq/CItU6aSpAUTQ7cBEZ6KmT7S9iLVkSnFgUspXtA4chyAdiC62HhuMVvNT3
	PqOBX5cnN5xRkbMxEcKi7R1mEjvAKUl0gCyxBRznFSAUCHc/3qFMf8e/1MTQ9jeFSgreESYAXoF
	e6X/1eW6n2y7u5dc6oHqHoWZE8jfCUcEtc0duWeTo3cqm58=
X-Received: by 2002:a05:7022:ea55:10b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b3b605183cmr2161968c88.37.1794284367571;
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v6 05/25] X.509: Parse Subject Alternative Name in certificates
Date: Tue, 10 Nov 2026 14:18:12 +1000
Message-ID: <20261110041832.1730924-6-alistair.francis@wdc.com>
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

