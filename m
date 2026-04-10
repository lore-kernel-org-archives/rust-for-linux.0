Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADDC3A6B99
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807805; cv=none; b=WbygyofBTN14NJaETkPrxx2TaAdBNSA//oVZjs7aZ2xrYrfNboUIVpopEpVKe4RSGVbvQZeWYioXXdA1wrMVqbHBllhUG/aKeFeMp1TrxDublkpBBajR1m59HApyb4HVKiqeqazc1zacVOi5qNeXdov3gu9aeMFKVCzAlfDoaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807805; c=relaxed/simple;
	bh=lWuyKafdzkch0u6HtCKw+f01+jGHVXX/tZp3tvV/CR4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rv24Rg1H8VfUKy+grSdqXIfoHy+7mu0ASW+E2Me+34dpK2MIyUl931MJzVDj4UREahvyXxfX8U+CWP/7TXeMyLPwPB8k/MWgfLo4TT0/ayzN2P4FlnpdCw7YOHILbCXwQ6WPpunMigQiAiNA+t1ld/MtZw47125sayHZzd8vUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4xQ4dQX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4xQ4dQX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so14924965e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775807800; x=1776412600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsHj3E8jz1hZ1VgM4Mdh7Fmm+/7se/VFa1BUujcYfm4=;
        b=A4xQ4dQX2ed+iCo0GygcBdqcxzx/cSK+U5MekyVtGBDm7PJuc7bjL300eFb3TGJqLe
         +P5o10q4rIqsQO/AdNiroNs7egEyHnMFIOBlDYpUsohDxk0fMNKrCJp+AssgKJqJjtfv
         /Aa/Avn0uJWrXTlydEkMt4CJLFXpnIWxdyjj6FphEdGsJPMPkmg+fGCSVNE3nh4IeZ5t
         fx/51eqjdD6brScqc8RDzheBNczUXb7YCCZpb1FVkq2a3rftHyn2akqGt+2F74UjqHWd
         +hpwasnCaW6dYOeaH7n5SN9CSCLDJXgl7SfqOADFZQvuBz+N1KrYEdOV9p7th0G20NVX
         NpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775807800; x=1776412600;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FsHj3E8jz1hZ1VgM4Mdh7Fmm+/7se/VFa1BUujcYfm4=;
        b=SRnYYCLI4BYjwKNDaZNQiUPOEw2FlHJ4WwlDJELBWqrJii1b7sSIz3vq/7yvc7fCky
         N8cSm80ZMN1sQg1TjleaFh8Ghtb3R0NnTYHMCLZgOJGh+DutpBzHjv3yYI7PJt0ZVf/d
         XRvsujGGSl/mUHHQl6L0tTRkVYJxm9e/qjPJn9xXN8ymY6/onOFW1AZYiRTExG1hT6ke
         xIOJcjRtVy+HMrDHvqnRpgY6o27/HlGmDgFcnH+WBc40Bal0dmM28SX3sn034Yk7tHgr
         Zi/a4gOcM/78/t06SBKwFrXv6T6mPf58J/OD0HizKOz1dR17Jb5tLhRMQ4NF4ri0R1fE
         5UYA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuA9yObf5x8r8Hu2ERiYYVawOC8yFGFLYb8NqinysgZgdnm12BCLCCFYxZvuTfQQtzOcXeKVmRjX5eUpPkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlp8WGM2SllhQb5RQJh2C7bsxP8D5KhLsr4zCGFtZPsPxiXpXI
	L2PLi+LGYln8deDDM0z6O334YA28Bs/JBGI+yzznBE1D6Hk6VNeCUi7I9nLBNRYcR/prLKjZBYp
	ao6YZ+3xozflFEVE9OA==
X-Received: from wmbb8.prod.google.com ([2002:a05:600c:5888:b0:488:7d2f:2468])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a105:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488d681701fmr15710665e9.1.1775807799874;
 Fri, 10 Apr 2026 00:56:39 -0700 (PDT)
Date: Fri, 10 Apr 2026 07:56:38 +0000
In-Reply-To: <395ED15F-3BC1-48C0-BE36-AF3A951E464D@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313091646.16938-1-work@onurozkan.dev> <20260313091646.16938-5-work@onurozkan.dev>
 <20260319120828.52736966@fedora> <9876893D-F3B4-4CA4-8858-473B6FB8E7EB@collabora.com>
 <20260409114133.43134-1-work@onurozkan.dev> <395ED15F-3BC1-48C0-BE36-AF3A951E464D@collabora.com>
Message-ID: <aditNn-iQc3QXRfK@google.com>
Subject: Re: [PATCH v1 RESEND 4/4] drm/tyr: add GPU reset handling
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, 
	Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 10:44:24AM -0300, Daniel Almeida wrote:
> Hi Onur,
>=20
> > On 9 Apr 2026, at 08:41, Onur =C3=96zkan <work@onurozkan.dev> wrote:
> >=20
> > On Fri, 03 Apr 2026 12:01:09 -0300
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> >=20
> >>=20
> >>=20
> >>> On 19 Mar 2026, at 08:08, Boris Brezillon <boris.brezillon@collabora.=
com> wrote:
> >>>=20
> >>> On Fri, 13 Mar 2026 12:16:44 +0300
> >>> Onur =C3=96zkan <work@onurozkan.dev> wrote:
> >>>=20
> >>>> +impl Controller {
> >>>> +    /// Creates a [`Controller`] instance.
> >>>> +    fn new(pdev: ARef<platform::Device>, iomem: Arc<Devres<IoMem>>)=
 -> Result<Arc<Self>> {
> >>>> +        let wq =3D workqueue::OrderedQueue::new(c"tyr-reset-wq", 0)=
?;
> >>>> +
> >>>> +        Arc::pin_init(
> >>>> +            try_pin_init!(Self {
> >>>> +                pdev,
> >>>> +                iomem,
> >>>> +                pending: Atomic::new(false),
> >>>> +                wq,
> >>>> +                work <- kernel::new_work!("tyr::reset"),
> >>>> +            }),
> >>>> +            GFP_KERNEL,
> >>>> +        )
> >>>> +    }
> >>>> +
> >>>> +    /// Processes one scheduled reset request.
> >>>> +    ///
> >>>> +    /// Panthor reference:
> >>>> +    /// - drivers/gpu/drm/panthor/panthor_device.c::panthor_device_=
reset_work()
> >>>> +    fn reset_work(self: &Arc<Self>) {
> >>>> +        dev_info!(self.pdev.as_ref(), "GPU reset work is started.\n=
");
> >>>> +
> >>>> +        // SAFETY: `Controller` is part of driver-private data and =
only exists
> >>>> +        // while the platform device is bound.
> >>>> +        let pdev =3D unsafe { self.pdev.as_ref().as_bound() };
> >>>> +        if let Err(e) =3D run_reset(pdev, &self.iomem) {
> >>>> +            dev_err!(self.pdev.as_ref(), "GPU reset failed: {:?}\n"=
, e);
> >>>> +        } else {
> >>>> +            dev_info!(self.pdev.as_ref(), "GPU reset work is done.\=
n");
> >>>> +        }
> >>>=20
> >>> Unfortunately, the reset operation is not as simple as instructing th=
e
> >>> GPU to reset, it's a complex synchronization process where you need t=
o
> >>> try to gracefully put various components on hold before you reset, an=
d
> >>> then resume those after the reset is effective. Of course, with what =
we
> >>> currently have in-tree, there's not much to suspend/resume, but I thi=
nk
> >>> I'd prefer to design the thing so we can progressively add more
> >>> components without changing the reset logic too much.
> >>>=20
> >>> I would probably start with a Resettable trait that has the
> >>> {pre,post}_reset() methods that exist in Panthor.
> >>>=20
> >>> The other thing we need is a way for those components to know when a
> >>> reset is about to happen so they can postpone some actions they were
> >>> planning in order to not further delay the reset, or end up with
> >>> actions that fail because the HW is already unusable. Not too sure ho=
w
> >>> we want to handle that though. Panthor is currently sprinkled with
> >>> panthor_device_reset_is_pending() calls in key places, but that's sti=
ll
> >>> very manual, maybe we can automate that a bit more in Tyr, dunno.
> >>>=20
> >>=20
> >>=20
> >> We could have an enum where one of the variants is Resetting, and the =
other one
> >> gives access to whatever state is not accessible while resets are in p=
rogress.
> >>=20
> >> Something like
> >>=20
> >> pub enum TyrData {
> >>  Active(ActiveTyrData),
> >>  ResetInProgress(ActiveTyrData)
> >> }
> >>=20
> >> fn access() -> Option<&ActiveTyrData> {
> >>  =E2=80=A6 // if the =E2=80=9CResetInProgress=E2=80=9D variant is acti=
ve, return None
> >> }
> >>=20
> >=20
> > That's an interesting approach, but if it's all about `fn access` funct=
ion, we
> > can already do that with a simple atomic state e.g.,:
> >=20
> > // The state flag in reset::Controller
> > state: Atomic<ResetState>
> >=20
> > fn access(&self) -> Option<&Arc<Devres<IoMem>>> {
> > match self.state.load(Relaxed) {
> > ResetState::Idle =3D> Some(&self.iomem),
> > _ =3D> None,
> > }
> > }
> >=20
> > What do you think? Would this be sufficient?
> >=20
> > Btw, a sample code snippet from the caller side would be very helpful f=
or
> > designing this further. That part is kind a blurry for me.
> >=20
> > Thanks,
> > Onur
> >=20
> >>=20
> >>>> +
> >>>> +        self.pending.store(false, Release);
> >>>> +    }
> >>>> +}
>=20
> I think that there are two things we're trying to implement correctly:
>=20
> 1) Deny access to a subset of the state while a reset is in progress
> 2) Wait for anyone accessing 1) to finish before starting a reset
>=20
> IIUC, using Atomic<T> can solve 1 by bailing if the "reset in progress"
> flag/variant is set, but I don't think it implements 2? One would have to
> implement more logic to block until the state is not being actively used.
>=20
> Now, there are probably easier ways to solve this, but I propose that we =
do the
> extra legwork to make this explicit and enforceable by the type system.
>=20
> How about introducing a r/w semaphore abstraction? It seems to correctly =
encode
> the logic we want:
>=20
> a) multiple users can access the state if no reset is pending ("read" sid=
e)
> b) the reset code can block until the state is no longer being accessed (=
the "write" side)
>=20
> In Tyr, this would roughly map to something like:
>=20
> struct TyrData {
>   reset_gate: RwSem<ActiveHwState>
>   // other, always accessible members
> }
>=20
> impl TyrData {
>   fn try_access(&self) -> Option<ReadGuard<'_, ActiveHwState>> {...}
> }
>=20
> Where ActiveHwState contains the fw/mmu/sched blocks (these are not upstr=
eam
> yet, Deborah has a series that will introduce the fw block that should la=
nd
> soon) and perhaps more.
>=20
> Now, the reset logic would be roughly:
>=20
> fn reset_work(tdev: Arc<TyrDevice>) {
>   // Block until nobody else is accessing the hw, prevent others from
>   // initiating new accesses too..
>   let _guard =3D tdev.reset_gate.write();
>   =20
>   // pre_reset() all Resettable implementors
>=20
>   ... reset
>=20
>   // post_Reset all Resettable implementors
> }
>=20
> Now, for every block that might touch a resource that would be unavailabl=
e
> during a reset, we enforce a try_access() via the type system, and ensure=
 that
> the reset cannot start while the guard is alive. In particular, ioctls wo=
uld
> look like:
>=20
> fn ioctl_foo(...) {
>   let hw =3D tdev.reset_gate.try_access()?;
>   // resets are blocked while the guard is alive, no other way to access =
that state otherwise
> }
>=20
> The code will not compile otherwise, so long as we keep the state in Acti=
veHwState, i.e.:=20
> protected by the r/w sem.
>=20
> This looks like an improvement over Panthor, since Panthor relies on manu=
ally
> canceling work that access hw state via cancel_work_sync(), and gating ne=
w work
> submissions on the "reset_in_progress" flag, i.e.:
>=20
> /**
>  * sched_queue_work() - Queue a scheduler work.
>  * @sched: Scheduler object.
>  * @wname: Work name.
>  *
>  * Conditionally queues a scheduler work if no reset is pending/in-progre=
ss.
>  */
> #define sched_queue_work(sched, wname) \
> do { \
> if (!atomic_read(&(sched)->reset.in_progress) && \
>     !panthor_device_reset_is_pending((sched)->ptdev)) \
> queue_work((sched)->wq, &(sched)->wname ## _work); \
> } while (0)
>=20
>=20
> Thoughts?

I don't think a semaphore is the right answer. I think SRCU plus a
counter makes more sense. (With a sentinal value reserved for "currently
resetting".)

When you begin using the hardware, you start an srcu critical region and
read the counter. If the counter has the sentinel value, you know the
hardware is resetting and you fail. Otherwise you record the couter and
proceed.

If at any point you release the srcu critical region and want to
re-acquire it to continue the same ongoing work, then you must ensure
that the counter still has the same value. This ensures that if the GPU
is reset, then even if the reset has finished by the time you come back,
you still fail because the counter has changed.


Another option could be to rely on the existing Device unbind logic.
Entirely remove the class device and run the full unbind procedure,
cleaning up all devm work etc. Then once that has finished, probe the
device again and start from scratch. After all, GPU reset does not have
to be a cheap operation.

Alice
