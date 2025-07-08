Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF115C15F
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934889; cv=none; b=cTg+VjuV41xRK5E0Cm6l1B32Kyl5WJHNXDhBWhUDydHg4ayHFhDM4W0bUcNHrXbgGU0Dmq7QAsbPiyrFVmpL+Sv9glue6/+Yggfg18Kd0XM8exMP+ziIj/z2Bdu3jmEMx1Gm/G/TH6bj8HzLb2UKMt6wPeqv35Ob7X9yiX2NhsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934889; c=relaxed/simple;
	bh=yOrwPYVsLOHj8yiCOLLopOM8SnEGDOE2HTp01A2TD5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQHtJ6qhADWsCNIrFKpNR775yhj7aTR4ADRqycDtNzJtwdKMclp8GIiHrYKVvqfUE2O7Gvnlmdm5wln4zZSCclnqGrj7t6EW+HvlN6R+GjSrF3rpg0F8ta20+a4qlvHKL2aob0nYKVOn/U+4/ZIw5shN4+Wu6A4IBPFc8jKEUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/9ixA3f; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/9ixA3f"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7da363af61cso11671385a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934887; x=1752539687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzAwsuW1+0LZAS28lU0/GaU1LO8J8uSYjkSQLSp4PDI=;
        b=e/9ixA3fivasYmefLdSTTqgfP9gPA6NsFSnb/3RvkaqCVaR/dHR9bw4vRDnb5+TVHf
         H68Kr0kkbsvUmb/N59vXUhuJ5GNpRv/33Dv9LBVMDPXhJSJUpqAPgKFmzwMgwgIGVTdN
         za1rQr/C/HDB1fzkK+iqmY0BQqiLZt/ApV9n7HRz/xLwKrIX/VqHpFZb66v5Yg95qWdz
         /hsQUwwbNwuWj2LNqQUNHCmIFJy2vrFG7oBtWDqPVvvP6rHhuHrgI8rnQ7ZLAkrH6t2F
         EoyHLYQTVS38g/U2I3o6V/s5Cv3CsSdE0TDCaBmPT3AfnNsr5IxQ6ZUm5CVtXOl8L/H2
         ALkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934887; x=1752539687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzAwsuW1+0LZAS28lU0/GaU1LO8J8uSYjkSQLSp4PDI=;
        b=nmndH2FLsvm2qwz/UpMhL+8rpn9dM0X8p1zEuVjpGccgGHsKuU7yFncBFkavS9s+3G
         f+XWqT+TcTsJTNgbpkPsD/C+i8HfOtBedH7IMMXS2mspi6duLCW08+T9sjWDe73nHRkO
         hnVgym5uUhiL3KFRpmoZx5XyCJS+foTV8n4R7W2w9FiH+b/WXtL4ijqwpPf8moW+cbKP
         6/yhko5nFlcAfyhvr+qvXMtzxHALWjLQiUzva8BSn8BSCE+LLKD+R8fmH+nLPTF6O8Fp
         rPEsbEYwINnpCcPNLb0qR0U4JEM93YFuaPqmx7b2wM+KduF4UUjHByn3F8JEck6Uuin0
         dzCA==
X-Forwarded-Encrypted: i=1; AJvYcCU6bdG1VLNvWZLA/2lzubGAsSLay2/P4ataW8UqF+OM08V1LEg6LTGVHncbEyiq0zaqdtBOScfFPLttRuTHIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtWp2xQ08Nl7+gCAiFnJScqm+MWOPqC00Hfm2nMfRRC6VafcX
	hyfUth43XD3/i2eb7NAyzysxcOleNLMaqv47AMuazV3XsWf9OwO+SXFLT+C1Wa8f
X-Gm-Gg: ASbGnct7FkuDw8d6X1htV7Um+RCFANRRPVCL1Bkt1iGDZw7OhNaduW0R8tUzAJrqft7
	usUmhOcUMT47ZDiXrTd/n0jY5rDpb84S2BQ4i4g7mT93kOQqgbWq4dgwJwV1Qp8a6UJuaTZK5v3
	AGhH4wB5DqKhQeb4U7/EJd3WIg8QPbVfAFGp6bsuWvaKpJD2v9sZeD5MFc948swIsp/o/RCiixH
	ur0z0B3LINfxuOV1mz5fEmNyzJiIGr4XdFCMPDrp7GJT106d/sfJeHLwSgFJIGr1hUZXWswg9WZ
	Owqh6z53JRcyhsStCwfApR/zzqZrvHw+ldCqAOzk4IvZHlB8
X-Google-Smtp-Source: AGHT+IFGsXRF7Mh+PHb+NS29/pBUgxmYxiIdI05h/rgb7mY3cQRMWHgRY7Ad5DlsP1zU9ujTd/GL0g==
X-Received: by 2002:a05:6214:2283:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-7047f0ecabbmr2605516d6.24.1751934887129;
        Mon, 07 Jul 2025 17:34:47 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:46 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Mon,  7 Jul 2025 21:33:38 -0300
Message-ID: <20250708003428.76783-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
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
2.50.0

