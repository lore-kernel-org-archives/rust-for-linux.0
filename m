Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027174FDE62;
	Wed, 30 Sep 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782898; cv=none; b=l+YdpSrzmXMb+qJ27odog7hQwRIGT1ZP7s6NouFb54uO8P6Am8IjtfNa69VmHvzDWceHK0ERUQ9qkJedDfHlOVdjNtEu7a1BqLm9IoJrq84biEn9WXUTr6OrGw3BXX3CjRwfW6MPeVjEGzyY9abVzMFxFeRQhSHALVvBns72+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782898; c=relaxed/simple;
	bh=d07y4AH12Gb7L+Toaji4x96CQYlqmUb+XYLYmokP/w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kdaw+bfHvGtEDEDnN8n53h6rEGRRxuHt0yLXoTbl78GDrLOZ8IOGtmT/sNIKb1lNmR7Bg6Qfe4PT3JWTiQkMXfVEcHRwFnJ1QlWHMMXN48MPGHuuFAkBN8IGsGihS5JTRfaIEXAmNPFcMHtp6d6MU9mIHwX1gjzjVzEKjpT9mcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJRi3bpS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJRi3bpS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7543E1F0089B;
	Wed, 30 Sep 2026 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782890;
	bh=cx/7cpTOyS/9/r2l8q+jaZmiaiNVBtIMxCNWDxZTieY=;
	h=From:To:Cc:Subject:Date;
	b=GJRi3bpS409d12xQAjhAgAbhr1WYna/6pgncF8YPWpwBN6Jdhi6x5/pObuTOpL7in
	 m+JC2kEZaXaBeeX8SEV6aYC+JDGXjcm8J/EZZ74WvtOAs1eS/I9sMxjMPKvLXsj7Qn
	 cM9ggXp2wmhk88FTkTijbug2ALNtW/X6gnjkpL+VinqUFLdvzIFeinVrvu/q5QRbe1
	 7EgScxq7iQdXi9pwA83ZSHy5U5/EUFbggUIbGaLvkyYHkIPjb6uE/oAYMYmbIRQhNn
	 A9JlrSTIf4ru6tlFUJ1kTxdMQJMQ3kWrLxbZ1HZb13l56ZiHQhCj8fXA/6ho9fld5m
	 9oLKK6HwMgORg==
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
Subject: [PATCH v2] rust: sync: Accept errors for Lock payload data
Date: Wed, 30 Sep 2026 17:41:02 +0200
Message-ID: <20260930154101.1885705-2-phasta@kernel.org>
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
Changes in v2:
  - Don't import prelude in doctests. (Gary)
  - Keep using pin_init! over try_pin_init! in Lock::new(). (Gary)
---
 rust/kernel/sync/lock.rs          | 19 +++++++++++++------
 rust/kernel/sync/lock/mutex.rs    |  6 +++---
 rust/kernel/sync/lock/spinlock.rs | 17 +++++++----------
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..5467f1d1af55 100644
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
@@ -126,13 +128,18 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for Lock<T, B> {}
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
@@ -141,7 +148,7 @@ pub fn new(
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
index aafc80125f59..222443fa1c6c 100644
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

base-commit: f9a6960c7b27c03becd50a2a7620273d80e4040d
-- 
2.55.0

