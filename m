Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677E6BFA5
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388999; cv=none; b=ROkFfm0cNmbZJ7yJz7Z5o6fuGosk9dDHa3xUhFBVYjeDv426hW8hPtNv+LYQ5LzauIy6ObQdu3WVLmJyxWxRXn3JPnFEEIblZaxPDZn37JV9uG1EXW+T7RYNV6M1M2yD5FY12251aGvV0ce2yqkjueRkgwweTEr8C1vZ3Hju/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388999; c=relaxed/simple;
	bh=7XXzcOHCfArutmV2jSulu5L7vI3q9gGArxrBjK3ezS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeLRLgZwHQZxP5R1sXEP/Q1t6VMDRFJ7NGrb9oh3oXawhUeR6IbEco1WDhmMEnf3gL9i4nboweXU6uN/dNGc3ciEmKpLnn/sX8UZ7WO3U96xfQPwnwrmqjXK68QYGHVX0OTm6NPyOEqqM8nF+bM6QhU5tMGxEnRz20A7EsXPQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9dyOa3K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9dyOa3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkx2LD4BLyLJHY1WcYRTjzgqupESD892FjxeFLeB60M=;
	b=d9dyOa3K5+Spe4fYpYU7onT+zTfMMOLJcXyq1J8Xl5jZ5M4UIiLIchktkKftjNCf/trqMH
	YGYp0qDjK/i9B7mlH2fShxNIUlwBZdf8NM2+Nsv77e3HVQMXJQkjLll3hm//QBtde7IEVs
	zsJ9ucE2jEMP0GqYUI6+V5TD+CcVBM8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-Q5dzvp7JNvOQUcPqNWJTxw-1; Mon, 25 Mar 2024 13:49:54 -0400
X-MC-Unique: Q5dzvp7JNvOQUcPqNWJTxw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4148c816d62so1482065e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388993; x=1711993793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkx2LD4BLyLJHY1WcYRTjzgqupESD892FjxeFLeB60M=;
        b=LUzkURKalI++yySzZ0IdLXR8n5id1TTIOaODGYth7B4gcdcPHISBOrOTyfvxwmhGAM
         HZ/YiXqgZECQIIWDEG5Nco4g+fvVH1IID80Cf3cwcSVg+41AznPj6WD+Du0JO+EzFijC
         Gz5qlCgjHewrpV2Mz68OHQwZ4eyM7dMDVQqMeb6XmeoCiDVsrM6isXMJmQvHxwMCLsko
         fwoLxsiCYxaj4IQpqDsHAc2UEwCZJFDRS3CoMjF5NzkBCG97vxGejWrpYa50+VBuP5Q6
         a5gpFKtykvjD0WQdGDVnG3mxqODoY9GVGfTmClh1qgDT+bBaRLNsCe7O1ybEf/486Olk
         UNgg==
X-Gm-Message-State: AOJu0YyBp27nnAyCUe/m00ZLwJeMxNgpFGsAyrwNnCzLdDKt30ABsza/
	o7MccqsB1iAxSTj6VGtJNZBTpe/w2Palv/4wHN1lgfnCZO3qsP0JcrGbxzT6keYGGOGu9kU+8CD
	wtOUqARzJZ5LTLtXmcXcmN5kn0q3XUmBPK1tey6b/olAIKRrkooFdrx6xpLC/FD3s
X-Received: by 2002:a05:600c:4691:b0:412:dcab:7c79 with SMTP id p17-20020a05600c469100b00412dcab7c79mr5473972wmo.10.1711388993694;
        Mon, 25 Mar 2024 10:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFft8FXFPxQmPVpU93iaPcyARn0RiLN/FIXqTrfxx7oGQ7V7hUrH2uUzXP1tQDZXJQ5VIrJ8A==
X-Received: by 2002:a05:600c:4691:b0:412:dcab:7c79 with SMTP id p17-20020a05600c469100b00412dcab7c79mr5473954wmo.10.1711388993430;
        Mon, 25 Mar 2024 10:49:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d6891000000b0033d202abf01sm10069637wru.28.2024.03.25.10.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:53 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 6/8] rust: add revocable mutex
Date: Mon, 25 Mar 2024 18:49:10 +0100
Message-ID: <20240325174924.95899-7-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Wedson Almeida Filho <wedsonaf@gmail.com>

This is a mutex where access to its contents can be revoked at runtime.

This is different from `Revocable` in a few ways:
  1. The caller may sleep while holding a guard.
  2. Accessors are all serialised.
  3. Accessing is not as cheap (because it involves acquiring the mutex).
  4. The size of the object is larger (because it involves a mutex +
     flag).

An example of where this a good fit to be used in device state that
holds registrations to other subsystems.

Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/sync.rs           |  2 +
 rust/kernel/sync/revocable.rs | 98 +++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 rust/kernel/sync/revocable.rs

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 874a45b0c168..377446e37961 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -12,11 +12,13 @@
 pub mod lock;
 mod locked_by;
 pub mod rcu;
+mod revocable;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::CondVar;
 pub use lock::{mutex::Mutex, spinlock::SpinLock};
 pub use locked_by::LockedBy;
+pub use revocable::RevocableMutex;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/revocable.rs b/rust/kernel/sync/revocable.rs
new file mode 100644
index 000000000000..cb987c293669
--- /dev/null
+++ b/rust/kernel/sync/revocable.rs
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synchronisation primitives where access to their contents can be revoked at runtime.
+
+use macros::pin_data;
+
+use crate::{
+    init::PinInit,
+    pin_init,
+    str::CStr,
+    sync::{lock, lock::Lock, LockClassKey},
+};
+use core::mem::MaybeUninit;
+
+use super::lock::Guard;
+
+/// The state within the revocable synchronisation primitive.
+///
+/// We don't use simply `Option<T>` because we need to drop in-place because the contents are
+/// implicitly pinned.
+///
+/// # Invariants
+///
+/// The `is_available` field determines if `data` is initialised.
+struct Inner<T> {
+    is_available: bool,
+    data: MaybeUninit<T>,
+}
+
+impl<T> Inner<T> {
+    fn new(data: T) -> Self {
+        // INVARIANT: `data` is initialised and `is_available` is `true`, so the state matches.
+        Self {
+            is_available: true,
+            data: MaybeUninit::new(data),
+        }
+    }
+
+    fn drop_in_place(&mut self) {
+        if !self.is_available {
+            // Already dropped.
+            return;
+        }
+
+        // INVARIANT: `data` is being dropped and `is_available` is set to `false`, so the state
+        // matches.
+        self.is_available = false;
+
+        // SAFETY: By the type invariants, `data` is valid because `is_available` was true.
+        unsafe { self.data.assume_init_drop() };
+    }
+}
+
+impl<T> Drop for Inner<T> {
+    fn drop(&mut self) {
+        self.drop_in_place();
+    }
+}
+
+#[pin_data]
+pub struct Revocable<T, B: lock::Backend> {
+    #[pin]
+    inner: Lock<Inner<T>, B>,
+}
+
+/// Safely initialises a [`Revocable`] instance with the given name, generating a new lock class.
+// #[macro_export]
+// macro_rules! revocable_init {
+//     ($mutex:expr, $name:literal) => {
+//         $crate::init_with_lockdep!($mutex, $name)
+//     };
+// }
+
+impl<T, B> Revocable<T, B>
+where
+    B: lock::Backend,
+{
+    /// Creates a new revocable instance of the given lock.
+    pub fn new(data: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self> {
+        pin_init!(Self {
+            inner <- Lock::new(Inner::new(data), name, key) ,
+        })
+    }
+
+    /// Revokes access to and drops the wrapped object.
+    ///
+    /// Revocation and dropping happen after ongoing accessors complete.
+    pub fn revoke(&self) {
+        self.lock().drop_in_place();
+    }
+
+    fn lock(&self) -> Guard<'_, Inner<T>, B> {
+        self.inner.lock()
+    }
+}
+
+/// Type alias for a `Revocable` with a `MutexBackend`.
+pub type RevocableMutex<T> = Revocable<T, super::lock::mutex::MutexBackend>;
-- 
2.44.0

