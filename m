Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A72330F7F3;
	Tue, 25 Nov 2025 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068318; cv=none; b=f82doZat+rP/NR6/1QRzxUs8rZwRrqnCV52CSJRbZ5F+j4YJmX3nouV72uU213PsP8hKX2LVtzh1slNtuIKHRbr5K7L3hHf15bH14Y8R94qAzRUlvuC7ldY/30E9LXTMH0VGshHwGH8t/jSFxK724L5vJgy3ontjpxKnKlYj/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068318; c=relaxed/simple;
	bh=8X/qwjuwikxSf/pIi2QQ28vbvxJoO9Gtn/+n3x/9S9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zb3jtWXrzq/4CMK1nNR9KsYQg8+XvvpzmPEh3oPqC1s1Num09jzHYVjlssSKKhU/z0FwnXddHj6kdBwfEkpx0zRsnSqY57KGm8BcQUHkqX+0uAgj2tc40yf2FtlG12t0DyEWr3vYLb8nAaOuePA+Ybl2HfiOnAdLw24lBR8TZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I0oFNr9c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I0oFNr9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764068314;
	bh=8X/qwjuwikxSf/pIi2QQ28vbvxJoO9Gtn/+n3x/9S9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I0oFNr9cBrN0DjOqWXN3qSW9snKBefQxZ2mweWg0aoXfeE+yTpem633EkeaAr9by3
	 +91+rwOQLrnzn1SM8PhKg2+tfvkQK3nGUhhO5GdcYJmUhfGTPHNd1E4d8zxplM9ief
	 E7Lg6rO2xEibAFuNN9m0wmO5HKRgcxN7hxHZKKYhHdquwmxwusxhyN8OndzRemLf7W
	 iyyrYnAJK8RroKoUP3SePmVRLkqqCRmLZzOWgSHJLAoNgvbFmxUzAiOC2WuWkelTtg
	 f3jhDv1+eys5WrM6d0lcE/wbwHrlqqvJl3VcTXVqU4DkmAXB+SFRPvk0ZUPwmqp5tK
	 rLsOiXaGCt8EQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B42AF17E0610;
	Tue, 25 Nov 2025 11:58:33 +0100 (CET)
Date: Tue, 25 Nov 2025 11:58:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alexandre Courbot <acourbot@nvidia.com>, Dave
 Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter Colberg
 <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
Message-ID: <20251125115829.24e6caf7@fedora>
In-Reply-To: <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
References: <20251118132520.266179-2-phasta@kernel.org>
	<20251118132520.266179-4-phasta@kernel.org>
	<E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
	<bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2025 10:48:12 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> > > +impl ArcBorrow<'_, DmaFenceCtx> {
> > > +=C2=A0=C2=A0=C2=A0 /// Create a new fence, consuming `data`.
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// The fence will increment the refcount of the =
fence context associated with this
> > > +=C2=A0=C2=A0=C2=A0 /// [`DmaFenceCtx`].
> > > +=C2=A0=C2=A0=C2=A0 pub fn new_fence<T>(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T>,
> > > +=C2=A0=C2=A0=C2=A0 ) -> Result<ARef<DmaFence<T>>> {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fctx: Arc<DmaFenceCtx=
> =3D (*self).into();
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let seqno: u64 =3D fctx.g=
et_new_fence_seqno();
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Should we reset =
seqno in case of failure? =20
> >=20
> > I think we should go back to the old value, yeah. =20
>=20
> It would be trivial to implement that (just atomic.decrement()).
>=20
> The thing why the TODO even exists is that I'm a bit unsure about
> races. It seems we have to choose between either a gap in the seqnos or
> the possiblity of seqnos being out of order.
>=20
> If the user / driver creates fences with >1 thread on a fence context,
> I mean.
>=20
> We're pretty free in our choices, however. The shared fence-fctx
> spinlock will be removed anyways, so one could later easily replace the
> fctx atomic with a lock if that's desirable.
>=20
> I can implement a seqno-decrement for now.

I don't think we need to return unused seqnos in case of failure. I
mean, we could have something like the following pseudo-code:

	atomic_cmpxchg(ctx.seqno, fence.seqno + 1, fence.seqno)

but it wouldn't cover the case where fences are not returned in the
order they were assigned, and seqnos are pretty cheap anyway (if a u64
is enough to count things in nanoseconds for hundreds of years, they are
more than enough for a fence timeline on which fences are emitted at a
way lower rate, even in case of recurring failures). The guarantee we
really care about is seqnos not going backward, because that would mess
up with the assumption that fences on a given timeline/ctx are signalled
in order (this assumption is used to coalesce fences in a
fence_array/resv IIRC).
