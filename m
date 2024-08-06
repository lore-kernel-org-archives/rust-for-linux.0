Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A71BD006
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932712; cv=none; b=AxU+KeGVyVUAIXHKkFqHLPYfmPh7h8dZwVlsxG+NdRjlI6DwnB9bTEynaiJhVHM61bFGSLAgk2R871UtSO0TuyCyRXnXx0RR8hWBr8fYH5+p/3d2B0/nJ2zkjrWz6r7/3h5fNBzjs1FkNAjCeNzAexFiknWjlSJCgWejuaPPC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932712; c=relaxed/simple;
	bh=mboVvNhKcvl1afsR3mD8DUGbbF4m0JowXtSj1g82+jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NynfzuzybcSIjY1yu6jwBcL5rncS2XYUKJfNKKEI+lXBbV5MMHI0MCyjhFslnnvASsOXfAKeB9gg1jgsC4aA0tgqN5IUiTTqQEtyMOouRCcSioGt1NX066nYjs7HhEpJMjvIBgC2+ulD12VtNdYGczq6svc3AW1ikLqKJJhCn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OgXpY4bW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OgXpY4bW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36844375001so262555f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722932709; x=1723537509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9lvJsKz7ICijd0DhaLxQWu2jzPpArvPl4I2+SueeEM=;
        b=OgXpY4bWBOW7fzhYjIyRYN0mqkCZenDmAqkQM17P2Yltgq3a2O1k0MdDOBxfFwZfle
         ISLvWFtfUec+M4lGxDITsQPS2SE810nai4ESP6HCMK3AYba7HpLP0hz9ZyyRY/OpAAmR
         Lbo2LxfDovMNuxtvzcIOwq2sncsWXS6NAwfJ60ZsUh/5Kq1LhOZIQuSIiIdRWHBPxpyt
         i7cTFR9Tv9mjyqPuIysBPSyVOhZcFKHVL2ujZ0I9MIr/LJ9Bb4f6XkPUz9vfCrkyRc2w
         DjbX7eIkMmsBFIK8hpndq0H5KmYRPulmFNo2HY9bJv1XaoUZOmxOeNSoSN0klfzuNeqc
         jdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722932709; x=1723537509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9lvJsKz7ICijd0DhaLxQWu2jzPpArvPl4I2+SueeEM=;
        b=Q+VUTneFSij+RhCrp4DwpV43FnwkQXMCd+6zegjikRBig2StN/09DMmFZ8L5nLqul2
         dVT1p3+HxENcXtyf8/yGmrt8/DKFAoXSBOmr6b7lVPl+A67CU/vZZO99xlzr50L+XojK
         KMkV9PXTBGUCxJkf3mcKHS9GZVdRx6TDOaRxjHgQBbYisER2RFdxdSDhf1q2wzyO1rvS
         3rWysMDyZP3DvXpeWh9QkN5YBjN071krqL31yk06A6LN+CRMU/Vbs7bEgcsSG96SlUwu
         Cr5nE+flxpDx80F8LnpACLOzc+qbG2AR6+W4jvuU+0G+41/ZfjPN87HOuDQbcfeXY96d
         VgoA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Afcr+CyDDIwoHlrPd7nD4ervonqqZwVhKRRDEaCxGYLXiuvaae0UEXgUzIkqWq66EV8ZH5eCGq7m0rfp/dUFonEgljHLtuBqfdxqMV4=
X-Gm-Message-State: AOJu0YyTpX3Yoyr0GKf5AJF/PmGgAWCHBTSH1vhA2kp43Khi+umsW9fx
	FBeeMHMiYgBJso4xB6eKV+H6ZfrG2yIWdwTrnURSKLshxIpSLzf2bNVGkTpuxaYZQjPF4PPl2ok
	ofD2bnzyqnDP8yem8tluPFdmAlojJtIMiU3zK
X-Google-Smtp-Source: AGHT+IH7to2+HL7/ovgLIty8opMiRdlHrd+tIFDP5fRdfdgqS+61vXDnKz1ED/ta3fm/pAv+4e73SjBAYI+LWrTIrBk=
X-Received: by 2002:a5d:40cc:0:b0:368:117c:84fd with SMTP id
 ffacd0b85a97d-36bbc0a71aemr7953673f8f.3.1722932708742; Tue, 06 Aug 2024
 01:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
 <20240727-b4-rbtree-v8-5-951600ada434@google.com> <309d3d27-62d0-42b0-b50a-40692a019b40@proton.me>
In-Reply-To: <309d3d27-62d0-42b0-b50a-40692a019b40@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Aug 2024 10:24:56 +0200
Message-ID: <CAH5fLgh30z2Cfixn1aC-LPp-ua46eJ+jREWDTfhMK3aqXzbt-A@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] rust: rbtree: add `RBTreeCursor`
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

On Mon, Aug 5, 2024 at 9:35=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 27.07.24 22:30, Matt Gilbride wrote:
> > +    /// Returns a cursor over the tree nodes based on the given key.
> > +    ///
> > +    /// If the given key exists, the cursor starts there.
> > +    /// Otherwise it starts with the first larger key in sort order.
> > +    /// If there is no larger key, it returns [`None`].
> > +    pub fn cursor_lower_bound(&mut self, key: &K) -> Option<RBTreeCurs=
or<'_, K, V>>
> > +    where
> > +        K: Ord,
> > +    {
> > +        let mut node =3D self.root.rb_node;
> > +        let mut best_match: Option<NonNull<Node<K, V>>> =3D None;
> > +        while !node.is_null() {
> > +            // SAFETY: By the type invariant of `Self`, all non-null `=
rb_node` pointers stored in `self`
> > +            // point to the links field of `Node<K, V>` objects.
> > +            let this =3D unsafe { container_of!(node, Node<K, V>, link=
s) }.cast_mut();
> > +            // SAFETY: `this` is a non-null node so it is valid by the=
 type invariants.
> > +            let this_key =3D unsafe { &(*this).key };
> > +            // SAFETY: `node` is a non-null node so it is valid by the=
 type invariants.
> > +            let left_child =3D unsafe { (*node).rb_left };
> > +            // SAFETY: `node` is a non-null node so it is valid by the=
 type invariants.
> > +            let right_child =3D unsafe { (*node).rb_right };
> > +            if key =3D=3D this_key {
> > +                return NonNull::new(node).map(|current| {
> > +                    // INVARIANT:
> > +                    // - `node` is a valid node in the [`RBTree`] poin=
ted to by `self`.
> > +                    // - Due to the type signature of this function, t=
he returned [`RBTreeCursor`]
> > +                    //   borrows mutably from `self`.
> > +                    RBTreeCursor {
> > +                        current,
> > +                        tree: self,
> > +                    }
> > +                });
> > +            } else {
> > +                node =3D if key > this_key {
> > +                    right_child
> > +                } else {
> > +                    let is_better_match =3D match best_match {
> > +                        None =3D> true,
> > +                        Some(best) =3D> {
> > +                            // SAFETY: `best` is a non-null node so it=
 is valid by the type invariants.
> > +                            let best_key =3D unsafe { &(*best.as_ptr()=
).key };
> > +                            best_key > this_key
> > +                        }
> > +                    };
> > +                    if is_better_match {
> > +                        best_match =3D NonNull::new(this);
> > +                    }
> > +                    left_child
> > +                };
> > +            }
> > +        }
> > +
> > +        let best =3D best_match?;
> > +
> > +        // SAFETY: `best` is a non-null node so it is valid by the typ=
e invariants.
> > +        let links =3D unsafe { addr_of_mut!((*best.as_ptr()).links) };
> > +
> > +        NonNull::new(links).map(|current| {
>
> Why would `links` be a null pointer? AFAIK it just came from `best`
> which is non-null. (I don't know if we want to use `new_unchecked`
> instead, but wanted to mention it)

It's never a null pointer in this branch. Do you prefer an extra
unsafe block to call new_unchecked?

> > +            // INVARIANT:
> > +            // - `current` is a valid node in the [`RBTree`] pointed t=
o by `self`.
> > +            // - Due to the type signature of this function, the retur=
ned [`RBTreeCursor`]
> > +            //   borrows mutably from `self`.
> > +            RBTreeCursor {
> > +                current,
> > +                tree: self,
> > +            }
> > +        })
> > +    }
>
> [...]
>
> > +/// // Calling `remove_next` removes and returns the last element.
> > +/// assert_eq!(cursor.remove_next().unwrap().to_key_value(), (30, 300)=
);
> > +///
> > +/// # Ok::<(), Error>(())
> > +/// ```
>
> I would put a newline here.

Ok.

> > +/// # Invariants
> > +/// - `current` points to a node that is in the same [`RBTree`] as `tr=
ee`.
> > +pub struct RBTreeCursor<'a, K, V> {
>
> I think we can name it just `Cursor`, since one can refer to it as
> `rbtree::Cursor` and then it also follows the naming scheme for `Iter`
> etc.

You are welcome to submit that as a follow-up change.

> > +    tree: &'a mut RBTree<K, V>,
> > +    current: NonNull<bindings::rb_node>,
> > +}
> > +
> > +// SAFETY: The [`RBTreeCursor`] gives out immutable references to K an=
d mutable references to V,
> > +// so it has the same thread safety requirements as mutable references=
.
> > +unsafe impl<'a, K: Send, V: Send> Send for RBTreeCursor<'a, K, V> {}
>
> Again, do we want to use `K: Sync` here instead?

In this case, `K: Send` and `K: Sync` are both sufficient conditions,
but `K: Send` will generally be less restrictive for the user.

> > +    fn peek(&self, direction: Direction) -> Option<(&K, &V)> {
> > +        self.get_neighbor_raw(direction)
> > +            // SAFETY:
> > +            // - `neighbor` is a valid tree node.
> > +            // - By the function signature, we have an immutable refer=
ence to `self`.
> > +            .map(|neighbor| unsafe { Self::to_key_value(neighbor) })
>
> Alternative way of formatting this:
>
>         self.get_neighbor_raw(direction).map(|neighbor| {
>             // SAFETY:
>             // - `neighbor` is a valid tree node.
>             // - By the function signature, we have an immutable referenc=
e to `self`.
>             unsafe { Self::to_key_value(neighbor) }
>         })
>
> I think it looks nicer, but we should probably have a written
> preference.

We can reformat since we need another version anyway, but otherwise I
would have asked you to make this a follow-up change.

> > +    }
> > +
> > +    /// Access the previous node mutably without moving the cursor.
> > +    pub fn peek_prev_mut(&mut self) -> Option<(&K, &mut V)> {
> > +        self.peek_mut(Direction::Prev)
> > +    }
> > +
> > +    /// Access the next node mutably without moving the cursor.
> > +    pub fn peek_next_mut(&mut self) -> Option<(&K, &mut V)> {
> > +        self.peek_mut(Direction::Next)
> > +    }
> > +
> > +    fn peek_mut(&mut self, direction: Direction) -> Option<(&K, &mut V=
)> {
> > +        self.get_neighbor_raw(direction)
> > +            // SAFETY:
> > +            // - `neighbor` is a valid tree node.
> > +            // - By the function signature, we have a mutable referenc=
e to `self`.
> > +            .map(|neighbor| unsafe { Self::to_key_value_mut(neighbor) =
})
>
> Ditto.

Ditto.

Alice
