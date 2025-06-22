Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A018F6C
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750590421; cv=none; b=IgonV1u909TNzQQyj9D8Q5rC3RT8lFwqi9ot8qD0i+HhS71DDSFjOEuhGdiZtiu5ii7q0EKu3izsTvu01/502b7zCzRurrwzPnY6+Ux8YwWxLSHScIlsAv8nNR/t65Swfolosz9gxx3g7tm/oUBbtaFmUGTn7dQh8EBl843ViYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750590421; c=relaxed/simple;
	bh=l8Od2HTxVWSX6nRTUVq0auUiYND751NaClfN2NPUIp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jh38LD5I1bCXp4WNG1w+WgfmdWKyq99DiRuhct7WVeOiyY4a3x+2Diyc3ANHNjP8yxtwzo19m+Cw96Kyl4SeGj+Py9ylVxESQlBPFS2si5NjX56CgDyAqHzySfjVrXPcUU2u/fGczNO8jG0RegbRZWUqg4SBsAKLfdv3FpIN53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgDy/3mb; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgDy/3mb"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1858075b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750590419; x=1751195219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+VljDDMKlZnyJpYfoDIrIAj5zLTtbtSo3AaIObR+xY=;
        b=OgDy/3mbKu0e0D+sKXmM58i0UgCbn7dTGfOFkROsIAYkfo7GUV9gjCRUnbypGXO986
         f6vu9L/FTTRapAmzXtLmRYkSovp0QbxFn4rAXscLtVJ6EWJRboMrD3gDk1R7pqXiLdTb
         z8gBczE/JTJd39sBtW7mRgdiQJ3Y/rYzU2RMNgpgMtWuFC1sQrJFL1qH6FXvLpgwliA1
         uY9kwWXA6z0fyQaQzGyT3HQh7vFa22UnncrRJe2yrWp4hyIZGmVHJpY0syR3HmXCcDbU
         SrdF6b+ezKtZ9yB8iYxJeipxIoVF6/evsiGxsVRJprA8KKVA75SHVTmN3tO68RsmNmGt
         de7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750590419; x=1751195219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+VljDDMKlZnyJpYfoDIrIAj5zLTtbtSo3AaIObR+xY=;
        b=dZLmCaq/1CL/lKfl6ZPq1WeGvenRilbTQhplFaxtPq4xdmdkvhngjhLAzfZ1GdxiMA
         rZmmCz/5j5Fe/srZ63rbPGVr88A94Ku5Qynm7H0weeRDN0VnfXA+k2zQsD0Z+f0bzMnd
         QzSAqUMKOX7SNoTB6gP+inVauDLhcF2XVJ6AbcdHVhrTcgHzV5a+tMLDGL80sKRmmXT0
         l75KDZP+rF5aGQEqOrjbupDohQjz/i6JhVCA/PNyv8aGNaOF5VEw1R8txvsnmjqYOAmg
         OmbpzuN8GwO6LWETkNtSamIgy8M1pjBiqQejg5Z/FmXkf/v2wgc869ooYhyggFNfciew
         HvLg==
X-Gm-Message-State: AOJu0Yw2CozZF8iiuq44k5X/sfYjCLHggjTmOz8FBpsHh57Jv3WjXsd5
	HFAO6/pwy9Ys4ULlNMb2OPTYT0baMjLOIZAFCaeyn+lyjiHDaK1fHkLr5f91THtm
X-Gm-Gg: ASbGncvZiXF7Adgoqiqz7i/ZpxPdqFOJHwfP2Bm8Pho7BDET/RLhvjhOX9hVfrxzXCN
	mxDyfYY65UqutufLHwI8hg+sJraWxAMwPNM8Qd92ydwZQwmMlhY6rnVslz02+8fO47YptQDQN9B
	lrrdKp6oBlXLlaM76UPPOkJsFw1J672FxZ3sCTIqy6zQvAK7knSN0ve6KwTF7pNKgWeFn1dFt1d
	ftIq12Wm1h5Ho+Kdxxa/8xNAlRcYffkXAKzJOaXMr/RqqvPxbHgKUZzx7oDy33wHtruJQR1U6Zc
	9M0IeyKykIAKp1Zi2iYqnATAyvPq7x6tdTNBoW+FbmLjogVxgUBAH5OnpZB5QAdbuSzrAcE9Igh
	O+tA=
X-Google-Smtp-Source: AGHT+IFHwmn1zIafGQiwX76i2Fkqn5urerFIH/bF8hshHAAHqfUNtNVdvt5N69Mq7PHQOrIqjJBymg==
X-Received: by 2002:a05:6a00:1990:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7490d74b176mr11965545b3a.19.1750590418587;
        Sun, 22 Jun 2025 04:06:58 -0700 (PDT)
Received: from shankari-IdeaPad.. ([49.128.169.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f125c50fsm5568260a12.66.2025.06.22.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 04:06:58 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	ossin@kernel.org,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Benno Lossin <lossin@kernel.org>
Subject: [PATCH] rust: miscdevice: clarify invariant for `MiscDeviceRegistration`
Date: Sun, 22 Jun 2025 16:36:46 +0530
Message-Id: <20250622110646.150701-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword and expand the invariant documentation for `MiscDeviceRegistration`
to clarify what it means for the inner device to be "registered".
It expands to explain:
- `inner` points to a `miscdevice` registered via `misc_register`.
- This registration stays valid for the entire lifetime of the object.
- Deregistration is guaranteed on `Drop`, via `misc_deregister`.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1168
Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/miscdevice.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 939278bc7b03..5df98dce019a 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -45,7 +45,15 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 ///
 /// # Invariants
 ///
-/// `inner` is a registered misc device.
+/// The `inner` field contains a `struct miscdevice` that has been registered with
+/// the kernel using `misc_register()`.
+/// This registration remains valid for the entire lifetime of the `MiscDeviceRegistration`
+/// instance.
+/// Deregistration is guaranteed to occur exactly once, during the [`Drop`] implementation, via
+/// a call to `misc_deregister()`.
+/// The `inner` pointer is never null and always points to a valid, pinned `miscdevice` instance
+/// initialized via `MiscDeviceOptions::into_raw`.
+
 #[repr(transparent)]
 #[pin_data(PinnedDrop)]
 pub struct MiscDeviceRegistration<T> {
-- 
2.34.1

