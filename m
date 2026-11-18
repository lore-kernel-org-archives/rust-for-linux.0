Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018800;
	b=GE+AVTVIR7NHTS4zmo6k4PfYg1EStrONSOaQT+UbxwCFnLtfBGi3Wb1QqWbtiH9EZRF1
	 iVn6tYskmN4QxPE6eh+bVUbWoyK83ASgYHGvq+oO0uDz6ZDnYiJwTZYXtWL/BTlpzwSJh
	 tP4gz4ex9L560V7xc/VRCNmBZEP7v7ZZSpAHjd1047amsU00J4HblyedwtEefhvKPWFDD
	 oco4CjdlCjgDC03TuWGcssZgyw3UrP5OO33ebPXHps7lzJSK727NXpKgEMx7nZGC4nBa/
	 GIiKrKueg+28EBhqLqapzgJ225t6Kd2AzitP3OJmwunO/DHwLSb6L/1hPQ8fN1MAX/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018800;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5PFXXPSsfMDJDlYp7yb67baZRulWZFU5L1adTXgGMhE=;
	b=FNsxsxbDFV6gGp5hi83c78RKWrydX/uTxZwPsVAJY2WzgIqanZPhtyxXRQn70omMAGlz
	 aedjBv9SgA6nI8JwGorbzy5bYdT0VcmTaY/JK/yjZuiVLfEFbLQaXa9xoxvhP8How8ZHx
	 fxpBIi/qyWyDNxI/A5JRg2jMrv7iSyK0oDcNtYbg0V4GWNNlfUVhOc0xe3vZKaUzIaNVH
	 EsiucZD9l8bvtovchsPdN+QF5CSlU4g3S5e6B7DhG85iVr/+uEJ+rcjcMuAI6gdYZ1yPf
	 uWFzmA/n268XJ7S+T6wYk0dXoKV3AYq5Z11A5B205ctQwWH4XCFoSgaxZixxypIOGZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLaPgAOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E7606A320;
	Wed, 18 Nov 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLaPgAOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96CE1F000C6;
	Wed, 18 Nov 2026 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018800;
	bh=5PFXXPSsfMDJDlYp7yb67baZRulWZFU5L1adTXgGMhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YLaPgAOpZSeqiv/GBBQHaselm8XF/xJSYxOVtQMhFqqMYSqetL9go2WuEgQ0VoDYv
	 zY5kSp+O/lVbcAldahcH8g4jzTHZviWlt9YrIV0fQ1yRFsygzubCyq2l/lq4+KpFbt
	 /njypUKsnCWRoXYZ0sGcRr8B4qE24ncqa6mz/ikixkEtIXR0b8yfKLfZ48YADiZ8YA
	 uN0W1yo4/lbfDm0baixN9COrdSphJp5lToB1l4U6REi3HRiEp/FYItmRS/LbzVodTE
	 8fIFKjZSo9y7WI4B/fIc26zKn54i5MITMj1X1vPRxLAKW7yj+HC4KxhuB4KYXBXuJv
	 KYC62EhvxTz6g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 18 Nov 2026 17:18:20 +0100
Subject: [PATCH v22 4/6] rust: page: add `Exclusive` page kind for
 race-free page access
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-page-ownable-v22-4-d63ff73f4075@kernel.org>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
In-Reply-To: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 David Hildenbrand <david@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mike Rapoport <rppt@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Wilcox <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: Igor B <igor.b@beldev.am>, Vitaly Wool <vitaly.wool@konsulko.se>, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8167; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=xY9RyFcPl4honuAuuINh1RrHDHvkwLzV3ZF38f/rZhw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq/c/xpYsMcrhEizFw2WVSRB7xWSGK+Ui8ul2+B
 jEGczZmMiSJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCav3P8QAKCRD6UCkIqsW9
 0HMXD/9zu76ZNSF8FD1SDk3zbkc8OAq5R3/YxNFgifz0KcGKmxzJ2nLeKvGHiRBAg8N04n4Xqxx
 xrNOsVsIn0Arlu335s0FvlE0xBczWXQUC3jlbGTvO8ijEcIT3RFir+mEMeW8cEBI9MahFxJ/3ej
 ylfJOej+4g1fAXjc54iMbNgnbZlen3WwGN9CfunPlMrd6+t0h1hmCflK2gqs8fG7+ABZIAnotsp
 uPD1Hwz2S4tHUwwb7QsJLuZKaMdL0tKVEVbdosWg33iTp1kZ2fwtoIs23hfIRQugMKMeTT+dV+o
 XK2M3dgkWP9bKvnbcC4LIlD/AqgZWbu8+KOvda+bnQJXsdKCMXabMnhHGIh9+rrzFf2391O0prR
 8upDtDGK2CTuk3K5DSnRETPEHHoLtf+Fj0RZSn5fBT//hn0G89bDLoBwwfYxNJiDasLAGuKRuqH
 HN9g5KisLYB2wCctgtvxXBABg5mG21guJH5rlm32P4cb45NwJzZFgc/0jSZuhkex9Ie9LyY4Kj4
 u/0I1Cs5Xkkk4S+cyeNaYTSc2IgMoKZJXsEt/swm7JRJ1LyCBjxgPpp71vxI2ohi6DYnnLwPq2z
 lpUjztYtArOcyXPOJA1UtnyBtyxpGXOd1k5cLi89NdCcEFHu2srhUrwzcfLozhX0EukdmS/lmmg
 mn2iTTMQn8aCRGg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the page kind `Exclusive`. A `Page<Exclusive>` is a page that is
uniquely owned through an `Owned<Page<Exclusive>>`, with the added
invariant that the page data area does not incur data races. This means a
`Page<Exclusive>` cannot be mapped to user space or shared with devices,
and it becomes simpler to directly reference the contents of the page.

Back `Page<Exclusive>` by a frozen page, allocated with
`alloc_frozen_pages()` and freed with `free_frozen_pages()`. The reference
count of a frozen page is zero and references to it cannot be taken, so the
exclusive ownership is upheld by mm and not only by the Rust type system.

Add `Page::alloc_exclusive()` to allocate a `Page<Exclusive>`. The function
is not named `alloc_page()`, because inherent functions of the same name on
two page kinds would make the call `Page::alloc_page()` ambiguous.

`Page<Exclusive>` dereferences to `Page<Base>`. This does not allow
safe code to break the aliasing invariant of `Page<Exclusive>`:
`Page<Base>` does not implement `AlwaysRefCounted`, so no `ARef` to the
page can be obtained, and the raw data accessors are unsafe and already
require their callers to rule out races with all other accesses to the
page.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/page.c |  6 ++++
 rust/kernel/page.rs | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index 906eb4b18f02..8f9f624ea141 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -10,6 +10,12 @@ __rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
 	return alloc_pages(gfp_mask, order);
 }
 
+__rust_helper struct page *rust_helper_alloc_frozen_pages(gfp_t gfp_mask,
+							  unsigned int order)
+{
+	return alloc_frozen_pages(gfp_mask, order);
+}
+
 __rust_helper void rust_helper_get_page(struct page *page)
 {
 	get_page(page);
diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 2ceeac0237d5..c885bcf4f886 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -17,7 +17,11 @@
         ARef,
         AlwaysRefCounted, //
     },
-    types::Opaque,
+    types::{
+        Opaque,
+        Ownable,
+        Owned, //
+    },
     uaccess::UserSliceReader, //
 };
 use core::{
@@ -89,7 +93,7 @@ pub trait Sealed {}
 /// Marker trait for the kinds of a [`Page`].
 ///
 /// A page kind describes what is known about a `struct page`, and thereby what a [`Page`] of that
-/// kind can be used for. See [`Base`] and [`RefCounted`].
+/// kind can be used for. See [`Base`], [`RefCounted`] and [`Exclusive`].
 ///
 /// A [`Page`] of any other kind dereferences to a [`Page`] of the base kind [`Base`]. The
 /// purpose of the dereference is coercion: a reference to a page of any kind can be passed to code
@@ -134,6 +138,7 @@ impl PageKind for RefCounted {}
 ///
 /// - `Page<Base>` is a page for which nothing is known beyond its validity.
 /// - `Page<RefCounted>`, or just `Page`, is a page that is managed by the page reference count.
+/// - `Page<Exclusive>` is a uniquely owned page whose data follows standard Rust aliasing rules.
 ///
 /// Operations that are valid for any page are available for all page kinds. All other page kinds
 /// dereference to [`Page<Base>`], so that a reference to a page of any kind coerces to a
@@ -429,3 +434,90 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
 // SAFETY: All instances of `Page` are reference counted, so a `&Page` proves that the refcount is
 // non-zero and it is okay to obtain an `ARef<Page>` from it.
 unsafe impl AlwaysRefCounted for Page {}
+
+/// A [`PageKind`] for a page whose data area follows standard Rust aliasing rules.
+///
+/// A [`Page<Exclusive>`] is accessed through an owning [`Owned<Page<Exclusive>>`]. It has the same
+/// usage constraints as other Rust types. Thus, it cannot be mapped to user space or shared with
+/// devices. This makes it safe to reference the contents of the page while the page is mapped in
+/// kernel space.
+///
+/// A [`Page<Exclusive>`] is backed by a frozen page. The reference count of a frozen page is zero,
+/// and references to it cannot be taken. Thus, the exclusive ownership of the page is upheld by
+/// the kernel, and not only by the Rust type system.
+///
+/// # Invariants
+///
+/// For a [`Page<Exclusive>`]:
+///
+/// - The page is an order 0 frozen page: it was allocated with `alloc_frozen_pages()`, and its
+///   reference count is zero for as long as the [`Page<Exclusive>`] exists.
+/// - The page is owned by a unique [`Owned<Page<Exclusive>>`]. No references to the page exist
+///   together with the [`Owned<Page<Exclusive>>`], other than the ones borrowed from it.
+/// - The data of the page is accessed only through references to the [`Page<Exclusive>`],
+///   including the [`Page<Base>`] references it dereferences to.
+/// - Safe code reads the data of the page only through a shared reference, and writes it only
+///   through a mutable reference. The unsafe raw accessors of [`Page`] can write through a shared
+///   reference, their callers are required to rule out races with all other accesses.
+pub struct Exclusive;
+
+impl private::Sealed for Exclusive {}
+impl PageKind for Exclusive {}
+
+impl Deref for Page<Exclusive> {
+    type Target = Page<Base>;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `Page` is transparent over `struct page` for all page kinds, so the pointer cast
+        // is valid. `Base` has no invariants in addition to the ones of `Page`, which hold for
+        // `self`.
+        unsafe { &*ptr::from_ref(self).cast() }
+    }
+}
+
+impl Page<Exclusive> {
+    /// Allocates a new exclusive page.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::page::Page;
+    ///
+    /// let page = Page::alloc_exclusive(GFP_KERNEL | __GFP_ZERO)?;
+    /// # Ok::<(), kernel::alloc::AllocError>(())
+    /// ```
+    #[inline]
+    pub fn alloc_exclusive(flags: Flags) -> Result<Owned<Self>, AllocError> {
+        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
+        // is always safe to call this method.
+        let page = unsafe { bindings::alloc_frozen_pages(flags.as_raw(), 0) };
+        let page = NonNull::new(page).ok_or(AllocError)?;
+
+        // INVARIANT: The page was just allocated with `alloc_frozen_pages()`, so it is frozen, we
+        // own it, and its data is only accessible through the returned `Owned<Page<Exclusive>>`.
+        // SAFETY:
+        // - We just successfully allocated the page, so `page` points to a valid `struct page`.
+        //   Since `Page` is transparent over `struct page`, we can cast the pointer directly.
+        // - The page was just allocated, so no other `Owned` exists for it.
+        // - A `struct page` is never moved, so the page is pinned.
+        // - `Page<Exclusive>` allows no other references to exist together with the `Owned`, and
+        //   none exist, as the page is newly allocated and references cannot be taken to a frozen
+        //   page. Thus, it is sound to hand out `&Page<Exclusive>` and
+        //   `Pin<&mut Page<Exclusive>>`.
+        // - Pages have no logic that relies on them staying on a given thread or on them not being
+        //   accessed concurrently.
+        Ok(unsafe { Owned::from_raw(page.cast()) })
+    }
+}
+
+impl Ownable for Page<Exclusive> {
+    #[inline]
+    unsafe fn release(this: NonNull<Self>) {
+        // SAFETY: By the function safety requirements, we have exclusive ownership of the page, and
+        // by the type invariant the page is an order 0 frozen page, so we can free it with
+        // `free_frozen_pages()`. Since `Page` is transparent over `struct page`, we can cast the
+        // pointer directly.
+        unsafe { bindings::free_frozen_pages(this.cast().as_ptr(), 0) };
+    }
+}

-- 
2.54.0


