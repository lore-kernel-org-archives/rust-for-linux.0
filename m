Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8613815E1
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736082; cv=none; b=FWmNx5g+jdKQ2WBzWvyIrgEQHF/qZTEI/3RA3pCvya/a6WeQkBh8FRzPeb0N57EL/By5mjhrHEMvCMslHPCjhdI0qqzkF/omc/cvlyjV2OqlZCxgA2rfs2KAc6pNHjKWinfhzM2NHTTzk9BmRjcy5t/EjrEo6adIspv13BDZNKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736082; c=relaxed/simple;
	bh=LSEbI/o/ubFu2514TGfHsNc5rlLURlcA7uxGH3ny+i8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HAT1/1DT+FRx/deiWyLQ6nUcwH2z7ARMEXHKzTgrfkW4V66PwYhvVx90GUuAwHNwV1ibmebX0rXlFRAqqMxoExh4HOFjc5tJCQ9wW4mqawHbO4jgtsZ8IG8X3LCnS20vUEnUF7yOwSLtUnaipSPN5sLDuT5GOQrtdNr9EoKbbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lCEWlKAf; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lCEWlKAf"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8db7f340b3so174642266b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770736079; x=1771340879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FhVNp7S2apTNQtAR4dzz+xwyAwezduduteEZBpg878=;
        b=lCEWlKAflA7tvsm5AsfVu9yiZKFoyAqGeIvOi4dTYcvOuQg6Mkbr9o/BmL554p8lcX
         qQh/fpLeRygyzCKtIabh+BxxBahuuIlhewAUOAHLega7kdIlErRkoOIZuJKefnNgt28v
         e8N13MBFY1Yb6zHSwyAeZ9W8uH2SJfdWyc9QNdKGPk64RGJzA7jE+wnR8V18PfQeCy+K
         /xVlzBbGOYwmYtAPUatTB5zEI0ff43A+gxBmtdSRGtC6z93GVerbs5VYjel2A9FX4V8+
         vjGKe+9LELUxkr40dw55W98E/pek8CMnhN+lHomf5i1w05NxlckfawLR6N53nGVQq5tB
         xtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736079; x=1771340879;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/FhVNp7S2apTNQtAR4dzz+xwyAwezduduteEZBpg878=;
        b=B6b33OJ6g30rBBJXCeygoLDnjWZi8Ag89hOnPxxHJes6zi24LWDNHX7yf/c3ACiGhY
         mIglwirHLPO4ZTaotSU15hqQ5VlHwuJDmi35F5QG37w/szatwSmr3P79L563gO5YaqD8
         Y2mvxDApHw9suk4TLAzqPV/euk2Nfy5oD60BvVm9G1379LdSzYULJUEBntQZODYXG5cI
         Q2NRAAfA9BqwPSzhUyyflR33R4jSQ7ItBf9XvCn/wEqjhf3+DOtTe8lhH/wPMF1K5hSh
         EhFraBCWfIF6DXbEByYA18GY31ZJX2gL8oTQ5cxSa/SGIDg0kBnOcj33f+7jzUeseiTo
         33CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMNZ91D1XuIbIgXNRTG8xcNyNeKRBQyhxV0d4KCKn+9YVmreLzlB1IUR8aVv93tEj7zEAlsbvL1p6QTtS4kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIuKrH3oEBLhkRYVfMuToWv+7PbPMZBOoQqYSCoGH5gxNHzSc
	GXjV0OPu3eR5XwG9j2s40ho3esr0j6XkCOT+2AQwUhX1ayekMInuAGZWI1+9k0DKO6PMwXAakdP
	H9sLY03mC1HwFK4SSUA==
X-Received: from ejdce41.prod.google.com ([2002:a17:907:d2e9:b0:b8e:7975:1950])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:96a3:b0:b87:8172:257 with SMTP id a640c23a62f3a-b8edf47dd02mr829999966b.64.1770736079025;
 Tue, 10 Feb 2026 07:07:59 -0800 (PST)
Date: Tue, 10 Feb 2026 15:07:58 +0000
In-Reply-To: <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Message-ID: <aYtJznZcCEYBffil@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 14:49, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> >> On Tue, 10 Feb 2026 13:15:31 +0000
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >>
> >>> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
> >>>> On Tue, 10 Feb 2026 10:15:04 +0000
> >>>> Alice Ryhl <aliceryhl@google.com> wrote:
> >>>>  =20
> >>>>> impl MustBeSignalled<'_> {
> >>>>>     /// Drivers generally should not use this one.
> >>>>>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ..=
. }
> >>>>>
> >>>>>     /// One way to ensure the fence has been signalled is to signal=
 it.
> >>>>>     fn signal_fence(self) -> WillBeSignalled {
> >>>>>         self.fence.signal();
> >>>>>         self.i_promise_it_will_be_signalled()
> >>>>>     }
> >>>>>
> >>>>>     /// Another way to ensure the fence will be signalled is to spa=
wn a
> >>>>>     /// workqueue item that promises to signal it.
> >>>>>     fn transfer_to_wq(
> >>>>>         self,
> >>>>>         wq: &Workqueue,
> >>>>>         item: impl DmaFenceWorkItem,
> >>>>>     ) -> WillBeSignalled {
> >>>>>         // briefly obtain the lock class of the wq to indicate to
> >>>>>         // lockdep that the signalling path "blocks" on arbitrary j=
obs
> >>>>>         // from this wq completing
> >>>>>         bindings::lock_acquire(&wq->key);
> >>>>>         bindings::lock_release(&wq->key);
> >>>>>
> >>>>>         // enqueue the job
> >>>>>         wq.enqueue(item, wq);
> >>>>>
> >>>>>         // The signature of DmaFenceWorkItem::run() promises to arr=
ange
> >>>>>         // for it to be signalled.
> >>>>>         self.i_promise_it_will_be_signalled()
> >>>>>     } =20
> >>>>
> >>>> I guess what's still missing is some sort of `transfer_to_hw()`
> >>>> function and way to flag the IRQ handler taking over the fence
> >>>> signaling token. =20
> >>>
> >>> Yes, transfer to hardware needs to be another piece of logic similar =
to
> >>> transfer to wq. And I imagine there are many ways such a transfer to
> >>> hardware could work.
> >>>
> >>> Unless you have a timeout on it, in which case the WillBeSignalled is
> >>> satisfied by the fact you have a timeout alone, and the signalling th=
at
> >>> happens from the irq is just an opportunistic signal from outside the
> >>> dma fence signalling critical path.
> >>
> >> Yes and no. If it deadlocks in the completion WorkItem because of
> >> allocations (or any of the forbidden use cases), I think we want to
> >> catch that, because that's a sign fences are likely to end up with
> >> timeouts when they should have otherwise been signaled properly.
> >>
> >>> Well ... unless triggering timeouts can block on GFP_KERNEL
> >>> allocations...
> >>
> >> I mean, the timeout handler should also be considered a DMA-signalling
> >> path, and the same rules should apply to it.
> >=20
> > I guess that's fair. Even with a timeout you want both to be signalling
> > path.
> >=20
> > I guess more generally, if a fence is signalled by mechanism A or B,
> > whichever happens first, you have the choice between:
>=20
> That doesn't happen in practice.
>=20
> For each fence you only have one signaling path you need to guarantee
> forward progress for.
>=20
> All other signaling paths are just opportunistically optimizations
> which *can* signal the fence, but there is no guarantee that they
> will.
>=20
> We used to have some exceptions to that, especially around aborting
> submissions, but those turned out to be a really bad idea as well. =20
>=20
> Thinking more about it you should probably enforce that there is only
> one signaling path for each fence signaling.

I'm not really convinced by this.

First, the timeout path must be a fence signalling path because the
reason you have a timeout in the first place is because the hw might
never signal the fence. So if the timeout path deadlocks on a
kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.

Second, for the reasons I mentioned you also want the signal-from-irq
path to be a fence signalling critical path, because if we allow you to
kmalloc(GFP_KERNEL) on the path from getting notification from hardware
to signalling the fence, then you may deadlock until the timeout
triggers ... even if the deadlock is only temporary, we should still
avoid such cases IMO. Thus, the hw signal path should also be a fence
signalling critical path.

Alice
