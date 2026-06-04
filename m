Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85573CB90A;
	Thu,  4 Jun 2026 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603185; cv=none; b=VRg+dqIiwUMZN0hfVcG/UATNMbiXKuatJYPMJQElFD6B0uYrUTV172k9FAOO/3El4OswQIB5soIQt323g5AfXZUyTJmu9rGGiXeMBiT1VojQS7EdEn0vr1CgAv8Fn0x9ImjT5a/hAho463coJ6YlgjQV/PD+LWfvaPWsUT9W5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603185; c=relaxed/simple;
	bh=pYvfABtxRJd+65+UwL/yf+feoNbyxJANq7/Ip719Xh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+YqKVrd7+lMSPMb8oCdJQzL1pYvS5R6dvEffClCD1A3SoJOZYB2foVzu2y6A+s2/h0Ze/ga3zfzzDrnZx+7/eT7eu+hEdSwoIkRJVf0sg9925PhZTtf93uP4ueF/fUjIgcNqoTbzZnBe1OB+ADZnUo7MoChOyW+kPZWhAIMzgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlfIx0wC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlfIx0wC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA0B1F00899;
	Thu,  4 Jun 2026 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603182;
	bh=lMIuC5KfuikN+IJdOVRU49vpMgSH5gGglwhQwCzLUFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VlfIx0wCRHD2Ke7Wsiv7XSdTrg7Sa6HU7/t+c4g9REs5Qyr8LXkV1krikhS7ObdhM
	 MT7MIlG0zpL4Cmc+xNe6rDPuWF4UlNx5eaNi5sOdPHBfR/PIRAzYyL0vJpTBd6uy1X
	 yBYGIj27ZhHe6qlNfb7Jm3seZDil7qIYkKUDWKuXrQInSCm8peHVNDaaJ6kuhEDhS5
	 NBXCRaCL7WiqPRSsMqQFd9aKMB8y5hWggLRNM5axIXqzL1IDqEtEogZXIeTKSFf7eF
	 ZnGDMcnbQSfND7TL5brTrBWJRHtP5Z0rRkwzCyRdyNPeaPbEpK/9lN6ocFbOqq9oUJ
	 IbTSb3kDkapsA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:12 +0200
Subject: [PATCH v4 06/11] rust: xarray: add `find_next` and `find_next_mut`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4101; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=pYvfABtxRJd+65+UwL/yf+feoNbyxJANq7/Ip719Xh8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIdjvzVaY77frrnGM8IY/dUfo7TEJOl6r6lp4/
 8ZNkt95LtKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiHY7wAKCRD6UCkIqsW9
 0DctEACTBcYdYrPHXcRAgJacN+h2yee/0JerT2FT+RLQY6DC9bEhyT3fD46b3iRQu/jCAWa675Z
 d6HKR93TpZvIJv8QQHAIb92hONgHK2s5uJsOYAc9P4Qvzs9K/IVUiM0KXvgJNhX5GFyb4TDv1jO
 2smQMdyVMEttC72eLIBDHHpRWSwtXuPTxdU7cv0SBIZN+AE34de28/CINYQt5++uW2UOHytaNi1
 H7RPytogVxfYyRFbJdMd7AMIMBNc616llsluuWsFi3B07RVLNEBZAQEqWOvzC4jV2IWO5TuoO48
 N2cydn6UwqftBqgsNMRSGWXHAlbnbQvFLIOJnk4alxO2BsUZ21HIk5moH06xAo9XUpsUxrzcFI6
 Ed2Vld+ARN11CNYw7quDe8PGtzA66RjkHis+U3sDssztBD4Da32BwiKy6Yigs/hshoPfqAWQPFb
 Q1T07XK7mKWe0a9kKFEBtXQRGWk3BnZNZy51FIgR8eSxtM86GNA9NyBAkTZyGOdMFG/JL+2OKov
 a0s8LpZa+rfWKhROBR8RDm/Adm7j/fW+jUuDbR2YCYpcwQiduU0e6KSPdZ9yBbzmNVfXTXjFKEp
 W9scryc9F1sDDOw0MxkqiuhmCNYvL1Yz0jX13YZJl1r6Xl+Qyn7pgHdTjJEhS8xvsWp3zec5asx
 PQ6xLhqf8mPLl7w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add methods to find the next element in an XArray starting from a
given index. The methods return a tuple containing the index where the
element was found and a reference to the element.

The implementation uses the XArray state API via `xas_find` to avoid taking
the rcu lock as an exclusive lock is already held by `Guard`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 7da57c778669..7efa8a36d559 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -231,6 +231,67 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
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
+    /// guard.store(10, KBox::new(10u32, GFP_ATOMIC)?, GFP_ATOMIC)?;
+    /// guard.store(20, KBox::new(20u32, GFP_ATOMIC)?, GFP_ATOMIC)?;
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
+    /// guard.store(10, KBox::new(10u32, GFP_ATOMIC)?, GFP_ATOMIC)?;
+    /// guard.store(20, KBox::new(20u32, GFP_ATOMIC)?, GFP_ATOMIC)?;
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
@@ -360,6 +421,14 @@ fn load(&mut self) -> Option<NonNull<c_void>> {
         let ptr = unsafe { bindings::xas_load(&raw mut self.state) };
         NonNull::new(ptr.cast())
     }
+
+    fn load_next(&mut self) -> Option<(usize, NonNull<c_void>)> {
+        // SAFETY: `self.state` is a valid `xa_state` by the type invariant. By the same
+        // invariant, `self.state.xa` aliases the xarray reachable through `self.guard`, whose
+        // lock we hold.
+        let ptr = unsafe { bindings::xas_find(&raw mut self.state, usize::MAX) };
+        NonNull::new(ptr).map(|ptr| (self.state.xa_index, ptr))
+    }
 }
 
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.

-- 
2.51.2


