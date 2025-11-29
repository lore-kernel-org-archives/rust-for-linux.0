Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6352E261B6E
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764419287; cv=none; b=KZKss9n2Hk+O/LGQnIWTRZrkf4+KJvq5E1o/RcbQKkMkUS5+OHfrJ9pX3/M2SNhU+wSt7skUjTmlyA2LvrB2/qOgEvg/lEfCSUjGf408pZd1+3rFx3oYcLuIs1GRDEAmfAV7tuCRMz22SwIBzrFI70wOX80zV/GctPOd52l/9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764419287; c=relaxed/simple;
	bh=jMfOtC5ltGOwo2zw8E6WHyb2hwdx1JI37MEhkcm6d/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI60lGOu9UNEpoz20hUZxshfNAYqzzcquR92n6kAnYw9naQgPz4PDdGkko2v2cbzQCAVPAwPRy7jgoKeQ/otwGSpHuC1JdACJfX4jexQ+Yy/lLfafkGXfokpNnVcXbleDdacK1b8gMBrfib2UzcE6+4CK7sysq09HZFJcgiydtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmYkdeOU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmYkdeOU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34374febdefso2823928a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764419286; x=1765024086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3V2gkPbQh4TVJJCmUT97AnhOY1sd61+QDFcFJfctTo=;
        b=VmYkdeOUJ10fKSocWbZ6RFrJMMTexnjIlZcmrk7bXYDxh+6kEzoMO6AsS3z3dz+yld
         2Ns4jQhJywiBEl8Rq2M5KC+kdVkvnyJD4tq69U9ba932apAFb7m/HHwJymrTUWd+Mmgj
         CD4+FjPZxt+XfADd6bzcvQZJOhejNk/UNEJNtyYYqgp5hy3Zb+cI1FwvLB2vZ+i9DFFl
         9OLxyll8+EO6NzYWZq67GgpX6Vv4UVoHmNIZ7Z5ubNlE1g0+diGzes1XNtenVqDYc9qQ
         jZrSW+9lFBkVEzrMB+aQhkDicvmHhhzwIozLnLoajlb20cW82/j5tvNtHBblFS5kYw/7
         sHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764419286; x=1765024086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3V2gkPbQh4TVJJCmUT97AnhOY1sd61+QDFcFJfctTo=;
        b=TP7Y6DFdoRFQbkDuLDHxI3hzv/jHrR9AyFgIQgTBaPktxJLd4PHF06s8xM6SEq3sbA
         V95K4MCePT5F6jxd5qmMlnuvGQoUoMsdT9KJcW3xeOLRNhpQZWpdMuFXYqo4ef15ZSBP
         c8qdLgE/4uug4Fqne8kKdl2o+2WDb8nuyJy1/S5oG03zHdSeedMQW60+1nmHMBoXhaiR
         AgioXba8R0qhffr+imFMJSfvc1/pLaKHZBYZTS8ZSl5l7qXAmkAAycsTxxlswAwvLuJW
         shT+ZIjuZMw5QldrevzPGx9Pex2AFAPzKgJHwTykAmNsnFL3vQ28GWlnEck+o8pdPNsR
         /imA==
X-Forwarded-Encrypted: i=1; AJvYcCXelFvJMmuggUisVVPZbPsQoP9Ib+v/TQVqrqoasq//v8GM91KSioOUzY+dFZSvb5pDgJlOob0Fwt1MgVQPRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nSNByehalC0ntjsIiAPTkoKyQsYT/1lHWK6n4oOO0WkROH3z
	gTW3mgUAI0K3h+cAwJKluyuKkeln1jl8ZTW+jtPDZjWC6ymm/YFyvtaiHk/qG/2p
X-Gm-Gg: ASbGncsPI7osuM04iSPynqn7tlPGV6rg/cjv2lTtju2TgqeAKqjEVGavUoL3A2lCWsp
	mQ1jHMArw+dTRuzn+cRKMRW4QBZmAc38+PMe6Ci5AFVjqixh/wuISoq+SnwaMrNnERLLJg6XDyp
	d824SJ+nPNjdfF0aJ3hDkHTYlEH69oYqfwWhXOA6Fc6rvs29X8SKCmSdXySJPYuC+7EtGIR/5zJ
	diadel/sHxC/KdncSOlQa1eHQ2oNCdz/NjaAMYs5xtUy41ZHpO/ARDMwyWDOGdBMOBG7hzdEErL
	TNu15hPD8ncXGmLUFhA9/SKQBjgz45tbg8Uo1V7qphqMIFWQQMxLH+XaoLL8RqonP4VxEz2vEZj
	m4DwkPFga5gI4wh916xfJyQVYCMMESidRuNGSY4eW87d752ImOLHvoMWaL5vb7C49YDTV20mJa2
	UUnMyfDAYk34jF8rg5LzsOkOWXC/HoBDzFspNLLPRvof3EeHwCTFVLxaiP6AhpND30Y3ca9QRKu
	Qo=
X-Google-Smtp-Source: AGHT+IHKLnLhy8FVoq7dwSlGJpH3A/bWswuLjr4boQ+kvg66h9DT70NLcNVgAxqb9q/+gSLGJHGy8A==
X-Received: by 2002:a17:90b:3848:b0:341:719b:768e with SMTP id 98e67ed59e1d1-34733e4cccfmr25699841a91.2.1764419285623;
        Sat, 29 Nov 2025 04:28:05 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb14876sm7911260b3a.62.2025.11.29.04.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:28:05 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: rafael@kernel.org,
	lenb@kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-acpi@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: acpi: replace manual zero-initialization with `pin_init::zeroed()`
Date: Sat, 29 Nov 2025 17:57:53 +0530
Message-ID: <20251129122753.23022-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use `pin_init::zeroed()` instead of `core::mem::zeroed()` for initializing
`acpi_device_id`. This removes an explicit unsafe block and aligns ACPI
initialization with the pin-init conversion used across the Rust tree.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/acpi.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/acpi.rs b/rust/kernel/acpi.rs
index 37e1161c1298..9b8efa623130 100644
--- a/rust/kernel/acpi.rs
+++ b/rust/kernel/acpi.rs
@@ -39,9 +39,7 @@ impl DeviceId {
     pub const fn new(id: &'static CStr) -> Self {
         let src = id.to_bytes_with_nul();
         build_assert!(src.len() <= Self::ACPI_ID_LEN, "ID exceeds 16 bytes");
-        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut acpi: bindings::acpi_device_id = unsafe { core::mem::zeroed() };
+        let mut acpi: bindings::acpi_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < src.len() {
             acpi.id[i] = src[i];
-- 
2.43.0

