Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1822248AF
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424132; cv=none; b=gS8HU9VmLrRVw3V12zVdK62kw+MBbq/II8+2HXFU+f3sL+6vNs3i/u0nzW3EZO5GOIUH8wa7iOxkA2o8gWBzkAciWysnL0lBAT6xMZyyQPv6cUP8UbBTXQsInw4EKjn+E3RKe1sPwviRw6F1DMQYgdWuw2zCBW9fn1JTvqP6oRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424132; c=relaxed/simple;
	bh=jmUu6xbsYwsfwkwRQq/SZSPyHQLQlvD3adzFp4XDnk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNPfOQvu9khc3LgaKzs2IxNpjsVU7IOmatU37eCQLJZD0eTwoUc1Y+6JxzHMjtw+l4/CjDx5E68ZC1+x462cOKFpKDBS8Rl6eghXZ9Tk9l6276yY0564CeiKi3a04HuzpksSmkrShXP7YT+9L2jWQh2OEDyAHQprUgxSkn4H9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYUu1euD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYUu1euD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so2619346b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764424130; x=1765028930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxF0XBnGH6LB9r496VOLJIF8yF3YVeU0DcCoOsSq/us=;
        b=XYUu1euDAlayAY15ffPUsEiB+jExwIiMLhWPkgFNdH4r6sAZtwnvHTZbOvqDDLI6V8
         1wR0J0YwupSwR8dJxMmWOlDk1Xa+kSR0A3jhkOJB7NhVo1Da4Ujg0mVdl0zQmSxIGfNT
         iT+wZitwte6Em7pRVkZI2Zisk8hcS0p+LFMLZPFnoulNKOlnLgKkbJaM1hmUNi0YyW6k
         SUryiFaQGTEGMftZCs8LtSZ7K3lBGAMqis5Md1n3W6zoZROYDuE3W1aVrYNICtIZ1RCe
         TVjyQFHa8E5HrB57sZj8gefwurd6LUBeTvUFJyRaWHDoGhZZk5LNaXOf9qVFI6P3hvk6
         R4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424130; x=1765028930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxF0XBnGH6LB9r496VOLJIF8yF3YVeU0DcCoOsSq/us=;
        b=pn1+Qg5307mcfFoGP15TYCmmHJp4srlZRK5pRKGfleyIb0Xuk7KWEAcdcV2nHyXAXJ
         jM+lGwZbCkA8Y63NeqSKlmBmd4LI0Mv1u41AKCqVlQz1h+zJN1qUXmDFeXsInX3EkTOJ
         GjD9L/eDb/Ju1ow3guZ+0zy9XwXHfd2OEJ/H8pFZb5wnk7f7Q8L2OJk8xkWAUassrDIL
         ILri6bGPkWPb7PDdm4TA9x6xUcidfuNgwH7mc/dha5uMvQCakvotMsyNNmCNb55KR7ME
         g0tZ2XICg3zjdnv6kvunLvK3N6vUO+G6zXQptdr1yJjX4ClrFDUJRpGF7+7unAIrOc8p
         4bvA==
X-Forwarded-Encrypted: i=1; AJvYcCU71/k4V8MVmked0bRhgusNSjqw5ALG+6YoGV/oadgxNizgYDXyu8aQRVwl3rIq4Mkk6HDpgMpe1VLK3XGUEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaD5XMdPBe/4tPrn2iSF40Kymrp1DOrDeMyM2frRqvng++wuv
	olg8PCjtJqSCsniNz7rfFNxB31gW906BjJ6iOkM9gGCTHkNv1HPW8JE3
X-Gm-Gg: ASbGncsbndN4vZTv4h6lYAFnX3O/bQozGU6xnSsl1rqkiLF0isvZgJOL++cBY1r7ycJ
	FZT5uK8DW6XGOqbc7G+gx1wqT+2M4wihSDEHoFA9tGjLN42+01hQaCsVP04txA8VpxLa/wO2s1O
	SN3rT12miKrJ8t2ypqr26hUWxyd8OOKShxfwX6o2tSQGesxhbnOlcChd08UhuDzhm+Un7IeTtaR
	nHLJWDyhjunb2DODwYhSrvzVv+E/S1p/mX5l9cljPEyKyPSSwFpc+VLjKUWDRwQUUJH9LE5sFNp
	+CsmXPWTNcqeqdy4uy9BQYaajqAreqnLGj8DCEEkkF0M2zwyx5uXq6aIb5nX9xsPIHK4WV83xa5
	gOp7rCNckQ/I6CMVcwKrWA5aCIYQUj9Yc4/vtF3sDrOZkrIzNygCE6NZeCMp4xHDuaozSvMNqPA
	oaOPyXiHstp9EJutk8vKPrCeGfqoMah2C0Ykffq74+dvdIIZ2d/CdGLSg+nh6LD7jF
X-Google-Smtp-Source: AGHT+IEj/pGfzV/wVSjqFnk1Rp085zRW724FpSRZrypf39X/AxpERM/MpTy8vTxQVKLagBZNvo3B5w==
X-Received: by 2002:a05:6a20:e293:b0:33e:6885:2bd4 with SMTP id adf61e73a8af0-36150f058ffmr35905235637.29.1764424129965;
        Sat, 29 Nov 2025 05:48:49 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151ad4d6esm8084743b3a.26.2025.11.29.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:48:49 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	dakr@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lyude@redhat.com,
	shankari.ak0208@gmail.com,
	lina+kernel@asahilina.net,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations initialization
Date: Sat, 29 Nov 2025 19:18:34 +0530
Message-ID: <20251129134834.34559-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual `unsafe { core::mem::zeroed() }` initialization of
`bindings::file_operations` with `pin_init::zeroed()`. This removes the
explicit unsafe

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 30c853988b94..c220cf1966fd 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -298,9 +298,8 @@ impl<T: DriverObject> AllocImpl for Object<T> {
 }
 
 pub(super) const fn create_fops() -> bindings::file_operations {
-    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
-    // zeroed.
-    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+
+    let mut fops: bindings::file_operations = pin_init::zeroed();
 
     fops.owner = core::ptr::null_mut();
     fops.open = Some(bindings::drm_open);
-- 
2.43.0

