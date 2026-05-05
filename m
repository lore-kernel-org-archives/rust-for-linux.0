Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0B311975;
	Tue,  5 May 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974622; cv=none; b=L3hhYVG1ExqwX94Q4NdZ8RecN/zUkXh1e+ws67fUT/gY5/Fz+6jz5YW4sO+LMnTabQbokeHCSjqjC3PF+Lp7RRoFPvpPKda7BoxXtnY4B5wgbnGgwRk3euBazWvv9f9T5pr1o1i1SJIeLTjpXh3WZOVhkL+lmWLI1prJ5J1YI+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974622; c=relaxed/simple;
	bh=d89TzProBXIIk4b6pvt4HrParbRS3NIH27hPBF5kMLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJVDr/vj7+S5PVNh1//iaOOoJ1vA+i5g/7Bqbkm068YaE6VvqrEMThSmFD5fh/6oQcTPAj5L0KaEY+sp1yhBKDKaoZaoaIRcxGKprW6+hPj9cvIkwbNLFSE95z1iFTy5Sq+6dKk1Cixn3LrQ6CzskQAu3/B+7jbEbzATige1RqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GwZMhXhA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GwZMhXhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777974619;
	bh=d89TzProBXIIk4b6pvt4HrParbRS3NIH27hPBF5kMLo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GwZMhXhAoXF0mkqUWQwAhBS35qRtBZ6/1pzdaf7FQdixUwRLs4MYkBeydc7Y/AABP
	 8s7wTBbJ/dTiytY7TsTb5oE1Cl29d8JxMxte9mIpVn95qJZfb28LCBcngXlxk1r5Z8
	 1DI8TTSXk8pQsfBdXM91hYvu6QWVNzBoAjdczA4p+e+X2Wmr2BsJ0kn58czF+rzgFK
	 FAQRFbV3D1gKVt21SH3f/ZwHtWdKMwhOAIto0xEzoElmqzeZf65BqIuegGLx7+Jnxk
	 HtGUfdG3Esl2aCu0ZJGhII8D/NWjn3QFqdCKYe4X/9FczgyIpJ7ZoiQn27DaMixjmU
	 nhKlrP7SX7ymg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7E0C17E1321;
	Tue,  5 May 2026 11:50:18 +0200 (CEST)
Date: Tue, 5 May 2026 11:50:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
 tamird@kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
Message-ID: <20260505115014.49eef6d6@fedora>
In-Reply-To: <20260505091616.14877-1-work@onurozkan.dev>
References: <20260501191122.64311-1-work@onurozkan.dev>
	<20260501191122.64311-2-work@onurozkan.dev>
	<afhQzt2VGa-QQYSm@google.com>
	<20260505060723.11363-1-work@onurozkan.dev>
	<afmusSlYdOR2Alvp@google.com>
	<20260505091616.14877-1-work@onurozkan.dev>
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

On Tue,  5 May 2026 12:16:12 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> On Tue, 05 May 2026 08:47:45 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote: =20
> > > On Mon, 04 May 2026 07:54:54 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >  =20
> > > > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote: =20
> > > > > Adds Work::disable_sync() as a safe wrapper for disable_work_sync=
().
> > > > >=20
> > > > > Drivers can use this during teardown to stop new queueing and wai=
t for
> > > > > queued or running work to finish before dropping related resource=
s.
> > > > >=20
> > > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > > > ---
> > > > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------=
------
> > > > >  1 file changed, 81 insertions(+), 40 deletions(-)
> > > > >=20
> > > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > > > > index 7e253b6f299c..d0f9b4ba7f27 100644
> > > > > --- a/rust/kernel/workqueue.rs
> > > > > +++ b/rust/kernel/workqueue.rs
> > > > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindin=
gs::workqueue_struct) -> &'a Queue
> > > > > =20
> > > > >      /// Enqueues a work item.
> > > > >      ///
> > > > > -    /// This may fail if the work item is already enqueued in a =
workqueue.
> > > > > +    /// This may fail if the work item is already enqueued in a =
workqueue or disabled.
> > > > >      ///
> > > > >      /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> > > > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueO=
utput =20
> > > >=20
> > > > Can you elaborate on the case where disable leads to failure here? =
Can
> > > > you not enqueue a work item again after disabling it? Is there a doc
> > > > test illustrating this case that I can run for myself to see the
> > > > behavior in action? =20
> > >=20
> > > As we discussed on yesterday's call, I looked into cancel_work_sync a=
nd
> > > it seems we can make this work in the tyr reset implementation. We al=
ready
> > > store an atomic reset state, it can be used to prevent future enqueue=
s in
> > > reset scheduling.
> > >=20
> > > I will send a patch for the cancel_sync function soon. =20
> >=20
> > I did hear from Boris that Panthor actually does make use of the disable
> > feature.  =20
>=20
> I don't have any idea what Boris said, perhaps he should write it here as=
 well.
> Maybe Boris said something that isn't covered on the tyr reset yet in my =
series,
> I don't know.

So, I checked where those disable_[delayed_]work[_sync]() are, and they
seem to cover mostly the unplug path. There's a couple non-unplug
related use, which both cover the per-queue watchdog[3][4].

As for why we ended up using disable_work instead of cancel_work, it's
all explained in [1] and [2]. Yes, it could have been done differently,
but disable_work was the most convenient way of solving these UAFs in C.

>=20
> What I do know is that I can achieve essentially the same behavior using
> cancel_work_sync instead of disable_work_sync on tyr. Like i said there's=
 an
> atomic reset state we can use to prevent future work from being enqueued.

If the atomic is already there to prevent queuing more works, or
checking if a reset is pending, sure. It might just be more custom
checks to add, and if we think we'll need to support work items that can
be disabled further down the line anyway, maybe it makes sense to work
on it now, dunno.

Actually, looking back at panthor to write this reply, I'm now
considering replacing the custom checks we have in sched_queue_work()
by disable_[delayed_]work() calls in the
panthor_device_schedule_reset() path.

Of course, none of this has to drive how it's done in rust/Tyr, and if
you think it's better handled with a separate atomic and custom checks,
feel free to go for this alternative.

> The
> only real difference is that supporting disable_work_sync in the Rust wor=
kqueue
> would introduce more complexity than supporting cancel_work_sync. There i=
s also
> the corresponding enable part we have to support if we want to go with
> disable_work_sync path.

Yep, if you use it in the reset path, you'll have to support
enable_work as well. For unplug, it's not needed, because the device is
gone after that.

[1]https://lore.kernel.org/all/20251027140217.121274-1-ketil.johnsen@arm.co=
m/
[2]https://lore.kernel.org/all/20251029111412.924104-1-ketil.johnsen@arm.co=
m/
[3]https://elixir.bootlin.com/linux/v7.0.1/source/drivers/gpu/drm/panthor/p=
anthor_sched.c#L2728
[4]https://elixir.bootlin.com/linux/v7.0.1/source/drivers/gpu/drm/panthor/p=
anthor_sched.c#L919
