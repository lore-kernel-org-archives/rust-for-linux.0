Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A23385B6;
	Wed,  6 May 2026 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051143; cv=none; b=R9IGaa+pTeQHEw8Y1vfqAx99Eg7spzr5QTbn/NN0RiuM7fvGR1NQ+gY+lPFBA1CdZ8eUwN29bs1r+kkPuwgzzsfKxMIj5Omyca8nPqgcH8OCJ5t6Q586jz4ylqO5GdvkdXxFaTfXPeGqhG5H0hqYQtlm1YIgoxMD6pTTEytebkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051143; c=relaxed/simple;
	bh=eW9Ilv/bWmZjvAa/JAoBWQxz+Xo4p0C2Qko8DfQQT4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYSkR2V7bD+03rNpPfeCmyVjYzNTPxBI6kB4pQIDxvuZiMRZqcSyRWi5oi+AYkBlUnrj/Jwn1FGK51Ca1sGiBtO8vR8DE8gitLyuecTWL/KRJjzSuZvYFt3kRUpti8ZEqp21QgeimHXWwoVJh7HSAv4wRiA5hy15QNQvxOYt9JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=vmfKGV6p; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="vmfKGV6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778051136; x=1778310336;
	bh=BR6iDcN+yr2rdS5v5wtWPh3LrctkTofVztX70VmKX+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vmfKGV6pjU3fTSsnfMEbfS7sut0diL9MFP1Wu40FoAL6uBn3Bjsmsm0EFy2cUG0u+
	 3EIV0ENdd2J8xASeA3D/l0w585yMSNuI0x6bPvLiflFe3NpSeizdmeH/0BA4qZgFco
	 nu223Wod7Tf7giEhV12DqDHRojlRq8yJJrpxKdAimcCWB85ijlVUifrdOpHjM9yJCI
	 pM2c5FKGcw2JkrwZr9Zi3/5Eyez/do66FMOXxiEMGSILr3vsCDZIEOrpt/D6FP8+To
	 4aJzejd13orZOKYiv/a/XOzUCDiqoMg3y0dP/iotbCRoXuPGMP3Nb9sDpHIpJvhnmr
	 NhMulfQItHtPg==
X-Pm-Submission-Id: 4g9RH062tlz1DFFm
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
Date: Wed,  6 May 2026 10:05:29 +0300
Message-ID: <20260506070531.46975-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260505132010.6acaf15a@fedora>
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev> <afhQzt2VGa-QQYSm@google.com> <20260505060723.11363-1-work@onurozkan.dev> <afmusSlYdOR2Alvp@google.com> <20260505091616.14877-1-work@onurozkan.dev> <20260505115014.49eef6d6@fedora> <20260505101126.92832-1-work@onurozkan.dev> <20260505132010.6acaf15a@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 May 2026 13:20:10 +0200=0D
Boris Brezillon <boris.brezillon@collabora.com> wrote:=0D
=0D
> On Tue,  5 May 2026 13:10:32 +0300=0D
> Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> =0D
> > On Tue, 05 May 2026 11:50:14 +0200=0D
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:=0D
> > =0D
> > > On Tue,  5 May 2026 12:16:12 +0300=0D
> > > Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> > >   =0D
> > > > On Tue, 05 May 2026 08:47:45 +0000=0D
> > > > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > > >   =0D
> > > > > On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote: =
   =0D
> > > > > > On Mon, 04 May 2026 07:54:54 +0000=0D
> > > > > > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > > > > >     =0D
> > > > > > > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wro=
te:    =0D
> > > > > > > > Adds Work::disable_sync() as a safe wrapper for disable_wor=
k_sync().=0D
> > > > > > > > =0D
> > > > > > > > Drivers can use this during teardown to stop new queueing a=
nd wait for=0D
> > > > > > > > queued or running work to finish before dropping related re=
sources.=0D
> > > > > > > > =0D
> > > > > > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > > > > > > > ---=0D
> > > > > > > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-=
------------=0D
> > > > > > > >  1 file changed, 81 insertions(+), 40 deletions(-)=0D
> > > > > > > > =0D
> > > > > > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workque=
ue.rs=0D
> > > > > > > > index 7e253b6f299c..d0f9b4ba7f27 100644=0D
> > > > > > > > --- a/rust/kernel/workqueue.rs=0D
> > > > > > > > +++ b/rust/kernel/workqueue.rs=0D
> > > > > > > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const =
bindings::workqueue_struct) -> &'a Queue=0D
> > > > > > > >  =0D
> > > > > > > >      /// Enqueues a work item.=0D
> > > > > > > >      ///=0D
> > > > > > > > -    /// This may fail if the work item is already enqueued=
 in a workqueue.=0D
> > > > > > > > +    /// This may fail if the work item is already enqueued=
 in a workqueue or disabled.=0D
> > > > > > > >      ///=0D
> > > > > > > >      /// The work item will be submitted using `WORK_CPU_UN=
BOUND`.=0D
> > > > > > > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::En=
queueOutput    =0D
> > > > > > > =0D
> > > > > > > Can you elaborate on the case where disable leads to failure =
here? Can=0D
> > > > > > > you not enqueue a work item again after disabling it? Is ther=
e a doc=0D
> > > > > > > test illustrating this case that I can run for myself to see =
the=0D
> > > > > > > behavior in action?    =0D
> > > > > > =0D
> > > > > > As we discussed on yesterday's call, I looked into cancel_work_=
sync and=0D
> > > > > > it seems we can make this work in the tyr reset implementation.=
 We already=0D
> > > > > > store an atomic reset state, it can be used to prevent future e=
nqueues in=0D
> > > > > > reset scheduling.=0D
> > > > > > =0D
> > > > > > I will send a patch for the cancel_sync function soon.    =0D
> > > > > =0D
> > > > > I did hear from Boris that Panthor actually does make use of the =
disable=0D
> > > > > feature.     =0D
> > > > =0D
> > > > I don't have any idea what Boris said, perhaps he should write it h=
ere as well.=0D
> > > > Maybe Boris said something that isn't covered on the tyr reset yet =
in my series,=0D
> > > > I don't know.  =0D
> > > =0D
> > > So, I checked where those disable_[delayed_]work[_sync]() are, and th=
ey=0D
> > > seem to cover mostly the unplug path. There's a couple non-unplug=0D
> > > related use, which both cover the per-queue watchdog[3][4].=0D
> > > =0D
> > > As for why we ended up using disable_work instead of cancel_work, it'=
s=0D
> > > all explained in [1] and [2]. Yes, it could have been done differentl=
y,=0D
> > > but disable_work was the most convenient way of solving these UAFs in=
 C.=0D
> > >   =0D
> > > > =0D
> > > > What I do know is that I can achieve essentially the same behavior =
using=0D
> > > > cancel_work_sync instead of disable_work_sync on tyr. Like i said t=
here's an=0D
> > > > atomic reset state we can use to prevent future work from being enq=
ueued.  =0D
> > > =0D
> > > If the atomic is already there to prevent queuing more works, or=0D
> > > checking if a reset is pending, sure. It might just be more custom=0D
> > > checks to add, and if we think we'll need to support work items that =
can=0D
> > > be disabled further down the line anyway, maybe it makes sense to wor=
k=0D
> > > on it now, dunno.  =0D
> > =0D
> > With the disable_work_sync path, there are the 2 things I don't really =
like:=0D
> > =0D
> > 	1. Having multiple sources of control for the reset path: one being th=
e=0D
> > 	   atomic state and the other the workqueue. It feels odd to have both=
 at=0D
> > 	   the same time.=0D
> =0D
> The source of truth would still be the reset_pending atomic. The=0D
> question is more, how do you ensure the work items that are covered by=0D
> this reset_pending state can't be scheduled until this reset_pending is=0D
> restored to false? In panthor we do that with the=0D
=0D
I can obviously add a if guard on the atomic state and only schedule if the=
=0D
state is false.=0D
=0D
> sched_queue_[delayed_]work() helpers, which works okay as long as you=0D
> ensure all sched-related works go through this helper. Using=0D
> disable_work() would provide a more robust solution. In rust it's=0D
> likely that you have other ways to enforce that.=0D
> =0D
> > 	2. The added complexity on workqueue.rs=0D
> > =0D
> > Regarding 1, IMO only one mechanism should own this logic. If we have t=
o choose,=0D
> > we can't drop the atomic state since it's also useful in other parts. I=
t's also=0D
> > more explicit and easier to understand (devs wouldn't need to know the =
workqueue=0D
> > internals to understand the scheduling behavior).=0D
> =0D
> I agree, but it still relies on the fact you have a=0D
> thread-safe/non-blocking way to enforce that no one will ever be able to=
=0D
> reschedule a work item between the moment you call cancel_work_sync()=0D
> on the various work items you want to stop before doing the reset, and=0D
> the moment you're done with the reset. {disable,enable}_work() provides=0D
> a generic+race-free solution for that, which is why we used it in the=0D
> unplug path in panthor.=0D
> =0D
> > =0D
> > Regarding 2, Alice's suggestion at [1] seems quite complicated (even wi=
thout the=0D
> > enable part) compare to how simple cancel_work_sync would be done.=0D
> =0D
> Doesn't seem utterly complicated to me, but I'm probably not the best=0D
> person to comment on rust code. BTW, how is cancel_work_sync()=0D
> different in term of what it means for Box containers? You still can't=0D
> cancel a work item if it's owned by the workqueue, can you? So all this=0D
=0D
I have to check in more detail, I don't know at the moment.=0D
=0D
> really changes is the fact you have to re-enable a disabled work item=0D
> before enqueuing it again if you want it to do anything.=0D
> =0D
> BTW, in panthor, we also heavily rely on queue_work() not doing anything=
=0D
> and returning false if the work item is already scheduled, so accepting=0D
> ::enqueue() failures in Tyr is going to be standard behavior, I think.=0D
> =0D
> > =0D
> > I think I will go with the cancel_work_sync + atomic state approach. At=
 least until=0D
> > we run into a case where it doesn't work (which I cannot guess at the m=
oment) and=0D
> > disable_work_sync becomes necessary.=0D
> =0D
> Sounds good.=0D
