Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20447320CCC
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701704; cv=none; b=rFsVTzCGCod5heIeknnbsGe89JEgHS8Ga+4wwaY3PPXO5zShAJtNN+sjna1HxVA4c8akeAgQWFS91K0jjOi9lW9RBnlZoHlNOGtk1uzKP75EBuUMvZkQcYjfS8UZhKhCUsdKA0+k1OmMjdbChZmuIn+RW50/XldItWSiHAVkexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701704; c=relaxed/simple;
	bh=NHRyLhcFJ5sPjdAZxBTjGkxOJ8vvueMSXZiG3LP8Igs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ji7Hb3srtzLpJrSOLa/vPvm8/BBDaMx7iPQlgFla6UPLkO3jobB+UFiUa7hdZfMGX7Vfo9ZBaze1TebvP81OnaQrBSIqshdmgQr9EVXUTg8K3I1VSX+KZfS59RNKKNl6usBV/yWKuXhLznPkFtOn/hp1/whp6Hz5Tr8u/PprwUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG7sFZHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG7sFZHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740FEC16AAE;
	Wed, 20 Aug 2025 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701703;
	bh=NHRyLhcFJ5sPjdAZxBTjGkxOJ8vvueMSXZiG3LP8Igs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jG7sFZHhRUX8HpKXtOhgHAIfYVaHOrpBdaB77gmEcLLmpWxJcaTRSCxMF4wWhq5J2
	 cpup7856n4TSezvdnSIzAjZiiquSpeTECx9uizx65BbFjg/yxSgUSOZPc4FAeuSGgR
	 FRxNbSg5V93tUsNUidlFgUUJiCMnNOQPIVzZhzU+ri2kZdPoF0BYDIYWz00og4xc2d
	 qihbTTa4cGBoEkF89KGa5I4fAGHIU4C9SYNhfzvwQ0wvnya3Gbo8Phr6enE2N4xTe/
	 /PfhYVgBdjW+41/5X9BdIFvocmwqZhR50vPuB38tObIPLvKKGQAHnrQzDnWTQYYo1B
	 na1K5pqKBluLQ==
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 5/7] rust: alloc: kbox: implement AsPageIter for VBox
Date: Wed, 20 Aug 2025 16:53:41 +0200
Message-ID: <20250820145434.94745-6-dakr@kernel.org>
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

Implement AsPageIter for VBox; this allows to iterate and borrow the
backing pages of a VBox. This, for instance, is useful in combination
with VBox backing a scatterlist.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..b69ff4a1d748 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -3,7 +3,7 @@
 //! Implementation of [`Box`].
 
 #[allow(unused_imports)] // Used in doc comments.
-use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
+use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
 use core::borrow::{Borrow, BorrowMut};
@@ -18,6 +18,7 @@
 
 use crate::ffi::c_void;
 use crate::init::InPlaceInit;
+use crate::page::AsPageIter;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
 
@@ -598,3 +599,40 @@ fn drop(&mut self) {
         unsafe { A::free(self.0.cast(), layout) };
     }
 }
+
+/// # Examples
+///
+/// ```
+/// # use kernel::prelude::*;
+/// use kernel::alloc::allocator::VmallocPageIter;
+/// use kernel::page::{AsPageIter, PAGE_SIZE};
+///
+/// let mut vbox = VBox::new((), GFP_KERNEL)?;
+///
+/// assert!(vbox.page_iter().next().is_none());
+///
+/// let mut vbox = VBox::<[u8; PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
+///
+/// let page = vbox.page_iter().next().expect("At least one page should be available.\n");
+///
+/// // SAFETY: There is no concurrent read or write to the same page.
+/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
+/// # Ok::<(), Error>(())
+/// ```
+impl<T> AsPageIter for VBox<T> {
+    type Iter<'a>
+        = VmallocPageIter<'a>
+    where
+        T: 'a;
+
+    fn page_iter(&mut self) -> Self::Iter<'_> {
+        let ptr = self.0.cast();
+        let size = core::mem::size_of::<T>();
+
+        // SAFETY:
+        // - `ptr` is a valid pointer to the beginning of a `Vmalloc` allocation.
+        // - `ptr` is guaranteed to be valid for the lifetime of `'a`.
+        // - `size` is the size of the `Vmalloc` allocation `ptr` points to.
+        unsafe { VmallocPageIter::new(ptr, size) }
+    }
+}
-- 
2.50.1

