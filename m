Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EF16BE0A
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722933596; cv=none; b=h5wS2fvo8X0rI305LmphWb+ZCYadVVNa4w5YvNGwGdGFcbEvgjqo3KRuSDltNV2CWhzkkrGQfXJ/yRME4e394PGd3TFlwuL9sq65IhcUqyst5NTyabOqj7rNXmPrbmlpFMCoP+NVlZRawzdxqXEfEZJXrF8c+Tln7kIHwRSzSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722933596; c=relaxed/simple;
	bh=FQB6BQ8ujGZ/vTXoFWjIxLqahSRXoRts8rERnQLUxEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLCEDSioIqezyulmdaorYsfRVpm7KlyvvZephlC4+lMzc9J6wrdL3228yr3O9sXcPda/75yLPE1QQc7viK3+HAGjLXkGErLLUtZMnA5jhJTpFQl3s5GaorhqJd3aPzho42G3u/uxstWA/O6p1kUDZUDXMXYqgpmszUIIrgcfyu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CgGNNggR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CgGNNggR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso2611825e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722933592; x=1723538392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmne+spHYhWJxTfkP4X4/P4qq2v9kHtbVdyHtJgnPy0=;
        b=CgGNNggR4S2ZRs3HwxpOqXO3h5wwfRFFAaXcCKap+4u5HIJgVdw44JEOHE8anNcZcf
         ECgyFOAPLPN5gjh02xYKnYXKpvTa5kGsKwRA6YgX7lSzsohRnoako5DOt0RSRPZtopsx
         2jbVFnlAdb8s8doTRjtvWFJMBTGbxnBNj4HFMIO+G42GP2YwCrAbg2+qItx4gkFaxgWj
         v8UfVQDjbsHCXhSCDIvPlKl/xIrGw4Zz6utM8/hwDT9xPBxrrYkBGZCjfYz7J7dlIZt/
         I+dZIUyHADUE0eqzqgxIKHKwLvTrqEKoIFrR783rA1mHu01JWvgTeM5ch/apgAoKfdNf
         tTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722933592; x=1723538392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmne+spHYhWJxTfkP4X4/P4qq2v9kHtbVdyHtJgnPy0=;
        b=S1OH4kYZ7GcUoOB2BJlxkxe1imsRx9Guy3AHDHC5Z438YOjyRA11PQ0dBCzjdI0EDK
         Etdlp262Svs5sAG+OWo+1OcMteYju32e9MyMKx+2iRMKmDs8PJKN340XPeDgtpYf++W3
         9hGUKxOSsW4sZfHZ58zedDoZqTlaSOB4/Fy6kE7GoTVNFPABhLMIUA2bA2YBXUoCWgCv
         k/4U5WD/dbk6Iy3dXwbXGaW7qC0fW5w2UcZA6VuryCykrCG47ik+N5R2q8yUDApsS856
         nkfrKtaLM7ejrMQg7aKNFWkebeau15C/LidxGk9BS5zotPguTtEAxZ7Ol7GJL2sGj6UU
         oGwA==
X-Forwarded-Encrypted: i=1; AJvYcCW6+YPq2q/rXzRizlcGswowAiBy79xvvtWFGFfsi0hzBl1mMCQjUZdsA1GarhHIiA0fvN4jcO7ooSd1knbrUGimHOt8c3W4M9Yzm0cGl/8=
X-Gm-Message-State: AOJu0YxLpBEGKXjhUIkF5+2R9N7DpgbYtxrGuGtICvqSKOmUSPm3/WGw
	DxJ6Q46A9NZTfk7VMG+BrvnScUj4Xk8l12AuA0kCyb2oYVSY1QXogS8d6/WTOsvfeKJoAWV7TQJ
	Bv3OVfIKsiR/FOZapfdFOfQsTkpeAmVwFo0g/
X-Google-Smtp-Source: AGHT+IHKTYmq3PXNyaNHf68/1HITyUlybKibxB5HX1xBw8PZwfVD3t6ckMOi/tMjlFBjlM5SqLwDEJoRPiFbfhBWSH8=
X-Received: by 2002:a05:600c:1c14:b0:426:5e8e:410a with SMTP id
 5b1f17b1804b1-428ea0fd6a8mr93959365e9.24.1722933591313; Tue, 06 Aug 2024
 01:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
 <20240727-b4-rbtree-v8-6-951600ada434@google.com> <cabdde17-5191-4ce6-8cf3-7e7e929e5671@proton.me>
In-Reply-To: <cabdde17-5191-4ce6-8cf3-7e7e929e5671@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Aug 2024 10:39:39 +0200
Message-ID: <CAH5fLggU7B6Bb-fzaFhmNxbAd8aoGmNN4amdtm6gp43myAzcxw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: rbtree: add `RBTree::entry`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 10:03=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 27.07.24 22:30, Matt Gilbride wrote:
> > From: Alice Ryhl <aliceryhl@google.com>
> >
> > This mirrors the entry API [1] from the Rust standard library on
> > `RBTree`. This API can be used to access the entry at a specific key an=
d
> > make modifications depending on whether the key is vacant or occupied.
> > This API is useful because it can often be used to avoid traversing the
> > tree multiple times.
> >
> > This is used by binder to look up and conditionally access or insert a
> > value, depending on whether it is there or not [2].
> >
> > Link: https://doc.rust-lang.org/stable/std/collections/btree_map/enum.E=
ntry.html [1]
> > Link: https://android-review.googlesource.com/c/kernel/common/+/2849906=
 [2]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> > ---
> >  rust/kernel/rbtree.rs | 302 +++++++++++++++++++++++++++++++++++++-----=
--------
> >  1 file changed, 227 insertions(+), 75 deletions(-)
> >
> > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > index 5d37aa373685..428f8be8f3a2 100644
> > --- a/rust/kernel/rbtree.rs
> > +++ b/rust/kernel/rbtree.rs
> > @@ -295,12 +295,19 @@ pub fn try_create_and_insert(
> >      /// key/value pair). Returns [`None`] if a node with the same key =
didn't already exist.
> >      ///
> >      /// This function always succeeds.
> > -    pub fn insert(&mut self, RBTreeNode { node }: RBTreeNode<K, V>) ->=
 Option<RBTreeNode<K, V>> {
> > -        let node =3D Box::into_raw(node);
> > -        // SAFETY: `node` is valid at least until we call `Box::from_r=
aw`, which only happens when
> > -        // the node is removed or replaced.
> > -        let node_links =3D unsafe { addr_of_mut!((*node).links) };
> > +    pub fn insert(&mut self, node: RBTreeNode<K, V>) -> Option<RBTreeN=
ode<K, V>> {
> > +        match self.raw_entry(&node.node.key) {
> > +            RawEntry::Occupied(entry) =3D> Some(entry.replace(node)),
> > +            RawEntry::Vacant(entry) =3D> {
> > +                entry.insert(node);
> > +                None
> > +            }
> > +        }
> > +    }
> >
> > +    fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, V> {
> > +        let raw_self: *mut RBTree<K, V> =3D self;
> > +        // The returned `RawEntry` is used to call either `rb_link_nod=
e` or `rb_replace_node`.
> >          // The parameters of `rb_link_node` are as follows:
> >          // - `node`: A pointer to an uninitialized node being inserted=
.
> >          // - `parent`: A pointer to an existing node in the tree. One =
of its child pointers must be
> > @@ -319,62 +326,56 @@ pub fn insert(&mut self, RBTreeNode { node }: RBT=
reeNode<K, V>) -> Option<RBTree
> >          // in the subtree of `parent` that `child_field_of_parent` poi=
nts at. Once
> >          // we find an empty subtree, we can insert the new node using =
`rb_link_node`.
> >          let mut parent =3D core::ptr::null_mut();
> > -        let mut child_field_of_parent: &mut *mut bindings::rb_node =3D=
 &mut self.root.rb_node;
> > -        while !child_field_of_parent.is_null() {
> > -            parent =3D *child_field_of_parent;
> > +        let mut child_field_of_parent: &mut *mut bindings::rb_node =3D
> > +            // SAFETY: `raw_self` is a valid pointer to the `RBTree` (=
created from `self` above).
> > +            unsafe { &mut (*raw_self).root.rb_node };
> > +        while !(*child_field_of_parent).is_null() {
>
> Why do you manually dereference `child_field_of_parent` here?

I think it helps for clarity. It makes it clear to the reader that
`child_field_of_parent` isn't null, but that it's pointing at a null
pointer.

> > +impl<'a, K, V> OccupiedEntry<'a, K, V> {
> > +    fn node_ptr(&self) -> *mut Node<K, V> {
> > +        // SAFETY: By the type invariant of `Self`, all `node_links` p=
ointers stored in `self`
> > +        // point to the links field of `Node<K, V>` objects.
> > +        unsafe { container_of!(self.node_links, Node<K, V>, links) }.c=
ast_mut()
>
> You should not call `cast_mut` here, see below
>
> > +    }
> > +
> > +    /// Gets a reference to the value in the entry.
> > +    pub fn get(&self) -> &V {
> > +        // SAFETY: `self.node_ptr` produces a valid pointer to a node =
in the tree.
>
> Can you add a `# Guarantees` section to `node_ptr` that states exactly
> this?
>
> > +        unsafe { &(*self.node_ptr()).value }
> > +    }
> > +
> > +    /// Gets a mutable reference to the value in the entry.
> > +    pub fn get_mut(&mut self) -> &mut V {
> > +        // SAFETY: `self.node_ptr` produces a valid pointer to a node =
in the tree.
> > +        unsafe { &mut (*self.node_ptr()).value }
>
> This is sadly UB, you are creating a `&mut` reference from a pointer
> that was derived from a `&` reference:
> - `node_ptr` takes `&self`, thus it converts the `&mut self` to that.
> - `container_of!` inside of `node_ptr` is used to create a read-only
>   pointer to the `links` field (it is casted to `*mut`, but that doesn't
>   change the fact that you are only allowed to use it for reads)
> - `get_mut` turns it again into a `&mut` reference.
>
> One solution is to make `note_ptr` take a `*mut Self`/`*const Self`.

We will get rid of node_ptr and duplicate its contents into get and get_mut=
.

> > +    }
> > +
> > +    /// Converts the entry into a mutable reference to its value.
> > +    ///
> > +    /// If you need multiple references to the `OccupiedEntry`, see [`=
self#get_mut`].
> > +    pub fn into_mut(self) -> &'a mut V {
> > +        // SAFETY: `self.node_ptr` produces a valid pointer to a node =
in the tree.
> > +        unsafe { &mut (*self.node_ptr()).value }
> > +    }
> > +
> > +    /// Remove this entry from the [`RBTree`].
> > +    pub fn remove_node(self) -> RBTreeNode<K, V> {
> > +        // SAFETY: The node is a node in the tree, so it is valid.
> > +        unsafe { bindings::rb_erase(self.node_links, &mut self.rbtree.=
root) };
> > +
> > +        // INVARIANT: The node is being returned and the caller may fr=
ee it, however, it was
> > +        // removed from the tree. So the invariants still hold.
> > +        RBTreeNode {
> > +            // SAFETY: The node was a node in the tree, but we removed=
 it, so we can convert it
> > +            // back into a box.
> > +            node: unsafe { Box::from_raw(self.node_ptr()) },
> > +        }
> > +    }
> > +
> > +    /// Takes the value of the entry out of the map, and returns it.
> > +    pub fn remove(self) -> V {
> > +        self.remove_node().node.value
> > +    }
> > +
> > +    /// Swap the current node for the provided node.
> > +    ///
> > +    /// The key of both nodes must be equal.
>
> Is this a safety requirement? Ie if it is violated, can memory bugs
> occur, or is it only going to lead to logic bugs?

No, it's not a safety requirement.

Alice
