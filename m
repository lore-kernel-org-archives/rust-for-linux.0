Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E7F241A0F
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948170; cv=none; b=qNQWLi0VEAPbs/odvu+JP6jZnoQHHXMdXfTuj2224r58ICvXvtuAlA/o5x3GkoitUHcI7y19+9zwNcx2CiUBe8ULy1itTmho6ht8BzmiKmJf36o5GdWGAgIKWErIu4CKNZqv/hjrJ6zw22Vx47PrtuRUkYZzo4Vh1mY4ht6xoDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948170; c=relaxed/simple;
	bh=JTL2MUjztUWi2Edxe76W3MQbrbIY2frYdACvccKeGlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E/DgEZy4GKAl+65fhR38wX66dVix6NdTQIidLfXL3dDhIfYnqzZp+FqN7t2+UdxLw5uN1BkUrgYqASiVyXFFarReNY88wxoM7p6xHnAeAqZKNgMD2mZaaJYiBKw1foKEDvw1EwmvuOPVQC8ZHVAq8x1nglUSzSTS8v4+N5e2HiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jv3OGILa; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jv3OGILa"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436289a570eso28585265e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948166; x=1737552966; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQZ8lzcN1AuRMo71v8cGYFa8tBipKd/jkKd39EV9lsM=;
        b=jv3OGILaeRP6DA5bIh0laEFOT1hKJdDeQxt+jiRcVZyBEgdvQjBk0/R9aZOzmrLdv7
         43p+NHnXjC3zBU3EuDB5caVmlZfhVmWX5pvWBlG3O98JCcT84ONAprXJqm8p/XMSnAUy
         2+qDvFBxnjNakaTi2JJ/nQfBvZBQlnIaSV9OKrY4rmXTmDSuGQF7J19RFbZb367j+qZ/
         yfL3qeoDt10WNSJZcS9Qlp21voDSiQKAQKyHT1c36/nYYMk4BX05Oa8++uOfqHPpn4y3
         W7+N5gueSj8J5Z0LT/BnGvvURfcPgQZUekHI0YTbpEMhK6Sv3HaGih39enEUXMxH0q19
         RA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948166; x=1737552966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQZ8lzcN1AuRMo71v8cGYFa8tBipKd/jkKd39EV9lsM=;
        b=wMyjpmemWbBdcfGtUZNLAURPn88Q8w2wewQc3lDaKHVL/Wg6nr04DeGEuSXkNULK4M
         VPcmdSFUm2/FuB6BNyv5Gmo8VZke0N3RVWroZnFV6ft0gt/ya1/oAtKqXfY8p0j9YOF+
         fqc0UDaohkG9RsB65w3TDjzK9J5wXBMO1z/FBcK6lzNWRznsgRMrAkC/h/GBWomYxSf1
         MWnRjY4Wm1yJlvsGc5uZ8sLP/kvjm35EJu9yaOJ6aa73JFHstp+EL+P70dYgHob+Ah7x
         xP9nhHkJuQTHQiFMvu84I366neR6y6Ak4pi87BZmTn1o7F114plITkHwzKaL8UXFYQ9w
         RubQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoo+pfkNbCG8lkQEAIGaJdaYmFxysmydpiwSggKF99dHwHAFx4u4aVUjBXSB5InD1QzPU4LGZdBrPvE/u1JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjBjX7X8afzuiYenAL3bqGUGCPIKP+UeStQxwiSrSDqVFuMf1
	BBzGgz0q0xKPYlZE/KSBet3I9V+Wb1zcLl9lpqnfIIcnBErQX4VJpA2QdJmHBOwkijmCz87qV0Q
	9MrZwN4OgaZ/fIA==
X-Google-Smtp-Source: AGHT+IHXOHLVyrqG26bwXmWj7k8i+YHFx0v6XbhRNOb82HiwvIAwHIR5ct4HbEiTS1Vq5WpHBB+epRkGt5G9PeY=
X-Received: from wmbfj4.prod.google.com ([2002:a05:600c:c84:b0:431:1903:8a3e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a09:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-436e26aa593mr296902835e9.17.1736948166660;
 Wed, 15 Jan 2025 05:36:06 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:04 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10172; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JTL2MUjztUWi2Edxe76W3MQbrbIY2frYdACvccKeGlM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7m9buKTHoMGL2rWWFPKx8ZKzp9gRDt5AGFFP
 Y9srGjZLTmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5vQAKCRAEWL7uWMY5
 RrciD/9qxvpMIi1Wfr9OCenml8/BizGBow4wxZKmGcU7Jf5ARM1DQFn7IAVl2OWQg5k+XXqWISD
 abUyA9sgSCR3fNBfQUlzc9oPDc8VFloaJX1eDitNJ9UuTGDQOdhqFnbHGSUBCHB7/KKwAKEFhPh
 Se8GxsL9Uy7GhqQr0DAXt0+LNvrthD8VFVPhUb81uxJ1NLWOwlKYLvmtfwDcvT7/18jAOYJ3o+3
 LLBczHW/HHX51sFejN8tdnD8Uau2symCRFRznOxHVlepzvqs1L7DFqPa7Unq3T2n3WwbbihmiYW
 uF3bJ/iOXRuVYj3XuypBdZANoSg/vxZWaVkesGh1FepGgsVbNLMeANGCWWRBe5UmbzdvyXJXIFw
 r1eOgK26fKBljBTYe8OVeUBy2cJsr4dloKg1X8C9Gk2rgbOgQUqjDPqPVJ3CpqC1JmKDNfFs0jD
 N39u+9WgudH88D6MTFZ2ma9Ao3H3iS68gVHpLOIySe/rdlfB8fx/UKb0rMY0OzQA21lUL0PovdC
 TmyxJ9PQuXkTNQA0lOsDivCPLK9tSigtvjhqidQheZvMfeHeHagyWNoCUN4MieUKecVaLleVUsa
 YTtPtZwCxxq1ZzXJb7peMH4jnSX8yZe/lsBrQND4q5zTf62A+4jXJWVPaG19B4zwHCzbGpXPm0X LkC4SaR2OVHrQQQ==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-1-375099ae017a@google.com>
Subject: [PATCH v12 1/8] mm: rust: add abstraction for struct mm_struct
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

These abstractions allow you to reference a `struct mm_struct` using
both mmgrab and mmget refcounts. This is done using two Rust types:

* Mm - represents an mm_struct where you don't know anything about the
  value of mm_users.
* MmWithUser - represents an mm_struct where you know at compile time
  that mm_users is non-zero.

This allows us to encode in the type system whether a method requires
that mm_users is non-zero or not. For instance, you can always call
`mmget_not_zero` but you can only call `mmap_read_lock` when mm_users is
non-zero.

The struct is called Mm to keep consistency with the C side.

The ability to obtain `current->mm` is added later in this series.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/mm.c      |  39 +++++++++
 rust/kernel/lib.rs     |   1 +
 rust/kernel/mm.rs      | 209 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 250 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index dcf827a61b52..9d748ec845b3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -16,6 +16,7 @@
 #include "fs.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "mm.c"
 #include "mutex.c"
 #include "page.c"
 #include "pid_namespace.c"
diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
new file mode 100644
index 000000000000..7201747a5d31
--- /dev/null
+++ b/rust/helpers/mm.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm.h>
+#include <linux/sched/mm.h>
+
+void rust_helper_mmgrab(struct mm_struct *mm)
+{
+	mmgrab(mm);
+}
+
+void rust_helper_mmdrop(struct mm_struct *mm)
+{
+	mmdrop(mm);
+}
+
+void rust_helper_mmget(struct mm_struct *mm)
+{
+	mmget(mm);
+}
+
+bool rust_helper_mmget_not_zero(struct mm_struct *mm)
+{
+	return mmget_not_zero(mm);
+}
+
+void rust_helper_mmap_read_lock(struct mm_struct *mm)
+{
+	mmap_read_lock(mm);
+}
+
+bool rust_helper_mmap_read_trylock(struct mm_struct *mm)
+{
+	return mmap_read_trylock(mm);
+}
+
+void rust_helper_mmap_read_unlock(struct mm_struct *mm)
+{
+	mmap_read_unlock(mm);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..6555e0847192 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod page;
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
new file mode 100644
index 000000000000..2fb5f440af60
--- /dev/null
+++ b/rust/kernel/mm.rs
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Memory management.
+//!
+//! This module deals with managing the address space of userspace processes. Each process has an
+//! instance of [`Mm`], which keeps track of multiple VMAs (virtual memory areas). Each VMA
+//! corresponds to a region of memory that the userspace process can access, and the VMA lets you
+//! control what happens when userspace reads or writes to that region of memory.
+//!
+//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
+
+use crate::{
+    bindings,
+    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
+};
+use core::{ops::Deref, ptr::NonNull};
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This represents the address space of a userspace process, so each process has one `Mm`
+/// instance. It may hold many VMAs internally.
+///
+/// There is a counter called `mm_users` that counts the users of the address space; this includes
+/// the userspace process itself, but can also include kernel threads accessing the address space.
+/// Once `mm_users` reaches zero, this indicates that the address space can be destroyed. To access
+/// the address space, you must prevent `mm_users` from reaching zero while you are accessing it.
+/// The [`MmWithUser`] type represents an address space where this is guaranteed, and you can
+/// create one using [`mmget_not_zero`].
+///
+/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its destructor may sleep.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmgrab`.
+///
+/// [`mmget_not_zero`]: Mm::mmget_not_zero
+#[repr(transparent)]
+pub struct Mm {
+    mm: Opaque<bindings::mm_struct>,
+}
+
+// SAFETY: It is safe to call `mmdrop` on another thread than where `mmgrab` was called.
+unsafe impl Send for Mm {}
+// SAFETY: All methods on `Mm` can be called in parallel from several threads.
+unsafe impl Sync for Mm {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for Mm {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmgrab(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmdrop(obj.cast().as_ptr()) };
+    }
+}
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is like [`Mm`], but with non-zero `mm_users`. It can only be used when `mm_users` can
+/// be proven to be non-zero at compile-time, usually because the relevant code holds an `mmget`
+/// refcount. It can be used to access the associated address space.
+///
+/// The `ARef<MmWithUser>` smart pointer holds an `mmget` refcount. Its destructor may sleep.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUser {
+    mm: Mm,
+}
+
+// SAFETY: It is safe to call `mmput` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUser {}
+// SAFETY: All methods on `MmWithUser` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUser {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUser {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `Mm` methods available on `MmWithUser`.
+impl Deref for MmWithUser {
+    type Target = Mm;
+
+    #[inline]
+    fn deref(&self) -> &Mm {
+        &self.mm
+    }
+}
+
+// These methods are safe to call even if `mm_users` is zero.
+impl Mm {
+    /// Returns a raw pointer to the inner `mm_struct`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::mm_struct {
+        self.mm.get()
+    }
+
+    /// Obtain a reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points at an `mm_struct`, and that it is not deallocated
+    /// during the lifetime 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a Mm {
+        // SAFETY: Caller promises that the pointer is valid for 'a. Layouts are compatible due to
+        // repr(transparent).
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Calls `mmget_not_zero` and returns a handle if it succeeds.
+    #[inline]
+    pub fn mmget_not_zero(&self) -> Option<ARef<MmWithUser>> {
+        // SAFETY: The pointer is valid since self is a reference.
+        let success = unsafe { bindings::mmget_not_zero(self.as_raw()) };
+
+        if success {
+            // SAFETY: We just created an `mmget` refcount.
+            Some(unsafe { ARef::from_raw(NonNull::new_unchecked(self.as_raw().cast())) })
+        } else {
+            None
+        }
+    }
+}
+
+// These methods require `mm_users` to be non-zero.
+impl MmWithUser {
+    /// Obtain a reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points at an `mm_struct`, and that `mm_users` remains
+    /// non-zero for the duration of the lifetime 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
+        // SAFETY: Caller promises that the pointer is valid for 'a. The layout is compatible due
+        // to repr(transparent).
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Lock the mmap read lock.
+    #[inline]
+    pub fn mmap_read_lock(&self) -> MmapReadGuard<'_> {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmap_read_lock(self.as_raw()) };
+
+        // INVARIANT: We just acquired the read lock.
+        MmapReadGuard {
+            mm: self,
+            _nts: NotThreadSafe,
+        }
+    }
+
+    /// Try to lock the mmap read lock.
+    #[inline]
+    pub fn mmap_read_trylock(&self) -> Option<MmapReadGuard<'_>> {
+        // SAFETY: The pointer is valid since self is a reference.
+        let success = unsafe { bindings::mmap_read_trylock(self.as_raw()) };
+
+        if success {
+            // INVARIANT: We just acquired the read lock.
+            Some(MmapReadGuard {
+                mm: self,
+                _nts: NotThreadSafe,
+            })
+        } else {
+            None
+        }
+    }
+}
+
+/// A guard for the mmap read lock.
+///
+/// # Invariants
+///
+/// This `MmapReadGuard` guard owns the mmap read lock.
+pub struct MmapReadGuard<'a> {
+    mm: &'a MmWithUser,
+    // `mmap_read_lock` and `mmap_read_unlock` must be called on the same thread
+    _nts: NotThreadSafe,
+}
+
+impl Drop for MmapReadGuard<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: We hold the read lock by the type invariants.
+        unsafe { bindings::mmap_read_unlock(self.mm.as_raw()) };
+    }
+}

-- 
2.48.0.rc2.279.g1de40edade-goog

