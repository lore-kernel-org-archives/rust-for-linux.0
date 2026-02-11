Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5035028E;
	Wed, 11 Feb 2026 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808807; cv=none; b=qziNUAZOsFyQkps9y9LjjTDqq6cj8bS9O72M9VRdcidPfyz6UNdLrGI0C2HJDwtCH/y7zVKc2jwQHws7NpdGhG9rESq0LZF+wkUYXae29aRlCMI8lOAf8SJ66CyA+oenl80/5j/xvHL6RryqI0K8lw1z3mbFLR8Asi9u06AWEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808807; c=relaxed/simple;
	bh=t2RO4Zt+tZSj4yaJqxsQjogFSIU1IypD1KbV45wbRMM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oa7tWnkskOsK3UATHHCixBImjA6dZKVI5hY++lWK0CrWniJvSvGNrqV7b5DGjg7jsCA/5jNLbXghGzZUeLJgzdD0GJI2dQrzMOxQXX4ewasoqpckqELZkYQR9tODF1pMHeT9D9ZaV77e/U/HCwF0RUIinpSY9fCH4Ww6SO2T9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I95V4l5t; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I95V4l5t"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9wvP52gtz9vBc;
	Wed, 11 Feb 2026 12:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770808801; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyD+2ATM9NoCWFlgtOgiTkdsssKuDn3OmQ6kuJKWcKs=;
	b=I95V4l5tlpC6ZDniN6BxoEUybUSt1UBZuH3N2rnPdzX+rEG82IEvuJ1tORXfuXC/xqT+rG
	7Obw5bIramSh2OJXyk8K0cHsSO2/NfsBNdJu80O8Ows7G/NSjKlBAbTeaUgMzta+UclLdv
	GpULim0qMHxvGtCY+nA4KaXL7E8jL7a1gAU33Enw84oroTf8tODg/yUwsqnqqgYhToTyVg
	XbrtdvIp24RBWEHHJjV4ih7EgTmb/mxd9Cqtmrxy+rO3ZQI3CJaVPh486FK9kCQF79Abgf
	CFp+RCzESkM6oBQFVOx7/YQ3P/TunmLIFVctkuyiwXCKkY0lzZDvRL6x2y87+Q==
Message-ID: <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 12:19:56 +0100
In-Reply-To: <20260211120742.0e9e7122@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
	 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	 <20260211120742.0e9e7122@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: wfa8wetjy5hckf9yhr1pezh8hkujsg1x
X-MBO-RS-ID: ccf7d9f4b3d04bfc014

On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 11:47:27 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > > =C2=A0=20
> > > > +/// A jobqueue Job.
> > > > +///
> > > > +/// You can stuff your data in it. The job will be borrowed back t=
o your driver
> > > > +/// once the time has come to run it.
> > > > +///
> > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (owners=
hip transfer).
> > > > +/// You can set multiple [`DmaFence`] as dependencies for a job. I=
t will only
> > > > +/// get run once all dependency fences have been signaled.
> > > > +///
> > > > +/// Jobs cost credits. Jobs will only be run if there are is enoug=
h capacity in
> > > > +/// the jobqueue for the job's credits. It is legal to specify job=
s costing 0
> > > > +/// credits, effectively disabling that mechanism.
> > > > +#[pin_data]
> > > > +pub struct Job<T: 'static + Send> {
> > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > >=20
> > > Given how tricky Lists are in rust, I'd recommend going for an XArray=
,
> > > like we have on the C side. There's a bit of overhead when the job on=
ly
> > > has a few deps, but I think simplicity beats memory-usage-optimizatio=
ns
> > > in that case (especially since the overhead exists and is accepted in
> > > C).=C2=A0=20
> >=20
> > I mean, the list is now already implemented and works. Considering the
> > XArray would have made sense during the development difficulties.
>=20
> I'm sure it does, but that's still more code/tricks to maintain than
> what you'd have with the XArray abstraction.

The solution than will rather be to make the linked list implementation
better.

A list is the correct data structure in a huge number of use cases in
the kernel. We should not begin here to defer to other structures
because of convenience.

Btw. lists in Rust being so horrible has been repeatedly a reason why
some other hackers argued that Rust as a language is not suitable for
kernel development.

So getting that right seems more desirable than capitulating.

>=20
> >=20
> > If it were to make sense we could certainly replace the list with an
> > xarray, but I don't see an advantage. The JQ just needs to iterate over
> > the dependencies to register its events on them, and on drop to
> > deregister them perhaps.
> >=20
> > We have many jobs, but likely only few dependencies per job, so the
> > lower memory footprint seems desirable and the XArray's advantages
> > don't come to play =E2=80=93 except maybe if we'd want to consider to a=
void the
> > current unsafe-rawpointer solution to obtain the job, since obtaining a
> > job from an Xarray is far faster than by list iteration.
>=20
> I don't think we need O(1) for picking random deps in a job, because
> that's not something we need at all: the dep list here is used as a
> FIFO.
>=20

Wrong. The dep list here has no ordering requirements at all. JQ does
not care in which order it registers its events, it just cares about
dealing with dep-fences racing.

You could (de-)register your callbacks in random order, it does not
matter.

List and Xarray might be useful for the unsafe related to the
DependencyWaker. There you could avoid a raw pointer by getting the job
through a list iteration or through the hypothetical XArray.

Please take a look at my detailed code comments for DependencyWaker.

>  There's the per-dep overhead of the ListLinks object maybe, but
> it's certainly acceptable. And I don't think cache locality matters
> either, because the XArray stores pointers too, so we'll still be one
> deref away from the DmaFence. No, my main concern was maintainability,
> because managing lists in rust is far from trivial, and as a developer,
> I try to avoid using concepts the language I rely on is not friendly
> with.

This would be a decision with wide implications, as detailed above.

If we were to admit that lists just don't work in Rust, then wouldn't
the consequent decision to remove them all together?

"Lists in kernel-Rust are not supported. Too difficult to maintain.
We're sorry. Use XArray et al. instead :("
