Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F43126B2;
	Wed, 11 Feb 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812061; cv=none; b=EM9F0c9NL8i+78suVOrKXwMHMozMcb7/6onu7HCAprSdzD5GNINxiMjYXTwtlN70vmRYWN8a1T5CpqOV5GRSlGaCJyDYyO2rMgCcyqrAlTx3yCphMHK4BHyOJ0i5ZV2fcVtzVYvBVH5wpSg21y26PYGRQk5UuSHUle7LaH/ZvdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812061; c=relaxed/simple;
	bh=Jwdt/TFbArBuq4MgHNQZYQ0aWXtoQvwVDUy0WsAoRKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l4Y0TUxu25u68AcPmzH2fdVpmuYneEiWgtI4IfvNWL9q4ItDOmMakQ0GMBwe7L4/EWnnh/alDAov2aFgKycPE+wXkA+g7N+cCW6M+4wRMrcWuD50wr92VfWtr3uTZyGM3X9t+Gy9KCxYegvH4Gyj6gV2UWPQlpiOtdET92ybORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OOw1sfhB; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OOw1sfhB"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4f9y5z6p6Yz9tqJ;
	Wed, 11 Feb 2026 13:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770812056; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jwdt/TFbArBuq4MgHNQZYQ0aWXtoQvwVDUy0WsAoRKk=;
	b=OOw1sfhB6Oz+bFiaGdfyqr7yQP2zWG2cpacLj6fzRzB4aBdmvwgVQMWtLGYNjtK9mM6Xay
	mpmG+enbsn7/Em+qwMtc1gQrzzlfaNzVGkoR5f2MeAkz8k6ki5xOdd5oLPLbdchX2ejmuu
	0LabDtcvW8FE4EfTbgmWPm6xBqMDcyFq6ZL7Q9zRhjHZ+yD5GQrx95RWxKFaJYBFrCjFNg
	5wkFVixzJs9AFmw79W/3sXUDHkfaitks+G2nroG7W0Uqrhbgc2siA2+4R/Sg9PFxLnDpwJ
	Kz100WQ6KTyUzAM8qc9XOoka+kg4aViSZAB+2gP13qcadmxMgpXs+/tr0sI08g==
Message-ID: <ed1740dc08d5062ad500b2024b0e21c45f36d63c.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 13:14:11 +0100
In-Reply-To: <20260211125917.286e0fb6@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
	 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	 <20260211120742.0e9e7122@fedora>
	 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
	 <20260211125917.286e0fb6@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ahi7pjo6gfai1r87jeko6y3ocf86jncs
X-MBO-RS-ID: e48cd8663924ebe7467

On Wed, 2026-02-11 at 12:59 +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 12:19:56 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> > On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > > On Wed, 11 Feb 2026 11:47:27 +0100
> > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > =C2=A0=20
> > > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:=C2=A0=20
> > > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +/// A jobqueue Job.
> > > > > > +///
> > > > > > +/// You can stuff your data in it. The job will be borrowed ba=
ck to your driver
> > > > > > +/// once the time has come to run it.
> > > > > > +///
> > > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ow=
nership transfer).
> > > > > > +/// You can set multiple [`DmaFence`] as dependencies for a jo=
b. It will only
> > > > > > +/// get run once all dependency fences have been signaled.
> > > > > > +///
> > > > > > +/// Jobs cost credits. Jobs will only be run if there are is e=
nough capacity in
> > > > > > +/// the jobqueue for the job's credits. It is legal to specify=
 jobs costing 0
> > > > > > +/// credits, effectively disabling that mechanism.
> > > > > > +#[pin_data]
> > > > > > +pub struct Job<T: 'static + Send> {
> > > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>=
,
> > > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=C2=A0=
=C2=A0=20
> > > > >=20
> > > > > Given how tricky Lists are in rust, I'd recommend going for an XA=
rray,
> > > > > like we have on the C side. There's a bit of overhead when the jo=
b only
> > > > > has a few deps, but I think simplicity beats memory-usage-optimiz=
ations
> > > > > in that case (especially since the overhead exists and is accepte=
d in
> > > > > C).=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > I mean, the list is now already implemented and works. Considering =
the
> > > > XArray would have made sense during the development difficulties.=
=C2=A0=20
> > >=20
> > > I'm sure it does, but that's still more code/tricks to maintain than
> > > what you'd have with the XArray abstraction.=C2=A0=20
> >=20
> > The solution than will rather be to make the linked list implementation
> > better.
> >=20
> > A list is the correct data structure in a huge number of use cases in
> > the kernel. We should not begin here to defer to other structures
> > because of convenience.
> >=20
> > Btw. lists in Rust being so horrible has been repeatedly a reason why
> > some other hackers argued that Rust as a language is not suitable for
> > kernel development.
> >=20
> > So getting that right seems more desirable than capitulating.
>=20
> I'm not capitulating, and I'm not saying "No list, never!" either. I'm
> saying, if there's something that fits the bill and is easier to use,
> maybe we should consider it...
>=20
> >=20
> > > =C2=A0=20
> > > >=20
> > > > If it were to make sense we could certainly replace the list with a=
n
> > > > xarray, but I don't see an advantage. The JQ just needs to iterate =
over
> > > > the dependencies to register its events on them, and on drop to
> > > > deregister them perhaps.
> > > >=20
> > > > We have many jobs, but likely only few dependencies per job, so the
> > > > lower memory footprint seems desirable and the XArray's advantages
> > > > don't come to play =E2=80=93 except maybe if we'd want to consider =
to avoid the
> > > > current unsafe-rawpointer solution to obtain the job, since obtaini=
ng a
> > > > job from an Xarray is far faster than by list iteration.=C2=A0=20
> > >=20
> > > I don't think we need O(1) for picking random deps in a job, because
> > > that's not something we need at all: the dep list here is used as a
> > > FIFO.
> > > =C2=A0=20
> >=20
> > Wrong. The dep list here has no ordering requirements at all. JQ does
> > not care in which order it registers its events, it just cares about
> > dealing with dep-fences racing.
>=20
> What I mean is that it's used as a FIFO right now, not that deps have to
> be processed in order.

Yeah, but it being a FIFO is irrelevant :)

>=20
> >=20
> > You could (de-)register your callbacks in random order, it does not
> > matter.
>=20
> Again, that's not my point, and I think we're just saying the same
> thing here: the list seems to be a good match for this dependency
> array/list, because right now deps are processed in order. Now, being
> the right construct in one language doesn't mean it's the right
> construct in another language.
>=20
> >=20
> > List and Xarray might be useful for the unsafe related to the
> > DependencyWaker. There you could avoid a raw pointer by getting the job
> > through a list iteration or through the hypothetical XArray.
> >=20
> > Please take a look at my detailed code comments for DependencyWaker.
>=20
> Sure, I'll have a closer look.
>=20
> >=20
> > > =C2=A0There's the per-dep overhead of the ListLinks object maybe, but
> > > it's certainly acceptable. And I don't think cache locality matters
> > > either, because the XArray stores pointers too, so we'll still be one
> > > deref away from the DmaFence. No, my main concern was maintainability=
,
> > > because managing lists in rust is far from trivial, and as a develope=
r,
> > > I try to avoid using concepts the language I rely on is not friendly
> > > with.=C2=A0=20
> >=20
> > This would be a decision with wide implications, as detailed above.
> >=20
> > If we were to admit that lists just don't work in Rust, then wouldn't
> > the consequent decision to remove them all together?
>=20
> I'm not going as far as saying they don't work, I'm just saying they
> are trickier to use, and that's a fact.
>=20
> >=20
> > "Lists in kernel-Rust are not supported. Too difficult to maintain.
> > We're sorry. Use XArray et al. instead :("
>=20
> No, there are patterns where an XArray wouldn't be a good fit. For
> instance, LRU lists where objects get moved between lists depending on
> their usage pattern. If we were to use XArrays for that, that would
> imply potential allocations in paths where we don't want them. In this
> dep array case, the deps are added at submit time, and they get
> progressively dropped, so the array can't grow, it can only ever
> shrink, and XArray allows it to shrink from both ends (and even have
> holes), so it sounds like a good match too. Not saying a perfect match,
> not saying better than a list in general, but an XArray is easier to
> use than a list **in rust**, and the fact it fits the bill (if it does
> in C, it should in rust too) had me thinking that maybe it's what we
> should use.

Yoah, you have valid points.

Since XArray allows for dropping the unsafe {} without the performance
penalty of a list-iteration, I think your idea for this particular case
is good after all and can be put on the TODO list.

I'm not sure how soon I have the cycles for implementing that, though.
Looks as if a ton of work is coming at us for dma_fence.



P.
