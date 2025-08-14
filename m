Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD52EA472
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164098; cv=none; b=VhnhFf1c2UttFKeOaOEW3j/Lk7hrC8QGzJWlxcDVerVkxRXsxVmEYsXGBqSSnpj3aAE2KxJtQNgm5scWttfh72lc1zR9En78sZklqXsvS2U2jaO3pIeUP8CZNapARaE+iNJArAqt/UVfOUzHKio4AGXoixvoG6TX9RTbRbwLzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164098; c=relaxed/simple;
	bh=tY8E4P9/lAzANlgkudR52EZozo/gcyjt1ILSMnS/YGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMgOHzYHs9CJojeXzX1Oj7hRV/XKffC+TnsZVsE2MFODtsV2nQWEcSfqWC5qlcet2Z+najpQyE/lIHKK/SB7r2D+8kD/VFDybd+y2/h6gtLuXr/1RJ0BXOOPMfrHbVuDtvNqMSDq+S9s/fu/T4SdEp3b3h5EOQRdzCbBr8vz6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZQWQSJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZQWQSJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E188C4CEEF;
	Thu, 14 Aug 2025 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164096;
	bh=tY8E4P9/lAzANlgkudR52EZozo/gcyjt1ILSMnS/YGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZQWQSJePmZvDb5CqixFuCvQHcSwKfUzV9oyiZA29jjg+U8A7vC9PSBXpw++02WpQ
	 FcEXIEO+/VrtQ74nYh4mhrqMR7J38i/EqwwBZzrlBtmAXxHK9GMmKph/Uygsml6q5m
	 U5/+KxGkwHcEPQhH8WG0gwZxidX5KfVcsbKC7oekPtMKyP251XWA1CxkdImQDIHHFs
	 eC8uxHEZYNK1T/GK2bSULmvRsjKfazE1W0nNPzCAfaDaufJjQxJC/pinJlUiUJIPzy
	 c/u3tdJCz7QHFuPANM52ysMfK5uJeHMDVfizvjKHcbFv0oWEMJtML/wXu9xkmDHzRu
	 fBUG4kD6mU6Bw==
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
Subject: [PATCH v4 5/7] rust: alloc: kbox: implement AsPageIter for VBox
Date: Thu, 14 Aug 2025 11:33:44 +0200
Message-ID: <20250814093427.19629-6-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814093427.19629-1-dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
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

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..6c2ed6adeb89 100644
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
+        let size = size_of::<T>();
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

