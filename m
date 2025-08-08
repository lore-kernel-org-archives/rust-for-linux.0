Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A61DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676754; cv=none; b=iWhuByv7V/cy7teZwcyGP1ol9Ceo92otyDdn+yApdbHRjK8B/AZQOG9IoLTlcGZV6fGQlMXv99UOAc2E9f2JDy60JgfuVEbOSBQLyjWPohTW4zEybzXqu1h+kAbDdJ4VgDvjKIIukLvaLU0/3edrxJv2F1vzxffuTN4yxoYp4lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676754; c=relaxed/simple;
	bh=K+TEgSiVuwxXGs6Z5bnbR/iz3UDTcW/fmThTq97jfTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cowQAwxz8p1lR4eZoeTOzWCL+gQysAIy9cW6+ccGs1BSh1XklN29hFmNfmVBvnw71opXEhuilyfO9bCgHZ579t55nkeb2WTUDA8EvrU3RL5bfEtAJUEUDc6iycDtBjiC5aBKtJRcVOcsoT1z2/1X1UuGV0C7Qk/VSFAB42kCOl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFiOBRcw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFiOBRcw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E525AC4CEED;
	Fri,  8 Aug 2025 18:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676754;
	bh=K+TEgSiVuwxXGs6Z5bnbR/iz3UDTcW/fmThTq97jfTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vFiOBRcwen47F8Ps+XJ4sPQwycU9Yd7TZfV89RjdSKVeDf5U5Juvj1u304HHafYT/
	 oJAxWzM2eu0ozviOiUvBi0ZBX1syoHXcVebDzT3ioy0M3cXPF5zLguWCK+ZUDdrdR4
	 vCujXiI2RWrDpscMyyqhWUJayahrlsl0jRI6BcjvXDi53szfPD2k791WH3ETOgkCxM
	 nfHYaRoi6tWl+dkFJhcfxqk3ZEP+Af8NVGgMh3JYjnmqHUw7E1iLwZG34NmBIf9LRa
	 bZfaSHanDD+zilkxMOOHNAWbZANQsSRnfP8w8yRe0VFSjvhZxhPN5wd6/oqYS+Erv0
	 SrIaLUyLEwcFw==
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
Subject: [PATCH v3 7/7] rust: alloc: kvec: implement IntoPageIter for VVec
Date: Fri,  8 Aug 2025 20:10:21 +0200
Message-ID: <20250808181155.223504-8-dakr@kernel.org>
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

Implement IntoPageIter for VVec; this allows to iterate and borrow the
backing pages of a VVec. This, for instance, is useful in combination
with VVec backing a scatterlist.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kvec.rs | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..d48db50bc2c4 100644
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
+use crate::page::IntoPageIter;
 use core::{
     borrow::{Borrow, BorrowMut},
     fmt,
@@ -1017,6 +1018,40 @@ fn into_iter(self) -> Self::IntoIter {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use kernel::prelude::*;
+/// use kernel::alloc::allocator::VmallocPageIter;
+/// use kernel::page::{IntoPageIter, PAGE_SIZE};
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
+impl<'a, T> IntoPageIter<'a> for VVec<T> {
+    type Iter = VmallocPageIter<'a>;
+
+    fn page_iter(&'a mut self) -> Self::Iter {
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

