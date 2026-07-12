Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9F3A9DB9
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858479; cv=none; b=a157U0zeUZB4R6SI7LsdTTnes76nEID2nS3ECpwSk9owtHiZqtDdt+/t/FzNYhCkGBp8qkvzZWShsKcyQog4acEORX856YcVl7sJyBW/p6XWZ+NfVK9ZR26WTnXneEJLCq1rhD2zmBPusggoUMQNaisSntMbyARA0hG2QvoAOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858479; c=relaxed/simple;
	bh=uQc7o3B0d6JZctTo6WHJR1OhocjVNCHR6/DSXcehs9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IyVyJXNxqWW0XFjn7U3wPvHLiQRO7cnV75f2ShTw94lzfg4xcn2UPNZ8+5DXxwF+cZ9funv417NCtqvG4uCMipskiqLJlWNv1kUs25ImyZcz35fN6FJAZXldDB5h9JsKuLI8buRiNY8/4A6UuLaS6zGJMsBNEWIKTZAOXP8Antc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/G6Jkk5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/G6Jkk5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1437405f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783858474; x=1784463274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sx4b9MUqxuiZRrlltzahxnxgeGhnIGeRIQ3PCtTNgg=;
        b=N/G6Jkk53omDBML/WIRBmGY2COdZis2yp3HyEMFVLM4QzS3dU5B39u7FvzwmSy1oeH
         ElQf1O4df1ars2ZF9oBfylb0fUhXOWswHYlbd26QNUfYSpYbclI2+Fg/aiPVvlErq0Kv
         x/oGcgnVzVDuB/XMZqYB5AJF7C+mGi6gqopSxNyTEdMOqu4TYuEZUEOLlTRHqAxDsaCq
         GjSATeuz/xPBsp0HFAEQJ80LKAjA2acekF1wCy1gaRvOi+KL5gde+z0degt7gHl/fSV2
         tjYZMQnR+I20KZPZo0I68ZJzLfofX0Z6Le1ol5Ks5uo8r/ptPrVed0AUuFBAVlLMkHSh
         HkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858474; x=1784463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sx4b9MUqxuiZRrlltzahxnxgeGhnIGeRIQ3PCtTNgg=;
        b=jRCvkzbysCgWuWGZGoWdCiEOZ3FXI+M3OozKbJhWukrYWzDlqBjxBCtxMATpOMPGLK
         MJNkjGiMaHFK5QhgkQXtOpQ9G8lRHv7ru+wTIlz0kYGmb2xZhdThgIT7YbM/rpdUbzsD
         mzJS4lP52ate4s0ZIRT1EFc3x1pTAAepjrOPtEM1A7wALuXB+2+aQzIx5T8+SGA8Gvow
         BHhltWso9qdRbARRZiyW81Ke6Z+zLwngTJhkGYUbKuqwx5UuJI6StAbwfs70dZDRDoj2
         FpgRM33J+XEkOUdAAo8sggY/x0iuvQ34V1wHkFrqq0lt0e9pGwa7bKnKpsxgjX4jYwjy
         YUdw==
X-Gm-Message-State: AOJu0YziId1dgi9WXm3KrpXi44hTNclduDpnXfNVYEtLuZ78VwXVNpIN
	2+XfSE7kxLcgjjnmEmv4c5IegXPW/8UXfUEF4Nfwojm0+RJUjy/sl1hs
X-Gm-Gg: AfdE7cl7ZR1WG3eWPuVxaHtztxnTm9gBeqEOQkJD1Azf7x3tszovr45HGsRiSF0pnIO
	yWypt+2xxl7b00rA//2Ws++He6qa0OAS3Lc5cmVCmCQ4ONhqxj5/xosjFGjE4B9f1vx8hPVZZ1d
	w6HyuFwqsqWSCsJ0AMBeprKnH3XE8vs5tT7QnCmiw8/lXlsW9I1shRyFQi3rxXBeYnCV/oKvVC2
	KyiM/3fsblJHSQZilNoVLKsEdgoVofXTxNI8Wq/D94n8xRWGLWlcoQj5F2JGFam+ik3HkHDxbZy
	LUn9oyxviMTyznfKsobifrdeP/6JxFJeUcDOUI5yWfI+SiC21PO5RmoJXjtuhYiDqX7q79CcfRS
	lxemiI5vlRKrfzp7s4gFxVpfG/3u1+B0DcGCxCs3yRLLtUFJQ1TZXXFS2INKj6wZIj8MwcdIM1Z
	9H0wR+twTtopa56F/uAFul9OO1aEQtvuTY5ejukiE9
X-Received: by 2002:a05:6000:250d:b0:476:82c:b869 with SMTP id ffacd0b85a97d-47f2dcf4962mr6201615f8f.35.1783858474209;
        Sun, 12 Jul 2026 05:14:34 -0700 (PDT)
Received: from fedora-dell-ale.Home ([2a0e:424:a465:0:bdde:db24:d709:ef36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm74515699f8f.33.2026.07.12.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:14:33 -0700 (PDT)
From: Alessio Maroni <alessiomaroni0@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessio Maroni <alessiomaroni0@gmail.com>
Subject: [PATCH] rust: fs, hrtimer: replace read_volatile workarounds with atomic_load
Date: Sun, 12 Jul 2026 14:14:20 +0200
Message-ID: <20260712121420.25179-1-alessiomaroni0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the temporary FIXME(read_once) comments and replace the
read_volatile implementations with the proper native atomic_load.

The generic `atomic_load` with `Relaxed` ordering maps directly to the
C side `READ_ONCE()` macro, providing the intended behavior and
correct hardware memory guarantees without relying on pure volatile reads.

Signed-off-by: Alessio Maroni <alessiomaroni0@gmail.com>
---
 rust/kernel/fs/file.rs      | 12 +++++++-----
 rust/kernel/time/hrtimer.rs |  7 ++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd..63f309f5c 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -335,12 +335,14 @@ pub fn cred(&self) -> &Credential {
     /// The flags are a combination of the constants in [`flags`].
     #[inline]
     pub fn flags(&self) -> u32 {
-        // This `read_volatile` is intended to correspond to a READ_ONCE call.
-        //
         // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
-        //
-        // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
+        // `atomic_load` safely performs an atomic read equivalent to `READ_ONCE()`.
+        unsafe {
+            crate::sync::atomic::atomic_load(
+                core::ptr::addr_of!((*self.as_ptr()).f_flags).cast_mut(),
+                crate::sync::atomic::ordering::Relaxed,
+            )
+        }
     }
 }
 
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a..cb1b5a2ae 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -576,9 +576,10 @@ pub fn expires(&self) -> HrTimerInstant<T>
         // - There's no actual locking here, a racy read is fine and expected
         unsafe {
             Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
+                crate::sync::atomic::atomic_load(
+                    (&raw const ((*c_timer_ptr).node.expires)) as *mut i64,
+                    crate::sync::atomic::ordering::Relaxed,
+                )
             )
         }
     }
-- 
2.55.0

