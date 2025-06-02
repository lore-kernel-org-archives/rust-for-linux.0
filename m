Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0241347C7
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826432; cv=none; b=RWsjHTNFzZ/C5MWiyVIwlA70CRmrU/Qp1M1oqo5Evk5iBNoC/SZNY5Up0rBCK+JYejHDIM2aR8kbeEyq3avc65UEK2AI+5E5Bwe5XRkK6NxShzbhoYx0XoudbjHQpos4Nbxwk+UeMJFSdB40hPCDi8uvPd5z/4FB4w4OLgjRvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826432; c=relaxed/simple;
	bh=zKUbplKeRnCJvLOKyAOsoB0IHwghWb9gG0zIcb25BGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6d7u6rNnOp71aiEYTypafFAzjJws5hnqZAnktw/j1F0pcUggkhyTA7DjolV2AXWqN9pfgOwOFAhWQVbrR3CaXlv/6nGcPXFbESpPUBcmXNw+1Lny+OJ8tvoMFnqnOHUYOwkPt3u1upLqdFddF99AoRvtu2WoNbnsTo6vquCWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJB7tnRB; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJB7tnRB"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1178945e0c.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826428; x=1749431228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=gJB7tnRBZa++WfGoXr52l4Vh3highHjOO01P3Q+jprvv+05kp3j5uSArxf0gML3beo
         ULaNyMR7jvpsYg8yZNtWPdVNv8efP1mZYHuPcGFEsY9Pj6CuLahupshIyM3EqHrtX+eD
         eU/sFWcb0KL5fxBWjkgP8UzdqQaGhIZlGchmWInjjl23UTh1YXHqgQkEV0dDTqflHN8t
         cOeZXFyCPw34+TLSJYMV6hSKKEVHZYkLp6vDU8wgpDSiotXuvwVKBb3uDTeyRx+iXtHk
         GhRfmoyAwx18uQLURkYeyMB+eYH38r7jfFaMXhFNRfwQ6xrb75amikrtDK9I4HfULqTR
         5G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826428; x=1749431228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=qf6+tDcIrFtlMwVxvH0nba+808D7s+cCB/Gb178lrFXHEL3gTLLQc1/fbiQ80GY07y
         qs5zPNYeWoGaIrD1fXCUp7Er1cRCoMfAIgVc+bt0282s5E20h/ctMTygMvnRZp2jgNGA
         Dr1q4qkOXFw8B8tSxnxsYUNLPcFeIzYox3871dhwf4NoB5b6pZBQUrD6sOPEPtAZVGI5
         u0zfpQbAnp0+P+C5dZYmNz9NW53z5QAQ57jVmGoMmmTdvpUAScf5JGMd14lC+WNi4vVq
         Ye57eCJUfC+Ozt54gtdZmSifuohXycYor6LW7iB9TU3kDZZyWPQPAixj08PVfttV6cqM
         J3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWJsZtECSvfjHPKqOKiZE4Ej6Kyq5J3i3Fap75po4VSX2g8Fj0a1TsvsKlO07GsdKiqk/MoOnTrQ1cBv9mQwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJtkKo7UDWXUedRGvQSaOuEJAl91sF928MtUswc5hD+cvuUDoa
	9tY4s4cGYk5wVlRxC6UHdtGB+mpQo66/nUlo9W1TWSCh67v+dCy9WnPW
X-Gm-Gg: ASbGncvJw5WpaCO3LoS+b/nolw3Nlq7Jt1sqDbkdX4DjxpMd6kmQ+UmX1mM1VypJiSI
	lYwLjzx1PdgSkpk9+b/kIx/9wQgY+krH424/Uono77DcPcn1QvfzjexWdLD1pFEnus18aMl/g4z
	OjzJWTR81hGzoKzh4HNWqhwnsKC+IzNWbbJrCjbkaoQ6C1Adp9O/SKvwG6FBKRWaWw9K9YxEuSL
	Zhl2LMFx6RbacqKUaaIrs4Va2AGK2kGWoYK/4/lhXsaegb8zHsjoTsbsQVFClT67nyuNXfQmQJX
	dZQ3heYLMTJ7HL+mfA66A63/KJhiS/JJMIbHu0UeOFEQV2gqB0s=
X-Google-Smtp-Source: AGHT+IH9Sq+xNPQtlDmy56p9U1etf2eBWfeT5mYxmCUV6v6jEvXPbbM94yE47q0w50Mx+8KX7QHm3g==
X-Received: by 2002:a05:6122:1812:b0:528:f40f:347f with SMTP id 71dfb90a1353d-53084ba7b49mr8372477e0c.2.1748826428501;
        Sun, 01 Jun 2025 18:07:08 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:08 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 2/3] rust: revocable: simplify RevocableGuard for internal safety
Date: Sun,  1 Jun 2025 22:07:00 -0300
Message-ID: <20250602010701.116503-2-marcelomoreira1905@gmail.com>
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

This commit refactors `RevocableGuard` to hold a direct reference
(`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
internally safe, reducing the need for `unsafe` blocks in its usage
and simplifying its implementation.

The `try_access` function is updated to leverage `try_access_with_guard`
and `map` to construct the `RevocableGuard` in a more idiomatic and safe
Rust way, avoiding manual pointer operations. The associated invariants
and `SAFETY` comments for `RevocableGuard` itself are removed as its
safety is now guaranteed by its type definition.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index d14f9052f1ac..43cc9bdc94f4 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
-        } else {
-            None
-        }
+        self.try_access_with_guard(&guard).map(|data| RevocableGuard::new(data, guard))
     }
 
     /// Tries to access the revocable wrapped object.
@@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// CPUs may not sleep while holding on to [`RevocableGuard`] because it's in atomic context
 /// holding the RCU read-side lock.
-///
-/// # Invariants
-///
-/// The RCU read-side lock is held while the guard is alive.
 pub struct RevocableGuard<'a, T> {
-    data_ref: *const T,
+    data: &'a T,
     _rcu_guard: rcu::Guard,
-    _p: PhantomData<&'a ()>,
 }
 
-impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+impl<'a, T> RevocableGuard<'a, T> {
+    fn new(data: &'a T, rcu_guard: rcu::Guard) -> Self {
         Self {
-            data_ref,
+            data,
             _rcu_guard: rcu_guard,
-            _p: PhantomData,
         }
     }
 }
@@ -222,8 +210,6 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
-        unsafe { &*self.data_ref }
+        self.data
     }
 }
-- 
2.49.0

