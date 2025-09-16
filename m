Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625522E6CB5
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019134; cv=none; b=VSD7aWN+9jKKUYc6R+/rln2/FRIPCL35KaFyF5WRQVLcnS+hn9wNGJRXDjSEcByuXVnA1vyKWyEIundhTWqEnWHPfO1ArtIFIrRxXRiH+XR1exr3eO/+NJnIF5l8dRcEAqnZ5bpTJn2FCc9EznsWsMw7abT18ffmToS7rtM3y1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019134; c=relaxed/simple;
	bh=fQUUkOhQmmCC6m91ZNRljm8byQCPbXUd4rBcIXzTIGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CX+j6dPJ5G29RJUWkhcLmPQCXddRDLU/iJMBt5HYrHVx0smIrR3BQsb4M4Nh1Ulg/Xu9bVl8Um3jeUDktjFNEmjsRrS2otI+A2d2nrzFRyKWB4tRHRPhKEfe9+hkcPhC7CCU+DrM0EoMNRte9pyIVCQYSH1Ls5/EysfIh+DSN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tbq6pb5K; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tbq6pb5K"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7723f0924a3so6477798b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758019132; x=1758623932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JEmdwk5PDuo0ptW6KhEWo51Ba8M17k+tkrZHbZtMGw=;
        b=Tbq6pb5KSrkw71cM4ibwtUhi6pDks7uPfSL7Ljf9r8JKplbi2juWWWsaDJiZjcYqZA
         /IIj7YN0uGqkSUoPphxpWa1km02aXv3fCdoBLG3QGIcaDZa3Ko1ioMPE48TqlEQktYue
         zMUrpCdAWtFZCbVfNoLGvvgw0D74DhO20sPRkFmjShJtNdQYNR9i/HtW6P/5itG68vYs
         8VJ0pelGvl9lz2ZIKFXkCTr0HxcrGskwgV9gqYQFXUi18BKAlJrDXL6k2e0a99s8ZC53
         7PcgmplV2B2x5qA2BArEJ3fWsF8nvn5j8GdDTKs44AxfTuHl43RxHMC1mlldiFEHPHp7
         ts8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019132; x=1758623932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JEmdwk5PDuo0ptW6KhEWo51Ba8M17k+tkrZHbZtMGw=;
        b=XbYiDW8dN+DvF/cApm+7ELdHRS4uBa+45Yq2p+GrqfAgtKki44hi714QD3zcg9mX2p
         SZpAOTuQH6NooVpfwBaC0Vu7X4k5phrbbI//cHWU5gwI3fTFWLvJmfVgoZrQKqeKAXtr
         y9ta3YZFVWPunqSuIarsP9T+m6YugXI/TAHDkquidw6c1o82iSoLR6eU9e36/p480exP
         RCkhL2Xihw0RyxDzNhKjMWhD88j2Sg4Lj4AW2D+mm8m6Hns1XqBg1ndfEzDsgrA/6fKv
         S+7TmBoMTSo1DtrXuQauz3OwLQ+fVBPho4NOkZ1308NkR6lnwN6ZAOIKVBygYCbg1G0f
         fKOg==
X-Forwarded-Encrypted: i=1; AJvYcCWDdic1BDHL+C/ub9k75AS9p0tv1zpH9NDFmgbu6HK8KtLtGiHgQosvYJhavU4v3Ks4r+uJln1MB6h16YD4zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjknWChBOif27PIYaoRNrjvOaq5NA2VMgFxoW+4YCb0+kfeOd
	tChJpBlcwYh1Bifh/0G3fX9lYKG/BAzx6TaBKAJUEvw/OvhqfcGJENI=
X-Gm-Gg: ASbGncu3OQMl6MH2LDBx4VqcBho/V0lpoah1zJrwpbmOyqGsSPIjwOBm1BdQDpDfpP0
	zYR8KEBBitFBMR4DwvDCoy94Yw98nZYKtgX5af5Q9M23gPx14lAVlQeo+d7qU+jhQrwJaA1tGao
	ZlAY7b7vwUM7YtkdL6hJNWnAA2THp0+Euxe6xW07gvQsbFcb6Y04Ljft4uqoXA+1cRX8PRwgvNx
	cI9c6AAxj1BhODMLSwlaazpMqRYC+PqTMk8Q+YYW1qAjZbFVWCDHwB2r40nShHjuzQ6IYLZ5GAg
	HSIyqjF9gy4AJVERfjVnn+EbSZBHhfN2+SrD9ivMzM5zNsGjYyDyv8K5y+CmOt+8ODxOf8GnuQz
	ukXw2E7snglLSUTqpdOMHXVsdmULGsGiPq58h6oHWimrnQv8GFQobaCoAa+3so//WIyEZlSr2XK
	Q1Y7tadOf56OIIrUsmF8DB
X-Google-Smtp-Source: AGHT+IGgntFeqlFJt2FVnZrMvo4YLsqqcUo7P0ZDCpRS98MLHdkW+VcUerx3r4BZs7mmj6AIYsXfNQ==
X-Received: by 2002:a05:6a20:72a3:b0:250:9175:96e8 with SMTP id adf61e73a8af0-2602c718d10mr20502990637.45.1758019132475;
        Tue, 16 Sep 2025 03:38:52 -0700 (PDT)
Received: from codespaces-8c10cd.3gx5x4kts4veljes22u4ri2f3b.ix.internal.cloudapp.net ([23.97.62.149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35b8cdbsm14027994a12.8.2025.09.16.03.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:38:52 -0700 (PDT)
From: JaimeF <jaimefine6@gmail.com>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaime Fan <jaimefine6@gmail.com>,
	onur-ozkan <contact@onurozkan.dev>
Subject: [PATCH] Fixed "initialialized" typo in auxiliary.rs
Date: Tue, 16 Sep 2025 10:38:38 +0000
Message-ID: <20250916103839.17202-1-jaimefine6@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaime Fan <jaimefine6@gmail.com>

Suggested-by: onur-ozkan <contact@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1187
Signed-off-by: Jaime F <jaimefine6@gmail.com>
---
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 58be09871..129eae8ff 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -317,12 +317,12 @@ pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Res
 
         // SAFETY:
         // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
-        //   been initialialized,
+        //   been initialized,
         // - `modname.as_char_ptr()` is a NULL terminated string.
         let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
         if ret != 0 {
             // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
-            // which has been initialialized.
+            // which has been initialized.
             unsafe { bindings::auxiliary_device_uninit(adev) };
 
             return Err(Error::from_errno(ret));
-- 
2.50.1

