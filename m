Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A464379990;
	Mon,  9 Feb 2026 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647994; cv=none; b=O/xtcZNzaSpCfT6n6yV4+S/f1iPbwMtRLE4899cumBNZsZgCPJI7tsF9tf5rKaecbrFCWqdpw4kG8VUp4eFW86sMlYqJ5GErXCRH40JhJT3IMgKPoFBZPCjQlJmEu/aOoLgq/DNXEGFhWYtW763VjlEtL/K5JIbrCdBYHvmjHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647994; c=relaxed/simple;
	bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAeVmXbUg9aK7+h79E0qrXNYz/iWPvJMHIbGZIf7aWzaYYWRjEg2KRMZyyO18a622igMf3895V9ZHml/mn2k/KkBS2iOiGfbVB5L0V0iEVkmZNxYDEqU4MVlq7IUILlPkjkQTxY84hxuiMMzE/V0BvHlerxoqeonR7WMTC0ZVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0LbIhu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0LbIhu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72255C19422;
	Mon,  9 Feb 2026 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647993;
	bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W0LbIhu3yXflRjlR51USLzE6TCZblrZPirDrUOTQtPBBtw8E+4tXEVs83O6SNUJ1b
	 yp6nZLa99Zuka8FviQlmEioGfKOP9SvbsquuhAHvTaT30J2/EpWzwX3vvFtiPwTBRT
	 0svmi+1DGm/1KkGXe2Nt8+K0GQemFVPx4VZVdsE4uTOTrFH0A1LHLT04fOmHqXUYMb
	 SdeLtezbZXJFSm/vhX4WVgZajI8YGyffgd3+mmlTfM0U8zDH2lk8bXrxjYvhJISkKM
	 Y/vETLiIsKg9eEjO78ENWxTiqprHdyGoexU7OIT0HH1yV9z2NIbtb5hEy9tK1LVxmX
	 whdxZYQjQJgjQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:12 +0100
Subject: [PATCH v3 07/12] rust: xarray: add `find_next` and `find_next_mut`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-7-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4023; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFb+WmuAcVCQgvEERtgQ/qOeo8uSZnzezgaA
 +8xw4pzCZmJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxWwAKCRDhuBo+eShj
 d4DhD/9wCbNkHivRJZdlO3SafsRrM1Jz/9FULnqXMomuVFOyx4R8DA04Vr1ryCJ05XWJyhekl4Z
 G5vVUO8k7DN6sWkUJEoaVgwaA+cAdqR6vETzYtNa8CNUYFrBH7F7IuNhOehoVVMRvTViVrfBiHn
 Omr9wEVK9MuXNHJWTwnGsLCVyGGgpqzlbwlL0r9HilBKQ2sJM4Ms/9G2LmyjDh8PExLTNxDxl/f
 n6TZWTg20i8MW5Ah6w0oDUrXSzduI0NuQTki4WxhKTtaRzvofUZuAztzg0lyT49muXqhhqMLBas
 JGmniyaN9E+oneAYw1iXPAZGQ6BSioVn5m6JPVB/FdUc3w7+4Yh6WG//E9j6bJHQn+Nwh0Csc/W
 OOVLjAamz/vGabbs7W8G+tWP3rJhq01jdtXaAONXcE/S2CT5B3exP5+ymlnemY9MqAVktGE2mvg
 5OTbekmZVE37vqI9e9/9CjVsFw6dyC0espFckCrEbgE0zh6CpPt5IEaSGPF4sBhm9WyLmQsZCpw
 GdbWMoq0K9av8QM75C7DvHme4QBQJWpvAlBhaRNX4F+G2MzpBZZTMGes/bcWRSW+igfHxyum7j5
 /uriDRU6pIaS6gsbLqj+fjWHKwrsxdFBlP9Ix+nyDnMigT+SRQZm2PlAuEwSok+Ws/jmFTFBW/m
 GYLsZBX4KKU+Zrg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add methods to find the next element in an XArray starting from a
given index. The methods return a tuple containing the index where the
element was found and a reference to the element.

The implementation uses the XArray state API via `xas_find` to avoid taking
the rcu lock as an exclusive lock is already held by `Guard`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index e654bf56dc97c..656ec897a0c41 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -251,6 +251,67 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
     }
 
+    fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)> {
+        XArrayState::new(self, index).load_next()
+    }
+
+    /// Finds the next element starting from the given index.
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
+    /// if let Some((found_index, value)) = guard.find_next(11) {
+    ///     assert_eq!(found_index, 20);
+    ///     assert_eq!(*value, 20);
+    /// }
+    ///
+    /// if let Some((found_index, value)) = guard.find_next(5) {
+    ///     assert_eq!(found_index, 10);
+    ///     assert_eq!(*value, 10);
+    /// }
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn find_next(&self, index: usize) -> Option<(usize, T::Borrowed<'_>)> {
+        self.load_next(index)
+            // SAFETY: `ptr` came from `T::into_foreign`.
+            .map(|(index, ptr)| (index, unsafe { T::borrow(ptr.as_ptr()) }))
+    }
+
+    /// Finds the next element starting from the given index, returning a mutable reference.
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
+    /// if let Some((found_index, mut_value)) = guard.find_next_mut(5) {
+    ///     assert_eq!(found_index, 10);
+    ///     *mut_value = 0x99;
+    /// }
+    ///
+    /// assert_eq!(guard.get(10).copied(), Some(0x99));
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn find_next_mut(&mut self, index: usize) -> Option<(usize, T::BorrowedMut<'_>)> {
+        self.load_next(index)
+            // SAFETY: `ptr` came from `T::into_foreign`.
+            .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(ptr.as_ptr()) }))
+    }
+
     /// Removes and returns the element at the given index.
     pub fn remove(&mut self, index: usize) -> Option<T> {
         // SAFETY:
@@ -354,6 +415,13 @@ fn load(&mut self) -> Option<NonNull<c_void>> {
         let ptr = unsafe { bindings::xas_load(&raw mut self.state) };
         NonNull::new(ptr.cast())
     }
+
+    fn load_next(&mut self) -> Option<(usize, NonNull<c_void>)> {
+        // SAFETY: `self.state` is always valid by the type invariant of
+        // `XArrayState` and the we hold the xarray lock.
+        let ptr = unsafe { bindings::xas_find(&raw mut self.state, usize::MAX) };
+        NonNull::new(ptr).map(|ptr| (self.state.xa_index, ptr))
+    }
 }
 
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.

-- 
2.51.2


