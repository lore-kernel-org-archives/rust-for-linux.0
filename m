Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E259237172
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 21:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391812; cv=none; b=VZ1q832G2EgfbUVsm1/HDJYEAZnkEr3TvP3qBrgNYKYtbUOslhfhmQt8uW6W682zfevyvmig13Gl4qvT9ZWJr4a+yKYca/Xxr+NdlJBztlf8PLnaMSDcicfbbGGaZdu8FmDtP/WKWDWWuVPCRRVKwufb+jdVpfb8Tt7g1073s7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391812; c=relaxed/simple;
	bh=tmQ7sXnK4M8nff+6s4Cfcmwg8OnUqaKS60lASLQsmUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MkUPk/OHImFFMSziK9qKS7LD0PWhER1XyVIsazSu3vkBli0tyGwbK253d9c+xgIYhfL/4fQ1LB14Vrl3oRx5/kcei5LEUZsZiqlhF4Xhf5Q37yTi88HPc8yCq0TBdjsBRALozJ3fouL07traic4u+DmAeGEef36zyYxx/21Fy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S03B7l67; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S03B7l67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753391809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SFSZSHt4zByYrLjimXTP8gr8XqydI2M7OnLWTmtzRSc=;
	b=S03B7l67/j9TWCYiijXE+EggkAI3Y/93NkwXhjJhsR3wdEpA1Bs/Uim6Cam0B81gTH9rzj
	0phaEgmYZw1F7QSvA9qicQP/1mRfYg5iv7WhYxTnQwBAzJxTDLx4w6hN//fI/h+vATDVXq
	8FbfFU47CGk6Vf12UK41nGiw/ePAX8A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-CzUhNK1yORq9B5cs7wEBMw-1; Thu,
 24 Jul 2025 17:16:44 -0400
X-MC-Unique: CzUhNK1yORq9B5cs7wEBMw-1
X-Mimecast-MFC-AGG-ID: CzUhNK1yORq9B5cs7wEBMw_1753391802
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4261180045C;
	Thu, 24 Jul 2025 21:16:41 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABED119560AA;
	Thu, 24 Jul 2025 21:16:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org
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
Subject: [PATCH v3] rust: lock: Export Guard::do_unlocked()
Date: Thu, 24 Jul 2025 17:15:56 -0400
Message-ID: <20250724211634.586808-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In RVKMS, I discovered a silly issue where as a result of our HrTimer for
vblank emulation and our vblank enable/disable callbacks sharing a
spinlock, it was possible to deadlock while trying to disable the vblank
timer.

The solution for this ended up being simple: keep track of when the HrTimer
could potentially acquire the shared spinlock, and simply drop the spinlock
temporarily from our vblank enable/disable callbacks when stopping the
timer. And do_unlocked() ended up being perfect for this.

Since this seems like it's useful, let's export this for use by the rest of
the world and write short documentation for it.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Fix documentation for do_unlocked
* Add an example
V3:
* Documentation changes from Miguel

 rust/kernel/sync/lock.rs | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index e82fa5be289c1..800cdd16dce6e 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -228,7 +228,40 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
         self.lock
     }
 
-    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
+    /// Releases this [`Guard`]'s lock temporarily, executes `cb` and then re-acquires it.
+    ///
+    /// This can be useful for situations where you may need to do a temporary unlock dance to avoid
+    /// issues like circular locking dependencies.
+    ///
+    /// It returns the value returned by the closure.
+    ///
+    /// # Examples
+    ///
+    /// The following example shows how to use [`Guard::do_unlocked`] to temporarily release a lock,
+    /// do some work, then re-lock it.
+    ///
+    /// ```
+    /// # use kernel::{new_spinlock, sync::lock::{Backend, Guard, Lock}};
+    /// # use pin_init::stack_pin_init;
+    /// fn assert_held<T, B: Backend>(guard: &Guard<'_, T, B>, lock: &Lock<T, B>) {
+    ///     // Address-equal means the same lock.
+    ///     assert!(core::ptr::eq(guard.lock_ref(), lock));
+    /// }
+    ///
+    /// stack_pin_init! {
+    ///     let l = new_spinlock!(42)
+    /// }
+    ///
+    /// let mut g = l.lock();
+    /// let val = *g;
+    ///
+    /// // The lock will be released, but only temporarily
+    /// g.do_unlocked(|| assert_eq!(val, 42));
+    ///
+    /// // `g` originates from `l` and should be relocked now.
+    /// assert_held(&g, &l);
+    /// ```
+    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 

base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
-- 
2.50.0

