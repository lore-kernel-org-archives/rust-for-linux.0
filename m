Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F4382384;
	Tue,  5 May 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980020; cv=none; b=G7rclDDUYx7f54dF7RmDVa81jXyKE3wNolUxB6jKx8AKEFHsNBUxvwr40HrG3SXCh0xYc8E4l0EZ2srdeiC0NYfo61oh75BipVuZTVc/D413zClS7KS3PMTqlIp/JHMM1/neq8A42TYXJGOgMKMeX/dZi/14iAQhd7Jbl6sggQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980020; c=relaxed/simple;
	bh=UQ6M92C1J6tXTBRrF3gdhR/3dXXqgBE0qkqo9PQ6cqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGjQfpc+emIhp8SLq0w5rQJn4OouryJz/Jb169HNDRUaiFb3lfBSGdx51zcs2sQnbPUXycW/m9c5hhpETjzzYD7j2uDU/LA4Z/bylSAawWbe7NiygIwh9zm7yDWNLIxc8Dc6yfqeigrsCeRP2sky8ZebasHfTDiCl9wLAi+hVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hvOSTq9k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hvOSTq9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777980016;
	bh=UQ6M92C1J6tXTBRrF3gdhR/3dXXqgBE0qkqo9PQ6cqM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hvOSTq9k4XRBV2qq5jW2GDlj+FP4mZNIhITlLdg2/V6UDV1HQIOq0g2sE53iMQOOT
	 XL5nSLJgVTmvEefewhUTMy6e3rSb4uPt7cDU3bi83yLxTG6TFmpJdsaKbm+umiIUVZ
	 o3yQiMCEx7WFraU3YaMCWr6aEtxP6vSEOsGSh5HP/I1kGTGPfJwhaizyCnZOcGSY1n
	 e0zpGrUKGwef4PjcvZSVe/+KtxKf1+U5NoCpmJZDDRkjWHtOLxtc01MMnmRFofsTEv
	 cuw9rG9AtzURSHF6ezUPvpYrWfiS//Wddh8fSKS+6cyqRTaKPCge6qbi99FuYLU0k7
	 ftKsn3Ys4Jmqw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5482A17E124B;
	Tue,  5 May 2026 13:20:16 +0200 (CEST)
Date: Tue, 5 May 2026 13:20:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
 tamird@kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
Message-ID: <20260505132010.6acaf15a@fedora>
In-Reply-To: <20260505101126.92832-1-work@onurozkan.dev>
References: <20260501191122.64311-1-work@onurozkan.dev>
	<20260501191122.64311-2-work@onurozkan.dev>
	<afhQzt2VGa-QQYSm@google.com>
	<20260505060723.11363-1-work@onurozkan.dev>
	<afmusSlYdOR2Alvp@google.com>
	<20260505091616.14877-1-work@onurozkan.dev>
	<20260505115014.49eef6d6@fedora>
	<20260505101126.92832-1-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue,  5 May 2026 13:10:32 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> On Tue, 05 May 2026 11:50:14 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>=20
> > On Tue,  5 May 2026 12:16:12 +0300
> > Onur =C3=96zkan <work@onurozkan.dev> wrote:
> >  =20
> > > On Tue, 05 May 2026 08:47:45 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >  =20
> > > > On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote:   =
=20
> > > > > On Mon, 04 May 2026 07:54:54 +0000
> > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > >    =20
> > > > > > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote=
:   =20
> > > > > > > Adds Work::disable_sync() as a safe wrapper for disable_work_=
sync().
> > > > > > >=20
> > > > > > > Drivers can use this during teardown to stop new queueing and=
 wait for
> > > > > > > queued or running work to finish before dropping related reso=
urces.
> > > > > > >=20
> > > > > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > > > > > ---
> > > > > > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++---=
----------
> > > > > > >  1 file changed, 81 insertions(+), 40 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue=
.rs
> > > > > > > index 7e253b6f299c..d0f9b4ba7f27 100644
> > > > > > > --- a/rust/kernel/workqueue.rs
> > > > > > > +++ b/rust/kernel/workqueue.rs
> > > > > > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bi=
ndings::workqueue_struct) -> &'a Queue
> > > > > > > =20
> > > > > > >      /// Enqueues a work item.
> > > > > > >      ///
> > > > > > > -    /// This may fail if the work item is already enqueued i=
n a workqueue.
> > > > > > > +    /// This may fail if the work item is already enqueued i=
n a workqueue or disabled.
> > > > > > >      ///
> > > > > > >      /// The work item will be submitted using `WORK_CPU_UNBO=
UND`.
> > > > > > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::Enqu=
eueOutput   =20
> > > > > >=20
> > > > > > Can you elaborate on the case where disable leads to failure he=
re? Can
> > > > > > you not enqueue a work item again after disabling it? Is there =
a doc
> > > > > > test illustrating this case that I can run for myself to see the
> > > > > > behavior in action?   =20
> > > > >=20
> > > > > As we discussed on yesterday's call, I looked into cancel_work_sy=
nc and
> > > > > it seems we can make this work in the tyr reset implementation. W=
e already
> > > > > store an atomic reset state, it can be used to prevent future enq=
ueues in
> > > > > reset scheduling.
> > > > >=20
> > > > > I will send a patch for the cancel_sync function soon.   =20
> > > >=20
> > > > I did hear from Boris that Panthor actually does make use of the di=
sable
> > > > feature.    =20
> > >=20
> > > I don't have any idea what Boris said, perhaps he should write it her=
e as well.
> > > Maybe Boris said something that isn't covered on the tyr reset yet in=
 my series,
> > > I don't know. =20
> >=20
> > So, I checked where those disable_[delayed_]work[_sync]() are, and they
> > seem to cover mostly the unplug path. There's a couple non-unplug
> > related use, which both cover the per-queue watchdog[3][4].
> >=20
> > As for why we ended up using disable_work instead of cancel_work, it's
> > all explained in [1] and [2]. Yes, it could have been done differently,
> > but disable_work was the most convenient way of solving these UAFs in C.
> >  =20
> > >=20
> > > What I do know is that I can achieve essentially the same behavior us=
ing
> > > cancel_work_sync instead of disable_work_sync on tyr. Like i said the=
re's an
> > > atomic reset state we can use to prevent future work from being enque=
ued. =20
> >=20
> > If the atomic is already there to prevent queuing more works, or
> > checking if a reset is pending, sure. It might just be more custom
> > checks to add, and if we think we'll need to support work items that can
> > be disabled further down the line anyway, maybe it makes sense to work
> > on it now, dunno. =20
>=20
> With the disable_work_sync path, there are the 2 things I don't really li=
ke:
>=20
> 	1. Having multiple sources of control for the reset path: one being the
> 	   atomic state and the other the workqueue. It feels odd to have both at
> 	   the same time.

The source of truth would still be the reset_pending atomic. The
question is more, how do you ensure the work items that are covered by
this reset_pending state can't be scheduled until this reset_pending is
restored to false? In panthor we do that with the
sched_queue_[delayed_]work() helpers, which works okay as long as you
ensure all sched-related works go through this helper. Using
disable_work() would provide a more robust solution. In rust it's
likely that you have other ways to enforce that.

> 	2. The added complexity on workqueue.rs
>=20
> Regarding 1, IMO only one mechanism should own this logic. If we have to =
choose,
> we can't drop the atomic state since it's also useful in other parts. It'=
s also
> more explicit and easier to understand (devs wouldn't need to know the wo=
rkqueue
> internals to understand the scheduling behavior).

I agree, but it still relies on the fact you have a
thread-safe/non-blocking way to enforce that no one will ever be able to
reschedule a work item between the moment you call cancel_work_sync()
on the various work items you want to stop before doing the reset, and
the moment you're done with the reset. {disable,enable}_work() provides
a generic+race-free solution for that, which is why we used it in the
unplug path in panthor.

>=20
> Regarding 2, Alice's suggestion at [1] seems quite complicated (even with=
out the
> enable part) compare to how simple cancel_work_sync would be done.

Doesn't seem utterly complicated to me, but I'm probably not the best
person to comment on rust code. BTW, how is cancel_work_sync()
different in term of what it means for Box containers? You still can't
cancel a work item if it's owned by the workqueue, can you? So all this
really changes is the fact you have to re-enable a disabled work item
before enqueuing it again if you want it to do anything.

BTW, in panthor, we also heavily rely on queue_work() not doing anything
and returning false if the work item is already scheduled, so accepting
::enqueue() failures in Tyr is going to be standard behavior, I think.

>=20
> I think I will go with the cancel_work_sync + atomic state approach. At l=
east until
> we run into a case where it doesn't work (which I cannot guess at the mom=
ent) and
> disable_work_sync becomes necessary.

Sounds good.
