Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5021421D
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 19:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337034; cv=none; b=gSg85XxLgKf81Hd9RNCy8e6P4J+zhQlHfj6Tnbu0EAtnqMb2kKBGdxvruRPiDfrkUHKukfmuCYKWAgUnMQwpXzyHFe8YGttHSRFVBaAluFSTmvrdYePkB7AguCiayv6DjtUovZFlixHK3FJl2WjPk1+2OdGZMhzWLYlKVhQ48LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337034; c=relaxed/simple;
	bh=+GhNTDOtfjRd/w7zVDrBtz1xxs3iwcW/7Kw2M1X107E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt1aY864WLOEgYKKR9AiGodYYCjGNNEKRISKMxy7Tdvvls9KkUS57F1CTIlJ7DZDStHMrR1mVFrPtxae1lI1h3hBOiol4Ayhfm6RaSmfZqvGpuVlYRmcyhFqwvoOGs91uaSQ3NzCMDx7W1yspFSVRPqCX5ZUf9K69OKvV7DYM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA3TiXnQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA3TiXnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207F6C4CEE7;
	Mon,  4 Aug 2025 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754337033;
	bh=+GhNTDOtfjRd/w7zVDrBtz1xxs3iwcW/7Kw2M1X107E=;
	h=From:To:Cc:Subject:Date:From;
	b=iA3TiXnQaVhqpSU/wFgJUlEW8WUNeFy98Twr9Vebx8LD31NydEYVwRioF61UYkNwX
	 2Blt8L1lSHfgUQ1h2/vS0YbfGdXXyJclUg4F0zibbD7f5vDpRYWlstNDVwcKjP5q1r
	 5gdvkZSoDJ8xSzEhDB664wvtegeQsgY3683EVNtA2ASr/x4ZymWe7YMSPL/3v0AVgB
	 edtkdZTNTFYn48LsqklnsUjUpBQrnQ13JrAwW3eoq9Fz+Q7FuiSOyH/NrrI943Tmks
	 nBL80Dy/6dW2hTXcCgzynlF4z8nu4zj0MgmtzNvJlG4zsZ1oxYpjln97IVy7P6kHnG
	 NwgKo2+nr90TA==
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: page: implement BorrowedPage
Date: Mon,  4 Aug 2025 21:50:16 +0200
Message-ID: <20250804195023.150399-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, a Page always owns the underlying struct page.

However, sometimes a struct page may be owned by some other entity, e.g.
a vmalloc allocation.

Hence, introduce BorrowedPage to support such cases, until the Ownable
solution lands.

This is required by the scatterlist abstractions.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/page.rs             | 83 ++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9..0e140e07758b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -57,6 +57,7 @@
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
+#include <linux/mm.h>
 #include <linux/miscdevice.h>
 #include <linux/of_device.h>
 #include <linux/pci.h>
diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 7c1b17246ed5..bea7f0ab91f4 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -9,7 +9,12 @@
     error::Result,
     uaccess::UserSliceReader,
 };
-use core::ptr::{self, NonNull};
+use core::{
+    marker::PhantomData,
+    mem::ManuallyDrop,
+    ops::Deref,
+    ptr::{self, NonNull},
+};
 
 /// A bitwise shift for the page size.
 pub const PAGE_SHIFT: usize = bindings::PAGE_SHIFT as usize;
@@ -30,6 +35,82 @@ pub const fn page_align(addr: usize) -> usize {
     (addr + (PAGE_SIZE - 1)) & PAGE_MASK
 }
 
+/// Representation of a non-owning reference to a [`Page`].
+///
+/// This type provides a borrowed version of a [`Page`] that is owned by some other entity, e.g. a
+/// [`Vmalloc`] allocation such as [`VBox`].
+///
+/// # Example
+///
+/// ```
+/// # use kernel::{bindings, prelude::*};
+/// use kernel::page::{BorrowedPage, Page, PAGE_SIZE};
+/// # use core::ptr;
+/// # use core::ptr::NonNull;
+///
+/// trait PageOwner {
+///     fn borrow_page<'a>(&'a mut self) -> BorrowedPage<'a>;
+/// }
+///
+/// impl<T> PageOwner for VBox<T> {
+///     // Borrow the first page of a `VBox`.
+///     fn borrow_page<'a>(&'a mut self) -> BorrowedPage<'a> {
+///         let ptr = ptr::from_ref(&**self);
+///
+///         // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
+///         let page = unsafe { bindings::vmalloc_to_page(ptr.cast()) };
+///
+///         // SAFETY: `vmalloc_to_page` returns a valid pointer to a `struct page` for a valid
+///         // pointer to `Vmalloc` memory.
+///         let page = unsafe { NonNull::new_unchecked(page) };
+///
+///         // SAFETY:
+///         // - `self.0` is a valid pointer to a `struct page`.
+///         // - `self.0` is valid for the entire lifetime of `self`.
+///         unsafe { BorrowedPage::from_raw(page) }
+///     }
+/// }
+///
+/// let mut vbox = VBox::<[u8; PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
+/// let page = vbox.borrow_page();
+///
+/// // SAFETY: There is no concurrent read or write to the same page.
+/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// # Invariants
+///
+/// The borrowed underlying pointer to a `struct page` is valid for the entire lifetime `'a`.
+///
+/// [`VBox`]: kernel::alloc::VBox
+/// [`Vmalloc`]: kernel::alloc::allocator::Vmalloc
+pub struct BorrowedPage<'a>(ManuallyDrop<Page>, PhantomData<&'a Page>);
+
+impl<'a> BorrowedPage<'a> {
+    /// Constructs a [`BorrowedPage`] from a raw pointer to a `struct page`.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must point to a valid `bindings::page`.
+    /// - `ptr` must remain valid for the entire lifetime `'a`.
+    pub unsafe fn from_raw(ptr: NonNull<bindings::page>) -> Self {
+        let page = Page { page: ptr };
+
+        // INVARIANT: The safety requirements guarantee that `ptr` is valid for the entire lifetime
+        // `'a`.
+        Self(ManuallyDrop::new(page), PhantomData)
+    }
+}
+
+impl<'a> Deref for BorrowedPage<'a> {
+    type Target = Page;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants

base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f
-- 
2.50.1

