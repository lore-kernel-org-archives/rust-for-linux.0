Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3E2DA763
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700097; cv=none; b=jpnxV/oGWJdjSt8LkBZPvXBohhTFdGox3lg9JgOy/7atW5WSAS1O4njTCRWozTK5KRbn5PapNuLmL9qQktxNM6i39dWd5dodHyHSUQvHsbagq5FKd4OTfqrpzoOjpfOr08G4evJvgnAW/eIPxuYInEUebIUXDgD1VKDp4yXupjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700097; c=relaxed/simple;
	bh=LqwZb+QJ7/CFHVDFfMH2t4MCeCQkA0TCPsc1eNxhRfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDjgCBJK7UYTC7MicLj9dCrf4kgb8c+hNjDcSsXGOg4dVk4mCZidXoAExgjMXUVCi9B07k7YkgXebBorqbu4IstcW0m/kCjO3Ee1eAqw4QDkqgfHDjfxL9kCNxotWuLAtCnhKt5C60pGighrUT1i6puYgx8bw/P0/RlY6gIKRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExGhsA43; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExGhsA43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764700094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZJqTEAw/NPTICe/9g7Ikaq8Y0mDc1JyrMgmfNXdinc=;
	b=ExGhsA432jWgDKKnN3KSpGcdxXEetSm+J0QfYh/+DDrPK3LVwmMeX5/DaiIHayy0a9Zj39
	YZW5WSX728QCTbXYWYJAmyVrZpfspbB5cHp1fbAKpygXieLwQtHEsboWmdtDwNp0EQNl6P
	QyDMzaRXaKcWeQr2iov0eTlXNeMbZbc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-Zm0eROY6PCOf8ZIITXHHJQ-1; Tue,
 02 Dec 2025 13:28:11 -0500
X-MC-Unique: Zm0eROY6PCOf8ZIITXHHJQ-1
X-Mimecast-MFC-AGG-ID: Zm0eROY6PCOf8ZIITXHHJQ_1764700088
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7E021955E7A;
	Tue,  2 Dec 2025 18:28:08 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 02D9B19560A7;
	Tue,  2 Dec 2025 18:28:05 +0000 (UTC)
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
Subject: [PATCH v15 09/16] rust: sync: Introduce lock::Backend::Context
Date: Tue,  2 Dec 2025 13:24:17 -0500
Message-ID: <20251202182720.125884-10-lyude@redhat.com>
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

Now that we've introduced an `InterruptDisabled` token for marking
contexts in which IRQs are disabled, we can have a way to avoid
`SpinLockIrq` disabling interrupts if the interrupts have already been
disabled. Basically, a `SpinLockIrq` should work like a `SpinLock` if
interrupts are disabled. So a function:

	(&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLockBackend>

makes senses. Note that due to `Guard` and `InterruptDisabled` having the
same lifetime, interrupts cannot be enabled while the Guard exists.

Add a `lock_with()` interface for `Lock`, and an associate type of
`Backend` to describe the context.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
V10:
- Fix typos - Dirk

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs          | 12 +++++++++++-
 rust/kernel/sync/lock/mutex.rs    |  1 +
 rust/kernel/sync/lock/spinlock.rs |  4 +++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 5d7991e6d3736..7df62923608b7 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -44,6 +44,9 @@ pub unsafe trait Backend {
     /// [`unlock`]: Backend::unlock
     type GuardState;
 
+    /// The context which can be provided to acquire the lock with a different backend.
+    type Context<'a>;
+
     /// Initialises the lock.
     ///
     /// # Safety
@@ -163,8 +166,15 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 }
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
+    /// Acquires the lock with the given context and gives the caller access to the data protected
+    /// by it.
+    pub fn lock_with<'a>(&'a self, _context: B::Context<'a>) -> Guard<'a, T, B> {
+        todo!()
+    }
+
     /// Acquires the lock and gives the caller access to the data protected by it.
-    pub fn lock(&self) -> Guard<'_, T, B> {
+    #[inline]
+    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
         let state = unsafe { B::lock(self.state.get()) };
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 581cee7ab842a..be1e2e18cf42d 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -101,6 +101,7 @@ macro_rules! new_mutex {
 unsafe impl super::Backend for MutexBackend {
     type State = bindings::mutex;
     type GuardState = ();
+    type Context<'a> = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 3fdfb0a8a0ab1..70d19a2636afe 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,7 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
-use crate::prelude::*;
+use crate::{interrupt::LocalInterruptDisabled, prelude::*};
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -101,6 +101,7 @@ macro_rules! new_spinlock {
 unsafe impl super::Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
+    type Context<'a> = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
@@ -243,6 +244,7 @@ macro_rules! new_spinlock_irq {
 unsafe impl super::Backend for SpinLockIrqBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
+    type Context<'a> = &'a LocalInterruptDisabled;
 
     unsafe fn init(
         ptr: *mut Self::State,
-- 
2.52.0

