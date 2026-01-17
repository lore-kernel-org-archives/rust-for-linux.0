Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5AC22A4F8
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768663531; cv=none; b=Q2WQPR7KKH2J9bLSqR1PaX4sjCg/q+5AJHpA+YKhT7HzZiw12ysFoMhtO9Fu7gIOuwqV3CMbU6I0bFppolAWIydvRVfeXDsQVMN7Bhd+xhh3R2cl/Vl0/g+cAC6OkW1W5IzyilQCKcMiQge+Q/fl4j+Lty9cbTN/KvsuXYQ2z4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768663531; c=relaxed/simple;
	bh=AwcTgsthYx0aIP7jt5SIJ3bUXr4UAdp7zAjyr7QxFZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IVkslOA5M7u+xmprcDQKxNYBWp/zlASPNpdG/AkWR3O8Y2VzORD0jWp+KC1gvowSjz/hts3NgB6x7unsSEv8rDjAPrKvZ5un074cpfHzcVJWPShyLYYF75HuIsObJ1eOVv+SQNzoyx0UP8GsElobiT7JY+oNVJwuPMhHHMnLohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F56Gdrlp; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F56Gdrlp"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7fe37056e1so342114766b.2
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768663528; x=1769268328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KycL/RP2UnaKXzhbUKxpWD/C+4095bTNRjfo4uJ3+8=;
        b=F56GdrlpxuUB/auXAfmP7EsDw7xrLZnPO91f2sIqfPjmRS26O8CoUCac/oslVgG3h4
         udbO+tUKWexgT7dOfuKfctSE4TFaI+fSaq36u0QZ8GwJexwzE95/1zMRpaAzXVoLOiM+
         aT1nWDWbEOn21Qb22wR62RQA5da0hP8/oeveo3B5FjJH2I75g3jtQ5YcON+TEM/ytZah
         0qq+iMwa4bMIu3Ht1Ysr4norxspnBYHKo2x6J3dQzGytbFIXTlh+sE509n0ssdbR/ro4
         SyKTlFT4+HSpiCX+uiMHmvrE9OtsMDcSGgwwmsycN8Ix4BOG59WAIceIVug8aIjSjaVY
         msaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768663528; x=1769268328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KycL/RP2UnaKXzhbUKxpWD/C+4095bTNRjfo4uJ3+8=;
        b=mJp2tDDTyl//iNexTl8ceflfD/WeA/WQIBemevwXpPzvIdmDd0XfBUtqQtagYh6TWq
         ItzHhCboGbbgpM9KA83SYq/wujwP5IjgERuEZU0/ApCtKr+Ib5nTSpZrCwGq3R7AncVt
         LvMyiMrOe5wzUubUrxRMGctH51g+42G3ARPKLEO/pTGB8LPuTZ9eXUvGIWfm2c15f2+y
         qqSTiOIvYiz9ZQXHtP3GPlNpp2U8kAh/lAu+O0PGiKqaIe8ANTo837BBGVBowmirLGz4
         zjFfR/irasBrMYceMo117itALrrJiPnIe9gl3QpP9fws19TJbemyZT9CUsd6sLnYBXb3
         +ZBA==
X-Forwarded-Encrypted: i=1; AJvYcCUgAHDnzCrHIJtYJaqKAdcMogBgd5i/PRk6yWdfE4fz3hVjXu/YvEbiMIB5ENgRUM7ttbHu5BUBh5tM+TooBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpRslmXEgSvs9f3c8rkdT2pyS29ZVo5OwOm2dZQmwGPpHCHFf4
	Ehq1yWpW3cY2ZOhO9teLOY2QlhV9KePdyqGbl7knmaM3e7dSa6pJGx/7dYGQJp7u0dTWUKrBjGV
	ipQMb258yICbrerxxxA==
X-Received: from edcx10.prod.google.com ([2002:a05:6402:a14a:b0:653:500:d80c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:f509:b0:b87:298a:da9c with SMTP id a640c23a62f3a-b8792d489bbmr511146466b.6.1768663527693;
 Sat, 17 Jan 2026 07:25:27 -0800 (PST)
Date: Sat, 17 Jan 2026 15:25:19 +0000
In-Reply-To: <20260117-upgrade-poll-v1-0-179437b7bd49@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260117-upgrade-poll-v1-0-179437b7bd49@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7824; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AwcTgsthYx0aIP7jt5SIJ3bUXr4UAdp7zAjyr7QxFZ0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpa6nlCM1RLO25hi+Og3yrpuOfBAdPBOgDOkh3H
 HgeQMgPA5yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWup5QAKCRAEWL7uWMY5
 RlSaD/4zqoJE1iw3f4OcubEFoTGU2vMN/zsSzBI+dNBvE1ntVBKRwEwMq7stU0/ughVEWlLH5mW
 qlv7W73hhqJWw9BIs6FxYiblu2NvI9rAO/v5S8d18fZM7YJdV4VHwq6vDNB9cMHF+UEHkZ8Ie97
 hKi5M5SS41ORKk7mcdLErsjpiY9wOfwVyLnSN7ERMvSXnMfWsHA8yBwdJwLMqqkJvqi5UWHQhAX
 8FZ7w6UaJ1XCAc9SMrnjzwYfArxWuMHQQ32/E2y05+dWk8KdWWICyUAC0JnOUcvcnrG9Qxwdpcl
 8pLH4hlU86XEKdzVCAptr13OlMyxcdJ+t10quV8r7MzUXdRMVpK6mPHOjpyFrB4jUi0l7NQ2haZ
 9zM5RdnuvdbUSJMnEKuO53nsUnQZKWq0aH1qKznRzL7nhM+fMW/RgIgVspSMeNxvZf5bfP+QjVv
 NILjfBp68cKuRtgSeLqG71VpE8GTcpccMjiENcnwHi0VO24FjzWicDQdEM80BOKa5Mjwz1dKGOA
 IRs6qEHGHnN+zXFYWOdJ19er9Y5cPnF8LXBAwSu7u+yypUD74tgqMCrMfpKSo5J06upLxg/laVU
 YFK2gkeYlJodG3JiQ0R0ShGNcPK6nW7Xa1Yi9NMHk7QOFhFvQhWaDQBxTTCmkLYNp5Im+gtdMlb OyFamKZWCrF84Qg==
X-Mailer: b4 0.14.2
Message-ID: <20260117-upgrade-poll-v1-1-179437b7bd49@google.com>
Subject: [PATCH RFC 1/2] rust: poll: make PollCondVar upgradable
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/poll.rs | 163 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index 0ec985d560c8d3405c08dbd86e48b14c7c34484d..9fb004c71c78375bb16ded7f518aa282cdcc50f5 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -5,12 +5,16 @@
 //! Utilities for working with `struct poll_table`.
 
 use crate::{
-    bindings,
+    alloc::AllocError,
+    bindings, container_of,
     fs::File,
     prelude::*,
+    sync::atomic::{Acquire, Atomic, Relaxed, Release},
+    sync::lock::{Backend, Lock},
     sync::{CondVar, LockClassKey},
+    types::Opaque,
 };
-use core::{marker::PhantomData, ops::Deref};
+use core::{marker::PhantomData, ops::Deref, ptr};
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -22,6 +26,17 @@ macro_rules! new_poll_condvar {
     };
 }
 
+/// Creates a [`UpgradePollCondVar`] initialiser with the given name and a newly-created lock
+/// class.
+#[macro_export]
+macro_rules! new_upgrade_poll_condvar {
+    ($($name:literal)?) => {
+        $crate::sync::poll::UpgradePollCondVar::new(
+            $crate::optional_name!($($name)?), $crate::static_lock_class!()
+        )
+    };
+}
+
 /// Wraps the kernel's `poll_table`.
 ///
 /// # Invariants
@@ -66,6 +81,7 @@ pub fn register_wait(&self, file: &File, cv: &PollCondVar) {
 ///
 /// [`CondVar`]: crate::sync::CondVar
 #[pin_data(PinnedDrop)]
+#[repr(transparent)]
 pub struct PollCondVar {
     #[pin]
     inner: CondVar,
@@ -78,6 +94,17 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
             inner <- CondVar::new(name, key),
         })
     }
+
+    /// Use this `CondVar` as a `PollCondVar`.
+    ///
+    /// # Safety
+    ///
+    /// After the last use of the returned `&PollCondVar`, `__wake_up_pollfree` must be called on
+    /// the `wait_queue_head` at least one grace period before the `CondVar` is destroyed.
+    unsafe fn from_non_poll(c: &CondVar) -> &PollCondVar {
+        // SAFETY: Layout is the same. Caller ensures that PollTables are cleared in time.
+        unsafe { &*ptr::from_ref(c).cast() }
+    }
 }
 
 // Make the `CondVar` methods callable on `PollCondVar`.
@@ -104,3 +131,135 @@ fn drop(self: Pin<&mut Self>) {
         unsafe { bindings::synchronize_rcu() };
     }
 }
+
+/// Wrapper around [`CondVar`] that can be upgraded to [`PollCondVar`].
+///
+/// By using this wrapper, you can avoid rcu for cases that don't use [`PollTable`], and in all
+/// cases you can avoid `synchronize_rcu()`.
+///
+/// # Invariants
+///
+/// `active` either references `simple`, or a `kmalloc` allocation holding an
+/// `UpgradePollCondVarInner`. In the latter case, the allocation remains valid until
+/// `Self::drop()` plus one grace period.
+#[pin_data(PinnedDrop)]
+pub struct UpgradePollCondVar {
+    #[pin]
+    simple: CondVar,
+    active: Atomic<*mut CondVar>,
+}
+
+#[pin_data]
+#[repr(C)]
+struct UpgradePollCondVarInner {
+    #[pin]
+    upgraded: CondVar,
+    #[pin]
+    rcu: Opaque<bindings::callback_head>,
+}
+
+impl UpgradePollCondVar {
+    /// Constructs a new upgradable condvar initialiser.
+    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
+        pin_init!(&this in Self {
+            simple <- CondVar::new(name, key),
+            // SAFETY: `this->inner` is in-bounds.
+            active: Atomic::new((unsafe { &raw const (*this.as_ptr()).simple }).cast_mut()),
+        })
+    }
+
+    /// Obtain a [`PollCondVar`], upgrading if necessary.
+    ///
+    /// You should use the same lock as what is passed to the `wait_*` methods. Otherwise wakeups
+    /// may be missed.
+    pub fn poll<T: ?Sized, B: Backend>(
+        &self,
+        lock: &Lock<T, B>,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+    ) -> Result<&PollCondVar, AllocError> {
+        let mut ptr = self.active.load(Acquire).cast_const();
+        if ptr::eq(ptr, &self.simple) {
+            self.upgrade(lock, name, key)?;
+            ptr = self.active.load(Acquire).cast_const();
+            debug_assert_ne!(ptr, ptr::from_ref(&self.simple));
+        }
+        // SAFETY: Signature ensures that last use of returned `&PollCondVar` is before drop(), and
+        // drop() calls `__wake_up_pollfree` followed by waiting a grace period before the
+        // `CondVar` is destroyed.
+        Ok(unsafe { PollCondVar::from_non_poll(&*ptr) })
+    }
+
+    fn upgrade<T: ?Sized, B: Backend>(
+        &self,
+        lock: &Lock<T, B>,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+    ) -> Result<(), AllocError> {
+        let upgraded = KBox::pin_init(
+            pin_init!(UpgradePollCondVarInner {
+                upgraded <- CondVar::new(name, key),
+                rcu: Opaque::uninit(),
+            }),
+            GFP_KERNEL,
+        )
+        .map_err(|_| AllocError)?;
+
+        // SAFETY: The value is treated as pinned.
+        let upgraded = KBox::into_raw(unsafe { Pin::into_inner_unchecked(upgraded) });
+
+        let res = self.active.cmpxchg(
+            ptr::from_ref(&self.simple).cast_mut(),
+            // SAFETY: This operation stays in-bounds of the above allocation.
+            unsafe { &raw mut (*upgraded).upgraded },
+            Release,
+        );
+
+        if res.is_err() {
+            // SAFETY: The cmpxchg failed, so take back ownership of the box.
+            drop(unsafe { KBox::from_raw(upgraded) });
+            return Ok(());
+        }
+
+        // If a normal waiter registers in parallel with us, then either:
+        // * We took the lock first. In that case, the waiter sees the above cmpxchg.
+        // * They took the lock first. In that case, we wake them up below.
+        drop(lock.lock());
+        self.simple.notify_all();
+
+        Ok(())
+    }
+}
+
+// Make the `CondVar` methods callable on `UpgradePollCondVar`.
+impl Deref for UpgradePollCondVar {
+    type Target = CondVar;
+
+    fn deref(&self) -> &CondVar {
+        // SAFETY: By the type invariants, this is either `&self.simple` or references an
+        // allocation that lives until `UpgradePollCondVar::drop`.
+        unsafe { &*self.active.load(Acquire) }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for UpgradePollCondVar {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        // ORDERING: All calls to upgrade happens-before Drop, so no synchronization is required.
+        let ptr = self.active.load(Relaxed);
+        if ptr::eq(ptr, &self.simple) {
+            return;
+        }
+        // SAFETY: When the pointer is not &self.active, it is an `UpgradePollCondVarInner`.
+        let ptr = unsafe { container_of!(ptr, UpgradePollCondVarInner, upgraded) };
+        // SAFETY: The pointer points at a valid `wait_queue_head`.
+        unsafe { bindings::__wake_up_pollfree((*ptr).upgraded.wait_queue_head.get()) };
+        // This skips drop of `CondVar`, but that's ok because we reimplemented its drop here.
+        //
+        // SAFETY: `__wake_up_pollfree` ensures that all registered PollTable instances are gone in
+        // one grace period, and this is the destructor so no new PollTable instances can be
+        // registered. Thus, it's safety to rcu free the `UpgradePollCondVarInner`.
+        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
+    }
+}

-- 
2.52.0.457.g6b5491de43-goog

