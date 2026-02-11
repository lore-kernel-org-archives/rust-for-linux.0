Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6201D7E42
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770814331; cv=none; b=lSbCP57aITqFxfH8Y41NISlOQpB+7W8RzMI9JC6jAqpcCnNQYv1iNieybpMwAxEsvPuW188d0n7QFGhGsRr2reWRMYUNRxxsn424JqwXjIGc1mtw0CbYu0BMBJIytk/4ZHqgKdNQm+B1r7FGsO2ZcB/7z9B31CNJXs2/Sxhxqj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770814331; c=relaxed/simple;
	bh=x3Lbw63yOI0dsAlzCOoI4S/tRd2ag22kVmVpghQuSY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PLWjcpARqxFgcUG71jWUzhfjsGN5H9cA8sogOlmg+0s021/gn+i7KFWNLNgHc9DMVPIZ2D2DHT6uL19F5tU8NRp+RfoFP0m1kzeGhCj91CiouqvMINO4bmCYVv4oyVgN6cH6dudP5xCctHxgIBM6HkXYHldSRWot2ds/Jif6F9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcBcXY21; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcBcXY21"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65828f603ecso7331234a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770814329; x=1771419129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Lbw63yOI0dsAlzCOoI4S/tRd2ag22kVmVpghQuSY8=;
        b=zcBcXY21IZI+Mc5xi9G74LLQVbQ4AB3CUr5/g5+l+UjVROz4q2C9ww033Xi0Udl07z
         20GwPVg4iJu7Ga2PMDeX2IW+ukm8cNMRtZaWoY6m8ZMT8z8xr23UrPG8w8zz/LzFxei/
         WrjvnAqwgxxUYNNXZeWY+zDh9zSH1jixdzK8aAdZYFmI/ZlWsCfvMJJ49VMze7UE/d/o
         x/xMwwTiZ30hibaD/WJg/9JqbzPevOBruaFUAavy8r9zI6sY9DR86cvbD9jV19HfcA8u
         Lz1Sv/BW3dI9/UaxopBhLBTYvfnGTaKFKk6hPBJydlSB2Sm2IlIhalI+jVoIJfc56Eev
         J5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770814329; x=1771419129;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3Lbw63yOI0dsAlzCOoI4S/tRd2ag22kVmVpghQuSY8=;
        b=J78iU5QVQwD2BpJO5p/5BEUxRyIDxUDL8EeF0w4O3Wnt2LavtvsHo91MXUPZNVHZVJ
         +m3bJFyxBbKzBVT09CkFUZf/XpZ2YevtayT1RXrHw+mjpSQzy5iBtkvHf3vWGQOu56zg
         to9EWRUR6h4tRjblwKO0jVRk78OEd7dPnmt09lpmDweJNzKp9EilzduPLtkNc1XuX6sU
         P0+TZ6cp/eM1GZvGpC1hbEV/cuwpnP+/vFSaN2mI6R8oFM8X5HhTHDAqi70aPUQDMjMj
         WEq2rdpGASdpaScxJZ9FIfXOC6L2CbhQtGJByfPMvYCyt22+rBFGyk42rx6/uHV66SnP
         KS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeLU1QjSpJqWG0bXjZZERYeebfFjF7mYBI230tn/xiDjfzGCDm0e3JYLDW9rq8cIgQk5N9Q2QLXaZdVgzUMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41fQlXIY3q1lqcPefTMCw9PnRajURu4qhK9CRC4et/YJ/WOzp
	ck9rc/vD3GI7/F2vSwBHrs0FNJciXEXRqCuavQqxkni4T4EipAGEbVQYQ/ciWoCbTr+qEhmkip6
	9aIQSPlg0CX5Qe8lLpg==
X-Received: from edqh19.prod.google.com ([2002:aa7:c613:0:b0:64d:3c2c:6061])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d3:b0:65a:4209:f83b with SMTP id 4fb4d7f45d1cf-65a4209f97bmr706226a12.29.1770814328687;
 Wed, 11 Feb 2026 04:52:08 -0800 (PST)
Date: Wed, 11 Feb 2026 12:52:07 +0000
In-Reply-To: <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora> <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
Message-ID: <aYx7d21_hIWP93XW@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 01:44:56PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 12:22 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> > > On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > > > On Wed, 11 Feb 2026 11:47:27 +0100
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > >=20
> > > > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > > > =C2=A0=20
> > > > > > > +/// A jobqueue Job.
> > > > > > > +///
> > > > > > > +/// You can stuff your data in it. The job will be borrowed =
back to your driver
> > > > > > > +/// once the time has come to run it.
> > > > > > > +///
> > > > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (=
ownership transfer).
> > > > > > > +/// You can set multiple [`DmaFence`] as dependencies for a =
job. It will only
> > > > > > > +/// get run once all dependency fences have been signaled.
> > > > > > > +///
> > > > > > > +/// Jobs cost credits. Jobs will only be run if there are is=
 enough capacity in
> > > > > > > +/// the jobqueue for the job's credits. It is legal to speci=
fy jobs costing 0
> > > > > > > +/// credits, effectively disabling that mechanism.
> > > > > > > +#[pin_data]
> > > > > > > +pub struct Job<T: 'static + Send> {
> > > > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>=
>>,
> > > > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > > > > >=20
> > > > > > Given how tricky Lists are in rust, I'd recommend going for an =
XArray,
> > > > > > like we have on the C side. There's a bit of overhead when the =
job only
> > > > > > has a few deps, but I think simplicity beats memory-usage-optim=
izations
> > > > > > in that case (especially since the overhead exists and is accep=
ted in
> > > > > > C).=C2=A0=20
> > > > >=20
> > > > > I mean, the list is now already implemented and works. Considerin=
g the
> > > > > XArray would have made sense during the development difficulties.
> > > >=20
> > > > I'm sure it does, but that's still more code/tricks to maintain tha=
n
> > > > what you'd have with the XArray abstraction.
> > >=20
> > > The solution than will rather be to make the linked list implementati=
on
> > > better.
> > >=20
> > > A list is the correct data structure in a huge number of use cases in
> > > the kernel. We should not begin here to defer to other structures
> > > because of convenience.
> >=20
> > Rust vs C aside, linked lists are often used in the kernel despite not
> > being the best choice. They are extremely cache unfriendly and
> > inefficient; most of the time a vector or xarray is far faster if you
> > can accept an ENOMEM failure path when adding elements. I have heard
> > several times from C maintainers that overuse of list is making the
> > kernel slow in a death from a thousand cuts situation.
>=20
> Interesting. Valid points.
>=20
> It might be a self-accelerating thing. More people have lists on their
> mind because they are so common, with RB trees et al. being relatively
> rare, so they instinctively use them, making them more common=E2=80=A6

Yes, many people assume "list widely used in kernel" implies "list is a
good idea". Unfortunately it is not the case.

> > This applies to the red/black tree too, by the way.
>=20
> Can't fully follow, you mean that RB trees are supposedly overused,
> too?

When I first suggested adding red/black tree abstractions in Rust
several years ago I was told by Greg that I couldn't do it because the
red/black tree was deprecated and no new users should be added.

Later I found that this was more of a not-written-down recommendation
than a full deprecation, and since Rust Binder has codepaths where an
ENOMEM failure path is unacceptable for the map, we did end up adding a
Rust rb tree abstraction after all. But this is where I first heard of
this issue with lists and rb trees.

Alice
