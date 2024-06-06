Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE771A01A2
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717685428; cv=none; b=mdEt4BGaxibXunEuTHmVI37Z/xIA0xn9DhL3gBmCjG7OVCXoMrbgmenNbj4IrQMgok9ZCalaEvmbbXgyBicY0EyVsl7wN+eBQzw/YOe3LpqVZGZ3ObmTzEHFokicu2zfDWq8hawK6bWZUUYbiynPsqKpXJDbEF8xB1d8jySYo0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717685428; c=relaxed/simple;
	bh=i+7bw4mDJ6wxt7468SYhV7yMxNQQl0UlbzuIKHgsdNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zxljyi9jfpIezcBKSzTA356+I9rXCeYYLmWTjNX5KgmNRZNS9/e5y4QVbtDZQ8e3kTT8bZl3JaQ6X9UUzbGjefMLs+oazrdwL533qTU72pEO4//DRGrogEK5Yeo9wlwLIo9SwkW66EM9zOA8ABDMNDFX449NJIotw6mowkRHEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w7MC9K7d; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w7MC9K7d"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfa79b84623so1728670276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717685425; x=1718290225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpcQthLt2ymcISiYcygIvr8b8/AUKo/Ks1I8+CxjzuM=;
        b=w7MC9K7d0px6wtoa2SaLVyRuOOpsSNtkAmLaUSYl6UEZTRA5djN0Gob0nmeLa94422
         5y697r7IZKyxNHfKnDUEIS/971qFHemt8eUelEJEdtrlhokuT8nZKvKTB+UJ9QskmBrF
         6sCxnpqQNp/K2lykwOoEveNF3ubrUwDshRozj/ehIn2eqViuvQaYDPmMugIWSjlNgsGP
         LyZKpTPtQJXlQlhMtfTX6Xt5zLlu5ShQhCLOo37yQ0rwhrtCW4SrkqNEg3xx8wy2nuBO
         BlKsfx3cpU+cbHzkXoycB6cTth+mle/xPHrRJ5BbV3+qEyrzLM/FWet+0EkuJHEtW/Oq
         qBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685425; x=1718290225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpcQthLt2ymcISiYcygIvr8b8/AUKo/Ks1I8+CxjzuM=;
        b=AujxGUA57Nj5hCbDeg0Lefo7yiWR0W6y1TJe6gjsD7CQvqigln0SdvZIIOhjSlyypZ
         g8Mih3hH4fJPopx8CZM0y0LCv18CbS07+f79nD4y7OXfCpnzKYc4m+l+GF/pKp3+lCXF
         vH15PPp1xpwBN/kIldF0GOFolQKPunAZDFDsm0uEPPPDAwCl8xTgZoPSj2SQw8Y49Ivg
         BwOP3CHuN5uSsy2gXRxqzvgO1wLLrLzV2RnQqj3tlxHQLa86yfRiUInnpUgpunZyTPz5
         4cx1tW3yIm4p7tg6WUmDJgGlINkZAwVx2Js23DedTPrHjsDeuV7Qo1xn83K5zyDg4fZh
         nPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ssmj/3e1M1ZATcOsniMjNby8YkILHLvTr+5vsSW8Mps8xVJFj/MdcEoIAFmki1TUj0MwEjP3HdFaqIBdHOSoFGs/KBOBYvYD6sGCHts=
X-Gm-Message-State: AOJu0Yz16IASuR1OC0ofEUTVyFki1QVnyqrlNQr7uv5usYiKsuhEnRKv
	k+0iVE40dcVCjnGuL74Axjz1PU/Pc6kki6VbJ6mVjoruw5tDhkkgZp2KKeaHy3Zm+dzu9U8/Lvq
	+dEK7AhR0unz7Yfj0VVg3gtyZLA==
X-Google-Smtp-Source: AGHT+IGabeHNYIVAbBfVAiBT5D2ogAB5tbXU4OCPPKhp43q4BtJvoJj9tFjag1CJ5vDRcT18QmHCpR75PdkAOOwXErU=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:1202:b0:df4:572b:a82f with
 SMTP id 3f1490d57ef6-dfacace2163mr319169276.8.1717685425443; Thu, 06 Jun 2024
 07:50:25 -0700 (PDT)
Date: Thu, 06 Jun 2024 14:50:07 +0000
In-Reply-To: <20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com>
X-Mailer: b4 0.12.4
Message-ID: <20240606-b4-rbtree-v5-4-96fe1a0e97c0@google.com>
Subject: [PATCH v5 4/6] rust: rbtree: add mutable iterator
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
index 40db6d3e732b..64e0f2328879 100644
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
2.45.1.467.gbab1589fc0-goog

