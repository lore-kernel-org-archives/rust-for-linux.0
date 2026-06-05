Received: from mx2.ucr.edu (mx.ucr.edu [138.23.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129CE3043C8
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.23.62.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635990; cv=none; b=WucHYpWYvnwiqmPpDWfH9MCcGLj3mqxNZr7NXrrnknsNldbX86hzDmXfUC6VeHkgcAwULYqon0YRFugJt32aV+HAOQQ1FCoeedCS1NKqVacp780vd8nkdCPcYwvHjWxPaGokwjC+B++DrpDu31BOq7PUBxlt1Ksunaiu9OquSgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635990; c=relaxed/simple;
	bh=Hgw9GaQpLVnOBDY7cyXU3+1xIWiaE10nyRkYBPFhEWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjdzwKlOHfxLnpRCueHksAtZJvFS8ptCBvCnHTc0wSedzPQ6I7Tp//ZCsxUIdairrwhQFCKlFQR6zVd1+iTlgZdj510zE9PznhDvfZ6d1jhNNbxyx3B8WJc7qJ9KW1ist91uTLkbZjXoh9D+iCmMorG9jAc5lAkDtEWUre4Cyho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=qx8u3dNe; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=b2YxD6Yv; arc=none smtp.client-ip=138.23.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="qx8u3dNe";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="b2YxD6Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780635989; x=1812171989;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:from:to:
   cc:subject:date:message-id:x-mailer:in-reply-to:
   references:mime-version:content-transfer-encoding:
   x-cse-connectionguid:x-cse-msgguid;
  bh=Hgw9GaQpLVnOBDY7cyXU3+1xIWiaE10nyRkYBPFhEWo=;
  b=qx8u3dNe2F/rRJqB0+GaJl8cUDqcbWrHea7v7owxDjaVJA7r6g6zO7VT
   mev8rF6ZyGZtmF3SGk7fzIcm6rbOnFa24+6OvuMXrONnqxoMXNMHlNCzz
   Aikv2o3oRmgJ/2yjqvbV5G8yU4WyB3u5PudPx4uyFFP/TDxJwGKmHnADc
   tKyzqJDpXO2h78ZXRsc2J7Ej7ehhQAV3CDp7fOSv6xoGEHpk7q12YKRb+
   TGeLAp27JnClIhlFvpNL6hbE32f/6Qpo5ikYyUWn9JZl8/YJdM0+JtIUs
   7dGWTlOhxMsKJdwYjrGMeegWdlT/zNI+ddnXZenvizSML2iKbWW5SWRkL
   g==;
X-CSE-ConnectionGUID: kV4xu6/dQI2y4qYteQ/huQ==
X-CSE-MsgGUID: +RjXhPdmSfOX/rr3OTp0jw==
Received: from mail-dy1-f199.google.com ([74.125.82.199])
  by smtp2.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 22:05:21 -0700
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso1278693eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780635920; x=1781240720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH00sjrIZJLvXlpl/cEK83JOtt9KTud2zwX9/O1EGoI=;
        b=b2YxD6YvkNgTV3op4uu2q+hy612NqqN4izOFXY2BCo4WsvBDw25oxq8gxbNwXA1K3j
         UTNIWeG7bzm1JtR5aa9ZDEa/6nqFplY/lQg5IIBxR+/MhSc3HK9QpPzCwmEJU8Fl5PLY
         96d+/09kGTR5acVTStT6neSybt0g+m2FMllig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635920; x=1781240720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oH00sjrIZJLvXlpl/cEK83JOtt9KTud2zwX9/O1EGoI=;
        b=IYvKLeHfdS7tjKj1m0wyARjEToetzlBA5TLfjUmh7tc8HGV3cY2bIysrw3SGNbJHnu
         +fCDAQF3I1r9NabPH/ogow8hn/mcQDxvaVLXWHeKN0y6z8T8wcSaietQ8seDi85pAQyq
         mNllfiq/vk4cXp0BHt+kKTlT1lofmJxlfgdMOuXzZPI05fd10BYMCBbNZsiOQ8lTmEWs
         NZfs9gpyD3s1F93H/klx4Qg8Fdl9Zf5JkH45Ah8Zm4vSOmS0rYVIqDjYBj9xDhzpHwhV
         PrfTZK/AgxN8hJ0oUxWIHfvz5YJdRU8Ap6GyS67aIAosuXu4ckCTuSFwSYtUFKvX3CM2
         iwrw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vo+pXjgnFT/QBtTI7A8G+GL6IuaBWVo3dxq8jOkbn++5UWopwM+rAm8WcaDHNTLwIhypdCA+cOf39AcCEkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIo+BkJHy26gC4a/zckGtqnVDawnzuHgo8oDe0nC2ZKgevVcg6
	r0aTQiO9DArRpS4/vlkTg0b2JUlnxqvXUjvVRsJ1YASspo/nyrm7SfjI3LA0WuUFqiXFlRouvgy
	f9NicbDwdNyJMvLfbDUjB/mRZfmqgNYbdqGbqHlVMzDzmC6602y9UVRCDOjDUMTBMtOy+bw==
X-Gm-Gg: Acq92OFNIuyYVwmKkxddYTH67K7ICEnG7vlkuiP+9YsJMKF618kDCqoFmgQrA7ZvvNN
	EJxMdbx/GWxd8d9vSTP6wEgl9DoGx0Jo5uauiFFNiQw6f/WfrNXfDaMniAWn/B+x3xemgtwmUJW
	TwNM5/AY3NPU3fwUgXuK3TInyPzH9nvQUZfmO+nKh7cRYdfDtzsDyqIYgAx33A2v3HDpJIxkWJ5
	Yjxsn3+T4VqJDipMcYIPBLRigqsRhX5IuoieyPSo3LFySn07CE8vuOfGTTRhC6r3OJiipHMQNAY
	OLJw8YnTo2Qul93fEdIUBSZaxqV2R1c6dhHhi2q2AFVobjsfBtbI6oEofaAVdacvJhT+T+KYa98
	Do5omJyPZJ/yE5SGhZXHxsDT2WniKkXLdI2P5fpl15S/uIg0h4gIp88a5dfP6IS8OJC+3I+YnSd
	l5m2l55Ov8mtATkJ851SKVaU54m/OSAnsvtL6NWdwZO3HPJ0X++AoZbEyNHCHkrONlMKFPMpsAQ
	AN1IABI7NaY
X-Received: by 2002:a05:7301:5f09:b0:2f3:c3d4:382f with SMTP id 5a478bee46e88-3077af4b038mr835236eec.8.1780635920162;
        Thu, 04 Jun 2026 22:05:20 -0700 (PDT)
X-Received: by 2002:a05:7301:5f09:b0:2f3:c3d4:382f with SMTP id 5a478bee46e88-3077af4b038mr835224eec.8.1780635919663;
        Thu, 04 Jun 2026 22:05:19 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e76sm6566447eec.18.2026.06.04.22.05.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 22:05:18 -0700 (PDT)
From: Yuan Tan <ytan089@ucr.edu>
To: ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu
Subject: [PATCH 1/1] rust: revocable: Fix racing access during revocation
Date: Thu,  4 Jun 2026 22:05:17 -0700
Message-ID: <76ebd9da442f45402c36bf88b8df5f20d839cc8f.1780635248.git.ytan089@ucr.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780635248.git.ytan089@ucr.edu>
References: <cover.1780635248.git.ytan089@ucr.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revocable readers currently check availability with a relaxed load after
entering an RCU read-side critical section, while revocation clears the
flag with a relaxed swap before waiting for a grace period and dropping
the wrapped value.

A reader racing with revocation can therefore observe the old available
value and create a reference after the revoker's grace period has
started. Such a reader is not necessarily waited for by synchronize_rcu(),
so the wrapped value can be dropped while the reference is still live.

This also means the Sync implementation is not justified by the stated
bounds alone: sharing Revocable<T> across threads permits safe readers to
race with safe revocation and hit the same use-after-free.

Use the kernel's LKMM atomic flag for the availability state and make
readers claim access with cmpxchg() instead of a load. This orders a
successful access against the revoker's xchg(): either the reader claims
access before revocation and is covered by the RCU grace period, or
revocation wins and the reader fails.

revoke_nosync() intentionally skips the RCU grace period, so it still
requires external exclusion. Tighten its safety requirements to state
that no new try_access() or try_access_with_guard() calls may race with
revocation.

Fixes: 0494d9c82b0c ("rust: add `Revocable` type")
Cc: stable@vger.kernel.org
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Yuan Tan <ytan089@ucr.edu>
---
 rust/kernel/revocable.rs | 56 ++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 0f4ae673256d..0b56c1259404 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -7,13 +7,19 @@
 
 use pin_init::Wrapper;
 
-use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
-use core::{
-    marker::PhantomData,
-    ops::Deref,
-    ptr::drop_in_place,
-    sync::atomic::{AtomicBool, Ordering},
+use crate::{
+    bindings,
+    prelude::*,
+    sync::{
+        atomic::{
+            ordering,
+            AtomicFlag, //
+        },
+        rcu,
+    },
+    types::Opaque,
 };
+use core::{marker::PhantomData, ops::Deref, ptr::drop_in_place};
 
 /// An object that can become inaccessible at runtime.
 ///
@@ -65,7 +71,7 @@
 /// ```
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
-    is_available: AtomicBool,
+    is_available: AtomicFlag,
     #[pin]
     data: Opaque<T>,
 }
@@ -84,7 +90,7 @@ impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         try_pin_init!(Self {
-            is_available: AtomicBool::new(true),
+            is_available: AtomicFlag::new(true),
             data <- Opaque::pin_init(data),
         }? E)
     }
@@ -98,9 +104,9 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
+        if self.try_claim() {
+            // Since `try_claim` succeeded while the RCU read side lock is held, data is
+            // initialised and synchronized revocation cannot drop it before the guard is dropped.
             Some(RevocableGuard::new(self.data.get(), guard))
         } else {
             None
@@ -116,9 +122,9 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// allowed to sleep because another CPU may be waiting to complete the revocation of this
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
-        if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+        if self.try_claim() {
+            // SAFETY: Since `try_claim` succeeded while the RCU read side lock is held, data is
+            // initialised and synchronized revocation cannot drop it before `_guard` is dropped.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -153,11 +159,21 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
+    fn try_claim(&self) -> bool {
+        // Use cmpxchg rather than load so a racing access cannot succeed with the old value after
+        // revocation's xchg has changed the flag to false.
+        self.is_available
+            .cmpxchg(true, true, ordering::Acquire)
+            .is_ok()
+    }
+
     /// # Safety
     ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
+    /// If `SYNC` is `false`, callers must ensure that there are no more concurrent users of the
+    /// revocable object, and that no new calls to [`Self::try_access`] or
+    /// [`Self::try_access_with_guard`] can race with revocation.
     unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+        let revoke = self.is_available.xchg(false, ordering::Full);
 
         if revoke {
             if SYNC {
@@ -165,8 +181,8 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
                 unsafe { bindings::synchronize_rcu() };
             }
 
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
+            // SAFETY: We know `self.data` is valid because only one CPU can observe
+            // `is_available` as `true` in the `xchg` above.
             unsafe { drop_in_place(self.data.get()) };
         }
 
@@ -183,7 +199,9 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
+    /// Callers must ensure that there are no more concurrent users of the revocable object, and
+    /// that no new calls to [`Self::try_access`] or [`Self::try_access_with_guard`] can race with
+    /// revocation.
     pub unsafe fn revoke_nosync(&self) -> bool {
         // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
         // accessing the data anymore and hence we don't have to wait for the grace period to
-- 
2.43.2

