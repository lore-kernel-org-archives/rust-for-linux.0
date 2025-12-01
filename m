Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69149332ED0
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604346; cv=none; b=bpWFG63bR/t6q/VrusZQ6nDFKj3dex82WNEPQRKIX7h2aKndkZSnTLK3StTtEYT5tjGO3gZ3meP0lR6kVFXJ11K6eA+6Le6ufRPKHrI1lkzNB3tQhzIw7W3uf8O0xVnoGyh15m3+MyYbL2aLqTxrccPI1z/VxEouvbEgdGdadNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604346; c=relaxed/simple;
	bh=XGyeeigAK9L746tngnKMOCKOk5BQ+hWN4+EJTlSpqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjiaAyx+UDGbIB8eMbDEGk5+zdCu2BXmFl0qP1K65pPSPT4rYaT/EZFvuKv96dIYiq+PpxfdL/d6BxEfpkV4BC+qrSSXRpS6Uz9jH+wX2S1T4nypmENcpsrY05V96Gr6+YZOgcq7dGXFYW93YWIYX1AX2ijmc17jKgf9WtPqrOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImMRwE8b; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImMRwE8b"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298287a26c3so52330235ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 07:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764604345; x=1765209145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVKsqLAjHiedCsMTkQj6KU9uWiG9cI4IM21lpckerh0=;
        b=ImMRwE8b/Fjc5hCvvFAs4/MtNwNQvIsehrcYoQ34UMRmy88hdHkudaz7hVav3ODsF0
         +g4Bwwgn8XF0hCzld0EGWArZ3iqa1lsew9wgUzez6dRoFp4z/8BNBv0MAd0vLJ4BvAsH
         /o5/8ChQ6MPoYk+/b57KvLOMxJKHLUq4cEygNReIukWJOoHUQoqpmWzRx3GPy3MMrrdu
         OqhhpXUemzCDpYHlGAVjJCHyUzIXi1nNBXgKmeuEHcHMx2VhRZZwrChRUqlGNoT2GdeP
         SM1HM+C7Tmxw76LMztzqmx5uZKIqX5ZtFNiohpc+Mw/AHos0s8VOn3ds4VarKXEzR2Ym
         hwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764604345; x=1765209145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVKsqLAjHiedCsMTkQj6KU9uWiG9cI4IM21lpckerh0=;
        b=PFQMii8B/SEhY4Z1AZC7mTb19SjHx3toPgU/RSI4qV2zrRDJQc5V1aJJ6/pk52u+vq
         EN5SJaAzfXHsy9kpV8y3fc8Obq+Vs7+umSFfW6myGAq3Vnnuyk38BZSGZdcBjQuOX7ko
         O5O8eEP1QNYfbHP2y4Ighss/RaYN0Dz0SWh1gXJdazotWrnesp55KPr6tY0jBWNA7sKz
         72xzF7ZEJLmCTl/XSLK3RlmQrn5Wu+WQgbgHYTX7IrFnFAYNlSxW5e9R7q/+5xLkjEJD
         1HqYAcbkrzzf+UgAxXyD3svMF7iQdVkvMHS9v+XYiBqeu5HjabkZicIAO+Rnt2wBG187
         Woow==
X-Forwarded-Encrypted: i=1; AJvYcCVn9kW+0++LgaHJa3o5XiVKcSpK95GCh/L7tvEOV4K26PAdebB1gL05ouU9ZXqM+DwuIPBeEwXd9nizHINuFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTX3Ik504yS6krTLSSi6gaWGPdmCfgUv1UDPNHpKafFpfDasd
	9m4bp31cfsdpEwmiiV5F7wQXDJUuw5vY2UJz/viBaxK8CkuuojYg/ynC
X-Gm-Gg: ASbGncufzyidNR7JGSl0raL1qCcDfgQELjpiA+kIhLHtVthBduFEReL4z/iAIuykFKv
	FIvmUzkhevcxvEAsc5nz3PmVqnKsqHuhcFSIcb0ARaV3cR5Ohqgtuc+3a1wRnmoXp67UVOXUIMM
	xc3GR3UYUIDh+VLyiK1J+4+TlqRneNPAnAPjm1gNvv1ld6Si8dLuiE+wmwLEK7M+7e2jN40QOwm
	5osfO4U6R1q/4KxrZKSm/5aAs1ZyZGshpj1lYcmFhEJT+Yt4C1w8xlqhpIZaNAc4LRJtmWwZ3IC
	tOhd9oBDitBTDtak/dMPTuJb/PxELgeR7Ma+8q+WGXMqHVfcBJhAVkACfvPitJ4Wn0vbSU8ukAR
	rLBBOUQuOGSqjIr0XIiv2xZ7RLi5qhzg8QB6gULxNLjXtWXvKvYCoaafPdtmGyU26ZpYn8QgAX3
	lPZuO7rvOTby12fRTQKAilZ/bzKleTCK7IGYQ3rOyIC6TxQPzTlfGrT/AquMIz/AQV
X-Google-Smtp-Source: AGHT+IGat4VhF83+oMq7CNZLZBFhrHJD09jfouaostnsMQaYHnfRxI2M9f052yuItSKVu6dT7hxfmw==
X-Received: by 2002:a17:902:f641:b0:295:395c:ebf9 with SMTP id d9443c01a7336-29b6bf80942mr448394395ad.55.1764604344552;
        Mon, 01 Dec 2025 07:52:24 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb5442csm125777105ad.85.2025.12.01.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 07:52:24 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-acpi@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH v2] rust: acpi: replace manual zero-initialization with `pin_init::zeroed()`
Date: Mon,  1 Dec 2025 21:22:10 +0530
Message-ID: <20251201155210.22710-1-atharvd440@gmail.com>
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
 rust/kernel/acpi.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/acpi.rs b/rust/kernel/acpi.rs
index 37e1161c1298..cc98b36b90a0 100644
--- a/rust/kernel/acpi.rs
+++ b/rust/kernel/acpi.rs
@@ -40,8 +40,7 @@ pub const fn new(id: &'static CStr) -> Self {
         let src = id.to_bytes_with_nul();
         build_assert!(src.len() <= Self::ACPI_ID_LEN, "ID exceeds 16 bytes");
         // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut acpi: bindings::acpi_device_id = unsafe { core::mem::zeroed() };
+        let mut acpi: bindings::acpi_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < src.len() {
             acpi.id[i] = src[i];
-- 
2.43.0

