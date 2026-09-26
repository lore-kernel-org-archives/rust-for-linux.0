Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092D3839A3
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444016; cv=none; b=lZ6pGWZ2V0eirFNABqI8RIRx/56nMXFGipw/5zpF2d5x0Ml110DeMmnp7BY838FDjKIAgUkNv00bqNn7XG90tTmD88f7fcfIvf3DkYv1OAlbwv7KaAfRDjCOUwmx3EzUkLrPN7QbUZW6obQFL8FR7jUOfCyqRezdrvgQwrKyOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444016; c=relaxed/simple;
	bh=bG4MyftsdfdbaBykmDiiNfkzsWo9nnA1ngVnb4LMZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ma94RghfPMHGoFWeK2Z+slD/AkcKRUPtIsDhjPxkIhK8ZFg8jCW69oY7/mUJIzGf+pbyrUEa1ED32DWgrFahdOlb2Y2XXiuSH1vzmxppf4pFIXzRb40YV8V8AyRCL669TC0Lgd4IxEggjtlVqzr8tTfNQyzeiVcYGmjl7h5rNo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivEIc817; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivEIc817"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1141940f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444007; x=1791048807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=ivEIc817Nrhsx8H6zckRL3AMyp6wCnxfhrQkSLJcJgRgU6q/awHL2kbs/H9giNSkOn
         aqGAH4w/Kx67BixNnZU4ahXzYlJMZqYoZPxeg+H8oUvBlqR7TUVXI0s1UDp2u5lPSTuO
         3nAEvmF4uS9+QBd8RikJZylI5a1BnuBDLbeQDIXQb/UECTjKXl0DQGRb4IUbcADjNoA1
         Rtyz3FSA19TWzoRT23diGMqKBZqsbbHStqhvA1YLvUC5oiAIucjsqh9OAelSVsRYRqhH
         XaaI2x+fRMZOUGqpbqLZLfqqB7VJzyqN8fRFqtCcLJJcvkgRmEzh9IKo12LA+D1jxk8f
         ikxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444007; x=1791048807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=z+Q6K31QZiuky3pgwlF1vQ7aXr0sjtvdMN65m5kEk5DUwKrwSDqAVc3PMN1B5dwf+6
         5kQlcneTkHksQHAZm2kjbP9Y/jiKXJAPd5SD4E/XPwKC4lvMEmFbXYGavo1lS/sAcnV2
         4A9hGo0lgYsuW9k6YpwuptiUzXyU4QV00bqMuLQPslmvAyIkyPP8MZIJ7ui9td9wJ7W2
         qM13p93SCXYoVIXDa9Fos16wxtrgz42C1inLUKbiO4y8sIgbgm9wDmXjOUcNo4hFEoUm
         aspCCcMi6MkRZEMNtLptv98V0yYFFCGxLYrn8ozkaCu9uTNFIoypDhsGdcNiCD2V3hlf
         r2wA==
X-Forwarded-Encrypted: i=1; AKwUvBwltXrnAxJQ2g50srmfUo4bBUrebC5HdRKIISx0KpevrZx7O18sezOH8KkUNPI2WemqH5HxxOilc0qB4lb/VA==@vger.kernel.org
X-Gm-Message-State: AFuF++kYVhsaQcy6bSPvSlci+DNq1sFIWs7pQkeDGgJbkOJpnw438sps
	S0Es99G35tm+f0ZWNaNcDZv0iHl1HxlmTsM54pt2weIMcCDlFR07FfHy
X-Gm-Gg: AYBFou056KY1WQjemC+eEb0U7zjelBO0aaC/zeC63lVDPbAIIFay8nFaS1PlH2ffCjZ
	fGZ7xJWPCBtkKm6sbdXjCkZFQUSfSF7dFW3jS3OrrFceGhp5/x0t1mPN7XZY2kJ6ZgRwZci53m3
	6c/Kjx4VThLpTmpdnRzQRB1xgrDxUxuXKbrxIDngy3MFNdzKiksp/uAlnizG4pTZSmz29gKEacm
	8nMQRkSi8Qi/KdSk2LNWc7T7OMkBFsUo4zATlBRqdtUMbnhGwTayjn+HVJy9T7yqz01wBKhwWAi
	WxPY0NkOazwNc0qPd/x3hUAt61Y3WxCq8dGXlUKlk+4iNocAiqDC2UYIf269+FO0pxVwFWr87f6
	vFURFaXCd3x2RIniDi/HFSqBnSvF9HT3rNO7sPQPG6dfE0uESjl6YVCYRF804O0Lt89DAOu1D6M
	N8SCNkLDoO/yd2+QcBbvpkD1LN1SLi5cXi90+NVAKqmVr7bLw9nYalSU6IbuB9J4k0YSN8DP0Iu
	kKTmYIZGLCf2c2xSoXpmLL88Wz0rR3HzPjfEkDJxEX+b8I0eIPrlldDvyWr4CSI5R0=
X-Received: by 2002:a05:600c:1c1b:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fe66d6c9bmr166175805e9.14.1790444006652;
        Sat, 26 Sep 2026 10:33:26 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:26 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] rust: sync: lock: use DropGuard
Date: Sat, 26 Sep 2026 20:33:15 +0300
Message-ID: <20260926173315.56772-6-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
References: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the Rust locking implementation with
DropGuard.

The guard preserves the existing scope-exit cleanup behavior while using
the DropGuard API from the Rust kernel memory module.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/sync/lock.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..15f9cbe76c8d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,8 +7,9 @@
 
 use super::LockClassKey;
 use crate::{
+    mem::DropGuard,
     str::{CStr, CStrExt as _},
-    types::{NotThreadSafe, Opaque, ScopeGuard},
+    types::{NotThreadSafe, Opaque},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit, Wrapper};
@@ -242,7 +243,7 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 
-        let _relock = ScopeGuard::new(||
+        let _relock = DropGuard::new((), |_|
                 // SAFETY: The lock was just unlocked above and is being relocked now.
                 unsafe { B::relock(self.lock.state.get(), &mut self.state) });
 
-- 
2.43.0

