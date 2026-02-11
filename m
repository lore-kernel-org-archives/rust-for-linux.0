Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CB367F4D;
	Wed, 11 Feb 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805258; cv=none; b=LtcbJqHIEhfEJGQoqNZQg5lhitb6qcrxfOhFk6cSTbW3BAcfSf6SPRrIFv1Fh0v5ccIfUd9bnGUH2xv7lbZK0foTBiVKHNlPy7nvqhQMETxCDrRK4TO6f7sbqJfR5qduKLxjU3HiMxTD1P6RUHA7iu9EXgkNeiVxgTsj+1mnItk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805258; c=relaxed/simple;
	bh=45pfldhdQt4T85eRrojkPS8/DdzI6gG/B7+MIFv4muM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKSzrIIodoUlkDMmBGeM6U+II1qvhHescDuUpwyHYTU5og0jgjj6ZMMI6Ynz6Qlix6AleEzk0n5nyj4mkcbbARSg8/kkn/3nfGX5CcpnOQDwEaznJQkdWulPVAncuVXnacHVZ4wWWWm2xivqerACJlstOcwS/xi9g+ZaFBMf438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H4zxtajf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H4zxtajf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770805254;
	bh=45pfldhdQt4T85eRrojkPS8/DdzI6gG/B7+MIFv4muM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H4zxtajfqECIycH3sO3zivvzj1OVPoLEddAY7m4nJ5dTjjy1Rjn8/HnC1Lapde9WE
	 dXG/0QY23yPReUt7NvqqR1u6ZWbNyIm4BV+3NRBpE83WBrEO8SE7SC+PnaS+XfkEyp
	 BACnj6VSqpJ7xCSAK9fgmK0rulpBofw0r45on5gk75spSz7XpUDSbrqr+GhQwVSIc6
	 s7h7ssBLjGXDLwjKFZa6abk2TXhNeT+ouxXO+ckRhNsVD+Jc52fNeps0FKZVc0GZfH
	 ZKg0VhEN/7d+vQF2Uop5uswPgphah2ttwRTQx6mmHLmHUhcnca4lC0vF2CwArfCXMb
	 rIoRiJ4b5EVCw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0094E17E1301;
	Wed, 11 Feb 2026 11:20:53 +0100 (CET)
Date: Wed, 11 Feb 2026 11:20:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211112049.089b2656@fedora>
In-Reply-To: <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
References: <20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
	<4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
	<aYsZHhX2IVO2kOSm@google.com>
	<DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
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

On Wed, 11 Feb 2026 10:57:27 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> (Cc: Xe maintainers)
>=20
> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote: =
=20
> >> On 2/10/26 11:36, Danilo Krummrich wrote: =20
> >> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote: =20
> >> >> One way you can see this is by looking at what we require of the
> >> >> workqueue. For all this to work, it's pretty important that we never
> >> >> schedule anything on the workqueue that's not signalling safe, since
> >> >> otherwise you could have a deadlock where the workqueue is executes=
 some
> >> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> >> >> meaning that the VM_BIND job never gets scheduled since the workque=
ue
> >> >> is never freed up. Deadlock. =20
> >> >=20
> >> > Yes, I also pointed this out multiple times in the past in the conte=
xt of C GPU
> >> > scheduler discussions. It really depends on the workqueue and how it=
 is used.
> >> >=20
> >> > In the C GPU scheduler the driver can pass its own workqueue to the =
scheduler,
> >> > which means that the driver has to ensure that at least one out of t=
he
> >> > wq->max_active works is free for the scheduler to make progress on t=
he
> >> > scheduler's run and free job work.
> >> >=20
> >> > Or in other words, there must be no more than wq->max_active - 1 wor=
ks that
> >> > execute code violating the DMA fence signalling rules. =20
> >
> > Ouch, is that really the best way to do that? Why not two workqueues? =
=20
>=20
> Most drivers making use of this re-use the same workqueue for multiple GPU
> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship be=
tween
> scheduler and entity). This is equivalent to the JobQ use-case.
>=20
> Note that we will have one JobQ instance per userspace queue, so sharing =
the
> workqueue between JobQ instances can make sense.

Definitely, but I think that's orthogonal to allowing this common
workqueue to be used for work items that don't comply with the
dma-fence signalling rules, isn't it?

>=20
> Besides that, IIRC Xe was re-using the workqueue for something else, but =
that
> doesn't seem to be the case anymore. I can only find [1], which more seem=
s like
> some custom GPU scheduler extention [2] to me...

Yep, I think it can be the problematic case. It doesn't mean we can't
schedule work items that don't signal fences, but I think it'd be
simpler if we were forcing those to follow the same rules (no blocking
alloc, no locks taken that are also taken in other paths were blocking
allocs happen, etc) regardless of this wq->max_active value.

>=20
> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe=
_gpu_scheduler.c#L40
> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe=
_gpu_scheduler_types.h#L28

