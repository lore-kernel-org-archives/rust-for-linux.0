Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28321FF41
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513480; cv=none; b=THcihG5rLbEdV8oeQyfoW/KiUuibqu6LOaiSyRfA+1Hxx3zEAQAQEe+8m8+tsiYBLV/85WE7QndMTrvDphyIj0M41OctYyS8NzULqXp9Zunc0PLkDAJ9ZzT4ywF6rUgDrX9Er1DVXkHt0IN5tX0wmvEvINKScpYZAf7Bdd2yY5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513480; c=relaxed/simple;
	bh=9wcD4F0DkiQgqCaUR621MLsQ5Kr9Nf9Dh77BDozgqrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPusYeMuIg4ozfaW/h1ZupQdSrN/Lo3h1F0rzX7gsd9AQFXTDh5Xjka+t3Lsw02LSwpJK2vnqNK6DQUBVsKel9V8JYuN+1Arv+cs5neHxiALzpCqqvsH/4OQs1BwjDiYEcUXVoVZ759L4pBLswsbNMlHCnhPZYrJ7m/tqOvoID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f68ZKMuI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f68ZKMuI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E80C4CEED;
	Wed,  6 Aug 2025 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513480;
	bh=9wcD4F0DkiQgqCaUR621MLsQ5Kr9Nf9Dh77BDozgqrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f68ZKMuIgkrDhmXhomVATauMRTUoiISBeylj9sIcWIvlnV+LzKkIlDp49RUS/+JVK
	 Qf2IkCHa7Msb5rMok+Pwb8aI+C5fJsYCBIbJXZPG0GFIzFkWD6SCGQa5zAGSowPZIy
	 N7hk+yvBiaTSot9IFQYBeRQWAmti8ciF+GMlY1m5QliBFElv+e6gfdJJayITeBxP+q
	 wEf6e7Tp85YH/MW8II4MN19j23TedWqm3pbkXqnmWgbOwoRdbDbIUE45wI0tEQTBKi
	 QwAz381RXgaC2UdRM65FAhkzwALyGOOlFCqdCzttS6wKHF08qXT5QtOaxme3VBKiRm
	 DVEY9tTE9gdTw==
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
Subject: [PATCH v2 6/6] rust: alloc: kvec: implement PageOwner for VVec
Date: Wed,  6 Aug 2025 22:50:15 +0200
Message-ID: <20250806205044.85085-7-dakr@kernel.org>
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

Implement the PageOwner trait for VVec; it allows to iterate and borrow
the backing pages of a VVec. This, for instance, is useful in combination
with VBox backing a scatterlist.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kvec.rs | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..88ad30cfc427 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -21,6 +21,7 @@
     slice,
     slice::SliceIndex,
 };
+use kernel::page;
 
 mod errors;
 pub use self::errors::{InsertError, PushError, RemoveError};
@@ -1017,6 +1018,45 @@ fn into_iter(self) -> Self::IntoIter {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use kernel::{page, prelude::*};
+/// use kernel::page::PageOwner;
+///
+/// let mut vec = VVec::<u8>::new();
+/// vec.reserve(page::PAGE_SIZE, GFP_KERNEL)?;
+///
+/// let page = vec.page_iter().next().expect("At least one page should be available.\n");
+///
+/// // SAFETY: There is no concurrent read or write to the same page.
+/// unsafe { page.fill_zero_raw(0, page::PAGE_SIZE)? };
+/// # Ok::<(), Error>(())
+/// ```
+impl<T> page::PageOwner for VVec<T> {
+    fn page_iter<'a>(&'a mut self) -> impl Iterator<Item = page::BorrowedPage<'a>> {
+        (0..self.page_count()).map(|idx| {
+            let ptr = self.as_mut_ptr().cast::<u8>();
+
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
+        self.layout.size().div_ceil(page::PAGE_SIZE)
+    }
+}
+
 /// An [`Iterator`] implementation for [`Vec`] that moves elements out of a vector.
 ///
 /// This structure is created by the [`Vec::into_iter`] method on [`Vec`] (provided by the
-- 
2.50.1

