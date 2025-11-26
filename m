Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263F6280024;
	Wed, 26 Nov 2025 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164548; cv=none; b=tW+ORMkY5ZSVyg3ZiBAiEaKCvrUi5Zei3ovpDiU9uxdk9cX/dbuavKGvRGDQVrWajoFlp1i/8zDvGHuDh+vqu8i2Gux9qcejXlLk1NGGTElG/V7Y/rE8wSs7Y1ztDvOVvx2HxaY1gULyb1IXlkbEI9HIJC/1HTohNOFGe+oDYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164548; c=relaxed/simple;
	bh=ayAyZsCKjRGr8Vcdy/ajOi65L1xH5coK6b3uXxxBBOw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LuydI3GD8TlSBj9SReoS7URejTUYA6SVqcEs4Cet45c7Hu5EYs4wk7RULoeDvvHCAgpeQXJ2zBfTgvt4qizMQ5Oq0XIKM/Ati0PWDcCXsgjN7+Fj9bizy+28T6MaNvHuyE1lyh7fM9JU7zSP81+QoCuTPtLE/LMwJ9b3v/Ave44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b5gG/lb1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b5gG/lb1"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dGgjB2V5dz9tkP;
	Wed, 26 Nov 2025 14:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764164542; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8tBCksQX/lN6TfzB7MLqlekbx8z3to8qCTCZhVftfI=;
	b=b5gG/lb178SBx2KQ2YaJ9ILrT3Xqedks5KYohXY/5mk6PbeCgVWphyv4UprzvcCAS3KoMM
	6YWmdwe2K2mUHEjHt8UV/WZBx7TrrtdTa/zYytkuxRUO1ck3QBo1/o+8ATjpHq7nlnZws2
	Idq2KfN6SiW/kKFAGWeZsQMBEjJ8qCcsmeCwInpSKh7nIWrcbrikPu2uu/HStA6jBndfhb
	B+7TqQKvRA3zdfg8lcPHGrzbq7xHe5BSq+AHF1fD+Pmmb6dvdRB5N59zoNXp0fChINpsYA
	0i4ITQ1R1pbGNrfgEqRc9yJC7IpuPRbblMQZUJvGQ90KVci+F3KDwWxQdfVdBg==
Message-ID: <6e0ea7fa210be3b7592197a276d99a9986834f6e.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alexandre Courbot <acourbot@nvidia.com>, Dave
 Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter Colberg
 <pcolberg@redhat.com>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Date: Wed, 26 Nov 2025 14:42:16 +0100
In-Reply-To: <20251125145040.350e54a9@fedora>
References: <20251118132520.266179-2-phasta@kernel.org>
	 <20251118132520.266179-4-phasta@kernel.org>
	 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
	 <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
	 <20251125115829.24e6caf7@fedora>
	 <682a788c21c6513e30c5eb1020191f31f7aec612.camel@mailbox.org>
	 <20251125145040.350e54a9@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 6eb2e13faf69235993f
X-MBO-RS-META: 5weiccjg5byr19kozjy5gre33n8d161g

On Tue, 2025-11-25 at 14:50 +0100, Boris Brezillon wrote:
> On Tue, 25 Nov 2025 13:20:03 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20

[=E2=80=A6]

>=20
> >=20
> > Agreed, everything should signal according to the seqno.
> >=20
> > The question we are facing with Rust (or rather, my design here) is
> > rather to what degree the infrastructure shall enforce this. As you
> > know, in C there isn't even a real "fence context", it's just an
> > abstract concept, represented by an integer maintained by the driver.
> >=20
> > In Rust we can model it more exactly. For instance, we could enforce
> > ordered signaling by creating a function as the only way to signal
> > fences:
> >=20
> > fctx.signal_all_fences_up_to_seqno(9042);
> >=20
> > which then iterates over the fences, signaling all in order.
>=20
> Up to you, but then it implies keeping a list of currently active
> fences attached to the context, plus some locks to protect this list.
> Another option would be to track the last signalled seqno at the
> context level, and complain if a fence with a lower seqno is signalled.

Well, JQ (or, maybe: the fence context) needs a list of fences to be
able to signal them.

At second glance, considering a more robust signalling API for DmaFence
as drafted out above, it might be the cleaner solution to have those
lists in the fctx and lock the lists there.

I'll investigate that.

>=20
> >=20
> >=20
> > With some other APIs, such as jobqueue.submit_job(), which creates a
> > fence with the code above, it's trivial as long as the driver only
> > calls submit_job() with 1 thread.
>=20
> As I was explaining to Daniel yesterday, you need some sort of
> serialization when you submit to the same context anyway. In Tyr,
> things will be serialized through the GPUVM resv, which guarantees that
> no more than one thread can allocate seqnos on a given context inside
> this critical section.
>=20
> >=20
> > If the driver came up with the idea of using >=3D2 threads firing on
> > submit_job(), then you by design have ordering issues, independently
> > from the fence context using this or that atomic operation or even full
> > locking.
>=20
> In practice you don't, because submission to a given context are
> serialized one way or another (see above). Maybe what we should assume
> is that only one thread gets a mutable ref to this FenceCtx/JobQueue,
> and seqno allocation is something requiring mutability. The locking is
> something that's provided by the layer giving a mutable ref to this
> fence context.

I think that would then be achieved the Rust-way by having submit_job()
take a &mut self.

Anyways, enforcing that sounds like a great idea to me; that solves the
seqno issue.

>=20
> >=20
> > If the driver scrambles calls to submit_job() or new_fence(), then it
> > can certainly happen that done_fences are signaled by JQ out of order =
=E2=80=93
> > though I'm not sure how horrible that would actually be, considering
> > that this does not imply that anything gets executed before all
> > dependencies are fullfiled. AFAICS it's more "nice to have / would be
> > the cleanest possible design".
>=20
> A fence context should really be bound to a GPU queue, and jobs on a
> GPU queue are expected to be executed in order. So long as the jobs are
> queued in order, they should be executed and signalled in order.
>=20

Jobs will ALWAYS be run in order, and their corresponding fences be
signalled in order. Just the seqno might be out-of-order, if there were
no solution as drafted above by you and me.

But no argument here, we should enforce that as much as possible.

>  Of
> course, this implies some locking when you prepare/queue jobs because
> preparation and queuing are two distinct steps, and if you let 2
> threads do that concurrently, the queuing won't be ordered.=C2=A0
> That's
> already stuff drivers have to deal with today, so I'm not sure we
> should make a difference for rust drivers, other than making this
> explicit by requiring mutable JobQueue/FenceCtx references in
> situations where we expect some higher-level locking to be in place.

Yes, the problem already exists. I brought to point up to answer the
question: to what degree do we want to enforce absolute correctness.

>=20
> >=20
> > I think I have a TODO in jobqueue where we could solve that by only
> > signaling pending done_fence's once all preceding fences have been
> > signaled.
>=20
> I believe this is something we want to enforce, not fix. If signalling
> is done out of order, that's probably a driver bug, and it should be
> reported as such IMHO.

We can only enforcing that by designing DmaFence the way I said above:

the only way to signal a fence is via the fctx:

fctx.signal_all_up_to_seqno(9001);


If we're sure that there's really never a use case where someone
definitely needs a raw dma_fence_signal() equivalent where you can just
randomly signal whatever you want, I think that's the right thing to
do.


P.
