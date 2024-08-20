Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EE172BCE
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139347; cv=none; b=lyyGJdp1VBn1twU31P49OuGm/dyvksAMRtLwoGZ4uqMm7ppLuILFb/hExAzAbwiIC973Rd8+c5V+ZWALdB18jkKGFBGpscbiUjxY3dBucE2MR6UDwN49FsaxQCjeUyR2+47HYLuCB8pcR+P0x25R/pC+mNaYLQNzbZC6HGsuinI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139347; c=relaxed/simple;
	bh=0qyYcTUUT+BcObMIlMH6dB1FjWgwXtRcksr81lpXz2Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEicZf0fQYzoHjbQKe4ln8m4lrW6ftx85Kjx2bnHJ5JqxdQUYxNk8IaI8hjsAO69l+u4zhE1wnfJP3Go9QFQTbTKqmHpzAzX7vopxPUW96D6oiaIP4wJDaeuV5Tq6eHVKg8Aujz50AlKNbiDp9KN1kmuoDQUM2QR3xtkhTjzsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mu4JE11H; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mu4JE11H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724139342; x=1724398542;
	bh=C8txRnFux4b0/vpsavCD5Pu2uOoF/f2dTOxzbv7GJaU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mu4JE11H1Y2jJOB70OthEp0X9DEtOLvT83XHihNgCQUuWT9ZeRshAPZdPsCADpVBB
	 WvjLLJ5Maz4Q3CH0X0Y9dMdlYzpgXDrgh4gNYMgqWENfd6yITHOM12azI+3F4Ai3vQ
	 +QFgUYdCce8UcRX4YioZI9Tkn4Do6KtBB1hVuEfKHsLfm8HlbyY2XYpfrK0rT9SGmx
	 +sq0BP7uY4ELRPLBIHoHp37JPNTbC6a1EM+2r8vFlTgn3i7tD6aojsBi4Lf9CyJs6g
	 +Rc169TBFJm3oec1NLnP1Mr5WhZHWQE7hyQ7HaWrbtzeNhOCFYLnDjBsVd/u8pAgFK
	 kpGDfrIYetkCA==
Date: Tue, 20 Aug 2024 07:35:37 +0000
To: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/5] rust: rbtree: add mutable iterator
Message-ID: <dce117a2-3e07-4fd6-a2cf-e06db8306249@proton.me>
In-Reply-To: <20240819-b4-rbtree-v10-3-3b3b2c4d73af@google.com>
References: <20240819-b4-rbtree-v10-0-3b3b2c4d73af@google.com> <20240819-b4-rbtree-v10-3-3b3b2c4d73af@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 88e96e6948296bd321b2a9684232a81af62b7810
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.08.24 17:07, Matt Gilbride wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>=20
> Add mutable Iterator implementation for `RBTree`,
> allowing iteration over (key, value) pairs in key order. Only values are
> mutable, as mutating keys implies modifying a node's position in the tree=
.
>=20
> Mutable iteration is used by the binder driver during shutdown to
> clean up the tree maintained by the "range allocator" [1].
>=20
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-6-08=
ba9197f637@google.com/ [1]
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> ---

I got one nit below, but it already looks good:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

>  rust/kernel/rbtree.rs | 104 +++++++++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 90 insertions(+), 14 deletions(-)

[...]

> +impl<K, V> Iterator for IterRaw<K, V> {
> +    type Item =3D (*mut K, *mut V);
> +
>      fn next(&mut self) -> Option<Self::Item> {
>          if self.next.is_null() {
>              return None;
>          }
>=20
> -        // SAFETY: By the type invariant of `Iter`, `self.next` is a val=
id node in an `RBTree`,
> +        // SAFETY: By the type invariant of `IterRaw`, `self.next` is a =
valid node in an `RBTree`,
>          // and by the type invariant of `RBTree`, all nodes point to the=
 links field of `Node<K, V>` objects.
> -        let cur =3D unsafe { container_of!(self.next, Node<K, V>, links)=
 };
> +        let cur: *mut Node<K, V> =3D

Do you need to specify this type? If not then the line would fit on one.

---
Cheers,
Benno

> +            unsafe { container_of!(self.next, Node<K, V>, links) }.cast_=
mut();
>=20
>          // SAFETY: `self.next` is a valid tree node by the type invarian=
ts.
>          self.next =3D unsafe { bindings::rb_next(self.next) };
>=20
> -        // SAFETY: By the same reasoning above, it is safe to dereferenc=
e the node. Additionally,
> -        // it is ok to return a reference to members because the iterato=
r must outlive it.
> -        Some(unsafe { (&(*cur).key, &(*cur).value) })
> +        // SAFETY: By the same reasoning above, it is safe to dereferenc=
e the node.
> +        Some(unsafe { (addr_of_mut!((*cur).key), addr_of_mut!((*cur).val=
ue)) })
>      }
>  }
>=20
>=20
> --
> 2.46.0.184.g6999bdac58-goog
>=20

