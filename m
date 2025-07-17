Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC6303DE4
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752779940; cv=none; b=YgnotuxL88axQVVe2AHMUKWxZLOf7LWyEFXasA1TvKfZw0Ms40dnMMESwgyQtSbp5cKVMCDkKNT2i9cfeA79VXdfQnpuo84KsqgO0g/UrRj+L7XvxhK4joiiXE+t2KHPzOpgwj1IINe0ogKpNchEHayKSMvqfAd15q4jKinjwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752779940; c=relaxed/simple;
	bh=KhyXpdrnNRmZJArqvpnD6zxS4VpNg0NEmUn14oARH58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIMz6bYdnWZGDf90n0uigEOMsn7I4Nx4vLdo2v8Ye0RD91X7YVdBlrNHyCk+Wy+fYsMl2BtxIeY1WOT8IuAkdgLJSAtVT1lcTHKhorbjhOmzPakeo7DbrsK9Zr6/AcSfbIN/Duy0AeHn/BZ9GYgBjXYK991yaPPkBfMsSqSWCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9exOFPM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9exOFPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752779937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikpxnE4FqOnYzLdJmrDCnds8Pt84GEOTjPbssWEskjg=;
	b=Z9exOFPMsFvqG+Bx1XrT/SrBF7lI1+uVDs9h1l65ZdKWcIlr0iG/VG5TlUCI3D62KhfCaN
	Ve9WZ4jJAzqhaUN61Y3TSoQCHQUhEGoOg/7qw9wtJq7TbtiaPnqWOO8YePaKH6++Bcm9Wi
	A0TjVMadyj2O/1fH3VBjlo2T+eNjhio=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518--srEm5itPA2KcR7D9u8uuQ-1; Thu,
 17 Jul 2025 15:18:54 -0400
X-MC-Unique: -srEm5itPA2KcR7D9u8uuQ-1
X-Mimecast-MFC-AGG-ID: -srEm5itPA2KcR7D9u8uuQ_1752779932
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40699180028D;
	Thu, 17 Jul 2025 19:18:52 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A6E2196664F;
	Thu, 17 Jul 2025 19:18:49 +0000 (UTC)
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
Subject: [PATCH v12 13/15] rust: sync: lock/global: Add Backend parameter to GlobalGuard
Date: Thu, 17 Jul 2025 15:15:52 -0400
Message-ID: <20250717191719.2076270-14-lyude@redhat.com>
In-Reply-To: <20250717191719.2076270-1-lyude@redhat.com>
References: <20250717191719.2076270-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Due to the introduction of sync::lock::Backend::Context, it's now possible
for normal locks to return a Guard with a different Backend than their
respective lock (e.g. Backend::BackendInContext). We want to be able to
support global locks with contexts as well, so add a trait bound to
explicitly specify which Backend is in use for a GlobalGuard.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index f846ecf9168e7..f9a9c4bdc46b0 100644
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
+pub struct GlobalGuard<'a, G: GlobalLockBackend, B: Backend> {
+    inner: Guard<'a, G::Item, B>,
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::Deref for GlobalGuard<'a, G, B> {
     type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
@@ -106,7 +106,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G> {
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::DerefMut for GlobalGuard<'a, G, B> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -154,7 +154,7 @@ impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
+    pub fn as_ref<'a, B: Backend>(&'a self, _guard: &'a GlobalGuard<'_, G, B>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
+    pub fn as_mut<'a, B: Backend>(&'a self, _guard: &'a mut GlobalGuard<'_, G, B>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -216,7 +216,7 @@ pub fn get_mut(&mut self) -> &mut T {
 /// ```
 /// # mod ex {
 /// # use kernel::prelude::*;
-/// use kernel::sync::{GlobalGuard, GlobalLockedBy};
+/// use kernel::sync::{Backend, GlobalGuard, GlobalLockedBy};
 ///
 /// kernel::sync::global_lock! {
 ///     // SAFETY: Initialized in module initializer before first use.
@@ -232,7 +232,7 @@ pub fn get_mut(&mut self) -> &mut T {
 ///     /// Increment the counter in this instance.
 ///     ///
 ///     /// The caller must hold the `MY_MUTEX` mutex.
-///     fn increment(&self, guard: &mut GlobalGuard<'_, MY_MUTEX>) -> u32 {
+///     fn increment<B: Backend>(&self, guard: &mut GlobalGuard<'_, MY_MUTEX, B>) -> u32 {
 ///         let my_counter = self.my_counter.as_mut(guard);
 ///         *my_counter += 1;
 ///         *my_counter
-- 
2.50.0

