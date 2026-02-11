Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EFF3446CE
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780708; cv=none; b=pZYtBYBVK9qrzOsaKYIusdEu3hcwnzAc2esiBqX6M5iTHc2vjyI7odSxyz7jLTw9YKOgPQD9MwQo7sLQ32JLkO6LPiqZ0DzItC+/0NzvutMOf24/OKW2m5oli5RP4yvA2e5AgBZmaDgm15SODgN2C/n6PDOSVOBc7jW2dR/uGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780708; c=relaxed/simple;
	bh=+Dv6Jp5OhwC7087KAYCtSukovH0C5t6UM5K7Pi3a9Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYLNuFEyMmWVwcm04lGPnjsLif9IygJlfgQykl920DcM50XlAmE2Ctbr+Rd/tdr6eXVgTRzY1VKLsD1VLVVPkdCDmdRiZuwWql/XrCgETQZzdFNzTAqtmyhb01EOwVNPl1hT6b8HXvXBYLqXelws4LUCTsNx3LNZBFNL5ogBwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDBYRPJQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDBYRPJQ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c2af7d09533so4344583a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780707; x=1771385507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mB5YXChxH7A1l1HnU2HjGhx6UZiL0/lHVVqKO5gi7I=;
        b=iDBYRPJQBzfiFaGZ9rh2PBQ3hmQLykXxB94fynOLlV4iaOfnt1TG/OOUgWpr8liY6E
         ZRB+M2z2PHMCzeccm5nvMb5ciFPgx0mNA+oXyviAbeA7OlB3EQgD/qCjj1i1Nr2Cwwyh
         DSbDiIteS0UglJBv1FsIVgTjHWBCqzoDbdQnN/IP2kCe9CR6kuBrMcfYQmIMoYeR+PR4
         fGkQrjTB3dgpy5US6JOCRbLsg6LhMObK6lv/jttxq5JU0ZJek9RAroXoMchEPcD81CG5
         5QAa//34HJYaus7BWWPlBRW2WVcmppp9nrEzCe6rd6WpKPnGFphsRcFTOND5woPwP9lM
         5AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780707; x=1771385507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mB5YXChxH7A1l1HnU2HjGhx6UZiL0/lHVVqKO5gi7I=;
        b=aq+5PxXVOtQ1XIYehKNmOBJ0ByiWurxRs8GmsxcrFwjyoLLWs3kgJ9yAiXlACexjIY
         fIcKRuls64A2G8slRRExfEf1F75LaxQwAPIr6fjZYse2wwSt+qXLFKEUQ4SE+RAFJkMG
         Bnbq+OJ53da4zq0n2RndwG3+ml2c31xiEMrK+OawGXoUS/Vpzu6OVA5ZIZQ2jAXHNtWm
         DjagBKOuEhozndp3jWKk8A8OzYHStEKhLZTGvSKoWKMzXYTr0QYLch7s+vsAnA9cgOaH
         rqvD4digeT4Do3RruyRe49BiUKM5v7oocH21DQyQN2CP3kCwIH89cqg0hvCuria1BV7c
         ZNkA==
X-Forwarded-Encrypted: i=1; AJvYcCWPgwc/M/eLiTryESXpl3K/QH3Z9+8Wavc6ymZ6IFr9R3azabqATDzQogrfDnMm9BP+FzGQbsVugGEadRrhYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0sA4nso4dGXB3lDIhiPZDZ7gFH97H3RTiRWkSVW+GO8b+1ixI
	2+wVpxbYKcOTTghekbckl7ElQHARK/7gfMeRRcXeDl+m1Yh20nISlD08
X-Gm-Gg: AZuq6aI7yTRAuc+nC8fPx8E4jqFOq6tUxO4/E4s1yqTz2eJuFcbf3uEJkoy1FKs/eEG
	hHMB2EduQOQ9si87RUzBBS303a/rtHJ/cC1U1qRt9OkfF51bdsSgm3ZeRDedUafGtwXTkkqYf+s
	gxAIUZewWSamzu8yZhtRivh9+J7sbDXT0RdAbCIwXPJkGNl6nekWcHl/W6ImF00ndtNMWk6a98O
	gz+0MOc6yRMhPAGfkkEG/mqpANii0PVGP3C/pr2RKxyoD8QmTbjUvxCUuhbS4C4CupZ4L+peZof
	nYQ5WzDunxo1H+NTKmStLDs31y6znKpWX0d67G4Jl6ViKi/j42q2VZgOlDeUXNAUtQkWvmFy46r
	juStLNLzh3i29gqzkgOpFxxouJUl9tYRjs290xDKo+UckZyLU/n7A+Uu6pJJWO2U6dA/bkuuNKe
	EArQ0a6e9qXTSMm1jSIgm0cDh7LY8WxRX8dnVIkTAgAw==
X-Received: by 2002:a05:6a20:3ca5:b0:38b:ebdd:919f with SMTP id adf61e73a8af0-3943229ad32mr804189637.1.1770780707132;
        Tue, 10 Feb 2026 19:31:47 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:31:46 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [RFC v3 17/27] crypto: asymmetric_keys - Load certificate parsing early in boot
Date: Wed, 11 Feb 2026 13:29:24 +1000
Message-ID: <20260211032935.2705841-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

Work is ongoing to support PCIe device attestation and authentication.
As part of this a PCIe device will provide a X.509 certificate chain
via the SPDM protocol to the kernel.

Linux should verify the chain before enabling the device, which means we
need the certificate store ready before arch initilisation (where PCIe
init happens). Move the certificate and keyring init to postcore to
ensure it's loaded before PCIe devices.

This patch enables X.509 certificate parsing and asymmetric key support
early in the boot process so that it can be used by the key store and
SPDM to verify the certificate chain provided by a PCIe device
via SPDM before we enable it.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 crypto/asymmetric_keys/asymmetric_type.c | 2 +-
 crypto/asymmetric_keys/x509_public_key.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 2326743310b1..3f209299ee3a 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -677,5 +677,5 @@ static void __exit asymmetric_key_cleanup(void)
 	unregister_key_type(&key_type_asymmetric);
 }
 
-module_init(asymmetric_key_init);
+postcore_initcall(asymmetric_key_init);
 module_exit(asymmetric_key_cleanup);
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 27b4fea37845..2b308345bc6f 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -258,7 +258,7 @@ static void __exit x509_key_exit(void)
 	unregister_asymmetric_key_parser(&x509_key_parser);
 }
 
-module_init(x509_key_init);
+postcore_initcall(x509_key_init);
 module_exit(x509_key_exit);
 
 MODULE_DESCRIPTION("X.509 certificate parser");
-- 
2.52.0

