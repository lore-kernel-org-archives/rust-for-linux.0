Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE93612FE;
	Fri,  6 Feb 2026 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376991; cv=none; b=RcCG9qSFTr6s23pkBUKjpMUX37HumbRJGWNCRU+8UC8D25vhRK4JTF2YFb/yecGXDsOQFEIEmAknEhiV0Ed+2yHu0afzn197IA/orj2LN8+D1B7FQOT+XgJH6Hj2EhQXDBj7hOqfrcHURkSVLS9f8BPz8eUqitXnuQAF5IyAGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376991; c=relaxed/simple;
	bh=6wXD6mAlRplT43SZrDzHqzDpt95fasANM63SHkqxKYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXxJwT5PaMQeHhtSlF0wBsYmxKdzTZaENyvOZxhwDbHX+9JNYueCdq3SJOVrziyBtZNiHiVrcz9IizDH/fTwtREoMFDrM2bJ91mo4VVQiNERstfrL61+rwSfP1G9hBZaGw3jnlWhXEyCnQGlwC7ppw7U4V0YFIKOYTlNsy3wNHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F/JGyWbk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F/JGyWbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770376989;
	bh=6wXD6mAlRplT43SZrDzHqzDpt95fasANM63SHkqxKYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F/JGyWbkOxIpZx4vmZazuYzcSFBfjZnyZchDKpmvwCOop6apAYveFcAkQXaLTugqO
	 5/t5pwXrmDjVrCe8vhomcFQgKCzKmCZ4Y+IBU/r/jOE4hzKcLa8ywKkP6rezQ86jth
	 qjtnxsS7SCzXXVEB6pAKV19mb1AnCLwvP4hwh0VFXOgCG6xCeaZ3lfHDUJ6sdRoFUo
	 rVgp8ewsoKKZQHJ3lD1VVM/GyDtYhm2tDUbK/zN+IBBXktur6sIsQcrIbPlv0aAR4o
	 ja8HUUme+uTjNKkxAKCyZkL7nAdBIKIOtyMeBoj/YFIvGofflR5XRgtTdod6rZ7fQK
	 DrTg9QToLnz3Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19A8C17E01E7;
	Fri,  6 Feb 2026 12:23:09 +0100 (CET)
Date: Fri, 6 Feb 2026 12:23:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260206122304.2820c375@fedora>
In-Reply-To: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
	<20260205111635.5307e1fa@fedora>
	<DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
	<62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
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

On Fri, 06 Feb 2026 10:32:38 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Thu, 2026-02-05 at 13:16 +0000, Gary Guo wrote:
> > On Thu Feb 5, 2026 at 10:16 AM GMT, Boris Brezillon wrote: =20
> > > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > >  =20
> > > >  =20
>=20
> [=E2=80=A6]
>=20
> > > > +#[pin_data]
> > > > +pub struct DmaFence<T> {
> > > > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > > > +=C2=A0=C2=A0=C2=A0 /// User data.
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 data: T, =20
> > >=20
> > > A DmaFence is a cross-device synchronization mechanism that can (and
> > > will)
> > >  =20
>=20
> I'm not questioning the truth behind this statement. They are designed
> to do that. But is that actually being done, currently? I recently
> found that the get_driver_name() callback intended to inform the
> consumer of a fence about who actually issued the fence is only ever
> used by i915.

It's also used by the dma-buf layer to expose info about dma-bufs
through debugfs (see dma_{fence,resv}_describe() and
dma_buf_debug_show()), meaning all GPU drivers adding their fences to
the dma_resv of an imported/exported buffer object should expect to
have their ::get_{driver,timeline}_name() implementation called.
