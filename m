Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AA2E2840;
	Wed,  3 Dec 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800847; cv=none; b=gCRPOpnLXQbt7bGW2Sbvpe+3TNF8jJjXKWOmFbdQa0WrSGr05uuWBi+OazQa9nSA/atClQ8Lkjpy6LPkDwc1iIlWgUV5nhkN1qEgnaTI5UTm0B8NAx2tfg8Pe7513X5NEE81NkJvAUARSXVsCFxELkSabXIZoO1tvFOrA6z1iF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800847; c=relaxed/simple;
	bh=aQzhqyZ8EjeS0wr4dptsBSQSvp9w3IXPV4HbdoyC0IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4S9HAcLUl3S0bgrGBAV9v/YHDts/RZudQowcGjh2CBEDdfTh5dWL5xr2ubQ+1bNe0M8vQM68d9VidKb8EfRPrqcBgErKWiuDsTwUOlZguuhdrByiZulwNo1igeM7KaZsMLLKWgg7o0ibv2fwmGtbjlNMy2LamLGgGsRznOdvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQYcr3wS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQYcr3wS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C405C4CEF5;
	Wed,  3 Dec 2025 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800846;
	bh=aQzhqyZ8EjeS0wr4dptsBSQSvp9w3IXPV4HbdoyC0IU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OQYcr3wSXIzfc4sPaZo4TpqxUJ35szDgRW3OrV13ElJ8Rhlhc1pLx9dAjXBM+PRXe
	 HBoSCD+TjHg3Xy9e3Yc5WdY5H880DdriDEo+uPOAd7ALbdAno6n/9fKrN3L4oi6JTE
	 8wv0TicoydgX1q8rbGhiNBfhSIGdLS86pMXXDI6X7XyAs1PQlyZ/QkSrijKj+0eLEa
	 eXWutK1ERZTWVeX3zdVDN7v1BuWVQzuydfPNK5BRByjIN63nPYqp5rnhCW2NbAuJnt
	 Uh6gn3COumhVpTOzkPZ4SQqRPhCalE9wRCqAffUodTiLy01fvpMnpIwgbWB9tivGFp
	 YdU+rY3P5z8bQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:39 +0100
Subject: [PATCH 09/10] rust: xarray: add preload API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-9-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18702;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=aQzhqyZ8EjeS0wr4dptsBSQSvp9w3IXPV4HbdoyC0IU=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkx+pU8KZErsEBjl6tiaEm9yPICvbYLjvKdC
 1DVeQH4gKuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5MQAKCRDhuBo+eShj
 d4HrEAC/dxwKHs893rTuzE1B5cKORJNzjAPSkpvkT6wLdwAMjcJwraOAVW8PKYrQemGU5PWRaBf
 qTi6kH+KpRTHPUdtgbK05SRDN36tn2sEZQ3yj682Hh3S9JFzfXvFPZ92j89aVs8r9g0yu92ujiK
 vXuJh9/VWNafwqZhd2HIDy8pQMC6pwzTBzouiQld6MzUnkGoz7aWyK3oTYRuAaDGzVk3nEv/Wjk
 OnlE5hDnlN9qTxbZddWt1riuK8DgBSWXgCYB7qpGwqvG/4KndVyG/N5hu07l3RMUGYaATo+z0jT
 5opM7oSqXjQW+vCemkINk1sKwpNlQNa0m++q9PDsgPR451Gzpnmy92g9BoVNegzo/bQL2oNVEJ6
 IXWVXhRYF8XEaBc27Nkqz5mucyTluKZ5oGX1QnUMsSLDrbVsF4jfzLniozPhfMFsz/4GLRJ8tlI
 91jF01lZOp3d4vqHUIpxhdjmLylG4W89aNeRzWv3kegrl4Vk0QX0/YFOU8TWMfryYHMFlpi4rIn
 swVH8Mr0Tb96DQ8axI9l01FvXnEImgdGID+ZoLlszZDPXEsCytlxqpdrONSOYeaUG5JZ2Ak10lb
 Nf31gvc+tIaFcNC+ram9FJmcxIgZjUAgeFmuMCdAtkb9q4IXSqgkXr3j1QcC9bgGLASdT+4x5Mq
 bRJ2j5tDhK9UQsQ==
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

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/xarray.rs           |  58 ++++++++++-
 rust/kernel/xarray/entry.rs     |  64 +++++++++---
 rust/kernel/xarray/preload.rs   | 217 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 324 insertions(+), 18 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 86bca946faff0..8e9f8762d5e6e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -110,6 +110,9 @@ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
 const size_t RUST_CONST_HELPER_XAS_RESTART = (size_t)XAS_RESTART;
+const size_t RUST_CONST_HELPER_XA_CHUNK_SHIFT = XA_CHUNK_SHIFT;
+const size_t RUST_CONST_HELPER_XA_CHUNK_SIZE = XA_CHUNK_SIZE;
+extern struct kmem_cache *radix_tree_node_cachep;
 
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 2b8d56c81e36b..a405f2b6fdcad 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -23,6 +23,7 @@
     bindings,
     build_assert, //
     error::{
+        code::*,
         to_result,
         Error,
         Result, //
@@ -40,6 +41,12 @@
     pinned_drop,
     PinInit, //
 };
+pub use preload::{
+    XArrayPreloadBuffer,
+    XArrayPreloadNode, //
+};
+
+mod preload;
 
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
@@ -166,7 +173,6 @@ pub fn try_lock(&self) -> Option<Guard<'_, T>> {
     pub fn lock(&self) -> Guard<'_, T> {
         // SAFETY: `self.xa` is always valid by the type invariant.
         unsafe { bindings::xa_lock(self.xa.get()) };
-
         Guard {
             xa: self,
             _not_send: NotThreadSafe,
@@ -274,7 +280,7 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
     ///
     /// match guard.get_entry(42) {
     ///     Entry::Vacant(entry) => {
-    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
+    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?, None)?;
     ///     }
     ///     Entry::Occupied(_) => unreachable!("We did not insert an entry yet"),
     /// }
@@ -487,6 +493,45 @@ pub fn store(
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
+        preload: Option<&mut XArrayPreloadBuffer>,
+    ) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
+        match self.get_entry(index) {
+            Entry::Vacant(entry) => entry.insert_entry(value, preload),
+            Entry::Occupied(_) => Err(StoreError {
+                error: EBUSY,
+                value,
+            }),
+        }
+    }
 }
 
 /// Internal state for XArray iteration and entry operations.
@@ -501,6 +546,15 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
     state: bindings::xa_state,
 }
 
+impl<'a, 'b, T: ForeignOwnable> Drop for XArrayState<'a, 'b, T> {
+    fn drop(&mut self) {
+        if !self.state.xa_alloc.is_null() {
+            // SAFETY: `xa_alloc` is a valid pointer to a preallocated node when non-null.
+            drop(unsafe { XArrayPreloadNode::from_raw(self.state.xa_alloc) })
+        }
+    }
+}
+
 impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
     fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
         let ptr = access.xa.xa.get();
diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
index 1268dc35bac58..2d6ef4781f47d 100644
--- a/rust/kernel/xarray/entry.rs
+++ b/rust/kernel/xarray/entry.rs
@@ -3,6 +3,7 @@
 use super::{
     Guard,
     StoreError,
+    XArrayPreloadBuffer,
     XArrayState, //
 };
 use core::ptr::NonNull;
@@ -29,9 +30,9 @@ impl<T: ForeignOwnable> Entry<'_, '_, T> {
     /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
-    ///
     /// let entry = guard.get_entry(42);
     /// assert_eq!(entry.is_occupied(), false);
+    /// drop(entry);
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
     /// let entry = guard.get_entry(42);
@@ -59,16 +60,37 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self {
         }
     }
 
-    fn insert_internal(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
+    fn insert_internal(
+        &mut self,
+        value: T,
+        mut preload: Option<&mut XArrayPreloadBuffer>,
+    ) -> Result<*mut c_void, StoreError<T>> {
         let new = T::into_foreign(value).cast();
 
-        // SAFETY: `self.state.state` is properly initialized and `new` came from `T::into_foreign`.
-        // We hold the xarray lock.
-        unsafe { bindings::xas_store(&mut self.state.state, new) };
+        loop {
+            // SAFETY: `self.state.state` is properly initialized and `new` came from
+            // `T::into_foreign`. We hold the xarray lock.
+            unsafe { bindings::xas_store(&mut self.state.state, new) };
+
+            match self.state.status() {
+                Ok(()) => break Ok(new),
+                Err(ENOMEM) => {
+                    debug_assert!(self.state.state.xa_alloc.is_null());
+                    let node = match preload.as_mut().map(|node| node.take_one().ok_or(ENOMEM)) {
+                        None => break Err(ENOMEM),
+                        Some(Err(e)) => break Err(e),
+                        Some(Ok(node)) => node,
+                    };
 
-        self.state.status().map(|()| new).map_err(|error| {
-            // SAFETY: `new` came from `T::into_foreign` and `xas_store` does not take ownership of
-            // the value on error.
+                    self.state.state.xa_alloc = node.into_raw();
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
@@ -79,7 +101,8 @@ fn insert_internal(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
     /// Returns a reference to the newly inserted value.
     ///
     /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray.
+    ///   represented by this entry are not present in the XArray and no memory
+    ///   is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     ///
@@ -94,7 +117,7 @@ fn insert_internal(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
     ///
     /// if let Entry::Vacant(entry) = guard.get_entry(42) {
     ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
-    ///     let borrowed = entry.insert(value)?;
+    ///     let borrowed = entry.insert(value, None)?;
     ///     assert_eq!(*borrowed, 0x1337);
     /// }
     ///
@@ -102,8 +125,12 @@ fn insert_internal(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
     ///
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
-    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
-        let new = self.insert_internal(value)?;
+    pub fn insert(
+        mut self,
+        value: T,
+        preload: Option<&mut XArrayPreloadBuffer>,
+    ) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
+        let new = self.insert_internal(value, preload)?;
 
         // SAFETY: `new` came from `T::into_foreign`. The entry has exclusive
         // ownership of `new` as it holds a mutable reference to `Guard`.
@@ -113,7 +140,8 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     /// Inserts a value and returns an occupied entry representing the newly inserted value.
     ///
     /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray.
+    ///   represented by this entry are not present in the XArray and no memory
+    ///   is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     /// # Examples
@@ -127,7 +155,7 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     ///
     /// if let Entry::Vacant(entry) = guard.get_entry(42) {
     ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
-    ///     let occupied = entry.insert_entry(value)?;
+    ///     let occupied = entry.insert_entry(value, None)?;
     ///     assert_eq!(occupied.index(), 42);
     /// }
     ///
@@ -135,8 +163,12 @@ pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
     ///
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
-    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
-        let new = self.insert_internal(value)?;
+    pub fn insert_entry(
+        mut self,
+        value: T,
+        preload: Option<&mut XArrayPreloadBuffer>,
+    ) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
+        let new = self.insert_internal(value, preload)?;
 
         Ok(OccupiedEntry::<'a, 'b, T> {
             state: self.state,
diff --git a/rust/kernel/xarray/preload.rs b/rust/kernel/xarray/preload.rs
new file mode 100644
index 0000000000000..964b16a0e6199
--- /dev/null
+++ b/rust/kernel/xarray/preload.rs
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+/// A buffer for preallocating XArray nodes.
+///
+/// This structure allows preallocating memory for XArray insertions to avoid
+/// allocation failures during operations where allocation is not desirable.
+pub struct XArrayPreloadBuffer {
+    nodes: KVec<*mut bindings::xa_node>,
+    size: usize,
+    head: usize,
+    tail: usize,
+}
+
+impl XArrayPreloadBuffer {
+    /// Creates a new preload buffer with capacity for the given number of leaf values.
+    ///
+    /// Inserting a leaf value into an [`XArray`] may require allocating a
+    /// number of internal nodes. This buffer will calculate the upper limit of
+    /// required internal nodes for inserting `entry_count` leaf values and use
+    /// that to size the buffer.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::XArrayPreloadBuffer};
+    /// let buffer = XArrayPreloadBuffer::new(10)?;
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    /// [`XArray`]: super::XArray
+    pub fn new(entry_count: usize) -> Result<Self> {
+        let node_count = entry_count
+            * ((usize::BITS as usize / bindings::XA_CHUNK_SHIFT)
+                + if (usize::BITS as usize % bindings::XA_CHUNK_SHIFT) == 0 {
+                    0
+                } else {
+                    1
+                });
+
+        let mut this = Self {
+            nodes: KVec::new(),
+            size: node_count + 1,
+            head: 0,
+            tail: 0,
+        };
+
+        for _ in 0..this.size {
+            this.nodes.push(core::ptr::null_mut(), GFP_KERNEL)?;
+        }
+
+        Ok(this)
+    }
+
+    /// Allocates internal nodes until the buffer is full.
+    pub fn preload(&mut self, flags: kernel::alloc::Flags) -> Result {
+        while !self.full() {
+            self.alloc(flags)?
+        }
+        Ok(())
+    }
+
+    /// Fills the buffer with preallocated nodes from the given vector.
+    ///
+    /// Nodes are moved from the vector into the buffer until the buffer is full
+    /// or the vector is empty.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{XArrayPreloadBuffer, XArrayPreloadNode}};
+    /// let mut buffer = XArrayPreloadBuffer::new(5)?;
+    /// let mut nodes = KVec::new();
+    /// nodes.push(XArrayPreloadNode::new(GFP_KERNEL)?, GFP_KERNEL)?;
+    /// buffer.preload_with(&mut nodes)?;
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn preload_with(&mut self, nodes: &mut KVec<XArrayPreloadNode>) -> Result {
+        while !self.full() {
+            if let Some(node) = nodes.pop() {
+                self.push(node)?
+            } else {
+                break;
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Returns `true` if the buffer is full and cannot accept more nodes.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{XArrayPreloadBuffer, XArrayPreloadNode}};
+    /// let mut buffer = XArrayPreloadBuffer::new(1)?;
+    /// if !buffer.full() {
+    ///     let count = buffer.free_count();
+    ///     let mut nodes = KVec::new();
+    ///     for _ in 0..count {
+    ///         nodes.push(XArrayPreloadNode::new(GFP_KERNEL)?, GFP_KERNEL)?;
+    ///     }
+    ///     buffer.preload_with(&mut nodes)?;
+    /// }
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn full(&self) -> bool {
+        (self.head + 1) % self.size != self.tail
+    }
+
+    fn empty(&self) -> bool {
+        self.head == self.tail
+    }
+
+    /// Returns the number of available slots in the buffer.
+    pub fn free_count(&self) -> usize {
+        (if self.head >= self.tail {
+            self.size - (self.head - self.tail)
+        } else {
+            (self.size - self.tail) + self.head
+        } - 1)
+    }
+
+    fn alloc(&mut self, flags: kernel::alloc::Flags) -> Result {
+        if self.full() {
+            return Err(ENOSPC);
+        }
+
+        self.push(XArrayPreloadNode::new(flags)?)?;
+
+        Ok(())
+    }
+
+    fn push(&mut self, node: XArrayPreloadNode) -> Result {
+        if self.full() {
+            return Err(ENOSPC);
+        }
+
+        self.nodes[self.head] = node.into_raw();
+        self.head = (self.head + 1) % self.size;
+
+        Ok(())
+    }
+
+    /// Removes and returns one preallocated node from the buffer.
+    ///
+    /// Returns `None` if the buffer is empty.
+    pub(crate) fn take_one(&mut self) -> Option<XArrayPreloadNode> {
+        if self.empty() {
+            return None;
+        }
+
+        let node = self.nodes[self.tail];
+        self.tail = (self.tail + 1) % self.size;
+
+        Some(XArrayPreloadNode(node))
+    }
+}
+
+impl Drop for XArrayPreloadBuffer {
+    fn drop(&mut self) {
+        while !self.empty() {
+            drop(self.take_one().expect("Not empty"));
+        }
+    }
+}
+
+/// A preallocated XArray node.
+///
+/// This represents a single preallocated internal node for an XArray.
+/// Nodes can be stored in an [`XArrayPreloadBuffer`] for later use.
+pub struct XArrayPreloadNode(*mut bindings::xa_node);
+
+impl XArrayPreloadNode {
+    /// Allocates a new XArray node.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::XArrayPreloadNode};
+    /// let node = XArrayPreloadNode::new(GFP_KERNEL)?;
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn new(flags: kernel::alloc::Flags) -> Result<Self> {
+        // SAFETY: `radix_tree_node_cachep` is a valid kmem cache for XArray nodes.
+        let ptr = unsafe {
+            bindings::kmem_cache_alloc_noprof(bindings::radix_tree_node_cachep, flags.as_raw())
+        };
+
+        if ptr.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY: `ptr` is non-null and was allocated from `radix_tree_node_cachep`.
+        Ok(unsafe { XArrayPreloadNode::from_raw(ptr.cast()) })
+    }
+
+    pub(crate) fn into_raw(self) -> *mut bindings::xa_node {
+        self.0
+    }
+
+    /// Creates an `XArrayPreloadNode` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to an XArray node allocated from `radix_tree_node_cachep`.
+    pub(crate) unsafe fn from_raw(ptr: *mut bindings::xa_node) -> Self {
+        Self(ptr)
+    }
+}
+
+impl Drop for XArrayPreloadNode {
+    fn drop(&mut self) {
+        // SAFETY: `self.0` is a valid pointer allocated from `radix_tree_node_cachep`.
+        unsafe { bindings::kmem_cache_free(bindings::radix_tree_node_cachep, self.0.cast()) }
+    }
+}

-- 
2.51.2


