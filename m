Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C71C1F0B
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142117; cv=none; b=iqVT/+PWy1msPWgYrf2NTgdL4hmZ7e1JKe6E+FizdfffYPEvz9o/t6g8BGGD4IsXr5+VqRTcgeymOenzC1+Da/sTGfu9I4idycJoFZw/SP0Akn5dEtCmcmujP4D2MU/Vp5ayeYo7iCu4o1v5diOdhvhyuWXTNT73azeVcS3UeIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142117; c=relaxed/simple;
	bh=2oOh1nTY41cvATmIAlO+1LRQLtQSWc2a2JycbyTdgZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMnw4AI7Yh2aUuvHDeI1GsS6rpKeQbmcxJypdPkxZBvd+pgm8DXuIyc/kD0Bn23lsIXK6TVJ/dscpBwKUJQoWfUuMKZjBcAOKxjco3iC0q6Bnob1mk9nmsOPxvmaYigDyGSKwrXetX8Ej3Iw7f9LyEBu3yXlerrIjFxsUOeHGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gkJ6U1bd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gkJ6U1bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732142115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xy6wj28XSU6G9iFcG9lOwNtV5S2Gmt1xXPacba/a7Ek=;
	b=gkJ6U1bdiVEd4sGBlR4EkuhunltXp3i+TV6nWe+sdi4rUDEAPXCB4VUs63EkKakiwjZumr
	fxndBKmVp3GKPZAQSSHn0sMPBDXWEQAq8KWv2Gp7v6nL9SLLrRXtziRKCbrCJ1rKsOQrbo
	936gk9GZST/UtbS4k3/45Yh1jjKEJzs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-f5nkY8HrPt2H34TZ8dItYA-1; Wed,
 20 Nov 2024 17:35:14 -0500
X-MC-Unique: f5nkY8HrPt2H34TZ8dItYA-1
X-Mimecast-MFC-AGG-ID: f5nkY8HrPt2H34TZ8dItYA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 283E419560B0;
	Wed, 20 Nov 2024 22:35:12 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B86C719560A3;
	Wed, 20 Nov 2024 22:35:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH 3/3] rust: sync: Add Guard::new_unchecked()
Date: Wed, 20 Nov 2024 17:30:43 -0500
Message-ID: <20241120223442.2491136-4-lyude@redhat.com>
In-Reply-To: <20241120223442.2491136-1-lyude@redhat.com>
References: <20241120223442.2491136-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Asserting is_locked() for unsafe Guard::new() calls is quite useful for
verifying safety for callers outside the lock module. But in the lock
module, it's a bit unnecessary and a potential performance hit for safe
rust code. Mainly because it implies all safe lock acquisitions in rust
will have to run this debug assertion.

So, let's split out Guard::new() by adding a Guard::new_unchecked()
function that skips this debug assertion. Of course, we leave this function
as private and note that it is only ever intended for use in this specific
module.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 0a7f2ed767423..2fd4b665ffc9a 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -166,7 +166,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
         // that `init` was called.
         let state = unsafe { B::lock(self.state.get()) };
         // SAFETY: The lock was just acquired.
-        unsafe { Guard::new(self, state) }
+        unsafe { Guard::new_unchecked(self, state) }
     }
 
     /// Tries to acquire the lock.
@@ -175,7 +175,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-        unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
+        unsafe { B::try_lock(self.state.get()).map(|state| Guard::new_unchecked(self, state)) }
     }
 
     /// Return whether or not the lock is currently acquired.
@@ -255,6 +255,19 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     pub unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
         debug_assert!(lock.is_locked());
 
+        // SAFETY: Our safety requirements fulfill the requirements of this function.
+        unsafe { Self::new_unchecked(lock, state) }
+    }
+
+    /// Constructs a new immutable lock guard without assertions.
+    ///
+    /// Unlike [`Guard::new`], this function does not run a debug assertion to ensure the lock has
+    /// been acquired. It should only be used in this module.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that it owns the lock.
+    unsafe fn new_unchecked(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
         Self {
             lock,
             state,
-- 
2.47.0

