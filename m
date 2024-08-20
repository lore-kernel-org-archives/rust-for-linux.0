Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D0189BBD
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141312; cv=none; b=L1X4CUuOdB2RTiHCzpJ91f2SPj75Mbo/+dQz/vgKpwQs3XBi7y0jXefihEEfP+d/fa8znhJ+CVdeyeR2DB2dxsA1TNF3H7I2E6INmn60cZQISdpJCdWt3+xnIqY4dyAp+NTCerc3LP0vfzeE0AGJVkvsuRR9ckbGbU48Licp2/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141312; c=relaxed/simple;
	bh=pd90YgBG4tBg17cPOjEFD3caGTY+9mJ92uswnxk6IkE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCLHKK/ICr1SZripxy9eXWS8nmdoeUfj0HtZq8tTwO7gayDsNnBEGgjHUqVafJC2nifZBbIChCr4RR0fnHCB+LonxXmY6mb+oJ7MIepLjZ9gmkam1KctUt1vWbBluH+MVXog1jOvJecNIxljhNCbYkt89x+UpSuMj852hD7mJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ETXQDx+F; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ETXQDx+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724141306; x=1724400506;
	bh=53+5x/xmXek+DbIG4yjMFIEkhMF4WzX2KOCqZDEYdaM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ETXQDx+FpztwH++Xyy1bxmN7dL8AFYd03w0HFzh1Py+dioTXjnSmxku+so0A2rF1b
	 Kim+QH0zXvcdbC+8evJD7Kre8ZRDk3uHnzmVp8b/1/UcR4t9J2THbco7ZO5nfR83vo
	 dPtV1Q7mfLs6a9Bw5ojvbBtfrjMXe5PnmNof59oSstTpS+F1McadQmTHufj1/3bVAc
	 XwV1xhVY/v8B+ecqCritye3o7rhBnqfrmtn3FutpH8X3ziPuf1PzK/pT/qGR5iyRJ6
	 yq64fVB4cIKgGtuYWPivqrwNhtbdW3w2oqR85QnwMlb+R7BtnyclX2/fBeixwUggXl
	 sE/P8YRwPGSGA==
Date: Tue, 20 Aug 2024 08:08:22 +0000
To: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/5] rust: rbtree: add `RBTree::entry`
Message-ID: <57aa157d-ee94-419d-bad3-0bb93f5c2095@proton.me>
In-Reply-To: <20240819-b4-rbtree-v10-5-3b3b2c4d73af@google.com>
References: <20240819-b4-rbtree-v10-0-3b3b2c4d73af@google.com> <20240819-b4-rbtree-v10-5-3b3b2c4d73af@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5ab9c56df45f04e8737dfb27924e85c535452cfa
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.08.24 17:07, Matt Gilbride wrote:
> From: Alice Ryhl <aliceryhl@google.com>
>=20
> This mirrors the entry API [1] from the Rust standard library on
> `RBTree`. This API can be used to access the entry at a specific key and
> make modifications depending on whether the key is vacant or occupied.
> This API is useful because it can often be used to avoid traversing the
> tree multiple times.
>=20
> This is used by binder to look up and conditionally access or insert a
> value, depending on whether it is there or not [2].
>=20
> Link: https://doc.rust-lang.org/stable/std/collections/btree_map/enum.Ent=
ry.html [1]
> Link: https://android-review.googlesource.com/c/kernel/common/+/2849906 [=
2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>

One nit below, but feel free to add if it doesn't work:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
>  rust/kernel/rbtree.rs | 310 ++++++++++++++++++++++++++++++++++++++------=
------
>  1 file changed, 235 insertions(+), 75 deletions(-)

[...]

> +    /// Gets a mutable reference to the value in the entry.
> +    pub fn get_mut(&mut self) -> &mut V {
> +        // SAFETY:
> +        // - `self.node_links` is a valid pointer to a node in the tree.
> +        // - We have exclusive access to the underlying tree, and can th=
us give out a mutable reference.
> +        unsafe {
> +            &mut (*(container_of!(self.node_links, Node<K, V>, links) as=
 *mut Node<K, V>)).value

Does `.cast_mut()` work here instead of `as *mut Node<K, V>`? (also
below)

---
Cheers,
Benno

> +        }
> +    }
> +
> +    /// Converts the entry into a mutable reference to its value.
> +    ///
> +    /// If you need multiple references to the `OccupiedEntry`, see [`se=
lf#get_mut`].
> +    pub fn into_mut(self) -> &'a mut V {
> +        // SAFETY:
> +        // - `self.node_links` is a valid pointer to a node in the tree.
> +        // - This consumes the `&'a mut RBTree<K, V>`, therefore it can =
give out a mutable reference that lives for `'a`.
> +        unsafe {
> +            &mut (*(container_of!(self.node_links, Node<K, V>, links) as=
 *mut Node<K, V>)).value
> +        }
> +    }

