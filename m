Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143C2FD872
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752779930; cv=none; b=rBs+w3R1Oz8xYY1VjwA4GTWYtlnBc+40Aotyo2H1CRKpLz+e5hh5BGnEtc30EAvLbzc6LGUMmrzVYOHar86j1BSuYHlQxOqlN9K+2ZkZfgDPp/lhkVcU/63lrE0XyT/fGWDSbgU5IPujSPVF2B0DCYqaQvelgR9g+DqsaR/p6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752779930; c=relaxed/simple;
	bh=WpjcyGT/LMlJKYech8HzFrb+a3eJWb1oQ2d/ot1mjEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nM9m4NTBMnw/7XN5IGO8PV2iSbgMDETesX609/MRhkIPC15PnbkN+RYlQ3OtAc1GmLwgHQvewgYHUf0yKU77XV0XoR9frYQ0qbtlHwjIeuaK1gfbl7ExMM9UxSRZKkilF32bR7RW6h+o4UAN5SEm5f1lOwS+g4wOYmbTvX89co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpH2N1Yd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpH2N1Yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752779925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0GItCMTKxqRUYBSRjtpioeXnVDALN0AYmugH0D4+fY=;
	b=YpH2N1YdIGO611qJdeV8/uv8oywcxz4vgk2cvjwmRlPAeZ25TIurFdL9flvOOYZEvrQeFh
	3ax3K2bEITPb6TmAArbdf5tZ3NDQgzWvmIEx1M4fUirPXGYbiYajvBTktRq1qa15MiWyMW
	DxWNYQJs2vz1vgd14+Cz/GI44kvL3Oo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-CFLgiiJRMk6YafdzN0ucBQ-1; Thu,
 17 Jul 2025 15:18:39 -0400
X-MC-Unique: CFLgiiJRMk6YafdzN0ucBQ-1
X-Mimecast-MFC-AGG-ID: CFLgiiJRMk6YafdzN0ucBQ_1752779917
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E7C41800C33;
	Thu, 17 Jul 2025 19:18:37 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85A4A180049D;
	Thu, 17 Jul 2025 19:18:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v12 10/15] rust: sync: lock/global: Rename B to G in trait bounds
Date: Thu, 17 Jul 2025 15:15:49 -0400
Message-ID: <20250717191719.2076270-11-lyude@redhat.com>
In-Reply-To: <20250717191719.2076270-1-lyude@redhat.com>
References: <20250717191719.2076270-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Due to the introduction of Backend::BackendInContext, if we want to be able
support Lock types with a Context we need to be able to handle the fact
that the Backend for a returned Guard may not exactly match the Backend for
the lock. Before we add this though, rename B to G in all of our trait
bounds to make sure things don't become more difficult to understand once
we add a Backend bound.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 47e200b750c1d..dfdd913d6c1f5 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -33,18 +33,18 @@ pub trait GlobalLockBackend {
 /// Type used for global locks.
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalLock<B: GlobalLockBackend> {
-    inner: Lock<B::Item, B::Backend>,
+pub struct GlobalLock<G: GlobalLockBackend> {
+    inner: Lock<G::Item, G::Backend>,
 }
 
-impl<B: GlobalLockBackend> GlobalLock<B> {
+impl<G: GlobalLockBackend> GlobalLock<G> {
     /// Creates a global lock.
     ///
     /// # Safety
     ///
     /// * Before any other method on this lock is called, [`Self::init`] must be called.
-    /// * The type `B` must not be used with any other lock.
-    pub const unsafe fn new(data: B::Item) -> Self {
+    /// * The type `G` must not be used with any other lock.
+    pub const unsafe fn new(data: G::Item) -> Self {
         Self {
             inner: Lock {
                 state: Opaque::uninit(),
@@ -68,23 +68,23 @@ pub unsafe fn init(&'static self) {
         // `init` before using any other methods. As `init` can only be called once, all other
         // uses of this lock must happen after this call.
         unsafe {
-            B::Backend::init(
+            G::Backend::init(
                 self.inner.state.get(),
-                B::NAME.as_char_ptr(),
-                B::get_lock_class().as_ptr(),
+                G::NAME.as_char_ptr(),
+                G::get_lock_class().as_ptr(),
             )
         }
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<B> {
+    pub fn lock(&'static self) -> GlobalGuard<G> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<G>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,19 +94,19 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<B: GlobalLockBackend> {
-    inner: Guard<'static, B::Item, B::Backend>,
+pub struct GlobalGuard<G: GlobalLockBackend> {
+    inner: Guard<'static, G::Item, G::Backend>,
 }
 
-impl<B: GlobalLockBackend> core::ops::Deref for GlobalGuard<B> {
-    type Target = B::Item;
+impl<G: GlobalLockBackend> core::ops::Deref for GlobalGuard<G> {
+    type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
         &self.inner
     }
 }
 
-impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B> {
+impl<G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<G> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -115,33 +115,33 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 /// A version of [`LockedBy`] for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalLockedBy<T: ?Sized, B: GlobalLockBackend> {
-    _backend: PhantomData<B>,
+pub struct GlobalLockedBy<T: ?Sized, G: GlobalLockBackend> {
+    _backend: PhantomData<G>,
     value: UnsafeCell<T>,
 }
 
 // SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
-unsafe impl<T, B> Send for GlobalLockedBy<T, B>
+unsafe impl<T, G> Send for GlobalLockedBy<T, G>
 where
     T: ?Sized,
-    B: GlobalLockBackend,
-    LockedBy<T, B::Item>: Send,
+    G: GlobalLockBackend,
+    LockedBy<T, G::Item>: Send,
 {
 }
 
 // SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
-unsafe impl<T, B> Sync for GlobalLockedBy<T, B>
+unsafe impl<T, G> Sync for GlobalLockedBy<T, G>
 where
     T: ?Sized,
-    B: GlobalLockBackend,
-    LockedBy<T, B::Item>: Sync,
+    G: GlobalLockBackend,
+    LockedBy<T, G::Item>: Sync,
 {
 }
 
-impl<T, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+impl<T, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Create a new [`GlobalLockedBy`].
     ///
-    /// The provided value will be protected by the global lock indicated by `B`.
+    /// The provided value will be protected by the global lock indicated by `G`.
     pub fn new(val: T) -> Self {
         Self {
             value: UnsafeCell::new(val),
@@ -150,11 +150,11 @@ pub fn new(val: T) -> Self {
     }
 }
 
-impl<T: ?Sized, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<G>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<B>) -> &'a mut T {
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<G>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
-- 
2.50.0

