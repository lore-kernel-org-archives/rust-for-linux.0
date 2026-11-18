Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018768;
	b=U956QsS1cPmc4gUGUOfV9zxIzoRbxYdEyHcDe3BihjWErBKxfkh6YHJ9PiwzBMWYMIlR
	 /+csVzsmQjFXJTiP1k+MypFai4ec5zELPGUwK+bw+Gh9R3gZ7J6IINEKw++kW6bGDT42l
	 am3muAxytloK3BqbAkCzSjTOiXQOpTiKs+M5pxA2SGrVLoJE7Tlx2grY1gYSAHDegAyYU
	 wXHN7NEBFCLb+hEE2kfsXNz08ZVH4n4/6w2f5qk9gTnE/NiuBL/dw+xJ3utYm7KtE5hTw
	 KFveaNxHZY2BstY8VIOiQUkzK+K3BeOAMQtJesvHB6MGQjoXiC7mue2ylmyBke4BXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018768;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lfJ1U6GAUY5nvCPJBCFr7CLJQzGKL6s35NyuvWOW+5A=;
	b=NLX6+Of5eleCmO18AEzKn3+nSuRxNgsDgK5iLy71h82eqNs4wm9DbPuqBzLfuKlqJi4T
	 QtS1jhXRP1mJHIPLFdrMh4FEZutkZ6g8WVG+PseXNGMNZEcJJUfxuG+dBY4IdOzYw95/a
	 z+aCPhu3TBg/rVc6gfNhOlGk5CFxqaz7e/tZxQ9ijdJeeZI6P+eio/FxH0gJMcjcFhlvS
	 mgQUhVfUmjsx5qFfE9Wm+uAcPNc5VozUkoydfVIwb16jA9VSk9aNxefmawMBQx4EAV83E
	 gyRCTKn6L5ubw7x9hZEIMfNI2fffbCij5rCNlLgtrk3wuOgrxVexNSmBuirX/sEplug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7lhddE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681B606A336;
	Wed, 18 Nov 2026 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7lhddE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD291F000C7;
	Wed, 18 Nov 2026 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018767;
	bh=lfJ1U6GAUY5nvCPJBCFr7CLJQzGKL6s35NyuvWOW+5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a7lhddE8NZgO7RkpHpHdFT3EaTzwo4YD1EWrEKXB288YslLjajdhG0RxK1Sh8ilmc
	 MP6pZyytAuyEx6gqPUm4V58W2839a2Grx3TJ6TJmoq7Cw0w/nInt60bH87uT/ff+6C
	 14NIcT1pNQAE0NVQvdG7ZrAeLAvx/Ehmfqw+uYU3QB6LU/q0OwzK4Pwapk5W49jU5Y
	 CsgjH0nQl1o8wY42mR1PVn+i6acLe5zbrq9he1KNLlLQ6TF8mixOYAYXyIsTidIFH/
	 DHr+ShKotAADz94IH7bFj53+cQiU4wqIvpDiWC+BrLJyvdjd7x1room+4cPfU0j2E+
	 Fb/KbrF0NV4mA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 18 Nov 2026 17:18:22 +0100
Subject: [PATCH v22 6/6] rust: page: add slice access to `Page<Exclusive>`
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
Message-Id: <20261118-page-ownable-v22-6-d63ff73f4075@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18047;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=s0mClFUK2wzh4pk1qcJEN5DgAjJC6KCuY81fwvUngOw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq/c/z3G0r68hOAwz0JLRYCMgOz+DYYkVegMCkF
 5LoL21IaOyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCav3P8wAKCRD6UCkIqsW9
 0FxuD/4mUXZ3DamRYuLlE5SaelXEdLduByetCSJzOykBTmYAaT8rO8/by7wzJwLc6nbNNLvjrbR
 XjSawxPJOyGK5p1JvQJ1pM5JbTOvLhGXhX8sBTTYW4O5Es545ukDpac5bop7ckahcWIyMsLRTTQ
 tXSyG7m146mBl0fUpUlH1ANVNIFKrQmwonA910QWFfBnPBj1u3lw9tcMhFovYdVhytZpjpJU+YT
 T6X2NDkxTTcaPB0+ZdhzVT/+dKu/4XS50bJIHIehBW+vqUsM24g2T9r0+z7ZYU3wXJWkkwG4bqy
 UTib+WwGOMV/iB/wwTeEpXseZAGnZ2nz0PGHMU+iHvTJgSOg1BnuBPuGFeE/0gwJLYVekvB8Z1N
 vhlDJBW4LKYA4z29BFyJga2YjD5J5L07KuSFn9fN93ppcr91yJvuvOpkxn6ZHyWiKBcLKz04Q75
 tXh/nqE1LDdXkXiuywozXftdlVkRnCWRoVh4OJAQrrcHeeu0xNYd8dpoj3GSSo/cK2M2uAOkAeA
 PGXuAi4hQWNfkgkji5nj60NcEtqfHbonFkF9gT/VA9p2NCjqCUpqwqUsYuxK7MwnDqoT/2lLF+/
 mqy0ClcWF4jEitRpy2x2SnA7jITtNVGGmRscf3cLmvWV3e2qR0AmWf2TPdkIUj8Gf6TPSjR81J7
 Su5Z7w2cFESWWZw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The data of a `Page<Exclusive>` follows standard Rust aliasing rules, so
it can be handed out as a slice. Add `Page::as_slice()` and
`Page::as_mut_slice()` for `Page<Exclusive>`, which return the data of
the page as `&[u8]` and `&mut [u8]` respectively.

For this to be sound, add two invariants to the `Exclusive` page kind:

 - The data of the page is initialized. Thus, always allocate the page
   with `__GFP_ZERO`.
 - The page is not a highmem page. The data of the page is then
   permanently mapped in the kernel address space, and a slice can refer
   to it without a temporary mapping. Thus, never allocate the page
   with `__GFP_HIGHMEM`.

A `Page<Exclusive>` dereferences to `Page<Base>`, so the unsafe raw
data accessors can be called on it. These only required their callers to
rule out data races, which does not prevent a write to the page while a
slice to the data of the page exists. Thus, tighten the safety
requirements of the raw accessors: no reference to the data that is
written may exist, no mutable reference to the data that is read may
exist, and data written to a `Page<Exclusive>` with `write_raw()` must
be initialized.

Update the safety comments of the existing callers of the raw accessors,
in the binder driver and in the allocator documentation examples, to
cover the new requirements.

Add the helper `rust_helper_page_address()`, as `page_address()` is a
macro in some configurations.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 drivers/android/binder/page_range.rs | 16 ++++--
 rust/helpers/page.c                  |  5 ++
 rust/kernel/alloc/allocator.rs       |  3 +-
 rust/kernel/alloc/kbox.rs            |  3 +-
 rust/kernel/alloc/kvec.rs            |  3 +-
 rust/kernel/page.rs                  | 98 +++++++++++++++++++++++++++++++-----
 6 files changed, 110 insertions(+), 18 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 451369e07e7f..db0853751993 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -538,7 +538,9 @@ pub(crate) unsafe fn copy_from_user_slice(
         offset: usize,
         size: usize,
     ) -> Result {
-        // SAFETY: `self.iterate` has the same safety requirements as `copy_from_user_slice`.
+        // SAFETY: `self.iterate` has the same safety requirements as `copy_from_user_slice`. The
+        // pages of this range are `Page<RefCounted>` pages, and this driver never creates a
+        // reference to their data, so no reference to the data that is written exists.
         unsafe {
             self.iterate(offset, size, |page, offset, to_copy| {
                 page.copy_from_user_slice_raw(reader, offset, to_copy)
@@ -560,6 +562,9 @@ pub(crate) unsafe fn read<T: FromBytes>(&self, offset: usize) -> Result<T> {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
                 let obj_ptr = out.as_mut_ptr().cast::<u8>().add(out_offset);
                 // SAFETY: The pointer points is in-bounds of the `out` variable, so it is valid.
+                // The pages of this range are `Page<RefCounted>` pages, and this driver never
+                // creates a reference to their data, so no mutable reference to the data that is
+                // read exists.
                 page.read_raw(obj_ptr, offset, to_copy)?;
                 out_offset += to_copy;
                 Ok(())
@@ -581,7 +586,10 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
             self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
                 let obj_ptr = ptr::from_ref(obj).cast::<u8>().add(obj_offset);
-                // SAFETY: We have a reference to the object, so the pointer is valid.
+                // SAFETY: We have a reference to the object, so the pointer is valid. The pages
+                // of this range are `Page<RefCounted>` pages, and this driver never creates a
+                // reference to their data, so no reference to the data that is written exists. As
+                // the page is not a `Page<Exclusive>`, the object does not have to be initialized.
                 page.write_raw(obj_ptr, offset, to_copy)?;
                 obj_offset += to_copy;
                 Ok(())
@@ -595,7 +603,9 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
     ///
     /// All pages touched by this operation must be in use for the duration of this call.
     pub(crate) unsafe fn fill_zero(&self, offset: usize, size: usize) -> Result {
-        // SAFETY: `self.iterate` has the same safety requirements as `copy_into`.
+        // SAFETY: `self.iterate` has the same safety requirements as `fill_zero`. The pages of
+        // this range are `Page<RefCounted>` pages, and this driver never creates a reference to
+        // their data, so no reference to the data that is written exists.
         unsafe {
             self.iterate(offset, size, |page, offset, len| {
                 page.fill_zero_raw(offset, len)
diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index 8f9f624ea141..313a3a3b30b7 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -26,6 +26,11 @@ __rust_helper void rust_helper_put_page(struct page *page)
 	put_page(page);
 }
 
+__rust_helper void *rust_helper_page_address(const struct page *page)
+{
+	return page_address(page);
+}
+
 __rust_helper void *rust_helper_kmap_local_page(struct page *page)
 {
 	return kmap_local_page(page);
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index bf20714156c5..5d13dd1a8942 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -195,7 +195,8 @@ impl Vmalloc {
     ///     // `ptr` is valid for the entire lifetime of `page`.
     ///     let page = unsafe { Vmalloc::to_page(ptr.cast()) };
     ///
-    ///     // SAFETY: There is no concurrent read or write to the same page.
+    ///     // SAFETY: There is no concurrent read or write to the same page, and no reference to
+    ///     // the data of the page exists.
     ///     unsafe { page.fill_zero_raw(0, page::PAGE_SIZE)? };
     /// }
     /// # Ok::<(), Error>(())
diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 7e8ce3b36673..0d02b95b219e 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -745,7 +745,8 @@ fn drop(&mut self) {
 ///
 /// let page = vbox.page_iter().next().expect("At least one page should be available.\n");
 ///
-/// // SAFETY: There is no concurrent read or write to the same page.
+/// // SAFETY: There is no concurrent read or write to the same page, and no reference to the
+/// // data of the page exists.
 /// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
 /// # Ok::<(), Error>(())
 /// ```
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da4fa..57e0242a1dde 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1230,7 +1230,8 @@ fn into_iter(self) -> Self::IntoIter {
 ///
 /// let page = vec.page_iter().next().expect("At least one page should be available.\n");
 ///
-/// // SAFETY: There is no concurrent read or write to the same page.
+/// // SAFETY: There is no concurrent read or write to the same page, and no reference to the
+/// // data of the page exists.
 /// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
 /// # Ok::<(), Error>(())
 /// ```
diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index c629764f773b..19b9c35a3e70 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -4,6 +4,10 @@
 
 use crate::{
     alloc::{
+        flags::{
+            __GFP_HIGHMEM,
+            __GFP_ZERO, //
+        },
         AllocError,
         Flags, //
     },
@@ -27,6 +31,7 @@
 use core::{
     marker::PhantomData,
     ops::Deref,
+    pin::Pin,
     ptr::{
         self,
         NonNull, //
@@ -333,6 +338,8 @@ fn with_pointer_into_page<T>(
     /// * Callers must ensure that `dst` is valid for writing `len` bytes.
     /// * Callers must ensure that this call does not race with a write to the same page that
     ///   overlaps with this read.
+    /// * Callers must ensure that no mutable reference to the data of the page that overlaps with
+    ///   this read exists during this call.
     pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
         self.with_pointer_into_page(offset, len, move |src| {
             // SAFETY: If `with_pointer_into_page` calls into this closure, then
@@ -355,6 +362,11 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// * Callers must ensure that `src` is valid for reading `len` bytes.
     /// * Callers must ensure that this call does not race with a read or write to the same page
     ///   that overlaps with this write.
+    /// * Callers must ensure that no reference to the data of the page that overlaps with this
+    ///   write exists during this call. Such references can be obtained from a
+    ///   [`Page<Exclusive>`], see [`Page::as_slice`].
+    /// * If the page is a [`Page<Exclusive>`], callers must ensure that the `len` bytes at `src`
+    ///   are initialized.
     pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Result {
         self.with_pointer_into_page(offset, len, move |dst| {
             // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
@@ -373,8 +385,11 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
     ///
     /// # Safety
     ///
-    /// Callers must ensure that this call does not race with a read or write to the same page that
-    /// overlaps with this write.
+    /// * Callers must ensure that this call does not race with a read or write to the same page
+    ///   that overlaps with this write.
+    /// * Callers must ensure that no reference to the data of the page that overlaps with this
+    ///   write exists during this call. Such references can be obtained from a
+    ///   [`Page<Exclusive>`], see [`Page::as_slice`].
     pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
         self.with_pointer_into_page(offset, len, move |dst| {
             // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
@@ -396,8 +411,11 @@ pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that this call does not race with a read or write to the same page that
-    /// overlaps with this write.
+    /// * Callers must ensure that this call does not race with a read or write to the same page
+    ///   that overlaps with this write.
+    /// * Callers must ensure that no reference to the data of the page that overlaps with this
+    ///   write exists during this call. Such references can be obtained from a
+    ///   [`Page<Exclusive>`], see [`Page::as_slice`].
     pub unsafe fn copy_from_user_slice_raw(
         &self,
         reader: &mut UserSliceReader,
@@ -485,7 +503,7 @@ impl Page<Frozen> {
     /// let page = Page::alloc_frozen(GFP_KERNEL)?;
     ///
     /// // SAFETY: The page was just allocated and is not shared, so there are no concurrent reads
-    /// // or writes to the page.
+    /// // or writes to the page, and no reference to the data of the page exists.
     /// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
     /// # Ok::<(), Error>(())
     /// ```
@@ -527,8 +545,8 @@ unsafe fn release(this: NonNull<Self>) {
 ///
 /// A [`Page<Exclusive>`] is accessed through an owning [`Owned<Page<Exclusive>>`]. It has the same
 /// usage constraints as other Rust types. Thus, it cannot be mapped to user space or shared with
-/// devices. This makes it safe to reference the contents of the page while the page is mapped in
-/// kernel space.
+/// devices. This makes it safe to reference the contents of the page, see [`Page::as_slice`] and
+/// [`Page::as_mut_slice`].
 ///
 /// A [`Page<Exclusive>`] is backed by a frozen page. The reference count of a frozen page is zero,
 /// and references to it cannot be taken. Thus, the exclusive ownership of the page is upheld by
@@ -546,7 +564,11 @@ unsafe fn release(this: NonNull<Self>) {
 ///   including the [`Page<Base>`] references it dereferences to.
 /// - Safe code reads the data of the page only through a shared reference, and writes it only
 ///   through a mutable reference. The unsafe raw accessors of [`Page`] can write through a shared
-///   reference, their callers are required to rule out races with all other accesses.
+///   reference, their callers are required to rule out races with all other accesses, and to
+///   ensure that no reference to the data they write exists.
+/// - The data of the page is initialized.
+/// - The page is not a highmem page, so its data is permanently mapped in the kernel address
+///   space.
 pub struct Exclusive;
 
 impl private::Sealed for Exclusive {}
@@ -567,23 +589,39 @@ fn deref(&self) -> &Self::Target {
 impl Page<Exclusive> {
     /// Allocates a new exclusive page.
     ///
+    /// The page is always zeroed, and it is never allocated from highmem. That is, `__GFP_ZERO` is
+    /// added to `flags`, and `__GFP_HIGHMEM` is removed from `flags`.
+    ///
     /// # Examples
     ///
     /// ```
-    /// use kernel::page::Page;
+    /// use kernel::page::{
+    ///     Page,
+    ///     PAGE_SIZE, //
+    /// };
+    ///
+    /// let mut page = Page::alloc_exclusive(GFP_KERNEL)?;
+    /// assert_eq!(page.as_slice().len(), PAGE_SIZE);
+    /// assert!(page.as_slice().iter().all(|byte| *byte == 0));
     ///
-    /// let page = Page::alloc_exclusive(GFP_KERNEL | __GFP_ZERO)?;
+    /// page.as_pin_mut().as_mut_slice()[..4].copy_from_slice(&[1, 2, 3, 4]);
+    /// assert_eq!(page.as_slice()[..5], [1, 2, 3, 4, 0]);
     /// # Ok::<(), kernel::alloc::AllocError>(())
     /// ```
     #[inline]
     pub fn alloc_exclusive(flags: Flags) -> Result<Owned<Self>, AllocError> {
+        let flags = (flags | __GFP_ZERO) & !__GFP_HIGHMEM;
+
         // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
         // is always safe to call this method.
         let page = unsafe { bindings::alloc_frozen_pages(flags.as_raw(), 0) };
         let page = NonNull::new(page).ok_or(AllocError)?;
 
-        // INVARIANT: The page was just allocated with `alloc_frozen_pages()`, so it is frozen, we
-        // own it, and its data is only accessible through the returned `Owned<Page<Exclusive>>`.
+        // INVARIANT:
+        // - The page was just allocated with `alloc_frozen_pages()`, so it is frozen, we own it,
+        //   and its data is only accessible through the returned `Owned<Page<Exclusive>>`.
+        // - We allocated with `__GFP_ZERO`, so the data of the page is initialized.
+        // - We allocated without `__GFP_HIGHMEM`, so the page is not a highmem page.
         // SAFETY:
         // - We just successfully allocated the page, so `page` points to a valid `struct page`.
         //   Since `Page` is transparent over `struct page`, we can cast the pointer directly.
@@ -597,6 +635,42 @@ pub fn alloc_exclusive(flags: Flags) -> Result<Owned<Self>, AllocError> {
         //   accessed concurrently.
         Ok(unsafe { Owned::from_raw(page.cast()) })
     }
+
+    /// Returns a pointer to the data of the page.
+    #[inline]
+    fn data_ptr(&self) -> *mut u8 {
+        // SAFETY: By the type invariant of `Page`, `self.as_ptr()` points to a valid `struct page`.
+        unsafe { bindings::page_address(self.as_ptr()) }.cast()
+    }
+
+    /// Returns the data of the page as a slice of [`PAGE_SIZE`] bytes.
+    #[inline]
+    pub fn as_slice(&self) -> &[u8] {
+        // SAFETY:
+        // - By the type invariant, the page is not a highmem page, so `data_ptr()` returns a
+        //   non-null pointer that is valid for reads of `PAGE_SIZE` bytes for as long as the page
+        //   exists, which is at least the lifetime of `self`.
+        // - By the type invariant, the data of the page is initialized.
+        // - By the type invariant, the data of the page is only written by safe code through a
+        //   mutable reference to the page, which cannot exist together with `self`. Callers of the
+        //   unsafe raw accessors must ensure that no reference to the data they write exists.
+        //   Thus, the data is not mutated for the lifetime of the returned reference.
+        unsafe { core::slice::from_raw_parts(self.data_ptr(), PAGE_SIZE) }
+    }
+
+    /// Returns the data of the page as a mutable slice of [`PAGE_SIZE`] bytes.
+    #[inline]
+    pub fn as_mut_slice(self: Pin<&mut Self>) -> &mut [u8] {
+        // SAFETY:
+        // - By the type invariant, the page is not a highmem page, so `data_ptr()` returns a
+        //   non-null pointer that is valid for reads and writes of `PAGE_SIZE` bytes for as long as
+        //   the page exists, which is at least the lifetime of `self`.
+        // - By the type invariant, the data of the page is initialized.
+        // - By the type invariant, the data of the page is only accessed through references to the
+        //   page. `self` is a mutable reference, so no other reference to the page exists, and
+        //   thus no other access to the data happens for the lifetime of the returned reference.
+        unsafe { core::slice::from_raw_parts_mut(self.data_ptr(), PAGE_SIZE) }
+    }
 }
 
 impl Ownable for Page<Exclusive> {

-- 
2.54.0


