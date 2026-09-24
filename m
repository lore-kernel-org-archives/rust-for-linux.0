Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F336443C32;
	Thu, 24 Sep 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240204; cv=none; b=ap34pvpLbhE98iAUjXLGB+/De1YurpVXxLTDeq3pnDJqiyQetjYFaWq42rqGLp3HrM0D+sPUJTRSW6jwM2DSahoufaVo99OyZEZo4z1mSEkbq6UVlYo3jiq2wIJYsJCkyGvuYckXh9juGIvP2/l9T8ymzVlq5cejmk/gMgooVuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240204; c=relaxed/simple;
	bh=F4xOYxbBFxGhG7xAVfJrjljDoQ05a3QVGJHh/dmCurc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLXt6XnyFWedoPKCPHT1I7ZmQlcfkp6b2xTtCF8K6J7QUypN31QmPHE2lY8m59Osq8K9nkFMIkL/BAfSjkQRqAG06IDZFOSez5wKccZNlFSNnbeXPr9WyzoQUXdPceR5Mchn6CNYqSYZ0aMotuCOLLCEhaE/USsVzGMKOhu3f2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D53tJSHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D53tJSHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C621F00893;
	Thu, 24 Sep 2026 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240194;
	bh=QTziv6yxsGSc3zX94a/1OnC7b3UZDU7kb71l30MUCt8=;
	h=From:To:Cc:Subject:Date;
	b=D53tJSHDD9pkxGAhnlw+mJzYTDfzY9j4qTNBeljFVBJv6QtpZ/LAFpqgZiIT44fJT
	 WN9BuwLGASEdbHqKvTbxIO8AyXiSXC9Jxrvr6QiI71Es7W3iS7wZpWc2DPl+RBDaox
	 eNKhz7xhKum4Km1BXlyqV3yAnPiRAMZQApEoLR7+RHha0R8b2nTu73gLtRzpZ5U1+W
	 CbIue4HYNsPmGgUDMPt/ESyQ6xqporVxSztKryxs53mGelZcKqse8VrbQesNdI2EG0
	 eU5WdbhllwEf/jdnGPy6rMrgd3ygeR9xrpKnj40JWvXFJq067uqzm9pGyAHw2rl46F
	 6CvrLE/0r9XwA==
From: Philipp Stanner <phasta@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] rust: sync: Accept errors for Lock payload data
Date: Thu, 24 Sep 2026 10:55:24 +0200
Message-ID: <20260924085523.2620704-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock` baseclass currently does not allow for fallible user-data.
This can cause conflicts when used with other primitives, for example
when a lock shall be pin-initialized with payload data that is fallible.

Add support for the lock base class so that it works with
try_pin_init!(). Adjust spinlock and mutex accordingly.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Regarding removal of the CStrExt, I got "unused import" errors because
of it. Don't fully understand why?

P.
---
 rust/kernel/sync/lock.rs          | 21 ++++++++++++++-------
 rust/kernel/sync/lock/mutex.rs    |  7 ++++---
 rust/kernel/sync/lock/spinlock.rs | 20 ++++++++++----------
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..1b2df5d0dcf9 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,11 +7,13 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStr,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
-use pin_init::{pin_data, pin_init, PinInit, Wrapper};
+use pin_init::{pin_data, PinInit, Wrapper};
+
+use kernel::prelude::*;
 
 pub mod mutex;
 pub mod spinlock;
@@ -126,14 +128,19 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for Lock<T, B> {}
 // data it protects is `Send`.
 unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
+use core::convert::Infallible;
+
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(
-        t: impl PinInit<T>,
+    pub fn new<E>(
+        t: impl PinInit<T, E>,
         name: &'static CStr,
         key: Pin<&'static LockClassKey>,
-    ) -> impl PinInit<Self> {
-        pin_init!(Self {
+    ) -> impl PinInit<Self, E>
+    where
+        E: From<Infallible>,
+    {
+        try_pin_init!(Self {
             data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
             // SAFETY: `slot` is valid while the closure is called and both `name` and `key` have
@@ -141,7 +148,7 @@ pub fn new(
             state <- Opaque::ffi_init(|slot| unsafe {
                 B::init(slot, name.as_char_ptr(), key.as_ptr())
             }),
-        })
+        }? E)
     }
 }
 
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index cda0203efefb..35e6b02ff426 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -35,6 +35,7 @@ macro_rules! new_mutex {
 ///
 /// ```
 /// use kernel::sync::{new_mutex, Mutex};
+/// use kernel::prelude::*;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -49,8 +50,8 @@ macro_rules! new_mutex {
 /// }
 ///
 /// impl Example {
-///     fn new() -> impl PinInit<Self> {
-///         pin_init!(Self {
+///     fn new() -> impl PinInit<Self, Error> {
+///         try_pin_init!(Self {
 ///             c: 10,
 ///             d <- new_mutex!(Inner { a: 20, b: 30 }),
 ///         })
@@ -58,7 +59,7 @@ macro_rules! new_mutex {
 /// }
 ///
 /// // Allocate a boxed `Example`.
-/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+/// let e = KBox::try_pin_init(Example::new(), GFP_KERNEL)?;
 /// assert_eq!(e.c, 10);
 /// assert_eq!(e.d.lock().a, 20);
 /// assert_eq!(e.d.lock().b, 30);
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index aafc80125f59..8ea2c5b202e6 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,10 +4,7 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
-use crate::{
-    interrupt::LocalInterruptDisabled,
-    prelude::*, //
-};
+use crate::interrupt::LocalInterruptDisabled;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -38,6 +35,7 @@ macro_rules! new_spinlock {
 ///
 /// ```
 /// use kernel::sync::{new_spinlock, SpinLock};
+/// use kernel::prelude::*;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -52,8 +50,8 @@ macro_rules! new_spinlock {
 /// }
 ///
 /// impl Example {
-///     fn new() -> impl PinInit<Self> {
-///         pin_init!(Self {
+///     fn new() -> impl PinInit<Self, Error> {
+///         try_pin_init!(Self {
 ///             c: 10,
 ///             d <- new_spinlock!(Inner { a: 20, b: 30 }),
 ///         })
@@ -184,6 +182,7 @@ macro_rules! new_spinlock_irq {
 ///
 /// ```
 /// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
+/// use kernel::prelude::*;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -199,8 +198,8 @@ macro_rules! new_spinlock_irq {
 /// }
 ///
 /// impl Example {
-///     fn new() -> impl PinInit<Self> {
-///         pin_init!(Self {
+///     fn new() -> impl PinInit<Self, Error> {
+///         try_pin_init!(Self {
 ///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
 ///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
 ///         })
@@ -232,6 +231,7 @@ macro_rules! new_spinlock_irq {
 /// ```
 /// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
 /// use kernel::interrupt::*;
+/// use kernel::prelude::*;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -244,8 +244,8 @@ macro_rules! new_spinlock_irq {
 /// }
 ///
 /// impl Example {
-///     fn new() -> impl PinInit<Self> {
-///         pin_init!(Self {
+///     fn new() -> impl PinInit<Self, Error> {
+///         try_pin_init!(Self {
 ///             inner <- new_spinlock_irq!(Inner { a: 20 }),
 ///         })
 ///     }
-- 
2.55.0

