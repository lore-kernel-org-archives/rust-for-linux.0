Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12371DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676746; cv=none; b=tr2U7DquBUxI0iGLGy+k6d4+AuDLAWSpDRRtpBLsLa+Avj+utKi8eTKT2qfwl9XBnu5UJBBymOycPE+6AWWCw2K8Oc9TSYk2iFKP932YXlkIcFdzaLt04McGGixBSi4XOjBAr269bi6y0WUu1sRF1TZod0K7ugHe9zX5J5iknj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676746; c=relaxed/simple;
	bh=49tvZx0TV8kuKrD0WmdQZ3tp93qtW1t84y96hT//V10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=midHDEIkGHim9/CqMj73pKFgqGUb+B+TOMHo8C40ROPtwIWRaNKS43WkFJ3Kj0g858QC7BzfxH45iYX+YTW/sFIfst+i1OJUYk7i/osFnkcj1bIb7iqrcrVzZoWa/q2M2PY+B8K951yRZxJUave1nzA2WrEX/x7FiBLjhMQs5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIgvVxIl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIgvVxIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D457C4CEF0;
	Fri,  8 Aug 2025 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676746;
	bh=49tvZx0TV8kuKrD0WmdQZ3tp93qtW1t84y96hT//V10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YIgvVxIlO95u/ZPJvhNu5dnsenp4FcBV/p3E8OEvjCbwOXENYOyE3dh8kyiq3jU5V
	 snvSiqfxg62y8NMTRxQWjaJoH0UlJgdGdKK3acbh1eXbtTIGlooUTGbZAVxaz4tXGO
	 8AzdlDJK2CnLABZm/CQa6CkUGsD6ORhZkqN2MTw8djG5r4x52kiYmQFph73x3e6XSx
	 l17joHabPW77Wk+yBX0/ZlaYmOf2LljiZJC6UHzUU9InINJcrubT9tMmECRKhYgreA
	 MaJaOPQTSU01dRJFc9PjpuX1ECeWKCNG5HcYDhteq3yPkvNu2xKaWEp8lOufgJMr3E
	 hn6m+Y/HKHszQ==
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
Subject: [PATCH v3 5/7] rust: alloc: kbox: implement IntoPageIter for VBox
Date: Fri,  8 Aug 2025 20:10:19 +0200
Message-ID: <20250808181155.223504-6-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808181155.223504-1-dakr@kernel.org>
References: <20250808181155.223504-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement IntoPageIter for VBox; this allows to iterate and borrow the
backing pages of a VBox. This, for instance, is useful in combination
with VBox backing a scatterlist.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..8054bed0ab1c 100644
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
+use crate::page::IntoPageIter;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
 
@@ -598,3 +599,37 @@ fn drop(&mut self) {
         unsafe { A::free(self.0.cast(), layout) };
     }
 }
+
+/// # Examples
+///
+/// ```
+/// # use kernel::prelude::*;
+/// use kernel::alloc::allocator::VmallocPageIter;
+/// use kernel::page::{IntoPageIter, PAGE_SIZE};
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
+impl<'a, T> IntoPageIter<'a> for VBox<T> {
+    type Iter = VmallocPageIter<'a>;
+
+    fn page_iter(&'a mut self) -> Self::Iter {
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

