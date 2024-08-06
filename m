Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB79165EF1
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722933055; cv=none; b=HSW1iUzbNwqaufMQgPrX4pxb0/uTiai93miyn1nZ7bLYdC/XELRHC61fEadJXrczFGS8OiWzHLAv0aFwO+2KOV1oWrHV9cD1qMUuAANCRH7+EhJhVOXsNcr2EYe4w/BffQ/kPUuHAMoEDEsSb8YECFCRLiKPcx8mIPdpmnojuW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722933055; c=relaxed/simple;
	bh=LnFZp12TIqn5SQDpHxYlO8HWh+yQl3eB38wxtB7M/dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5+ATca0ZisuK3xPLvrnsjM7V3NmsKbgiwa7D3034sYtnVEqGvoRV+3Wc43rXB+vK4Rod9Y1MjBVxT4/FsiNGXADxDLTx7QADtJgsU8/3TSD1k1xZJdVAk4Sr1FvsI8sc5uGglH4+JJkEVPTYYxjsuNA+lCaWpJKoRAywv1hoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UNkWtgSi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UNkWtgSi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281faefea9so1836095e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722933052; x=1723537852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koPOZ7NdBsDQmuAR9Ro33aVNgwZigMdr1Rj3bsmXrOA=;
        b=UNkWtgSifrHxv5r8YRgHrbFiADBB/J+2QridtLmbrTXwiWUk24iETWshgVpx6BUswV
         SrS/UizzqPPHZuzT2UH1becATmPwb+T4sG7oAtTAhfNQEAimeHs1/bMoQOF+rnKWtUXA
         t1N99A54fvaVpOuAyhY2IiBaL59xyurG/uslHzdP4xI/jFF10eHskPuI5bbKNL+6xyFV
         bySQsvDa39EsCf90RZSCySfuwzbW+/i/op/WQAwMjHpdRbUA8YOUMs/E+qpZd48hTmlR
         MorQfzVvjs6pYxtUryBUfDbH8Y8iBHXCdJATFO6RvMlsE880z/t482aL9+ghfBA3jUlU
         dwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722933052; x=1723537852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koPOZ7NdBsDQmuAR9Ro33aVNgwZigMdr1Rj3bsmXrOA=;
        b=ebCZrN2Z3xmN/FB2IEBh7gg6Aw+c7jycDSLHB23ZFBgeTm72uvXc23I9jQe2PTI7hW
         n7lClxsRk3x9IU04zkkUTKhtkRyEQJ+3roHjDoQcwm13/2VrDm8nKDi00URx//ivgRn4
         bgbs5dj7uxTeOLCUPatddLOUMYdKxFuxan/0Xb0utnsNUrDlyoPegrycaSyxdAgLn3/D
         6Tx91ObU3FX5UCa0DEc1k8KnTi2Wv9mdAD9EO0eT4uZWL0Sl4MuKragzZD8S9bH8nBcz
         TTBSIOw25NEYN5Th0AfI3ApJVwm1/MW9gFdLAtKy/c9e7OOlPbDeX8+xl5uCB+fbpabh
         4dtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBAPKt8CbUMf1Suxs8rj1X0gCV+CPPqnp6XnOlzT9JCKcNIie4OrvXlWDGDhxEE8EK4UMe50OkZWJGxungOO93xlMamX7QSZZ4yDUbcYM=
X-Gm-Message-State: AOJu0YxLRgmfQZn3UvOvSpEuEzhbWk/TS5YyTY+w76LGgi9lIiI4cRJw
	rihr2mewrCLOKZ5qMCh8I2/ZqLMNaPmQnW/tbxZIR7PwfEEhEq2izEQNpBzwxWIcFg78T9hdiBn
	ZH2svGiebs9dh5imD13m53BaO7IQIrAwv88IJ
X-Google-Smtp-Source: AGHT+IGzYHiShkvLDa3uQWiW2yA3lF+z/Tz24rRjBIX2lqr731n7mHLts+IQtweqWLM8ZWv2S//3CGuONC3J6sjgRkY=
X-Received: by 2002:a05:600c:46cc:b0:426:5e0b:5823 with SMTP id
 5b1f17b1804b1-428e6b92fdcmr95073695e9.34.1722933052114; Tue, 06 Aug 2024
 01:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
 <20240727-b4-rbtree-v8-4-951600ada434@google.com> <27f724ba-4f04-407b-9f5d-81a472f8ba14@proton.me>
In-Reply-To: <27f724ba-4f04-407b-9f5d-81a472f8ba14@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Aug 2024 10:30:40 +0200
Message-ID: <CAH5fLghJmA_01QJvzSBX4HEfLwPr+FskM9dzOs0ykbYj_sCWTg@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: rbtree: add mutable iterator
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

On Mon, Aug 5, 2024 at 9:22=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 27.07.24 22:30, Matt Gilbride wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> >
> > Add mutable Iterator implementation for `RBTree`,
> > allowing iteration over (key, value) pairs in key order. Only values ar=
e
> > mutable, as mutating keys implies modifying a node's position in the tr=
ee.
> >
> > Mutable iteration is used by the binder driver during shutdown to
> > clean up the tree maintained by the "range allocator" [1].
> >
> > Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-6-=
08ba9197f637@google.com/ [1]
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/rbtree.rs | 98 +++++++++++++++++++++++++++++++++++++++++++=
+-------
> >  1 file changed, 86 insertions(+), 12 deletions(-)
> >
> > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > index d10074e4ac58..d7514ebadfa8 100644
> > --- a/rust/kernel/rbtree.rs
> > +++ b/rust/kernel/rbtree.rs
> > @@ -197,8 +197,26 @@ pub fn iter(&self) -> Iter<'_, K, V> {
> >          // INVARIANT: `bindings::rb_first` returns a valid pointer to =
a tree node given a valid pointer to a tree root.
>
> This INVARIANT is out of place, `Iter` doesn't have any INVARIANT any
> more.

We can delete it.

> >          Iter {
> >              _tree: PhantomData,
> > -            // SAFETY: `self.root` is a valid pointer to the tree root=
.
> > -            next: unsafe { bindings::rb_first(&self.root) },
> > +            iter_raw: IterRaw {
>
> This `IterRaw` construction is missing an INVARIANT comment. I think you
> can copy paste from below.

We can copy from below.

> > +                // SAFETY: by the invariants, all pointers are valid.
> > +                next: unsafe { bindings::rb_first(&self.root) },
> > +                _phantom: PhantomData,
> > +            },
> > +        }
> > +    }
> > +
> > +    /// Returns a mutable iterator over the tree nodes, sorted by key.
> > +    pub fn iter_mut(&mut self) -> IterMut<'_, K, V> {
> > +        IterMut {
> > +            _tree: PhantomData,
> > +            // INVARIANT:
> > +            //   - `self.root` is a valid pointer to a tree root.
> > +            //   - `bindings::rb_first` produces a valid pointer to a =
node given `root` is valid.
> > +            iter_raw: IterRaw {
> > +                // SAFETY: by the invariants, all pointers are valid.
> > +                next: unsafe { bindings::rb_first(&self.root) },
>
> Does this really derive a mutable reference? Ie shouldn't this be:?
>
>     next: unsafe { bindings::rb_first(&mut self.root) },

Let's change this to:

next: unsafe { bindings::rb_first(ptr::from_mut(&mut self.root)) }

This way, the pointer will be derived from a mutable reference even if
it becomes a `*const` through intermediate operations.


> > +                _phantom: PhantomData,
> > +            },
> >          }
> >      }
> >
> > @@ -211,6 +229,11 @@ pub fn keys(&self) -> impl Iterator<Item =3D &'_ K=
> {
> >      pub fn values(&self) -> impl Iterator<Item =3D &'_ V> {
> >          self.iter().map(|(_, v)| v)
> >      }
> > +
> > +    /// Returns a mutable iterator over the values of the nodes in the=
 tree, sorted by key.
> > +    pub fn values_mut(&mut self) -> impl Iterator<Item =3D &'_ mut V> =
{
> > +        self.iter_mut().map(|(_, v)| v)
> > +    }
> >  }
> >
> >  impl<K, V> RBTree<K, V>
> > @@ -414,13 +437,9 @@ fn into_iter(self) -> Self::IntoIter {
> >  /// An iterator over the nodes of a [`RBTree`].
> >  ///
> >  /// Instances are created by calling [`RBTree::iter`].
> > -///
> > -/// # Invariants
> > -/// - `self.next` is a valid pointer.
> > -/// - `self.next` points to a node stored inside of a valid `RBTree`.
> >  pub struct Iter<'a, K, V> {
> >      _tree: PhantomData<&'a RBTree<K, V>>,
> > -    next: *mut bindings::rb_node,
> > +    iter_raw: IterRaw<K, V>,
> >  }
> >
> >  // SAFETY: The [`Iter`] gives out immutable references to K and V, so =
it has the same
> > @@ -434,21 +453,76 @@ unsafe impl<'a, K: Sync, V: Sync> Sync for Iter<'=
a, K, V> {}
> >  impl<'a, K, V> Iterator for Iter<'a, K, V> {
> >      type Item =3D (&'a K, &'a V);
> >
> > +    fn next(&mut self) -> Option<Self::Item> {
> > +        self.iter_raw.next().map(|(k, v)|
> > +            // SAFETY: Due to `self._tree`, `k` and `v` are valid for =
the lifetime of `'a`.
> > +            unsafe { (&*k, &*v) })
>
> I don't really like the formatting here, can you move the SAFETY one
> line upwards? It should format nicely then.

You suggested exactly the reverse formatting change on RBTreeCursor?

> > +    }
> > +}
> > +
> > +impl<'a, K, V> IntoIterator for &'a mut RBTree<K, V> {
> > +    type Item =3D (&'a K, &'a mut V);
> > +    type IntoIter =3D IterMut<'a, K, V>;
> > +
> > +    fn into_iter(self) -> Self::IntoIter {
> > +        self.iter_mut()
> > +    }
> > +}
> > +
> > +/// A mutable iterator over the nodes of a [`RBTree`].
> > +///
> > +/// Instances are created by calling [`RBTree::iter_mut`].
> > +pub struct IterMut<'a, K, V> {
> > +    _tree: PhantomData<&'a mut RBTree<K, V>>,
> > +    iter_raw: IterRaw<K, V>,
> > +}
> > +
> > +// SAFETY: The [`IterMut`] gives out immutable references to K and mut=
able references to V, so it has the same
> > +// thread safety requirements as mutable references.
> > +unsafe impl<'a, K: Send, V: Send> Send for IterMut<'a, K, V> {}
>
> Since we only borrow `K` immutably, would it make sense to have `K:
> Sync`?

No, `K: Send` is better because it's less restrictive in practice.

Alice
