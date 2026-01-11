Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF03469F3
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133032; cv=none; b=dpcAc8i0oTHfeHetnOj5P51CaMpIRcEwtHqYA64wLJYLl/HXgCGIcSArtfXyONT592K+KN/k7YAxB210P5K9jpYxO4ahFDVB05EYa20eeMFofgyiiqvd43lHfY5Fv7BBtt6aDLr6HGdhMZSdDrACzOIoR/0u2NNLpU7DAC99u1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133032; c=relaxed/simple;
	bh=s8N4ZiJ/NTw5nCFolZ2qL520EQTDevyDNLvKPYHhOxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UamS1URTT5TAHRNYTIq43su5Uh2bryoHm0EW6MJoscQ0/DCmd3QXPF+tqaFRZ0PXwoxo0RargYUzQpgSaH/rr8AJsi1IfRue4iO1InMfCVQZFGos0LKqS8GAFSD+FNN/IPuACK1nbOsX6n0oW+4+4KOJVOnJoktEW1sCOCw44Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNavHVJV; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNavHVJV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2ea2b9631so645578285a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133029; x=1768737829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k0bZMcMbWrQBQFSEmsod610ePoTMj3P6f+YOc7ODi3w=;
        b=dNavHVJVcngTrU9Rp6M1PS976z3Sm6tbOmkYahLCANi1B99yV2/10+qnNLrXkjSRtp
         7Y31VbD80e5cbDIfJZz+UCx4XtObamuaXExu2GjGLuNAgwV9BX9P1Dr17WYI5jW9SHFv
         xsAs194diH/4P5tWmNeZhqIANNA5ZlADok/Hj+zX4JXarNGzP0YglF/P2uDhMjEYoqk0
         PbLShEUIDCkt+sBaY7iwbPUKQXixZ893wpm4NriU/VWxr8q8wCxRGUVUsf0yW7uxxHDK
         elv9DVosJ/mnQUTC1+dYsx1dA12z/mZ+30GPu2poEYskT/ZJ3x7SqAnQpG5LgzRBiW4B
         FWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133029; x=1768737829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0bZMcMbWrQBQFSEmsod610ePoTMj3P6f+YOc7ODi3w=;
        b=B8RE1Qa1vHsLYNVIP43ijCSxzgaSXQJ0yjLaxdeeJEySzhxZPEhDf3tqBD7mrzuTUN
         uLPSjf3QwkSCSoV7z454Dtnm5/IElTOYpeBd4bOzd8Jb4tn3R16Gc3k9y0ysMgRWX/vd
         rR2Ak9ZFG5w0YniEHcif73xL+jj3qzyNsX/v4DdYYkq0nQXS+tyI4hIwwnzPWgmKL2iy
         W9oj0m2Rm1KyUJ3aE0PJOlY/4t32vJLfh7lIGgRFvU08pKCyptuMfnAraks+Whq46E0J
         HXrSnW7mAmIbqTSNCTHVGATwuyVfF0jn6QCn1x+qOgOWXJjXVesWKOS0JiVlqyKELwgx
         5Dyw==
X-Gm-Message-State: AOJu0YwX08TY9mgXH3mmJ4D/XAo7uX5JglcIty8i+DteHrT9bGlLillz
	kOq0Fk8lFJHypvXqRrIh2A5+/R9/4GwzUhkQvAMqayk7memLEc0H2dZ3
X-Gm-Gg: AY/fxX5eZDhG8p28Z/qagGUyJqf2DZ4HNk+hTmryXkGGi9N5n9h2fLPlJEN8qK6I9Hh
	d0sjKYPd2LA8DAbi/xA0WwbBTH4kYnIFILqYyywAydMPKLJCFTJ/vGMRhdQOWkwtIZ0P6z6g4f3
	+Gl++odtQ17ndk4uFLsozW8Vjdi25uXCzciEAf0tWXLJEZPtywjxwfiQN4WE1HZ5aK9VX74bvkR
	fiReIzK8hAxIAMCd2vwstTmzIZdx1Drp/FksAFDHUGdgbKfOuedzhY4zKg6y50Lbu53OkPH1GD9
	etcGvmbk0oDw0l1MT57m2dpH+Kp2LGgtIwrx5KinmprKTG1evohnyaXWDRpdEciZWyJqu5LPjWG
	B4ExoU7nI1ZTM/2vIPQkxI8uIs8CQw1YS90HHC+aqOruVF6Sw2OWbNPu7E5ODEJPsSsSASf6Ssc
	Nl2AnZ5H7NENyCCIz1OGitcAUQn9PFazaMaT/77irLCJQNdgWvl/xBeXmgO4Fb0miCTyiNctVKP
	8BsQedrBIH7CH0=
X-Google-Smtp-Source: AGHT+IF5ftE08RXjLlbNoPp+Az1KvVdU3HySJevvvDjzTv59UekS/JjztS89lqrMGGkkDvv/jcfZIQ==
X-Received: by 2002:a05:620a:410d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c38939cf58mr2050163385a.40.1768133028929;
        Sun, 11 Jan 2026 04:03:48 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a63acsm1284207385a.6.2026.01.11.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:48 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2693FF40068;
	Sun, 11 Jan 2026 07:03:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 11 Jan 2026 07:03:48 -0500
X-ME-Sender: <xms:pJFjaW70x19L_F7GVbp_heqfbVMxGszRKchf4SdaOBqYtTZXeJYkTQ>
    <xme:pJFjaaT7Wq5i50KgW2qSFZmr6-HmMfO-7CD32HYX9yDttQskb4RaeubgLbd0Q_hb6
    6Fa0uugV0ZAizFZdykZZY1HyrO-QRX5YzK7zSToWEuVNhffHU0IYQ>
X-ME-Received: <xmr:pJFjabkcydouqE4cx5WDHtmaNaxFuQIe2KzB0bm376SF1rOUCztRzYab>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeugeeiffevuedvvddvfeejffekfedtvdevieehteehjeefkedtgfelvdelfefg
    ieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmshhgihgurdhlihhnkhdplhhotg
    hkrdgurghtrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvge
    ehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhm
    sehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorh
    dqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhm
    rdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghr
    hihguhhordhnvght
X-ME-Proxy: <xmx:pJFjaeSUYtuUpCgLBiDjNBA2_sislQ1BdtJH_KW8W1So8x-t_xFXwg>
    <xmx:pJFjaStCGYk2wuwCYV9lj8VGEM7D7tso2Ub65LxfptwlO3J0EM1Fhg>
    <xmx:pJFjaX5Bgo7p8EKmFvwvzRMAakkI0WCx9BgYyy5fZCQWkMEK_gWGnQ>
    <xmx:pJFjadiGWLmLEq8MV95wuj7EfW1F6ePw-YRLAHfxRTPwaQw3WvmmKA>
    <xmx:pJFjaZlJiWmVwE1bmP4AIY0lc1ojuSaF9oP5c-Mnhd7phhiSN2igxZmz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:47 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 36/36] rust: sync: Inline various lock related methods
Date: Sun, 11 Jan 2026 20:02:09 +0800
Message-ID: <20260111120209.6133-34-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

While debugging a different issue [1], the following relocation was
noticed in the rust_binder.ko file:

	R_AARCH64_CALL26	_RNvXNtNtNtCsdfZWD8DztAw_6kernel4sync4lock8spinlockNtB2_15SpinLockBackendNtB4_7Backend6unlock

This relocation (and a similar one for lock) occurred many times
throughout the module. That is not really useful because all this
function does is call spin_unlock(), so what we actually want here is
that a call to spin_unlock() dirctly is generated in favor of this
wrapper method.

Thus, mark these methods inline.

[boqun: Reword the commit message a bit]

Link: https://lore.kernel.org/p/20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com
---
 rust/kernel/sync/lock.rs          | 7 +++++++
 rust/kernel/sync/lock/global.rs   | 2 ++
 rust/kernel/sync/lock/mutex.rs    | 5 +++++
 rust/kernel/sync/lock/spinlock.rs | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 46a57d1fc309..10b6b5e9b024 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -156,6 +156,7 @@ impl<B: Backend> Lock<(), B> {
     /// the whole lifetime of `'a`.
     ///
     /// [`State`]: Backend::State
+    #[inline]
     pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
         // SAFETY:
         // - By the safety contract `ptr` must point to a valid initialised instance of `B::State`
@@ -169,6 +170,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
     /// Acquires the lock and gives the caller access to the data protected by it.
+    #[inline]
     pub fn lock(&self) -> Guard<'_, T, B> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
@@ -182,6 +184,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Returns a guard that can be used to access the data protected by the lock if successful.
     // `Option<T>` is not `#[must_use]` even if `T` is, thus the attribute is needed here.
     #[must_use = "if unused, the lock will be immediately unlocked"]
+    #[inline]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
@@ -275,6 +278,7 @@ pub fn as_mut(&mut self) -> Pin<&mut T> {
 impl<T: ?Sized, B: Backend> core::ops::Deref for Guard<'_, T, B> {
     type Target = T;
 
+    #[inline]
     fn deref(&self) -> &Self::Target {
         // SAFETY: The caller owns the lock, so it is safe to deref the protected data.
         unsafe { &*self.lock.data.get() }
@@ -285,6 +289,7 @@ impl<T: ?Sized, B: Backend> core::ops::DerefMut for Guard<'_, T, B>
 where
     T: Unpin,
 {
+    #[inline]
     fn deref_mut(&mut self) -> &mut Self::Target {
         // SAFETY: The caller owns the lock, so it is safe to deref the protected data.
         unsafe { &mut *self.lock.data.get() }
@@ -292,6 +297,7 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 }
 
 impl<T: ?Sized, B: Backend> Drop for Guard<'_, T, B> {
+    #[inline]
     fn drop(&mut self) {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
@@ -304,6 +310,7 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// # Safety
     ///
     /// The caller must ensure that it owns the lock.
+    #[inline]
     pub unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
         // SAFETY: The caller can only hold the lock if `Backend::init` has already been called.
         unsafe { B::assert_is_held(lock.state.get()) };
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index eab48108a4ae..aecbdc34738f 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -77,6 +77,7 @@ pub unsafe fn init(&'static self) {
     }
 
     /// Lock this global lock.
+    #[inline]
     pub fn lock(&'static self) -> GlobalGuard<B> {
         GlobalGuard {
             inner: self.inner.lock(),
@@ -84,6 +85,7 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
     }
 
     /// Try to lock this global lock.
+    #[inline]
     pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 581cee7ab842..cda0203efefb 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -102,6 +102,7 @@ unsafe impl super::Backend for MutexBackend {
     type State = bindings::mutex;
     type GuardState = ();
 
+    #[inline]
     unsafe fn init(
         ptr: *mut Self::State,
         name: *const crate::ffi::c_char,
@@ -112,18 +113,21 @@ unsafe fn init(
         unsafe { bindings::__mutex_init(ptr, name, key) }
     }
 
+    #[inline]
     unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
         // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
         // memory, and that it has been initialised before.
         unsafe { bindings::mutex_lock(ptr) };
     }
 
+    #[inline]
     unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
         // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
         // caller is the owner of the mutex.
         unsafe { bindings::mutex_unlock(ptr) };
     }
 
+    #[inline]
     unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
         // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
         let result = unsafe { bindings::mutex_trylock(ptr) };
@@ -135,6 +139,7 @@ unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
         }
     }
 
+    #[inline]
     unsafe fn assert_is_held(ptr: *mut Self::State) {
         // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
         unsafe { bindings::mutex_assert_is_held(ptr) }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index d7be38ccbdc7..ef76fa07ca3a 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -101,6 +101,7 @@ unsafe impl super::Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
 
+    #[inline]
     unsafe fn init(
         ptr: *mut Self::State,
         name: *const crate::ffi::c_char,
@@ -111,18 +112,21 @@ unsafe fn init(
         unsafe { bindings::__spin_lock_init(ptr, name, key) }
     }
 
+    #[inline]
     unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
         // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
         // memory, and that it has been initialised before.
         unsafe { bindings::spin_lock(ptr) }
     }
 
+    #[inline]
     unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
         // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
         // caller is the owner of the spinlock.
         unsafe { bindings::spin_unlock(ptr) }
     }
 
+    #[inline]
     unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
         // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
         let result = unsafe { bindings::spin_trylock(ptr) };
@@ -134,6 +138,7 @@ unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
         }
     }
 
+    #[inline]
     unsafe fn assert_is_held(ptr: *mut Self::State) {
         // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
         unsafe { bindings::spin_assert_is_held(ptr) }
-- 
2.51.0

