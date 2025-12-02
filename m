Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274D2DC77D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700102; cv=none; b=dX646hxMp9OauL/wDpMbhqJwsNJC6p2iowr4fWsvwVNExTi7KqYC/or8fPuSROTE+IBqf8annETCRoVCTLURtOtk+Oxdf3TY0R8YBvzchNLMDiZnMZLOcPTu4/rwDbEh5GKgq5fxLKPofB5qOOjxOv70197fjss7W2qSmlsWPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700102; c=relaxed/simple;
	bh=tLPDDkLEViSkLBgrE8m+TJlxSjUbsou/zGCyJe+ad6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3TpeYDf3lCfQBu72A/MOytU7ZGfbwgD6pRzlayv2eEAvz4sk/P8LVsauuJ2vPT+c6lm51CIuhgfQ4ITmY7zgBTVfwKs7Kj/aCZUJ+H2z0p3gQhxQOhqnAx445KKv/WdrfENbY2+VfJuWemHykqOm3QDJwwaTWclSDYKRQfadBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdR7Bd+A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SdR7Bd+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764700100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWvvpW8Wr87PBbOYqTtSpCNr0mDcnZ263kzk42NtFLU=;
	b=SdR7Bd+A2z9pOU1MoLentdBT7H0k3xPkSnlzOL6hVW2aVMmavlXLPloP4xX8Y6duE1xf4j
	7PRYSvqOLuwxKVY48Mi4Skk5oQuS0XPYBLw80RcdhKZHdEKfZ5odY27BOxwxiuOkHfEcjX
	T0g3doOpzAxztEcINb9d4vnw6e65xBw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-eL5mpQ_XMf-z6I0r4vmp6Q-1; Tue,
 02 Dec 2025 13:28:19 -0500
X-MC-Unique: eL5mpQ_XMf-z6I0r4vmp6Q-1
X-Mimecast-MFC-AGG-ID: eL5mpQ_XMf-z6I0r4vmp6Q_1764700097
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07AD91800561;
	Tue,  2 Dec 2025 18:28:17 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 866FA19560A7;
	Tue,  2 Dec 2025 18:28:14 +0000 (UTC)
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
Subject: [PATCH v15 12/16] rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
Date: Tue,  2 Dec 2025 13:24:20 -0500
Message-ID: <20251202182720.125884-13-lyude@redhat.com>
In-Reply-To: <20251202182720.125884-1-lyude@redhat.com>
References: <20251202182720.125884-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

While a GlobalLock is always going to be static, in the case of locks with
explicit backend contexts the GlobalGuard will not be 'static and will
instead share the lifetime of the context. So, add a lifetime parameter to
GlobalGuard to allow for this so we can implement GlobalGuard support for
SpinlockIrq.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index c2349347976d8..1d279be1a2eca 100644
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
 
-impl<G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<G> {
+impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -154,7 +154,7 @@ impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<G>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<G>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<G>) -> &'a mut T {
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -232,7 +232,7 @@ pub fn get_mut(&mut self) -> &mut T {
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

