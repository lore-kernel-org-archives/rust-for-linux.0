Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F729A9FA
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087490; cv=none; b=cTVHo4K2MBsBJmcajiV6ZJgMYVbgjrStMYOlS+UPxCEG5B4Lxlia9c++zj28uoNKQZ5KQiBbrts5XpjCNhgLT4y/n+2a7FNns8F3wolHr6rOzx89x6BYUwyIrtJhMksrGlk3GGqnrbLPc5z0JzfgcPd++gtwdi0+3+LepKPblF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087490; c=relaxed/simple;
	bh=J/6Z+clAGm9xhqcQdY3gs3ezFeYbzQHcpdEPhPx9Y0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRhHmOgZvgBBuIVII5YM3CVQeS6Ysro0fwnB0jQfcMe+Dpc9LSoQzcIOXMqgjsPTRX8zELjydLH6qPyuhgVKbblVAGP5YCNvitFaxNFy2IM2Mx8IemnQRXBUuMrrK/kPmww4jhrVK7eDmxK+YLDEvtteMeTYpqut282k5doB2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM/JLHA0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM/JLHA0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e2762ad850so10225789b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767087488; x=1767692288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FClmzE+Gj8uHp32vQP+9qhimjHkP10HuqGxVnwIf6yk=;
        b=WM/JLHA0zr8gAmxvEflTfKdNFIm/NZOSr7KdkA0zch1X32x02EeKxX7ma+8vsjlTea
         xA0YlODgbOKTnYpaW0fMGzykGOKkTSEdSSzhtS4g9Ap5i6G/WQRObsD1koWwYkFgOiOE
         NvD1u38oxYNuQiF/nqZDUh7Nuf/KuLKD0T68mqak/a+ap14qEVPWU5J1jMci4OBv0UOr
         6zDeDICOni04JCE+K7maU9tyBLtNXHkugI1u+FBDtKoEV4c1y5HtBKN3g8HH0yNEjTPK
         JCiE+uZYhnj11aGa98p8yhGKFS3btbElHwQMtfFdZMfB0Ip1E+6dMztMnig35BnWwlCB
         tDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087488; x=1767692288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FClmzE+Gj8uHp32vQP+9qhimjHkP10HuqGxVnwIf6yk=;
        b=Dgo4QPsbqwpclBm4BbZ32d/h0bFcSow4YJxTKMUy5FPmI2/HL1+KuyVB3Bliqj9pmj
         EnbVtm3YMU2X4u00Lr6WhgORkHZenN8NN+GLWvs6t5f+kjOMRrTudhoWnvFGIMmvK8aG
         mZaw6CJ5dNXMQ+PuyxjHdsqvuDhSmPj7ek1xuNy41Tx1wblBBbUc9mGP1LRKjKNyGcFW
         ltpDWdl3y/ln7FDRvFK61R96xusSHTC9tO7sC8ceRyzZbGUGtBlyfCXuysf6aI/LGx8K
         Ohx0wb5l9z3Jkx/XAIC6ti3F5Cn4QH2fAQ9+6Jh93e9qeSIjS0s2hQrknYdHKfWlro6D
         DStQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY/BEq1tlsO40VNSViGl8Dr8jX04Vd+DA81odti47w+IlLEoXIT5/pd+e6flMAeIOSeigU70zQIgG96wOCMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfx1pXQUO0oYP7u72nv0zxCr3Scand9dCSVKmub+gJcrAZDohv
	/70fz74b1OKQ8wQQSBqH4rJJ89EkBGwofduA29BWY3Ve7yx6eQFPV/QU
X-Gm-Gg: AY/fxX7y7ihMN/pxiCm2xFDuWU7Y080J/ZBmv1R0/czUUdkDKmLtJnFYplztVwRUXe2
	oujp9s5E7Uk5oQoxByS6/AvNpi7c0WXmPktbdoEB3rmhWGNw95G6MbcFft8wi+63Y3ZfLwW5B7A
	FIlNR8QNZsROQBbv3ZfEnQ9vpHvM2WgB2RQWEXe0SfH8/KuUE4JqDYQ9131qEHB7O7OQeRLlT8t
	5gcWEWryQinyBsEEc8F69cNej07q0Nv1o6gYJ9EdN4OGouNf1EOrx2m98Vx1N4hB4RURDf+FbX7
	MRAi5cOLBazELNmvPAfmcN816kw1Xv0Bw06JRr6JbmKj8kRBgupz7zkDazQ1XXOfMh8G4bRTRk3
	OhWlBxEsFCMTNnofbdY2ej8atiVpdHcCdxRI+WAc5boWIBSnlfPDvBESwTW1yX/0/yyFrY/WTBH
	UYCIIXw1K1lVCZjwGnSy/+dGvZZEtStRrepEaKak6kwmd5sJhbcUR66LmvbWN5kQ==
X-Google-Smtp-Source: AGHT+IE6tnjld2NRJ+upYLOivkz+2XzjKFcV2zn2AfbS/tc+0UP9no7fLBBEGvA17SSTUB6bErd6dg==
X-Received: by 2002:a05:6a20:9151:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-376a94cb49cmr29095166637.47.1767087488052;
        Tue, 30 Dec 2025 01:38:08 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm13378158a91.9.2025.12.30.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 01:38:07 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	boqun.feng@gmail.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 2/3] rust: list: Switch to kernel::sync atomic primitives
Date: Tue, 30 Dec 2025 18:37:17 +0900
Message-ID: <20251230093718.1852322-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Convert uses of `AtomicBool` to `Atomic<bool>`.

Note that the compare_exchange migration simplifies to
`try_cmpxchg()`, since `try_cmpxchg()` provides relaxed ordering on
failure, making the explicit failure ordering unnecessary.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/list/arc.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d92bcf665c89..2282f33913ee 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -6,11 +6,11 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
+use crate::sync::atomic::{ordering, Atomic};
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
 use core::marker::PhantomPinned;
 use core::ops::Deref;
 use core::pin::Pin;
-use core::sync::atomic::{AtomicBool, Ordering};
 
 /// Declares that this type has some way to ensure that there is exactly one `ListArc` instance for
 /// this id.
@@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
 pub struct AtomicTracker<const ID: u64 = 0> {
-    inner: AtomicBool,
+    inner: Atomic<bool>,
     // This value needs to be pinned to justify the INVARIANT: comment in `AtomicTracker::new`.
     _pin: PhantomPinned,
 }
@@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
         // not be constructed in an `Arc` that already has a `ListArc`.
         Self {
-            inner: AtomicBool::new(false),
+            inner: Atomic::new(false),
             _pin: PhantomPinned,
         }
     }
 
-    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicBool {
+    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
         // SAFETY: The `inner` field is not structurally pinned, so we may obtain a mutable
         // reference to it even if we only have a pinned reference to `self`.
         unsafe { &mut Pin::into_inner_unchecked(self).inner }
@@ -500,7 +500,7 @@ unsafe fn on_create_list_arc_from_unique(self: Pin<&mut Self>) {
 
     unsafe fn on_drop_list_arc(&self) {
         // INVARIANT: We just dropped a ListArc, so the boolean should be false.
-        self.inner.store(false, Ordering::Release);
+        self.inner.store(false, ordering::Release);
     }
 }
 
@@ -514,8 +514,6 @@ unsafe impl<const ID: u64> TryNewListArc<ID> for AtomicTracker<ID> {
     fn try_new_list_arc(&self) -> bool {
         // INVARIANT: If this method returns true, then the boolean used to be false, and is no
         // longer false, so it is okay for the caller to create a new [`ListArc`].
-        self.inner
-            .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
-            .is_ok()
+        self.inner.cmpxchg(false, true, ordering::Acquire).is_ok()
     }
 }
-- 
2.43.0

