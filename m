Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078807;
	b=j/RQT8unvkfU/bpmbvp8/eCCQR4bbhImtXryNdVRBDRibpMIajLbugOx0sJ+3c3+8RH4
	 VAS0YmaSZgUM+VwRfQumq9Z2rrF3DADbRsm4X7oc+E1O0MFSsODa1jbvNolikjNpbO0H/
	 puUTCs4gu7s82uM2mtJI2uThyKXhBf5NY4fxoTUHLqekNnyOiQRaLFYW+tRH3Glu7uvF0
	 SsfhrrC4PnXQZIJCWbKi/usUt+kNxLQBu8MGGXj0/my5aHB9x0lwmV15DTFXklZsvSTfc
	 J5Qse9Cma0h3fUe0ept+A4Xzre+ti4uJ2nRyYjXPgKyf69A6CmQkqQaOjEUlix9whRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
	b=2IFZZyzcwSF5X1nhpvTlz5iDGAxXRS4GmPEa2Wm/Rq6ahHdppQICzhpNecwN+NqcAhBK
	 fmwkU9m6Tup/ixc7ckE4HznGQQME1IoGWMEEF0Oc5XLaUthEJIUffc5y64cb+GEKRCbU7
	 yPOrY/yCmYcj8iAiOgOpw7hPAjqmbgK1v6yuQoUBd9UZd3up9KaFOGNiZS0m3vWxd9Gy0
	 z28uywGgKpjPyeGJFQGkX5QKz+1Xs//mTgdP0ZWQM+BhH5z/pM2XVHqm2SWOifp0eTWAO
	 8mhfNuSPnxnyj+qRIA6GJYZDC7GKcPdg5J/e48y8rs+0akiUiJz86qWWxJdLLQD5v6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l7YWkduk;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04985606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04985606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l7YWkduk
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8b20a899fso23385125ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078806; x=1793683606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
        b=l7YWkdukGmEONpkg0BtkGWQSy4WllYCXyMIThhAIhTu4ED1/cSGJS5s1knAlHS8ZRo
         gfUwxmkyGTt4ImNVxavYKNF2Mtx0+s1gjwUVvDVAPZpkXf73GqiwBS5qKANmmXwJKQS5
         EEMlVMToU857uf7c5BbibthK6rylk2h5HT8vRc5k9JGxKhlmM9rRcktlW35VSFOjjr0Y
         IPXQ8SLb9FsfwzaoXHUohBXVTmaETd/buHwaL5V4xraKuVA9pxcg12MjsvhvgwWlAchI
         Dt9ntpCfAynJ6dx0DdEGpQeJ5+quw9zRaH8An0sdZveuM1g6Ba0/HUvnDlbFSXu7B/GI
         JJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078806; x=1793683606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
        b=ne3nrostfglHhI43X0OF4U1J1TK4GGvNJeu3bSV6XbO4LlQmEmY+rpygonzLzS3EXv
         gZD+ulPbG/Bt1/W17Q52Tq9rrqJNUJDsGnADJ/IDnpfPLL9wDlek9FnM0PsHd25uYmKl
         Z4GI9fsuDU1huaHjiOB3abhJztd2h936AB7ZXJjNco00HNcaylmmLdyZpvYxabnyIeZ5
         gLo2hUpurQKes66W/RiU7MDpdgf2T3i7atWIMFaIGdIs3aG+03+UrSxEsrQUAWrcDCtv
         Ed0tFkk0J6GJGCVlA89e4Ld7s/WMvFMaVofxdfwHR/2kOWMAY8I/P4tLOoz4MGLimR/R
         iZ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwbJWbxLuXoNoyOwshiRy8N9ctG04gcwUB8CaYiQhz5HnzvxDcxkDh1e9DwNWU7IPulLGj4cVcSg4jMz7GRDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLw+6vUKEcb1R0k/+XliF447NJ52Hmxsv7pm3nwAfpolQf4D0u9
	ijl4/UknaqE6bjVMLZU1J7i0Ph0nhXccw/eoSiAgluxU2KjQsClR6vD/
X-Gm-Gg: AYBFou3XCuvruGyUrB5+ITskrFhyIMTAjEnyj4ttCFVV9fNNUTRTSclcELKGbo8oORA
	iSsmBn68vBvPEiV515PAT46ydj4SU4v4XlVyroOeB4AWoQCIxMDKgGqLUfMvfkGlyEE31DFa1ei
	+e4D9Rl6OesKUWQ1KJRae4jgaRuV/MWd4doe4C7Gxt5Y5fclSHjmrG44Jyv+41REvG30hP/yKA2
	aEIH3U580tu9vRQHuCficZRIjngZLtCmMCYlJ3/+1fQhYyKzAw82NQFSdyqxPr+/cH60G+pUNOA
	Jay0tEXS9d2rqvclFkqeHnRyQcwsvlJi3gRgJQIwZ+MRcvJW+aDj7hb/virWAhV99DfjW2VilZO
	D8A5qqDkV0CdQotpz6j7CQ3wbDAmupE/f2FIVcSaEn+8MrhlNS5eyh5LyD823xoNbOyRfQlmaZL
	MjhwXQqYY5fBo8lxHPDVsDrFDacGqIWZ3HfetLUoNGgAOc1k2I8/TB69rbmvOeBg7S4WwZKRHwQ
	1x2W4vlKcPV1IuFEkrk6oMpdAfzxLYfxTRQIRZpnse2ivagGDGJtUgdHlbo7PPLV15/OwkGmw==
X-Received: by 2002:a17:903:4b4c:b0:2e5:f62e:2eaa with SMTP id d9443c01a7336-2ea9c88872fmr70545755ad.43.1793078806314;
        Mon, 26 Oct 2026 22:26:46 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:45 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 08/23] rust: device: Expose Device from_raw() publically
Date: Tue, 27 Oct 2026 15:25:21 +1000
Message-ID: <20261027052536.1722081-9-alistair.francis@wdc.com>
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
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

We are going to call the from_raw() function later as part of the SPDM
library, so expose it publically.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/device.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..a355ac9803410 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -262,7 +262,7 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
 
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
-    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+    pub fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
-- 
2.56.0

