Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289CC176FBD
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724275914; cv=none; b=aG2+uvRgGxKO746dr0V1P1YJX8MuotTdepOzK7Xg4MnilOIEhHeT9JRExYW1Lg6DTusLdnuTQTqrVuzxJ+zMq1C2YVWZdAjxLqjnAcST8kDsJ2XPoqS39Z6ZqYtBou45asf6zuBM10qC0LcOcs3nkOoJr8LxmJTyL5ENzNHBAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724275914; c=relaxed/simple;
	bh=Vvum9Is0ZWnVPi9I6VEKZxoVfxfRvRNb1KUrcdJNW5o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huv3KFvN4/wvxi28OnVHvZV4vm/0fC8jlANmQOP1lZ5jEHW9ULyMr89ouPke6TBR7TrWME68+fQ3Ad6VsMYE9QEe8uFnrqir2L8rrMFUu5EjdgqsGwhggMKBFKvwzLu6QUxQyVwQoik3ldYVWMZWC/h4lqYFrq9gcQDpkLk1Rz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=m1nFsIO0; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="m1nFsIO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=piwkaky54zeahh4i26rflfmlii.protonmail; t=1724275909; x=1724535109;
	bh=KIYpsBESEoyJeJ69k/FIRFzC57Q0KzjDCUBa0copSY4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m1nFsIO0nFMrQjqrSVon/CC2G0P685nSlTJ6pYvNez3EDBhPSzpYpHXuoWIcgOypb
	 v+Mbg63WqY/hxRPfxJBgypTTf1eYrCCdSlxB/fHDk5yzwLBoJC1GhYsFpYtHji+RFZ
	 4+ryJ2FlQFLQxWsKQFF0PTwwo2ocG3Ln6yBCq1np709AsBTbkHsTPluvR93GLiK/1M
	 jBcbThfkLfXDm1AFNblq5Padc6QtorzEAEp5cxenlJnetKJRrIPjxKYkyLs7S0CaMm
	 Wp7bDr2JuRldv7gVikKtFcH7S/OcP7e07aMLnc3RZFAY2IiywzH5x60i5rhElVq9cS
	 LRP/XRdcR5IWg==
Date: Wed, 21 Aug 2024 21:31:37 +0000
To: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/5] rust: rbtree: add cursor
Message-ID: <f7b77170-be85-4abf-a29e-00b501f0fd89@proton.me>
In-Reply-To: <20240821-b4-rbtree-v11-4-2ddc66f26972@google.com>
References: <20240821-b4-rbtree-v11-0-2ddc66f26972@google.com> <20240821-b4-rbtree-v11-4-2ddc66f26972@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7472b51d89b2b2af9c37fc8051e70c9d17d7029e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 21.08.24 19:42, Matt Gilbride wrote:
> +    /// Remove the current node from the tree.
> +    ///
> +    /// Returns a tuple where the first element is a cursor to the next =
node, if it exists,
> +    /// else the previous node, else [`None`] (if the tree becomes empty=
). The second element
> +    /// is the removed node.
> +    pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
> +        let prev =3D self.get_neighbor_raw(Direction::Prev);
> +        let next =3D self.get_neighbor_raw(Direction::Next);
> +        // SAFETY: By the type invariant of `Self`, all non-null `rb_nod=
e` pointers stored in `self`
> +        // point to the links field of `Node<K, V>` objects.
> +        let this =3D unsafe { container_of!(self.current.as_ptr(), Node<=
K, V>, links) }.cast_mut();
> +        // SAFETY: `this` is valid by the type invariants as described a=
bove.
> +        let node =3D unsafe { Box::from_raw(this) };
> +        let node =3D RBTreeNode { node };
> +        // SAFETY: The reference to the tree used to create the cursor o=
utlives the cursor, so
> +        // the tree cannot change. By the tree invariant, all nodes are =
valid.
> +        unsafe { bindings::rb_erase(&mut (*this).links, addr_of_mut!(sel=
f.tree.root)) };
> +
> +        let current =3D match (prev, next) {
> +            (_, Some(next)) =3D> next,
> +            (Some(prev), None) =3D> prev,
> +            (None, None) =3D> {
> +                return (None, node);
> +            }
> +        };
> +
> +        (
> +            // INVARIANT:
> +            // - `current` is a valid node in the [`RBTree`] pointed to =
by `self.tree`.
> +            // - Due to the function signature, `self` is an owned [`Cur=
sor`],
> +            //   and [`Cursor`]s are only created via functions with a m=
utable reference
> +            //   to an [`RBTree`].

You missed this stale invariant.

> +            Some(Self {
> +                current,
> +                tree: self.tree,
> +            }),
> +            node,
> +        )
> +    }
> +
> +    /// Remove the previous node, returning it if it exists.
> +    pub fn remove_prev(&mut self) -> Option<RBTreeNode<K, V>> {
> +        self.remove_neighbor(Direction::Prev)
> +    }
> +
> +    /// Remove the next node, returning it if it exists.
> +    pub fn remove_next(&mut self) -> Option<RBTreeNode<K, V>> {
> +        self.remove_neighbor(Direction::Next)
> +    }
> +
> +    fn remove_neighbor(&mut self, direction: Direction) -> Option<RBTree=
Node<K, V>> {
> +        if let Some(neighbor) =3D self.get_neighbor_raw(direction) {
> +            let neighbor =3D neighbor.as_ptr();
> +            // SAFETY: The reference to the tree used to create the curs=
or outlives the cursor, so
> +            // the tree cannot change. By the tree invariant, all nodes =
are valid.
> +            unsafe { bindings::rb_erase(neighbor, addr_of_mut!(self.tree=
.root)) };
> +            // SAFETY: By the type invariant of `Self`, all non-null `rb=
_node` pointers stored in `self`
> +            // point to the links field of `Node<K, V>` objects.
> +            let this =3D unsafe { container_of!(neighbor, Node<K, V>, li=
nks) }.cast_mut();
> +            // SAFETY: `this` is valid by the type invariants as describ=
ed above.
> +            let node =3D unsafe { Box::from_raw(this) };
> +            return Some(RBTreeNode { node });
> +        }
> +        None
> +    }
> +
> +    /// Move the cursor to the previous node, returning [`None`] if it d=
oesn't exist.
> +    pub fn move_prev(self) -> Option<Self> {
> +        self.mv(Direction::Prev)
> +    }
> +
> +    /// Move the cursor to the next node, returning [`None`] if it doesn=
't exist.
> +    pub fn move_next(self) -> Option<Self> {
> +        self.mv(Direction::Next)
> +    }
> +
> +    fn mv(self, direction: Direction) -> Option<Self> {
> +        // INVARIANT:
> +        // - `neighbor` is a valid node in the [`RBTree`] pointed to by =
`self.tree`.
> +        // - Due to the function signature, `self` is an owned [`Cursor`=
],
> +        //   and [`Cursor`]s are only created via functions with a mutab=
le reference
> +        //   to an [`RBTree`].

And this one too.

With those fixed:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> +        self.get_neighbor_raw(direction).map(|neighbor| Self {
> +            tree: self.tree,
> +            current: neighbor,
> +        })
> +    }

