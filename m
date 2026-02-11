Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA202207A32
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824009; cv=none; b=oo8gD5YRYqNfWW42GEkQZAbN/9ckl0QbsTEO3IwHVjUmwhBPlUoO+GiFRFrz28B39awx25P4OboouGcSoi/JSxfCAuK7hsXwgJ/4WwElTP4NsHx2VVE8aBp0ubMBEL8owYHQxaa0uQ/wGtFiFTS3d1BW9vi5CYZ1gdF9FdIyAnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824009; c=relaxed/simple;
	bh=69uHbckydWaKM9z8QoKV1Sspu6MeiIeZoVRM+AIu30E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gss69gJShsdMtm3Zu6V3ND5L84jOOpmD4xonOShJnbDeT5MP6LnOCLC2ZoI53NgY31/L9SgRv0jWaCaf0bVjPUNKV1KqUPTcPQfKP5YjKLxj+888hWTNTu9fh/mQMtnUP/RPFi42o3s9ycsR4znth8YD0bfOclKO3usD+9wbdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PeieuUnp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PeieuUnp"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801e3aab32so37784295e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770824006; x=1771428806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69uHbckydWaKM9z8QoKV1Sspu6MeiIeZoVRM+AIu30E=;
        b=PeieuUnpymS3mQ0fxceH7Chk4GOP26ms/2gWDM6n1XQ/jpRKt6uTsf8VDi0BFHiUQJ
         hfbFV8+xlRsEu55HpcL0E2TfYXCWPc9NpDBYTsFrrlXEN2qCC7wvCmgRGuTHeooRikwW
         ClhFU56EE7UDo2gSH0uBGj7DOnP4XebSyjMB9ZkktQLkoVOz2NR2uMOW9s/UgH85buPZ
         phbZjxvfMfzhd+SrbuFQ4Pd2YboLxYnZlACOlkUjzvExYxDT7Hk9Cefhn8mhRilWmGhU
         hVcCLW+N4HD15GjcGWNocKk31WxDfK6MyFR0SebjC7PWcb/3oQdn4LiyeJpX0cUMxrtT
         YybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824006; x=1771428806;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=69uHbckydWaKM9z8QoKV1Sspu6MeiIeZoVRM+AIu30E=;
        b=HTNazOXwdalSX1IKasow4LoO+RgWa0Yjxhp1MH3KXsfYI063+5SFPeDIp2FqLSujUm
         wtINUimdU0scK+eFEokEfMGWU0XOay0NBtU+RrCYtwAullLswU34evO1AWZrVHeq9gHF
         kNu+dQm4kWjdd1pjOXndHdOETdbWNewA2vFga7zmW+wHDCLJJCgnAUH9/wHQ7UiR0KiP
         Gyen73iBxyu3CXTTU1dZxnYxn+V+R+rcsrSpstzCkmBhW1vdTauGMxel2+4o/Y4ZAmC5
         cTw2Vrd7IHCDM4c2qwNqohc41HGzT/VH1jgFQiZyGDLCErf8sgdS6fA/4f3B1KsX4Kfx
         B0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWb4WQp1BoMKHhGK1Mdc1qLRAL3CLKP7NvO98wmba7qwmLFZJerQDhRyjj4f3+iEGCoFN53nAGRxi2RUq2DPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAajR9WhqPCnnxVPE57AOMY1Gdm8aIOCC3ECOMBO7dQQ8BdxdS
	jFd/7zRAmZ4ggdbDQLtHaNO3X6FNiBsfOwN0XEJ/rnZXDmppteepyPxgp+rn1yJqv5i3b1FUYSp
	p/WJOsSIJo2V//1RgZA==
X-Received: from wmpf29.prod.google.com ([2002:a05:600c:491d:b0:480:6a27:9ec2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-4835e2cd408mr35661225e9.36.1770824006380;
 Wed, 11 Feb 2026 07:33:26 -0800 (PST)
Date: Wed, 11 Feb 2026 15:33:25 +0000
In-Reply-To: <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora> <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
Message-ID: <aYyhRThN3F76oiWt@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 09:45:37PM +0800, Gary Guo wrote:
> On Wed Feb 11, 2026 at 8:22 PM CST, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> >> On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> >> > On Wed, 11 Feb 2026 11:47:27 +0100
> >> > Philipp Stanner <phasta@mailbox.org> wrote:
> >> >=20
> >> > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> >> > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> >> > > > Philipp Stanner <phasta@kernel.org> wrote:
> >> > > > =C2=A0=20
> >> > > > > +/// A jobqueue Job.
> >> > > > > +///
> >> > > > > +/// You can stuff your data in it. The job will be borrowed b=
ack to your driver
> >> > > > > +/// once the time has come to run it.
> >> > > > > +///
> >> > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (o=
wnership transfer).
> >> > > > > +/// You can set multiple [`DmaFence`] as dependencies for a j=
ob. It will only
> >> > > > > +/// get run once all dependency fences have been signaled.
> >> > > > > +///
> >> > > > > +/// Jobs cost credits. Jobs will only be run if there are is =
enough capacity in
> >> > > > > +/// the jobqueue for the job's credits. It is legal to specif=
y jobs costing 0
> >> > > > > +/// credits, effectively disabling that mechanism.
> >> > > > > +#[pin_data]
> >> > > > > +pub struct Job<T: 'static + Send> {
> >> > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> >> > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> >> > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> >> > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> >> > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>=
>,
> >> > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> >> > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> >> > > >=20
> >> > > > Given how tricky Lists are in rust, I'd recommend going for an X=
Array,
> >> > > > like we have on the C side. There's a bit of overhead when the j=
ob only
> >> > > > has a few deps, but I think simplicity beats memory-usage-optimi=
zations
> >> > > > in that case (especially since the overhead exists and is accept=
ed in
> >> > > > C).=C2=A0=20
> >> > >=20
> >> > > I mean, the list is now already implemented and works. Considering=
 the
> >> > > XArray would have made sense during the development difficulties.
> >> >=20
> >> > I'm sure it does, but that's still more code/tricks to maintain than
> >> > what you'd have with the XArray abstraction.
> >>=20
> >> The solution than will rather be to make the linked list implementatio=
n
> >> better.
> >>=20
> >> A list is the correct data structure in a huge number of use cases in
> >> the kernel. We should not begin here to defer to other structures
> >> because of convenience.
> >
> > Rust vs C aside, linked lists are often used in the kernel despite not
> > being the best choice. They are extremely cache unfriendly and
> > inefficient; most of the time a vector or xarray is far faster if you
> > can accept an ENOMEM failure path when adding elements. I have heard
> > several times from C maintainers that overuse of list is making the
> > kernel slow in a death from a thousand cuts situation.
>=20
> I would rather argue the other way, other than very hot paths where cache
> friendliness absolutely matters, if you do not require indexing access th=
en the
> list is the correct data strucutre more often than not.
>=20
> Vector have the issue where resizing requires moving, so it cannot be use=
d with
> pinned types. XArray doesn't require moving because it requires an indire=
ction
> and thus an extra allocation, but this means that if you're just iteratin=
g over
> all elements it also does not benefit from cache locality. Using vectors =
also
> require careful management of capacity, which is a very common source of =
memory
> leak for long running programs in user space Rust.

XArray does benefit somewhat from cache locality compared to a linked
list because you know the address of element i+1 even if you have not yet
retrieved element i, which may enable prefetching to happen.

Alice

> Re: the ENOMEM failure path, I'd argue that even if you *can* accept a EN=
OMEM
> failure path, it is better to not have a failing path that is unnecessary=
.
>=20
> Best,
> Gary
>=20
> >
> > This applies to the red/black tree too, by the way.
> >
> > Alice
>=20
