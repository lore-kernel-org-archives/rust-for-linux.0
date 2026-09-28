Received: from mail-pz2-f28.google.com (mail-pz2-f28.google.com [74.125.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA29356767
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557946; cv=none; b=oIDdgaMtclQR+ZixXN/GX3U3bIOS1VRCvizbv/cp+unCoP6AkDuuHLNCmsF4dqwziDRLiK7nc/2a4B22aA0TKFHrfNPzpi2mZHWRe7jjoJiRu5SZ6J5IWdZAac1q67PBl6/vn5WRmwk0C8uqC/nrS/ML2/gFQBJTCd5TnZrDy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557946; c=relaxed/simple;
	bh=ka5L0T+crJoJEiz3RZq9V1G0Q0j+3Njce27Rj8beaoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoTacEqUgln1LNLHIWf6oF8CioqnhmWlfnUF+vDcugSKGdJ7ORR2z1vJ31LFOTQMDoJtfS+HKR/lUs3bokLIsjlqxljD/v14w263/MY99H76VXIb1cpJhTYVaQaITJqFQJmmX/GfDgFBb0K4IuIzcMZtQRx80kG6+tJQ4IoFWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNommUsr; arc=none smtp.client-ip=74.125.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNommUsr"
Received: by mail-pz2-f28.google.com with SMTP id 41be03b00d2f7-cc745abb731so951986a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557944; x=1791162744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=gNommUsrjxTH8d0z06ys1uhlm9hHoVdmO54W1aQZ+dlYyyECev0UofiJb3DLV5d2f2
         /tvNFkrDNOcSMfCtR0MUCoyjB/oTxdD/zwDWU1sGmMT9j498PVL1aDKnVnvx0cE7YwDY
         BfW9KBKCZep8o1X1LubQVyJizVfUFpWKL99dSsmbRBAZefBjEpWllrLzwY0yFuIKTZrX
         IgNU/985fEDfEIlY8cqNATRwH4vI8sJU977Aod6PIwsh1eoamyZa7h/3F4uCZL6Rd6xk
         AepArh2FQHaOV/4OPU+NjQ72Nfy6al+g4FBoitzAUFsavhaOCH2h7tKfQRcDpL3L4MRo
         lwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557944; x=1791162744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=UgUY1yR+GfQDE2KU5b75ZiZmRWsXszKBs0sBEoJ2ktV32v0wLgxThjd59I8vZw4CZH
         dtGh8GyVDt3agLQrBmRDT1v7CrkX+58CO4Xxaz2Qtsnmqff/XWT4GjzxcKQykVKlXHFC
         I3EKY03fW4SyPwTcbX5ptAZVIae1jIsv09A/+8mWXojqPa7BD0dHuLjfpD4WEuVfStOg
         Nz1ygbWMwVxTUgfdf+IuBExkPlCxLJQHxDsiIqbIbKaR7Imn65zDppclYnbgjeafKWzO
         za9taI1yVQMGeXUy6NwH0KEUcrFIuWxPzHaOMc+UjKRZEBdLTmmQ+HppkdNkjdJnHto0
         oZYA==
X-Forwarded-Encrypted: i=1; AKwUvBz0HgQFlQJL9wxssN3vnybd3fLWapgduReYyxWMr1MwbduO6ygHUNeuSGdX4Q+cjqCEkVZHURAWhFPkQFV4tA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5JseQZ0E2P4xUfAziiJhdHV0rCRwWdet3br0aYln5TZtmFDQM
	3SNCRdmiR1grzVhVKY/qSeGTMdgFm1T4Bs8h8BPK5eYyCKKUXYCpOZjv
X-Gm-Gg: AYBFou1BqBGjRrPfgkI2YC08H1wvwORblTG0MwyhZraiDcNRZ4MFiO9MWdWyr6olHNr
	N1TNxsB0i41+nJSew1WLtGeyvypimSe5f1quH/g9dBxF5zvZseAooifXbXPceaLrnHD8Jp/E+Cc
	HSBVgXpYbZZ4jMvGmAlRycxP4aDA/lYlxdO9exhxp8u6ksodMZYtPVGmMLmoP3cGC73HGi9ZUUD
	ZLv4rLtBj0g91Eh2FtXeHpq9hG5Ga5j3VsWL5a2SYzypNCmCr41vjccwWiv4pi2UNs2D6x+SVSv
	dp0hbUlkrfrjnFOPmYjNHGEaKdDhN4tsmpnWiY3kZrx2uBcB7lO85SYMaIUyVcfsO31wOu0SEpN
	L8iqD3GuNr74U8Ff0M3JGYEwiZ8dVI+xNuUDAAe6M/DyZfOaZS7MdzFdwv7WSQRlTgzny/3++vx
	GHWJNQDjVuVk3s6TWocji95eQ9A2GSP1DWliUwuVRfCCHqEGCa9uveqfx5b3Jvwjpz4ZrTck2nA
	xsz5acyGClYNgwp
X-Received: by 2002:a17:90b:4c82:b0:39e:6c68:1552 with SMTP id 98e67ed59e1d1-3a09896ee0fmr8267708a91.26.1790557944459;
        Sun, 27 Sep 2026 18:12:24 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:23 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 07/22] X.509: Move certificate length retrieval into new helper
Date: Mon, 28 Sep 2026 11:11:08 +1000
Message-ID: <20260928011123.450800-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
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

