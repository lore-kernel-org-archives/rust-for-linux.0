Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F13BB138;
	Wed, 13 May 2026 19:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699395; cv=none; b=fbSxW+0QTjFOVsZmayLF8/1nwsFpaxqh3+dGr6jlawlQTxQvkvS6K2tNnSWC26v1OTSsZmZAZLGWZubsNzooY7K7aL1Birn7+3ky1lrPC0kiD14gnkijssH07eLfKkK3iJEwprGx3AP43RNcWthlqa5AABy3/Gd4nsd4LUSc5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699395; c=relaxed/simple;
	bh=ZMI44nybgjewldTVmEZeC0GfnsgboI2yc1YGqpmR4U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBJiSacXEAgpS1t/8GCf0d3lLxMmSJax8g2xJgc9QLA1wB0qcP8NmdbXns3p6sopQTwkIku/zzymPvsDlPyDAh1mEZUcYiiRmeMm96cwl2uOYp+RTrnG38FzPkmcJd9wx6dsiwh+sIYOP8K6O6v4G29EJ9yzCgTJqVs64t7i2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od2nVL1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od2nVL1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC61C19425;
	Wed, 13 May 2026 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699395;
	bh=ZMI44nybgjewldTVmEZeC0GfnsgboI2yc1YGqpmR4U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Od2nVL1A8EgvVXl1s/eyPv3OO5pOI7nDkPj8TMtC8z+dlFyVxwhR3g7kUtMBKkxHX
	 FheirWB0/O0Uk6Apqh0KW57Fg0DSu6ohy0KV7eKi+pG3zBsQrj0PodAGOwfxO3Yt9L
	 AzEurVbaA6aV1e1jQdoi4FHeQgsEppWBMglJecIfbmXPPRDB8NV9LqyRkryft5JeOS
	 l9FqA1Sn+nP0zW+mFwcCF5YmUXUs8ZCNkCu4gf/XXGDtLUM2Wmq8nkW64OY+Ut2WlB
	 2YDOio8vZP3rO4Co9zDJxqJwWYd+CYAagrUvE+5qQyTFAFPtSbqF33pk380d05e7LR
	 QvKWsRt092FKQ==
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
	linux-kernel@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 2/2] rust: alloc: cleanup doctest imports to "kernel vertical" style
Date: Wed, 13 May 2026 21:09:16 +0200
Message-ID: <20260513190946.619810-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513190946.619810-1-dakr@kernel.org>
References: <20260513190946.619810-1-dakr@kernel.org>
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
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
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
index b8097dec3869..31b2588ed5bf 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -297,7 +297,10 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
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
@@ -590,7 +593,6 @@ fn deref_mut(&mut self) -> &mut T {
 ///
 /// ```
 /// # use core::borrow::Borrow;
-/// # use kernel::alloc::KBox;
 /// struct Foo<B: Borrow<u32>>(B);
 ///
 /// // Owned instance.
@@ -618,7 +620,6 @@ fn borrow(&self) -> &T {
 ///
 /// ```
 /// # use core::borrow::BorrowMut;
-/// # use kernel::alloc::KBox;
 /// struct Foo<B: BorrowMut<u32>>(B);
 ///
 /// // Owned instance.
@@ -683,9 +684,13 @@ fn drop(&mut self) {
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
index ad1839f1375b..6f35484387de 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1187,9 +1187,13 @@ fn into_iter(self) -> Self::IntoIter {
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

