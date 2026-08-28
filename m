Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF9E34EEF3
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933927; cv=none; b=dHF2yW1Yy+C1pu9FJY6dkowCQNc6+yncgb5/hG8GuIm+QxVGFyBVa73v6jpqP/fxZb7DOiBKJ7jX6nrfsatjCHuuRduWnCgWyWsxiezDzJFlrIWSQVyembH/w3snqE7yQsNZYfz9ZKB2TfJVbpw4gdXL0wehiMcdX7Yf9tg6pP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933927; c=relaxed/simple;
	bh=On0EpPCW7Xs+kBPpQMK/g/Ox2aYtF5AyHy/Ph11d7Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCMy8oPUX9f2aPlFmqEurySCdrCz6lKxZorCPWlCE/9xMkSuE8WmKn457ZuJI7yYRhEBC3sSs1OiO24Z+Vb6QNZHIsMpGWsawrqLxbmtOCXX2pjslIjfl16i0TyKFuNfAptF7aSY43Q35mwklPThpHBz2RrGLQZFBuoAU/TCFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEd0fCVE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEd0fCVE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso1710807f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933922; x=1788538722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dASx059M7n9jDKHVd3+xN5EtgdIyRPi/zKAv/mkblak=;
        b=bEd0fCVEn4pqUpscZe2rFpfwF3+19Y6p3CcnajMI0SKoPLFdt4ne3RjoqO2LDKUmxF
         dDlJd/ZkLrRxi7mC/5DaQ9KRHE6niG4cRLKkY1hxc7IBCCkB/WdJUNo0Tj10BsF8P9GR
         QU0tlh4vvTTkgOkb/Nthlu8JjJ3jc6jDADXU8asMP9O/1qaOt1luqzk16eSgq8WEnMfK
         m29NFf7lYzkx0Nf2iUeJUm+tRHhzO29BAdp+i9DEFSGS/ab4NBjIsLXgPaL3DodxfZud
         2Z+0yr03rMiOnmwSupzWkmTa6yYIAqmKZ06b34ZSmqDRAmYxmy8ZM4gNPdgmR2FBWrCt
         o4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933922; x=1788538722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dASx059M7n9jDKHVd3+xN5EtgdIyRPi/zKAv/mkblak=;
        b=QVTcNx0cGAlOs43kRonca4tV5oFItlF7N+jC/CgYBXyoweqeWRGWUgh1+CbMV1w/9j
         1eCUpweIdr1EILQyLkfPETyQsFaiqW4jCKZVepJzfBLvcTfeqyQzMPSxvy7NeVFSGHb2
         bDsdFM6URg6X0SQCr1gj7X0Xt1pI1TmBTT0Bx12VvYb/40F9Us4hWppawNMsLijYXfht
         OIkP8ja9vR0Zu10vEN3wUuMzA/eGFA6t/Ri9Wk9FJskTRm6j+s3wAyNVqE/dIv/bFL3d
         YxWbwfBhCQE0mDM+EsneiTpctIhZTFQSUeo+9fvUbdfwVXLuHfG2q96Himdv8rAp4jQt
         vYGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi84/LGMLeyhOrMacxB6sjtS3PmWM+tkBMUgapo27Q4+afCfbhwSomkfKNVFHRcONBEVa08OMKYDz0PplutA==@vger.kernel.org
X-Gm-Message-State: AFuF++lto/SMwww5VIl3hEvk9mBLfde+otBFSDtJwk4TrQSvrliXylou
	Op50OiDwY5HIpQUKmkWvrVPjzwxLcdwgIzRKtxSrTrE9eTxOxCVW6zv+
X-Gm-Gg: AR+sD11hx4GSOyH+QMBZ3586kfBFk/PSoz3gWn2tWK7/lXcT8Rui5ysSzWag68hB4Ux
	2VadI03VLmf3pevzTM0Ml1kku7puE/uoeRBXuZa10vi/K0+/qNCYhEOhIEEvDT9M/fidtOVVLTj
	dlNHRYRQsGRsLVSp146n/acuDqV+dFE8nbg3LMiMx9LdWe2F4QIEFPPJ4FXMK+BdO3zQ1UxH3hz
	A2M+gSS4QSWTJd6xlk4JKc25m+JwVtX3KndgGDhIqDqRELzM0m/yGb9ClruXh2vMjkUDXborwY4
	kU43lQF4ISg3Te9UbaLdEWAcdmt8ZWIAojBaJsdAWQL09ZBq637o1xkm8v8w8cDKh11dhF1uYjb
	w9FUkMeiGr6+rLe2ZwCgXmzAVDElrKiGerO7TOuVj+x8rz+M12zNUQ7ytYG1iMZhnNx/6KXmXcG
	2nLQYvB/kc5rBFXfQvDZok0BlfG1wfAYEn4+TwHsOAimsPwjETj7sZMTZ47nUSHDoHOxpGuB9w
X-Received: by 2002:a05:6000:25e2:b0:482:e2f2:19c0 with SMTP id ffacd0b85a97d-483007e922cmr1959296f8f.3.1787933922555;
        Fri, 28 Aug 2026 09:18:42 -0700 (PDT)
Received: from main ([176.237.234.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32ce2sm5294284f8f.33.2026.08.28.09.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:18:41 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org
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
	linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v2] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Fri, 28 Aug 2026 19:16:57 +0300
Message-ID: <20260828161834.29539-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpufreq_cpu_get() returns either a referenced policy or NULL.
PolicyCpu::from_cpu() passed its return value to from_err_ptr(), which
rejects ERR_PTR values but accepts NULL.

If the lookup fails, Policy::from_raw_mut() therefore constructs a mutable
reference from NULL. Dropping the resulting PolicyCpu then passes the
invalid pointer to cpufreq_cpu_put(), causing an oops in kobject_put().

Reject NULL with NonNull before constructing the Policy reference. Return
ENODEV instead.

A KUnit negative-control run reproduced the oops with the original
conversion. The same test passed with this change. The reproducer is
available on request.

Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
Assisted-by: LLM
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
Changes in v2:
- Format modified imports using the kernel's vertical import style.

 rust/kernel/cpufreq.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..4b992ea9a0f0 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,13 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{
+        code::*,
+        from_result,
+        to_result,
+        Result,
+        VTABLE_DEFAULT_ERROR, //
+    },
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -29,7 +35,10 @@
     marker::PhantomData,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 
 use macros::vtable;
@@ -687,12 +696,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
 impl<'a> PolicyCpu<'a> {
     fn from_cpu(cpu: CpuId) -> Result<Self> {
         // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
-        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) })?;
+        let ptr =
+            NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) }).ok_or(ENODEV)?;
 
         Ok(Self(
             // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
             // the returned reference.
-            unsafe { Policy::from_raw_mut(ptr) },
+            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
         ))
     }
 }
-- 
2.55.0
