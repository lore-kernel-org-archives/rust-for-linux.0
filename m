Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87C2C3254
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 23:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906935; cv=none; b=uou0G5wlBK7TBAf9SgMdDR0DeHel51vAORw4K/r5E3+ZKcUTKo8AxW7P6os9H8tJzy4fgRLlrRoI5o3bTf7eFaffHnoZsbfbyevM5mIQ0d4n5Yix1/pY+a/zAvX1MF3zBNGXOgc8fvB9/0RoLia6VRXqPsrAGvpxCUV3YTlIpTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906935; c=relaxed/simple;
	bh=zKUbplKeRnCJvLOKyAOsoB0IHwghWb9gG0zIcb25BGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baQ484G8ZSUEvBH5aoMY8JheOSxK63u+vYnz2/u1CHFsstH/9UXDUGg7kOgvVQLfhpw+ipcpWtaExHhbQ+ZifNKm1Im5+bU1Co53317Q0b9evcbH69lnruj0bcFq6NMuuXpIgcKtuGSvKP2xO/nSw0TM1f+aHi+TMD6CTrb+K5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu3O4vnm; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu3O4vnm"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e290e420eeso1614233137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906932; x=1749511732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=lu3O4vnmDVxtp9kOdNcnAqETCgYKwEy6N7uM99XB6Cy8DbA4aA390qzO3AMM2Pbehi
         a/KKGU54jJ7DXAWzQDMNRQmQTCxu5uB+pn/mYO9k1xywOD7dK5mbHBwAF8HxCzAy8A39
         6va79bWIXHrORwWxOeqTdPSa5i0dW0RIVXWZV6Zr94oO9qARjmqkWlxBTsclnMXYoKt2
         juqby8WcKkz63lp1E+dnJ1940FLUgqSazbuNwiAmA9Vtp5yN9+lGQwv9cEAuFzjQ04N/
         tEUvwK9t2e1ALs3Hn5Is2A1QYPeuWKGPIHrdxSy6jZjW2QpMJJ243QjeQLhVFnRhpeFm
         tSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906932; x=1749511732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=d9UVHlTs1rnrWHyW4mFg3jSXbtoeU2n70M2imS86gXSGlpOM9ko2kvpJQDAK/yap3x
         xbf6z+Hm2wX0Es6GyjjNVZfcEvQke1rJ1bWpyHs0fXKrVY9zm4cmsJ3Mne35lQHSic9+
         dJdazfiBZjY30waRIVxrJEGqsMfGE0gZlV4wPtGrPuA/DjzQp85KRbUz9OUBcPCUvvPt
         v4RMKZbEbqqUZxHTqjSd0rmwHG9zWdNxW0+xN2VOgAF6fiKuU6KAjX0/jKZv0LoJ0goQ
         RuBSHdvQqM+HFhMm3gfrCVDwN4yejdAePnhuZaiwonKX0QZ1eQ1GoFyXMbtLUV0XMtDS
         QnCw==
X-Forwarded-Encrypted: i=1; AJvYcCX/OX9gFbnlq5tXktQlVUxOOS6kleMwOM3PbjmXY21LUVzSC18UJ56Dpo1e684GyIIszN4IvorUAvQl5PZ9xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVvpopgKrzSYm7BuYT7R2OeMrJDnFeK12Ro1Hw1pg8+xcIaB/
	HvyncfCqcMmkyXuBUBjTyms7CLf1mxiCi06xjG8+aE5TBpDNq+ASe6Bb
X-Gm-Gg: ASbGnctRBOdKIUv+fC6KaXfPze0q5WfYOsLd7DcCCY5/y9k5jYorQ9ntzC5k9ZgAXhL
	HGnsEdx8/g2mga5pMVg8ZHhRYzPR0lCBGwrb2a1soQvF4HYc3ANACcvaM/yitcaIdlCT1fvggQM
	/m6EtUKQIj7MlIEMyFTIj/fLSPRP+mivFZGX3QT8I6SdNQK03bQ32xppETbxMap7H9tJfpSPXSs
	VdCpjQvBY+skcesIvkTseg4dgcqgQ+vu7AS0adySSSerBW2PEPEMNJHTqPoblpmxuivRC9nxHFb
	dXmM7nOA73MoNhGUgaxABopwZdR94qK5Vn/Mh39S
X-Google-Smtp-Source: AGHT+IEsjDcgou43Z7W+OGELytTSngNXlueMC8Nvfm3jxxkpsIk4e7KD1MlQ7Wy/v2dX3JJSceYbPw==
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id ada2fe7eead31-4e701bcd515mr7030749137.7.1748906932191;
        Mon, 02 Jun 2025 16:28:52 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:51 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for internal safety
Date: Mon,  2 Jun 2025 20:26:23 -0300
Message-ID: <20250602232842.144304-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
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

