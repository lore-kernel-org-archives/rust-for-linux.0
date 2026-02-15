Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C4236453;
	Sun, 15 Feb 2026 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185838; cv=none; b=FNcRNEvC+5FqWawh0tTo29TAgdXS4VuGvuAPaztkkQxq6DjMrJADELy2g5wl2fQPjZknyk51/BTqDjvkl/VYCmysND5Rp05DOvNt7wJN+LVp9in5mkfsh4scDcgJkqrAuYwMEUv1JfkmODVZ7zWx7PmCTDTey7EqwBLppMQo+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185838; c=relaxed/simple;
	bh=16ErT7tLYfWISzpJ8b5qwJAb4ilevh+0/RrBfgm5lwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duA669FhtjNxxw2FO1Qoqm1o7EoyrNEeZukOUSx7hslttGpbkFRMfNh7JkemM2X27uajt4ktqhcsnGxVYBpogt52mdEwokvUP9kdKezrWi2YXyIiBcF1UtzsE0fScpjXWCRQSb6sKT86g7Czy1a4qNdOAeNRautAlB5BbGU1yaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJZxpCU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJZxpCU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E00AC4CEF7;
	Sun, 15 Feb 2026 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185837;
	bh=16ErT7tLYfWISzpJ8b5qwJAb4ilevh+0/RrBfgm5lwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UJZxpCU874plNifAdpneFJpY9yx3zf5ItZ17fPfIhmJP+AaRU5qKxMDo8RIYv/wbe
	 eY1kho6Vgic9sto7kbzCXRBBQ0N/h6rYLW0/SYC3sV6AP3qUoh19WQ7s6Y/PvF8U3p
	 nHaQT5LVOG+qZhuHGVR8Kx1p2ohO7YQFNBPer4MrEwbVwYCU1/fGVV8rbK9uT6hnjs
	 HhlLxaWJx3tD5LKYuNbeerw3a4QGHJLNI3o93kpI3H35XFVMNuZj4qlTb/a6fwhHHf
	 bu2ldrKVYM5ZzW5354EVqhjcPez+/7IS7i5MxJ0OGYsObw3flHp3NEG2bXGJc8eKfT
	 mKc3S3DUqItcg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:03:30 +0100
Subject: [PATCH 1/2] rust: page: add `SafePage` for race-free page access
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-page-additions-v1-1-4827790a9bc4@kernel.org>
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
In-Reply-To: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4184; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=16ErT7tLYfWISzpJ8b5qwJAb4ilevh+0/RrBfgm5lwk=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiadRVY9lpm/5LZoWI728311H4v535vYULVUX
 UcUi+8W+tuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZImnQAKCRDhuBo+eShj
 d2mED/9sVfNPy46IZ/jMpmYFSjo/ki9ckRVDjR7guwCQ/QRD6BQUhSpqDYxDryxI4ia/9Q7d2Kr
 RYS+gJFgpX+3/zYH97BBk5Tji+MY85/R0CdYsUGj0wG4yfTDY5+fYb2JZvmeYTpv1H5mxT7OgmL
 LTJAa3GHWSquacf2EyRQi6H0q9jO4ZcrMo59zqhUzScZ//CXuRQUibcNgnDuUplzrQ4sCeXJdpU
 afzCWzbNq//sJjQrijzPa5obnqvB4xhQ/hQRcrHPnCVjJi3sutlw5OJEbH74qRd3Ws9Kyf+wVSq
 nru8NP7U9yE9wgcj6gTjqzcM53Y7sr8F1p8XClcZ9pZh88sr4XfA4GrcMWgMNvn+f26ja8gHW1Y
 nDVRXK31h3RtrnEvXJQAwb59BXVHLKD0MZj0AGeotKLudo9TgIDgNqfCn1XKcmYkro654ZP4kCI
 Fx/6LeVsF9oamkZ85dvv16bAZl4SbVKEz8Z38ltereGxCUDyDcomSDIE4C0Bo6InH+ZXSPgqJIx
 1+cvFKJdOJjQaeSflubAM+Gi4xdqmCMZGF9SxLE5ylFqfwYACzdT+eM4qmFeoFnSgrMg4+qzMe6
 HWrXHEc0cK27FiQchXUHXsnm4a/LLV25ee6iHkG50qBfufMApZSSxu6PyOPM8yze8l7w4NyRiQt
 RGy79GLA4Lawtfg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`SafePage` wraps a regular page but adds an invariant that the page data
area does not incur data races. This means `SafePage` cannot be mapped to
user space or shared with devices, and it becomes simpler to directly
reference the contents of the page.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 69 +++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 803f3e3d76b22..af6d2ad408ed7 100644
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
@@ -147,6 +149,13 @@ unsafe impl Send for Page {}
 unsafe impl Sync for Page {}
 
 impl Page {
+    fn alloc_page_raw(flags: Flags) -> Result<NonNull<bindings::page>, AllocError> {
+        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
+        // is always safe to call this method.
+        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
+        NonNull::new(page).ok_or(AllocError)
+    }
+
     /// Allocates a new page.
     ///
     /// # Examples
@@ -170,10 +179,7 @@ impl Page {
     /// ```
     #[inline]
     pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
-        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
-        // is always safe to call this method.
-        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
-        let page = NonNull::new(page).ok_or(AllocError)?;
+        let page = Self::alloc_page_raw(flags)?;
         // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
         // allocated page. We transfer that ownership to the new `Owned<Page>` object.
         // Since `Page` is transparent, we can cast the pointer directly.
@@ -378,3 +384,52 @@ unsafe fn release(this: NonNull<Self>) {
         unsafe { bindings::__free_pages(this.cast().as_ptr(), 0) };
     }
 }
+
+/// A page whose data area does not incur data races.
+///
+/// [`SafePage`] has the same usage constraints as other Rust types. Thus, it cannot be mapped to
+/// user space or shared with devices. This makes it safe to reference the contents of the page
+/// while the page is mapped in kernel space.
+///
+/// # Invariants
+///
+/// There are no data races for the contents of this page.
+#[repr(transparent)]
+pub struct SafePage(Page);
+
+impl SafePage {
+    /// Allocate a new `SafePage`.
+    pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
+        let page = Page::alloc_page_raw(flags)?;
+
+        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
+        // allocated page. We transfer that ownership to the new `Owned<Page>` object.
+        // Since `Page` and `SafePage` is transparent, we can cast the pointer directly.
+        Ok(unsafe { Owned::from_raw(page.cast()) })
+    }
+}
+
+// SAFETY: `Owned<SafePage>` objects returned by SafePage::alloc_page() follow the requirements of
+// the Ownable abstraction.
+unsafe impl Ownable for SafePage {
+    #[inline]
+    unsafe fn release(this: NonNull<Self>) {
+        // SAFETY: By the type invariants, we have ownership of the page and can free it. Since
+        // `SafePage` and `Page` are transparent, we can cast the raw pointer directly.
+        unsafe { bindings::__free_pages(this.cast().as_ptr(), 0) };
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


