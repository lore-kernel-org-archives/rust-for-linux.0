Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F01C863B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826429; cv=none; b=Jf+rLTpa6XyIzRZ1quu0411bAmR9uG33aSirplzx2+OX8nTm+HVwWaUcqsfNp2P4txo1xQMAsnLytczNLBWzGraL2jmyjZZ/mMr0AKxWVySjWPeMUI325i2QhqKOF2BUpAAlFvN1yjtZadizsFE+Q6kuo3XMwci1NUu9UbGPXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826429; c=relaxed/simple;
	bh=8YiH47mBvhM8T4eHsYNmGvtYodf/ij/ko3pn8BGv74A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b8ZaJs+2zPtWYOBSXdXk4bKsZoUHb4Q8kamcEbKGvvRupjSdzhC5D0N2D2UXXoAsSutORNsOdTu7YL2vp/Zf1ItBlMRuYyBtZEbyLdmaeNTbr+BtiP5/SSNnG9qS5cQCzlTMVQbwEII4PGIPznZcCIzkm8yEZ+Ul+CppAGkRzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKtWRRAW; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKtWRRAW"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87e075fe92fso766236241.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 18:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826426; x=1749431226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=LKtWRRAWPvGHLF//cv9fu9LppIcYVQNjAD2V1b9jMo+wEbpvCY9xoNpV1Qpd8BU7UT
         Y/XGVBEcjaRJaFoX6L6IE/DFuRNTWVFehJSinur6Tn9bMhc225M8IrB14z5I18N4mLfz
         ij4ld659BivFaDUitM0wQvH/ZZwE23+RJIJzcF8P8AeZRlNF8mjQBJ49KMWfoc0EBatd
         rPgVNMjvgD6Z6/ERonIF6chQk54rKFLt98FwV2s7f6c6XR+vDWJqDY8y6jKtd3s39A+2
         G37djnw23a4M0A+u/bOaEo+VvRDGAxRIEnTtND9yekCczAf58Ge+Fv16/e35M0hFYl2h
         aoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826426; x=1749431226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=Z+O7/UqhRxxRDsyL2vHzKFpWPGiAJCI14QrirMJ9X3MrF0qIJwJkYFuaW2+jG5pPUL
         bTrnCxjo4lFqSabYTZnKgByoSmttO2riqp/1m9uBx1eaCEfdAh89j3KW7wnEkSSoL+LQ
         QH+jY0mf1hSbtPvTPOWj2i+nBBPRiF9Y3WjZw7iRp1w+HxdKYg19LzhKuoZ8wI+m5dZ8
         +G1CgkAPlhIfc0ZXmN2HNrswjSlaIqOlcsabMqvzxJzNzTPMtcBhXmDJm9jB17eYxySq
         3Ac5O1OIRRATB97BGcH9Axw9lZtzfh12uPnr51Oh4ve/Al8dkQ1IRXM7V60gFx0lUPWh
         GS7w==
X-Forwarded-Encrypted: i=1; AJvYcCUVl4rl6P0WqVXgRg/pf3qWgzXFj+TvGgke0BrAGUYuuI5U3zqmIwBBr5D9eZLZjB8oWvXlPlKMSUymGI2f+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDZclb0GHBcjt0D4D3rU3Ic7QoYv7ofVeULDoOQQKzqN3pv+7e
	33DaniI8nJLGpXPX47dnl4Khit//RhD+KhZvpri48qunc3dVee8keWB5
X-Gm-Gg: ASbGncuk+NvCiOcCsh06iJhR+XNfUbu0Q/8akNMjH/CgqgapOvj0N0wv3vaUT8cGLJM
	sytCROh5vhpQ9nKkr6aLgP73rKQUDSjWbJSCY9twR3kpKXHqjrG4I3oarCES8KAiR3qycMajPNH
	xFzv37zld/tKpHTFesg67bXZ++ZBWz3YW/YyeU0bkKlebAnC5MbCmxoWs7Yk6tFeqQrNzoIDWoP
	+i3V7L7y+I6pPFj432hQMJE47gQmFznQ6P4GNI/1vvcYHULpoVJ8jrq7A02mW7dWqhdMbl7MAzb
	vwN7GnxaXleOPOJRCxTU2QVdC2g3wSA4NUj2BQkXDdRdrlA+urE=
X-Google-Smtp-Source: AGHT+IEAnoC55EcwecdD9hTAHbo90RKJ6s2AbEJwmo3Ptzhr2plxvTA2uzfK90Cvl0CyvujGTA9+aA==
X-Received: by 2002:a05:6122:3bc1:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-53084c639abmr7696022e0c.7.1748826425905;
        Sun, 01 Jun 2025 18:07:05 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:05 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 1/3] rust: revocable: update write invariant and fix safety comments
Date: Sun,  1 Jun 2025 22:06:59 -0300
Message-ID: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit clarifies the write invariant of the `Revocable` type and
updates associated `SAFETY` comments. The write invariant now precisely
states that `data` is valid for writes after `is_available` transitions
from true to false, provided no thread holding an RCU read-side lock
(acquired before the change) still has access to `data`.

The `SAFETY` comment in `try_access_with_guard` is updated to reflect
this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
comment is refined to clearly state the guarantees provided by the `&mut Self`
context regarding exclusive access and `data`'s validity for dropping.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..d14f9052f1ac 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired prior to
+///   the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `Self::data` is valid for reads because of `Self`'s type invariants,
+            // as `Self::is_available` is true and `_guard` holds the RCU read-side lock
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // and because this `PinnedDrop` context (having `&mut Self`) guarantees exclusive access,
+            // ensuring no other thread can concurrently access or revoke `data`.
+            // This ensures `data` is valid for `drop_in_place`.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.49.0

