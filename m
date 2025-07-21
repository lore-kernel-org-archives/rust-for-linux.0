Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5A13C81B
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059803; cv=none; b=LvTx4n7c46AAZZuLRl3h2sStD+Q80U8CrymmfjU9NTKTmN0IX6UTI3CrF2E/TvlQgT067cTe8/KoRYt7d3vv8aOQlD2ZXv8futk5nQ/fHzyIFFdY0RDPOTgXOIHwTFIg5M4uFIGpy2QTz3acVlM2TWOv7j/zxZpsPKVWNP381OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059803; c=relaxed/simple;
	bh=13RqBBEIgV36kWEm7R9NSzcKjcMXxKEm5YELl8tsO0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt37u8kc8j/6JywcmZvyqe0kmstUlA1nKz4vF5rBS55IlX5epBK0LbtO0dgpNW/69j2Vl3WsupxF1Ow745jDUn6u/vzn28GZmoTHbqylLkEKD6DkB+/jT5Lm+9HNxILrc6y1Rc3kUmmiss6/tyB7FuTfRfrQCKW2vkRnH1nMj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBqj3ecO; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBqj3ecO"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-615d75ee53dso154132eaf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059799; x=1753664599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9ROY5exl20foQoLOm0gDH9KYBPBVvAtZ8sGEN3WoIU=;
        b=FBqj3ecOmNrhhmKYfzJpXHlQ3Aun4Asl4yKDzyQCGVF1jcJEWEwQGlfReCnXgUg7A5
         CE8zTMWoWvhLRimqxNLGXXFJ4k9NmcN39LfDuSCZMk0Q6vSHkG+EG79ZNAvHqHnGlUEa
         gSAg7+SQsivTAutXtW0BTFzV1l3EaO3spqyPjP0znO9RftUI7p5+ONVHaFj0gRtfEoqj
         az4ALs89FMQKWSP8ZkbQ/IrW2Hn5togjFOoek+R/6LUXLSKaqwVe/fjKmZaPNmX2BNE5
         NFdNxzpX8plxBbHxpeOSz50+e5x/U58XIYK2NqFcIZQ7MoniuNs5Zruv/kjAnq9lw07x
         pEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059799; x=1753664599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9ROY5exl20foQoLOm0gDH9KYBPBVvAtZ8sGEN3WoIU=;
        b=MbvnDaRqWXs/i+EGGN+p7fqQ64nKatL/ITYc9qF/Pe0EwLh/JrxR7yKhtXn4e2NEVs
         ksI4iUvUcbh9cLTyQ8lU1nrLHHappFpbATvYl5iJ+DXAO3PVuHz/4Q49sEvUZWUiPipG
         +AWtub5AFbGpGugh+7getoum2EYeGMsNgMJ3RngiBMXkg4xIKupIxSDPHIh9q6lKdsK2
         Jg4u6RNOBN6rumG5GYbMP4Qu8lyRcCkLHNOYspSLuu44ER8PFCaM8r/fs8QM+8aMI9Zo
         d9qD3Y61hGtFFB8lmyzePnmOY92ZjHZ4dqsEUPUOiZLpjeXCcw5Gl3TDII8lguuDi+N+
         Fkgw==
X-Forwarded-Encrypted: i=1; AJvYcCU2YuKO5mSJwLJtQX2TvC1w3S8f+4rzrv5Rk+SmRZiSZNQm8rYQq4PGr3LXARw6tgHJdE2gOiqHlxD+sBvDLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHxct3ioQc1uKFJuI4vbT+zLZrVyyz+bCM6dS3NwALcArPdLro
	ZEjGkzLYHz4vBfMrO0hdY8JmrTa3de7tVWVONLlks/b4oakesVtLgJSJ
X-Gm-Gg: ASbGncuMKVLGu7CRQP//teCrVawqd3t4QuSkHTcbyctGmIwZdc2R1pow1jqccujSmz8
	75KMPdJwOSAnG3knMXr3Wj9Vg6QJJv+cM4pxEfppICcjYoTr3ShFVLXxTqZbNqx14hQtRhD4Tqp
	79VDsFaPC2TApSjzmtRQQJJeKbNbFFoxBhljbtu0xmiW+dVe5t3kpBspXuI3N2Hwpg3V58NIoSa
	DRK0RUGqk/0MriqQg/x+devjVgousH7HJdXqMSTI0ctEYj20bdqnskl0HPBAOLhYcoZP0+FvBhp
	2trlwyxiXf9phkFpD7ggdqwzi/Bv0vRuraFam1/Ay3okcLT5QRXQOtxd2wUjvZzrq0A2Gi5AJKz
	8SHYe41eH
X-Google-Smtp-Source: AGHT+IFPaCCUzN/ADWKDu6A52cd5k3Q07KMXcpSXYIgHRD6B0jDRaogs0i1AjFDZymNxwE3UYyAnLQ==
X-Received: by 2002:a05:6808:8314:b0:41f:79f9:1b4a with SMTP id 5614622812f47-41f79f91fa5mr6510773b6e.12.1753059799514;
        Sun, 20 Jul 2025 18:03:19 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:19 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 3/3] rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety
Date: Sun, 20 Jul 2025 22:01:55 -0300
Message-ID: <20250721010258.70567-4-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refinements include:
- `RevocableGuard`'s invariants are updated to precisely state that
  `data_ref` is valid as long as the RCU read-side lock is held.
- The `RevocableGuard::new` constructor is made `unsafe`, explicitly
  requiring callers to guarantee the validity of the raw pointer and
  RCU read-side lock lifetime.
- A new `SAFETY` comment is added to `Revocable::try_access` to
  justify the `unsafe` call to `RevocableGuard::new`, detailing how
  `Self`'s type invariants and the active RCU read-side lock ensure data
  validity for reads.
- The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
  is refined.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..0048de23ab44 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
+            // SAFETY:
+            // - `self.data` is valid for reads because of `Self`'s type invariants:
+            //   `self.is_available` is true.
+            // - The RCU read-side lock is active via `guard`, preventing `self.data`
+            //   from being dropped and ensuring its validity for the guard's lifetime.
+            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
         } else {
             None
         }
@@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer for as long as the RCU read-side lock is held.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
 }
 
 impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+    /// Creates a new `RevocableGuard`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data_ref` is a valid pointer to a `T` object,
+    /// and that it remains valid for as long as the returned `RevocableGuard` is alive.
+    /// The RCU read-side lock must be held for the duration of the guard's lifetime,
+    /// as indicated by `rcu_guard`.
+    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
         Self {
             data_ref,
             _rcu_guard: rcu_guard,
@@ -258,8 +269,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: `self.data_ref` is valid because of `Self`'s type invariants,
+        // and the active RCU read-side lock held via `_rcu_guard`, ensuring the data's accessibility.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.50.1

