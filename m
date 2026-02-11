Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F653161B2
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812527; cv=none; b=QS5oV1ePDHmgXkDOe5v0049Bg2KM8ZF+/CLhH9C2uN/PUXlZodrC8o75xkO5pVA/ObTUkjrQ3GLo4UPjeyjBnCJlNkIs54d9G53RqsO+NQ01kSKR2fmn82UNhE3f+xPloSga7zkREFxscsLc76jhEAl78icCQEUUZRh94IuZ5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812527; c=relaxed/simple;
	bh=ux5jpTmdkj1HTNBhdFzkT0KL7QZx+1iaLGF6Z9eCsjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X3nrDe6zmZRQw8RPem+qliYlPI6wZ771lZCNyhEb3wL3bgc1pPu4MlVPf0ZZdNAD8zXJiL6edEN0/72RTYL5jn2WWd9oH6roIsuc2awyPo1/uxnnVoysJYAkUTE3ZvsWVSThyAqBvPmxqo0tOqANNMolSe5nZaoDnx5ixOc+d7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SgiXvh1A; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SgiXvh1A"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48336b182ebso26750275e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 04:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770812525; x=1771417325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux5jpTmdkj1HTNBhdFzkT0KL7QZx+1iaLGF6Z9eCsjc=;
        b=SgiXvh1AEqZZjBP+fJyR5dW3pVpE1CJqYVXC+jUaVst07gG1jP/SSkdY+eGc0mTVtV
         vrbvT9rIO/QFAguiTvWNpkdzV0EiPn2P+Wfh3jWOhCav12FbAEB7OwdYsyG98bybpuf7
         /s3DAsASu3DxyMttJM0/d68pRqaesJ1RPlhdES1G4rm1P+7o0XN0wZt/xrXKpEPaPgyB
         PMfBkvy3ZyeKwvlZIFalaZPN23J2Uv3PRO5wh8mngy1z3GUhkJkrO4xbBOjwQ5gVE8zE
         RYVbXNQTc0I3+2Io5N9DCFX/E2w101s4NE0DR2fzVGHe1XJuiPXO2+RiQsmNyfDJKk7c
         +DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770812525; x=1771417325;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ux5jpTmdkj1HTNBhdFzkT0KL7QZx+1iaLGF6Z9eCsjc=;
        b=Tr2e1XpORIv8s+L80jkBX08gHCxwwGnAjCIFLbaAW2jwVVmLZ3Yjckq+VytwjRaxMx
         PaDz/K0aXnIOJL7UjXj8YzUaiKb3C4MxxolnmzjhJ5eGSNWYmGF9CbohpQp546idBd5+
         1uUPvCorH5DUVhmSCpYxK3bFU+OUfNLXquQ10bbBDjygrxNjQK6AmK7l3swwZBjtkS7x
         YK3ZB+SFYe3RJwQt7kdpydRgGm6qpKPxjA/Mh5JrdRZiEQO0CxCpezBzqsaBVLKKodmi
         BzotTyXbl4T6h8KEcnLyT6GHXshkaRKYOFyJatpNk7xuPDpgAY0KgizzNf0uSXTgKOui
         1qIA==
X-Forwarded-Encrypted: i=1; AJvYcCUexRC1nSidIlRQVhPnZnFeI8bw02YaepTFRdHpWTPzbGbs/NeEEYApOW2eF4vdrwH4P5RPPvdZPfelqPsDtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47ps0K9fZs0QQsRA+XcBqUvEXvCU92rm34gjj+YitiS+tUzbb
	5hMc4HsbT5N6Vy4CDK3B+0YmumH53oA7Y06GErWcuv9Vt457FsbUL+95Exqdi0f563GHCai29DH
	F0zpvaIVY8PIKYiQG6w==
X-Received: from wmbe3.prod.google.com ([2002:a05:600c:5903:b0:480:694a:dd63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c7:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483201dd0afmr240550065e9.5.1770812524805;
 Wed, 11 Feb 2026 04:22:04 -0800 (PST)
Date: Wed, 11 Feb 2026 12:22:03 +0000
In-Reply-To: <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora> <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
Message-ID: <aYx0a-2eANbM_vnd@google.com>
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

On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 11:47:27 +0100
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > =C2=A0=20
> > > > > +/// A jobqueue Job.
> > > > > +///
> > > > > +/// You can stuff your data in it. The job will be borrowed back=
 to your driver
> > > > > +/// once the time has come to run it.
> > > > > +///
> > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (owne=
rship transfer).
> > > > > +/// You can set multiple [`DmaFence`] as dependencies for a job.=
 It will only
> > > > > +/// get run once all dependency fences have been signaled.
> > > > > +///
> > > > > +/// Jobs cost credits. Jobs will only be run if there are is eno=
ugh capacity in
> > > > > +/// the jobqueue for the job's credits. It is legal to specify j=
obs costing 0
> > > > > +/// credits, effectively disabling that mechanism.
> > > > > +#[pin_data]
> > > > > +pub struct Job<T: 'static + Send> {
> > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > > >=20
> > > > Given how tricky Lists are in rust, I'd recommend going for an XArr=
ay,
> > > > like we have on the C side. There's a bit of overhead when the job =
only
> > > > has a few deps, but I think simplicity beats memory-usage-optimizat=
ions
> > > > in that case (especially since the overhead exists and is accepted =
in
> > > > C).=C2=A0=20
> > >=20
> > > I mean, the list is now already implemented and works. Considering th=
e
> > > XArray would have made sense during the development difficulties.
> >=20
> > I'm sure it does, but that's still more code/tricks to maintain than
> > what you'd have with the XArray abstraction.
>=20
> The solution than will rather be to make the linked list implementation
> better.
>=20
> A list is the correct data structure in a huge number of use cases in
> the kernel. We should not begin here to defer to other structures
> because of convenience.

Rust vs C aside, linked lists are often used in the kernel despite not
being the best choice. They are extremely cache unfriendly and
inefficient; most of the time a vector or xarray is far faster if you
can accept an ENOMEM failure path when adding elements. I have heard
several times from C maintainers that overuse of list is making the
kernel slow in a death from a thousand cuts situation.

This applies to the red/black tree too, by the way.

Alice
