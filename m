Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168623;
	b=IXdj0qNSZwUxKms8H4oDGtT1GaLJUtie3c+aHGYJK3eIv+VvJ2XLGqtXU2J/OdSVD+ev
	 tEgwB0UU35iFI9TEF9XfRiVQsBLSbXKxAH0OyHVnjMx1BEf+2uktL47y7zAY1JC+RQrp/
	 FJtHtVySRBx16vUkytTkqWKBBgdHbwglA/7XWyvUeasBPkXKvTu5csGSiZhr9lZKuBlhF
	 1VCIqsbg/roHv+VgsqHHBQw1klM7+lnV+k7GjzBez44BoDyVT7Z4STNjCZ5mj3uXBzNU1
	 cEyazWMha1fYxa3ct75nLgiQiwPQzjC1O8RbaR99YRnoYKZjX6t03WKBc/1vRK2TW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168623;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Cg+JYMIbYA1TsfRL6dKXWHelZNK7UqPJlxusfieTFqs=;
	b=vzIRvggY9lpdcxJjHOLZEAOis+XwB1/EtxIZG70tW+M1f38uThpQ5KQsRJWiMxgvJ2+n
	 iqqtRvMibfsLs5czQLRZZmJoCFci9LLbwyAlNr9FJbw4Hjs2re14rOtK5dz8ZuR/9wYwZ
	 YgTumB9+Oc6QD4QryGdHXEPrhfNDLsakzrdmfIIZXaI2ddG/WX21CRVA0tuB4V/jrsu6+
	 sROezPMzAhvSuEK+6+q39wD54PKVLK8ITzoTb3H5uu+N8OjCSGyxcCnrD4S3ITzuSsyn9
	 Qqw/F+O1pbeAvjleWpQUyNbeXacfY39qN7YgHLKxANI3edVX8/HyZX+zbeyEdVJIGPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=T1TCU7pz;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCC606A326
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 09:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CCC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=T1TCU7pz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795168620;
	bh=kVuErGnzgjCpfRpl9ChLGXyTSW00UJKEHoErDw4aJWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T1TCU7pzZKeBzmfnB9+i3hcVq4LBFdMb6uYfuP4tcBM9RkZC6gzfe9quShSZK44/W
	 XfgMrehpUq7Me1mRcmTHWQ+GMAppSYHRBpkXrj0Y6kFFN2gNtz+70wYT5pLGvRlCEX
	 vGQvLuoAurkR6uNhDTG4/MP8/8Xt/P9T0OYv+9+OwurJhhDhBc/fqs0RaEz9MYsOsQ
	 BOXZy1CLoJy83q5pdS+zFUwP9FhadiJ7cb1RaD6ySZzXgn4FVGWFVrPwR0lszhRr+5
	 s/gOoKYsBRyUFJHaWn2EKdSsga/KfoPBQ/YgOKvy/z4ondc1Q4mC4QtNTraV1NXJaN
	 CSfOs3HXZ/GHw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6CAC17E0630;
	Fri, 20 Nov 2026 10:56:59 +0100 (CET)
Date: Fri, 20 Nov 2026 10:56:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, Akash
 Goel <akash.goel@arm.com>, Karunika Choo <karunika.choo@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/panfrost,panthor: Refuse to export WB_MMAP BOs
Message-ID: <20261120105654.63e1c254@fedora1.home>
In-Reply-To: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
References: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maira,

On Thu, 19 Nov 2026 16:38:15 -0300
Ma=C3=ADra Canal <mcanal@igalia.com> wrote:

> This series follows up on the discussion in the V3D cached maps series
> [1], about how to handle CPU-cached BOs that are shared through dma-buf.
>=20
> As pointed by Faith and Boris, when a buffer is shared through dma-buf,
> there's no way to ensure that a client will properly bracket their CPU
> accesses with DMA_BUF_IOCTL_SYNC. With WC mappings, waiting on fences is
> enough to guarantee consistency. However, with WB mappings, a missed sync
> can leave dirty cache lines behind, which another client can end up
> writing over.
>=20
> PanVK already keeps WB_MMAP BOs private, so this series only makes the
> kernel enforce the same policy on Panfrost and Panthor. As WB_MMAP BOs can
> no longer be exported, the custom dma_buf_ops providing begin/end_cpu_acc=
ess()
> are no longer needed for them and are replaced by the default PRIME ops.
>=20
> - Patch 1 adds the drm_gem_shmem_sync() helper, taken from [2].
> - Patches 2 and 5 refuse to export WB_MMAP BOs in Panfrost and Panthor.
> - Patches 3 and 6 drop the custom dma_buf_ops from Panfrost and Panthor.
> - Patch 4 converts Panfrost to drm_gem_shmem_sync(). V3D will also use it
>   to implement its cached maps, which I'll send in a separate series.
>=20
> Patches 3 and 6 need some extra attention as they aren't a no-op on
> IO-coherent GPUs. In this case, all BOs are CPU-mapped WB, and the custom
> begin/end_cpu_access() could be used to sync the mappings of non-coherent
> importers.

Ah, I completely forgot about this, thanks for the reminder. If we have
a system where the GPU is IO-coherent, but the video decoder or the
display controller isn't, we either need to force CPU-uncached
mappings for everybody with extra forced syncs on the UMD side for that
case (right now we assume that IO coherent implies always-WB IIRC), or
we need CPU access signalization with a proper begin/end_cpu_access()
implementation to keep things consistent when cross-dev sharing is
involved. I think this was the very reason I decided to keep the
begin/end_cpu_access() implementation in panfrost/panthor in the first
place.

Note that the same problem can exist if the other device is the
exporter and is IO coherent, but the GPU isn't. If the exporter were to
expose CPU mappings as cached without proper sync hooks, we'd face the
same problem. One way to avoid it would be to never CPU map imported
buffers in mesa, but IIRC, that's not an option.

>=20
> However, I decided to send these patches either way because they only
> restore the behavior prior to commits 3ae6637378e6 and 925ad0c26dd8, which
> is what we discussed in [1] (IIUC). Also, Mesa writes through the GEM mmap
> without DMA_BUF_IOCTL_SYNC, so it never relied on these hooks anyway.

Mesa doesn't, but there might be other elements in-between (video
decoder, and some custom layers analyzing/touching frames from the CPU
before they're passed to the GPU). I get the "it used to work" argument,
but I'm worried we're going backwards here. I also hate the fact we're
going back to a "broken" implementation without even updating the dmabuf
docs to explain that this sync-around-CPU-access mechanism is
deprecated/fragile/broken and shouldn't be relied on.

>=20
> Still, if you think this would be problematic, I can drop patches 3 and 6.

I was about to suggest forcing uncached CPU mappings for shareable BOs
on systems where the GPU is IO coherent, but there's actually no way we
can know whether a BO will be exported on not on Panfrost (on Panthor
we at least have this exclusive_vm thing that gives this guarantee). So
there's actually no way around it, it's either going back to a "broken"
state (broken in the sense it's not doing what it's supposed to, but no
one really complained in the past) or keep this sync logic to try to do
our best (even if it's not entirely safe, especially if the importer
does crazy stuff like pretending to be UMA when it's not).

Sorry for not having a better answer than: it might be okay, but it
looks wrong. Every time I tried to understand what's expected from us
for this shared buffer synchronization, I ended up more confused than
before...

>=20
> The Panthor changes were tested on hardware, but Panfrost changes were
> only compile-tested.

Could you prepare a custom gfx-ci kernel [1] so we can check that mesa
CI is not regressed by this change? I know none of the tests in mesa CI
would normally hit the removed logic, but better safe than sorry.

Regards,

Boris

[1]https://gitlab.freedesktop.org/gfx-ci/linux
