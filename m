Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B1288C9C
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554975; cv=none; b=XnRV5BtDExt0vhm0vWEzXw6hlzGNjPolFYyzijVS27IRujpsVAT5cc5losWHksaBLpaEkOkUtXyxaZob2wVA5MzzEcAtzhR3s3k/nkIQis8jS2Whs0e0mlq5J5STPBQzuH6HNWd4q3ioWKIpcFK6H3Ehmr3cZtk+C/4GYEh84c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554975; c=relaxed/simple;
	bh=eZme1SzjOeul0jhnShnKJQvP3nlnQk+EbC6sx7saJtQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7eKTrHgF+b0024DKyU6ZaFOKMmYfGa6bi6g4RAP/Kmzo2pXZrdUdI48DpvoNB5WHbz3uCMaU7Ns0sEvs9I9ha2RusxZUZHEy2RYqvK+idwWouImTLXyrj218GM02XajmIk69E3jofJRpm1eBmPELFAv8vPeocR9JtXCFfmTGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mp4Prfff; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mp4Prfff"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2143162b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554974; x=1754159774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVcdA331YjXfGGKaZvRHRPgJ6JXnIrSJxWaUWSwuxzw=;
        b=Mp4PrfffR80y+rnr0BwGmvqqyPukW+A/t5o4qffAReknJWe7OHpsV0Nc2uq2GwQueI
         rjWSjquA7tqxdXJE3xrokAUyNOWdSkPkYtoxgZcwwx3z+kcOc0Fe7zNqwdzoP3qt9L4O
         1APz8gm94jZmMtFMtQq+j1oOoT6OlrOLWZKU4YqIyRmHo9oXgLZNJoB+yGw2cnen1DV+
         gXV0blp/Y5BsXEmYwfqzQr7wsLzANNhSNLXlqTgDnFr4cCUqrSwc5yNwEjq/wwDLK4jS
         39jfeRKsTDyAvUSMDfM9xSyZSo4gnpOnTRw2JcHvNpbtmMpDaB86Xty6Pmak/OQ2xWRS
         +Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554974; x=1754159774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVcdA331YjXfGGKaZvRHRPgJ6JXnIrSJxWaUWSwuxzw=;
        b=nBO4tYH7r1BvxKlsI3tVccoGwhRXFYBiMdvkzpTkuc5Z/FQayEbzR02qrwf1tEhrfa
         ZfD1ukyMekDIqQ+dveRCzTEn7x0i5FByIvyyXDp/C6zF7AlFqPeXPbOrJ/jTzoVk1xoC
         G2a8E403jcKmUqI3VMhtn8mYfHKBmCxvkvNNtVp9KXMRig1E+XouiWyOTvycpO8drPCM
         d5yu+c7Aka8vEACeErKQ88U8szjLUnz3cz6lF/WvIhLZqCqWiDXZTFQnPQ6TgSpMShJH
         HxCLtyL3fVACSoysn7TErQH6jdLmGN/+JPJ00WQfQLbQ7FI72Jl+uUOkPIoqDHi2w0yP
         CNxw==
X-Forwarded-Encrypted: i=1; AJvYcCUriiSnBJda625HOx3sBUiUAzQmKnwbAUMUiPBDHl0sBAIm2FGyJ3nBQINbL5XeL1rRAPKzSVJB6QLAl831kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycuJxGnypSfF11jOOBSolsn5wptmn/QW4n4dsn9ad+GAryRbXa
	eb3fHLKqAppkr3Iy8P0PjPxNl3X17h9jhdm45rxM0r5q0zOXeYVrYRKKLp0PV6lU
X-Gm-Gg: ASbGncuVW2Il2Z+UzkPUvlclCRYLu8Or8FFOzm7qxOCp51+o8LB6HyAkar+p+IkXlgE
	CodVTGpCdMEBNi6yBbbavFTCcmfhp86EQ6mBbSrcyrohjpwCmYwH/mLSO6Mz7BAVgJm5mhyBq25
	5Hlhc6YeNq+uAGpXKNIXCJ4MaWdbb753nJZu1Tnk2fvCOZfsDZVeGVmIg0VGkdNsnvvLtnm47OA
	WbUYJqkKNsG23OgSrHphtlkX4HJeST6b+aY/858ckdEolXbIg/Kacd6x4NZU5B+5HZsoB/N8oUf
	wH+Y2ZQYYNDZU0t+rM6kbNnJFRtEqGv5uoMLdRkQKY6ulwJi5YrwcKhrtnE/rvBfAbRHtxKMaSV
	4tSar+rq5
X-Google-Smtp-Source: AGHT+IFLw4HLiiTXvPLS6068oeR3S2hY3q8vy8XQQ14JoOkIWZYR1pdBxcunS1rfz+fmVo9gikmjdA==
X-Received: by 2002:a05:6a00:2383:b0:74d:247f:fae4 with SMTP id d2e1a72fcca58-7633636aef3mr9798682b3a.4.1753554973660;
        Sat, 26 Jul 2025 11:36:13 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:13 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard invariants/safety and refine Deref safety
Date: Sat, 26 Jul 2025 15:35:03 -0300
Message-ID: <20250726183552.23098-4-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
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
- The `SAFETY` comment in `Revocable::try_access` is refined for
  clarity, now explicitly stating how `Self`'s type invariants
  and the RCU read-side lock together ensure data validity for reads.
- The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
  is refined.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..a2aa7989231a 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -106,9 +106,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants:
+            // `self.is_available` is true and the RCU read-side lock is held by `guard`.
+            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
         } else {
             None
         }
@@ -233,7 +233,7 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer for as long as the RCU read-side lock is held.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -245,7 +245,13 @@ pub struct RevocableGuard<'a, T> {
 }
 
 impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+    /// Creates a new `RevocableGuard`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data_ref` is a valid pointer to a `T` object,
+    /// and that it remains valid for as long as the returned `RevocableGuard` is alive.
+    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
         Self {
             data_ref,
             _rcu_guard: rcu_guard,
@@ -258,8 +264,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
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

