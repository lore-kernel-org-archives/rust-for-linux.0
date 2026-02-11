Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542B346782
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780737; cv=none; b=KoQ3Qx6MhfQ1X2S4w5LUAkUWmRloemYeUm6g5lwUyvTYih/ssSapowvoHuup+ILXPDWfFxZXPuX9Zum9DccP1H1dc44bbj4X9Fjpzxp/q3SPp0G4yl3i6TDNqY36N5A6B392zkFrXSGFP0SBi7LPzk86IUAt8rJ10TvJMxf6GR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780737; c=relaxed/simple;
	bh=9VdUnjWUzIRc5MRPzIsJU//SqqlQjG40MUyiPknL2gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS0Bdn8DePpcPtaIjbaFag81S/ViO6RxBDpRjvqc1RfAAghihRn+9b/pFeV+x3Rvk2MFhg5SPjZeo+MLR49EDB6PJsaSAcnkAUa0I/NTg19Ez04utq8OWd0a8dXDArNSZICn/3VjElCpoHBLFlQ5ZYyATitGPh/yY5eDEs2gyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB1Dbdll; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB1Dbdll"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8230d228372so3789338b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780735; x=1771385535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4AFw0Ke6Jdsl0upZ9PbC8XO1EFiCkPW7RyBX/Dx3Ac=;
        b=DB1Dbdll2K5Lm5FX54944Tv++KRUsg60jNmVbZT1174jH5ASUE5MB9JfcR+RQBhrgD
         vFa4HhfXsu55Wlvv1gGQiDNBalLw+QFqU8zTvDlPP7ThCOrx6hAPxkrKxGF//mhMMfAf
         z9AmAvkJXBcLlEkXTPHeomVTBDkTC4Dfag/H9TckkhwJDVAFRN7lh/Ko2FfqDouzfGfq
         zHJxboARQJ4257ICQlFXUVFakdQ9eDWOPZrz/17/Jpx7nRi35Ep7l+oqTTIF6r/gCtL/
         1Wo7nCudZKYoXnbDpOlmgb90SvLuCthM3p4576xt+8iUhGViZ3p5eO9iu5AB6N/brAPH
         P7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780735; x=1771385535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4AFw0Ke6Jdsl0upZ9PbC8XO1EFiCkPW7RyBX/Dx3Ac=;
        b=snIOG9e7kUgyt8X+R16SbCr5Y/8jhudQkNSi5QMdtPDtsZa7R1CUC5emVHuvwVS/3D
         2v2TgygyEEoC/hP+Ls+7MstGJhV5CTipp6Kq1g56AJBbb0IHmGdaPq3q6j6raBe3wSlQ
         QHUOMS2Sw57fKMpKxl6wYsiPqBOndz0Bi8grLuimSZfxxIz/bQqyjVeIq46Gn4uT8DK6
         Xjvtk4qS+S+zPQstLSA2bNy8F8unn1ZjC1LMpAsU213XJLv4BrS/Y8/W03NL7gAyJX0v
         NOOd00VeoMmbKMxkHPzYY9YScGUJuTpZTmlV1ieIpctgdQ5F2qnzGBK7NC8XjNiJPhrQ
         CZdA==
X-Forwarded-Encrypted: i=1; AJvYcCWSLSqWlg7KNe8uTjb1WZtyMRjK2P54mEjR6gnC7xg1XZwLlNem4Q03lm2O8uU7JGc4CB+V9k7z/PdvMcqE6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqTT9LT1YCOLgR/PQIY+xrcRuva1k615RvB8ll0DkPKrJuCZH
	6KR6Y7CHrJV2bOhK74tjjtyZ07Ted4RRMERXnuJusToGes1OnSH/HVHY
X-Gm-Gg: AZuq6aJWEJWVXEmVMNpur5KcgmN0sr7vHOvwYcmouW+k3zXb8u+OSO712ouj6/mGsms
	DDwCjo1H6VhjswU0CbqZk4QtnxxItbOcaBYrJPLlVbX0Y3Gedbfa+ZBQ1QZRyLk8GXdqe6xKPhJ
	PQT5Rrjv8KfB1XxDGki0ZLkcpQgWhk/skiYN6X3FriTvtYY+pAly4gGw831tq70RAMgEsjllQ4Q
	sS0YBiFjnQbj2b8VcaZmqOW8UYEE6dHtL1ITKofvCf3qclt8AcY0DltH2PD8jhgOSOU7hMFq72t
	bq5WvBqH/6zz8zwOmow0Yl4nukuaICI4mQNx/zb2rR/Ay3xMq5Q7E8Y4/1lpL1EK5xEdKwPLsq4
	SJYskDa4/b374hBdn/xXn8JPRxQSilE1COj9EFHtCxhE9n/rSkLHKFYeExfZSrmRGmDskxzSDuE
	lnKGmEoM4Us1QS5H9b1rvTMPZf5A3uTmB/AyM5cQ6a/g==
X-Received: by 2002:a05:6a20:1589:b0:364:14f3:22a7 with SMTP id adf61e73a8af0-394323c170amr719059637.42.1770780735134;
        Tue, 10 Feb 2026 19:32:15 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:32:14 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC v3 21/27] crypto: ecdsa: Load early in boot
Date: Wed, 11 Feb 2026 13:29:28 +1000
Message-ID: <20260211032935.2705841-22-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Work is ongoing to support PCIe device attestation and authentication.
As part of this probing a PCIe device will require signing via
the SPDM protocol to the kernel.

Linux should verify the device before enabling the device, which means we
need the crypto functions to be ready before arch initilisation (where PCIe
init happens). Move the crypto init to postcore to
ensure it's loaded before PCIe devices.

This allows us to verify the certificate chain provided by a PCIe device
via SPDM before we enable it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/ecdsa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index ce8e4364842f..b225911c5266 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -334,7 +334,7 @@ static void __exit ecdsa_exit(void)
 	crypto_unregister_sig(&ecdsa_nist_p521);
 }
 
-module_init(ecdsa_init);
+postcore_initcall(ecdsa_init);
 module_exit(ecdsa_exit);
 
 MODULE_LICENSE("GPL");
-- 
2.52.0

