Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D72DCBF8
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Jul 2025 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752848457; cv=none; b=fvonaENT4uab6DExmjyp136gRYIe8ZIC8tlw0x6MVKx8uD4QhNrJ9EXjaekO9wXE9EoxYiYShEDIGVKmzPlXWBLXtakhXze392eF89qB0rOoidNixE9A3XmqFjPfUYygl7hZSacVb9ej5wfq5mqbvq+kFhW/xbsW0nPcWywsZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752848457; c=relaxed/simple;
	bh=UR/3lYqWlr6+TFIphcrSb08358WsAG5Jc3tmyhuBNUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHHwyMESysDTgPWZ7v/76cF4AhBWSD9QdkJsRSjNO0K5ybJmCP8DGuhU6O5K8ruI2pfXqp8Uh21fkLT6sSOh8QEIZAQUMPzj2C/54R2kHBubd5EWz8Uj3mokuC9RtS4hA/Krk72x5VSGfDbsIoMmU90UYH20b0/p6B+699dw92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truongsinh.pro; spf=pass smtp.mailfrom=truongsinh.pro; dkim=pass (1024-bit key) header.d=truongsinh.pro header.i=@truongsinh.pro header.b=dgvr9Rs0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truongsinh.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truongsinh.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=truongsinh.pro header.i=@truongsinh.pro header.b="dgvr9Rs0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23649faf69fso19648875ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 18 Jul 2025 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1752848455; x=1753453255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHc6EgBSaCyhHUt4iMs1slcS/3iZ0njcmmeqo15tlyw=;
        b=dgvr9Rs0cXzqBZy48+wxsP50DX+Du2DdZQo4blS8VXuqAthHGQOCVp9ivff+q2fRHs
         LcCYf2SQAQnLs03Dfe9/zkPeXeavKYFqgtZDalYQ3RLd8/x8jzAupVtGzYCX/pSl4zNv
         yCTNEQ2UIncr/wM0aHeei9K9rItci6YIaC6uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848455; x=1753453255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHc6EgBSaCyhHUt4iMs1slcS/3iZ0njcmmeqo15tlyw=;
        b=W5CQb4LW8XnhtPYp11rpos49jI+gn92ViQqNNPXYLV08YJCQf7ZKbsCZtxwdN4HvdU
         hIQcuosF6p+64fUSpNCg1eoG8tZ9hZv86b2XS/Jbex9jq7f+qmG9u3tbMX9WhgeqMQDZ
         74MJDfFrw1pVLSCYY/DVqtaeZTwHi6Fqs2aKpCZxyhb0gz9Xfs+FgQCeO8VPEITdhwq3
         s16qUAQFN9drRCmUd4JOg/1X7Pl7txtO3N0sZGqLq4g5hlYuvxzQ5rxbR/b3MgTDinjD
         dYIbg9aE4aQyUSeefY2qMfgbPOwKc8V2GvrLHaTn8Yd+ewOAEftHxI5+LpP8Hi8QUuzw
         LQzw==
X-Gm-Message-State: AOJu0Ywg0llTNQcETHu9tFKaLUHKyxFOTU1UHXOLnQWl0fE5cPnkhHEj
	fNYbtq2t0Qja2c4YcM3d5BUaBP2JzOTk/7SkPD5siyuUO/gp95PeDTD0qTWpELoQ/6sE6NoKnGw
	R4Gmy/TlVQw==
X-Gm-Gg: ASbGnctk08mneow0DLVOxJJXq9rrxHQs2tkMUPmSTp2rx+uuwVhx491jKX7ET2CrA85
	i9w772RK/uK/9m7oIleoVyz9NZzwtQIsh8PfPy29CuNuIVud7J+DFC41DLLtB+cnUYqMekxS2uM
	Y33IBHxqWu1S95YY7igAc54/1+XYo7NRv9Uo4APAmw/xdIb7L7M8lbcLxlaPn/v1zW8IGnmArW+
	ebyszes/wHBeYp+O/VJZHS/b5xWnO8wiAK3BKpfJIuBXf2XJ2g4MbwrsOLg1ywGdWj8n+bl3h7m
	eu/fMVhzB/Ha6vz+hZJhicflyGy7Fiv4GTFdk7dpDob0s+FH13AlJlIQlSBSMeJx7S8+Y2XGg2f
	gLuR2XBeUfTQfc2MeydDXKqEiErGlL6jY
X-Google-Smtp-Source: AGHT+IE8URDevzEmHo34O8MknMpqxByTBGGoC9vivJaSg8dUHx3zY0Y6AH3iU7VKdlP+uWE4s+hcvw==
X-Received: by 2002:a17:903:3bc5:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23e2575a8d6mr154254985ad.41.1752848455514;
        Fri, 18 Jul 2025 07:20:55 -0700 (PDT)
Received: from gti14.tail9399b.ts.net ([71.212.150.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d5asm14070575ad.15.2025.07.18.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:20:55 -0700 (PDT)
From: TruongSinh Tran-Nguyen <i@truongsinh.pro>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	TruongSinh Tran-Nguyen <i@truongsinh.pro>
Subject: [PATCH] rust: Add #[must_use] to Lock::try_lock, GlobalLock::try_lock, and XArray::try_lock
Date: Fri, 18 Jul 2025 07:20:26 -0700
Message-ID: <20250718142026.2232366-1-i@truongsinh.pro>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These methods return an RAII guard that unlocks the lock when dropped.
If the return value is ignored, the lock is released immediately,
which is likely not the intended behavior.

This addresses issue #1133 in the rust-for-linux project.

Signed-off-by: TruongSinh Tran-Nguyen <i@truongsinh.pro>
---
 rust/kernel/sync/lock.rs        | 1 +
 rust/kernel/sync/lock/global.rs | 1 +
 rust/kernel/xarray.rs           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index e82fa5be289c..1c2ddade6d6d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -175,6 +175,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "the lock unlocks immediately when the guard is unused"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index d65f94b5caf2..fdce038b5e0a 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -84,6 +84,7 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
     }
 
     /// Try to lock this global lock.
+    #[must_use = "the lock unlocks immediately when the guard is unused"]
     pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 75719e7bb491..3cca717a3cb4 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -118,6 +118,7 @@ fn iter(&self) -> impl Iterator<Item = NonNull<T::PointedTo>> + '_ {
     }
 
     /// Attempts to lock the [`XArray`] for exclusive access.
+    #[must_use = "the lock unlocks immediately when the guard is unused"]
     pub fn try_lock(&self) -> Option<Guard<'_, T>> {
         // SAFETY: `self.xa` is always valid by the type invariant.
         if (unsafe { bindings::xa_trylock(self.xa.get()) } != 0) {
-- 
2.43.0

