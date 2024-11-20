Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F91BDA80
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142108; cv=none; b=k4wH2d1Z/YUOvCLmO50wOcJV8f/tgImnK8qNFnNc8os9Hzh7eaoOovRSup2n3wAHJy+/MV1EmtuPfjgI+Cf9ZotAT5+PGx8dgK7V++bF0yMznZPRgk8lFolLCX9FR+TgcfckVK7A4Mh2DX37xo4dot5KhnBOlLkx++SoYb3a6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142108; c=relaxed/simple;
	bh=ZBGY0bpYhcq+yEmyUweUjKz74uchUlZYQcLYmgowHNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIXzUUaMq+bXTRanHoZHMKT5/QFjiPZvsTq9t/1xS2V8dQtaEQKYI9zwrfyMhWgrqDRrVMPEm4wskrxweLdcC2PtlrPQDhR66m1JAUI54l3Lm9DOjltiGnvquwHjWjsv5T+9E1ZmWw+bbh7jskt0qjMMHy6xrPCXNdGvFwa7Vss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iYKqVZYh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iYKqVZYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732142106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYXybaTZfjauX1323Z8rJ0SA32Ax5BTepGpZK1kQKUg=;
	b=iYKqVZYhN7QBtBJ82bkdRdw5PpbYM9Bn9CMXjGjgyBDRrCfUDfgEVEsNxys91v50WviKYi
	xCo5xzeVvdq92uZ+2CxF7AeyeQDq2WIAXbkrofmj++WWk9KybZwU+wPQaCByTK4MA8I3bX
	t8cE0Pd1XVvC7sGAjFc2I1xC3FXEsuw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-m7ik8OiRPPKcxwYR6rIfcA-1; Wed,
 20 Nov 2024 17:35:01 -0500
X-MC-Unique: m7ik8OiRPPKcxwYR6rIfcA-1
X-Mimecast-MFC-AGG-ID: m7ik8OiRPPKcxwYR6rIfcA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 149BE1955EE7;
	Wed, 20 Nov 2024 22:34:59 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3AA1F195E481;
	Wed, 20 Nov 2024 22:34:55 +0000 (UTC)
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
	Tamir Duberstein <tamird@gmail.com>,
	Filipe Xavier <felipe_life@live.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <walmeida@microsoft.com>
Subject: [PATCH 1/3] rust: sync: Add Lock::is_locked()
Date: Wed, 20 Nov 2024 17:30:41 -0500
Message-ID: <20241120223442.2491136-2-lyude@redhat.com>
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

Now that we've added a Lock::from_raw() function and exposed Guard::new(),
it would be good to actually add the ability to assert the current state
of a lock to ensure correctness for unsafe code using these functions.

To do so, let's add Lock::is_locked() which simply returns whether or not a
Lock is acquired. We'll use this in the next few commits to add some debug
assertions.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/helpers/spinlock.c           |  5 +++++
 rust/kernel/sync/lock.rs          | 18 ++++++++++++++++++
 rust/kernel/sync/lock/mutex.rs    |  5 +++++
 rust/kernel/sync/lock/spinlock.rs |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index b7b0945e8b3cb..90216a69e3ea1 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -26,3 +26,8 @@ int rust_helper_spin_trylock(spinlock_t *lock)
 {
 	return spin_trylock(lock);
 }
+
+bool rust_helper_spin_is_locked(spinlock_t *lock)
+{
+	return spin_is_locked(lock);
+}
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 139f17f2ec86b..542f846ac02b2 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -85,6 +85,13 @@ unsafe fn relock(ptr: *mut Self::State, guard_state: &mut Self::GuardState) {
         // SAFETY: The safety requirements ensure that the lock is initialised.
         *guard_state = unsafe { Self::lock(ptr) };
     }
+
+    /// Returns whether or not the lock is currently acquired.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is a valid initialised pointer to this lock type.
+    unsafe fn is_locked(ptr: *mut Self::State) -> bool;
 }
 
 /// A mutual exclusion primitive.
@@ -170,6 +177,17 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // that `init` was called.
         unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
     }
+
+    /// Return whether or not the lock is currently acquired.
+    ///
+    /// Keep in mind that this function is inherently racy: a lock could immediately be acquired or
+    /// released after this function returns. As such, the return value from this function should be
+    /// treated as a snapshot for debugging purposes.
+    pub fn is_locked(&self) -> bool {
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called.
+        unsafe { B::is_locked(self.state.get()) }
+    }
 }
 
 /// A lock guard.
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 0e946ebefce12..f21b1f14cbe1b 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -126,4 +126,9 @@ unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
             None
         }
     }
+
+    unsafe fn is_locked(ptr: *mut Self::State) -> bool {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        unsafe { bindings::mutex_is_locked(ptr) }
+    }
 }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 9f4d128bed983..cfccf5e900b80 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -125,4 +125,9 @@ unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
             None
         }
     }
+
+    unsafe fn is_locked(ptr: *mut Self::State) -> bool {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        unsafe { bindings::spin_is_locked(ptr) }
+    }
 }
-- 
2.47.0

