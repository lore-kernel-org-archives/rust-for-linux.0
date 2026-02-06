Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087BF30DED7;
	Fri,  6 Feb 2026 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412303; cv=none; b=meAH4yFuQSjv/4PM4DFKamzdUeTUm5tZadCeF+PnqDTidWkOPlQmkCYTdm8xu348Yea9yrG0smY9JWbYLzDijdisgPGSCq46Gf44/n5ZxNr0m1aAL4EuhU3Kok2sUjiGJOVm03wgXo+dBfmvvMesQnyFr8D56LJ2xpu0+Xa49JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412303; c=relaxed/simple;
	bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bftm63M7i/FRXScfEdBc5fgwOhCHpdhkOk7s6jxNSSQvkQCQVs/30juSaC2Mw84HRTzHU3lzUEkMSNoLhPgXb+Az5/FCuOsSJ/SLLtuOqvu40orpA3DlExKcH7m3x/rm3l9iDiYqvaNv2Yvxraf7+UecB/2lc15ysaEQif9Bzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgnSA+7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgnSA+7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DB3C16AAE;
	Fri,  6 Feb 2026 21:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412300;
	bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LgnSA+7bY0qxDvdMzITJ+FXZElGwsDv68y49w/cMLIlIBvXk+1Tzi5v7YD1gwAjZj
	 I+winp0JvJ2kd6OyT58TLMLbPUrvwC4wYIzvaXFb3IpiwzThADBBzwIKAWGYpRHmdI
	 3vQanmMlFSsfzLrGSxQnjvsI2n8ic8y1y6CGE03/gGNs5tN8Z1sn4E50azERG+OM5F
	 eVr+3JX4ZL0qo7ngGbxA1WPy1rVJYOVqrW6/donr6nWD4Zw6+GBPdg9iEnyPYUo38v
	 1lX+h/R5cW5ZzZRp1N5+md3aCSrIAH4/pKBthbX9JDw8VzudKOQxA/nwxAV8+Djqd6
	 PQZKmchAO5C+w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:53 +0100
Subject: [PATCH v2 07/11] rust: xarray: add `find_next` and `find_next_mut`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-7-91c41673fd30@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4023; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ziAsziTOC+GzNf139Ut4jKaT94DhutbUW+Q40shocZ0=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljnlh0PwhOjbdwrAoJpOnH1unnfNaF62jnVf
 OpMfNpflSuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY5wAKCRDhuBo+eShj
 d8lxD/96tdOwjEygElTB5W6BwdRyLgvYB/hCTUV/zpbiLgUPQl0pzk+j00jlWUivFwhQBOnlwrE
 YEgUGsY/y5uzXaAiw5NXnitAZoS6ZGWv2tpbAHvUCwwc/flX1p5Uu6leUtXPY6T8t+ok4lz9DR1
 fGSwg7Gb4f1ffmZkq62vlMR9FqECeE+RmhnAT3e9r2m86CSHMgXP5/qHqmzJlmSLxx+3YXqBR6U
 Yrh1rib85R+ov46tLBhvLSAKzrL6BSdNV8tklv3VD6n6gsCV7q7/JX3FgKFSw24OOX2x6sbc8oo
 zGsiXe2tpDo6CRpW9wavJsKgtq/VDBtvN7UohRxYDjmJXzRuYW88v4vMnUfPhOz5zgpYbbOEuZC
 M+vfJ29OIKm2qyjV2440+qdZP3PQFKHf4qOfOowsUnl/l6cBO2mj3GvbRXQ9I/1YcSj/Lt8mBIf
 hx9fybxfvq/KPIruXbehNTsdyXANogQmXTM5FNNbNLzYWLRarWRxU5cLHl38aMYDJLZwSfYQYlT
 fP5dvm4HKTSK0uw6wgVIg0dKjwug2PyccQwuqOtW71GIX20wNp89kFn3Dvh16L15xMTuxvxwjMd
 AltU2qTF9HFwtjnkMPV7R0bERe3P/+XCRDU64hmmiITp7fSgoqnSVu+poZABp+Ue1z5gi/tT4sH
 gUswhjAe8geVmNg==
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


