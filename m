Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B61B533F
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114581; cv=none; b=N/ASzjCoqwjluN7LQqPkkYbaEvNXoRKLtNkCl2R6/hWYTsA9YM923AT2eFTlVeVslCGBJlQmZs1qdknxKWoJ8CA2/xO2AX0fACrYaMEh59rk697Gdoyt19Ist+FIaIigGfL9ZsmnqkENarGEO0mVmDq8r27F+h4QT8RqyWei6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114581; c=relaxed/simple;
	bh=thHW2hYjZXfFchwxaSHY31jS6Gxjf/8txx6XeVPPA40=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lOl+n0coGCWl08bYBc3YBAjPjgfPg/8pkOhEwTm7q4RoQGpBZhMB5oXjV7J1pK0AT1oaLytpYwJZc8GkUvA1Qp64ODXvFDja1cMyre1oKPgTja75TKfRETUgWFXKIB9WtFXJQDSZ0/C00/2imn48yhd+M5q/mUkKMJgM8lvMVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eybKjgv4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eybKjgv4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38243a4ba5fso3103713f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732114578; x=1732719378; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRAvnS0IaCWBMzdRyDGxGfoX2WP3nXVUoH5LBPSc5Qs=;
        b=eybKjgv4PFc5KfXmZJcVYt1b7hbYiQRDgN1YxYOdacw3hzsoVaEoLpPxmFwNkMpGAj
         W3LI4u2N6T0EBWnuA0DhIAhmQNc6zPEOdT3ier6Btyz/hgiZcXYFGGR10UU5O7hd2hGw
         9d+aGByeAwRdWkPC+yWn7E6+uqknVRPTqMHkBlWsnOW5Ksm1+MIomaumUsKJGbRcOmm0
         qeALVYHveqmD2HWze09H0riX3BELXazxg3QLcxx4mWHwhNHVpNBLTn9AMOh50mVgH6AY
         18H/Ywu+UhLt/LY/31yumaP+JuU6lXqjO5Vxc2YXXHpGxSABPwNoIW/W3gd+kGy5Tqn5
         u00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114578; x=1732719378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRAvnS0IaCWBMzdRyDGxGfoX2WP3nXVUoH5LBPSc5Qs=;
        b=WoxARS4ZmfOv84Up2MOWOwTLK/ylOTcqS8RHb+e91T7gErzP5iqskXweS7oVMTydJ6
         MIwACk9PKPgT4O+wLs1LtxAGVs4fiUU8MO/X6xP8ObFoS5YiSPVE6WqHFXTy4L9POksI
         c7Y1zavk0IZskvz/4+LKz5KCHG+REs8+/wZXCZCsMXwGCjGIyO8+hPBfgQQjoxevmwVp
         2/CrAFbrx9919NCCM+HW1tWlYfwU3qWVLEQz5vSF925i9mFJgr+oXlMZUau/5XnQVJ0e
         1MZzQRSNKjDUXB9mmPAKlewMl2Jsy20ZAkq8Ayy1UAZoxU+iXL4Gvv+xfnWEru5v1w67
         J49w==
X-Forwarded-Encrypted: i=1; AJvYcCWapp3ceF8444q2moGtPPj1r8uj3tyPsprp4zIN1SrwzePyNbvDgfCZNinOzWuTzenxY9e9Ds10kWW/hgyLOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOGbZU6Zixg+UuHK41KPf8FU1ifUlbMwvhQ6kITEpWpAIa+2y
	xgsdcd2Pul2/5+0kQXl7s9s8I1OWOYcb7YpDwch15M/qXh0U+9OTx0QGft5B+oym8v0dEMR7R7s
	9tDH7mChHn+7zhQ==
X-Google-Smtp-Source: AGHT+IGq/r3HGbbtFoFVRvHr1EOlzN/Wt8+om4kWd42V+YspQZes17Yps3LGccfMBIlhtc72415J8+GJZmwAm9s=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:cf:b0:37d:5467:4008 with SMTP
 id ffacd0b85a97d-38254b18ad3mr818f8f.5.1732114577963; Wed, 20 Nov 2024
 06:56:17 -0800 (PST)
Date: Wed, 20 Nov 2024 14:49:55 +0000
In-Reply-To: <20241120-vma-v8-0-eb31425da66b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9857; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=thHW2hYjZXfFchwxaSHY31jS6Gxjf/8txx6XeVPPA40=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnPfiIPfGxtRmuM/beITcG2729I1pZZuD2y71Hm
 a5hLFdiTyWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZz34iAAKCRAEWL7uWMY5
 RrM9EAChZwI5X5J59zvpP7My8BG3gVmNliYXLaMF7DdF13YYqlfRr6Nw3FK7e+/5u8oyjxwjLDq
 i3Aerdaf3lQlSYU3T8YKbVn4UKhByCAgIggWEbwvt8y0OPSLqBJ8gzZ8qYHcluaqHVB6En/S47l
 7lsU2P1ozQStRB699rZdudrnMkzcxUw7oPTdb4oj33RV6AN3B7WuiPf/9FXT+L99Mz3fDdjhyu/
 DZFg5TzMI7PXpxVysdNfctskP27Y+Z/4W/wr534zWMVNHWwURuyfzMFgxpA68y6YgmeIp7jBp80
 h2+3Y4/WFCfH7dtvc2a3W7vdheRq8OqP3hIU7j85so4RpYZrLRFWJTsI6ksb8Tx6YatClhaN8xs
 QqZWzy67zmvq6CD9bNdc8iSGKicFWYqL3CRAK0dPh1iKzItCU/VYo6NDfKDVPKcJGCoeRa1mny2
 klw3Ap8CxgCgpmRPo9MKuHZre8uhJo7HBYPJMqNjVqTzWUGkHHap3fIa/pW/02sBXfteKVY4BsY
 ixHgtqTqQsvDkUGNy7QnWKGvdDAWJel/bBeazpquvJIDptb99myFDl581bVHCit1O/7vW+4egEw
 CeMAkJ7joMJHpeK7O9KH0ek1UkNOypcg1cM4iLNqxpYvpGAVDO0IA41NZEWF3DyHOy4fl4KJhlt xSzwOusQ+/1n5aA==
X-Mailer: b4 0.13.0
Message-ID: <20241120-vma-v8-1-eb31425da66b@google.com>
Subject: [PATCH v8 1/7] mm: rust: add abstraction for struct mm_struct
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/mm.c      |  39 +++++++++
 rust/kernel/lib.rs     |   1 +
 rust/kernel/mm.rs      | 219 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 20a0c69d5cc7..60a488eb4efe 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -13,6 +13,7 @@
 #include "build_bug.c"
 #include "err.c"
 #include "kunit.c"
+#include "mm.c"
 #include "mutex.c"
 #include "page.c"
 #include "rbtree.c"
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
index 66f5cde7f322..cc1963510cdf 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -43,6 +43,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod page;
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
new file mode 100644
index 000000000000..84cba581edaa
--- /dev/null
+++ b/rust/kernel/mm.rs
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Memory management.
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
+/// Since `mm_users` may be zero, the associated address space may not exist anymore. You can use
+/// [`mmget_not_zero`] to be able to access the address space.
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
+    /// Call `mmgrab` on `current.mm`.
+    #[inline]
+    pub fn mmgrab_current() -> Option<ARef<Mm>> {
+        // SAFETY: It's safe to get the `mm` field from current.
+        let mm = unsafe {
+            let current = bindings::get_current();
+            (*current).mm
+        };
+
+        if mm.is_null() {
+            return None;
+        }
+
+        // SAFETY: The value of `current->mm` is guaranteed to be null or a valid `mm_struct`. We
+        // just checked that it's not null. Furthermore, the returned `&Mm` is valid only for the
+        // duration of this function, and `current->mm` will stay valid for that long.
+        let mm = unsafe { Mm::from_raw(mm) };
+
+        // This increments the refcount using `mmgrab`.
+        Some(ARef::from(mm))
+    }
+
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
2.47.0.371.ga323438b13-goog

