Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA02ED171
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164104; cv=none; b=W90SoOnob955SgpIdsOhHAO4H493HgsqO6nwhoMhdYKTCLe6GPCDhm9hJe4iADH8WjDAbsZRe1Z2Lz6LgRcc+E59tNM+ISRQmZ61bLsVbCYB4fHGhDEdGM3k9J4z8MGshsqB6xDBTXsBJXegSa8xa83G9B/9jhcC0Tudf+4Mtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164104; c=relaxed/simple;
	bh=wrJfI5aCOjEABYwHLyu9HpQcD5edokQ5jJsNe1mIomE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqpxA7KziTG0SPJiCirSBQosWlWg0pIIWbT9w1ZhXIBbA4pfGw748s6hBdHX3kf5iysxmBzXcZnvACWgu6At070a0nFJEhxtqCBXy2JG4XOI9OOEbnfpdbgMwuhXfwGUcg35TFbpSMSWdo7ChOGCnYEbEyYs6wCErsLzZLnCnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV+qnmdc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV+qnmdc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27D3C4CEF6;
	Thu, 14 Aug 2025 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164104;
	bh=wrJfI5aCOjEABYwHLyu9HpQcD5edokQ5jJsNe1mIomE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nV+qnmdcCWK1dsGs3aCqo/MNeZ7s6wWYWT+D8mekQB5CLnMqV6EcmPCL6RFUZaxzL
	 zJuVUvX5RXONhgetwTb8q0D27gb4qCSKKr0DhE4OQZukmj2LfFwsrMPK/P8vvRsijS
	 52FnrP/9VD97+NYnDYlGAAv2EH4vDflEyIfqhi3mc2AEMlhezqVFXfFKXpfpFj6ZZu
	 CT6XOsQs7ul/RjgvSLxCubvOnxiv+eZ7+Zy7JmdOsK/PcKVdXItnMlrKsLcWTo2TCD
	 C8w85IH+Z4mSV2YVj17jsT+P3vhNP0Dmb6kcCAVw+pzWGSKT2YYjLDugQTV+/gZjKN
	 NN+9H6YoHolHg==
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
Subject: [PATCH v4 7/7] rust: alloc: kvec: implement AsPageIter for VVec
Date: Thu, 14 Aug 2025 11:33:46 +0200
Message-ID: <20250814093427.19629-8-dakr@kernel.org>
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

Implement AsPageIter for VVec; this allows to iterate and borrow the
backing pages of a VVec. This, for instance, is useful in combination
with VVec backing a scatterlist.

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

