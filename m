Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DDB264A92
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347034; cv=none; b=bLnv8rrraTzO1Nnsj6yAMwMCtOT2zaNFTIyjoHAzVQyjqY8Uz0HrYb/RaFP7FLft+9HXuXI02k5q2N06u29HwKgw5Tv4zT+KLhjAfBSlo4M/BhWo4e91yiVd6k15hYqq2zNFf3XhdGdX01tSjP2YfCM5R3XKvI0pBV7/5rN1zNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347034; c=relaxed/simple;
	bh=8AJG5yBQKWcDE55dMkXjua1XYUKJh+EXVL9l65F7nDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcBpUyRnwfXbekZc3rEfwaK45fpMWrNllqEcCNj+XUZQzE+zb+zVEepnWbxuFkcXkUnRWCFVQs4FZBCJXlzKnrj5/ZY+0mYA0suy3hbnOQtGIpHZzRwYs68iDlYgcp7r3O8Nnyewczut7yoAK4TX1bDvJnUXS0lLCkimUUYBRMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9Fs65e4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9Fs65e4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so2175296a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764347032; x=1764951832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYqWf7Ls1zY40ncijRlKULYV9gZmN8aGNLfyhjOpiow=;
        b=V9Fs65e4SKP+a3uiyWJiwjtuPZ+PIpUsMTVgFmIACgyoblqFvYyhdFKpbcHZ1Do1ao
         4xZLTVTXSjjiYyLADP1B/6h1UsuyzxC36xUqIfu0NoyCOx2NgVZe7WIh5eqANq0eNE2z
         YPrXaXvChovVM3lmOpvaoN/wVFeu4U2M2WX2X+iAouSlkOCJ5DGCgXQI4lml3TtKJIZt
         Bno7XzwHDcV1tr4SzF0IDf6MetyhUOk13U2HH6wsXXYEp+oGkqt0q4hkrUm772rb5J8M
         LNWjMB+VJXPQYYrCy3u0YXkGs9YtQiams42gig6qxz9iJBlzm6rUDPCRbXY95fRp5TUR
         NRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347032; x=1764951832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqWf7Ls1zY40ncijRlKULYV9gZmN8aGNLfyhjOpiow=;
        b=PNgtTNKpqWKuPsiiGUX+Br2O1w8sK+qvC+OCmdyZ6wBILLA3TvrULTTDEzh/dfeieD
         N8UAaalTu9BktGdA0KvVzNS1tEdJymkImj4tnWBmVDLeDc2auU4AydyXR7b7aCHubjfq
         j5+fV56J9hiRHU821xcm/ZXOj0/1hHOooevrktRwH/G+WpYk1oYRib1gR0+raoLRaLpx
         Kq4TAI1xyjtNutC/9a64uwkPytJ/m+TbFkvbQp79D10fZwHCajk26rvXVZgEgAGMZmOT
         1Qli7DY2fjOJoApOLYAqMv1D6xiQfKuGUrhArfjr0+1/YpQpkJqricBqxK9CUdadrX7Q
         QbXA==
X-Forwarded-Encrypted: i=1; AJvYcCVIb66khp2scNL6ReNW3zKaeEMxcUuSfl3xDmkpg9mfFCY9AzQST7rgKO8fGpNCgvJa+xN1zTppute3Wf71/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfWwteo+hgLtPoGBt22V/f224DTcty6wo4DUu4evukCNHj9ux
	08TuQoozqRf98a9OaOMpwPPM7qkA7mVU8pSmI9FIiKOw8wf3Xt8gUMuP
X-Gm-Gg: ASbGncuFOUlj0jSH/FF+VDStHDH8D2ZUuVBVc3icYnMtTkvCdaAM9cfptyzrgIP28G0
	EfKzDaH40khNZmc9qdo2ved+1baste1nk0Qh3409lV4wY0Cru/X0NtAk7SSMUoLOd9D2NSu4rdN
	UJrzwEy+pFIvtVMIcB4qgU6vMv4235awsg3C4KtJgxAuWuqc1CXYpFhk+IfzbgyXXYqpKmgoPei
	AYu+LkK3MPXWKj4YzCmqbZuOtD4PiHI88HYr6FDWkBpOC5vj8BI6B/tJtqd3iP18RtFXMPKB3H7
	TrsiHKHm+UyQFBm0q1Ck8tp0MSvffhmX2GzuGRKMoo5paQnEC4Fu40aZ0UIfl38F18ppf7GHZhT
	ePlnldPpr8fvsg6Vj4t1a4GE4Nd9VVuiDDsldNqGQLeTTvY8owHsOnljPve/iW38NVeCzaD/VRA
	9H0autuLLx8BY6seAkXZCZeks9wj8fyYTccI9XlXjpMnSDyoQomkOaUWZ4zdm/hKNb3QKt3JYOB
	RE=
X-Google-Smtp-Source: AGHT+IH0A0s5mTjz9DmmYHjnCO3MTihjYmffYdYW00NMAmeSgGizWYLIMeWLhrh/KzSycZ+Knn6LuA==
X-Received: by 2002:a17:90b:17d1:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-34733f2d167mr25371515a91.22.1764347031995;
        Fri, 28 Nov 2025 08:23:51 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b732e5dsm5218978a91.10.2025.11.28.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:23:51 -0800 (PST)
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
Subject: [PATCH] rust: miscdevice: use `pin_init::zeroed()` for C type initialization
Date: Fri, 28 Nov 2025 21:53:37 +0530
Message-ID: <20251128162337.12082-1-atharvd440@gmail.com>
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
 rust/kernel/miscdevice.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index d698cddcb4a5..e168e9da8f4a 100644
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
@@ -33,7 +33,7 @@ impl MiscDeviceOptions {
     /// Create a raw `struct miscdev` ready for registration.
     pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
-        let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
+        let mut result: bindings::miscdevice = pin_init::zeroed();
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
         result.name = crate::str::as_char_ptr_in_const_context(self.name);
         result.fops = MiscdeviceVTable::<T>::build();
@@ -421,7 +421,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
             None
         },
         // SAFETY: All zeros is a valid value for `bindings::file_operations`.
-        ..unsafe { MaybeUninit::zeroed().assume_init() }
+        ..pin_init::zeroed()
     };
 
     const fn build() -> &'static bindings::file_operations {
-- 
2.43.0

