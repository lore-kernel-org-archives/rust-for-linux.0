Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FEF34BA3B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718509; cv=none; b=Bwn7+BrwFLZNj++hpCjMKjpeCfy5ojvLZhB9n+lzbI5lE0sXnICF1/bbW1+CkkyZbGqCsc9GPP3ktzC/dN8turdf41Ltg3eeiv8GAqQQ9xfoCdxo4VEoRsiUmqV30X7f3bv2U8BVSy4M8GqhqgivnCZVc/Ud/DJQa7ygIoUPT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718509; c=relaxed/simple;
	bh=0sF8dq6B1ijAfEj4eOA1H01mchEyVIzs84U+azmz6OY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AF8+CxGlZR7y0E5Nug9Iu/WTE3MndW6suytRjn4fR5uLXBm1MMF5TczaOCMDrvbEcbpQASIjjvxMJdvrPpFPLRkNRBureJom5oXSn8Qr47iP3knZO9l9v8d9Ex/YsbHWUQBmdaViSv0qjCVrH0gGKovYJhTsnVjhNg7w2o2bdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWAxkNxN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWAxkNxN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so31089035e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770718506; x=1771323306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOkGkAm2doPiV/1EVK7/mVmF+wrw3R5I+/aUBLVAOLM=;
        b=wWAxkNxN2ZDlo06mkHIlldGYPzM5jDNBYbT4FXE90O//0cQ7sw2kjgJRf+nCXDGZDe
         66HcBvODDmc/Df6PbiCe7cw4wbfhCZNp6sxVz7WjjTR753PsN7/tVkt2tOfU/p+5Ap6Z
         6DLXGypZO/KW+at4+tnZ/mCfQHdTWRI8Uo2uS70azv+fa/1C3uCB5jb1oznzxCyf+WPx
         68kZ8BfHQzIrmmhtDQfQqcyyrv0LLZ0vUZAYl8H48QhySmLm6/IfC72y8RorK7Mjg4Oo
         uo4u969Ic4mud2ge8t2h2hs64KW6xjBSng8ELCkwuFVuHHKV9yr6MRBi+cjmuE1SeFYb
         Qu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718506; x=1771323306;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LOkGkAm2doPiV/1EVK7/mVmF+wrw3R5I+/aUBLVAOLM=;
        b=lzyEFSEsdQUh4WxwcYM7LJUCH9GZF3LPGfxoh1oSFQeRPahtGmTGihOhK0gjDHjgdo
         E3HC8ARZYNGoYLtq3vKcFRIEfmOPaS68GubYvxdMt+CSS0nwCefb8SAdHZqfLD3/+OzE
         ddfnhxmRcSrQGSG4dk7pRxwGhfBTc7J7/wYzMgLn+QELGgyefaoXWq0M8OlvSU1TZEns
         r7ocndQG7bXQfh9Pe+sIsdmVBwvh7TyNZH8RNykQ8+DIzbGNAhOcj9PD2/WrObUIU+IY
         a6iOi3wH7J5XbhE2lg6darDHlKKkIM5XW39C2SzP6mx6GpmDIrDBXOy8V7WCUkFJ1u3E
         98Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXaqYsNqLuJvWhObqazJvsjk7gkTHIU39O3k9KEvx8NOqA1B7fxSfkZbI0zsBFFjMdgxP1q0T3HX06gKY7aug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qvNLxp5tvDs/wnpMemJuzHYUYOxT6J/b/zxHvmvSQNIDYcM0
	nTAC0YKbjJvPhHze7zOynjGJcLyY/nULRZx4mD+vEozShNlgjo44GDJKPLtx9vpS1/+BCqNQYi4
	8Tv4rPgnJSb6QCiQpvw==
X-Received: from wmxa16-n2.prod.google.com ([2002:a05:600d:6450:20b0:480:3227:a124])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1381:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-4835082d265mr21291245e9.32.1770718505691;
 Tue, 10 Feb 2026 02:15:05 -0800 (PST)
Date: Tue, 10 Feb 2026 10:15:04 +0000
In-Reply-To: <20260210101525.7fb85f25@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora> <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
Message-ID: <aYsFKOVrsMQeAHoi@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:15:25AM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 08:38:00 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:
> > > On 2/9/26 15:58, Boris Brezillon wrote: =20
> > > > On Mon, 09 Feb 2026 09:19:46 +0100
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > >  =20
> > > >> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote: =20
> > > >>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:   =20
> > > >>>> On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > >>>> Philipp Stanner <phasta@kernel.org> wrote:
> > > >>>> Unfortunately, I don't know how to translate that in rust, but w=
e
> > > >>>> need a way to check if any path code path does a DmaFence.signal=
(),
> > > >>>> go back to the entry point (for a WorkItem, that would be
> > > >>>> WorkItem::run() for instance), and make it a DmaFenceSignallingP=
ath.
> > > >>>> Not only that, but we need to know all the deps that make it so
> > > >>>> this path can be called (if I take the WorkItem example, that wo=
uld
> > > >>>> be the path that leads to the WorkItem being scheduled).   =20
> > > >>>
> > > >>> I think we need a guard object for this that is not Send, just li=
ke for any
> > > >>> other lock.
> > > >>>
> > > >>> Internally, those markers rely on lockdep, i.e. they just acquire=
 and release a
> > > >>> "fake" lock.   =20
> > > >>
> > > >> The guard object would be created through fence.begin_signalling()=
, wouldn't it? =20
> > > >=20
> > > > It shouldn't be a (&self)-method, because at the start of a DMA
> > > > signaling path, you don't necessarily know which fence you're going=
 to
> > > > signal (you might actually signal several of them).
> > > >  =20
> > > >> And when it drops you call dma_fence_end_signalling()? =20
> > > >=20
> > > > Yep, dma_fence_end_signalling() should be called when the guard is
> > > > dropped.
> > > >  =20
> > > >>
> > > >> How would that ensure that the driver actually marks the signallin=
g region correctly? =20
> > > >=20
> > > > Nothing, and that's a problem we have in C: you have no way of tell=
ing
> > > > which code section is going to be a DMA-signaling path. I can't thi=
nk
> > > > of any way to make that safer in rust, unfortunately. The best I ca=
n
> > > > think of would be to
> > > >=20
> > > > - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with ex=
tra
> > > >   constraints) that's designed for DMA-fence signaling, and that ta=
kes
> > > >   the DmaSignaling guard around the ::run() call.
> > > > - We would then need to ensure that any code path scheduling this w=
ork
> > > >   item is also in a DMA-signaling path by taking a ref to the
> > > >   DmaSignalingGuard. This of course doesn't guarantee that the sect=
ion
> > > >   is wide enough to prevent any non-authorized operations in any pa=
th
> > > >   leading to this WorkItem scheduling, but it would at least force =
the
> > > >   caller to consider the problem. =20
> > >=20
> > > On the C side I have a patch set which does something very similar.
> > >=20
> > > It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> > > signal a DMA fence from an IOCTL, or more specific process context.
> > >=20
> > > Signaling a DMA fence from interrupt context, a work item or kernel
> > > thread is still allowed, there is just the hole that you can schedule
> > > a work item from process context as well.
> > >=20
> > > The major problem with that patch set is that we have tons of very
> > > hacky signaling paths in drivers already because we initially didn't
> > > knew how much trouble getting this wrong causes.
> > >=20
> > > I'm strongly in favor of getting this right for the rust side from th=
e
> > > beginning and enforcing strict rules for every code trying to
> > > implement a DMA fence. =20
> >=20
> > Hmm. Could you say a bit more about what the rules are? I just re-read
> > the comments in dma-fence.c, but I have some questions.
> >=20
> > First, how does the signalling annotation work when the signalling path
> > crosses thread boundaries?
>=20
> It's not supposed to cross the thread boundary at all. The annotation
> is per-thread, and it that sense, it matches the lock guard model
> perfectly.
>=20
> > For example, let's say I call an ioctl to
> > perform an async VM_BIND, then the dma fence signalling critical path
> > starts in the ioctl, but then it moves into a workqueue and finishes
> > there, right?
>=20
> It's a bit trickier. The fence signalling path usually doesn't exist in
> the submitting ioctl until the submission becomes effective and the
> emitted fences are exposed to the outside world. That is, when:
> - syncobjs are updated to point to this new fence
> - fencefd pointing to this new fence is returned
> - fence is added to the dma_resvs inside the gem/dma_buf objects
> - ... (there might be other cases I forgot about)
>=20
> In the submission path, what's important is that no blocking allocation
> is done between the moment the fence is exposed, and the moment it's
> queued. In practice what happens is that the job this fence is bound to
> is queued even before the fences are exposed, so if anything, what we
> should ensure is the ordering, and having a guarantee that a job being
> queued means it's going to be dequeued and executed soon enough.
>=20
> The second DMA signaling path exists in the context of the
> workqueue/item dequeuing a job from the JobQueue (or drm_sched) and
> pushing it to the HW. Then there's the IRQ handler being called to
> inform the GPU is done executing this job, which might in some cases
> lead to another work item being queued for further processing from
> which the dma_fence is signaled. In other cases, the dma_fence is
> signaled directly from the IRQ handler. All of these contexts are
> considered being part of the DMA-signaling path. But it's not like the
> fence signaling annotation is passed around, because the cookies
> returned by dma_fence_begin_signalling() are only valid in a single
> thread context, IIRC.

Ok I understand what's going on now.

You talk about it as-if there are two signalling paths, one in the ioctl
and another in the workqueue. But that sounds like a workaround to make
it work with how dma_fence_begin_signalling() is implemented, and not
the true situation. (Added: looks like Christian confirms this.)

One way you can see this is by looking at what we require of the
workqueue. For all this to work, it's pretty important that we never
schedule anything on the workqueue that's not signalling safe, since
otherwise you could have a deadlock where the workqueue is executes some
random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
meaning that the VM_BIND job never gets scheduled since the workqueue
is never freed up. Deadlock.

And the correct way to model the above in lockdep is to have the DMA
fence lockdep key be nested *outside* the lockdep key of the workqueue.
Because there is a step in the signalling path where you wait for other
jobs to complete before the signalling path is able to continue.

And the meaning of such a lockdep dependency is exactly that the
critical region moves from one thread to another.


Perhaps we could have an API like this:

// Split the DriverDmaFence into two separate fence concepts:
struct PrivateFence { ... }
struct PublishedFence { ... }

/// The owner of this value must ensure that this fence is signalled.
struct MustBeSignalled<'fence> { ... }
/// Proof value indicating that the fence has either already been
/// signalled, or it will be. The lifetime ensures that you cannot mix
/// up the proof value.
struct WillBeSignalled<'fence> { ... }

/// Create a PublishedFence by entering a region that promises to signal
/// it.
///
/// The only way to return from the `region` closure it to construct a
/// WillBeSignalled value, and the only way to do that (see below) is to
/// signal it, or spawn a workqueue job that promises to signal it.
/// (Since the only way for that workqueue job to exit is to construct a
/// second WillBeSignalled value.)
fn dma_fence_begin_signalling(
    fence: PrivateFence,
    region: impl for<'f> FnOnce(MustBeSignalled<'f>) -> WillBeSignalled<'f>=
,
) -> PublishedFence {
    let cookie =3D bindings::dma_fence_begin_signalling();

    region(<create token here>);

    bindings::dma_fence_end_signalling(cookie);

    fence.i_promise_it_will_be_signalled();
}

impl MustBeSignalled<'_> {
    /// Drivers generally should not use this one.
    fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }

    /// One way to ensure the fence has been signalled is to signal it.
    fn signal_fence(self) -> WillBeSignalled {
        self.fence.signal();
        self.i_promise_it_will_be_signalled()
    }

    /// Another way to ensure the fence will be signalled is to spawn a
    /// workqueue item that promises to signal it.
    fn transfer_to_wq(
        self,
        wq: &Workqueue,
        item: impl DmaFenceWorkItem,
    ) -> WillBeSignalled {
        // briefly obtain the lock class of the wq to indicate to
        // lockdep that the signalling path "blocks" on arbitrary jobs
        // from this wq completing
        bindings::lock_acquire(&wq->key);
        bindings::lock_release(&wq->key);

        // enqueue the job
        wq.enqueue(item, wq);

        // The signature of DmaFenceWorkItem::run() promises to arrange
        // for it to be signalled.
        self.i_promise_it_will_be_signalled()
    }
}

trait DmaFenceWorkItem {
    fn run<'f>(self, fence: MustBeSignalled<'f>) -> WillBeSignalled<'f>;
}


with this API, the ioctl can do this:

let published_fence =3D dma_fence_begin_signalling(|fence| {
    fence.transfer_to_wq(my_wq, my_work_item)
});
somehow_publish_the_fence_to_userspace(published_fence);

And we're ensured that the fence is really signalled because the
signature of the work item closure is such that it can only return from
DmaFenceWorkItem::run() by signalling the fence (or spawning it to a
second workqueue, which in turn promises to signal it).

Of course, the signature only enforces that the fence is (or will be)
signalled if you return. One can still put an infinite loop inside
dma_fence_begin_signalling() and avoid signalling it, but there's
nothing we can do about that.

> > Second, it looks like we have the same challenge as with irq locks wher=
e
> > you must properly nest dma_fence_begin_signalling() regions, and can't
> > e.g. do this:
> >=20
> > c1 =3D dma_fence_begin_signalling()
> > c2 =3D dma_fence_begin_signalling()
> > dma_fence_end_signalling(c1)
> > dma_fence_end_signalling(c2)
>=20
> I think that's the case yes, you have to end in reverse being order.

Ok.

Alice
