Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82E3112D2;
	Fri,  6 Feb 2026 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412321; cv=none; b=XoPUoMu2hnPb+rhuXWF5YU64N269SoRuowyF6/1THhH9urz0yVu5zoMn2opnqhc2BG9rXv5Nqb7tGI3szxvs4sB9djswNufNZJpElds1HnaVDAQqjVc4x1YEiBOUGl62dFCxpTK8SrIg/0OFN2+HarKRKBQC5yuO4DBtGAQKvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412321; c=relaxed/simple;
	bh=AC4NCWQlfHS+3umvfHK9M7bjjDtFlC6otCKn7IFTKu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbovNuCklYMXKk9BLqN9DOm64sCeU0yom93IkOxzkF0WGHYnnndYpthGU+Uttr1KJb/Zr6mGKBahEx0SMUMrpMCp2J+DiunxmgF4F6SX7fL5TjnhxOCtqbQrVKiG+iMfLnLYywJ0Vv3suPf42lQQSvMNOKYQV2YdoewHRc1QoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpmicoAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpmicoAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC971C116C6;
	Fri,  6 Feb 2026 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412321;
	bh=AC4NCWQlfHS+3umvfHK9M7bjjDtFlC6otCKn7IFTKu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WpmicoAyOeKMjQbPko5tQxJ5PHYWJdWZJSDHlu48rE5FmgmWXT81IpsJEFiBduXjR
	 k47q8v+tUvVKHT5cdzemTzV+S3KVj1b4tF+HLmD2jKGhRzdleSxb9EouITUPIwa7fo
	 15LtLv4b16pnt9D0xW0CC54xNJQM4zvmwr1Z2jmgbLESlDX2YMygCBDMcsgO59cfd+
	 icUi1evSQxeUK0y58ugkXLBlj5ouIBtTKB75yHZVkuyxFt8mNA9sRItrHbWlwXNmj8
	 y32X0YnKfXQdAcRJrr6yYPWCnZ5g2Z4Ji7gR6jUtD9VQ/uQSGCZksim2tZg72idMjd
	 KRBu7O2cG7RwQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:57 +0100
Subject: [PATCH v2 11/11] rust: xarray: add preload API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-11-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=17136;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=AC4NCWQlfHS+3umvfHK9M7bjjDtFlC6otCKn7IFTKu4=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljqWbK6JVOB8Dx84iCFFrCbId0d2R0MkNmZS
 4n6fEjxBVGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY6gAKCRDhuBo+eShj
 d9HUD/9sT3Dt5h9Ne4yUU3D2G/PVRBEHLzC3kwVweot4CzkGrdTlPPlxfZfiQGCGgcrtxkIyg6Q
 0vqvdlLRsjiCDOE5DljzjyyaI0LdfMODOhKFZRcdowmquevCX+T1+yL2icu2LxsoT0/d6LiUEiD
 AKu5dRn/05+l9kMtsT6fVqw/tzSV3a/OjGfw64JXDCGX2byE+fnJNw9jrtRB41de4D36DKpVxtX
 3g1RUDpdpmEAPQa+6VqZy5Yj8qywIM8kdJjcRe1UEh6ICq0SJhqY406WMYjumk55TBff9Fs37eT
 Q5yotLmTBv03wRfqN9nc5lzmKijn3LHHTvr1NCOYfQEe8myKlzexkvdSa1V89rnx9ZUoKu7lRIh
 Is1pSkdLR7UKknSebRu0r8WqyscEABZUt0Y8vAp3wUsjSMUMM2qfJirwGyxKmLAPm7S0QMwG1V6
 SXkmIwUXAPtiovVUVLH8/TFHARkXVyBAjqlyHAQj+ygsb/T8wYd14GctMLciUxlwMde0Qd452JU
 ITvK/JufwLAfBHfbKDO8BihSIf2zwF3KhMfeHSZl+ExSGzKuzKdEP5r/w+3esOe2yhwO1ttxSWH
 +++hQ5XmwM8CKBvWzU92x9SX31/5DbAog4IVN3Hc6saHTgAn10gN6ritFtxa53nxKeIbDOcrcXM
 FeLsi3EUXVQdsmQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a preload API that allows preallocating memory for XArray
insertions. This enables insertions to proceed without allocation
failures in contexts where memory allocation is not desirable, such as
in atomic contexts or where reliability is critical.

The API includes:

- `XArrayPreloadBuffer` for managing a pool of preallocated nodes.
- `XArrayPreloadNode` representing a single preallocated node.
- Integration with the entry API, allowing `VacantEntry::insert` and
  `VacantEntry::insert_entry` to accept an optional preload buffer.
- A new `Guard::insert_entry` method for inserting with preload support.

The implementation uses a circular buffer to efficiently manage
preallocated nodes. When an insertion would fail due to ENOMEM, the
XArray state API automatically consumes a preallocated node from the
buffer if available.

Export `radix_tree_node_ctor` from C to enable Rust code to work with the
radix tree node cache.

Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 include/linux/radix-tree.h      |   3 +
 lib/radix-tree.c                |   5 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/xarray.rs           | 172 +++++++++++++++++++++++++++++++++++-----
 rust/kernel/xarray/entry.rs     |  29 ++++---
 rust/kernel/xarray/preload.rs   |   3 +
 6 files changed, 185 insertions(+), 30 deletions(-)

diff --git a/include/linux/radix-tree.h b/include/linux/radix-tree.h
index eae67015ce51a..c3699f12b070c 100644
--- a/include/linux/radix-tree.h
+++ b/include/linux/radix-tree.h
@@ -469,4 +469,7 @@ static __always_inline void __rcu **radix_tree_next_slot(void __rcu **slot,
 	     slot = radix_tree_next_slot(slot, iter,			\
 				RADIX_TREE_ITER_TAGGED | tag))
 
+
+void radix_tree_node_ctor(void *arg);
+
 #endif /* _LINUX_RADIX_TREE_H */
diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index 976b9bd02a1b5..b642f2775e89c 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -33,6 +33,7 @@
  * Radix tree node cache.
  */
 struct kmem_cache *radix_tree_node_cachep;
+EXPORT_SYMBOL(radix_tree_node_cachep);
 
 /*
  * The radix tree is variable-height, so an insert operation not only has
@@ -1566,14 +1567,14 @@ void idr_destroy(struct idr *idr)
 }
 EXPORT_SYMBOL(idr_destroy);
 
-static void
-radix_tree_node_ctor(void *arg)
+void radix_tree_node_ctor(void *arg)
 {
 	struct radix_tree_node *node = arg;
 
 	memset(node, 0, sizeof(*node));
 	INIT_LIST_HEAD(&node->private_list);
 }
+EXPORT_SYMBOL(radix_tree_node_ctor);
 
 static int radix_tree_cpu_dead(unsigned int cpu)
 {
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 58605c32e8102..652f08ad888cd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -118,6 +118,9 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
 const size_t RUST_CONST_HELPER_XAS_RESTART = (size_t)XAS_RESTART;
+const size_t RUST_CONST_HELPER_XA_CHUNK_SHIFT = XA_CHUNK_SHIFT;
+const size_t RUST_CONST_HELPER_XA_CHUNK_SIZE = XA_CHUNK_SIZE;
+extern struct kmem_cache *radix_tree_node_cachep;
 
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
 const vm_flags_t RUST_CONST_HELPER_VM_READ = VM_READ;
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 8c10e8fd76f15..89bf531308c88 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -5,6 +5,7 @@
 //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
 
 use core::{
+    convert::Infallible,
     iter,
     marker::PhantomData,
     pin::Pin,
@@ -23,11 +24,17 @@
     bindings,
     build_assert, //
     error::{
+        code::*,
         to_result,
         Error,
         Result, //
     },
     ffi::c_void,
+    mm::sheaf::{
+        KMemCache,
+        SBox,
+        StaticSheaf, //
+    },
     types::{
         ForeignOwnable,
         NotThreadSafe,
@@ -35,12 +42,54 @@
     },
 };
 use pin_init::{
+    init,
     pin_data,
     pin_init,
     pinned_drop,
+    Init,
     PinInit, //
 };
 
+/// Sheaf of preallocated [`XArray`] nodes.
+pub type XArraySheaf<'a> = StaticSheaf<'a, XArrayNode>;
+
+/// Returns a reference to the global XArray node cache.
+///
+/// This provides access to the kernel's `radix_tree_node_cachep`, which is the
+/// slab cache used for allocating internal XArray nodes. This cache can be used
+/// to create sheaves for preallocating XArray nodes.
+pub fn xarray_kmem_cache() -> &'static KMemCache<XArrayNode> {
+    // SAFETY: `radix_tree_node_cachep` is a valid, statically initialized
+    // kmem_cache that remains valid for the lifetime of the kernel. The cache
+    // is configured for `xa_node` objects which match our `XArrayNode` type.
+    unsafe { KMemCache::from_raw(bindings::radix_tree_node_cachep) }
+}
+
+/// An preallocated XArray node.
+///
+/// This represents a single preallocated internal node for an XArray.
+pub struct XArrayNode {
+    node: Opaque<bindings::xa_node>,
+}
+
+impl kernel::mm::sheaf::KMemCacheInit<XArrayNode> for XArrayNode {
+    fn init() -> impl Init<Self, Infallible> {
+        init!(Self {
+            // SAFETY:
+            // - This initialization cannot fail and will never return `Err`.
+            // - The xa_node does not move during initalization.
+            node <- unsafe {
+                pin_init::init_from_closure(
+                    |place: *mut Opaque<bindings::xa_node>| -> Result<(), Infallible> {
+                        bindings::radix_tree_node_ctor(place.cast::<c_void>());
+                        Ok(())
+                    },
+                )
+            }
+        })
+    }
+}
+
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
 /// This is similar to a [`crate::alloc::kvec::Vec<Option<T>>`], but more efficient when there are
@@ -137,15 +186,22 @@ fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> + '_ {
         let mut index = 0;
 
         // SAFETY: `self.xa` is always valid by the type invariant.
-        iter::once(unsafe {
-            bindings::xa_find(self.xa.get(), &mut index, usize::MAX, bindings::XA_PRESENT)
-        })
-        .chain(iter::from_fn(move || {
-            // SAFETY: `self.xa` is always valid by the type invariant.
-            Some(unsafe {
-                bindings::xa_find_after(self.xa.get(), &mut index, usize::MAX, bindings::XA_PRESENT)
-            })
-        }))
+        Iterator::chain(
+            iter::once(unsafe {
+                bindings::xa_find(self.xa.get(), &mut index, usize::MAX, bindings::XA_PRESENT)
+            }),
+            iter::from_fn(move || {
+                // SAFETY: `self.xa` is always valid by the type invariant.
+                Some(unsafe {
+                    bindings::xa_find_after(
+                        self.xa.get(),
+                        &mut index,
+                        usize::MAX,
+                        bindings::XA_PRESENT,
+                    )
+                })
+            }),
+        )
         .map_while(|ptr| NonNull::new(ptr.cast()))
     }
 
@@ -166,7 +222,6 @@ pub fn try_lock(&self) -> Option<Guard<'_, T>> {
     pub fn lock(&self) -> Guard<'_, T> {
         // SAFETY: `self.xa` is always valid by the type invariant.
         unsafe { bindings::xa_lock(self.xa.get()) };
-
         Guard {
             xa: self,
             _not_send: NotThreadSafe,
@@ -270,7 +325,7 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
     ///
     /// match guard.entry(42) {
     ///     Entry::Vacant(entry) => {
-    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
+    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?, None)?;
     ///     }
     ///     Entry::Occupied(_) => unreachable!("We did not insert an entry yet"),
     /// }
@@ -475,6 +530,45 @@ pub fn store(
             Ok(unsafe { T::try_from_foreign(old) })
         }
     }
+
+    /// Inserts a value and returns an occupied entry for further operations.
+    ///
+    /// If a value is already present, the operation fails.
+    ///
+    /// This method will not drop the XArray lock. If memory allocation is
+    /// required for the operation to succeed, the user should supply memory
+    /// through the `preload` argument.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// let value = KBox::new(0x1337u32, GFP_KERNEL)?;
+    /// let entry = guard.insert_entry(42, value, None)?;
+    /// let borrowed = entry.into_mut();
+    /// assert_eq!(borrowed, &0x1337);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn insert_entry<'b>(
+        &'b mut self,
+        index: usize,
+        value: T,
+        preload: Option<&mut XArraySheaf<'_>>,
+    ) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
+        match self.entry(index) {
+            Entry::Vacant(entry) => entry.insert_entry(value, preload),
+            Entry::Occupied(_) => Err(StoreError {
+                error: EBUSY,
+                value,
+            }),
+        }
+    }
 }
 
 /// Internal state for XArray iteration and entry operations.
@@ -489,6 +583,25 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
     state: bindings::xa_state,
 }
 
+impl<'a, 'b, T: ForeignOwnable> Drop for XArrayState<'a, 'b, T> {
+    fn drop(&mut self) {
+        if !self.state.xa_alloc.is_null() {
+            // SAFETY:
+            // - `xa_alloc` is only set via `SBox::into_ptr()` in `insert()` where
+            //   the node comes from an `XArraySheaf` backed by `radix_tree_node_cachep`.
+            // - `xa_alloc` points to a valid, initialized `XArrayNode`.
+            // - `XArrayState` has exclusive ownership of `xa_alloc`, and no other
+            //   `SBox` or reference exists for this value.
+            drop(unsafe {
+                SBox::<XArrayNode>::static_from_ptr(
+                    bindings::radix_tree_node_cachep,
+                    self.state.xa_alloc.cast(),
+                )
+            })
+        }
+    }
+}
+
 impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
     fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
         let ptr = access.xa.xa.get();
@@ -529,16 +642,37 @@ fn status(&self) -> Result {
         to_result(unsafe { bindings::xas_error(&self.state) })
     }
 
-    fn insert(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
+    fn insert(
+        &mut self,
+        value: T,
+        mut preload: Option<&mut XArraySheaf<'_>>,
+    ) -> Result<*mut c_void, StoreError<T>> {
         let new = T::into_foreign(value).cast();
 
-        // SAFETY: `self.state.state` is properly initialized and `new` came from `T::into_foreign`.
-        // We hold the xarray lock.
-        unsafe { bindings::xas_store(&mut self.state, new) };
-
-        self.status().map(|()| new).map_err(|error| {
-            // SAFETY: `new` came from `T::into_foreign` and `xas_store` does not take ownership of
-            // the value on error.
+        loop {
+            // SAFETY: `self.state` is properly initialized and `new` came from
+            // `T::into_foreign`. We hold the xarray lock.
+            unsafe { bindings::xas_store(&mut self.state, new) };
+
+            match self.status() {
+                Ok(()) => break Ok(new),
+                Err(ENOMEM) => {
+                    debug_assert!(self.state.xa_alloc.is_null());
+                    let node = match preload.as_mut().map(|sheaf| sheaf.alloc().ok_or(ENOMEM)) {
+                        None => break Err(ENOMEM),
+                        Some(Err(e)) => break Err(e),
+                        Some(Ok(node)) => node,
+                    };
+
+                    self.state.xa_alloc = node.into_ptr().cast();
+                    continue;
+                }
+                Err(e) => break Err(e),
+            }
+        }
+        .map_err(|error| {
+            // SAFETY: `new` came from `T::into_foreign` and `xas_store` does not take
+            // ownership of the value on error.
             let value = unsafe { T::from_foreign(new) };
             StoreError { value, error }
         })
diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
index 1b1c21bed7022..ff500be3832b7 100644
--- a/rust/kernel/xarray/entry.rs
+++ b/rust/kernel/xarray/entry.rs
@@ -3,6 +3,7 @@
 use super::{
     Guard,
     StoreError,
+    XArraySheaf,
     XArrayState, //
 };
 use core::ptr::NonNull;
@@ -29,9 +30,9 @@ impl<T: ForeignOwnable> Entry<'_, '_, T> {
     /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
-    ///
     /// let entry = guard.entry(42);
     /// assert_eq!(entry.is_occupied(), false);
+    /// drop(entry);
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
     /// let entry = guard.entry(42);
@@ -64,7 +65,8 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self {
     /// Returns a reference to the newly inserted value.
     ///
     /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray.
+    ///   represented by this entry are not present in the XArray and no memory
+    ///   is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     ///
@@ -79,7 +81,7 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self {
     ///
     /// if let Entry::Vacant(entry) = guard.entry(42) {
     ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
-    ///     let borrowed = entry.insert(value)?;
+    ///     let borrowed = entry.insert(value, None)?;
     ///     assert_eq!(*borrowed, 0x1337);
     /// }
     ///
@@ -87,8 +89,12 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self {
     ///
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
-    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
-        let new = self.state.insert(value)?;
+    pub fn insert(
+        mut self,
+        value: T,
+        preload: Option<&mut XArraySheaf<'_>>,
+    ) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
+        let new = self.state.insert(value, preload)?;
 
         // SAFETY: `new` came from `T::into_foreign`. The entry has exclusive
         // ownership of `new` as it holds a mutable reference to `Guard`.
@@ -98,7 +104,8 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     /// Inserts a value and returns an occupied entry representing the newly inserted value.
     ///
     /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray.
+    ///   represented by this entry are not present in the XArray and no memory
+    ///   is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     /// # Examples
@@ -112,7 +119,7 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     ///
     /// if let Entry::Vacant(entry) = guard.entry(42) {
     ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
-    ///     let occupied = entry.insert_entry(value)?;
+    ///     let occupied = entry.insert_entry(value, None)?;
     ///     assert_eq!(occupied.index(), 42);
     /// }
     ///
@@ -120,8 +127,12 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     ///
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
-    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
-        let new = self.state.insert(value)?;
+    pub fn insert_entry(
+        mut self,
+        value: T,
+        preload: Option<&mut XArraySheaf<'_>>,
+    ) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
+        let new = self.state.insert(value, preload)?;
 
         Ok(OccupiedEntry::<'a, 'b, T> {
             state: self.state,
diff --git a/rust/kernel/xarray/preload.rs b/rust/kernel/xarray/preload.rs
new file mode 100644
index 0000000000000..745709579a265
--- /dev/null
+++ b/rust/kernel/xarray/preload.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;

-- 
2.51.2


