Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8E301001;
	Fri,  6 Feb 2026 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412291; cv=none; b=qas/WC31Naf7xpuISY4RSGJ66KW5zclNBpMprR9u7+/0bHMfLwSkI4alRu5Kek/5C72Ljg5MF2V2IQ4EmJO+J7FYnm6cyc2c6lLgJFF9shog7t5OXpNH5IhA7+obXoGVI3ngBTH1UtAfbd8s1SWC23C8DOJM1yZmCttkVWWOmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412291; c=relaxed/simple;
	bh=tGpkTbkQCs2yz/lXZr74M2PLP6TLYGnHySlF4MFb55o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HME9eslVvlONWXpnC4yrWxZmvNZZWWCFKn/+LyGGf+G9sHSiwxKTLNuLjn4I9uqn2jAoi8wKiItzdr3DlktRU+YSxlJSN85wxBYQGTVjqv3EFmsPnalZPLTwDOPs9l121Am1ClGXXI+fq4hmChRNsSS6E3KKbOfKWpl7MKw0uVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuPDUGdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuPDUGdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087C7C116C6;
	Fri,  6 Feb 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412290;
	bh=tGpkTbkQCs2yz/lXZr74M2PLP6TLYGnHySlF4MFb55o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuPDUGdpXG+jRKfCI93WnWBECSxeffdZgPnpEszWgv2T1bPinnDaMUa+lOjEJngmY
	 zjuGhhZTfHXOgl0WUz0nFh7EM4nnmJRk2o5eSyI1ESCu8Dhka8o8mm+mjeYCHbrTwT
	 JUgZ5dWWKI5ShNDHb/LMGXULTzY0OpC+4Bb5uc+tmBE37hqGFuz87LD+XFRrrglgEr
	 4bAdKCf54TRYUSm5PHEaDoC4PX9V2sZn1w9tWREeV2+4BxsyeY7c/ENq2nRi/Sz2qJ
	 g+lpBVj6c+1R4YRUXbk6GYIG8tKARhbARaaKnpS+dDXGbWZrG8O207eoMumiTfF/lB
	 fS7WMxTZI2ydQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:54 +0100
Subject: [PATCH v2 08/11] rust: xarray: add entry API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-8-91c41673fd30@kernel.org>
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
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21192;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=tGpkTbkQCs2yz/lXZr74M2PLP6TLYGnHySlF4MFb55o=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljo+HSkSPWQgXAH0o0Hr5UYAUqzIz990zCWT
 ShAfYdQhOuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY6AAKCRDhuBo+eShj
 d+OPD/91TqFSj+c+q8fj/Fi1NQOKnSpT4wmiEHIgrUtQGTodDgDNAzsDBOJeG4/2kJNOE8FD28Z
 xOnjYAq4xnCgao/LaKfeDYXtkcaOzEs+pRoTXYV3PvU/XWdo8X2Hjw7SrRrNN00Pn1e1wb74gJ0
 zg29yImVFRHsiCkgXZWtSjCD1pgYlMJ7ZKDo8MT2Mq+bnuuUVjOueFe0jwaN+VMTNHOllcfKOe5
 Ew14uZZ5MY4P/n6lHxsEK6U/AZIuybzfVSmtVH+xiQ149btU6SFY62V0PqMZEOw8nQRf911zmEl
 g0GXxajdlmsiQCvdfzSogvSI1T3txaXiPLW4KFQcQDfZ4k39k+EvVJXwrr1Jne19Lra4AYZwaV8
 CsiHslLkfXrp8RvuSBOjupDgDPKZjpN95lpgynnGXmBsHmRzDtYj9gWqHnJP2Rfe/js0koJoRVE
 uhFDJcJlZ80QzZ55Txa+obw3OMzURDuIRiFkBvm5bB7sCAXAKeayVkXtJvcDEZyH6f7mu/8FmM9
 fh+xMXFMYuXNwoWWv8VjQZJ7vsKjHVtkpB7F0Wm3mX23u1ry6eBpq51Ibd7Mz6meo7lrtKndGkA
 kJsi8ltlPa4aPghRInIJbXBrmLQf0ibEsspDUIkLUlsnwr2XQijCaXp4ZqeIvZWcYDl5T9PvUWI
 TutdKnvBSe3FaHg==
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
 rust/kernel/xarray.rs       | 123 +++++++++++++++
 rust/kernel/xarray/entry.rs | 367 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 508 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b7..8202515c6065b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28361,6 +28361,7 @@ B:	https://github.com/Rust-for-Linux/linux/issues
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
index 656ec897a0c41..8c10e8fd76f15 100644
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
@@ -251,6 +257,35 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
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
+    /// match guard.entry(42) {
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
+    pub fn entry<'b>(&'b mut self, index: usize) -> Entry<'a, 'b, T> {
+        match self.load(index) {
+            None => Entry::Vacant(VacantEntry::new(self, index)),
+            Some(ptr) => Entry::Occupied(OccupiedEntry::new(self, index, ptr)),
+        }
+    }
+
     fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)> {
         XArrayState::new(self, index).load_next()
     }
@@ -312,6 +347,72 @@ pub fn find_next_mut(&mut self, index: usize) -> Option<(usize, T::BorrowedMut<'
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
+        let (_, ptr) = state.load_next()?;
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
@@ -422,8 +523,30 @@ fn load_next(&mut self) -> Option<(usize, NonNull<c_void>)> {
         let ptr = unsafe { bindings::xas_find(&raw mut self.state, usize::MAX) };
         NonNull::new(ptr).map(|ptr| (self.state.xa_index, ptr))
     }
+
+    fn status(&self) -> Result {
+        // SAFETY: `self.state` is properly initialized and valid.
+        to_result(unsafe { bindings::xas_error(&self.state) })
+    }
+
+    fn insert(&mut self, value: T) -> Result<*mut c_void, StoreError<T>> {
+        let new = T::into_foreign(value).cast();
+
+        // SAFETY: `self.state.state` is properly initialized and `new` came from `T::into_foreign`.
+        // We hold the xarray lock.
+        unsafe { bindings::xas_store(&mut self.state, new) };
+
+        self.status().map(|()| new).map_err(|error| {
+            // SAFETY: `new` came from `T::into_foreign` and `xas_store` does not take ownership of
+            // the value on error.
+            let value = unsafe { T::from_foreign(new) };
+            StoreError { value, error }
+        })
+    }
 }
 
+mod entry;
+
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.
 unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
 
diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
new file mode 100644
index 0000000000000..1b1c21bed7022
--- /dev/null
+++ b/rust/kernel/xarray/entry.rs
@@ -0,0 +1,367 @@
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
+    /// let entry = guard.entry(42);
+    /// assert_eq!(entry.is_occupied(), false);
+    ///
+    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    /// let entry = guard.entry(42);
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
+    /// if let Entry::Vacant(entry) = guard.entry(42) {
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
+        let new = self.state.insert(value)?;
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
+    /// if let Entry::Vacant(entry) = guard.entry(42) {
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
+        let new = self.state.insert(value)?;
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
+    /// if let Entry::Vacant(entry) = guard.entry(42) {
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
+    /// if let Entry::Occupied(entry) = guard.entry(42) {
+    ///     let value = entry.remove();
+    ///     assert_eq!(*value, 0x1337);
+    /// }
+    ///
+    /// assert_eq!(guard.get(42), None);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn remove(mut self) -> T {
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
+
+        // NOTE: Storing NULL to an occupied slot never fails. This is by design
+        // of the xarray data structure. If a slot is occupied, a store is a
+        // simple pointer swap.
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
+    /// if let Entry::Occupied(entry) = guard.entry(42) {
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
+    /// if let Entry::Occupied(mut entry) = guard.entry(42) {
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
+
+        // NOTE: Storing NULL to an occupied slot never fails. This is by design
+        // of the xarray data structure. If a slot is occupied, a store is a
+        // simple pointer swap.
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
+    /// if let Entry::Occupied(entry) = guard.entry(42) {
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
+    /// if let Entry::Occupied(mut entry) = guard.entry(42) {
+    ///     let mut other = 200u32;
+    ///     entry.swap(&mut other);
+    ///     assert_eq!(other, 100);
+    ///     assert_eq!(*entry, 200);
+    /// }
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn swap<U>(&mut self, other: &mut U)
+    where
+        T: for<'c> ForeignOwnable<Borrowed<'c> = &'c U, BorrowedMut<'c> = &'c mut U>,
+    {
+        use core::ops::DerefMut;
+        core::mem::swap(self.deref_mut(), other);
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


