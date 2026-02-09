Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6A37BE7D;
	Mon,  9 Feb 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649130; cv=none; b=GLYt+t7niR3kMauHUiJaCkqzkNCTZovMuVkO6Wt5Uvyu+H5qI42Z9zpobXuAEz30ACZz+qHUZtKEenBQlhfjvWjTKefLIv0NdApdVUPiDmgTiw0VT86UBiINrJgoAv6n+VbUu8ex9U3FFdH6+sDyOVu/ka+4H+xQF8putEffgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649130; c=relaxed/simple;
	bh=UhHGbo2o5nhkn2rj/Bhqu3+jXS+MqUHIC2qBNSWcUcE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0uqDDKv80C3S9ywGsOXrmi7bA/bJIyKBjapckZQxJOdDZMePtrw2RX5KEh/2lDFLFsTdcWaRnpef+BQMFYVE7lX1kGaW4JzBcAa5ZouSwDKbetrX9RwkTx9OzXYowHaoNInUTL1q1ENP72CqY/ZtvTQRM4fy64RqVnLVFr/vqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GpB2RZAi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GpB2RZAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770649128;
	bh=UhHGbo2o5nhkn2rj/Bhqu3+jXS+MqUHIC2qBNSWcUcE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GpB2RZAi5I+r5P9VmYjqN9c5+tDOwUSmpc3S34r/kS2xrkHsdntQyuD84KkuRRQhv
	 LhaCiu7GZSjuD08D5Hhjrw0e4gidJXcB/Y6Lur6EFqrO7vWnPjaM+U/xPge+0rI7iP
	 n99pEJUS347UtuqVnPZqwbzT65/yBVpAUZbVEKuZ9mhRUUQD4FAUoMUivNrDw+9BFt
	 IOznpeEoSHd9wPOl07Z0+PgKulF9A8OClNf3/50tV3KGlQTwds0rJYSoh7zRjtD0iu
	 UtthqJPCNphKARXLIK1mlXioe4zG3kE/dtdIEAvKIFyFVJU0DehNfuBnziQPtqsXe7
	 Ojc5clpKf006g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87D1417E13D5;
	Mon,  9 Feb 2026 15:58:47 +0100 (CET)
Date: Mon, 9 Feb 2026 15:58:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260209155843.725dcfe1@fedora>
In-Reply-To: <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
	<20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
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

On Mon, 09 Feb 2026 09:19:46 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> > On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote: =20
> > > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > > Unfortunately, I don't know how to translate that in rust, but we
> > > need a way to check if any path code path does a DmaFence.signal(),
> > > go back to the entry point (for a WorkItem, that would be
> > > WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> > > Not only that, but we need to know all the deps that make it so
> > > this path can be called (if I take the WorkItem example, that would
> > > be the path that leads to the WorkItem being scheduled). =20
> >=20
> > I think we need a guard object for this that is not Send, just like for=
 any
> > other lock.
> >=20
> > Internally, those markers rely on lockdep, i.e. they just acquire and r=
elease a
> > "fake" lock. =20
>=20
> The guard object would be created through fence.begin_signalling(), would=
n't it?

It shouldn't be a (&self)-method, because at the start of a DMA
signaling path, you don't necessarily know which fence you're going to
signal (you might actually signal several of them).

> And when it drops you call dma_fence_end_signalling()?

Yep, dma_fence_end_signalling() should be called when the guard is
dropped.

>=20
> How would that ensure that the driver actually marks the signalling regio=
n correctly?

Nothing, and that's a problem we have in C: you have no way of telling
which code section is going to be a DMA-signaling path. I can't think
of any way to make that safer in rust, unfortunately. The best I can
think of would be to

- Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
  constraints) that's designed for DMA-fence signaling, and that takes
  the DmaSignaling guard around the ::run() call.
- We would then need to ensure that any code path scheduling this work
  item is also in a DMA-signaling path by taking a ref to the
  DmaSignalingGuard. This of course doesn't guarantee that the section
  is wide enough to prevent any non-authorized operations in any path
  leading to this WorkItem scheduling, but it would at least force the
  caller to consider the problem.
