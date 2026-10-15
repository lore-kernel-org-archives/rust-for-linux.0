Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346E4DA9CC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063590; cv=none; b=NR4/Of/THG5Q+kti7sKWtDQ1i/cHlDQONnnoJ470N03sCnC7I7yoTA/Ok1BVdHWh9lPmWkKuwVUJm8CRl105cqts/Q3m0zU7YW5BxiuKm/xVITc3UmAczVfKFu434WuUK6ydL3+KELguu2uv4QK9V0o4VQmD4Y9KV9E1CbJBpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063590; c=relaxed/simple;
	bh=lI/tePJrBFVT9SL+m5HYE7IsTsP2AEvX1IIa4r6QHjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+U5VwDwvHDgZ0LyS1TdDYba1B5pOr0PExTHHmc/p0M5b/shHUuJKqK1+aT9JlOvrOAEmPw5xnNrI9f+b1zTBBLj+TvDP1WLXwDdxUKLrHO8YU9X2V/g24eunQAx9cl3KOFH5TbfQeHCES6s7bwgOZgzJEywlTqzw/YUSobJt+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=JREqItV/; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="JREqItV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792063583; x=1792322783;
	bh=MLWjRkWsuEhV4xjZ82qNWkdlxPiGotLBkrXjhxnMXfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JREqItV/BQQQ5m3osb8QWZl6xaocCp+fYVuDMT5F4J6pdazOQAVB8Sbg2fn5bRlOh
	 5qPt7/y9x729V1hxQ8jBDZGYM3OQqb73Zm3Sa27CYBofzScRwWaFUsPxuXvF9NuQC9
	 qwh6c8n0XTzVE47zgmcIhS8Gzqom3SNu8ySdqQd0kD9nteVWuFdDgiUuklL2JZ6S6N
	 0NBd2/cvFHOZv3xFiGeKswiorAotP3LBcSBz0CDZvpvnSURAbBHlc5VoNPtFnCDmWs
	 9VAATgac7UAzaqWfRyeoYDrQCVXxZB0qOJWxKdWx/9GoBR6E1tpT+QEeOVpzSSQXBA
	 EeY+5XyQALGCA==
X-Pm-Submission-Id: 4j55P632nVz1DDL8
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
Date: Thu, 15 Oct 2026 14:26:06 +0300
Message-ID: <20261015112611.60966-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DM2UEMVP195X.WA9QG4BY453P@garyguo.net>
References: <cover.1791799751.git.work@onurozkan.dev> <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev> <DM2UEMVP195X.WA9QG4BY453P@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 13:02:15 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:=0D
> > LockSet is a high-level and safe API built on top of=0D
> > ww_mutex which provides a safe and easy to use API=0D
> > while keeping the ww_mutex semantics.=0D
> >=0D
> > When EDEADLK is hit it drops all held locks and waits for the=0D
> > contended mutex. It then retries the given (by the user)=0D
> > locking algorithm with that mutex held and the same acquire=0D
> > context until it succeeds.=0D
> =0D
> Do we really need this, or this can be achieved by simple retry loops?=0D
> =0D
>     fn retry_if_deadlock<R>(f: impl FnOnce() -> Result<R>) -> Result<R> {=
=0D
>         loop {=0D
>             match f() {=0D
>                 Err(EDEADLK) =3D> (),=0D
>                 e =3D> return e,=0D
>             }=0D
>         }=0D
>     }=0D
> =0D
>     stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));=0D
>     retry_if_deadlock(|| {=0D
>         let mut gaurd1 =3D acq_ctx.lock(&mutex1)?;=0D
>         let mut guard2 =3D acq_ctx.lock(&mutex2)?;=0D
> =0D
>         acq_ctx.done();=0D
> =0D
>         *guard1 +=3D 1;=0D
>         *guard2 +=3D 1;=0D
>     });=0D
> =0D
> I think the only difference is that the `LockSet` acquires the contending=
 mutex=0D
> first. However, I imagine we can solve this by having a wrapped `AcquireC=
tx`=0D
> that provides that.=0D
=0D
That's what LockSet already is. How would you design that wrapped AcquireCt=
x and=0D
what would we gain by replacing LockSet with another wrapper?=0D
=0D
You need to remember the contended mutex, release all acquired locks before=
=0D
waiting for it and retry with that mutex held and the same acquire context.=
 Also=0D
for a dynamic set, you also need to keep the acquired locks held across loo=
p=0D
iterations and helper calls and handle repeated objects. With ordinary guar=
ds,=0D
that bookkeeping falls on the caller unless the wrapper handles it. LockSet=
=0D
already does all this.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Best,=0D
> Gary=0D
> =0D
> >=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/sync/lock/ww_mutex.rs          |   6 +=0D
> >  rust/kernel/sync/lock/ww_mutex/lock_set.rs | 449 +++++++++++++++++++++=
=0D
> >  2 files changed, 455 insertions(+)=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs=0D
> =0D
