Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406732C309
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059836; cv=none; b=fPOmrDaH1LBLhq+g/yDQ/KSDoqn2Q69oj16mf9VQCEpyhX/nddZ4ORh11kXGj6D1G4QjmLXkaVq3q5aG730oHOBWR3z24U4DMIWLDG82IdoWnwQMGp4eZlwJ1Hbd2p9VtefIkGuY5TjBnkPPZZSziIL5Amp+n58WZ1UvEXGUlWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059836; c=relaxed/simple;
	bh=IfBs5iGp9D+UowfOCy1DBPwl4u1/S0AirwdGCSIUmZ4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CHpc6dv8AaANr7YpJn//nZXyMhp8ivtdAkrDZu3TmvFNj37wWIg5SzplNJ36fOvbCLV6RUJUWby+efrMLO7dIE1Y01Wctw4+xg7XjAvJ39DI349kBcBhzxxG80y6U1kRMCv6PhQECF4KnVLCA8SUT8yx6Dl4w4bcRWHxy3hpvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oDg1RXrK; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oDg1RXrK"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79f8db2c81so76102466b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 04:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766059832; x=1766664632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uS0pi/gOX62cWjMHzFS3+4XatPVUtYzquaqH1RV+tKY=;
        b=oDg1RXrK2bt+vDhIFFr+d0Rxxli62it/ietZeSBBuz8/3FmbCCOo51Dx8HN8E/pSlK
         YFQ19N6iZVBW6i+JmBQ0MTNWYzffTj6IXz/9w6AtTeIHDiviaX4YhypQ8XhF+YxvmxmU
         XwSwuH4rzPADKE+h/QyegTg4Fto62kmb1zl3onhmKpgp6TlmqdXp74r4pvvotxlTA2+8
         +ZBQ87r/aQC5moFKioGsE81XIDULPsL42AbtjqsYqiXw1k9lxwQufXcRBBQ/Oao77EPo
         wtj6owHFIrEB1N6W/2b62c7pbvsCfp36nH57GLsM54FvijfSY3vstM0NnavAqk4nWETX
         gfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059832; x=1766664632;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uS0pi/gOX62cWjMHzFS3+4XatPVUtYzquaqH1RV+tKY=;
        b=MgnsYUhQ75o4IC/+aGz6D6y2rw2ZWkYjB2nCZpaiSIDBZzOS9pr6e/+ohStLUJTGs/
         XQ7BmWGNJASleJD7YOc//nCQGiS3YeZiumOXKYYprCmjV0Cjkyid4IAHWrMCMSrjVCKl
         3Pl1RtCn/QwmWNEQkr414riJdvlZalgsiwqEG/pA3glFM0uXAApvLcU4s3zgO3u1xJE3
         HIW/neFHAiMwYzBNUViW/aNAuiahIi8SqfRBUYUEhmNeJqi8sFK6I7z9tgRi2fszKd02
         s+hAAHGe8HGUAiZQ0lv4uGbGzNvj1lcfGU9J0UJyzSLXq+PipWAz8xa+e7wF2Ep7jz8Q
         FqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWuHFhUZidYouGQTTw++JEZ1JqPGUlURfzZeQSft9TRTbCfGzaXSaPC1lLtY3SXmCqPrN9Jc2J38HYv0agnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGZJ7RL4ya0OZqk0SjY8KcpntdcfpNfRFqBcdSZxLeUHyDH1g
	EwBSmd4RFw8RxryK3LY79uAX3H/TWUq5ybgeoB/iJtTHoAP2hXvwk8wXKjhALFeLl+X2Tv0cq+j
	mx3tVOFQK+CTap1KMJQ==
X-Google-Smtp-Source: AGHT+IHtEYg2wogrQNtmaMiEPnzW0pbtvPueRRkeUpVkbgNqex7/3gPD3UxhxBlen7ygjuL+78sxM2CtuMorA34=
X-Received: from edrz19.prod.google.com ([2002:aa7:c653:0:b0:640:7e43:7e92])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9613:b0:b4c:137d:89bb with SMTP id a640c23a62f3a-b7d236ff023mr2469983766b.29.1766059831780;
 Thu, 18 Dec 2025 04:10:31 -0800 (PST)
Date: Thu, 18 Dec 2025 12:10:23 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC7vQ2kC/32NQQ7CIBREr9L8tRiBiNaV9zBdFPpLf0RoQImm4
 e4iBzCzmLxJZmaDhJEwwaXbIGKmRMFXELsOzDJ6i4ymyiAO4sg5l4y8I4/MBXNnL99M85NQSoq x7yeoxTXiTO82ehsqL5SeIX7aR+a/9O9c5qxKKzwbKaQ289WGYB3uTXjAUEr5Akotz2y1AAAA
X-Change-Id: 20251113-inline-lock-unlock-b1726632a99d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8546; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IfBs5iGp9D+UowfOCy1DBPwl4u1/S0AirwdGCSIUmZ4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQ+8ydbXrCypw1fve/DLU/bHdKwVMxfk8bPMsp
 5eSgzlf79yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUPvMgAKCRAEWL7uWMY5
 RkbeD/9Gbhvj/cZzQU3x8zV5El0UrtEJfZH0jJoX5NaHfwoTpiVBNpy1+ekhtSXSZvqD5FojO0O
 90WwhbFqRuqVvy4llsrBcrsJ8MCxdz0HxNKvwj32gxn8ZOXpUdYmAPXbOMAbKJCNRQez16Txdh4
 +L5XvdoipzyLSyWxY10brdBYmDD8/5bkwCTS8eBDJ8sKa9LxJI92uzKhP8NWuxHcNwRT+QduBg8
 HkgYznanat6bJm+IsqdjthxmfoV0JCB4iuLBAOSb95fU+wUyEqVswIOYJ5pdnmo8O4ygIoTeqPp
 qpQDhQvVcfwbIsR4UeVSwwvAHGMW2i49iqVseSNArEHF7YmJOekJQPDzZ2lTzS9YBBiSwdNgr0W
 cvpRRcVxPGxrLJgtgcK1yRWencxEmY6TAx2HlDejeNga+VFfhlCC6Rmc1Uva6uSSzHsJJfwlwnd
 GhhgvRcxowwIr/UIPUn+FyAHsUBhPXOKSoqrXgJetpE8nLbI9BW72D+MgA65OR3iYCkz3oV8XkE
 2Eh6aBQYqiUlo8D1kisiHAfTyvjRjsTZD8Cba8wRXMybAHwU6p4sSNqcRICzfXhQ1ONgBgWs/PH
 Y2gS7AinXkaLqlnYGa6KPuxjsE4Zjf+w+o6j4DdJxCZlm3s2b62JkSAXG1EI0mHveNjvuaTmhd9 fMNi3fPQmfThHwA==
X-Mailer: b4 0.14.2
Message-ID: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
Subject: [PATCH v2] rust: sync: inline various lock related methods
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

While debugging a different issue [1], I inspected a rust_binder.ko file
and noticed the following relocation:

	R_AARCH64_CALL26	_RNvXNtNtNtCsdfZWD8DztAw_6kernel4sync4lock8spinlockNtB2_15SpinLockBackendNtB4_7Backend6unlock

This relocation (and a similar one for lock) occurred many times
throughout the module. That is not really useful because all this
function does is call spin_unlock(), so what we actually want here is
that a call to spin_unlock() dirctly is generated in favor of this
wrapper method.

Thus, mark these methods inline.

Link: https://lore.kernel.org/p/20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebased on v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251113-inline-lock-unlock-v1-1-1b6e8c323bcf@google.com
---
 rust/kernel/sync/lock.rs          | 7 +++++++
 rust/kernel/sync/lock/global.rs   | 2 ++
 rust/kernel/sync/lock/mutex.rs    | 5 +++++
 rust/kernel/sync/lock/spinlock.rs | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 46a57d1fc309d330a4c82fe1ecce18297205faed..10b6b5e9b024f2d3ee7458fc2f64190bd38f4391 100644
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
index eab48108a4aebeb72b2026d6c21d5748b0e62f0a..aecbdc34738fbd746de79eb0f1abe995478ad785 100644
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
index 581cee7ab842ad62ec144e67138676c000a3f5e4..cda0203efefb9fcb32c7eab28721e8678ccec575 100644
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
index d7be38ccbdc7dc4d70caaed0e7088f59f65fc6d1..ef76fa07ca3a2b5e32e956e828be5b295da0bc28 100644
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

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251113-inline-lock-unlock-b1726632a99d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

