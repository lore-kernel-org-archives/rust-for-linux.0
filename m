Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D490159583
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689805; cv=none; b=RgZC+89c0IZoIJVQtnqd6357RHSPCo4z0TigcbkoMjrFQ3fvyH0hzL/tNLq1BdgAaPavf2dxFF6XaWDPUIj8M+vB3T6EBXf98MO1gOqiog/UJD7Ip0xA8a+sZJ0SbnD4S/zW0g6vZKvjugWmJY0cjNbHWiaMuxY/Q+27wvTl78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689805; c=relaxed/simple;
	bh=V77N/KjCHvplCxE6p5eOodDYgWxglGMXRbAasY3H9Ug=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e++raN+Yx+HZLXIro9a7g8RHm+JLFLqB6P+/RbPK/TyOdKKeos1B9HJRZmVhjmNzdbQBE6fvZ7n6R4b5WvmVU9RWzPSzSdMdGMClTrw02PK4Z+wnYhPw/a4ZKMV/W9kLi7PN9BeO+RPKVsvqbcJjUbIIH0gZRQVKXLXGNl/HApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3XZEqQQu; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3XZEqQQu"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35199eb2bso127477427b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729689803; x=1730294603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1seQ6EY+xI8yfrWsfUIYeFki/FB4sSFbC8R3vkQdgmo=;
        b=3XZEqQQuoaKhvkpYC/ut8K0MHT8z62C54wx7VFQqHBSMRcDynbLqpUdV+tkj5jkpci
         YBT3fgP9nXFnsHGafCHbg6fckLLh7CSXqsVjik3JOJk06/TO7C12uDfFX8YPiVJy6z8K
         pRLdWuoRrgM85l91hJJioMXWKqM5b0364N5OUP4IVyxX6GYGsVoWwAkkOJYe5Frd9zSp
         g2C7GHezgzxgmZ5W27DMrhKqC/qkvbbHoTI1er2KV9ZErW7tjKksevzi64MB4f4CAQQ9
         Mt3NYDas298ZKriA52V7L7jEmU+NGk9cOwuGxBMwS3VvWoCjINeA3EwINXqrQD5Cz00E
         pfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729689803; x=1730294603;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1seQ6EY+xI8yfrWsfUIYeFki/FB4sSFbC8R3vkQdgmo=;
        b=I3eBI+O2kK8SAXqLl2lKX1L0MMgvABI2wPHMRS8jiGVjzRBJ2BvmgdthvVb+7c3AWl
         I1T1qT5kGYEWhcf9vTx96Qv1ZbanlMwdPeR07EP6kOVy130cIS3xfVSHyRG4cr6rTEJb
         KoOcjjwFvEhy2o0TTtZHVeVq6IUex4uR2tScyAMadBLGedqcd43bkn+MZmQtW6P1uTBN
         USQfo11fiHyaCLrZkLmNA4loK3DStJioB2tTAYEyKyOMX3DnaOONA0EqZcAs0AJU1N1w
         G3SqXfsrYBPeqyAs6n6H/6HDnmtjjXH4dg5yntPCxFf6jdUMC3vctPq8KP5WRmfbJ9k/
         +8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsAoMnpB9ufJQYDruEGhIPppD5oqf1k4hg1rAXWQiE5UpCExdoDj1NNlMoI0t4+2+DtpVvWHEwqgZmDytYcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX80yXvHV8LMs2hAVY0XzwMYPcREB48ZdKk3bAPZJ5X3YQiEC6
	VwNDsvdw7gsWO28Y5ZwJft1NMDscnKpNp1ncFlBG4+j8JVnjsh7mMScvOnSX/KuEApSdl2wA5wq
	GtJcUwP3LMza0CQ==
X-Google-Smtp-Source: AGHT+IGlNWDXPiSI/iL6EVIsGnNXyCmuJc7I+4D5/F5vC8SUDONqTqfuypRtR4cKAZwDnw3skyEN5duQJAZnnso=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:4d3:b0:e2e:4391:67cc with SMTP
 id 3f1490d57ef6-e2e439168abmr4709276.4.1729689802269; Wed, 23 Oct 2024
 06:23:22 -0700 (PDT)
Date: Wed, 23 Oct 2024 13:23:18 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMX4GGcC/3XNQW7CMBCF4asgr2vkmbGdhBX3qFjYziRYKhjFa
 QRCuXsNi0ITdflG+v65i8xD5Cx2m7sYeIo5pnMZ9mMjwtGde5axLVugQq1qtDKPboxBnr5Hvkq
 nPWLNiq1zopDLwF28PnOfh7KPMY9puD3rEzyu/4QmkCAdaOYKjIWO9n1K/RdvQzqJR2nCd10tN
 BYNVRcIPSoiXGl66QbUQlPRxrNvAXzbkV9p/aZpqXXRwTTGGA0EWK20+dWgkBbaFF2Xx7Wzrmn 8Xz3P8w93v5k+oQEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=13028; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=V77N/KjCHvplCxE6p5eOodDYgWxglGMXRbAasY3H9Ug=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnGPjHl2T3Wl3SkSuRvmVelt0JmH54rbJh3I7hv
 QVFp12IQEeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZxj4xwAKCRAEWL7uWMY5
 RnUfD/9rqW+3yz0AkZOErCQPXCX8pgYCKM5iV/UvgARyiZKMOgrUuRXYuQij1FQTEjN/JtH8d+r
 EeQp7BoFgPSqzr0Cb1YWFqBLsYpT9Cy84PjHzF/tZ3hsyMDBZonB0oOLzL5rlfkKWXiyftrQDln
 RcVrr/j0mQeX78JLjnQGfYCRbHOV146duQKI2sXFyaugezKEC2pMPkOoSIX4vktd0mbTxCXbqWQ
 UwzYHy2X9VuFbC837twmbj5U72m9n2+0l468GBqAzEx85YkxVwRNsU6zk8TsIlle6DxqKqW22ha
 5z2+f2Wx/7VE8fz+uIlhqS45SJ3Qphx52zNDNONGtai1UQAT96DA4MoI4MaqHdyIE4D1P3Xy7RU
 Br1MvD+A3sKUAGOI8X0KltNOX6kXoPcpuHD8Kz8CTXZjmnZSI2xacAabz8qictnrnMrAkIxfZnI
 VhUVfFNEEu3An7gchAVeBp/bAnSAVgiiSDLUqRebJ0pXGQoXPyEIYawWQBTYUU2dW246EVJTXab
 n9vfO/dRyveGikeotSpB6zlQTqTUFlhT576qHakuDD0NiC1cd94+M6Hohz0LLmsfVnKwxhZc6aI
 dS5n1GLYOw7c4vny+rUdfUeX8cXkUQ1Gn4dN44yyti89bnGqT+0p4RokSq81DqSB683RanM73dB Tm4rhyQv1FnOVQA==
X-Mailer: b4 0.13.0
Message-ID: <20241023-static-mutex-v6-1-d7efdadcc84f@google.com>
Subject: [PATCH v6] rust: add global lock support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add support for creating global variables that are wrapped in a mutex or
spinlock.

The implementation here is intended to replace the global mutex
workaround found in the Rust Binder RFC [1]. In both cases, the global
lock must be initialized before first use. The macro is unsafe to use
for the same reason.

The separate initialization step is required because it is tricky to
access the value of __ARCH_SPIN_LOCK_UNLOCKED from Rust. Doing so will
require changes to the C side. That change will happen as a follow-up to
this patch.

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-2-08ba9197f637@google.com/#Z31drivers:android:context.rs [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch is based on top of rust-next as it depends on:
https://lore.kernel.org/r/BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com
---
Changes in v6:
- Completely rewrote the implementation to move almost everything
  outside the macro.
- Link to v5: https://lore.kernel.org/r/20241021-static-mutex-v5-1-8d118a6a99b7@google.com

Changes in v5:
- Adjust syntax as discussed in the last meeting.
- Fix various warnings.
- Link to v4: https://lore.kernel.org/r/20240930-static-mutex-v4-1-c59555413127@google.com

Changes in v4:
- Evaluate `$value` in the surrounding scope.
- Make types `pub(crate)` to avoid "private type in public interface"
  errors when using the macro.
- Add trylock method.
  - using https://lore.kernel.org/r/BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com
- Add Send/Sync implementations of LockedBy.
- Fix examples so they compile.
- Link to v3: https://lore.kernel.org/r/20240910-static-mutex-v3-1-5bebd11bdf3b@google.com

Changes in v3:
- Rewrite to provide a macro instead.
- Link to v2: https://lore.kernel.org/r/20240827-static-mutex-v2-1-17fc32b20332@google.com

Changes in v2:
- Require `self: Pin<&Self>` and recommend `Pin::static_ref`.
- Other doc improvements including new example.
- Link to v1: https://lore.kernel.org/r/20240826-static-mutex-v1-1-a14ee71561f3@google.com
---
 rust/kernel/sync.rs             |   1 +
 rust/kernel/sync/lock.rs        |   3 +
 rust/kernel/sync/lock/global.rs | 303 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 307 insertions(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 0ab20975a3b5..2bdd1cffcdab 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -14,6 +14,7 @@
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
+pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex};
 pub use lock::spinlock::{new_spinlock, SpinLock};
 pub use locked_by::LockedBy;
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 90cc5416529b..a5d89cebf106 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -13,6 +13,9 @@
 pub mod mutex;
 pub mod spinlock;
 
+pub(super) mod global;
+pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
+
 /// The "backend" of a lock.
 ///
 /// It is the actual implementation of the lock, without the need to repeat patterns used in all
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
new file mode 100644
index 000000000000..5ba90b7f4074
--- /dev/null
+++ b/rust/kernel/sync/lock/global.rs
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Support for defining statics containing locks.
+
+use crate::{
+    str::CStr,
+    sync::lock::{Backend, Guard, Lock},
+    sync::{LockClassKey, LockedBy},
+    types::Opaque,
+};
+use core::{
+    cell::UnsafeCell,
+    marker::{PhantomData, PhantomPinned},
+};
+
+/// Trait implemented for marker types for global locks.
+///
+/// See [`global_lock!`](crate::sync::global_lock) for examples.
+pub trait GlobalLockBackend {
+    /// The name for this global lock.
+    const NAME: &'static CStr;
+    /// Item type stored in this global lock.
+    type Item: 'static;
+    /// The backend used for this global lock.
+    type Backend: Backend + 'static;
+    /// The class for this global lock.
+    fn get_lock_class() -> &'static LockClassKey;
+}
+
+/// Type used for global locks.
+///
+/// See [`global_lock!`](crate::sync::global_lock) for examples.
+pub struct GlobalLock<B: GlobalLockBackend> {
+    inner: Lock<B::Item, B::Backend>,
+}
+
+impl<B: GlobalLockBackend> GlobalLock<B> {
+    /// Creates a global lock.
+    ///
+    /// # Safety
+    ///
+    /// * Before any other method on this lock is called, [`init`] must be called.
+    /// * The type `B` must not be used with any other lock.
+    ///
+    /// [`init`]: Self::init
+    pub const unsafe fn new(data: B::Item) -> Self {
+        Self {
+            inner: Lock {
+                state: Opaque::uninit(),
+                data: UnsafeCell::new(data),
+                _pin: PhantomPinned,
+            },
+        }
+    }
+
+    /// Initializes a global lock.
+    ///
+    /// # Safety
+    ///
+    /// Must not be called more than once on a given lock.
+    pub unsafe fn init(&'static self) {
+        // SAFETY: The pointer to `state` is valid for the duration of this call, and both `name`
+        // and `key` are valid indefinitely. The `state` is pinned since we have a `'static`
+        // reference to `self`.
+        //
+        // We have exclusive access to the `state` since the caller of `new` promised to call
+        // `init` before using any other methods. As `init` can only be called once, all other
+        // uses of this lock must happen after this call.
+        unsafe {
+            B::Backend::init(
+                self.inner.state.get(),
+                B::NAME.as_char_ptr(),
+                B::get_lock_class().as_ptr(),
+            )
+        }
+    }
+
+    /// Lock this global lock.
+    pub fn lock(&'static self) -> GlobalGuard<B> {
+        GlobalGuard {
+            inner: self.inner.lock(),
+        }
+    }
+
+    /// Try to lock this global lock.
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
+        Some(GlobalGuard {
+            inner: self.inner.try_lock()?,
+        })
+    }
+}
+
+/// A guard for a [`GlobalLock`].
+///
+/// See [`global_lock!`](crate::sync::global_lock) for examples.
+pub struct GlobalGuard<B: GlobalLockBackend> {
+    inner: Guard<'static, B::Item, B::Backend>,
+}
+
+impl<B: GlobalLockBackend> core::ops::Deref for GlobalGuard<B> {
+    type Target = B::Item;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+/// A version of [`LockedBy`] for a [`GlobalLock`].
+///
+/// See [`global_lock!`](crate::sync::global_lock) for examples.
+pub struct GlobalLockedBy<T: ?Sized, B: GlobalLockBackend> {
+    _backend: PhantomData<B>,
+    value: UnsafeCell<T>,
+}
+
+// SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
+unsafe impl<T, B> Send for GlobalLockedBy<T, B>
+where
+    T: ?Sized,
+    B: GlobalLockBackend,
+    LockedBy<T, B::Item>: Send,
+{
+}
+
+// SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
+unsafe impl<T, B> Sync for GlobalLockedBy<T, B>
+where
+    T: ?Sized,
+    B: GlobalLockBackend,
+    LockedBy<T, B::Item>: Sync,
+{
+}
+
+impl<T, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+    /// Create a new [`GlobalLockedBy`].
+    ///
+    /// The provided value will be protected by the global lock indicated by `B`.
+    pub fn new(val: T) -> Self {
+        Self {
+            value: UnsafeCell::new(val),
+            _backend: PhantomData,
+        }
+    }
+}
+
+impl<T: ?Sized, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+    /// Access the value immutably.
+    ///
+    /// The caller must prove shared access to the lock.
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
+        // SAFETY: The lock is globally unique, so there can only be one guard.
+        unsafe { &*self.value.get() }
+    }
+
+    /// Access the value mutably.
+    ///
+    /// The caller must prove shared exclusive to the lock.
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<B>) -> &'a mut T {
+        // SAFETY: The lock is globally unique, so there can only be one guard.
+        unsafe { &mut *self.value.get() }
+    }
+
+    /// Access the value mutably directly.
+    ///
+    /// The caller has exclusive access to this `GlobalLockedBy`, so they do not need to hold the
+    /// lock.
+    pub fn get_mut(&mut self) -> &mut T {
+        self.value.get_mut()
+    }
+}
+
+/// Defines a global lock.
+///
+/// The global mutex must be initialized before first use. Usually this is done by calling
+/// [`init`](GlobalLock::init) in the module initializer.
+///
+/// # Examples
+///
+/// A global counter.
+///
+/// ```
+/// # mod ex {
+/// # use kernel::prelude::*;
+/// kernel::sync::global_lock! {
+///     // SAFETY: Initialized in module initializer before first use.
+///     unsafe(uninit) static MY_COUNTER: Mutex<u32> = 0;
+/// }
+///
+/// fn increment_counter() -> u32 {
+///     let mut guard = MY_COUNTER.lock();
+///     *guard += 1;
+///     *guard
+/// }
+///
+/// impl kernel::Module for MyModule {
+///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///         // SAFETY: called exactly once
+///         unsafe { MY_COUNTER.init() };
+///
+///         Ok(MyModule {})
+///     }
+/// }
+/// # struct MyModule {}
+/// # }
+/// ```
+///
+/// A global mutex used to protect all instances of a given struct.
+///
+/// ```
+/// # mod ex {
+/// # use kernel::prelude::*;
+/// use kernel::sync::{GlobalGuard, GlobalLockedBy};
+///
+/// kernel::sync::global_lock! {
+///     // SAFETY: Initialized in module initializer before first use.
+///     unsafe(uninit) static MY_MUTEX: Mutex<()> = ();
+/// }
+///
+/// /// All instances of this struct are protected by `MY_MUTEX`.
+/// struct MyStruct {
+///     my_counter: GlobalLockedBy<u32, MY_MUTEX>,
+/// }
+///
+/// impl MyStruct {
+///     /// Increment the counter in this instance.
+///     ///
+///     /// The caller must hold the `MY_MUTEX` mutex.
+///     fn increment(&self, guard: &mut GlobalGuard<MY_MUTEX>) -> u32 {
+///         let my_counter = self.my_counter.as_mut(guard);
+///         *my_counter += 1;
+///         *my_counter
+///     }
+/// }
+///
+/// impl kernel::Module for MyModule {
+///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///         // SAFETY: called exactly once
+///         unsafe { MY_MUTEX.init() };
+///
+///         Ok(MyModule {})
+///     }
+/// }
+/// # struct MyModule {}
+/// # }
+/// ```
+#[macro_export]
+macro_rules! global_lock {
+    {
+        $(#[$meta:meta])* $pub:vis
+        unsafe(uninit) static $name:ident: $kind:ident<$valuety:ty> = $value:expr;
+    } => {
+        #[doc = ::core::concat!(
+            "Backend type used by [`",
+            ::core::stringify!($name),
+            "`](static@",
+            ::core::stringify!($name),
+            ")."
+        )]
+        #[allow(non_camel_case_types, unreachable_pub)]
+        $pub enum $name {}
+
+        impl $crate::sync::lock::GlobalLockBackend for $name {
+            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
+            type Item = $valuety;
+            type Backend = $crate::global_lock_inner!(backend $kind);
+
+            fn get_lock_class() -> &'static $crate::sync::LockClassKey {
+                $crate::static_lock_class!()
+            }
+        }
+
+        $(#[$meta])*
+        $pub static $name: $crate::sync::lock::GlobalLock<$name> = {
+            // Defined here to be outside the unsafe scope.
+            let init: $valuety = $value;
+
+            // SAFETY:
+            // * The user of this macro promises to initialize the macro before use.
+            // * We are only generating one static with this backend type.
+            unsafe { $crate::sync::lock::GlobalLock::new(init) }
+        };
+    };
+}
+pub use global_lock;
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! global_lock_inner {
+    (backend Mutex) => {
+        $crate::sync::lock::mutex::MutexBackend
+    };
+    (backend SpinLock) => {
+        $crate::sync::lock::spinlock::SpinLockBackend
+    };
+}

---
base-commit: 6ce162a002657910104c7a07fb50017681bc476c
change-id: 20240826-static-mutex-a4b228e0e6aa

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

