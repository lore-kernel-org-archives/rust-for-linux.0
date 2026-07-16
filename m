Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477AD30EF91;
	Thu, 16 Jul 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213790; cv=none; b=tliI8fXHT2PqeEXi/d2LCF6uyaWrY4UWFzpGf0dLT7RxqiHJQRf9Fo5t7e2mu9Qc2nUbSWpAyk+JwiRjFAJB2KszjTIKwqWhwClxWD/A1Y0cuZZ5pP0rd5pAsYF43Gqt6sP9v0N+O3INGGUkXb0Iooxd8QLBFQklY4v4kY7q1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213790; c=relaxed/simple;
	bh=U8FlLMdBfHYZsBqpVc+LxZhXrNuezZtf/TvWWL5j7Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuWK4VlebvldGsFUQB8iPsmp6yf05ysBHmCyoJVak/p6GHHvu2tGvZ+da/8gY8ad8gySt8L5mkh64g+Ov+b/2iwPTakk4Hnu6xCv9zOWKvKATUJY8mmUQNxh3fyn7JnMmraO+vS8oZ/bCZK9QTauorKAam3Fb9fwXO1wFDjUJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFuCaHlT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFuCaHlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368A51F00A3A;
	Thu, 16 Jul 2026 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213788;
	bh=wPN1nh3q8JCv9o/jE8PL/Hv4Ztn6JUsrKDKc6ce8JKY=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=PFuCaHlTffVNyGZKZ7s4XSCR/uMBiZf8nL1RfwLJ5w3nV67rF3my61hKCXQzanggA
	 ZAVeSo4n3qkLmnrcSKPnmFCPZFBBQAnhxcUxtkAB230KbqRzwLU6PtL6Siz4BA+ode
	 9Vk1m17ly1bpH79jFdShfkMWY6/cjbYoLQQ0jrATz4a2Io9S+TzXy257FFUltaXhbt
	 xSfpWHeGquPezxupnomh7wohFrpoOtqHJvD7TmYg5UCrG0a2pG0I8GAp8q4KImGNMm
	 u9ZxC/n1AlIMaQ0BTUapgiem1bnwYO5/CrtHnjcDEqKI0UG06+fQNMR3bqA92HvxtV
	 zQ69i2dHvhcVg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: revocable: use LKMM atomics instead of Rust atomics
Date: Thu, 16 Jul 2026 15:55:35 +0100
Message-ID: <20260716145536.3681630-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Kernel code should use LKMM atomics. The existing code is `AtomicBool` with
the need to use `xchg`, so convert it to `AtomicFlag`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/revocable.rs | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2af212ea3b6d..4d177744520a 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -7,12 +7,22 @@
 
 use pin_init::Wrapper;
 
-use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    sync::{
+        atomic::{
+            AtomicFlag,
+            Relaxed, //
+        },
+        rcu, //
+    },
+    types::Opaque, //
+};
 use core::{
     marker::PhantomData,
     ops::Deref,
-    ptr::drop_in_place,
-    sync::atomic::{AtomicBool, Ordering},
+    ptr::drop_in_place, //
 };
 
 /// An object that can become inaccessible at runtime.
@@ -66,7 +76,7 @@
 /// ```
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
-    is_available: AtomicBool,
+    is_available: AtomicFlag,
     #[pin]
     data: Opaque<T>,
 }
@@ -85,7 +95,7 @@ impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         try_pin_init!(Self {
-            is_available: AtomicBool::new(true),
+            is_available: AtomicFlag::new(true),
             data <- Opaque::pin_init(data),
         }? E)
     }
@@ -99,7 +109,7 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // Since `self.is_available` is true, data is initialised and has to remain valid
             // because the RCU read side lock prevents it from being dropped.
             Some(RevocableGuard::new(self.data.get(), guard))
@@ -117,7 +127,7 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// allowed to sleep because another CPU may be waiting to complete the revocation of this
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
             // valid because the RCU read side lock prevents it from being dropped.
             Some(unsafe { &*self.data.get() })
@@ -158,7 +168,7 @@ pub unsafe fn access(&self) -> &T {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+        let revoke = self.is_available.xchg(false, Relaxed);
 
         if revoke {
             if SYNC {

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.54.0

