Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74B44B694
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035249; cv=none; b=M/CY3MFXgA5yGG5DjhRTJ2JSx5y28sp82yDgU8/e3+UfT3gneN5Cz2HtaA2ERAJmgi+6d8uOy+GJ/P8ATnNN7EARWQXHHL919m0eTPTrd75eegXzbIqpnb6+3HR3/hv6UCUrd1cVFkVDVttO7pe9+vCuTtt39JZgBvK9I8liT2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035249; c=relaxed/simple;
	bh=dsC+R+fqFo5YdncOp1z+kA+s40XOo8ebpWwIFGpk6IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ3wWcqbOwVtzb5QFXSGlEaman8rideB9SrtN0j1Llnec7d2hgfP6y7IZ2ZCL7hXzQ8Qk8rVujvQkPe4zRcGgGZOjvg91SGSg6Ez/sAu1K0aoA4fe4cWCnGWQmBLwIQ4NY7bVkgmnW/3EK5U37OuabaUaFqyOyg9lGwizausRzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhpWyrar; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhpWyrar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wy8aUUqx+dURCdafxZ9TgDpWa7V6xFqGghn+V7QzVIA=;
	b=UhpWyrarPvnUmOA7zrGhUPj54TLn/k+f6ZQMtnSLzi3lZBgBAeDsjhF8CHxub+ptfi8Ue3
	jNHy9Uv8Ss/ornymTZjSxuzmtaguLxRlnMG9ifOgZ5S/Y30z8dWVwxVsiLNY+Gop9slKMV
	DksTVosGwzpgT+EDvovnErb7q11klXw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-gWn6WxHOOv-uhV9Q6qg5ww-1; Wed,
 21 Jan 2026 17:40:34 -0500
X-MC-Unique: gWn6WxHOOv-uhV9Q6qg5ww-1
X-Mimecast-MFC-AGG-ID: gWn6WxHOOv-uhV9Q6qg5ww_1769035231
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92B11180045C;
	Wed, 21 Jan 2026 22:40:31 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 00DBA19560AB;
	Wed, 21 Jan 2026 22:40:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v17 13/16] rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
Date: Wed, 21 Jan 2026 17:39:16 -0500
Message-ID: <20260121223933.1568682-14-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-1-lyude@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While a GlobalLock is always going to be static, in the case of locks with
explicit backend contexts the GlobalGuard will not be 'static and will
instead share the lifetime of the context. So, add a lifetime parameter to
GlobalGuard to allow for this so we can implement GlobalGuard support for
SpinlockIrq.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/sync/lock/global.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 06d62ad02f90d..be17a30c66bf8 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -77,14 +77,14 @@ pub unsafe fn init(&'static self) {
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<G> {
+    pub fn lock(&'static self) -> GlobalGuard<'static, G> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<G>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,11 +94,11 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<G>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<G: GlobalLockBackend> {
-    inner: Guard<'static, G::Item, G::Backend>,
+pub struct GlobalGuard<'a, G: GlobalLockBackend> {
+    inner: Guard<'a, G::Item, G::Backend>,
 }
 
-impl<G: GlobalLockBackend> core::ops::Deref for GlobalGuard<G> {
+impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
     type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
@@ -106,7 +106,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<G>
+impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G>
 where
     G::Item: Unpin,
 {
@@ -157,7 +157,7 @@ impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<G>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -165,7 +165,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<G>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<G>) -> &'a mut T {
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -235,7 +235,7 @@ pub fn get_mut(&mut self) -> &mut T {
 ///     /// Increment the counter in this instance.
 ///     ///
 ///     /// The caller must hold the `MY_MUTEX` mutex.
-///     fn increment(&self, guard: &mut GlobalGuard<MY_MUTEX>) -> u32 {
+///     fn increment(&self, guard: &mut GlobalGuard<'_, MY_MUTEX>) -> u32 {
 ///         let my_counter = self.my_counter.as_mut(guard);
 ///         *my_counter += 1;
 ///         *my_counter
-- 
2.52.0

