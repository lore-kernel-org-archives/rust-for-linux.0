Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB15226A2;
	Thu, 15 Oct 2026 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067188; cv=none; b=ssJkCrZVUyNazak2JACHIqcEMZlugyl7XeaRTK/no+Ir1Ecsior2pTXGrPhI4FwddE2hhPFuIDqS9t8lYBc/AwOMntw/feL6AOfrozBahj9QO+DBGI1BfrDM8+7IGAtQimnVShTl5tkrjsPjvNkV8RvEwa1fHdASc5A9lxoTJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067188; c=relaxed/simple;
	bh=BeRqHdsJug1kTaMiHgzj4Vg4A/zAcS7WzPCjHAQNBPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XF0BJ6hY/6XBEC5PikDfK0HuhGdrRJr4VAL7WwNv0AeUXIgLJ/19v98mEInKcTnl0JAGYkGPWkt++fp2Oq4c3/83uBBZtbXl0lX8TS7+8DZq1FvByvCk/0n1wTXYojsXOhn6l+G9Rm9FD8RKkZ0p373jsk9ZUZPQQqdhcSn9wTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=o9HyKwZd; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="o9HyKwZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792067183; x=1792326383;
	bh=ADbrcVyQI7dRAWC2Vp2sqng7jbtyuNRFNhgQJBWlDb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o9HyKwZdTyukfrvKJ8Q/GNE1WsiBWGLoLoXFBxWHxc4rAzP+8cfnNyw996ZKe4OFH
	 o4hmYSrwA+wiSqeyombglHB8eRoz2GvJFK0xGFOTjvfALberWph9lLID95xR0lMPbJ
	 SI3Sdw+VMW/bROUDy0OsL7oF+LrXhdaA06TbsSo+pEOYatI+YLja45O3mB054z9S28
	 qlOHga/quPXEePfL8EpzEkgfnzO/DFVDFBHJS/cSmJpFfH6lBkx6BFrFRTVxKd3FC7
	 sTwcXm4GGSiRrGAE43Li9lMhmmiAtzW+zRaxQOyVUjQoTZlYtAKsac3hFJXgpTsikB
	 cn2CofEHPolQQ==
X-Pm-Submission-Id: 4j56kM5Tczz1DDXQ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 5/6] rust: ww_mutex: implement LockSet
Date: Thu, 15 Oct 2026 15:26:17 +0300
Message-ID: <20261015122618.145485-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DM5E3B3DWY1O.1UB1GYG16T66V@garyguo.net>
References: <cover.1791799751.git.work@onurozkan.dev> <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev> <DM2UEMVP195X.WA9QG4BY453P@garyguo.net> <20261015112611.60966-1-work@onurozkan.dev> <DM5E3B3DWY1O.1UB1GYG16T66V@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Oct 2026 12:53:10 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Thu Oct 15, 2026 at 12:26 PM BST, Onur =C3=96zkan wrote:=0D
> > On Mon, 12 Oct 2026 13:02:15 +0100=0D
> > Gary Guo <gary@garyguo.net> wrote:=0D
> >=0D
> >> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:=0D
> >> > LockSet is a high-level and safe API built on top of=0D
> >> > ww_mutex which provides a safe and easy to use API=0D
> >> > while keeping the ww_mutex semantics.=0D
> >> >=0D
> >> > When EDEADLK is hit it drops all held locks and waits for the=0D
> >> > contended mutex. It then retries the given (by the user)=0D
> >> > locking algorithm with that mutex held and the same acquire=0D
> >> > context until it succeeds.=0D
> >> =0D
> >> Do we really need this, or this can be achieved by simple retry loops?=
=0D
> >> =0D
> >>     fn retry_if_deadlock<R>(f: impl FnOnce() -> Result<R>) -> Result<R=
> {=0D
> >>         loop {=0D
> >>             match f() {=0D
> >>                 Err(EDEADLK) =3D> (),=0D
> >>                 e =3D> return e,=0D
> >>             }=0D
> >>         }=0D
> >>     }=0D
> >> =0D
> >>     stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));=0D
> >>     retry_if_deadlock(|| {=0D
> >>         let mut gaurd1 =3D acq_ctx.lock(&mutex1)?;=0D
> >>         let mut guard2 =3D acq_ctx.lock(&mutex2)?;=0D
> >> =0D
> >>         acq_ctx.done();=0D
> >> =0D
> >>         *guard1 +=3D 1;=0D
> >>         *guard2 +=3D 1;=0D
> >>     });=0D
> >> =0D
> >> I think the only difference is that the `LockSet` acquires the contend=
ing mutex=0D
> >> first. However, I imagine we can solve this by having a wrapped `Acqui=
reCtx`=0D
> >> that provides that.=0D
> >=0D
> > That's what LockSet already is. How would you design that wrapped Acqui=
reCtx and=0D
> > what would we gain by replacing LockSet with another wrapper?=0D
> =0D
> The LockSet API have multiple issues that I consider problematic:=0D
> =0D
> * It always allocate, even if you don't need a dynamic set.=0D
> =0D
> * Accessing data searches through the vec. To access all data, you will h=
ave=0D
>   O(n^2) complexity spent just on vec traversal.=0D
>  =0D
> * There's no way of getting multiple mutable borrow of the distinct locks=
.=0D
=0D
I can work on these.=0D
=0D
> =0D
> My example above has none of the issue.=0D
> =0D
> If you do not need the "acquire the contended lock first" behaviour, then=
=0D
> there's no need for wrapper, even. Also, if this behaviour is truly unive=
rsal,=0D
> perhaps it should become part of `AcquireCtx`'s default behaviour instead=
.=0D
=0D
We need that functionality for the DRM use-case, it's not something that sh=
ould=0D
be applied to the ww mutex primitives but I would like to hear @Daniel's op=
inion=0D
on this.=0D
=0D
> =0D
> >=0D
> > You need to remember the contended mutex, release all acquired locks be=
fore=0D
> > waiting for it and retry with that mutex held and the same acquire cont=
ext. =0D
> =0D
> My example above doesn't have these issues. Releasing acquired locks if f=
ree=0D
> with `?`. Retrying is done by the helper function and not handled by user=
.=0D
> Acquire context if really easy to be misued, can be done by the helper fu=
nction=0D
> too:=0D
>  =0D
>     fn ww_transaction<R>(=0D
>         class: &Class, f: impl FnOnce(&AcquireCtx) -> Result<R>=0D
>     ) -> Result<R> {=0D
>         stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));=0D
>         loop {=0D
>             match f(&acq_Ctx) {=0D
>                 Err(EDEADLK) =3D> (),=0D
>                 e =3D> return e,=0D
>             }=0D
>         }=0D
>     }=0D
> =0D
>     ww_transaction(&class, |acq_ctx| {=0D
>         let mut guard1 =3D acq_ctx.lock(&mutex1)?;=0D
>         let mut guard2 =3D acq_ctx.lock(&mutex2)?;=0D
> =0D
>         acq_ctx.done();=0D
> =0D
>         *guard1 +=3D 1;=0D
>         *guard2 +=3D 1;=0D
>     })=0D
> =0D
=0D
This still needs the contended-lock backoff when retrying the full transact=
ion.=0D
Simply restarting the callback can repeatedly hit EDEADLK, so the proposed =
code=0D
is not going to work.=0D
=0D
Cc @Daniel=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> > Also for a dynamic set, you also need to keep the acquired locks held a=
cross loop=0D
> > iterations and helper calls and handle repeated objects. With ordinary =
guards,=0D
> > that bookkeeping falls on the caller unless the wrapper handles it. Loc=
kSet=0D
> > already does all this.=0D
> =0D
> You can make dynamic lock set just a data structure and not do everything=
 at=0D
> once, something like:=0D
> =0D
>     ww_transaction(&class, |acq_ctx| {=0D
>         let dynset =3D DynLockSet::new()?;=0D
> =0D
>         // Check if already inside the set, if not, lock it.=0D
>         dynset.lock(acq_ctx, &mutex1)?;=0D
>         dynset.lock(acq_ctx, &mutex2)?;=0D
> =0D
>         acq_ctx.done();=0D
> =0D
>         dynset.with_locked(&mutex1, |guard1| *guard1 +=3D 1)?;=0D
>         dynset.with_locked(&mutex2, |guard2| *guard2 +=3D 1)?;=0D
>     })=0D
> =0D
> Best,=0D
> Gary=0D
