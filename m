Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB773203B5
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701689; cv=none; b=Hv681CQFp0chG9Y8l7wGkySFUtygRb/Siu4mz+IXYAd+3sy9n6DehjjpeWQkvFQB+gqDuRAJUiu/ZgvtAKf6ECSuR20OvN3JkuRZwk9yy+wBEic3+XFJxNipXfEHWioHxTpzetYiJNTvNJN8kDbM2PT7kfpnwwdDqrECZ8P1JsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701689; c=relaxed/simple;
	bh=51U1+IPqj7qy0zi9GKydtMOcQnA8NAToBoDcCVpQyHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dks9OnOS+0IsCYTtBzNVOSt144aA0Fs73fKHH79U+aIipdzJ6hVWDE6KXHYOyPBorHhVmuzrpi76CAoOisJ3tbjCIQZQMrxERtEU4NUSPQF7QyFyf1b+/03WV0teIkvAG/sxnlqI5pOeza0MpctRSEPUBuv0Xo24JgiIlsaAh04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec1i5y0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec1i5y0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62947C116B1;
	Wed, 20 Aug 2025 14:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701688;
	bh=51U1+IPqj7qy0zi9GKydtMOcQnA8NAToBoDcCVpQyHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ec1i5y0ngOvwvuPu02k8Kapn84qWXtD9RF9Tk2T/PgvA1OuVcK9MtDL84FlZsVH6q
	 4HTRznsNb62EPTxKAmiz64jLK78+FlsIzuUd0uTAUgHyaCInbzp9fRt+RTC7THNnMZ
	 ud7ZDRP8RD9owj+S34n64b8tU8OzQpP7xLAMCK/1GNsIuTVsjAataxvLh2vDQ1bFv7
	 2oEV9fflEMalLcjciMNo++AdJi320iLrtssVjHhhI9FuHUf6J+aXUwRnJ6lb67+58H
	 AXH5wua/5CHmLgk1TL/jHcGam3J1ATlXvYk0pVLarW/9hEJLxSvqjs6GmPn8gf4fkc
	 TFMN3Z7dtZXvg==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
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
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v5 1/7] rust: page: implement BorrowedPage
Date: Wed, 20 Aug 2025 16:53:37 +0200
Message-ID: <20250820145434.94745-2-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820145434.94745-1-dakr@kernel.org>
References: <20250820145434.94745-1-dakr@kernel.org>
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
solution [1] lands.

This is required by the scatterlist abstractions.

Acked-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/rust-for-linux/ZnCzLIly3DRK2eab@boqun-archlinux/ [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/page.rs             | 75 ++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

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
index 7c1b17246ed5..631718a6ad7d 100644
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
@@ -30,6 +35,74 @@ pub const fn page_align(addr: usize) -> usize {
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
+/// # use core::{mem::MaybeUninit, ptr, ptr::NonNull };
+///
+/// fn borrow_page<'a>(vbox: &'a mut VBox<MaybeUninit<[u8; PAGE_SIZE]>>) -> BorrowedPage<'a> {
+///     let ptr = ptr::from_ref(&**vbox);
+///
+///     // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
+///     let page = unsafe { bindings::vmalloc_to_page(ptr.cast()) };
+///
+///     // SAFETY: `vmalloc_to_page` returns a valid pointer to a `struct page` for a valid
+///     // pointer to `Vmalloc` memory.
+///     let page = unsafe { NonNull::new_unchecked(page) };
+///
+///     // SAFETY:
+///     // - `self.0` is a valid pointer to a `struct page`.
+///     // - `self.0` is valid for the entire lifetime of `self`.
+///     unsafe { BorrowedPage::from_raw(page) }
+/// }
+///
+/// let mut vbox = VBox::<[u8; PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
+/// let page = borrow_page(&mut vbox);
+///
+/// // SAFETY: There is no concurrent read or write to this page.
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
-- 
2.50.1

