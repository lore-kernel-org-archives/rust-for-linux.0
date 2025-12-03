Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F9F2E427C;
	Wed,  3 Dec 2025 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800854; cv=none; b=AkXWHaytZ9Ork16TOhjmWCmsHOlcRLC0NFagogP3L6vtXQlGFIzpLCcuM1ulU5umEbvVnfr/kKtJtfrnNARINhei0fSgu/vuFbttanaC8VrXRPOHIFiAhq3Ay+lHGUXuYFQOgbBe6189pUDmfSnNTm+zYR6e8V3UBh031F5QpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800854; c=relaxed/simple;
	bh=JtquLCjmJCuOLZ5pIgrOtNma6TGBWjwHhBofiD5p46Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIAA4PbFpD7fTpI15FTjxzmqQyirqc4j4n8zUGuhy2QQ2dyxIhq/3ZIIyYqQ4pHHxFoG2KR+kDO7p5WumviBwD3rCkDyRe9uF4c4/YAD3AEhsuIbQYJtxKkqt3IGVjBhsqnuC/CgMVMtuRLhkpM8J+xlYU7488OGBfB6Lk3r0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUdHonvE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUdHonvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C222AC4CEFB;
	Wed,  3 Dec 2025 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800853;
	bh=JtquLCjmJCuOLZ5pIgrOtNma6TGBWjwHhBofiD5p46Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pUdHonvE+YMCbI6l3yJDdcjkmctf6h+J4q0taqTSvV47v0UpwfRKnSCiAvMn8jxnT
	 cOtSUEa6YKwbZWQRKO/B9eyvyDJeixQmC1gZrPKO7DvbzHakWf0+hHbLf1w4Af3dhH
	 3dpK1RdMmllucn2DdQ6JqEzHt+nuw5tfssK1sFd4h7fpupn3nlTFX/1pYaXVdLwvSQ
	 OGTZ2y1z1exEED1XReWKZ4TtuRLIPzrIP4Z6/m1kFyJD40N2ptwTgCsbouqS3GxBGN
	 NBotXGg5tHaIHANoz9eC8yw57PTtFu/e0EtjlOitkgcXhiVIctLfU4nmaIyqcUT2oH
	 8rXvotjWweb3Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:37 +0100
Subject: [PATCH 07/10] rust: xarray: add `find_next` and `find_next_mut`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-7-9e5ffd5e3cf0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3657; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=JtquLCjmJCuOLZ5pIgrOtNma6TGBWjwHhBofiD5p46Q=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkwF6wqucvtQw8KN7aWnwLd/seNiLxWXNoa7
 H9X6qyCrZiJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5MAAKCRDhuBo+eShj
 d0VYD/4nYQu8gGFZVVXmNefrLXRzHop53P5YrC3I409ZWfdVq6bA8oCCljozO+9bO1vIJc26VT2
 +lHWqOOSQcZf8HNimy6tzefm6eWysHuBqRqwatau/F7PelDfnUAfYaZl07eWDulrduM2kE3tiry
 5QEQpnqTUL4u38f6pOyhy2S5E+sfSMRvmiQC8u168ZbHEOjZ034HusdrXu6ISAH5WFjG7ijy6Se
 m5jwx7RrEcFbsr7jzjd/LXk3jG8wyPK6HXy0q9QoAbPasdNmETuqCTxvnek81WefWyA6VtyT9Yk
 AyL2VA8biSCxFDjS7IPzYaPrMrcXmEdGgtcelb5nAC41sJZYClnOaBpjUF3K0u6n332ahNtNCqO
 5nwVN31zaVbmQUhy7IxxHYhRrauyE3xbsapvi2BF26+0wwrDlvDm/4HJbYBZEH+PdQxjEV9o1Xd
 huN3RPUipQoKXly/wnwnBg3PtYVt8Kc3WHDUA42MS5TdeL+TE/6uRFta1mabKl++mU4I3PzjyrA
 PYULvv1Tdw6T+QusdfJpWyfTLjPLcw3g2WZyAEcdIZC3KUeUumlRuKeDq3GF383OJWFE9UL1Pvg
 oTOvSxgFjXGKE7KC5Bn1lfQ/yfERBZw6tDwRWqyVTF4sTFIg8Rp7PyIQMHFgS5SlG+JvHdQDJMf
 bnqY2GGl83I8v6w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add methods to find the next element in an XArray starting from a
given index. The methods return a tuple containing the index where the
element was found and a reference to the element.

The implementation uses the XArray state API via `xas_find` to avoid taking
the xarray lock that is already held by `Guard`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index ca97134ba2bd0..9d4589979fd1d 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -255,6 +255,71 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
     }
 
+    fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)> {
+        let mut state = XArrayState::new(self, index);
+        // SAFETY: `state.state` is always valid by the type invariant of
+        // `XArrayState` and the caller holds the lock.
+        let ptr = unsafe { bindings::xas_find(&raw mut state.state, usize::MAX) };
+        NonNull::new(ptr).map(|ptr| (state.state.xa_index, ptr))
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

-- 
2.51.2


