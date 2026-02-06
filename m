Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048732ED57;
	Fri,  6 Feb 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375889; cv=none; b=uEpKNXi5qWwcjj1fnOo44GA8H67jcahbaBJCvahrUkgrYXP1hwFtHw5nkby2UczXc+lKxXOBl0Yxsrr72rlgZ3p93dXi7v0hVXPwF0brfjE0a1KWsJj+EbYRoWDKakHxGgw2wfbdguhxzNY9FKgIO51yO9wMrovGtOQ7LZ9xi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375889; c=relaxed/simple;
	bh=ZETiXeWiycTR/YxVYD43Hpzzhup25/5ZcTZGYPN9ZMI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZiTftHUPLpCTDbjt4WlNyILa3HtVu5p7oR11vRsNjY7Yj4YW+GQf5ZF50MWwCG/EixXRxGtLpCnRsUi4etbeOK10ssWEqn47p9KCfBmZJhQPApEYRsof9TF5b+uHpc+7QPIj+Sl8WPOtM2YNmo8bDHbBPKXhX1WqEjNeD7pI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V1Ghi5YE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V1Ghi5YE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770375887;
	bh=ZETiXeWiycTR/YxVYD43Hpzzhup25/5ZcTZGYPN9ZMI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V1Ghi5YEaFPAl1M7Kmfty/qfnfMeChyLP5AsY82IM+ZOMAy3wPz3oOJ4J0HAKT77w
	 FSaxG0pKAldIVNLWYOFOygY4fK5X2GBk3pkTqRaCy134EQbSij/aqF2UMPGAU18Btx
	 p9lxX5Gr2Ihlrjcbu+F9wZTYrh5233czDhl5M4NiB/zD3xzfCjE/+CM6DVP34XNEpJ
	 49O185wRGdz9u0BpClQNYVbmqXygiG7lTudehFwvHc7bA1lsblOYAcOVdbpPokxJiH
	 U0dLez1Y1HCRwjikUildO208myb0ThbWxh+8WQNvGAD6iij8ZpA7KRyU5Rp2489ViO
	 9lIc5SFYbxHZg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7027417E1352;
	Fri,  6 Feb 2026 12:04:46 +0100 (CET)
Date: Fri, 6 Feb 2026 12:04:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260206120442.51c5ca75@fedora>
In-Reply-To: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
	<20260205111635.5307e1fa@fedora>
	<DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
	<62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
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

On Fri, 06 Feb 2026 10:32:38 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Thu, 2026-02-05 at 13:16 +0000, Gary Guo wrote:
> > On Thu Feb 5, 2026 at 10:16 AM GMT, Boris Brezillon wrote: =20
> > > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > >  =20
> > > >  =20
>=20
> [=E2=80=A6]
>=20
> > > > +#[pin_data]
> > > > +pub struct DmaFence<T> {
> > > > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > > > +=C2=A0=C2=A0=C2=A0 /// User data.
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 data: T, =20
> > >=20
> > > A DmaFence is a cross-device synchronization mechanism that can (and
> > > will)
> > >  =20
>=20
> I'm not questioning the truth behind this statement. They are designed
> to do that. But is that actually being done, currently? I recently
> found that the get_driver_name() callback intended to inform the
> consumer of a fence about who actually issued the fence is only ever
> used by i915.
>=20
> Who actually uses that feature? Who needs fences from another driver?

Display controller (AKA KMS) drivers waiting on fences emitted by a GPU
driver, for instance.

>=20
> Just out of curiousity
>=20
>=20
> > >  cross the driver boundary (one driver can wait on a fence emitted
> > > by a different driver). As such, I don't think embedding a generic T =
in
> > > the DmaFence and considering it's the object being passed around is
> > > going to work, because, how can one driver know the T chosen by the
> > > driver that created the fence? If you want to have some fence emitter
> > > data attached to the DmaFence allocation, you'll need two kind of
> > > objects:
> > >=20
> > > - one that's type agnostic and on which you can do the callback
> > > =C2=A0 registration/unregistration, signalling checks, and generally =
all
> > > =C2=A0 type-agnostic operations. That's basically just a wrapper arou=
nd a
> > > =C2=A0 bindings::dma_fence implementing AlwaysRefCounted.
> > > - one that has the extra data and fctx, with a way to transmute from a
> > > =C2=A0 generic fence to a implementer specific one in case the driver=
 wants
> > > =C2=A0 to do something special when waiting on its own fences (check =
done
> > > =C2=A0 with the fence ops in C, I don't know how that translates in r=
ust) =20
> >=20
> > If `data` is moved to the end of struct and `DmaFence<T>` changed to
> > `DmaFence<T: ?Sized>`, you would also gain the ability to coerce `DmaFe=
nce<T>`
> > to `DmaFence<dyn Trait>`, e.g. `DmaFence<dyn Any>`. =20
>=20
>=20
> I think we should go one step back here and question the general
> design.
>=20
> I only included data: T because it was among the early feedback that
> this is how you do it in Rust.
>=20
> I was never convinced that it's a good idea. Jobqueue doesn't need the
> 'data' field. Can anyone think of anyone who would need it?
>=20
> What kind of data would be in there? It seems a driver would store its
> equivalent of C's
>=20
> struct my_fence {
>    struct dma_fence f;
>    /* other driver data */
> }
>=20
> which is then accessed in C with container_of.
>=20
> But that data is only ever needed by that very driver.
>=20
>=20
> My main point here is:
> dma_fence's are a synchronization primitive very similar to
> completions: informing about that something is done, executing every
> registrants callbacks.
>=20
> They are *not* a data transfer mechanism. It seems very wrong design-
> wise to transfer generic data T from one driver to another. That's not
> a fence's purpose. Another primitive should be used for that.
>=20
> If another driver could touch / consume / see / use the emitter's data:
> T, that would grossly decouple us from the original dma_fence design.
> It would be akin to doing a container_of to consume foreign driver
> data.
>=20
> Like Xe  doing a
>=20
> struct nouveau_fence *f =3D container_of(generic_fence, =E2=80=A6);
>=20
> Why would that ever be done? Seems totally broken.
>=20
> So I strongly think that we'd either want to drop data: T, or we should
> think about possibilities to hide it from other drivers.
>=20
> I've got currently no idea how that could be addressed in Rust, though=20

So, as Danilo explained in his reply, there's two kind of users:

1. those that want to wait on fences (that'd be the JobQueue, for
   instance)
2. those that are emitting fences (AKA those implementing the fence_ops
   in C)

And each of them should be given different access to the underlying
dma_fence, hence the proposal to have different objects to back
those concepts.
