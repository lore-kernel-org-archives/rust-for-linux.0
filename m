Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64767101EE
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826434; cv=none; b=RTedecMKMO0XBINSIV7qNNrAKduZFW8GwOw6SSXMYIj55v0P92NacdX7wCQO7OW+6QbuFxiz1GVvMWJCoDCf4ii+i75U5FBJkWT07Co/yWYiXjMzdpCrGhSdpyyLfKp2yEVkFJRaqxYSTkIvSSRrUxWtaAHW5n0mhPPMdBOTR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826434; c=relaxed/simple;
	bh=cUH/AggEuguei7YgUl376puy8XlQF0imPcYcuFixUO8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CayWf/LrQWYJWSxuYX3a+7VP3eruDrXqVBx2rJ1Jp7SrAmSvo/wSWBZeDDPtFj/oj0yZLnBFWQI7O8Yz+5jTRXzCuOyBQqTs6RSu+wjWXO7mUrlSWfzfB94vM/r/ruDiFVU3iba0cnU8DkL2ElgKJ4P1owagWWqAyYTRojKqZ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR/LKw1V; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR/LKw1V"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-530807a8691so913781e0c.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826431; x=1749431231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=CR/LKw1VOmuFv1FabBKVU44n/8qTak7B7Ycqvy/zWBHJtoATTVMcjKebrDhzkGcy5x
         uWVvintbNEckseE9zjINKF+LCidz0c5kdOZbrboQ9wHn/TnHh6tEERvX4EJnj+9ahHqE
         4YUpccbfRSE6CrwWtkBM8D41K1Q4Pe+LVsmq5iykTVsvwQ6YDgrngyvxl7QGATOkP97+
         MuBrofeibRFmmj41C374tnGjxD45+9C3aLOnNiW6qs/gnE+AB90dLsXm/RACMvphxcfj
         7znYaO8pmCBFuccu0UciWsXGV88bEgmD1Zg/SURMrQqLmnztw2U4z6jwpYtoWGf9gl3B
         J1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826431; x=1749431231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=atdPJAMBxhXuLjePKzuwhk0oA/RbupSVaqMV88l8oUfIujHVBpsNH3I/h2tc3j0HvH
         BKewFZt8Elf7Jf82aD7yivjiqutXUn9Jh3To2ScI1g8tULUy5nDnRo/vJb7fkjaEgVMK
         nL0zpXdDhkOkYUGf+TCY40JmBq/nLIXRLz5R/YOY1DBjzxTi+dEomBMtLhnUa4d2HVWM
         XTmgWgvpHeSlC0aD5qsBCsEqm447BRpeQdf2wVoC+3IC23WTaQOZbWuWJYEqn0FQAnnU
         F6wi9hluSmyLh74Ehq2t04yp5XyDL9IWDEfQo8oS7fOOmeB0LauyMzFFB9qKMhTdTrw3
         uUNg==
X-Forwarded-Encrypted: i=1; AJvYcCUCDCjbIR7NuzPMF3zLOweU+b7Is2w1Fc/lOpnIBBPsC48a7g6vU+bVp8A/uW/zvc8fNh62glnDEh5LjnF3Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIXe16+oHq1WjwXbFqIOZ2A10ic4DiNE+Cora39wPgTsl4DB/
	c/BH9aO/JfeCQdDGadCpMXnsHP9l5iUAmMCjVCmyfQ+OhIFbn+qIMT+ThX6Dcg==
X-Gm-Gg: ASbGncu3L5WtWRnOSU0Bdc2G/uacXimNlrHx+cxKIo3NFzy05kWnJYQaQ8z7M9Bjxdw
	pOjWUvfYZn415JNNxmwMO8RNTAT3OuFo2HmeJnK27M8cNLAXAyI3tlIQgWFo+WoA/igqkN+RIoL
	T9ls32c96De4QuA9O2OX+9vTnZAIr2QMTkqNU1uFxsK5WziNhgTootERS+A8/7A+HVSlO5SwbDX
	CepqVDwQ6yiYh3RSaNZdqtB+qD6r1owIUrJbskgFCSvtHL2Bu1UEzdpA5a9HiKzUk0OOgDeL07i
	9UHnsoAfFhF7H/4GsvOZk50mpO8kGtu0LMaI9TdS
X-Google-Smtp-Source: AGHT+IGC/aUcIt7oP/v53IzgBpXqZLznqR8QP8Q2BBdSoMfGOioOF4NLnrElEkqLM5R7PxWuyT6MRw==
X-Received: by 2002:a05:6122:2009:b0:525:bf40:e628 with SMTP id 71dfb90a1353d-5309377d018mr4135149e0c.6.1748826431100;
        Sun, 01 Jun 2025 18:07:11 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 3/3] rust: revocable: split revoke_internal into revoke and revoke_nosync
Date: Sun,  1 Jun 2025 22:07:01 -0300
Message-ID: <20250602010701.116503-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
References: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit refactors the revocation mechanism by removing the generic
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
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 43cc9bdc94f4..daf22e3a7d20 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a
         }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) {
-        if self.is_available.swap(false, Ordering::Relaxed) {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -165,9 +151,15 @@ pub unsafe fn revoke_nosync(&self) {
     /// [`Revocable::try_access`] beforehand and still haven't dropped the returned guard), this
     /// function waits for the concurrent access to complete before dropping the wrapped object.
     pub fn revoke(&self) {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 }
 
-- 
2.49.0

