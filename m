Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B42045A2
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584919; cv=none; b=cUJhnEX/8gcs0t2GsTWkYXOebeuhg3DJA/gchk/ikmJFV/CPcJcNnjGjSV/4bt8PkmF8tv5wPKr7ziD+f2fIfWu0fxYI/tOV1F86LUdJRnvvWRLVJEJHb9oYaerw2N3mGRhlYNQBNUgzbblhQuzbkGQfFyftM5NE7uzjsfj2vzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584919; c=relaxed/simple;
	bh=SmRa0acQEuEADan3GdJe/hIPrJuPHtTw8z6DhPDiFqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I5jCVLGGWnMP4ffZqMuSOS63mntZT8U7dL69of3T0ouL7UwyfPnLsB3D9OGdDHgWssm4IaSfJUc9AFgVVUjDfrkmUR8+LxIzb+yXd64LTj4W+Uso9viHDCVqrmft0w93jiGqx1ejIWLAK9ojeyUMDvb/Bt+CwkQHT1uECgoqYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4rm/DI27; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4rm/DI27"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso22662055e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584914; x=1739189714; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQaS28cG6yW+ftNKFxNZP6eegjrIvFbvaYv5chLHbzg=;
        b=4rm/DI27PnFJm5fMOOm/QaN8a0nmHnJzL9jVawkWxCGHGOIKbQASGcr6CiI1lJLrH9
         YrfGBCGf3LrxWw3kcxnZFfbJCko2h0ZVPvXsesjxrYWkhxSDcrlalL+xaKV6aeljtjzs
         TbuyX6VST6C9735YrH/DD+0e1d2RWR04941wRsRHbqmxO3x+bv/BfqPdnXC7gWphGxpD
         /DUEiR6XnnX7DiHFn/ZHNdgFQtNOcllzl0rvXbF9c2prKK5+agsPKFdGphAAySlhPPEe
         kRyabgkZzujRdTVSxmwr6h39yTxXVYqsc4vO+FWDbBfmOfRXNLS2+a3lFuqNmdG9sHMS
         lXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584914; x=1739189714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQaS28cG6yW+ftNKFxNZP6eegjrIvFbvaYv5chLHbzg=;
        b=tK396Dhp2bKvdjIDe26FF2JyYTichjovzJaIYhTdl9LDA8mLLRQVflZqX/oo//4rUW
         UORrKZu801j1aRBVWY+lR0CWQAWetSxjK9/eTESzGXWiGi8YSLQ7OqXu3EdvvVstTL7r
         zCJHsWclUQGsU/q818URtwuCOrGPfQkup2xUL/adwCNrpACArL2PaUGZCQmCeJg5gCel
         2hjjelRdNg7Wlz5pJSnEowGWxC6awce2XvyN/ioyTr7GnhV6p3IyYYFYfMcOE+3ndaGI
         xci5XXL4Y8XpI1VRfN3/T5BrUV1SfnPw9A9eDuvQCb6tnNp6R0DSPz2Kfm1Cetv5WSIu
         ipKA==
X-Forwarded-Encrypted: i=1; AJvYcCV0KrS7Pp+Af/mzjQFnn2/0A2ekMk/wG0lr9Z1o5lx9iAMVZBWvMoHMX3OYhi8m9V/YNFs6/qfl+qzu1qhpgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz2voeZLCRhv1ibBUJmS0jzEReeRioJnaw0zYYjVo9WDyYJD7
	OPBFlq4cH/nPTbVbo8dHlZO47556WZ8uKuGREPhH4K0o96OpNmxCjsejuUchiJao8riKBquKUsH
	SVd/QX3eadvFYVA==
X-Google-Smtp-Source: AGHT+IGxJxBbT2D0jUH7PkoghvafmPAMvx3j15vJoonAlLH+FDpuc6DZ1HXcdNaeLgjK2m0GeHgRrPy+nOzkvHI=
X-Received: from wmbbh25.prod.google.com ([2002:a05:600c:3d19:b0:436:e723:5be6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a089:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-438dc3bac30mr240516145e9.11.1738584914324;
 Mon, 03 Feb 2025 04:15:14 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:36 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=SmRa0acQEuEADan3GdJe/hIPrJuPHtTw8z6DhPDiFqM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNJtc+O9U//+xzFxHIwPIhQUQRbRxX/4wZxI
 dLTxDCumKyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzSQAKCRAEWL7uWMY5
 RocAEACJm1PYPEHpHiykEjJyFzPL4gv8/tCMYFkHQSopUImzpSVQlc7CE2mwY9GKpP8he2AbVHb
 wdGSI6KeAhnFzA4nPPBUG8c/VBuONn5+aS3fJY9TT4m6QgzccvQm+UuOx/rfiVdbSxPhJJ8u5Aq
 9Dd/rpp9maEV2yx59n6I5tuf3jpvdLGkSQDTRghtBwhX00tMzU7PoCdlvYG39FpDjmfrAOU3JJe
 /Lxy+FoJvw+779h9exMd3sITMAp4X+ze3c7a9arfaro9GMqoFM5gxfx+lbKlKg+6lyzsFReMkCB
 gJwPMD0saRr4ndazh3/Yq3GbRceVIJkzpLhTYSoBbjmpMcpGLm3plmStKN09A0lJfosOxaMu26a
 HdyMEmRAcSXmfsZZnJf2DEv17YijbG4injaPUlqua6VYJydhNMeU50NbziZKK9po9oSBp84z9MR
 wgkjzCRsHrQX7A0OQh9Y50A5oQi4ICfAIqIEEPYfjO8esKtcH03cYVMwFEI8nzMKlsO/8yG2WkL
 MzBsyTuZfSPrQOc2eOz7OF6A2/0cvJwNFqXOrj2Zu34d8AKTGsPkAjg600u61nOEo6Co8SZQyop
 Wh8ybfPGSzR1QN6bFbnJlbnaot1NvB/ZPxTTiJYV0sX9Bzx3nb9KFyHgE5A4ocDkTta9pyy02ET 87mcDAXq6UUwpsw==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-1-2b998268a396@google.com>
Subject: [PATCH v13 1/8] mm: rust: add abstraction for struct mm_struct
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
	Alice Ryhl <aliceryhl@google.com>, Balbir Singh <balbirs@nvidia.com>
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

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/mm.c      |  39 +++++++++
 rust/kernel/lib.rs     |   1 +
 rust/kernel/mm.rs      | 209 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 250 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..97cfc2d29f5e 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -18,6 +18,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "mm.c"
 #include "mutex.c"
 #include "page.c"
 #include "platform.c"
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
index 496ed32b0911..9cf35fbff356 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -57,6 +57,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
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
2.48.1.362.g079036d154-goog

