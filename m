Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF138E8A0
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224696; cv=none; b=lCGcrfYB9AkwC8DVmM+ev4ynntnEZKJcYtll0dPjhRx8tTP72YtI/bUWOtfMf5KSIDaj1lB5KW1OVvT0FzGF79r7+Or6UkBA3ybtw81X8yMVrt/tAGkBLt4xX5NLkcOS2UrRpZAafWORf6wrdrW0zepk0Nwd7L7FrA1MdMjMqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224696; c=relaxed/simple;
	bh=ka5L0T+crJoJEiz3RZq9V1G0Q0j+3Njce27Rj8beaoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUDgSu4Ypgy1av/Wg3do4/8LqCOUGD8i0yH2sR6lSI2BmUnpjVX/tXmQACsuj2nqUURMDR0nISLDexPPSpZECI5cfB3yNqdctV0dzcamXIO5JUTuA/XejosZtOmqDtJ9qWguJqEsYC7E8l+JR/4gWFLlcTTCdqupkH7A0zj4vB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSDXPpIb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSDXPpIb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cace91f112so34153785ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224694; x=1788829494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=VSDXPpIba2vhR58Bk/6sSHrhsDqP1auIwvd+H2yJtUgp+d9Vcj+K8JO/wH6S6+NGEr
         7tQA4rLyIaJq/SczBG2IRifn/ObFimuicaKwhRCvhhkX1grDqR1G+qNMNro5pJ/3MTww
         Hr9i7na9ZEVcqzxi0AaHSUkPmljYC6FfjC6ONmq3lxrOfvQlwQa9/f514ja3qP4/Rryv
         /wFuOOuLTI2RJXZrIFUeEdvOS38vE/NLGtgQqoHNEdBNkgAA4TUDWvkubPaus7TPWseg
         Foaub8i9ed+WjE7iP4l96Sv3FICwxpfkosDiGEoiObRUxl1n4DVQ0l9LjKMAP1Ay+CND
         8vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224694; x=1788829494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=UOpY/VW+cyYzM+3hix5WCKrgxH71hNxXRMg2B0EzsIX9wrAZoVmvoEMQdh3JiaCQwT
         aov2TP83ohEqmj9b8DMMCfF9we8tVssimuDr1vzXTwIEbbbQOzjxAfEecmo2Tig14KST
         5+917ywzXqTugsK2Q+NWGsBf5A0K+GjymcDsTWlLW25dVMTub1WDVTdQ/YOPb2Mpj+Wl
         fCeqFHIzq0cxY/z2g39KLy/1mH2ma6HILlNoqIie1qNMhkl6sMPZMdwn6E5KWV5BlwkI
         gg5QTNTUy5sf0icSD6vJfedNqDAb6onURPcESv/jK2uM3Zh2o7tFYPaDG6MHFDSMyi/Q
         YhQw==
X-Forwarded-Encrypted: i=1; AKwUvBxqSGxo5CUjKDYCpZarAkQ4kCNE8vCo82QQ0yL7GajAIbckZbILl2FywT/M6HU3wtENGcJLxei7wUkqqYAj4Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kWtacvb82hfixJmsZr2biqsp/CSgDBsCHAfwyr6/QfsaDduWMx
	Ye96kbl+NenvvMTPkqpVYId2/h69Mv9B0RFshJxaLKY8aligxzOc3oqk
X-Gm-Gg: AYBFou2OYzm7/ktkVSFAOpPm8y0strxlk3483szKZnNbZVv41JjPC+5w27T6zr4gfCU
	N3jF/Z130RahoQPuPKYoWhObxFsjwAlQzLRFXcK8pFpeH6Y+JEYeSVJMbAUImNbLicGkoUenW0Z
	Igg2vSa+EjEX6DW2Ch+C6QjUguQO7XOUMyJojy9WULhtfJl8FrnluvOE47SbX9n/wCueLdbW3uh
	uDZT1fTGQc2npublWPxbcpd8UBv3fCW/rVHDw8NmoRZUS5Cd7/7CYu2/lEHjFXCp6Uk0z/9Aq0m
	dwVeEYkS1OTFDjfEL25yHEnEGagJemYTN1e3uFLVkaPNFha7fdp8Q0MjT2YDcuGNIS7ndspSR26
	6BGrkeJ/k7rpyTYmAY4Pf6sXZXezGOyaV61c6LGjOYzbAl0O+fzmnu5RI4ltI3n6P3eQo3/r7nh
	+2WcC+nF+3Of36MeNsuDIqqPzQwDYsjPvxNNwv0AHRK+JzSRO5Ol1FIqYf6Hc1QXesUjvyMV1Iw
	g/91/T4DQ7MVen/
X-Received: by 2002:a17:90b:538e:b0:398:e436:384 with SMTP id 98e67ed59e1d1-398e436066bmr15200914a91.1.1788224693739;
        Mon, 31 Aug 2026 18:04:53 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:04:53 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 06/21] X.509: Move certificate length retrieval into new helper
Date: Tue,  1 Sep 2026 11:03:32 +1000
Message-ID: <20260901010347.2614656-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
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
index 0d516c77cc26..174451b93eda 100644
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
2.55.0

