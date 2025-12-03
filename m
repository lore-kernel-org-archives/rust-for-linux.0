Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7F2E542C;
	Wed,  3 Dec 2025 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800857; cv=none; b=DP9/VPCgZFVVtYd49lPV3eLf7QrEjYXqMuTFtHeO3dC4ndyj2xN3S9hMcFWEBPk0VXEPCuqwTKIl7F5Ef2Itx7peuUPZMUcdpWElgOBbG2OZmmD2Q2wZlj594wTiOyF8zZz0ePMTbeRVFsYauc+FZOmi5xl4JUTbb1omElORTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800857; c=relaxed/simple;
	bh=1os19qZifO9cV0VPyklvVdll4arK3x5FIl8tZk47svo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWiUd7ffGArpXdcP1ONRsbIRMdDzLvwCNGUNF51g8iNdBFl0iORWEQ4ORD5dLuyRq7fBuiVzRcU0ypJNOXTjnhmy7vo11HZp1OmVzymjcwyxp5yRsWZpkv4TRn1dUVMq9IVGuy05OJjrnpCWZ53FPL0ltLVyxhKUGr74ruLu3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fab38MwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fab38MwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E3EC116B1;
	Wed,  3 Dec 2025 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800857;
	bh=1os19qZifO9cV0VPyklvVdll4arK3x5FIl8tZk47svo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fab38MwMqZqm39NTaP1gwfdFXpg9rVGsfZVcizMc20IRtGyx3SwNnn3WDvyOaGuZG
	 MwTjEGzT2/02b4hhg9SrO83NbjHhi4OC49gxPxOIvt3EvOkIceda9OYnEDXQAtOs1X
	 txntuwBxnmR/TSZgLmUiQwWVBU2835VRNUBgJhxaxxBKxkwS5y/S1cZMdc//Aags+k
	 4T6QJ62Ad02LLmKsEGsdMMc9w9zrhtTSD+9xORKLt0POsFqHlBONGGMNSkm74OuvWY
	 D81gVLwkFT1ja8wS/Ne4hXkBzfxHrGHWm3FpYJW2w2eDje1CVr4ueLE/zmFb6hG7bb
	 jISCxCdN6LAYg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:38 +0100
Subject: [PATCH 08/10] rust: xarray: add entry API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21122;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=1os19qZifO9cV0VPyklvVdll4arK3x5FIl8tZk47svo=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkwL6qCDMaIACz5QYyXPhq4yybbBRt1F5yjb
 mIz+BLqHemJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5MAAKCRDhuBo+eShj
 d94kD/94kr7Xivn3Kzj68xLGesxfFlvbb24bLYseNpUMVs8WDALi377xzYbyBdOtN+s1MFmuBNB
 xqjDibBco3noZttP0tyViXg/b4BqYMhBZmzt1XohhTt8dJzhODjXxPQlNSlxC2xxy4bhWpOlZpw
 j5tqGyDlri9Jv2m6+VRL40GcDnju+aS/KWfd9fhM5EM5x9RbQRaKO/33gJpRBn6OPsCfNfN8JC4
 /zvQ1I9LWEhjrgRE7/P3QFhtT0w2nLnucw9eLIDaNat3N9WZwtclJajPTBVHhN2zt7VXriCFrlo
 KC0oxMio+BRI7RejNfAR3FaPBaWpsXuh4eQ0VH/z81NASbXmHWz4WV4J/ABykKMnrlS1IkhR+fp
 zVNPHHrJYDXMcsnNsn6tRp6HBXmJZbfFascQcETrKQUFZQO5DzpUOn3lpj18ygLfcqgOO+3E/9L
 QyX045BnlBXCk8yAd7IUxUIkid4VmTAC3eS/uYvIkm788heIscfEY6C6kSC9LbYyLciItlAMDju
 7lkrCfZkEm5q3VPja+2PR9Lw7YckCtR4VbwcA6+87hdumE17Weab4OXQHNQpKuCkZuQFJ70oCks
 DRjdcNg+Ajv6xBKKZidZp7tm2jIobggSje37ZjxmABF5T30j0CCjvXGUgaw5IjjOFOwcLnwbbJd
 z5eUdYKc4EYEW4Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an Entry API for XArray that provides ergonomic access to array
slots that may be vacant or occupied. The API follows the pattern of
Rust's standard library HashMap entry API, allowing efficient
conditional insertion and modification of entries.

The implementation uses the XArray state API (`xas_*` functions) for
efficient operations without requiring multiple lookups. Helper
functions are added to rust/helpers/xarray.c to wrap C macros that are
not directly accessible from Rust.

Also update MAINTAINERS to cover the new rust files.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS                 |   1 +
 rust/helpers/xarray.c       |  17 ++
 rust/kernel/xarray.rs       | 112 +++++++++++++
 rust/kernel/xarray/entry.rs | 376 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 506 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8f06145fb54c..79d4c9c9b2b63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27909,6 +27909,7 @@ B:	https://github.com/Rust-for-Linux/linux/issues
 C:	https://rust-for-linux.zulipchat.com
 T:	git https://github.com/Rust-for-Linux/linux.git xarray-next
 F:	rust/kernel/xarray.rs
+F:	rust/kernel/xarray/
 
 XBOX DVD IR REMOTE
 M:	Benjamin Valentin <benpicco@googlemail.com>
diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 60b299f11451d..425a6cc494734 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
 {
 	return xa_unlock(xa);
 }
+
+void *rust_helper_xas_result(struct xa_state *xas, void *curr)
+{
+	if (xa_err(xas->xa_node))
+		curr = xas->xa_node;
+	return curr;
+}
+
+void *rust_helper_xa_zero_to_null(void *entry)
+{
+	return xa_is_zero(entry) ? NULL : entry;
+}
+
+int rust_helper_xas_error(const struct xa_state *xas)
+{
+	return xas_error(xas);
+}
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 9d4589979fd1d..2b8d56c81e36b 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -13,11 +13,17 @@
         NonNull, //
     },
 };
+pub use entry::{
+    Entry,
+    OccupiedEntry,
+    VacantEntry, //
+};
 use kernel::{
     alloc,
     bindings,
     build_assert, //
     error::{
+        to_result,
         Error,
         Result, //
     },
@@ -255,6 +261,35 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
     }
 
+    /// Gets an entry for the specified index, which can be vacant or occupied.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// assert_eq!(guard.contains_index(42), false);
+    ///
+    /// match guard.get_entry(42) {
+    ///     Entry::Vacant(entry) => {
+    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
+    ///     }
+    ///     Entry::Occupied(_) => unreachable!("We did not insert an entry yet"),
+    /// }
+    ///
+    /// assert_eq!(guard.get(42), Some(&0x1337));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn get_entry<'b>(&'b mut self, index: usize) -> Entry<'a, 'b, T> {
+        match self.load(index) {
+            None => Entry::Vacant(VacantEntry::new(self, index)),
+            Some(ptr) => Entry::Occupied(OccupiedEntry::new(self, index, ptr)),
+        }
+    }
+
     fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)> {
         let mut state = XArrayState::new(self, index);
         // SAFETY: `state.state` is always valid by the type invariant of
@@ -320,6 +355,76 @@ pub fn find_next_mut(&mut self, index: usize) -> Option<(usize, T::BorrowedMut<'
             .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(ptr.as_ptr()) }))
     }
 
+    /// Finds the next occupied entry starting from the given index.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// if let Some(entry) = guard.find_next_entry(5) {
+    ///     assert_eq!(entry.index(), 10);
+    ///     let value = entry.remove();
+    ///     assert_eq!(*value, 10);
+    /// }
+    ///
+    /// assert_eq!(guard.get(10), None);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn find_next_entry<'b>(&'b mut self, index: usize) -> Option<OccupiedEntry<'a, 'b, T>> {
+        let mut state = XArrayState::new(self, index);
+
+        // SAFETY: `state.state` is properly initialized by XArrayState::new and the caller holds
+        // the lock.
+        let ptr = NonNull::new(unsafe { bindings::xas_find(&mut state.state, usize::MAX) })?;
+
+        Some(OccupiedEntry { state, ptr })
+    }
+
+    /// Finds the next occupied entry starting at the given index, wrapping around.
+    ///
+    /// Searches for an entry starting at `index` up to the maximum index. If no entry
+    /// is found, wraps around and searches from index 0 up to `index`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    /// let entry = guard.find_next_entry_circular(101);
+    /// assert_eq!(entry.map(|e| e.index()), Some(100));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn find_next_entry_circular<'b>(
+        &'b mut self,
+        index: usize,
+    ) -> Option<OccupiedEntry<'a, 'b, T>> {
+        let mut state = XArrayState::new(self, index);
+
+        // SAFETY: `state.state` is properly initialized by XArrayState::new and the caller holds
+        // the lock.
+        let ptr = NonNull::new(unsafe { bindings::xas_find(&mut state.state, usize::MAX) })
+            .or_else(|| {
+                state.state.xa_node = bindings::XAS_RESTART as *mut bindings::xa_node;
+                state.state.xa_index = 0;
+                // SAFETY: `state.state` is properly initialized and by type invariant, we hold the
+                // xarray lock.
+                NonNull::new(unsafe { bindings::xas_find(&mut state.state, index) })
+            })?;
+
+        Some(OccupiedEntry { state, ptr })
+    }
+
     /// Removes and returns the element at the given index.
     pub fn remove(&mut self, index: usize) -> Option<T> {
         // SAFETY:
@@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
             },
         }
     }
+
+    fn status(&self) -> Result {
+        // SAFETY: `self.state` is properly initialized and valid.
+        to_result(unsafe { bindings::xas_error(&self.state) })
+    }
 }
 
+mod entry;
+
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.
 unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
 
diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
new file mode 100644
index 0000000000000..1268dc35bac58
--- /dev/null
+++ b/rust/kernel/xarray/entry.rs
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::{
+    Guard,
+    StoreError,
+    XArrayState, //
+};
+use core::ptr::NonNull;
+use kernel::{
+    prelude::*,
+    types::ForeignOwnable, //
+};
+
+/// Represents either a vacant or occupied entry in an XArray.
+pub enum Entry<'a, 'b, T: ForeignOwnable> {
+    /// A vacant entry that can have a value inserted.
+    Vacant(VacantEntry<'a, 'b, T>),
+    /// An occupied entry containing a value.
+    Occupied(OccupiedEntry<'a, 'b, T>),
+}
+
+impl<T: ForeignOwnable> Entry<'_, '_, T> {
+    /// Returns true if this entry is occupied.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    ///
+    /// let entry = guard.get_entry(42);
+    /// assert_eq!(entry.is_occupied(), false);
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    /// let entry = guard.get_entry(42);
+    /// assert_eq!(entry.is_occupied(), true);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn is_occupied(&self) -> bool {
+        matches!(self, Entry::Occupied(_))
+    }
+}
+
+/// A view into a vacant entry in an XArray.
+pub struct VacantEntry<'a, 'b, T: ForeignOwnable> {
+    state: XArrayState<'a, 'b, T>,
+}
+
+impl<'a, 'b, T> VacantEntry<'a, 'b, T>
+where
+    T: ForeignOwnable,
+{
+    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self {
+        Self {
+            state: XArrayState::new(guard, index),
+        }
+    }
+
+    fn insert_internal(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
+        let new = T::into_foreign(value).cast();
+
+        // SAFETY: `self.state.state` is properly initialized and `new` came from `T::into_foreign`.
+        // We hold the xarray lock.
+        unsafe { bindings::xas_store(&mut self.state.state, new) };
+
+        self.state.status().map(|()| new).map_err(|error| {
+            // SAFETY: `new` came from `T::into_foreign` and `xas_store` does not take ownership of
+            // the value on error.
+            let value = unsafe { T::from_foreign(new) };
+            StoreError { value, error }
+        })
+    }
+
+    /// Inserts a value into this vacant entry.
+    ///
+    /// Returns a reference to the newly inserted value.
+    ///
+    /// - This method will fail if the nodes on the path to the index
+    ///   represented by this entry are not present in the XArray.
+    /// - This method will not drop the XArray lock.
+    ///
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// if let Entry::Vacant(entry) = guard.get_entry(42) {
+    ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
+    ///     let borrowed = entry.insert(value)?;
+    ///     assert_eq!(*borrowed, 0x1337);
+    /// }
+    ///
+    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, StoreError<T>> {
+        let new = self.insert_internal(value)?;
+
+        // SAFETY: `new` came from `T::into_foreign`. The entry has exclusive
+        // ownership of `new` as it holds a mutable reference to `Guard`.
+        Ok(unsafe { T::borrow_mut(new) })
+    }
+
+    /// Inserts a value and returns an occupied entry representing the newly inserted value.
+    ///
+    /// - This method will fail if the nodes on the path to the index
+    ///   represented by this entry are not present in the XArray.
+    /// - This method will not drop the XArray lock.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// if let Entry::Vacant(entry) = guard.get_entry(42) {
+    ///     let value = KBox::new(0x1337u32, GFP_KERNEL)?;
+    ///     let occupied = entry.insert_entry(value)?;
+    ///     assert_eq!(occupied.index(), 42);
+    /// }
+    ///
+    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'a, 'b, T>, StoreError<T>> {
+        let new = self.insert_internal(value)?;
+
+        Ok(OccupiedEntry::<'a, 'b, T> {
+            state: self.state,
+            // SAFETY: `new` came from `T::into_foreign` and is guaranteed non-null.
+            ptr: unsafe { core::ptr::NonNull::new_unchecked(new) },
+        })
+    }
+
+    /// Returns the index of this vacant entry.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// if let Entry::Vacant(entry) = guard.get_entry(42) {
+    ///     assert_eq!(entry.index(), 42);
+    /// }
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn index(&self) -> usize {
+        self.state.state.xa_index
+    }
+}
+
+/// A view into an occupied entry in an XArray.
+pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
+    pub(crate) state: XArrayState<'a, 'b, T>,
+    pub(crate) ptr: NonNull<c_void>,
+}
+
+impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
+where
+    T: ForeignOwnable,
+{
+    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr: NonNull<c_void>) -> Self {
+        Self {
+            state: XArrayState::new(guard, index),
+            ptr,
+        }
+    }
+
+    /// Removes the value from this occupied entry and returns it, consuming the entry.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
+    ///
+    /// if let Entry::Occupied(entry) = guard.get_entry(42) {
+    ///     let value = entry.remove();
+    ///     assert_eq!(*value, 0x1337);
+    /// }
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn remove(mut self) -> T {
+        // NOTE: Storing NULL to an occupied slot never fails.
+        // SAFETY: `self.state.state` is properly initialized and valid for XAS operations.
+        let ptr = unsafe {
+            bindings::xas_result(
+                &mut self.state.state,
+                bindings::xa_zero_to_null(bindings::xas_store(
+                    &mut self.state.state,
+                    core::ptr::null_mut(),
+                )),
+            )
+        };
+
+        // SAFETY: `ptr` is a valid return value from xas_result.
+        let errno = unsafe { bindings::xa_err(ptr) };
+        debug_assert!(errno == 0);
+
+        // SAFETY:
+        // - `ptr` came from `T::into_foreign`.
+        // - As this method takes self by value, the lifetimes of any [`T::Borrowed`] and
+        //   [`T::BorrowedMut`] we have created must have ended.
+        unsafe { T::from_foreign(ptr.cast()) }
+    }
+
+    /// Returns the index of this occupied entry.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// if let Entry::Occupied(entry) = guard.get_entry(42) {
+    ///     assert_eq!(entry.index(), 42);
+    /// }
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn index(&self) -> usize {
+        self.state.state.xa_index
+    }
+
+    /// Replaces the value in this occupied entry and returns the old value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// if let Entry::Occupied(mut entry) = guard.get_entry(42) {
+    ///     let new_value = KBox::new(0x9999u32, GFP_KERNEL)?;
+    ///     let old_value = entry.insert(new_value);
+    ///     assert_eq!(*old_value, 0x1337);
+    /// }
+    ///
+    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn insert(&mut self, value: T) -> T {
+        // NOTE: Storing to an occupied slot never fails.
+        let new = T::into_foreign(value).cast();
+        // SAFETY: `new` came from `T::into_foreign` and is guaranteed non-null.
+        self.ptr = unsafe { NonNull::new_unchecked(new) };
+
+        // SAFETY: `self.state.state` is properly initialized and valid for XAS operations.
+        let old = unsafe {
+            bindings::xas_result(
+                &mut self.state.state,
+                bindings::xa_zero_to_null(bindings::xas_store(&mut self.state.state, new)),
+            )
+        };
+
+        // SAFETY: `old` is a valid return value from xas_result.
+        let errno = unsafe { bindings::xa_err(old) };
+        debug_assert!(errno == 0);
+
+        // SAFETY:
+        // - `ptr` came from `T::into_foreign`.
+        // - As this method takes self by value, the lifetimes of any [`T::Borrowed`] and
+        //   [`T::BorrowedMut`] we have created must have ended.
+        unsafe { T::from_foreign(old) }
+    }
+
+    /// Converts this occupied entry into a mutable reference to the value in the slot represented
+    /// by the entry.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// if let Entry::Occupied(entry) = guard.get_entry(42) {
+    ///     let value_ref = entry.into_mut();
+    ///     *value_ref = 0x9999;
+    /// }
+    ///
+    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn into_mut(self) -> T::BorrowedMut<'b> {
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
+    }
+
+    /// Swaps the value in this entry with the provided value.
+    ///
+    /// Returns the old value that was in the entry.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
+    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// let mut guard = xa.lock();
+    ///
+    /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// if let Entry::Occupied(mut entry) = guard.get_entry(42) {
+    ///     let old_value = entry.swap(200u32);
+    ///     assert_eq!(old_value, 100);
+    ///     assert_eq!(*entry, 200);
+    /// }
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn swap<U>(&mut self, mut other: U) -> U
+    where
+        T: for<'c> ForeignOwnable<Borrowed<'c> = &'c U, BorrowedMut<'c> = &'c mut U>,
+    {
+        use core::ops::DerefMut;
+        core::mem::swap(self.deref_mut(), &mut other);
+        other
+    }
+}
+
+impl<T, U> core::ops::Deref for OccupiedEntry<'_, '_, T>
+where
+    T: for<'a> ForeignOwnable<Borrowed<'a> = &'a U, BorrowedMut<'a> = &'a mut U>,
+{
+    type Target = U;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        unsafe { T::borrow(self.ptr.as_ptr()) }
+    }
+}
+
+impl<T, U> core::ops::DerefMut for OccupiedEntry<'_, '_, T>
+where
+    T: for<'a> ForeignOwnable<Borrowed<'a> = &'a U, BorrowedMut<'a> = &'a mut U>,
+{
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
+    }
+}

-- 
2.51.2


