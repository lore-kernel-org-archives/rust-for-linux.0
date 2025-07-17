Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60245303DCC
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752779933; cv=none; b=myilgTB+riPvxXnCz9X4l5+8Yl24UZsl8oxHmQlCRCIttO6FQ3ld0SZrVinp+nfptneSR3h4ChBPj9ObBzef1JjPaMVLG59+D4JBARuo44P4kOt1EVgLd6W1oDKR2QfuMxH1t/fHw/F0DMoUSIOdsCTFsJhEv1kwHZ/z9EqEToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752779933; c=relaxed/simple;
	bh=k6blRQwPgcLTPvGI7uk5nCWHq8NdEiBT7MSlHFhcy2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+doINQM5RBRTSLnQk6+lncaLkn+/BC3knok5IaIq48IVNfQopo0LzgeKhWDVnHzEze53CYNaFYChH5t3iWGldE7dTZlwxQiA7f4yHRhrfpAuUgU3ys+/6efLEPirfHWmDNQfSenMMApK2YIl91O1cm30AaRhbh+lVmzrzwMzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRLS/yYy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRLS/yYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752779931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J28/u5O7spnR5vQymgfN23AJ8qRCBm6TIseeCJpFspo=;
	b=hRLS/yYyaxWn+uRV46jxsYka0mPIaVNVUyPfaj+n5LoCISWyAezkpQ1WXvNEVwalDBR1nZ
	9hLB5b9vr9keeuRS/KBxgHMkYTI5khVPgycBwzaHsl07xLIIpCVjtXv65WEPUhImyKVGwa
	aIFN4b7Ij5KYjhG/nBA8x3/WTVwMnmE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-0BGEzO6pOEewG4xF48JcUA-1; Thu,
 17 Jul 2025 15:18:45 -0400
X-MC-Unique: 0BGEzO6pOEewG4xF48JcUA-1
X-Mimecast-MFC-AGG-ID: 0BGEzO6pOEewG4xF48JcUA_1752779923
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18B2F1956095;
	Thu, 17 Jul 2025 19:18:43 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 588A030001B1;
	Thu, 17 Jul 2025 19:18:38 +0000 (UTC)
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
Subject: [PATCH v12 11/15] rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
Date: Thu, 17 Jul 2025 15:15:50 -0400
Message-ID: <20250717191719.2076270-12-lyude@redhat.com>
In-Reply-To: <20250717191719.2076270-1-lyude@redhat.com>
References: <20250717191719.2076270-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
index dfdd913d6c1f5..f846ecf9168e7 100644
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
2.50.0

