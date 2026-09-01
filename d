Received: from mail.flra.eu (unknown [167.235.193.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFD154423
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.193.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232110; cv=none; b=N1EN6Qvs5AtEItst++7LANPq6CKofo+9S2OlaA/Rh3Gz+5+/LvxtJq+pXMgbgQ42n0xWFo5U/kNEEqv6+6/Am72Cc2LO0NHCe54Yp9UDBInR/Veim63RJMSJg6/aJZNTBCoLxfZmgjyqHwp6MG60BnqJATFOu4Q1Cb52yrOcR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232110; c=relaxed/simple;
	bh=33tlsjRXqyinE/8k641M6NcnbUdkk3QQ7Lwvl4hp2l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cwWX8w8DtDegmTI7VWYvQsJ1maRbEKYv5Jg9iw7nS7Dsq25DPpqFc4ui/+gqtsElsc74hlmD0iOonBNwkws9oTVugn9flIvX+ga8EiGuhdZVTOvzp3rIr8wxKVd+UQGqKds3zOaGvWJRUQWHpHyqxTx1ejNNmBi3vvzxDI/DlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flra.eu; spf=pass smtp.mailfrom=flra.eu; dkim=pass (2048-bit key) header.d=flra.eu header.i=@flra.eu header.b=JYacDFdr; dkim=permerror (0-bit key) header.d=flra.eu header.i=@flra.eu header.b=HXVA76+g; arc=none smtp.client-ip=167.235.193.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flra.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flra.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flra.eu header.i=@flra.eu header.b="JYacDFdr";
	dkim=permerror (0-bit key) header.d=flra.eu header.i=@flra.eu header.b="HXVA76+g"
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=flra.eu; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1738231936; bh=roaHwyP2QgGkoqc9uYjdTW/
	TexN4VK12nFpYi2zNiPM=; b=JYacDFdrYk5OEQdAf7kk+AM8wcDYsF+vRmG6EMF7uT7J+890dI
	C6numZgUfH7+hwo7KRWVD4m9TGiBIUFST27ujpNurqytKKp3oTm8Oeq7pE29lJFq+7jsLGZDyHQ
	Md2tD84xw6rr3SpykIp3SI5QIHf5RDndDQgjz61OXeTFoSp7p6WL0URE4pOAl7jjttER7ETeQzA
	/voNWVQ9TMnMH1nw1yT8A8F894uy7z67KLWD8t/iYn6iyE64ad9QU55repF4rVsufEqZ/8UyDE0
	e77Fc80TCtFfJ6lAnnWU/j7ARsy0GnWct32m43mSTIZSXz8cC+bUpaeE/TDD4JNKkAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=flra.eu; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1738231936; bh=roaHwyP2QgGkoqc9uYjdTW/
	TexN4VK12nFpYi2zNiPM=; b=HXVA76+gEO9JiBVoyK6oJsAtbp7rs6Nel0+MO5F7caZfDc4NmO
	rdViVZtQBvWwZAGVB+uh2gSY0Yyh7ebMR0Aw==;
From: =?UTF-8?q?Florian=20R=C3=A4diker?= <git@flra.eu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Clemens Tiedt <Clemens.Tiedt@hpi.de>,
	=?UTF-8?q?Florian=20R=C3=A4diker?= <git@flra.eu>
Subject: [PATCH] rust: kernel: update `container_of` to not require unsafe blocks
Date: Thu, 30 Jan 2025 11:11:15 +0100
Message-ID: <20250130101115.124132-1-git@flra.eu>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The calculation done by `container_of` does not have to be unsafe, so
change this.

Inspired by [0] by Wedson Almeida Filho <walmeida@microsoft.com>

[0] https://github.com/Rust-for-Linux/linux/commit/ecc54b2bbd08f62f8cd16420d3d6c60b517a05cd

Signed-off-by: Florian Rädiker <git@flra.eu>
---

Hi,

this is my first-ever patch submission :)
I thought this might serve as a "good first issue".

Best,
flra

 rust/kernel/lib.rs    | 13 ++++++------
 rust/kernel/rbtree.rs | 46 +++++++++++++++++++++----------------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 545d1170ee63..343d8b9ea32e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -153,8 +153,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 ///
 /// # Safety
 ///
-/// The pointer passed to this macro, and the pointer returned by this macro, must both be in
-/// bounds of the same allocation.
+/// This operation itself is always safe, but using the result is only safe if the resulting
+/// pointer, and the pointer passed to this macro, are in bounds of the same allocation.
 ///
 /// # Examples
 ///
@@ -167,9 +167,9 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 ///
 /// let test = Test { a: 10, b: 20 };
 /// let b_ptr = &test.b;
-/// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
-/// // in-bounds of the same allocation as `b_ptr`.
-/// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
+/// // The pointer points at the `b` field of a `Test`, so the resulting pointer will be in-bounds
+/// // of the same allocation as `b_ptr`.
+/// let test_alias = container_of!(b_ptr, Test, b);
 /// assert!(core::ptr::eq(&test, test_alias));
 /// ```
 #[macro_export]
@@ -177,7 +177,8 @@ macro_rules! container_of {
     ($ptr:expr, $type:ty, $($f:tt)*) => {{
         let ptr = $ptr as *const _ as *const u8;
         let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        ptr.sub(offset) as *const $type
+        $crate::build_assert!(offset <= isize::MAX as usize);
+        ptr.wrapping_sub(offset) as *const $type
     }}
 }
 
diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index ee2731dad72d..f61d7f80c2ca 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -328,8 +328,8 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, V> {
             unsafe { &mut (*raw_self).root.rb_node };
         while !(*child_field_of_parent).is_null() {
             let curr = *child_field_of_parent;
-            // SAFETY: All links fields we create are in a `Node<K, V>`.
-            let node = unsafe { container_of!(curr, Node<K, V>, links) };
+            // All links fields we create are in a `Node<K, V>`, so `node` is safe to dereference.
+            let node = container_of!(curr, Node<K, V>, links);
 
             // SAFETY: `node` is a non-null node so it is valid by the type invariants.
             match key.cmp(unsafe { &(*node).key }) {
@@ -375,9 +375,9 @@ pub fn find_mut(&mut self, key: &K) -> Option<OccupiedEntry<'_, K, V>> {
     pub fn get(&self, key: &K) -> Option<&V> {
         let mut node = self.root.rb_node;
         while !node.is_null() {
-            // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
-            // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(node, Node<K, V>, links) };
+            // By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
+            // point to the links field of `Node<K, V>` objects, so `this` is safe to dereference.
+            let this = container_of!(node, Node<K, V>, links);
             // SAFETY: `this` is a non-null node so it is valid by the type invariants.
             node = match key.cmp(unsafe { &(*this).key }) {
                 // SAFETY: `node` is a non-null node so it is valid by the type invariants.
@@ -422,9 +422,9 @@ pub fn cursor_lower_bound(&mut self, key: &K) -> Option<Cursor<'_, K, V>>
         let mut node = self.root.rb_node;
         let mut best_match: Option<NonNull<Node<K, V>>> = None;
         while !node.is_null() {
-            // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
-            // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(node, Node<K, V>, links) }.cast_mut();
+            // By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
+            // point to the links field of `Node<K, V>` objects, so `this` is safe to dereference.
+            let this = container_of!(node, Node<K, V>, links).cast_mut();
             // SAFETY: `this` is a non-null node so it is valid by the type invariants.
             let this_key = unsafe { &(*this).key };
             // SAFETY: `node` is a non-null node so it is valid by the type invariants.
@@ -485,8 +485,8 @@ fn drop(&mut self) {
 
         // INVARIANT: The loop invariant is that all tree nodes from `next` in postorder are valid.
         while !next.is_null() {
-            // SAFETY: All links fields we create are in a `Node<K, V>`.
-            let this = unsafe { container_of!(next, Node<K, V>, links) };
+            // All links fields we create are in a `Node<K, V>`, so `this` is safe to use.
+            let this = container_of!(next, Node<K, V>, links);
 
             // Find out what the next node is before disposing of the current one.
             // SAFETY: `next` and all nodes in postorder are still valid.
@@ -759,9 +759,9 @@ pub fn current_mut(&mut self) -> (&K, &mut V) {
     pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         let prev = self.get_neighbor_raw(Direction::Prev);
         let next = self.get_neighbor_raw(Direction::Next);
-        // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
-        // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) }.cast_mut();
+        // By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
+        // point to the links field of `Node<K, V>` objects, so `this` is safe to dereference.
+        let this = container_of!(self.current.as_ptr(), Node<K, V>, links).cast_mut();
         // SAFETY: `this` is valid by the type invariants as described above.
         let node = unsafe { KBox::from_raw(this) };
         let node = RBTreeNode { node };
@@ -804,9 +804,9 @@ fn remove_neighbor(&mut self, direction: Direction) -> Option<RBTreeNode<K, V>>
             // SAFETY: The reference to the tree used to create the cursor outlives the cursor, so
             // the tree cannot change. By the tree invariant, all nodes are valid.
             unsafe { bindings::rb_erase(neighbor, addr_of_mut!(self.tree.root)) };
-            // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
-            // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(neighbor, Node<K, V>, links) }.cast_mut();
+            // By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
+            // point to the links field of `Node<K, V>` objects, so `this` is safe to dereference.
+            let this = container_of!(neighbor, Node<K, V>, links).cast_mut();
             // SAFETY: `this` is valid by the type invariants as described above.
             let node = unsafe { KBox::from_raw(this) };
             return Some(RBTreeNode { node });
@@ -910,9 +910,9 @@ unsafe fn to_key_value_mut<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, &'b
     /// - `node` must be a valid pointer to a node in an [`RBTree`].
     /// - The caller has immutable access to the key for the duration of 'b.
     unsafe fn to_key_value_raw<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, *mut V) {
-        // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
-        // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(node.as_ptr(), Node<K, V>, links) }.cast_mut();
+        // By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
+        // point to the links field of `Node<K, V>` objects, so `this` is safe to dereference.
+        let this = container_of!(node.as_ptr(), Node<K, V>, links).cast_mut();
         // SAFETY: The passed `node` is the current node or a non-null neighbor,
         // thus `this` is valid by the type invariants.
         let k = unsafe { &(*this).key };
@@ -1019,14 +1019,14 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        // SAFETY: By the type invariant of `IterRaw`, `self.next` is a valid node in an `RBTree`,
-        // and by the type invariant of `RBTree`, all nodes point to the links field of `Node<K, V>` objects.
-        let cur = unsafe { container_of!(self.next, Node<K, V>, links) }.cast_mut();
+        // By the type invariant of `IterRaw`, `self.next` is a valid node in an `RBTree`, and by the
+        // type invariant of `RBTree`, all nodes point to the links field of `Node<K, V>` objects.
+        let cur = container_of!(self.next, Node<K, V>, links).cast_mut();
 
         // SAFETY: `self.next` is a valid tree node by the type invariants.
         self.next = unsafe { bindings::rb_next(self.next) };
 
-        // SAFETY: By the same reasoning above, it is safe to dereference the node.
+        // SAFETY: By the reasoning above, it is safe to dereference `cur`.
         Some(unsafe { (addr_of_mut!((*cur).key), addr_of_mut!((*cur).value)) })
     }
 }

base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
-- 
2.47.1

