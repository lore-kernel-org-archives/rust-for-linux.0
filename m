Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B91C280
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EqlnZhWo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=q8gF9r36/l0Ja9ZYm7cVKki3WZP8IQcKtCcbkba19dM=; b=EqlnZhWoWwCjABygCYOK8EzYwx
	vDLAEUCiOW4jU0+5Qk/VEHxwRX1EhQToQLIeB1waea9yC6UVdpizbbvaOAG1i+4MwThHJkCP93Pv/
	BFXBi1IBFz051Dr2d/6Xh7RXjyFpx1voI07J+dAptEz0pZnwFgUvN4ibMzZhSWNDXlOYibjspLRQY
	bwSuP3T3AcD108aWUjYts8FAMkF1xHPebwsSntQxGcBLs+eM9KfN3DKOVlXOCQz46h3yN/M9WwLgc
	L1bxHly1NPvZvKJTwGOmeJ8+Wtfgo11Carm2Jk+e+V6KuoX9CurcqMW7M11CUyzQPBNl98OGDzjph
	+/hba38A==;
Received: from [179.234.233.159] (helo=morissey..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rPlCF-0070Af-DO; Tue, 16 Jan 2024 16:17:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: rust-for-linux@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v6] rust: xarray: Add an abstraction for XArray
Date: Tue, 16 Jan 2024 12:06:03 -0300
Message-ID: <20240116151728.370238-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Asahi Lina <lina@asahilina.net>

The XArray is an abstract data type which behaves like a very large
array of pointers. Add a Rust abstraction for this data type.

The initial implementation uses explicit locking on get operations and
returns a guard which blocks mutation, ensuring that the referenced
object remains alive. To avoid excessive serialization, users are
expected to use an inner type that can be efficiently cloned (such as
Arc<T>), and eagerly clone and drop the guard to unblock other users
after a lookup.

Future variants may support using RCU instead to avoid mutex locking.

This abstraction also introduces a reservation mechanism, which can be
used by alloc-capable XArrays to reserve a free slot without immediately
filling it, and then do so at a later time. If the reservation is
dropped without being filled, the slot is freed again for other users,
which eliminates the need for explicit cleanup code.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

This abstraction is part of the set of dependencies I need to upstream
rustgem, a virtual GEM provider driver in the DRM [1]. Also, this
abstraction will be useful for the upstreaming process of the drm/asahi
driver.

Best Regards,
- Maíra

Changelog
=========

v1 -> v2: https://lore.kernel.org/r/20230224-rust-xarray-v1-1-80f0904ce5d3@asahilina.net

- Added Pin requirement for all XArray operations, to close a
  soundness hole due to the lock in the XArray (locks are not safe to
  move while locked). Creation does not require pinning in place, since
  the lock cannot be acquired at that point.
- Added safety note to Drop impl about why we don't need to do the lock
  unlock dance to ensure soundness in case of a dropped lock guard.
- Downstream drm/asahi driver was also rebased on this version to prove
  it works (previously it was still on a pre-v1 version).
- This still depends on the Error series (v1). v2 of that will need a
  trivial rename of Error::from_kernel_errno -> Error::from_errno. If
  this version of XArray ends up looking good, I'll send a trivial v4 of
  XArray with the rename, after sending the v2 of the Error series.

v2 -> v3: https://lore.kernel.org/r/20230224-rust-xarray-v2-1-4eeb0134944c@asahilina.net

- Updated to the error v2/v3 series API.
- Renamed `err` to `ret` for consistency with the other instance.

v3 -> v4: https://lore.kernel.org/rust-for-linux/20230224-rust-xarray-v3-1-04305b1173a5@asahilina.net/

- Rebase on top of rust-next.

v4 -> v5: https://lore.kernel.org/rust-for-linux/20231126131210.1384490-1-mcanal@igalia.com/T/

- Use Gary's suggestion for the Deref trait - no unsafe code! (Benno Lossin)
- Use NonNull (Benno Lossin)
- Not spelling out the lifetimes (Benno Lossin)
- Change XArray invariants (Benno Lossin)
- Add all SAFETY comments (Benno Lossin)
- Use `kernel::error::to_result` (Benno Lossin)
- s/alloc_limits/alloc_limits_opt (Benno Lossin)
- Split unsafe block (Benno Lossin)
- Make error handling of the function `alloc_limits_opt` through `ScopeGuard` (Benno Lossin)
- Use `ScopeGuard` in the function `get` (Benno Lossin)

v5 -> v6: https://lore.kernel.org/rust-for-linux/20231201195300.1329092-1-mcanal@igalia.com/T/

- Update constants to the new format (RUST_CONST_HELPER)
- Add invariant for `self.0` being a pointer derived from `T::from_foreign` (Benno Lossin)
- Fix the place of the INVARIANT comments (Benno Lossin)
- Use the Pin-Init API (Benno Lossin)
- Remove PhantomPinned from XArray (Benno Lossin)
- Add new requirements for calling `xa_unlock()` (Benno Lossin)
- Improve SAFETY comments (Benno Lossin)
- Split unsafe block (Benno Lossin)
- s/alloc_limits_opt/insert_between (Benno Lossin)
- Specify the target type of the cast (Andreas Hindborg/Trevor Gross)
- Guarantee that T is 4-byte aligned (Andreas Hindborg)
- Add code examples in the code (Boqun Feng)

[1] https://github.com/mairacanal/linux/pull/11

 rust/bindings/bindings_helper.h |  17 ++
 rust/helpers.c                  |  37 +++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/xarray.rs           | 383 ++++++++++++++++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 rust/kernel/xarray.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b5714fb69fe3..e8e8187580fc 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,8 +13,25 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>

 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const gfp_t RUST_CONST_HELPER_GFP_KERNEL = GFP_KERNEL;
 const gfp_t RUST_CONST_HELPER___GFP_ZERO = __GFP_ZERO;
+
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_LOCK_IRQ = XA_FLAGS_LOCK_IRQ;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_LOCK_BH = XA_FLAGS_LOCK_BH;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_TRACK_FREE = XA_FLAGS_TRACK_FREE;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_ZERO_BUSY = XA_FLAGS_ZERO_BUSY;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC_WRAPPED = XA_FLAGS_ALLOC_WRAPPED;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_ACCOUNT = XA_FLAGS_ACCOUNT;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
+const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
+
+const xa_mark_t RUST_CONST_HELPER_XA_MARK_0 = XA_MARK_0;
+const xa_mark_t RUST_CONST_HELPER_XA_MARK_1 = XA_MARK_1;
+const xa_mark_t RUST_CONST_HELPER_XA_MARK_2 = XA_MARK_2;
+const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
+const xa_mark_t RUST_CONST_HELPER_XA_MARK_MAX = XA_MARK_MAX;
+const xa_mark_t RUST_CONST_HELPER_XA_FREE_MARK = XA_FREE_MARK;
diff --git a/rust/helpers.c b/rust/helpers.c
index 70e59efd92bc..72a7f9c596ad 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -31,6 +31,7 @@
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>

 __noreturn void rust_helper_BUG(void)
 {
@@ -157,6 +158,42 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
 }
 EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);

+void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
+{
+	xa_init_flags(xa, flags);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_init_flags);
+
+bool rust_helper_xa_empty(struct xarray *xa)
+{
+	return xa_empty(xa);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_empty);
+
+int rust_helper_xa_alloc(struct xarray *xa, u32 *id, void *entry, struct xa_limit limit, gfp_t gfp)
+{
+	return xa_alloc(xa, id, entry, limit, gfp);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_alloc);
+
+void rust_helper_xa_lock(struct xarray *xa)
+{
+	xa_lock(xa);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_lock);
+
+void rust_helper_xa_unlock(struct xarray *xa)
+{
+	xa_unlock(xa);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_unlock);
+
+int rust_helper_xa_err(void *entry)
+{
+	return xa_err(entry);
+}
+EXPORT_SYMBOL_GPL(rust_helper_xa_err);
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e6aff80b521f..1a4372a4e85c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -48,6 +48,7 @@
 pub mod task;
 pub mod types;
 pub mod workqueue;
+pub mod xarray;

 #[doc(hidden)]
 pub use bindings;
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
new file mode 100644
index 000000000000..fd2ea8b1a307
--- /dev/null
+++ b/rust/kernel/xarray.rs
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! XArray abstraction.
+//!
+//! C header: [`include/linux/xarray.h`](../../include/linux/xarray.h)
+
+use crate::{
+    bindings,
+    error::{to_result, Error, Result},
+    prelude::*,
+    types::{ForeignOwnable, Opaque, ScopeGuard},
+};
+use core::{marker::PhantomData, mem, ops::Deref, ptr::NonNull};
+
+/// Flags passed to `XArray::new` to configure the `XArray`.
+type Flags = bindings::gfp_t;
+
+/// Flag values passed to `XArray::new` to configure the `XArray`.
+pub mod flags {
+    /// Use IRQ-safe locking.
+    pub const LOCK_IRQ: super::Flags = bindings::XA_FLAGS_LOCK_IRQ;
+    /// Use softirq-safe locking.
+    pub const LOCK_BH: super::Flags = bindings::XA_FLAGS_LOCK_BH;
+    /// Track which entries are free (distinct from None).
+    pub const TRACK_FREE: super::Flags = bindings::XA_FLAGS_TRACK_FREE;
+    /// Initialize array index 0 as busy.
+    pub const ZERO_BUSY: super::Flags = bindings::XA_FLAGS_ZERO_BUSY;
+    /// Use GFP_ACCOUNT for internal memory allocations.
+    pub const ACCOUNT: super::Flags = bindings::XA_FLAGS_ACCOUNT;
+    /// Create an allocating `XArray` starting at index 0.
+    pub const ALLOC: super::Flags = bindings::XA_FLAGS_ALLOC;
+    /// Create an allocating `XArray` starting at index 1.
+    pub const ALLOC1: super::Flags = bindings::XA_FLAGS_ALLOC1;
+}
+
+/// Wrapper for a value owned by the `XArray` which holds the `XArray` lock until dropped.
+///
+/// INVARIANT: `Guard` holds a reference (`self.0`) to the underlying value owned by XArray.
+/// You can use the `into_foreign` method to obtain a pointer to the foreign representation
+/// of the owned value, which is valid for the lifetime of the Guard.
+pub struct Guard<'a, T: ForeignOwnable>(NonNull<T>, &'a XArray<T>);
+
+impl<'a, T: ForeignOwnable> Guard<'a, T> {
+    /// Borrow the underlying value wrapped by the `Guard`.
+    ///
+    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` type.
+    pub fn borrow(&self) -> T::Borrowed<'_> {
+        // SAFETY: The value is owned by the `XArray`, the lifetime it is borrowed for must not
+        // outlive the `XArray` itself, nor the Guard that holds the lock ensuring the value
+        // remains in the `XArray`.
+        //
+        // By the type invariant of `Guard`, we can guarantee that `Guard` holds this reference
+        // (`self.0`).
+        unsafe { T::borrow(self.0.as_ptr().cast()) }
+    }
+}
+
+// Convenience impl for `ForeignOwnable` types whose `Borrowed`
+// form implements Deref.
+impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
+where
+    T::Borrowed<'a>: Deref,
+    for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Target>,
+{
+    type Target = <T::Borrowed<'a> as Deref>::Target;
+
+    fn deref(&self) -> &Self::Target {
+        self.borrow().into()
+    }
+}
+
+impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariant, we guarantee that we have a reference
+        // that owns the C xarray object.
+        unsafe { bindings::xa_unlock(self.1.xa.get()) };
+    }
+}
+
+/// Represents a reserved slot in an `XArray`, which does not yet have a value but has an assigned
+/// index and may not be allocated by any other user. If the Reservation is dropped without
+/// being filled, the entry is marked as available again.
+///
+/// Users must ensure that reserved slots are not filled by other mechanisms, or otherwise their
+/// contents may be dropped and replaced (which will print a warning).
+pub struct Reservation<'a, T: ForeignOwnable>(&'a XArray<T>, usize, PhantomData<T>);
+
+impl<'a, T: ForeignOwnable> Reservation<'a, T> {
+    /// Stores a value into the reserved slot.
+    pub fn store(self, value: T) -> Result<usize> {
+        if self.0.replace(self.1, value)?.is_some() {
+            crate::pr_err!("XArray: Reservation stored but the entry already had data!\n");
+            // Consider it a success anyway, not much we can do
+        }
+        let index = self.1;
+        // The reservation is now fulfilled, so do not run our destructor.
+        core::mem::forget(self);
+        Ok(index)
+    }
+
+    /// Returns the index of this reservation.
+    pub fn index(&self) -> usize {
+        self.1
+    }
+}
+
+impl<'a, T: ForeignOwnable> Drop for Reservation<'a, T> {
+    fn drop(&mut self) {
+        if self.0.remove(self.1).is_some() {
+            crate::pr_err!("XArray: Reservation dropped but the entry was not empty!\n");
+        }
+    }
+}
+
+/// An array which efficiently maps sparse integer indices to owned objects.
+///
+/// This is similar to a `Vec<Option<T>>`, but more efficient when there are holes in the
+/// index space, and can be efficiently grown.
+///
+/// This structure is expected to often be used with an inner type that
+/// can be efficiently cloned, such as an `Arc<T>`.
+///
+/// INVARIANT: All pointers stored in the array are pointers obtained by
+/// calling `T::into_foreign`.
+#[pin_data(PinnedDrop)]
+pub struct XArray<T: ForeignOwnable> {
+    #[pin]
+    xa: Opaque<bindings::xarray>,
+    _p: PhantomData<T>,
+}
+
+///
+/// # Examples
+///
+/// ```rust
+/// # use kernel::xarray;
+/// # use kernel::prelude::*;
+/// # use kernel::sync::Arc;
+///
+/// # struct Foo {
+/// #     a: u32,
+/// #     b: u32,
+/// # }
+///
+/// let arr = Box::pin_init(xarray::XArray::<Arc<Foo>>::new(xarray::flags::ALLOC1))
+///                                                    .expect("Unable to allocate XArray");
+///
+/// let foo = Arc::try_new(Foo { a : 1, b: 2 }).expect("Unable to allocate Foo");
+/// let index = arr.alloc(foo).expect("Error allocating Index");
+///
+/// if let Some(guard) = arr.get(index) {
+///     assert_eq!(guard.borrow().a, 1);
+///     assert_eq!(guard.borrow().b, 2);
+/// } else {
+///     pr_info!("No value found in index {}", index);
+/// }
+///
+/// let foo = Arc::try_new(Foo { a : 3, b: 4 }).expect("Unable to allocate Foo");
+/// let index = arr.alloc(foo).expect("Error allocating Index");
+///
+/// if let Some(removed_data) = arr.remove(index) {
+///     assert_eq!(removed_data.a, 3);
+///     assert_eq!(removed_data.b, 4);
+/// } else {
+///     pr_info!("No value found in index {}", index);
+/// }
+/// ```
+impl<T: ForeignOwnable> XArray<T> {
+    /// Creates a new `XArray` with the given flags.
+    pub fn new(flags: Flags) -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: `xa` is valid while the closure is called.
+            xa <- Opaque::ffi_init(|xa| unsafe {
+                bindings::xa_init_flags(xa, flags)
+            }),
+            _p: PhantomData,
+        })
+    }
+
+    /// Replaces an entry with a new value, returning the old value (if any).
+    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>> {
+        let new = value.into_foreign();
+
+        build_assert!(mem::align_of::<T>() <= 4);
+
+        // SAFETY: `new` just came from into_foreign(), and we dismiss this guard if
+        // the xa_store operation succeeds and takes ownership of the pointer.
+        let guard = ScopeGuard::new(|| unsafe {
+            T::from_foreign(new);
+        });
+
+        // SAFETY: `self.xa` is always valid by the type invariant, and we are storing
+        // a `T::into_foreign()` result which upholds the later invariants.
+        let old = unsafe {
+            bindings::xa_store(
+                self.xa.get(),
+                index.try_into()?,
+                new.cast_mut(),
+                bindings::GFP_KERNEL,
+            )
+        };
+
+        // SAFETY: `xa_store` returns the old entry at this index on success or
+        // a XArray result, which can be turn into an errno through `xa_err`.
+        to_result(unsafe { bindings::xa_err(old) })?;
+        guard.dismiss();
+
+        Ok(if old.is_null() {
+            None
+        } else {
+            // SAFETY: The old value must have been stored by either this function or
+            // `insert_between`, both of which ensure non-NULL entries are valid
+            // ForeignOwnable pointers.
+            Some(unsafe { T::from_foreign(old) })
+        })
+    }
+
+    /// Replaces an entry with a new value, dropping the old value (if any).
+    pub fn set(&self, index: usize, value: T) -> Result {
+        self.replace(index, value)?;
+        Ok(())
+    }
+
+    /// Looks up and returns a reference to an entry in the array, returning a `Guard` if it
+    /// exists.
+    ///
+    /// This guard blocks all other actions on the `XArray`. Callers are expected to drop the
+    /// `Guard` eagerly to avoid blocking other users, such as by taking a clone of the value.
+    pub fn get(&self, index: usize) -> Option<Guard<'_, T>> {
+        // SAFETY: `self.xa` is always valid by the type invariant.
+        unsafe { bindings::xa_lock(self.xa.get()) };
+
+        // SAFETY: `self.xa` is always valid by the type invariant.
+        let guard = ScopeGuard::new(|| unsafe { bindings::xa_unlock(self.xa.get()) });
+
+        // SAFETY: `self.xa` is always valid by the type invariant.
+        //
+        // As we are taking advantage of the lock to protect the data structures
+        // that we are storing in the XArray, we need to call xa_lock() before
+        // calling xa_load(), which we did.
+        let p = unsafe { bindings::xa_load(self.xa.get(), index.try_into().ok()?) };
+
+        NonNull::new(p as *mut T).map(|p| {
+            guard.dismiss();
+            Guard(p, self)
+        })
+    }
+
+    /// Removes and returns an entry, returning it if it existed.
+    pub fn remove(&self, index: usize) -> Option<T> {
+        // SAFETY: `self.xa` is always valid by the type invariant.
+        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };
+        if p.is_null() {
+            None
+        } else {
+            // SAFETY: All pointers stored in the array are pointers obtained by
+            // calling `T::into_foreign`.
+            Some(unsafe { T::from_foreign(p) })
+        }
+    }
+
+    /// Allocates a new index in the array, optionally storing a new value into it, with
+    /// configurable bounds for the index range to allocate from.
+    ///
+    /// If `value` is `None`, then the index is reserved from further allocation but remains
+    /// free for storing a value into it.
+    fn insert_between(&self, value: Option<T>, min: u32, max: u32) -> Result<usize> {
+        let new = value.map_or(core::ptr::null(), |a| a.into_foreign());
+        let mut id: u32 = 0;
+
+        let guard = ScopeGuard::new(|| {
+            if !new.is_null() {
+                // SAFETY: If `new` is not NULL, it came from the `ForeignOwnable` we got
+                // from the caller.
+                unsafe { T::from_foreign(new) };
+            }
+        });
+
+        // SAFETY: `self.xa` is always valid by the type invariant. If this succeeds, it
+        // takes ownership of the passed `T` (if any). If it fails, we must drop the
+        // `T` again.
+        let ret = unsafe {
+            bindings::xa_alloc(
+                self.xa.get(),
+                &mut id,
+                new.cast_mut(),
+                bindings::xa_limit { min, max },
+                bindings::GFP_KERNEL,
+            )
+        };
+
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            guard.dismiss();
+            Ok(id as usize)
+        }
+    }
+
+    /// Allocates a new index in the array, storing a new value into it, with configurable
+    /// bounds for the index range to allocate from.
+    pub fn alloc_limits(&self, value: T, min: u32, max: u32) -> Result<usize> {
+        self.insert_between(Some(value), min, max)
+    }
+
+    /// Allocates a new index in the array, storing a new value into it.
+    pub fn alloc(&self, value: T) -> Result<usize> {
+        self.alloc_limits(value, 0, u32::MAX)
+    }
+
+    /// Reserves a new index in the array within configurable bounds for the index.
+    ///
+    /// Returns a `Reservation` object, which can then be used to store a value at this index or
+    /// otherwise free it for reuse.
+    pub fn reserve_limits(&self, min: u32, max: u32) -> Result<Reservation<'_, T>> {
+        Ok(Reservation(
+            self,
+            self.insert_between(None, min, max)?,
+            PhantomData,
+        ))
+    }
+
+    /// Reserves a new index in the array.
+    ///
+    /// Returns a `Reservation` object, which can then be used to store a value at this index or
+    /// otherwise free it for reuse.
+    pub fn reserve(&self) -> Result<Reservation<'_, T>> {
+        Ok(Reservation(
+            self,
+            self.insert_between(None, 0, u32::MAX)?,
+            PhantomData,
+        ))
+    }
+}
+
+#[pinned_drop]
+impl<T: ForeignOwnable> PinnedDrop for XArray<T> {
+    fn drop(self: Pin<&mut Self>) {
+        let mut index: core::ffi::c_ulong = 0;
+        let mut entry;
+
+        // SAFETY: `self.xa` is valid by the type invariant, and as we have
+        // the only reference to the `XArray` we can safely iterate its contents
+        // and drop everything.
+        unsafe {
+            entry = bindings::xa_find(
+                self.xa.get(),
+                &mut index,
+                core::ffi::c_ulong::MAX,
+                bindings::XA_PRESENT,
+            );
+        }
+
+        while !entry.is_null() {
+            // SAFETY: All pointers stored in the array are pointers obtained by
+            // calling `T::into_foreign`.
+            unsafe {
+                T::from_foreign(entry);
+            }
+
+            // SAFETY: `self.xa` is valid by the type invariant, and as we have
+            // the only reference to the `XArray` we can safely iterate its contents
+            // and drop everything.
+            unsafe {
+                entry = bindings::xa_find_after(
+                    self.xa.get(),
+                    &mut index,
+                    core::ffi::c_ulong::MAX,
+                    bindings::XA_PRESENT,
+                );
+            }
+        }
+
+        // SAFETY: `xa_destroy()` is guaranteed to acquire the lock anyway.
+        unsafe {
+            bindings::xa_destroy(self.xa.get());
+        }
+    }
+}
+
+// SAFETY: XArray is thread-safe and all mutation operations are internally locked.
+unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
+unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}
--
2.43.0

