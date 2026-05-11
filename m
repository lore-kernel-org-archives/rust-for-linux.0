Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984F4D90D7;
	Mon, 11 May 2026 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535732; cv=none; b=B+ezpkT7PmXzHwiRb4lOEU+3F4OUDwkfE+UNQbRt/+dGtEsnam296TTo5nZKBG6Qt7JmYgwZ7JpmzT4Po8F2hs7Gesx+vhmsZjIsrLhBiauSN3eX9mUbaqRwoAH4cMFyto0qVpBuXNOwpQSHbJYXXl4DXJbRyCbqaTs8uMfMz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535732; c=relaxed/simple;
	bh=J2Z1UR9yBttyoXUV7ircUd9OwxObLUsRbQHdZ3ssXWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOaoUGm4VvWbk+4MEJBDvqSOnuA1E8rh5uxxrTtkxAZ+3vVKYd1jp8vC1Htu/MM3Z4xmnRxXXK2fUOcRkSeHHDvPKNgI0ecQVyZJ9EDZiieALEFZurySnEaviLLg+Ghq9AfrJGszp5o1mkkOO3pBZ8vgq88KcHNEIv2QlAP4pXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvBffY3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvBffY3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C06BC2BCB0;
	Mon, 11 May 2026 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535732;
	bh=J2Z1UR9yBttyoXUV7ircUd9OwxObLUsRbQHdZ3ssXWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RvBffY3OHYFhAU4Kfxsp4DCwjtBsWyVSEIJoj3Q4YpfQbxx5HL89WROO31w8ZNj2T
	 6Hg1XO6BxNEYs6fIfIwdiSAF7XIO5rNu1a2ARDvDts7sqLoTJk9uUi2kJVJEfH8M9Z
	 qOO8LZt2VhhL3hfQEnZ/IBrm6e4ImQ7dSOK3d1Go8ihrtEAGuTcc+WF4w2JV1lRf2y
	 LQWdromntN1lNDeKQju45hG2KLIlG+mEFGyQ+9xWNXOwX1EuNa4DR3qJc/49tyoyus
	 +XYKb1C56JyXbH1q751OhbI24qRVq1eIaKc4p+J+HWgZQMi/HDT9vvQ/CujOkbB3zn
	 1xmND0/zq8kqA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: alloc: cleanup doctest imports to "kernel vertical" style
Date: Mon, 11 May 2026 23:41:35 +0200
Message-ID: <20260511214154.3569305-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511214154.3569305-1-dakr@kernel.org>
References: <20260511214154.3569305-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change all imports in the alloc module's doctests to use the "kernel
vertical" import style [1].

While at it, drop imports that are automatically included in doctests.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs |  7 +++++--
 rust/kernel/alloc/kbox.rs      | 17 +++++++++++------
 rust/kernel/alloc/kvec.rs      | 10 +++++++---
 rust/kernel/alloc/layout.rs    |  5 ++++-
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index af20332d59f7..562e41925ada 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -174,8 +174,11 @@ impl Vmalloc {
     /// # Examples
     ///
     /// ```
-    /// # use core::ptr::{NonNull, from_mut};
-    /// # use kernel::{page, prelude::*};
+    /// # use core::ptr::{
+    /// #     from_mut,
+    /// #     NonNull, //
+    /// # };
+    /// # use kernel::page;
     /// use kernel::alloc::allocator::Vmalloc;
     ///
     /// let mut vbox = VBox::<[u8; page::PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 0de45d8d235a..146d1b5e20bb 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -296,7 +296,10 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
     /// # Examples
     ///
     /// ```
-    /// use kernel::sync::{new_spinlock, SpinLock};
+    /// use kernel::sync::{
+    ///     new_spinlock,
+    ///     SpinLock, //
+    /// };
     ///
     /// struct Inner {
     ///     a: u32,
@@ -589,7 +592,6 @@ fn deref_mut(&mut self) -> &mut T {
 ///
 /// ```
 /// # use core::borrow::Borrow;
-/// # use kernel::alloc::KBox;
 /// struct Foo<B: Borrow<u32>>(B);
 ///
 /// // Owned instance.
@@ -617,7 +619,6 @@ fn borrow(&self) -> &T {
 ///
 /// ```
 /// # use core::borrow::BorrowMut;
-/// # use kernel::alloc::KBox;
 /// struct Foo<B: BorrowMut<u32>>(B);
 ///
 /// // Owned instance.
@@ -682,9 +683,13 @@ fn drop(&mut self) {
 /// # Examples
 ///
 /// ```
-/// # use kernel::prelude::*;
-/// use kernel::alloc::allocator::VmallocPageIter;
-/// use kernel::page::{AsPageIter, PAGE_SIZE};
+/// use kernel::{
+///     alloc::allocator::VmallocPageIter,
+///     page::{
+///         AsPageIter,
+///         PAGE_SIZE, //
+///     }, //
+/// };
 ///
 /// let mut vbox = VBox::new((), GFP_KERNEL)?;
 ///
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 4340525f2672..932caa740327 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1169,9 +1169,13 @@ fn into_iter(self) -> Self::IntoIter {
 /// # Examples
 ///
 /// ```
-/// # use kernel::prelude::*;
-/// use kernel::alloc::allocator::VmallocPageIter;
-/// use kernel::page::{AsPageIter, PAGE_SIZE};
+/// use kernel::{
+///     alloc::allocator::VmallocPageIter,
+///     page::{
+///         AsPageIter,
+///         PAGE_SIZE, //
+///     }, //
+/// };
 ///
 /// let mut vec = VVec::<u8>::new();
 ///
diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index b629da4aed07..62a459c66baf 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -50,7 +50,10 @@ pub const fn empty() -> Self {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::alloc::layout::{ArrayLayout, LayoutError};
+    /// # use kernel::alloc::layout::{
+    /// #     ArrayLayout,
+    /// #     LayoutError, //
+    /// # };
     /// let layout = ArrayLayout::<i32>::new(15)?;
     /// assert_eq!(layout.len(), 15);
     ///
-- 
2.54.0

