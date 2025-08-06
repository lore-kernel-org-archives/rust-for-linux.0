Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85401A76DA
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513476; cv=none; b=KKTPXFMTl6ItvL77Ey6w35NY1sxCFu6NvLmZedjULOSxdJMfporztbporyIfkGh1bQQ57DdBpBzW8TH/l2+29UnT3oNLz6v7nyFGEJThILUWEurXjzEsX/E89kMmiXXRp44BEVhhr5jTExNW467pTL99cm/T6R9kL2xz3OxY334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513476; c=relaxed/simple;
	bh=5cF0OrHGUzGN3wlLpdhW1mvM7+ctb+grtocyPMLDD+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzGQ1BW0FzzsNhUqXe0ltBN6bqgf/zljz7+WfYAUGY5cN+7xnYvOYx8BemsdnnfDJl+BFi7LILU5LjdIGVwzTUnjvQcIP7cI9qE0PcUsWP2o8PcksHV2lWt0VlLaCfH2QrH4CxpRtiWa2JhU5vmg2EDJ5yvC2JGdjWK0DBr4pj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJJneRdl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJJneRdl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8193CC4CEE7;
	Wed,  6 Aug 2025 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513476;
	bh=5cF0OrHGUzGN3wlLpdhW1mvM7+ctb+grtocyPMLDD+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJJneRdljlYBlnVhhYCbqlDh8Mm1RuDoU2OFDSrnNE6gOlfhRWt229gcJesC4IR21
	 ae13pG/l/OBOe7vokLAr74DWpuPD8UxjFezj1jPUXYDvhy7mmbnSDByBU5u4fR9FjE
	 Nr1prrbYDeREYOEXDYyGMJ2pjL9ucZV45Ci+yUiFHOA2XgLfO4TI07HwO5xEPlIC+g
	 lQ4NVe4hwe+P1oAPvXRSe0tHEtzKWd0RzZX3pz5O6BfjPp6vBWYECfh/rwG9qiTuqk
	 EPIdZQK3kXZbyuZn+totK9BJFVY7bWli7wU+Jlcn/pSKMaNnEzEUXm3RyGxWvOwKJJ
	 kTCk+5gSMwe8A==
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
Subject: [PATCH v2 5/6] rust: alloc: kbox: implement PageOwner for VBox
Date: Wed,  6 Aug 2025 22:50:14 +0200
Message-ID: <20250806205044.85085-6-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806205044.85085-1-dakr@kernel.org>
References: <20250806205044.85085-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the PageOwner trait for VBox; it allows to iterate and borrow
the backing pages of a VBox. This, for instance, is useful in
combination with VBox backing a scatterlist.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..bcca798d466b 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -18,6 +18,7 @@
 
 use crate::ffi::c_void;
 use crate::init::InPlaceInit;
+use crate::page;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
 
@@ -598,3 +599,44 @@ fn drop(&mut self) {
         unsafe { A::free(self.0.cast(), layout) };
     }
 }
+
+/// # Examples
+///
+/// ```
+/// # use kernel::{page, prelude::*};
+/// use kernel::page::PageOwner;
+///
+/// let mut vbox = VBox::<[u8; page::PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
+///
+/// let page = vbox.page_iter().next().expect("At least one page should be available.\n");
+///
+/// // SAFETY: There is no concurrent read or write to the same page.
+/// unsafe { page.fill_zero_raw(0, page::PAGE_SIZE)? };
+/// # Ok::<(), Error>(())
+/// ```
+impl<T> page::PageOwner for VBox<T> {
+    fn page_iter<'a>(&'a mut self) -> impl Iterator<Item = page::BorrowedPage<'a>> {
+        (0..self.page_count()).map(|idx| {
+            let ptr = self.0.as_ptr().cast::<u8>();
+
+            // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
+            // bumped to 1.80 or later.
+            //
+            // SAFETY: `idx` is in the interval `[0, self.page_count())`, hence the resulting
+            // pointer is guaranteed to be within the same allocation.
+            let ptr = unsafe { ptr.add(idx * page::PAGE_SIZE) };
+
+            // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.0`.
+            let ptr = unsafe { NonNull::new_unchecked(ptr) };
+
+            // SAFETY:
+            // - `ptr` is a valid pointer to a `Vmalloc` allocation.
+            // - `ptr` is valid for the duration of `'a`.
+            unsafe { Vmalloc::to_page(ptr) }
+        })
+    }
+
+    fn page_count(&self) -> usize {
+        core::mem::size_of::<T>().div_ceil(page::PAGE_SIZE)
+    }
+}
-- 
2.50.1

