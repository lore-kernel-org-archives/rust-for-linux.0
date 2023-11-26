Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="FhjZ7f3X"
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3C8DD
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Nov 2023 05:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fdoGNSfstUXUnb39iMjavjNLaOkZBuTdwMb98n5gx3U=; b=FhjZ7f3XBC3/YqGZTPZo9bLZsq
	A9QW05nTgVIzYv283KFHa5GeAljP5Ydx8NJsBnVEtZKkVEYgr3StHOmkIdbyfCXE9GvGXE9RGksP7
	+vv24kCJIOVTNj7clzzLcrDTn8OAZW1oNv8KroWwj24AARNBxo5bVo+xfYBsn6N8fvK6pAukydnHO
	0JGo+hkeZQr71/Plt4PUwvlmb526VX7KlN5flM6B/eEGJjkp50+Wf9iQD0zWiyFtYnScm3tc8aYqT
	u9nYdkStYnri9F2Fh7GnJgVVFTTnAN6eFZFMErKlFE0jeuwFkIbzjuDXJXCa13Wt0C9m52/YblLLW
	DBzKf1ZA==;
Received: from [177.34.168.16] (helo=morissey..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1r7EwE-007IEu-7s; Sun, 26 Nov 2023 14:12:43 +0100
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
Subject: [PATCH v4] rust: xarray: Add an abstraction for XArray
Date: Sun, 26 Nov 2023 10:01:40 -0300
Message-ID: <20231126131210.1384490-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

This abstraction is part of the set of dependencies I need to upstream
rustgem, a virtual GEM provider driver in the DRM [1]. Also, this
abstraction will be useful for the upstreaming process of the drm/asahi
driver.

This patch was authored by Asahi Lina and I rebased on top of rust-next,
fixing small conflicts. I'll try to take care of possible iterations
that this patch might have and I'll try to address the feedback.

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

v3 -> v4:
- Rebase on top of rust-next.

[1] https://github.com/mairacanal/linux/pull/11

 rust/bindings/bindings_helper.h |  17 ++
 rust/helpers.c                  |  37 ++++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/xarray.rs           | 298 ++++++++++++++++++++++++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 rust/kernel/xarray.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c91a3c24f607..41b488f73dd3 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -12,8 +12,25 @@
 #include <linux/refcount.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
+#include <linux/xarray.h>

 /* `bindgen` gets confused at certain things. */
 const size_t BINDINGS_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
 const gfp_t BINDINGS___GFP_ZERO = __GFP_ZERO;
+
+const gfp_t BINDINGS_XA_FLAGS_LOCK_IRQ = XA_FLAGS_LOCK_IRQ;
+const gfp_t BINDINGS_XA_FLAGS_LOCK_BH = XA_FLAGS_LOCK_BH;
+const gfp_t BINDINGS_XA_FLAGS_TRACK_FREE = XA_FLAGS_TRACK_FREE;
+const gfp_t BINDINGS_XA_FLAGS_ZERO_BUSY = XA_FLAGS_ZERO_BUSY;
+const gfp_t BINDINGS_XA_FLAGS_ALLOC_WRAPPED = XA_FLAGS_ALLOC_WRAPPED;
+const gfp_t BINDINGS_XA_FLAGS_ACCOUNT = XA_FLAGS_ACCOUNT;
+const gfp_t BINDINGS_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
+const gfp_t BINDINGS_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
+
+const xa_mark_t BINDINGS_XA_MARK_0 = XA_MARK_0;
+const xa_mark_t BINDINGS_XA_MARK_1 = XA_MARK_1;
+const xa_mark_t BINDINGS_XA_MARK_2 = XA_MARK_2;
+const xa_mark_t BINDINGS_XA_PRESENT = XA_PRESENT;
+const xa_mark_t BINDINGS_XA_MARK_MAX = XA_MARK_MAX;
+const xa_mark_t BINDINGS_XA_FREE_MARK = XA_FREE_MARK;
diff --git a/rust/helpers.c b/rust/helpers.c
index 4c86fe4a7e05..e5706e666f1c 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -30,6 +30,7 @@
 #include <linux/sched/signal.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/xarray.h>

 __noreturn void rust_helper_BUG(void)
 {
@@ -144,6 +145,42 @@ struct kunit *rust_helper_kunit_get_current_test(void)
 }
 EXPORT_SYMBOL_GPL(rust_helper_kunit_get_current_test);

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
index e8811700239a..5127555ff5ec 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -45,6 +45,7 @@
 pub mod sync;
 pub mod task;
 pub mod types;
+pub mod xarray;

 #[doc(hidden)]
 pub use bindings;
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
new file mode 100644
index 000000000000..7d12e7e281f7
--- /dev/null
+++ b/rust/kernel/xarray.rs
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! XArray abstraction.
+//!
+//! C header: [`include/linux/xarray.h`](../../include/linux/xarray.h)
+
+use crate::{
+    bindings,
+    error::{Error, Result},
+    types::{ForeignOwnable, Opaque, ScopeGuard},
+};
+use core::{marker::PhantomData, ops::Deref};
+
+/// Flags passed to `XArray::new` to configure the `XArray`.
+type Flags = bindings::gfp_t;
+
+/// Flag values passed to `XArray::new` to configure the `XArray`.
+pub mod flags {
+    /// Use IRQ-safe locking
+    pub const LOCK_IRQ: super::Flags = bindings::BINDINGS_XA_FLAGS_LOCK_IRQ;
+    /// Use softirq-safe locking
+    pub const LOCK_BH: super::Flags = bindings::BINDINGS_XA_FLAGS_LOCK_BH;
+    /// Track which entries are free (distinct from None)
+    pub const TRACK_FREE: super::Flags = bindings::BINDINGS_XA_FLAGS_TRACK_FREE;
+    /// Initialize array index 0 as busy
+    pub const ZERO_BUSY: super::Flags = bindings::BINDINGS_XA_FLAGS_ZERO_BUSY;
+    /// Use GFP_ACCOUNT for internal memory allocations
+    pub const ACCOUNT: super::Flags = bindings::BINDINGS_XA_FLAGS_ACCOUNT;
+    /// Create an allocating `XArray` starting at index 0
+    pub const ALLOC: super::Flags = bindings::BINDINGS_XA_FLAGS_ALLOC;
+    /// Create an allocating `XArray` starting at index 1
+    pub const ALLOC1: super::Flags = bindings::BINDINGS_XA_FLAGS_ALLOC1;
+}
+
+/// Wrapper for a value owned by the `XArray` which holds the `XArray` lock until dropped.
+///
+/// # Invariants
+///
+/// The `*mut T` is always non-NULL and owned by the referenced `XArray`
+pub struct Guard<'a, T: ForeignOwnable>(*mut T, &'a Opaque<bindings::xarray>);
+
+impl<'a, T: ForeignOwnable> Guard<'a, T> {
+    /// Borrow the underlying value wrapped by the `Guard`.
+    ///
+    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` type.
+    pub fn borrow<'b>(&'b self) -> T::Borrowed<'b>
+    where
+        'a: 'b,
+    {
+        // SAFETY: The value is owned by the `XArray`, the lifetime it is borrowed for must not
+        // outlive the `XArray` itself, nor the Guard that holds the lock ensuring the value
+        // remains in the `XArray`.
+        unsafe { T::borrow(self.0 as _) }
+    }
+}
+
+// Convenience impl for `ForeignOwnable` types whose `Borrowed`
+// form implements Deref.
+impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
+where
+    T::Borrowed<'static>: Deref,
+{
+    type Target = <T::Borrowed<'static> as Deref>::Target;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: See the `borrow()` method. The dereferenced `T::Borrowed` value
+        // must share the same lifetime, so we can return a reference to it.
+        unsafe { &*(T::borrow(self.0 as _).deref() as *const _) }
+    }
+}
+
+impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
+    fn drop(&mut self) {
+        // SAFETY: The XArray we have a reference to owns the C xarray object.
+        unsafe { bindings::xa_unlock(self.1.get()) };
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
+    /// Store a value into the reserved slot.
+    pub fn store(self, value: T) -> Result<usize> {
+        if self.0.replace(self.1, value)?.is_some() {
+            crate::pr_err!("XArray: Reservation stored but the entry already had data!\n");
+            // Consider it a success anyway, not much we can do
+        }
+        let index = self.1;
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
+/// This structure is expected to often be used with an inner type that can either be efficiently
+/// cloned, such as an `Arc<T>`.
+pub struct XArray<T: ForeignOwnable> {
+    xa: Opaque<bindings::xarray>,
+    _p: PhantomData<T>,
+}
+
+impl<T: ForeignOwnable> XArray<T> {
+    /// Creates a new `XArray` with the given flags.
+    pub fn new(flags: Flags) -> Result<XArray<T>> {
+        let xa = Opaque::uninit();
+
+        // SAFETY: We have just created `xa`. This data structure does not require
+        // pinning.
+        unsafe { bindings::xa_init_flags(xa.get(), flags) };
+
+        // INVARIANT: Initialize the `XArray` with a valid `xa`.
+        Ok(XArray {
+            xa,
+            _p: PhantomData,
+        })
+    }
+
+    /// Replaces an entry with a new value, returning the old value (if any).
+    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>> {
+        let new = value.into_foreign();
+        let guard = ScopeGuard::new(|| unsafe {
+            T::from_foreign(new);
+        });
+
+        let old = unsafe {
+            bindings::xa_store(
+                self.xa.get(),
+                index.try_into()?,
+                new as *mut _,
+                bindings::GFP_KERNEL,
+            )
+        };
+
+        let err = unsafe { bindings::xa_err(old) };
+        if err != 0 {
+            Err(Error::from_errno(err))
+        } else if old.is_null() {
+            guard.dismiss();
+            Ok(None)
+        } else {
+            guard.dismiss();
+            Ok(Some(unsafe { T::from_foreign(old) }))
+        }
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
+        let p = unsafe {
+            bindings::xa_lock(self.xa.get());
+            bindings::xa_load(self.xa.get(), index.try_into().ok()?)
+        };
+
+        if p.is_null() {
+            unsafe { bindings::xa_unlock(self.xa.get()) };
+            None
+        } else {
+            Some(Guard(p as _, &self.xa))
+        }
+    }
+
+    /// Removes and returns an entry, returning it if it existed.
+    pub fn remove(&self, index: usize) -> Option<T> {
+        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };
+        if p.is_null() {
+            None
+        } else {
+            Some(unsafe { T::from_foreign(p) })
+        }
+    }
+
+    /// Allocate a new index in the array, optionally storing a new value into it, with
+    /// configurable bounds for the index range to allocate from.
+    ///
+    /// If `value` is `None`, then the index is reserved from further allocation but remains
+    /// free for storing a value into it.
+    pub fn alloc_limits(&self, value: Option<T>, min: u32, max: u32) -> Result<usize> {
+        let new = value.map_or(core::ptr::null(), |a| a.into_foreign());
+        let mut id: u32 = 0;
+
+        // SAFETY: `self.xa` is always valid by the type invariant. If this succeeds, it
+        // takes ownership of the passed `T` (if any). If it fails, we must drop the
+        // `T` again.
+        let ret = unsafe {
+            bindings::xa_alloc(
+                self.xa.get(),
+                &mut id,
+                new as *mut _,
+                bindings::xa_limit { min, max },
+                bindings::GFP_KERNEL,
+            )
+        };
+
+        if ret < 0 {
+            // Make sure to drop the value we failed to store
+            if !new.is_null() {
+                // SAFETY: If `new` is not NULL, it came from the `ForeignOwnable` we got
+                // from the caller.
+                unsafe { T::from_foreign(new) };
+            }
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(id as usize)
+        }
+    }
+
+    /// Allocate a new index in the array, optionally storing a new value into it.
+    ///
+    /// If `value` is `None`, then the index is reserved from further allocation but remains
+    /// free for storing a value into it.
+    pub fn alloc(&self, value: Option<T>) -> Result<usize> {
+        self.alloc_limits(value, 0, u32::MAX)
+    }
+
+    /// Reserve a new index in the array within configurable bounds for the index.
+    ///
+    /// Returns a `Reservation` object, which can then be used to store a value at this index or
+    /// otherwise free it for reuse.
+    pub fn reserve_limits(&self, min: u32, max: u32) -> Result<Reservation<'_, T>> {
+        Ok(Reservation(
+            self,
+            self.alloc_limits(None, min, max)?,
+            PhantomData,
+        ))
+    }
+
+    /// Reserve a new index in the array.
+    ///
+    /// Returns a `Reservation` object, which can then be used to store a value at this index or
+    /// otherwise free it for reuse.
+    pub fn reserve(&self) -> Result<Reservation<'_, T>> {
+        Ok(Reservation(self, self.alloc(None)?, PhantomData))
+    }
+}
+
+impl<T: ForeignOwnable> Drop for XArray<T> {
+    fn drop(&mut self) {
+        // SAFETY: `self.xa` is valid by the type invariant, and as we have the only reference to
+        // the `XArray` we can safely iterate its contents and drop everything.
+        unsafe {
+            let mut index: core::ffi::c_ulong = 0;
+            let mut entry = bindings::xa_find(
+                self.xa.get(),
+                &mut index,
+                core::ffi::c_ulong::MAX,
+                bindings::BINDINGS_XA_PRESENT,
+            );
+            while !entry.is_null() {
+                T::from_foreign(entry);
+                entry = bindings::xa_find_after(
+                    self.xa.get(),
+                    &mut index,
+                    core::ffi::c_ulong::MAX,
+                    bindings::BINDINGS_XA_PRESENT,
+                );
+            }
+
+            bindings::xa_destroy(self.xa.get());
+        }
+    }
+}
+
+// SAFETY: XArray is thread-safe and all mutation operations are internally locked.
+unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
+unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}
--
2.41.0

