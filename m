Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F693081B1
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764418528; cv=none; b=q+ufMMcPKsGF7/GcSxkO3ImTSF1zhlqjrIUFjAAbXeDvcnCz4465L6J4u9Jn2hYny1xs/axqNUrvsQf01XABSOIxUy5CAOTYr4cCXjAPOXBHOr2JalUNieK5Or3bInB960fTRgqClcJrR7pBFCWadP/IAEyhndLmQDYklK1BH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764418528; c=relaxed/simple;
	bh=xY0uWZHryLCto/bq7hjsFu2HnqYzhnHE9bfKCs5x3yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgKPpbwMOGhar8BThFWuB+pjLI+Nv5jxx5PpYCcjOEKUWnjOvy65VF++rl9K87GVExXh7L3D9xGg/L/d5CQ0EWaPv/SWANGdkaTSVWzPe8hPmvcqa1n45KuEXfBG8t87XnkZyRceUZ38+l3jozgj5U6FrRtXLY3dEN5W/lpf7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP+0Dr7o; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP+0Dr7o"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so1805277b3a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764418526; x=1765023326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHfM4Xy0kC8kiXxllr4QHorgmLl9IzarnsBKUByCQ+4=;
        b=DP+0Dr7ofDSoqRo5y7Ks4lIIwq/V9G3dMBar9Pb9zr03I+tjGr7ZwVw0c+yiCVeyff
         NlexUiQtOwo9kFT5c6RRHfCTd1rmGpRDi3FrYto+t1OXREORIinuj9VZ8JVjT3osG4Oo
         W24Qcp5TkuZDUwwSD+E9VI4RFXZGzoAQORNw+iAWR/tbrjDHt7vw1i1Pv9pgdxVg32gp
         9pHZB0iAQWEc+JNoNNEvVrx+FjWCHidzFLwSWRxZBh6pXlpFJKxUEAurVvSzmCtIXrf+
         0iql4LHLB/Z8R3WIxwAK7e6KXNhDp+jNt9XIRuAIbq8pPwtnKsmq98YDRHB2dAEGB3o7
         yjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764418526; x=1765023326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHfM4Xy0kC8kiXxllr4QHorgmLl9IzarnsBKUByCQ+4=;
        b=o675XysKTRQLXnne95/sIvJK3rrDDjrotQm4AxWhC1IGdPsuHBWwq6b6jldYXcYjv3
         iV4PARcBO9yp+YeMRy8q7wQoYgRfQupQ0HRfw4LdZ4umSqQWoqcpbJO1G8gRZn9Dxhxk
         m77IjA/F/HDfeyxjr3vthyFfP8jvkzHUJBllsRCr7Ynxyii0eJQfUf8u1/9HD3ZlxZEo
         mIp62+aJr7seanPC8P86YyHBiTiUXWtwo2qTm/t9yZP5SWRc4gDGzhGQoHnx6kVjdv1h
         VlpDyCwVzlYryLAK1qjGotYn9x20BGA9o8H68K0JgZ+ptf2iLwyBFf7ieVlKMWocHYpF
         1gog==
X-Forwarded-Encrypted: i=1; AJvYcCWCO2CfrPfmkT/X5plVyxc6evCLMJ1KAjkrOxZ05dMGNOd0uU8fK1AgqZArk7ywvoAJV8GYj905AvokhRcyPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSsUxi2ROPCi9jAKij/MZ6efRj9IW8DJ22vrVUJjoaQ/qm6m7V
	fowFf1TNdauxCdAE//ERszSY2R0wLlmwpNJh4TrBo7u0JSzm28SBMmcj
X-Gm-Gg: ASbGncukV68tz5GHN2SqaMywHQ5VxFhEI+ndr41HRje7BFlxsf3J0entiTsSGmKb/ot
	eu8msycDWya0kLCE6OsmY9WwdYeUpEvIByKGBWos/uLj+Bh5eUAbzcLsjJ+nb+znQMx02n8awuh
	JWbQqwX+cE01bhq23hO1pHuJIYTDBgVDgcTTIgCG3HsWxnN+7fUhNs2Nk/YAwgUfAM9EvjjIhtX
	goJh8f4geV9RxEnVFDKAEdfoF6/ELey9xJtNvZIw8Fmq8yrjvjU2E3NLV6L0mXkOIrYRoKQ/ulq
	4UVhh5096GzE6TpmPid1gaYWi+klZBjtplZlIWOqF1ub1K2fFHjgG7oXzuWC3ao18zuhFlZopqc
	VE9gaNFMr3oi/GAuaHswchB720YD4Rm5SX6bpHmZQT7qEGb/4WNZGxfVKW4nT9x/CfPHgLuukKb
	5CI61CW6pJ2bJNSl8PaDTxmPSTFYoEFB8ZBIBlNFZ1lL0ko5/5VW5q+e2fVzSLkfF0
X-Google-Smtp-Source: AGHT+IHuaKornl3F87kZqBy2wb2ySuqsQ81vIH+V1Eri71hS2x8Lag2ULOa/Xbl3KuIq1yg+grXA6Q==
X-Received: by 2002:a05:6a00:1a8f:b0:7a2:8308:3c8b with SMTP id d2e1a72fcca58-7ca879e80a7mr17623751b3a.10.1764418526157;
        Sat, 29 Nov 2025 04:15:26 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e7db577sm7858615b3a.31.2025.11.29.04.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:15:25 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH v2] rust: miscdevice: use `pin_init::zeroed()` for C type initialization
Date: Sat, 29 Nov 2025 17:45:13 +0530
Message-ID: <20251129121513.20738-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual zero-initialization using
`MaybeUninit::zeroed().assume_init()` with `pin_init::zeroed()`.
The `pin_init` helper provides a safer and clearer API for
zero-initializing C structs without requiring an `unsafe` block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
Changes in v2:
  - Remove the Unwanted Comments.

 rust/kernel/miscdevice.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index d698cddcb4a5..ba64c8a858f0 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -20,7 +20,7 @@
     seq_file::SeqFile,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{marker::PhantomData, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -32,8 +32,7 @@ pub struct MiscDeviceOptions {
 impl MiscDeviceOptions {
     /// Create a raw `struct miscdev` ready for registration.
     pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
-        // SAFETY: All zeros is valid for this C type.
-        let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
+        let mut result: bindings::miscdevice = pin_init::zeroed();
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
         result.name = crate::str::as_char_ptr_in_const_context(self.name);
         result.fops = MiscdeviceVTable::<T>::build();
@@ -420,8 +419,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         } else {
             None
         },
-        // SAFETY: All zeros is a valid value for `bindings::file_operations`.
-        ..unsafe { MaybeUninit::zeroed().assume_init() }
+        ..pin_init::zeroed()
     };
 
     const fn build() -> &'static bindings::file_operations {
-- 
2.43.0

