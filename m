Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E5186E58
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722112262; cv=none; b=YMyf/dT8FjDLlXrq1iQuzKNclzZG9m5P63XrYRhF5Tj3mSn55FNBDcVQHkIJ3bekvWZ1TYU866ZafbB7rF0h+08BFAcApUoi2WmbBdoubqEHKGP9xCHHPMpGtg4kMjYMLpqJOfVP1Yq8f+cVNidFQf/xJb6JQiLvmo0W6+BBWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722112262; c=relaxed/simple;
	bh=PD8XXN9r7GhfGBXjlkCV/8Hhc4h8Z/6eMmB7BnqBEr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ESGur+KSq/ruCG5LFWcE/HfzXqONlS/msUvq9GmLX2NiRblNxUBgqThLsSUIvIXovP6KtZaQSNcBZj5Y8zVQDdwVHEi9UuvG2f1NsR3wD6bU8y5QyAPe5af6366v2wOsdW1pf5cgETGCznoZjdhxfaEFFzJeM0Is31o1a0SdSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rAyq1ftj; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rAyq1ftj"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03a694ba5aso1687561276.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 13:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722112258; x=1722717058; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mg1hkK3V+1ttfl5cTBm0uvxNUKFixpHJUWpMSiwB8nQ=;
        b=rAyq1ftjYXUt1gVAkyZZDzdulf4edGnWRbzX6QXXPYab/WCas43FR8LUW5kXdmjQwg
         gJgElyplkMswmdylBrJFi9RJ7hFboXRRLBRMIGpCDxtTk2LWsHYcY7Td785ZeP/7mhvP
         lCqpQRvigF7jtve5+4IeRoW8yOXBBG5+zAV76h5bjexKtmbx+dOnUYf31Dx9iwwlxunF
         lmSwv4QGnBoOlOnikxvmW+OpWJ/s495HeF04PQVFofeKYZ7fEIcO6Mor46RbzbhwXLwH
         rJvaEywIwyT4qOQXM05KFUWAsGJbzjIDLNCIO4PX7fPWQkYh6N+Nqb5XsahIg+NFDcse
         vsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722112258; x=1722717058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mg1hkK3V+1ttfl5cTBm0uvxNUKFixpHJUWpMSiwB8nQ=;
        b=hyKfTkD8/st2YhpLGItVEfkzbhJq3rr3yebbLnPyIZ6ks2PnrwRhxM/L9oAJ77IKVe
         /vbtxgfDzxVmGezyD1F454o071CPr4QFr2BlzOzvSeWJIjNXZskwBqueKMnz4Kf5t9I+
         AxPE4DH5zNiDUq5dj25XnkT9tO9qk9R/ze6EzsFsQY1qIyO78wVU3ncFzIXUj+mi2fLq
         fX1FYVryXHZCR/8Wgv3mslYLZHdhf1zIpF4FumJ/hnmmO2JeN3axaDWytTCtmW2goNYE
         GVXAh9bdYU/6GpzDPfuNk/gjcdFvz8VkAwfWtLG4fe+g46YCNK7UvK0nW+yT7snBOh51
         TjZg==
X-Forwarded-Encrypted: i=1; AJvYcCWbeYA0b4o+ny+3/c7LOhzW6Yrx9nL8Zmuyvionoo1QDeD7lZkJbC9AUu/Es1V7cnVHyIWm3myTb7pOS5Gw69W1iUNyHF9YoSU40LyzvH4=
X-Gm-Message-State: AOJu0Yxdl9+ecs08X4QbIOdnrFbavu7DSyD5VPiy05iqjY91Vc4SsDjk
	nqce62Tgtv6Z70mzm9PEe38kgafQPTT++qLLqkPl54Jn/ZCY3txDqvBVz0afsjsAUpD8GDY+C6s
	CYG1smDrY2bf7kBbQKRkTbFsauQ==
X-Google-Smtp-Source: AGHT+IGHfT9GOiUbqZgPx1XgCTnRam2JkNyMhDXyVA6rcQSzowt3kmfmmUiJ7uuEZgqMFCqufASJ8zhCggyTxuNZy9Q=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:181d:b0:e03:5144:1d48 with
 SMTP id 3f1490d57ef6-e0b5452490amr5776276.11.1722112257915; Sat, 27 Jul 2024
 13:30:57 -0700 (PDT)
Date: Sat, 27 Jul 2024 20:30:49 +0000
In-Reply-To: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
X-Mailer: b4 0.13.0
Message-ID: <20240727-b4-rbtree-v8-4-951600ada434@google.com>
Subject: [PATCH v8 4/6] rust: rbtree: add mutable iterator
From: Matt Gilbride <mattgilbride@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, 
	Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="utf-8"

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add mutable Iterator implementation for `RBTree`,
allowing iteration over (key, value) pairs in key order. Only values are
mutable, as mutating keys implies modifying a node's position in the tree.

Mutable iteration is used by the binder driver during shutdown to
clean up the tree maintained by the "range allocator" [1].

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-6-08ba9197f637@google.com/ [1]
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Matt Gilbride <mattgilbride@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/rbtree.rs | 98 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index d10074e4ac58..d7514ebadfa8 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -197,8 +197,26 @@ pub fn iter(&self) -> Iter<'_, K, V> {
         // INVARIANT: `bindings::rb_first` returns a valid pointer to a tree node given a valid pointer to a tree root.
         Iter {
             _tree: PhantomData,
-            // SAFETY: `self.root` is a valid pointer to the tree root.
-            next: unsafe { bindings::rb_first(&self.root) },
+            iter_raw: IterRaw {
+                // SAFETY: by the invariants, all pointers are valid.
+                next: unsafe { bindings::rb_first(&self.root) },
+                _phantom: PhantomData,
+            },
+        }
+    }
+
+    /// Returns a mutable iterator over the tree nodes, sorted by key.
+    pub fn iter_mut(&mut self) -> IterMut<'_, K, V> {
+        IterMut {
+            _tree: PhantomData,
+            // INVARIANT:
+            //   - `self.root` is a valid pointer to a tree root.
+            //   - `bindings::rb_first` produces a valid pointer to a node given `root` is valid.
+            iter_raw: IterRaw {
+                // SAFETY: by the invariants, all pointers are valid.
+                next: unsafe { bindings::rb_first(&self.root) },
+                _phantom: PhantomData,
+            },
         }
     }
 
@@ -211,6 +229,11 @@ pub fn keys(&self) -> impl Iterator<Item = &'_ K> {
     pub fn values(&self) -> impl Iterator<Item = &'_ V> {
         self.iter().map(|(_, v)| v)
     }
+
+    /// Returns a mutable iterator over the values of the nodes in the tree, sorted by key.
+    pub fn values_mut(&mut self) -> impl Iterator<Item = &'_ mut V> {
+        self.iter_mut().map(|(_, v)| v)
+    }
 }
 
 impl<K, V> RBTree<K, V>
@@ -414,13 +437,9 @@ fn into_iter(self) -> Self::IntoIter {
 /// An iterator over the nodes of a [`RBTree`].
 ///
 /// Instances are created by calling [`RBTree::iter`].
-///
-/// # Invariants
-/// - `self.next` is a valid pointer.
-/// - `self.next` points to a node stored inside of a valid `RBTree`.
 pub struct Iter<'a, K, V> {
     _tree: PhantomData<&'a RBTree<K, V>>,
-    next: *mut bindings::rb_node,
+    iter_raw: IterRaw<K, V>,
 }
 
 // SAFETY: The [`Iter`] gives out immutable references to K and V, so it has the same
@@ -434,21 +453,76 @@ unsafe impl<'a, K: Sync, V: Sync> Sync for Iter<'a, K, V> {}
 impl<'a, K, V> Iterator for Iter<'a, K, V> {
     type Item = (&'a K, &'a V);
 
+    fn next(&mut self) -> Option<Self::Item> {
+        self.iter_raw.next().map(|(k, v)|
+            // SAFETY: Due to `self._tree`, `k` and `v` are valid for the lifetime of `'a`.
+            unsafe { (&*k, &*v) })
+    }
+}
+
+impl<'a, K, V> IntoIterator for &'a mut RBTree<K, V> {
+    type Item = (&'a K, &'a mut V);
+    type IntoIter = IterMut<'a, K, V>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter_mut()
+    }
+}
+
+/// A mutable iterator over the nodes of a [`RBTree`].
+///
+/// Instances are created by calling [`RBTree::iter_mut`].
+pub struct IterMut<'a, K, V> {
+    _tree: PhantomData<&'a mut RBTree<K, V>>,
+    iter_raw: IterRaw<K, V>,
+}
+
+// SAFETY: The [`IterMut`] gives out immutable references to K and mutable references to V, so it has the same
+// thread safety requirements as mutable references.
+unsafe impl<'a, K: Send, V: Send> Send for IterMut<'a, K, V> {}
+
+// SAFETY: The [`IterMut`] gives out immutable references to K and mutable references to V, so it has the same
+// thread safety requirements as mutable references.
+unsafe impl<'a, K: Sync, V: Sync> Sync for IterMut<'a, K, V> {}
+
+impl<'a, K, V> Iterator for IterMut<'a, K, V> {
+    type Item = (&'a K, &'a mut V);
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.iter_raw.next().map(|(k, v)|
+            // SAFETY: Due to `&mut self`, we have exclusive access to `k` and `v`, for the lifetime of `'a`.
+            unsafe { (&*k, &mut *v) })
+    }
+}
+
+/// A raw iterator over the nodes of a [`RBTree`].
+///
+/// # Invariants
+/// - `self.next` is a valid pointer.
+/// - `self.next` points to a node stored inside of a valid `RBTree`.
+struct IterRaw<K, V> {
+    next: *mut bindings::rb_node,
+    _phantom: PhantomData<fn() -> (K, V)>,
+}
+
+impl<K, V> Iterator for IterRaw<K, V> {
+    type Item = (*mut K, *mut V);
+
     fn next(&mut self) -> Option<Self::Item> {
         if self.next.is_null() {
             return None;
         }
 
-        // SAFETY: By the type invariant of `Iter`, `self.next` is a valid node in an `RBTree`,
+        // SAFETY: By the type invariant of `IterRaw`, `self.next` is a valid node in an `RBTree`,
         // and by the type invariant of `RBTree`, all nodes point to the links field of `Node<K, V>` objects.
-        let cur = unsafe { container_of!(self.next, Node<K, V>, links) };
+        let cur: *mut Node<K, V> =
+            unsafe { container_of!(self.next, Node<K, V>, links) }.cast_mut();
 
         // SAFETY: `self.next` is a valid tree node by the type invariants.
         self.next = unsafe { bindings::rb_next(self.next) };
 
-        // SAFETY: By the same reasoning above, it is safe to dereference the node. Additionally,
-        // it is ok to return a reference to members because the iterator must outlive it.
-        Some(unsafe { (&(*cur).key, &(*cur).value) })
+        // SAFETY: By the same reasoning above, it is safe to dereference the node.
+        Some(unsafe { (addr_of_mut!((*cur).key), addr_of_mut!((*cur).value)) })
     }
 }
 

-- 
2.46.0.rc1.232.g9752f9e123-goog

