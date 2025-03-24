Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACF257443
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803157; cv=none; b=YoEVVQxCfpSULOdkQo678yw0jnuduoRfwjSLQbcnocJHVtE9IgwG92dkxWQC3JiNEc6+miJHbo0Egz/ziENc11jhOlLNW0N+wJf3SGwuaI3i6lFGEkXvVA31RhuviUJWcpsFMT7Ny349uRiE15mIUNu5Z6cqJdBkvyFWs+IEnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803157; c=relaxed/simple;
	bh=cQv7TD29YFOXq9eSJ7bWcsI3cggdcLl5k5/BLWPJuos=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eiRW/HaeJ3fnc8FqX0MGGeuobTT/u9MB3tyI5NRIcsWmTkm0PGvPkEzHP//4Fa+G/miiChRNQgr8nOYwW5Pwn6+Ook4b54SeRkMiXoQFEBFyVlUOldxk41uCi9wWbe2hNOmFjeuPFfJdQdhcDiKHLC9dT1ysU+Rj2yetZowxP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=j2gIYRSZ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="j2gIYRSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1742803146; x=1743062346;
	bh=0TjUvF28ALbT0hUt0OU2d7JN+ZbneHIxGYIojNxdUeU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=j2gIYRSZ6scbJN1NIHamQenYBFPt8lmz0Y2INjcVknRypmhmmVcbAEpc2p2eX0KPk
	 bpT5K4xH+8Bl8QMjg1wiMjX3FO4i2KtGH+mYQa7jjdURtdnFWCSofYrmdfH2sKFLSs
	 w+/xvvcZZz2eiNEB9iZDfi5u0b6fjR6Xq6r06EVWzj8o/VE9eX6GmYf0kb7oXB7C2n
	 v8ZLnEWus0kloK1bqwpnVEFIexK/CgZ/5yuuup2zGV3sP3qA7uwHwvYl/4A3Uvih4A
	 TsnQeBQ0XuzTyMvY1xUE4I2jwavhqhfTy5/grUcX5Dk9Z70ZR1wcxm5fE+2EWu6CfY
	 jwUQztvXI2GEQ==
Date: Mon, 24 Mar 2025 07:59:01 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/4] rust: adding OwnableRefCounted and SimpleOwnableRefCounted
Message-ID: <Z-EQwgxLC2-iFtz7@mango>
In-Reply-To: <67dd95be.050a0220.ff22e.716f@mx.google.com>
References: <20250313-unique-ref-v8-0-3082ffc67a31@pm.me> <20250313-unique-ref-v8-4-3082ffc67a31@pm.me> <67dd95be.050a0220.ff22e.716f@mx.google.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 385175752ba1fc1cf604748e4c3c05d8a6789ed3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250321 0937, Boqun Feng wrote:
> >
> > +/// A trait for objects that can be wrapped in either one of the refer=
ence types [`Owned`] and
> > +/// [`ARef`].
> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that:
> > +///
> > +/// - Both the safety requirements for [`Ownable`] and [`RefCounted`] =
are fulfilled.
> > +/// - The uniqueness invariant of [`Owned`] is upheld until dropped.
>=20
> Could you explain what this safety requirement means? Isn't this part of
> the safe requirement of `impl Ownable`?

To be honest, I don't remember. Right now I also can't see a good reason
for it. Might be I was confused by the documentation of the safety
requirements for Ownable.

Thinking about it, there seems to be something wrong with these:

> /// # Safety
> ///
> /// Implementers must ensure that any objects borrowed directly as `&T` s=
tay alive for the duration
> /// of the lifetime, and that any objects owned by Rust as [`Owned<T>`] s=
tay alive while that owned
> /// reference exists, until the [`Ownable::release()`] trait method is ca=
lled.
> pub unsafe trait Ownable {
>     /// Releases the object (frees it or returns it to foreign ownership)=
.
>     ///
>     /// # Safety
>     ///
>     /// Callers must ensure that the object is no longer referenced after=
 this call.
>     unsafe fn release(this: NonNull<Self>);
> }
>=20
> /// A subtrait of Ownable that asserts that an [`Owned<T>`] Rust referenc=
e is not only unique
> /// within Rust and keeps the `T` alive, but also guarantees that the C c=
ode follows the
> /// usual mutable reference requirements. That is, the kernel will never =
mutate the
> /// `T` (excluding internal mutability that follows the usual rules) whil=
e Rust owns it.
> ///
> /// When this type is implemented for an [`Ownable`] type, it allows [`Ow=
ned<T>`] to be
> /// dereferenced into a &mut T.
> ///
> /// # Safety
> ///
> /// Implementers must ensure that the kernel never mutates the underlying=
 type while
> /// Rust owns it.
> pub unsafe trait OwnableMut: Ownable {}

As an Owned hands out an `&` to an Ownable, the requirement about the kerne=
l
not mutating it should apply to an Ownable just the same as to an OwnableMu=
t.

The point of OwnableMut should by to declare that it is safe to hand out an
`&mut` which implies that it is not pinned.

I didn't want to mess too much with Asahi Lina's patch, so I left it as is.
Maybe she wanted to assign a different meaning of these traits.

Thoughts?

> > +///
> > +/// struct Foo {
> > +///     refcount: Cell<usize>,
>=20
> It's fine to use a Cell for now, but eventually we want to replace this
> with either Gary's Refcount [1] or LKMM atomics.
>=20
> [1]: https://lore.kernel.org/rust-for-linux/20250219201602.1898383-1-gary=
@garyguo.net/
>=20
> (just keeping a note here)

Ok, then I will leave it as is. I was wondering if I should make it atomic,
but I didn't because of the recent Rust atomics vs. kernel atomics
discussion, which I understood as there being some unresolved questions.

> > +pub unsafe trait OwnableRefCounted: RefCounted + Ownable + Sized {
> > +    /// Checks if the [`ARef`] is unique and convert it to an [`Owned`=
] it that is that case.
> > +    /// Otherwise it returns again an [`ARef`] to the same underlying =
object.
> > +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<S=
elf>>;
> > +    /// Converts the [`Owned`] into an [`ARef`].
> > +
>=20
> ^ this blanket line seems to be at the wrong place.

Right. Thanks.

Best regards,

Oliver

