Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D71B4248
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554973; cv=none; b=a/9BjbhK4RBKsqXrEqp5uTY3PqT/xSdhIbCDVx/vtSclRCDDlSFIXVkcoqzGoKIv1NSHSHdI/vAkNinHD0el19oSV5TIv+h1j70A0vjgLX0TbsJ2JeDAexONKxypo2zJ760G+NxXzPJ38QnXK1zAHVv1j47Xp+XJ2lg8lDDDIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554973; c=relaxed/simple;
	bh=1JLaltb09ETI01fMju65A7uQX9JQAkcTCKyIvzLpeKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiWBN6pvXEe6uxC6qhLLPiwqobJBwbN817DVgPQkISEK4wS0K2usuDwrE6KeH1tReuKmCTlZUbiZNmj+aATfY5mHnD1CqWPtJkOmgM8SGICAkQaV6CLbDHtWqKdzBEmSGNmGx1LfIsiezBOwhYQ/IKcU8G+r63ObrHz0HB7ER4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C201uwoU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C201uwoU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso1927407b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554971; x=1754159771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=C201uwoUXfug+y4eOxZ/pTLmOapUmSZ/jRKzehVmH2PWrqe8RUq8gYWLkfT2/Rwnkc
         8SeT+NFNI0mKxHSJOOUbid5SWBxMReDQlbVncGPsEDRi9LBYwAzkY4xayULKqOzLivje
         hK568oOyaHRDGvjyzkDjvGgNRZCx9H28V+quyaryywADpTVq1taDJMLbqtlNoVqi8gR0
         8F5kAu3Nbo1WExm/q0P2WSG9pKVclgWrxUIEm2/8BI2PcmkWdFi9BwHdRa3SnL+fKSB1
         2nMyO50brWbliEoCDtPyIbFRF2anqeClAPkVN28WUmFhGPRt+4oecuCURg54cWZ6uALt
         4Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554971; x=1754159771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=LmdLRIoGngn+6FO6t6vg8RdLJ69ZScggfugxMx8tXV3h14Y9MSG5KboGtdcnYHVwZT
         TIm9nL04gEZLxNwwrKuzZ244W6EqIi/m8s1luLqGZU6b1RGKhACTeAs3+2wv4naJ5d2e
         ufK2kAissV1dsStscfafEiJPKrBbQ2wiXdkb5AN0GlFtiWwz9hZM8qqwl+pGEdsF6OWd
         0k3lS15EsGd83pmNPO1VrRgyM5O9PjITrezozS/aD2+5JfkE6miufc3bKyCo89r8bCJe
         HZmfF4pXd9PN0aXnJlrGXDAHbN0Lg1qSJ9NJbPjN0f1msXRp47P4mamYAzALTTdvc5eE
         pDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcSFIyqnic3Mfb8sqoElagBYd1l0FPcD0NZmTot9aQx5uHjQS/7hVys6ft8n0vK6XOl6ZLYSx7IvC8UhKn3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5ZMHO0bqf4UxuN9LlHN0MiCwJBZOVfpQGGA22egss+vchMAk
	ChQA/z/ZTfwf2NxdaZOGMrBXOiARcVKHUQp71AKozt4sONqMBtkhldIm
X-Gm-Gg: ASbGncvTug6Ww58IKE4UPC2hmELkL2pWGSm4fN7N/y58eriw3SRea8yFdckp32JxxOW
	0zwvNfDtPp+UKsYENZagx4/9IMtSeiqqsDUdTra+qT0Fqo4P8Z7/01Sv14ddVqUW5pbsSyyObnp
	8BKyjWbM888ghNokEV32nFetYDXZR+cvCbs6yL4cyllrvoKtTqzpUgfRsxEyHnwqPyXYMzEFIId
	Qnn12UAU6RL85A2/AeTj8fL1Sql9lTVZ2xDdYn8iCFHuRl9ha9IjzQM2D1PGO6Zordrz0YZMkv0
	VYHqyT8O2pewgV7KYzRk5xh8eBXTQHbA4e72rPydTjm8+DVCc26DJgZU1OTDYLGtfYAN1b3xZdE
	OsDT5jHml
X-Google-Smtp-Source: AGHT+IHnUwiVBTY531wTS6csNGdOFaWhCRrmz69NpjFumA8teKJ40dj1RU0WHM2XYrtdTtUXYaIlWw==
X-Received: by 2002:a05:6a00:2e1c:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-763328614ebmr11483351b3a.8.1753554970936;
        Sat, 26 Jul 2025 11:36:10 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Sat, 26 Jul 2025 15:35:02 -0300
Message-ID: <20250726183552.23098-3-marcelomoreira1905@gmail.com>
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

The revocation mechanism is refactored by removing the generic
`revoke_internal` function. Its logic is now directly integrated into
two distinct public functions: `revoke()` and `revoke_nosync()`.

`revoke_nosync()` is an `unsafe` function that requires the caller to
guarantee no concurrent users, thus avoiding an RCU grace period.
`revoke()` is a safe function that internally waits for the RCU grace
period to ensure all concurrent accesses have completed before dropping
the wrapped object.

This change improves API clarity and simplifies associated `SAFETY`
comments by making the synchronization behavior explicit in the function
signatures.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2dfee25240a0..6d8e9237dbdf 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -160,26 +160,6 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
-
-        if revoke {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-
-        revoke
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -192,10 +172,15 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) -> bool {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -209,9 +194,18 @@ pub unsafe fn revoke_nosync(&self) -> bool {
     /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
     /// already.
     pub fn revoke(&self) -> bool {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 }
 
-- 
2.50.1

