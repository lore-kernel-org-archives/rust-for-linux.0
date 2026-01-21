Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B94611D4
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035253; cv=none; b=a+cwu7GRl9acvTRZN5TnajCJnclmApoO26iREx2KMjebwp5baaetmDBFAt261hOMrbdLKODRrp0Au9sVn6Wge39cI8emLWpdp7gyX7BuC/XrYEpCvbGQ7gYF7qN6RgaunKRZ8Iu7PRHMlQsntW8GAx8YuIzI1pyoUUCpgD3KpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035253; c=relaxed/simple;
	bh=3//OycOmD4rBumI17D3kBTe6WK01LnbBe128wnNQEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEv/bkpsolzaxQN09S6YdhHgVaZsW2n3a2JtPl+uXBSjFPW1QFHzUmkNM9s7ct6KWOPXjGr7pCH4eQqezDlUWr4ZHF3qp1G3zSkFGzWuBPweOnDu4Eb0EgXiB3/tnVaFAFdI6YYEEw4b0fF8KW0F9t0LIhiXm050/9prqB1k7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WJQmtspm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WJQmtspm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PfPmdWNG75YWfsGCPexjvl6kzyToE8Zc5DDeinRfGW0=;
	b=WJQmtspm/jcj4JRzWR8ZKxH1+cPEl9d7R3m5IWZPTSE91vx7hMqhNxZvx1BFo8RXJ8sHgj
	CJbzAxauNxDrbpBmM/PU+DO99foI5jS9E/ubU5MaQG8L9LXowgE4n3Vv1fwnzwRQiaBGhW
	a2qDbqr7MDPd/h5TNfxQxpQccV+/m/k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-V--cIc5pMGaCi0y-zM3wHQ-1; Wed,
 21 Jan 2026 17:40:36 -0500
X-MC-Unique: V--cIc5pMGaCi0y-zM3wHQ-1
X-Mimecast-MFC-AGG-ID: V--cIc5pMGaCi0y-zM3wHQ_1769035234
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97696180034A;
	Wed, 21 Jan 2026 22:40:34 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C44C419560AB;
	Wed, 21 Jan 2026 22:40:31 +0000 (UTC)
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
Subject: [PATCH v17 14/16] rust: sync: lock/global: Add Backend parameter to GlobalGuard
Date: Wed, 21 Jan 2026 17:39:17 -0500
Message-ID: <20260121223933.1568682-15-lyude@redhat.com>
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

Due to the introduction of sync::lock::Backend::Context, it's now possible
for normal locks to return a Guard with a different Backend than their
respective lock (e.g. Backend::BackendInContext). We want to be able to
support global locks with contexts as well, so add a trait bound to
explicitly specify which Backend is in use for a GlobalGuard.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>

---
V17:
* Add default parameter for generic `B` to `GlobalGuard`

 rust/kernel/sync/lock/global.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index be17a30c66bf8..94f6b3b21324f 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -77,14 +77,14 @@ pub unsafe fn init(&'static self) {
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<'static, G> {
+    pub fn lock(&'static self) -> GlobalGuard<'static, G, G::Backend> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G, G::Backend>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,11 +94,11 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<'a, G: GlobalLockBackend> {
-    inner: Guard<'a, G::Item, G::Backend>,
+pub struct GlobalGuard<'a, G: GlobalLockBackend, B: Backend = <G as GlobalLockBackend>::Backend> {
+    inner: Guard<'a, G::Item, B>,
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::Deref for GlobalGuard<'a, G, B> {
     type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
@@ -106,7 +106,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G>
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::DerefMut for GlobalGuard<'a, G, B>
 where
     G::Item: Unpin,
 {
@@ -157,7 +157,7 @@ impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
+    pub fn as_ref<'a, B: Backend>(&'a self, _guard: &'a GlobalGuard<'_, G, B>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -165,7 +165,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
+    pub fn as_mut<'a, B: Backend>(&'a self, _guard: &'a mut GlobalGuard<'_, G, B>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -219,7 +219,7 @@ pub fn get_mut(&mut self) -> &mut T {
 /// ```
 /// # mod ex {
 /// # use kernel::prelude::*;
-/// use kernel::sync::{GlobalGuard, GlobalLockedBy};
+/// use kernel::sync::{Backend, GlobalGuard, GlobalLockedBy};
 ///
 /// kernel::sync::global_lock! {
 ///     // SAFETY: Initialized in module initializer before first use.
@@ -235,7 +235,7 @@ pub fn get_mut(&mut self) -> &mut T {
 ///     /// Increment the counter in this instance.
 ///     ///
 ///     /// The caller must hold the `MY_MUTEX` mutex.
-///     fn increment(&self, guard: &mut GlobalGuard<'_, MY_MUTEX>) -> u32 {
+///     fn increment<B: Backend>(&self, guard: &mut GlobalGuard<'_, MY_MUTEX, B>) -> u32 {
 ///         let my_counter = self.my_counter.as_mut(guard);
 ///         *my_counter += 1;
 ///         *my_counter
-- 
2.52.0

