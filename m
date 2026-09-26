Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001703806C4
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440568; cv=none; b=feXiGqwozfd22ykwnAjL2OvN9xAmJa37MfGZwMnjdOpQqF8TrJ7DL7wvMBUE37cw6lCYawVzRy10nH5R1ccovFyV92WLm2VeiGp8Wdo2+/Z/ShM0KN/HPIFaJ+KNva7Wn1sFmHxm2TR5/Q9jK7uhJkBlI+wIJwsQY2cR0peb8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440568; c=relaxed/simple;
	bh=bG4MyftsdfdbaBykmDiiNfkzsWo9nnA1ngVnb4LMZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QN/ujlh9EM68SZt9yoR/twNljLEBOZ6z5a/QtZGz1B/Ldj64YEawmSH7F9nHNo9VRZqEyV9RHsVq8CUvk8rT8A98i5s0JKh2gm2Q7Z7BDn7edd+thZMNh49bqv0vuAYnJR0ojNxP8BjaQkAhSh6G/a63zyl4ZGJZr5G1Ot7uzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYLy7tXS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYLy7tXS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1032419f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440563; x=1791045363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=iYLy7tXShZxTAhG2W3NNlmxf6L4RtJ38na9e0k0glaO097X12jiRsivDkfbSyepjNU
         3pZlupDMTTZxyjrRJBXMkORkTV7uqGPkKP4MY9832Zj3Va5oa4ZfHOWACt+JrlVuE3hH
         7daMOWjwXyXxE4pTP7lsJ5nzRipcmElXadRxRY5OhrdwclMXFwTVHo/lLs6W9ro7Cicg
         OhObvRR8xsXr6FcsG3tuz13C/F/+JmWMrnWG68OuWA761fCDy0utcPCfHqAExz9YUB/A
         dwDCh+05CYuMU24D9C1CtIvYjY4A3maP0kPbJkaX0QJT0nj0r3+Xoa1Gwv6G/wH8J3wb
         zRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440563; x=1791045363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=oB0SijUZUkhfv/H2Wjb1a50jg0eXq7W78uOwFKD4ovBePV1ex+Y14+AKyYBZKoeJyD
         /yLcMRRWn8W2y5o4r84dmqka+EdG1XSx1+Qa/bouXw6+LZJ3psM9vXOHbcrNlmeCh1Fj
         HoeRNvfADsrNnJgRZpOLZRLHI1mAHnw4q3wCbQv49BetqK5h6fRMu9Iqm3bFlNd4UR8z
         tr+W3wuMBCVH1Zh5pYMBba70sff8Pkn8R4Y7M0QyzK+PYTOwC2/975LTB9MQdbGwtVv6
         IjVYjvwpoECC00nL96kucHELl2MqJb94Y/DGvnbeztGzu3C6H9LLb5UKQdaf26GNqP/8
         Wo4w==
X-Forwarded-Encrypted: i=1; AKwUvBzcfgLOJHc6pcwDT7CMCsQS5eMp2T7dKN1GAW+x1sULM2EV7S+Vx57GSdLUga+whNDYUKm4+wPWeIT40t4bng==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0dHE3xB6BNau+XCqgLVVOAjaiBQBNMP8bVVD3ZNLgygEWOopW
	5klcrEzYg4TF3eqU3OuTWkgX4FFazsc9mydyu5hrPaiOGwswzFbv8Pyz
X-Gm-Gg: AYBFou1Isr3oEg995vUAESmu/4O0/jxbwH8nIpHku61/kp8uDnaWVl9nLa0EIB6xE4F
	tlDg5BIKXQHqVoO+IQUYCFxo4PlTqqrspz1IfCAsJqLJa9LodNo9MCkonYQfI1xG/XdrDxVP0ng
	j50ZSSDcH+nQLd5qJ3P1zgQynUsD+1566bmEIFo2D8NG1q/QvSh5dbWU4HYgIUbOIeW2WaQS2O6
	DoDZKKhHrNJrDa1rx6LdJKmPXMy3miihjrt0VJAcJyvcNPiaDL2MNgNsvlpDapAsAmnI6uE4lQ8
	2egH8xmHPGndk/HwLA7SeKjeEKpSE1boCxN6jy26B0orvLrODMxHFs1TGP8zt/IVk6TXQE0OMc5
	vPYwsHuEasAGHUrxiWj4uOekk0tM2/rU5o6UiEd2tQwHCiJc512p4uni3GnqV1FKhykRu4Gb3cL
	mRTyZH+PSmhCYd2Ajt9bOzY9AIbpDGzYmXqbXRPU2lNT6X9Oxj/tKgsRQd2cBlt6SUQB48SPDuo
	LCFkbA6co8i8ImS1IxbxUBxlI0P6tljkcBeHEj9kFFjU3aYKBmmzKbnSZGuhI+M61E=
X-Received: by 2002:a05:6000:2999:10b0:488:79e5:cb2b with SMTP id ffacd0b85a97d-48879e5ce9emr7985352f8f.43.1790440563055;
        Sat, 26 Sep 2026 09:36:03 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:36:02 -0700 (PDT)
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
Subject: [PATCH v2 5/5] rust: sync: lock: use DropGuard
Date: Sat, 26 Sep 2026 19:35:51 +0300
Message-ID: <20260926163551.52371-6-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
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

