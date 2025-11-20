Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA236C0B0
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675277; cv=none; b=LgtyU4kLDPjBVzYqgEi4GusE+ComZYCjC7cgUKoDEHkKsk4Ua/vqK1rb3xyygJfIDAlZsz4+OkjO8RDJ0ThAIymlw7rmr2HpRvMn7fc0bQiSZhKh/4Ij04r8WQ8ysC66mjiql5DRFc/JdWb7f0Yax3TVl1N6xi+151zVXX2gvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675277; c=relaxed/simple;
	bh=eVCNHMwYWMV3QMcwKe3h+3xcYGJiZdqvJerGyULmcyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJ6EDInqho4HvX31b1TRf5Y1AKVFZQ4dJF6KmDeszwGa/11d6sw5oYmcSLb2eBM+YIxC9ONN2ovP/gYtOdYSblZ4MTnJtcLZn7PBUHsy/oJJL+PUV6Ni2uoYgEyKXbr68zb8XN+Q7iAWopDpTo2vmUfXcFCHcIX1CGWKEUIWvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bn0PBWAh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bn0PBWAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763675273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9tz44ozuYwhwGDZjpKYpu/QC+8vfUxJz5otCnyzLaQ=;
	b=bn0PBWAhWZj4k+tZ79RWms1H0qV0X+3aa7jl9u0X2GvC6TV8Ji+7277fhmmNzHuY03fn7Q
	6UaenwVo4tgFuWKmUGqT7N5XrttHPmyOXQ2XMpOGEc3iKriid7bTjuolwSjr4HpANWQXm8
	mrgk7nzkpE88oIjHgWQIr3MvveH3T5w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-299-uyyauJX6NA68g-e_RYi0sw-1; Thu,
 20 Nov 2025 16:47:49 -0500
X-MC-Unique: uyyauJX6NA68g-e_RYi0sw-1
X-Mimecast-MFC-AGG-ID: uyyauJX6NA68g-e_RYi0sw_1763675266
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69E371800107;
	Thu, 20 Nov 2025 21:47:46 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AE041940E88;
	Thu, 20 Nov 2025 21:47:43 +0000 (UTC)
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
Subject: [PATCH v14 09/16] rust: sync: Introduce lock::Backend::Context
Date: Thu, 20 Nov 2025 16:46:01 -0500
Message-ID: <20251120214616.14386-10-lyude@redhat.com>
In-Reply-To: <20251120214616.14386-1-lyude@redhat.com>
References: <20251120214616.14386-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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
2.51.1

