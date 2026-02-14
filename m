Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E20E199FD3;
	Sat, 14 Feb 2026 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771076160; cv=none; b=oY3OrZhLaQbP56gVmSH2LEyEHGIFsGuihHCbu3b1kYaYF2Vm+zF9pRfc435Imcy/5QvGoiKfdJbTi3P3ss9q+1CGaD0GpBNDK9J43ptE8UAoZiwEzbRIwY6QZ9YF4nhs567+oFiX2JQJfyhghIdxS++LYSvkUuZwaNFTvMgS4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771076160; c=relaxed/simple;
	bh=hig1eUDL4pSuNPRWty8wY7sk86cscLbAQ3LWFkwDkAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bJ5ckkTerQuGhPU6coYW0zqb4K1zOpNEnS7PiC7xt+3D5q4Tfjc/a2PkQnxHc58GVvVNghGxdzXCfVKuwUFZfjdNbzQ026jD+Sl2aQMDqDW4tYOthiYpyo/XJamwQoINawpDPfXJ7SksHasP/A2UEyCV2qn/l2KBdgx3nThfy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5Om/ad8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5Om/ad8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA33EC16AAE;
	Sat, 14 Feb 2026 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771076159;
	bh=hig1eUDL4pSuNPRWty8wY7sk86cscLbAQ3LWFkwDkAM=;
	h=From:Date:Subject:To:Cc:From;
	b=F5Om/ad8soIJsYGa9oZuZaxa7meyUlL/oYoflFNwNdB3FIAPKbVhZ/puTTs3qQlJ+
	 WfK23uckpda0h1ApTLmR+n+fwHRmwDNNRYZ2N7/IT8lr83JYRCFnzm68e4akect5nV
	 CZKfP4pYzVpcr7ugv9M7YPZx3SeX6wu6Z3V/Wv+gCCdrjppl6sM/P5fVm4/+RoAkY6
	 SbgZcb7t2huU7QMjDgmo/MN4Qitg3PB6IJ2bf4ZQ6A1r0Kryvlu9FL81mHtgENBrK4
	 gDxZstiwefM3XdqnFYkSYVHu8OYhHL6Pw9FxPE3U8EZe41vcfHe6kwSL3XbGmBZGbN
	 4LEnxR28/REKw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sat, 14 Feb 2026 14:28:40 +0100
Subject: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
X-B4-Tracking: v=1; b=H4sIAId4kGkC/x2MQQqAIBAAvxJ7TlAJy74SHcrWWggTNyIQ/550H
 IaZDIyJkGFsMiR8iOkKFVTbgDuWsKOgrTJoqY3UqhORguCTXBWBboEDemu8k/1qoUYxoaf3H05
 zKR8jxQXtYAAAAA==
X-Change-ID: 20260214-pin-slice-init-e8ef96fc07b9
To: Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hig1eUDL4pSuNPRWty8wY7sk86cscLbAQ3LWFkwDkAM=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkHiRHiKOCdUSuUuAgGWSLmz1IoIk4Nq/SmXq6
 yGW/b6t9YyJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZB4kQAKCRDhuBo+eShj
 d3E4EACvKz0ieATJhzfkX2e6OofUDo1/rcrTFY4jEycVCJThWimeB/ukHSsFSt4ugmk3g5JupNO
 3pM4wZMW8t7isl6IkbO0H0AcC0j48iMuTDslOijwlwMMRtriBZuY9ePX/AhLipCKLu2MkPaprXg
 qf6Isd3mB6SI+c8Ehpsel6c1ucYQfQarz9B5GOD+ZLpd6OUNMBfzDikH4NDoFWyQZ47RQHqDxDT
 EWaj1aZ96Sv3hcq/+crypNxyKWWPuFxk/GUvftZy5a3DLp90OUW4qv9lPJa7RfrBIcUJg1bsu9r
 QaaphFbmUTUP1Cz9xIQlfiGAlPgNUG3f8K7Gvb9ucMqkpBgTiIb8lhzb2LCaJAujpEKiUe8SBJ7
 LvtsM5PoBX/yckh0fTKItv2wVzRysyXTfYz2OYhB6fkNqSjPCZfdFYjLBXuZgQYR19ug42qY4jh
 vTN3JZXk3mNubBMbea1ZINAh9cRzPzJG0GuTYTwMR4KncDqwyeixNN9a6N/FLJAN3JWFqVZowA1
 F8/2HquI/FCGs/3PBMDKN7FvxC3u+wY1g6hri6r/Nv3i8joqOR8wr4EHHERwOer9iU2pCOeGvvS
 ZKPgNRxcRhEe9LS+B5ugeSZdIPM+c7WNmrXczXxKU3DmxT5tZuvLhaifP8WIe+JG1NBS1gEZXFR
 6+ptczXK4cZeb5Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Previously, `KBox::pin_slice` required the initializer error type to match
the return error type via `E: From<AllocError>`. This prevented using
infallible initializers like `new_mutex!` inside `pin_slice`, because
`Infallible` does not implement `From<AllocError>`.

Introduce a separate type parameter `E2` for the initializer error type and
require `AllocError: Into<E>` and `E2: Into<E>` instead. This allows the
initializer to return a different error type that can be converted into the
final error type, enabling use of infallible pin initializers in fallible
allocation contexts.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
@Benno, I would like to add your SoB and CDB tags.
---
 rust/kernel/alloc/kbox.rs | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 622b3529edfcb..8dbc58b988f1c 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -323,7 +323,7 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
     /// }
     ///
     /// // Allocate a boxed slice of 10 `Example`s.
-    /// let s = KBox::pin_slice(
+    /// let s = KBox::pin_slice::<_, _, Error, _>(
     ///     | _i | Example::new(),
     ///     10,
     ///     GFP_KERNEL
@@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
     /// assert_eq!(s[3].d.lock().a, 20);
     /// # Ok::<(), Error>(())
     /// ```
-    pub fn pin_slice<Func, Item, E>(
+    pub fn pin_slice<Func, Item, E, E2>(
         mut init: Func,
         len: usize,
         flags: Flags,
     ) -> Result<Pin<Box<[T], A>>, E>
     where
         Func: FnMut(usize) -> Item,
-        Item: PinInit<T, E>,
-        E: From<AllocError>,
+        Item: PinInit<T, E2>,
+        AllocError: Into<E>,
+        E2: Into<E>,
     {
-        let mut buffer = super::Vec::<T, A>::with_capacity(len, flags)?;
+        let mut buffer = match super::Vec::<T, A>::with_capacity(len, flags) {
+            Ok(buffer) => buffer,
+            Err(err) => return Err(err.into()),
+        };
         for i in 0..len {
             let ptr = buffer.spare_capacity_mut().as_mut_ptr().cast();
             // SAFETY:
             // - `ptr` is a valid pointer to uninitialized memory.
             // - `ptr` is not used if an error is returned.
             // - `ptr` won't be moved until it is dropped, i.e. it is pinned.
-            unsafe { init(i).__pinned_init(ptr)? };
+            match unsafe { init(i).__pinned_init(ptr) } {
+                Ok(()) => (),
+                Err(err) => return Err(err.into()),
+            }
 
             // SAFETY:
             // - `i + 1 <= len`, hence we don't exceed the capacity, due to the call to

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260214-pin-slice-init-e8ef96fc07b9

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


