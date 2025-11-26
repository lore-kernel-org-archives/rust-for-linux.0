Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E11EA7CC;
	Wed, 26 Nov 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168952; cv=none; b=Z0Xxh2mbXI7Vc3GYbyE3s6oZ+IN0lLFJ74vaBA+/oeMJqGf48+9YuNi6S6xOlIuv9nmEHGj9K4TcoFvpyPpECqkWcOJs/ld/RJvxJkawP3xy2KfPnVkX68iU6xfdmqOC6ZXGT40fBPTOwDHouI+5QgHfj/TwTN093MGOWGZywps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168952; c=relaxed/simple;
	bh=99IVQAcNF+4B4oNlozyWqaTGpgQ7xJIzQh7KOwQHl6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSys5q3Tl74zlmZa/2L4/vQsqSNLN2rYIfxbH8Ftg+PIlWcBa0dz2L8ijkjY719VBLnY5btyTX2rxV6M2qLUjUkYY3Xcmw23cO5QUNf2GhuSPxnC6hMX+xMWZDtU1/CWI8nO5MxrHN2tsxxX6wgzpuThmbuFT3Cw6CbZcKesCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o/GMneE4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o/GMneE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764168948;
	bh=99IVQAcNF+4B4oNlozyWqaTGpgQ7xJIzQh7KOwQHl6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o/GMneE4E+m9jJXZ79lpryu+LEedRFiNg1Iz5ToosBGk4RUBz1Uh2v8dTJMPHnRAe
	 th4Se5Jb1FXzcSS1DYixRnxRD4Cty9yu1MJCKXv7oClUh3dF3RUHD07JVkZG1dH6NR
	 hU08jFKHN91pYkTBLeQEcXm9Gy1Gi5YZ3nPlcvAYNGKQVEhEdXwMVEQyo58c53Abwf
	 YilHk+w1yUq4VPieQC8xp8kHPhlAUMGyWwXexlV7tGMlqjaVWocevCOQCqcI95I/gR
	 B88GXOvRtzYgpzZIy/F27ANN3udH4jL5OFbNKWnlorxe8LXx6mwu1cgizkPc2HSznN
	 WD7nJf6kkGE5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C366D17E00B0;
	Wed, 26 Nov 2025 15:55:47 +0100 (CET)
Date: Wed, 26 Nov 2025 15:55:44 +0100
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
Message-ID: <20251126155544.3bf3b784@fedora>
In-Reply-To: <6e0ea7fa210be3b7592197a276d99a9986834f6e.camel@mailbox.org>
References: <20251118132520.266179-2-phasta@kernel.org>
	<20251118132520.266179-4-phasta@kernel.org>
	<E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
	<bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
	<20251125115829.24e6caf7@fedora>
	<682a788c21c6513e30c5eb1020191f31f7aec612.camel@mailbox.org>
	<20251125145040.350e54a9@fedora>
	<6e0ea7fa210be3b7592197a276d99a9986834f6e.camel@mailbox.org>
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

On Wed, 26 Nov 2025 14:42:16 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Tue, 2025-11-25 at 14:50 +0100, Boris Brezillon wrote:
> > On Tue, 25 Nov 2025 13:20:03 +0100
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >  =20
>=20
> [=E2=80=A6]
>=20
> >  =20
> > >=20
> > > Agreed, everything should signal according to the seqno.
> > >=20
> > > The question we are facing with Rust (or rather, my design here) is
> > > rather to what degree the infrastructure shall enforce this. As you
> > > know, in C there isn't even a real "fence context", it's just an
> > > abstract concept, represented by an integer maintained by the driver.
> > >=20
> > > In Rust we can model it more exactly. For instance, we could enforce
> > > ordered signaling by creating a function as the only way to signal
> > > fences:
> > >=20
> > > fctx.signal_all_fences_up_to_seqno(9042);
> > >=20
> > > which then iterates over the fences, signaling all in order. =20
> >=20
> > Up to you, but then it implies keeping a list of currently active
> > fences attached to the context, plus some locks to protect this list.
> > Another option would be to track the last signalled seqno at the
> > context level, and complain if a fence with a lower seqno is signalled.=
 =20
>=20
> Well, JQ (or, maybe: the fence context) needs a list of fences to be
> able to signal them.
>=20
> At second glance, considering a more robust signalling API for DmaFence
> as drafted out above, it might be the cleaner solution to have those
> lists in the fctx and lock the lists there.
>=20
> I'll investigate that.
>=20
> >  =20
> > >=20
> > >=20
> > > With some other APIs, such as jobqueue.submit_job(), which creates a
> > > fence with the code above, it's trivial as long as the driver only
> > > calls submit_job() with 1 thread. =20
> >=20
> > As I was explaining to Daniel yesterday, you need some sort of
> > serialization when you submit to the same context anyway. In Tyr,
> > things will be serialized through the GPUVM resv, which guarantees that
> > no more than one thread can allocate seqnos on a given context inside
> > this critical section.
> >  =20
> > >=20
> > > If the driver came up with the idea of using >=3D2 threads firing on
> > > submit_job(), then you by design have ordering issues, independently
> > > from the fence context using this or that atomic operation or even fu=
ll
> > > locking. =20
> >=20
> > In practice you don't, because submission to a given context are
> > serialized one way or another (see above). Maybe what we should assume
> > is that only one thread gets a mutable ref to this FenceCtx/JobQueue,
> > and seqno allocation is something requiring mutability. The locking is
> > something that's provided by the layer giving a mutable ref to this
> > fence context. =20
>=20
> I think that would then be achieved the Rust-way by having submit_job()
> take a &mut self.
>=20
> Anyways, enforcing that sounds like a great idea to me; that solves the
> seqno issue.
>=20
> >  =20
> > >=20
> > > If the driver scrambles calls to submit_job() or new_fence(), then it
> > > can certainly happen that done_fences are signaled by JQ out of order=
 =E2=80=93
> > > though I'm not sure how horrible that would actually be, considering
> > > that this does not imply that anything gets executed before all
> > > dependencies are fullfiled. AFAICS it's more "nice to have / would be
> > > the cleanest possible design". =20
> >=20
> > A fence context should really be bound to a GPU queue, and jobs on a
> > GPU queue are expected to be executed in order. So long as the jobs are
> > queued in order, they should be executed and signalled in order.
> >  =20
>=20
> Jobs will ALWAYS be run in order, and their corresponding fences be
> signalled in order. Just the seqno might be out-of-order, if there were
> no solution as drafted above by you and me.
>=20
> But no argument here, we should enforce that as much as possible.
>=20
> >  Of
> > course, this implies some locking when you prepare/queue jobs because
> > preparation and queuing are two distinct steps, and if you let 2
> > threads do that concurrently, the queuing won't be ordered.=C2=A0
> > That's
> > already stuff drivers have to deal with today, so I'm not sure we
> > should make a difference for rust drivers, other than making this
> > explicit by requiring mutable JobQueue/FenceCtx references in
> > situations where we expect some higher-level locking to be in place. =20
>=20
> Yes, the problem already exists. I brought to point up to answer the
> question: to what degree do we want to enforce absolute correctness.
>=20
> >  =20
> > >=20
> > > I think I have a TODO in jobqueue where we could solve that by only
> > > signaling pending done_fence's once all preceding fences have been
> > > signaled. =20
> >=20
> > I believe this is something we want to enforce, not fix. If signalling
> > is done out of order, that's probably a driver bug, and it should be
> > reported as such IMHO. =20
>=20
> We can only enforcing that by designing DmaFence the way I said above:
>=20
> the only way to signal a fence is via the fctx:
>=20
> fctx.signal_all_up_to_seqno(9001);

If the in-flight jobs/fences are managed by the JobQueue/FenceCtx, it
might make sense to have something like that, indeed. I was more
thinking of the case where drivers manage the list, and FenceCtx only
signals one specific seqno. What we need to enforce if we do that, is
that pending fences are ordered by ascending seqnos (which can be done
at queue time).

>=20
>=20
> If we're sure that there's really never a use case where someone
> definitely needs a raw dma_fence_signal() equivalent where you can just
> randomly signal whatever you want, I think that's the right thing to
> do.

Agreed (that's basically what we need for Tyr, so we'd be more than
happy if FenceCtx automates that for us).
