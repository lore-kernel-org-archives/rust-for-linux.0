Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7B30DECE;
	Fri, 16 Oct 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152587; cv=none; b=n39/OccFPI1l2dblSBoma7XTcR90oUnrm5MJr9gUpdLHSjlugQ7FtSZZkqOWi4Zx/sNa5Uat4nOy8R1qOrAa2TUBi6fIHQ0MA72WRY7Oukm+QrnWdNd3BWwZYpTWyaqDZ7mYjjjKVB9M7f+IioyZqn4NjnyjpLtayoqjBiIvEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152587; c=relaxed/simple;
	bh=RBTwr5PmgkJ+fqzubKNpPBBYwULXMq9PYYWa8ZxfymU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF1u/H4oABL6PymiBdaQUMGjV4mg1qE1Q3Q4vOuUKRVp5KIA84QEzweNhPUXugQglUV70D7LbYCRvEQrSwbA8dj3bDy56+U07nGcMx65SI6KdDqmYaYq0kyiReT8MwtOxEdx4YUW/lPcqC32xF9zFx33fdDE7ncS4b4xMRzCeFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og6w/HXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og6w/HXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7147B1F000C4;
	Fri, 16 Oct 2026 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792152586;
	bh=2MbaYbwmwg63b75Gi668lUo6iHTDnNr2/fOWj847oSs=;
	h=From:To:Cc:Subject:Date;
	b=og6w/HXZ087NW3f1p7iWDFIMQsQ452pNxErpzibZWHz9g7t9fXwnHT5s2goJiNbTP
	 la0aE1Wr8FcZ2FTXH+jGD0FNblEOOoBlilAxOSUybMO1agpu2ciClHRBWU1Z/nJZKa
	 jrsUpuNfRp+NcAFjzzPkrYvBIPfc3HyzUnisLsBVMyK+HaVA4Ol2zKY0gTbFZwLJs0
	 LRAWJtGln+N9peok5sfcmGXjRJa+B/cT6XPpHsWmApLwgkJF9vqto+mlfE71xh3aEm
	 BY6ioy4YaA1Zj2A1cZiyZ3xZn2f32/kQGmHNzm363hi1Aw7hVoLd6hwdMN6y+pwJZz
	 0IvWPr2TdAfZA==
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
Subject: [PATCH v3] rust: sync: Accept errors for Lock payload data
Date: Fri, 16 Oct 2026 14:09:27 +0200
Message-ID: <20261016120926.1213105-2-phasta@kernel.org>
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
Changes in v3:
  - Vertical formatting for imports

Changes in v2:
  - Don't import prelude in doctests. (Gary)
  - Keep using pin_init! over try_pin_init! in Lock::new(). (Gary)
---
 rust/kernel/sync/lock.rs          | 23 +++++++++++++++++------
 rust/kernel/sync/lock/mutex.rs    |  6 +++---
 rust/kernel/sync/lock/spinlock.rs | 17 +++++++----------
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..5bff5228ac16 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,11 +7,17 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStr,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
-use pin_init::{pin_data, pin_init, PinInit, Wrapper};
+use pin_init::{
+    pin_data,
+    PinInit,
+    Wrapper, //
+};
+
+use kernel::prelude::*;
 
 pub mod mutex;
 pub mod spinlock;
@@ -126,13 +132,18 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for Lock<T, B> {}
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
+    ) -> impl PinInit<Self, E>
+    where
+        E: From<Infallible>,
+    {
         pin_init!(Self {
             data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
@@ -141,7 +152,7 @@ pub fn new(
             state <- Opaque::ffi_init(|slot| unsafe {
                 B::init(slot, name.as_char_ptr(), key.as_ptr())
             }),
-        })
+        }? E)
     }
 }
 
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index cda0203efefb..38d8fb9dad5d 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -49,8 +49,8 @@ macro_rules! new_mutex {
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
@@ -58,7 +58,7 @@ macro_rules! new_mutex {
 /// }
 ///
 /// // Allocate a boxed `Example`.
-/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+/// let e = KBox::try_pin_init(Example::new(), GFP_KERNEL)?;
 /// assert_eq!(e.c, 10);
 /// assert_eq!(e.d.lock().a, 20);
 /// assert_eq!(e.d.lock().b, 30);
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 6a71bb3a5c45..f50750ddff55 100644
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
@@ -52,8 +49,8 @@ macro_rules! new_spinlock {
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
@@ -199,8 +196,8 @@ macro_rules! new_spinlock_irq {
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
@@ -244,8 +241,8 @@ macro_rules! new_spinlock_irq {
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

base-commit: 7c306f00835a237a70024a8f968dbc3bc8db8fcf
-- 
2.55.0

