Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88273259C80;
	Wed, 11 Feb 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808074; cv=none; b=Igo/1as7ecV+vDYIUr/L/iGtyGCQgJirtYucLaxJhOQDGW3U6h3NlmJmckXx+edfCFqW+CAocV+X5WnKe3NN22HmiOOsQgEPXqFqMMiLiJwBHJ9poCMDs7Qg6wuBAlUSrCUKom7zB/uE5R0bdb43VNmslfhywnvt0yzaeDcC9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808074; c=relaxed/simple;
	bh=ZC6dm0F2n6e0cmOV1aENiptnf7G/0jntOOM+nlDhO7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iiFHdQ+ftxxz49XpfojQdOzKggTYrG1uhWL1JucENcTprVr8bU3fBFvZfOrKPXgGjlv+KaWV5/vt3dTiyO+SD0tG9kzSAW+jFdxbvz2SMdLzdUQ2HGgNFIV4Ajleqqh2LTd94u82i2ubjf9/M8H43auQ8JPNvcSnTmF/ogOolxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gfv1J/wi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gfv1J/wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770808066;
	bh=ZC6dm0F2n6e0cmOV1aENiptnf7G/0jntOOM+nlDhO7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gfv1J/witDhrKvAe3XegjMbmPixjq2abJ1rnrim54EcRWyIr+2+BPso+/XlnQbAhc
	 XAOh5+ISKja/dwiyWXy3mFMH3sEFW/f9xz3TOLLVhVUpS4Oq3NLcfymVAyIQP1AIgh
	 xeULdBn8w1wLkFGuQJi+l9gAuIgAWBn/Yd1rfmiWBoCom4/MUn+LqhmEnvQdjqf1mH
	 spd4Gd6nfga8FiyHJGoRt5EnBUq1+lWT73xMoGSPRi0RtMo8O0n94ltwTmbVKecsXf
	 amw/YPL8yBfxa1m5IFoq1F95BgvgaDcrhffPY3Vh4LVznNeCfHcj6Q8un2EGltPv8j
	 xc1NlaPQ2ie9g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5A9117E1301;
	Wed, 11 Feb 2026 12:07:45 +0100 (CET)
Date: Wed, 11 Feb 2026 12:07:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211120742.0e9e7122@fedora>
In-Reply-To: <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-5-phasta@kernel.org>
	<20260210155750.5cdbe6cc@fedora>
	<8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Feb 2026 11:47:27 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> >  =20
> > > +/// A jobqueue Job.
> > > +///
> > > +/// You can stuff your data in it. The job will be borrowed back to =
your driver
> > > +/// once the time has come to run it.
> > > +///
> > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ownershi=
p transfer).
> > > +/// You can set multiple [`DmaFence`] as dependencies for a job. It =
will only
> > > +/// get run once all dependency fences have been signaled.
> > > +///
> > > +/// Jobs cost credits. Jobs will only be run if there are is enough =
capacity in
> > > +/// the jobqueue for the job's credits. It is legal to specify jobs =
costing 0
> > > +/// credits, effectively disabling that mechanism.
> > > +#[pin_data]
> > > +pub struct Job<T: 'static + Send> {
> > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>, =20
> >=20
> > Given how tricky Lists are in rust, I'd recommend going for an XArray,
> > like we have on the C side. There's a bit of overhead when the job only
> > has a few deps, but I think simplicity beats memory-usage-optimizations
> > in that case (especially since the overhead exists and is accepted in
> > C). =20
>=20
> I mean, the list is now already implemented and works. Considering the
> XArray would have made sense during the development difficulties.

I'm sure it does, but that's still more code/tricks to maintain than
what you'd have with the XArray abstraction.

>=20
> If it were to make sense we could certainly replace the list with an
> xarray, but I don't see an advantage. The JQ just needs to iterate over
> the dependencies to register its events on them, and on drop to
> deregister them perhaps.
>=20
> We have many jobs, but likely only few dependencies per job, so the
> lower memory footprint seems desirable and the XArray's advantages
> don't come to play =E2=80=93 except maybe if we'd want to consider to avo=
id the
> current unsafe-rawpointer solution to obtain the job, since obtaining a
> job from an Xarray is far faster than by list iteration.

I don't think we need O(1) for picking random deps in a job, because
that's not something we need at all: the dep list here is used as a
FIFO. There's the per-dep overhead of the ListLinks object maybe, but
it's certainly acceptable. And I don't think cache locality matters
either, because the XArray stores pointers too, so we'll still be one
deref away from the DmaFence. No, my main concern was maintainability,
because managing lists in rust is far from trivial, and as a developer,
I try to avoid using concepts the language I rely on is not friendly
with.
