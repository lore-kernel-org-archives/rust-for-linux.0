Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CF3B7770;
	Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663772; cv=none; b=ErQcSstJHJIVlTNhKxQdMD+XJ6TumI68X4J3EqEZUnTuxakZoE4jxiPqU5J8UTyl1i/4+eUDmvD6eO71eYlc4lV1GyqeiCoNzT+gu/uCZzXLoWBvSPijhl+a2UssBJPxddFfSiapif4XY4vqhBoPi7f8+N7qV53llBuvZOpv1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663772; c=relaxed/simple;
	bh=AelOEKha7GwTPFJdgoQQNjBmJCDzWgaXA39VobkZzlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQRConXDwa6h6BgxORmYnC0ZJmTFmkHT9u0Raqs7z9B5uYc9Y5xmIZlbapn7An4sXZIz75BkdODBydNWbQBDVvbHEiVC1wiLTsjAIHjTs5QLcc7l1DXepzloMUDoKXFTF3acE07/tnLN1u644GODLiOAt3HfbEOgbLUqAPpvTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lnniuxn6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lnniuxn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB1C1F00893;
	Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663771;
	bh=DbXvzqzWUI/yNPOIrBVfVpZL6e03sj4LaZM/QYpv8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lnniuxn6zpcULhgD86Zhf0jeGeat3INq1QENC+Sop/i/8bGteKv/mrWHE+7W3Jwxc
	 keasW1MGaUmrwkAoM2dmE3gOeyUfRckryjBj2OpLE4DfNvUgTk+7B/oWuxhZGC8PjD
	 qWy8YOpMT5MWGoLrhkMJxThiguUtONFUj5LOpooIchKY6C20S+FXtzRvH9D8AWM/uw
	 S4zkifYchvwcNAAOMi8qL/4sO985EylJXWhWsejA8yHsSS3JamwwLBL9YsPiIxDCZ/
	 UZyWwhqfnz7sm6zltX5XHsLdOVDvuXDspx46t0zVeuP0de/0dO1GVxmHBchQCvm+KF
	 F5eBPZ7pBKSow==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 14:49:14 +0200
Subject: [PATCH v2 1/2] rust: page: add `SafePage` for race-free page
 access
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
In-Reply-To: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4342; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=AelOEKha7GwTPFJdgoQQNjBmJCDzWgaXA39VobkZzlQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsXOnWIygn8Vagmtn4BvhUyA54DhFiX+GqHf3
 rcWSH+7qj6JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLFzgAKCRD6UCkIqsW9
 0KDPD/wMbFzdfGL4JHtCnbq0hmUaI2BPJbBiOMFMIOKGztxXzGWLm8dWGL6HoCLKAl3EsJNGXtx
 2ZpIV7WmOrWIAbAklAreGAgmpiDsTVBF4XHQiDjszP72ZE4glAHF0Z1di2pqmNBR9RRruV0H+MH
 QD+HdyV77pVYqiEGv9m3ZWeH/tuSP4r88hrAg/UbF0eVOaKUU83DfSoxahRgBByJAZKUHULhxq/
 tXQfC4nkHUH+FLe+vk39JDQPxsWeHnaVHe+c2gYGOVvW47B33Ra+oX0vcW0Ty0cNYYeIJH6hLYM
 iSyFJpRqI2nHkHjud11gNeRrvJd7m5c7OH6x1Ym8OaGfo4U8QNTLjh/mKPvdPevZWArkimyOR4w
 0BfnxijniadAUC+qj7lsYHPFt0BnL/aQjYe00uyoZ2zYR4gmBMDjDTVCpbdIi39KQjuhgF3Bcwm
 5vHsTIfDGaLWYe12xSYAZvyUxc13xeaVEpSAliOG1+VK7KL6O5OZL6r3uiag5HXAjDg6POliC+B
 aVev1PAe51A8UrYLR8d9J+04A73jHL6Dg++nfdSsIyUsyVjXjnA/8iYnDPGcfnYHqfkMvPyjj0G
 xp9LUSluY/7422BOR40JG5Tk3wo6QxhPTfet9h/Ee6F8Qr5kuZs9Uw3OTIamF16UxxevVx2Oy4K
 xzOlM3UW2luVfqQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`SafePage` wraps a regular page but adds an invariant that the page data
area does not incur data races. This means `SafePage` cannot be mapped to
user space or shared with devices, and it becomes simpler to directly
reference the contents of the page.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 73 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index d56ae597f692..f143b42d1bd6 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -8,8 +8,10 @@
         Flags, //
     },
     bindings,
-    error::code::*,
-    error::Result,
+    error::{
+        code::*,
+        Result, //
+    },
     types::{
         Opaque,
         Ownable,
@@ -20,7 +22,7 @@
 use core::{
     marker::PhantomData,
     mem::ManuallyDrop,
-    ops::Deref,
+    ops::{Deref, DerefMut},
     ptr::{
         self,
         NonNull, //
@@ -193,14 +195,10 @@ impl Page {
     /// ```
     #[inline]
     pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
-        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
-        // is always safe to call this method.
-        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
-        let page = NonNull::new(page).ok_or(AllocError)?;
-        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
-        // allocated page. We transfer that ownership to the new `Owned<Page>` object.
-        // Since `Page` is transparent, we can cast the pointer directly.
-        Ok(unsafe { Owned::from_raw(page.cast()) })
+        let page = SafePage::alloc_page(flags)?;
+        // SAFETY: `SafePage` is `#[repr(transparent)]` over `Page`, so a pointer to a `SafePage`
+        // with ownership is also a pointer to a `Page` with ownership.
+        Ok(unsafe { Owned::from_raw(Owned::into_raw(page).cast()) })
     }
 
     /// Returns a raw pointer to the page.
@@ -401,3 +399,56 @@ unsafe fn release(&mut self) {
         unsafe { bindings::__free_pages(ptr.cast(), 0) };
     }
 }
+
+/// A page whose data area follows standard Rust aliasing rules.
+///
+/// [`SafePage`] has the same usage constraints as other Rust types. Thus, it cannot be mapped to
+/// user space or shared with devices. This makes it safe to reference the contents of the page
+/// while the page is mapped in kernel space.
+///
+/// # Invariants
+///
+/// The data of this page is accessed only through references to [`SafePage`]. While a shared
+/// reference to a [`SafePage`] exists, there are no writes to its data. While an exclusive
+/// reference exists, there are no other reads or writes of its data.
+#[repr(transparent)]
+pub struct SafePage(Page);
+
+impl SafePage {
+    /// Allocate a new `SafePage`.
+    pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
+        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
+        // is always safe to call this method.
+        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
+        let page = NonNull::new(page).ok_or(AllocError)?;
+
+        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
+        // allocated page. We transfer that ownership to the new `Owned<SafePage>` object. Since
+        // `Page` and `SafePage` are transparent, we can cast to the raw page pointer directly.
+        Ok(unsafe { Owned::from_raw(page.cast()) })
+    }
+}
+
+impl Ownable for SafePage {
+    #[inline]
+    unsafe fn release(&mut self) {
+        let ptr: *mut Self = self;
+        // SAFETY: By the function safety requirements, we have ownership of the page and can free
+        // it. Since `SafePage` and `Page` are transparent, we can cast the raw pointer directly.
+        unsafe { bindings::__free_pages(ptr.cast(), 0) };
+    }
+}
+
+impl Deref for SafePage {
+    type Target = Page;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl DerefMut for SafePage {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}

-- 
2.51.2


