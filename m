Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA3353347
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701711; cv=none; b=p9Zzeh5f5e+1Zy1jei2HT3AQnlaIiZXDgaJJ+JRtJWTF8XWfqvFURks0EZxxHfALJQQ59aXLoTLv8JemGbDQb94WTDj/xzWGTWBZ97+/wplgKu630qx9cmLPwJrdS0YYWwYLnt+6qUku6I+Mb1sDaSDwDvWSzDixNGFy/bdGnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701711; c=relaxed/simple;
	bh=40QcjoyHSdY7weF3MNP1wL4vYxkwlo7MCxDUjnx15Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TstHirYMAK8UDUImlAB/oIfdWwC6nT9l1JVvMOljvpqJuhv+95xNuyU3ljX2OXnBS4jXL0tv7cFNN0TMl72jjariwNB97W+KAayufIqbNzGIQfa1CVEKhw+S9QgeTadmUPazfH4S8jHh29e7tPEvrRVeRXfMvcUx+bd5I241fug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA7ZKqPF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA7ZKqPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B203CC113CF;
	Wed, 20 Aug 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701711;
	bh=40QcjoyHSdY7weF3MNP1wL4vYxkwlo7MCxDUjnx15Z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iA7ZKqPF/jvcja4qkR6tsFroCNCfHZidHsQZcFFuLBprKWWtgKteEz/+QJht5lx/f
	 Ayaw+qTZi4arePxIZQmc098R86PJFqAbKaZWCNkxXsu+hN+/mCiR5IrdSFstuGP5Y7
	 9QpJEyfHit9/t2N8bdI6pyz82sClhWPxV/ElMpD+vXJd5txBJvGg1iv7fZsOOvwp00
	 e94tXu2fK6AkvZcaxACd9AxG605d8Z+Gh0J9fJd1ER56cS29cHcSu6fVR3pZ0K88G/
	 QI/Smy/ST0ZuQ4srdOl/nuRcxPHAqKf/nOu8LyrWP+Z5kJLBIBTWUchSvFur/A5KZA
	 6Z0q85TMyVhpg==
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
Subject: [PATCH v5 7/7] rust: alloc: kvec: implement AsPageIter for VVec
Date: Wed, 20 Aug 2025 16:53:43 +0200
Message-ID: <20250820145434.94745-8-dakr@kernel.org>
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

Implement AsPageIter for VVec; this allows to iterate and borrow the
backing pages of a VVec. This, for instance, is useful in combination
with VVec backing a scatterlist.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kvec.rs | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..ac438e70a1ed 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -3,10 +3,11 @@
 //! Implementation of [`Vec`].
 
 use super::{
-    allocator::{KVmalloc, Kmalloc, Vmalloc},
+    allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter},
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags,
 };
+use crate::page::AsPageIter;
 use core::{
     borrow::{Borrow, BorrowMut},
     fmt,
@@ -1017,6 +1018,43 @@ fn into_iter(self) -> Self::IntoIter {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use kernel::prelude::*;
+/// use kernel::alloc::allocator::VmallocPageIter;
+/// use kernel::page::{AsPageIter, PAGE_SIZE};
+///
+/// let mut vec = VVec::<u8>::new();
+///
+/// assert!(vec.page_iter().next().is_none());
+///
+/// vec.reserve(PAGE_SIZE, GFP_KERNEL)?;
+///
+/// let page = vec.page_iter().next().expect("At least one page should be available.\n");
+///
+/// // SAFETY: There is no concurrent read or write to the same page.
+/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
+/// # Ok::<(), Error>(())
+/// ```
+impl<T> AsPageIter for VVec<T> {
+    type Iter<'a>
+        = VmallocPageIter<'a>
+    where
+        T: 'a;
+
+    fn page_iter(&mut self) -> Self::Iter<'_> {
+        let ptr = self.ptr.cast();
+        let size = self.layout.size();
+
+        // SAFETY:
+        // - `ptr` is a valid pointer to the beginning of a `Vmalloc` allocation.
+        // - `ptr` is guaranteed to be valid for the lifetime of `'a`.
+        // - `size` is the size of the `Vmalloc` allocation `ptr` points to.
+        unsafe { VmallocPageIter::new(ptr, size) }
+    }
+}
+
 /// An [`Iterator`] implementation for [`Vec`] that moves elements out of a vector.
 ///
 /// This structure is created by the [`Vec::into_iter`] method on [`Vec`] (provided by the
-- 
2.50.1

