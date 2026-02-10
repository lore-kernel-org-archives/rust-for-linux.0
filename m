Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FE33D505
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712684; cv=none; b=puyuKKw8aniV2226da2Yo0gWvpT5lZCdqXWXXJoxUEeSDdJ2uuy1oWCcsWSw9U1OzTitOO+UffrWmfqWyPc/6iTXLIC4Hs0TbhD/9s6Czp7k1i4kXAkcrQGxei25lKGlpoRa4DbB6AbUp6pSIpWFquJUuXYxDFBditof/ZQ5Q4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712684; c=relaxed/simple;
	bh=gKNCdt1HK2+FkXbKFKDdQHtbIa2A6WpbYbsJZlakwak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iBO2cELb2rumFak+o/mM6HSxYANdmBJJMajCjXweosyr6Bg6AczlhzUdda12HkIMwRybC6DWBkEcTmKBZPPENM/yW4jx62zkzIjdyNIuHhk5V0NEACbYDws2+/fBixHU13bzDuaRP4KJJXz9gogaARDnhv2wybMURoWRL1oSEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QTiL8Bte; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QTiL8Bte"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4376b624589so1214725f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 00:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770712681; x=1771317481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIR/nLMNJopzZi8r6OqBl96KsfB3I1gZxHx9GRbTuCE=;
        b=QTiL8Bte20Yyf02d3bGqv1woOjPdW0sO6vtbaY+y2Z4aKDv5W62UQVv5wTKzsmrYKI
         He8GR9vni3TxgLSRu59je9JdCIXvLxXtBShIJQFkEIs0Ld4TBcQ+21cjZ5VxL/77KAfG
         RGfyEfToFz+9+XjjC4QmH73SUoeyNMp9JlePRLI96WlVcRN92Z0FuyLQqIPMhuDySKJQ
         fO7Ok7IdP2RBD+U9HrLA3hLJ2QKJDnilIEaMwjrrz8pg5Y1ITcyxlpbpha0o/PisOI4o
         +KBNPeu36yBOBpbxoFZRVCKzi/CaKJQhRK+LiU0IxST5r8k3gPgzjIwFgk4seIhoRgkH
         BQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712681; x=1771317481;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eIR/nLMNJopzZi8r6OqBl96KsfB3I1gZxHx9GRbTuCE=;
        b=b3df5l/n645nLepX9Ja9OU+nWGiVqtzOqyGZeqBhyk2o6eEqC++f/hkq8wgZ/N+DJN
         4QvqjRF0G20Je5+WwY8MCE3u5wnVYwIS0zLbVwbDJPDNV1MedX/mfv6ERTBNhC27wW8M
         2l63dRe6cmvrLY/Z5HUTYFtZcLaJj8mi6xjkHCqQC8qSIgxp5xWCc6MM1RsHNEcQz8AC
         uEgVcTQpLMqB1ioCFwbcbcAWceQwDEr6wXTnammscLNzhLKGSEPj0dXJS2iY+oXg9gtQ
         z2sI+Y+y0kd5ZRenToLKOxBi4yf7fnvgHcWlWYg74jv1HFNoCf6KnMWjmLcgoSbW2Uem
         ni6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW83kZKjdvImVCyHBsQuQTQEMVqsTkK00LyB361gX6cbitnlUHUTtXKOjv5/Y0FZUWLXrpEAFMeMNxIvRdq3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyo4BD82BkWKDAEQhEIcbsBeCnCZRT9Bhzh8hxPW+FByzz57mB
	yxtE0s7aRyULMjeEknu7pCNWCNiYkNd4LIy8cpH+K/kaKHZQAWrYXFN7CSi9dUe7j4OEWQ4+RCb
	ycAJpTIrIDhviPhPrbg==
X-Received: from wrbeh2.prod.google.com ([2002:a05:6000:4102:b0:437:66b4:44d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2012:b0:437:72d8:7dd7 with SMTP id ffacd0b85a97d-4377a5953e0mr1903500f8f.43.1770712681191;
 Tue, 10 Feb 2026 00:38:01 -0800 (PST)
Date: Tue, 10 Feb 2026 08:38:00 +0000
In-Reply-To: <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
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
Message-ID: <aYruaIxn8sMXVI0r@google.com>
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

On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:
> On 2/9/26 15:58, Boris Brezillon wrote:
> > On Mon, 09 Feb 2026 09:19:46 +0100
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> >> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> >>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote: =20
> >>>> On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> >>>> Philipp Stanner <phasta@kernel.org> wrote:
> >>>> Unfortunately, I don't know how to translate that in rust, but we
> >>>> need a way to check if any path code path does a DmaFence.signal(),
> >>>> go back to the entry point (for a WorkItem, that would be
> >>>> WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> >>>> Not only that, but we need to know all the deps that make it so
> >>>> this path can be called (if I take the WorkItem example, that would
> >>>> be the path that leads to the WorkItem being scheduled). =20
> >>>
> >>> I think we need a guard object for this that is not Send, just like f=
or any
> >>> other lock.
> >>>
> >>> Internally, those markers rely on lockdep, i.e. they just acquire and=
 release a
> >>> "fake" lock. =20
> >>
> >> The guard object would be created through fence.begin_signalling(), wo=
uldn't it?
> >=20
> > It shouldn't be a (&self)-method, because at the start of a DMA
> > signaling path, you don't necessarily know which fence you're going to
> > signal (you might actually signal several of them).
> >=20
> >> And when it drops you call dma_fence_end_signalling()?
> >=20
> > Yep, dma_fence_end_signalling() should be called when the guard is
> > dropped.
> >=20
> >>
> >> How would that ensure that the driver actually marks the signalling re=
gion correctly?
> >=20
> > Nothing, and that's a problem we have in C: you have no way of telling
> > which code section is going to be a DMA-signaling path. I can't think
> > of any way to make that safer in rust, unfortunately. The best I can
> > think of would be to
> >=20
> > - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
> >   constraints) that's designed for DMA-fence signaling, and that takes
> >   the DmaSignaling guard around the ::run() call.
> > - We would then need to ensure that any code path scheduling this work
> >   item is also in a DMA-signaling path by taking a ref to the
> >   DmaSignalingGuard. This of course doesn't guarantee that the section
> >   is wide enough to prevent any non-authorized operations in any path
> >   leading to this WorkItem scheduling, but it would at least force the
> >   caller to consider the problem.
>=20
> On the C side I have a patch set which does something very similar.
>=20
> It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> signal a DMA fence from an IOCTL, or more specific process context.
>=20
> Signaling a DMA fence from interrupt context, a work item or kernel
> thread is still allowed, there is just the hole that you can schedule
> a work item from process context as well.
>=20
> The major problem with that patch set is that we have tons of very
> hacky signaling paths in drivers already because we initially didn't
> knew how much trouble getting this wrong causes.
>=20
> I'm strongly in favor of getting this right for the rust side from the
> beginning and enforcing strict rules for every code trying to
> implement a DMA fence.

Hmm. Could you say a bit more about what the rules are? I just re-read
the comments in dma-fence.c, but I have some questions.

First, how does the signalling annotation work when the signalling path
crosses thread boundaries? For example, let's say I call an ioctl to
perform an async VM_BIND, then the dma fence signalling critical path
starts in the ioctl, but then it moves into a workqueue and finishes
there, right?

Second, it looks like we have the same challenge as with irq locks where
you must properly nest dma_fence_begin_signalling() regions, and can't
e.g. do this:

c1 =3D dma_fence_begin_signalling()
c2 =3D dma_fence_begin_signalling()
dma_fence_end_signalling(c1)
dma_fence_end_signalling(c2)

Alice
