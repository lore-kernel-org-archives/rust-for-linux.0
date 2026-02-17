Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F7356A01
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337379; cv=pass; b=rEgvxZ4vIJ//G3uardqylESClNcuRDLFafomsi/iEchDrauN2AzItzr2kHHhAmwILZ9rdbElphJlZJrQAGMJeVAFN1uI/hm5Z9kZsGk3LsSIPNPMjHrWcz4eth7Izi64XN8P/o0MVR1RLVF7bTK1UXbtnRKP5I0295TALcWQ5H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337379; c=relaxed/simple;
	bh=QEJrLc0HnQ5I+alHDUi27nIVl1wC70I8Wfh2X+OeMGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNTSwGm8JiZ7qNwdz9T+5lTJHMLEv+s5W2rGPa95hHUSnvdQRe4SUSyqofJgFXd/PCnQvtrXncSg6DI/6+G98BxiGW6uGuTMr8qFKsqTiRZfphfOrHKACSAGyvzLDER2kac4eGvBomekcQIVAqR+zZRpE0+lCfYe5coNIrT/JyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0v4dXTx4; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0v4dXTx4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362c635319so4227299f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 06:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771337376; cv=none;
        d=google.com; s=arc-20240605;
        b=iAcBI1ajvD8ROABfOi8iXv6m9MMiWRLiIHOkyl/a2eht4KXtrlq5Rj31GE2PHk4Dbz
         ttqrOvI9RIKH4WXYtroESzGied5UUbxV5WHH8P2os4MJ114KR4wQktYKxiLALBrYRfbz
         NnW4b9R5FUVCjky4HSZXhaaG5i7og8g3ZewJgWBk1nWIF2oiZSyPhs9MmMUe9pC0BHlZ
         cw5rY1wfuK222vYgwUh2GTWmkQNH12m81HVxzDnBBHdG4Eoo1uZ6bgVFfFQ+KQshUJkN
         xnAo2CyMsTCnmunQd8gh9QQ136o98IIWUDU7+pGuynZmrRwCHiU1mDLLfHEXJpGT5tvT
         j0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
        fh=Ewa3s8anK3cYWxC36pf+SFCpZVuGfm4TLFM/P9mVRhs=;
        b=buw+nBi9tx56dKKJ/ctub+ffh9HwbJO9Q+mOQ48V+HWf9blOdA6miH4DgmOxu4/law
         YEjjQPb/48tevY1AQVP4vkts8S7He8X1oVYX4acr7li1qLdNij3MI3tgU0mkdGK9Osq5
         sB9knT3Mb3mEuWnUlYoSyFJ/xmUGDw8AixhzA9OYU/u4lHPeFHX1UxUOwdq0Wk+9S+RO
         uhx0XyD/cO4RDLf/8PsPr2qOp7wu6k+waod+1WjjrJAv5b6Xb4uopRpHsGxglUxH0iy1
         fbFHoug7E5E2dvRO9hlVyK7NSSdl7vZO7QemX7WMVhqGIrbHggDSftOiCxWaBm/y+2Is
         h82g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771337376; x=1771942176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
        b=0v4dXTx4DHqpk/AypntGOJvW8VwGb9EtYO50beGCnj0vmDB0IUAE637ycCg61PR1t7
         b+wRfd9Ul6LQRmS0YZTRHOi3xAj/ojYOKqEDKOnpAW9Cjum4oSD+u5gL19IE8q1oYC9F
         8nCXAH4kHGb71KyyJeLeGwvvdWptkGUxVkhD0bP5hOCqM4M7Dvg9lUl4ov4IFUGolD7/
         2vLaYrCNxn0lJ/jBkXkP/aDItUhQ6EpWKh2G4A/ucEGbZBAApnG0b870tUpwPYNkkIUe
         voHMc1SqXUFBG5vUm3GUY1EsOpOXaLyyw3HxoifNedJcQ6QGLv0CoW70WifzGaMyykVi
         KW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337376; x=1771942176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
        b=Yg9wZtWFF3C1HsZcIkK96zzX5uWyCvbM+jTHtQd07pezHnLbo8I1n/1SK9uCRS3jbf
         aUgnAClN68fBLM2Y7WoahlIWLUXE/cCIbYm0UTLleOdhxwaAVUkzfbWjKmHP9CpTdNlH
         pM5AdFaMj+0boeaI6adR0CvAFeMLGEyiUNB92OnROhdLsHw4ncQeEPeKxfhUGke4gGXq
         QLcosKx8LExnNFuOErXJVSESrG7jgPPBJQhfVgEaQ4vppipnRdWwxV7HF2Q3jbYcj5Es
         bHhs0/OXpD3noHLi83fVqw0AzaX+FajSEaxMfRdIgM6zspU6dS12bXeM26+xPSqoojtm
         heeA==
X-Forwarded-Encrypted: i=1; AJvYcCU5evqSuafhiWMq4bsveg+TcZN+lAl685QhAEbq8AHOMLnRREvpek5qeltuQijCiI84A7oY8Y3OEhM8mY4zaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeqQXEyt1WwRWqFj/+2aNKuGalooh5j5dgGROaSHqAUabuGr0
	MzE3Qf1A2AT/GqxdTA6QaxakAzYxYBAMi1iPCguzWSo5U0iiIjgvSZz+9L0f4p0VbtUu14FZgHb
	S/9L8gjExBvPp/K7S7jRXex+5Ii9KxiTg/NNaywvn
X-Gm-Gg: AZuq6aLpCRxVyZQGgOj8xgXf6cBfvcfeHKlpgRz6o7HCWiYTiAh8BojmZS4XSUtog5d
	qsWnNuP0axvFLcDYypVMWBomPy0jHrnm8tZtKKoLM3i0kAEu1eP+9hMfOvlAx3J4258/M4yP+EK
	UuLbtyiyxkW5e2xye5PqQEKRzkiniUoPgJV6F8fj5WuVLzl2VbLYkrBlqOf8iGLIEXGZFdNHqaT
	0sXwvKd8haKHhr/LHaMYcJBWeImWG5ePxZrv4xpoR61UBczyz70qapuvQMM20HoIzw08LgLfzQB
	SaoqmI0tVo5OhCYyFPX6y0SL2dJX+K2yZF1ARhP52FyPwSVKnKC0v++vGdOQT7H0Qg5P8w==
X-Received: by 2002:adf:ee07:0:b0:437:6e63:9172 with SMTP id
 ffacd0b85a97d-437978c761amr17248986f8f.4.1771337375424; Tue, 17 Feb 2026
 06:09:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com> <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com> <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
In-Reply-To: <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 15:09:22 +0100
X-Gm-Features: AaiRm50B8Tc9CMv2QWUVjoG3DsZ7EJJzS-cwntAad34iqku_5ZENYYX9qsQjqLg
Message-ID: <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Tue, 2026-02-10 at 16:45 +0100, Christian K=C3=B6nig wrote:
> > On 2/10/26 16:07, Alice Ryhl wrote:
> > > On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian K=C3=B6nig wrote:
> > > > On 2/10/26 14:49, Alice Ryhl wrote:
> > > > > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> > > > > > On Tue, 10 Feb 2026 13:15:31 +0000
> > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > >
> > > > > > > On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wro=
te:
> > > > > > > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > > > >
> > > > > > > > > impl MustBeSignalled<'_> {
> > > > > > > > >     /// Drivers generally should not use this one.
> > > > > > > > >     fn i_promise_it_will_be_signalled(self) -> WillBeSign=
alled { ... }
> > > > > > > > >
> > > > > > > > >     /// One way to ensure the fence has been signalled is=
 to signal it.
> > > > > > > > >     fn signal_fence(self) -> WillBeSignalled {
> > > > > > > > >         self.fence.signal();
> > > > > > > > >         self.i_promise_it_will_be_signalled()
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > >     /// Another way to ensure the fence will be signalled=
 is to spawn a
> > > > > > > > >     /// workqueue item that promises to signal it.
> > > > > > > > >     fn transfer_to_wq(
> > > > > > > > >         self,
> > > > > > > > >         wq: &Workqueue,
> > > > > > > > >         item: impl DmaFenceWorkItem,
> > > > > > > > >     ) -> WillBeSignalled {
> > > > > > > > >         // briefly obtain the lock class of the wq to ind=
icate to
> > > > > > > > >         // lockdep that the signalling path "blocks" on a=
rbitrary jobs
> > > > > > > > >         // from this wq completing
> > > > > > > > >         bindings::lock_acquire(&wq->key);
> > > > > > > > >         bindings::lock_release(&wq->key);
> > > > > > > > >
> > > > > > > > >         // enqueue the job
> > > > > > > > >         wq.enqueue(item, wq);
> > > > > > > > >
> > > > > > > > >         // The signature of DmaFenceWorkItem::run() promi=
ses to arrange
> > > > > > > > >         // for it to be signalled.
> > > > > > > > >         self.i_promise_it_will_be_signalled()
> > > > > > > > >     }
> > > > > > > >
> > > > > > > > I guess what's still missing is some sort of `transfer_to_h=
w()`
> > > > > > > > function and way to flag the IRQ handler taking over the fe=
nce
> > > > > > > > signaling token.
> > > > > > >
> > > > > > > Yes, transfer to hardware needs to be another piece of logic =
similar to
> > > > > > > transfer to wq. And I imagine there are many ways such a tran=
sfer to
> > > > > > > hardware could work.
> > > > > > >
> > > > > > > Unless you have a timeout on it, in which case the WillBeSign=
alled is
> > > > > > > satisfied by the fact you have a timeout alone, and the signa=
lling that
> > > > > > > happens from the irq is just an opportunistic signal from out=
side the
> > > > > > > dma fence signalling critical path.
> > > > > >
> > > > > > Yes and no. If it deadlocks in the completion WorkItem because =
of
> > > > > > allocations (or any of the forbidden use cases), I think we wan=
t to
> > > > > > catch that, because that's a sign fences are likely to end up w=
ith
> > > > > > timeouts when they should have otherwise been signaled properly=
.
> > > > > >
> > > > > > > Well ... unless triggering timeouts can block on GFP_KERNEL
> > > > > > > allocations...
> > > > > >
> > > > > > I mean, the timeout handler should also be considered a DMA-sig=
nalling
> > > > > > path, and the same rules should apply to it.
> > > > >
> > > > > I guess that's fair. Even with a timeout you want both to be sign=
alling
> > > > > path.
> > > > >
> > > > > I guess more generally, if a fence is signalled by mechanism A or=
 B,
> > > > > whichever happens first, you have the choice between:
> > > >
> > > > That doesn't happen in practice.
> > > >
> > > > For each fence you only have one signaling path you need to guarant=
ee
> > > > forward progress for.
> > > >
> > > > All other signaling paths are just opportunistically optimizations
> > > > which *can* signal the fence, but there is no guarantee that they
> > > > will.
> > > >
> > > > We used to have some exceptions to that, especially around aborting
> > > > submissions, but those turned out to be a really bad idea as well.
> > > >
> > > > Thinking more about it you should probably enforce that there is on=
ly
> > > > one signaling path for each fence signaling.
> > >
> > > I'm not really convinced by this.
> > >
> > > First, the timeout path must be a fence signalling path because the
> > > reason you have a timeout in the first place is because the hw might
> > > never signal the fence. So if the timeout path deadlocks on a
> > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boo=
m.
> >
> > Mhm, good point. On the other hand the timeout handling should probably=
 be considered part of the normal signaling path.
>
>
> Why would anyone want to allocate in a timeout path in the first place =
=E2=80=93 especially for jobqueue?
>
> Timeout -> close the associated ring. Done.
> JobQueue will signal the done_fences with -ECANCELED.
>
> What would the driver want to allocate in its timeout path, i.e.: timeout=
 callback.

Maybe you need an allocation to hold the struct delayed_work_struct
field that you use to enqueue the timeout?

Alice
