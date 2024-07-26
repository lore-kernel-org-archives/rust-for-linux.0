Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B26149C4C
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722023878; cv=none; b=kObXiq57NcI3rpiuXiY5S2iDA+gESY/qskDpJ1pHR3K1q+nItuFkMwDeMuO7utjKDWFhMazqTgCPNxBpickJUJwO1vbacSr6q4XZj2VyWcDJgmsCmOICF2sjulu0gqJOnRihT8KEJ+f/WvnNQBGFLjYSVjhF4eWaGsc1Y6HXpOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722023878; c=relaxed/simple;
	bh=HbW5lC39Vo3FURu7yDg9XBOa7VQg6g+00xAEsgLTbPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JA+tggv72Mwzw83uApF93HZqPQNi8JXoMheSam2B5Dx+qgHrCXRR8c8CBzdZZpLFwBo3pvi56Fx5IkbJgeU8n0kbcMRdVnU4s1BUT8YgHkpuuUh8KIPNXithfOt9eU1bDK2Qfk9UJ4IuFCMKYywVohR0FRYZUe0sXxm7/AocodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0IYLrdnI; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0IYLrdnI"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7a1d8c45a90so115981085a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722023875; x=1722628675; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IqQsQDq69/bEZnFmqp2qCypa2nZHW197Tj8Jy+RTMM=;
        b=0IYLrdnI7bpBO41N0IuAACbkC8FQDJs4kW3kkbxyb+9Zi+rrns760UzYvchPoFj82f
         04teuyV8Yx4h/w//DXabdSiz64BctMvdajlI2hkvIVf7ehguoSB6iIABPTBxhgimDoXF
         YF/cyW/JVcz+sGf2N7zK+zMW+CP4CNp0DEH4qi2xoBB8R/Bmq/hJptmkDQsKAo2VSNCB
         CMLdBJVsMollvGbEDe9hYRcmtIyJicJLCbCJQx/EbIItDKu3mu9EPwyFM+3OU/9MUrB0
         nS7q5BL6ncHhugqm0iC4xJn9dogTvasGyirQY4qS5pYRURfJLwuL3+T0WXt/0OxiU/sy
         PlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722023875; x=1722628675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IqQsQDq69/bEZnFmqp2qCypa2nZHW197Tj8Jy+RTMM=;
        b=ocBLWIptT55AVEGP271zlix3tD6bbGx2vUuHPIVceOUFM81wUpaDIJVN3gWeS6ysnk
         5xYcPoxfuWl4KV+D65fbdRo5lOCK3sy1anWaGsI1X5v+pJk6ySQOp/OoN9Vb7GMwzboQ
         6dJHN39HoN/SL8SCuwx6cILO/tWVrCzCN71cpfpNJNMDAHBuW7rbMWwwzJo+SAm73Z8J
         2dePtJ+z9tIRiJQKGAJITcgfusNBlwjzFo2WbeEn1ua5m7Jwp4QMga6gq7CPVIOTPcty
         EnRSsDCVSUNjyNURuFrBskiBrI/TkxRu2JLbYsphMPhw53gaEf9llOsglUuM2uMlCVoT
         8JcA==
X-Forwarded-Encrypted: i=1; AJvYcCUsHtJ/HvKoXMSMpnJXa9JFG+OW5PPAMBIWPZIolzgd7x2YMnaCY7nmD7Rz/l9i3Y7iUh0RE1xuvgELrwIR6uQu4c/AKHn/3cADBrqBFa8=
X-Gm-Message-State: AOJu0YySKmUAq5h8x8oOe6d7fchosQC+E3AamXu1FjM3rxvtAqFUccBK
	p9JaMbBwJJ6K7GhFcnLE7G2MWGTRCXbix+SxtZkCQfagZJB7Qkmj/NoA3B9IANu4hGONrjWX+Ey
	GWuRCd2qa2ff6BmSRh/3KqZujgw==
X-Google-Smtp-Source: AGHT+IFozQVyWYpBnnmpalmayTIsqFPCJ6h1elphCf3vKOH7Zb1f08un6I4N3tCgnom/hu4zdMn5Fc/XV4dEul5gHE4=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:620a:2727:b0:79f:29:4e53 with
 SMTP id af79cd13be357-7a1e523d5acmr140385a.4.1722023875498; Fri, 26 Jul 2024
 12:57:55 -0700 (PDT)
Date: Fri, 26 Jul 2024 19:57:43 +0000
In-Reply-To: <20240726-b4-rbtree-v7-0-aee88caaf97c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726-b4-rbtree-v7-0-aee88caaf97c@google.com>
X-Mailer: b4 0.13.0
Message-ID: <20240726-b4-rbtree-v7-4-aee88caaf97c@google.com>
Subject: [PATCH v7 4/6] rust: rbtree: add mutable iterator
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
2.46.0.rc1.232.g9752f9e123-goog

