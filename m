Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3E30ACE3;
	Fri,  6 Feb 2026 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370374; cv=none; b=PBUx07HLaAwDtsRYEQHUqdZ3IXEMVTHVQvjzPuJA30VfOgZm2kCBhd7o/wp4VXJa/mdyKnqpZuBrbFvPifJWYlpBS1rfs3dgEkQdC16fvQEYnMfjrnHbTSJozcZUDYe9LCGASOMhm+InSi59Q1l2vf9Aw5Bph1mLYPYOisZdu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370374; c=relaxed/simple;
	bh=wpJ1OPH3epcw90aUkWDmPY4+J7x8sdtPfxDe3Y9vRHw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iiVKRtYAiIPCLjQysZQzFziluolqHf+WhK+OW/xYCLJutsuJEgCF8OtKXJdMcTgn9O+WsXp5pn23r0f8HRmEhfDpshdi0ZDPmZKUst0CBFbGGLHuUr27ayv3dP2VJAJVfNyXfM9Vi2fjZkP5UoBzup+iW6EAZpzEKD46UaxDgos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=abxZ6bvf; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="abxZ6bvf"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f6plw4p46z9tpC;
	Fri,  6 Feb 2026 10:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770370364; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAFhVmmwigZehhMFWD9AUSYXd2DpExwQIgAcNMsKsgg=;
	b=abxZ6bvfId+OVQ5olSdmRpHoLL1RjKjqx62ZrOucEaHd5CrmsMJD/eyn0ySoUEZgIkA5gn
	A+OTtKlrHdiUY8jZ2gz0ujOlx6WcKkv3xFC1WfezAcGYcaakAVqx0T9/8Cbehjo8NwzMBx
	Sw+RWwpt/YCU2XPAHrs2JFtT5RHgQgmz2DEmAuZuUAcwJbEtnAR7cJQjFyJJ32yBZGHcDW
	N2Im4X1oT/gyZmoT27islZoMMTORHeu4XceKlt+1Ejbxdk6Ar0WGbDQz39OEPhTzmNsn1L
	xoWRntJ8tG25DIuPauxobDaXfsdwZ5tSBcN2jpI/4HviBftcyAt9dqy6SIYIWw==
Message-ID: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Gary Guo <gary@garyguo.net>, Boris Brezillon
 <boris.brezillon@collabora.com>,  Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Fri, 06 Feb 2026 10:32:38 +0100
In-Reply-To: <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
	 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: uwrhoghfu5fgzspwmd3gedu94i9msomy
X-MBO-RS-ID: d1c55b22c0f954b8976

On Thu, 2026-02-05 at 13:16 +0000, Gary Guo wrote:
> On Thu Feb 5, 2026 at 10:16 AM GMT, Boris Brezillon wrote:
> > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> >=20
> > >=20

[=E2=80=A6]

> > > +#[pin_data]
> > > +pub struct DmaFence<T> {
> > > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > > +=C2=A0=C2=A0=C2=A0 /// User data.
> > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > +=C2=A0=C2=A0=C2=A0 data: T,
> >=20
> > A DmaFence is a cross-device synchronization mechanism that can (and
> > will)
> >=20

I'm not questioning the truth behind this statement. They are designed
to do that. But is that actually being done, currently? I recently
found that the get_driver_name() callback intended to inform the
consumer of a fence about who actually issued the fence is only ever
used by i915.

Who actually uses that feature? Who needs fences from another driver?

Just out of curiousity


> >  cross the driver boundary (one driver can wait on a fence emitted
> > by a different driver). As such, I don't think embedding a generic T in
> > the DmaFence and considering it's the object being passed around is
> > going to work, because, how can one driver know the T chosen by the
> > driver that created the fence? If you want to have some fence emitter
> > data attached to the DmaFence allocation, you'll need two kind of
> > objects:
> >=20
> > - one that's type agnostic and on which you can do the callback
> > =C2=A0 registration/unregistration, signalling checks, and generally al=
l
> > =C2=A0 type-agnostic operations. That's basically just a wrapper around=
 a
> > =C2=A0 bindings::dma_fence implementing AlwaysRefCounted.
> > - one that has the extra data and fctx, with a way to transmute from a
> > =C2=A0 generic fence to a implementer specific one in case the driver w=
ants
> > =C2=A0 to do something special when waiting on its own fences (check do=
ne
> > =C2=A0 with the fence ops in C, I don't know how that translates in rus=
t)
>=20
> If `data` is moved to the end of struct and `DmaFence<T>` changed to
> `DmaFence<T: ?Sized>`, you would also gain the ability to coerce `DmaFenc=
e<T>`
> to `DmaFence<dyn Trait>`, e.g. `DmaFence<dyn Any>`.


I think we should go one step back here and question the general
design.

I only included data: T because it was among the early feedback that
this is how you do it in Rust.

I was never convinced that it's a good idea. Jobqueue doesn't need the
'data' field. Can anyone think of anyone who would need it?

What kind of data would be in there? It seems a driver would store its
equivalent of C's

struct my_fence {
   struct dma_fence f;
   /* other driver data */
}

which is then accessed in C with container_of.

But that data is only ever needed by that very driver.


My main point here is:
dma_fence's are a synchronization primitive very similar to
completions: informing about that something is done, executing every
registrants callbacks.

They are *not* a data transfer mechanism. It seems very wrong design-
wise to transfer generic data T from one driver to another. That's not
a fence's purpose. Another primitive should be used for that.

If another driver could touch / consume / see / use the emitter's data:
T, that would grossly decouple us from the original dma_fence design.
It would be akin to doing a container_of to consume foreign driver
data.

Like Xe  doing a

struct nouveau_fence *f =3D container_of(generic_fence, =E2=80=A6);

Why would that ever be done? Seems totally broken.

So I strongly think that we'd either want to drop data: T, or we should
think about possibilities to hide it from other drivers.

I've got currently no idea how that could be addressed in Rust, though=20

:)
:(


P.

>=20
> Best,
> Gary
>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 /// Marks whether the fence is currently in the s=
ignalling critical section.
> > > +=C2=A0=C2=A0=C2=A0 signalling: bool,
> > > +=C2=A0=C2=A0=C2=A0 /// A boolean needed for the C backend's lockdep =
guard.
> > > +=C2=A0=C2=A0=C2=A0 signalling_cookie: bool,
> > > +=C2=A0=C2=A0=C2=A0 /// A reference to the associated [`DmaFenceCtx`]=
 so that it cannot be dropped while there are
> > > +=C2=A0=C2=A0=C2=A0 /// still fences around.
> > > +=C2=A0=C2=A0=C2=A0 fctx: Arc<DmaFenceCtx>,
> > > +}
>=20

