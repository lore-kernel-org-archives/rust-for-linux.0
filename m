Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C193161BA;
	Tue, 10 Feb 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726524; cv=none; b=uMOtMh/37VH+In3BL5y9BqIeCLEIBBemtgtJPVzAZyeMQl9wOV89MWF3ccQTjmHOKh9gLEyYHfA2BgsALppBx/sIVXhZYIoiKwBL39tEy643jc2j6sGlaafJyxrJc4f7gS4aRfI7/GQqzubG2gvQ5peh7rpcj5qxpvujMUtc3B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726524; c=relaxed/simple;
	bh=FLS3/kP8QNaAJIcU5QfuE/SgjLKs1Kb/tNgU66Xmnmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfLTZMfYNfNAfV6JcjwzGQ4TfNbro7pjDX1I9wXm1CqTT2R9aKzSV+Q8/b5leROu9OeeBM9wLXBT8agg0QdUd5n+E9h9pWEORIKjT7/yQbaZ0iF4ZoP6MNLkAbAg2qd6gSGACQzKRGus3Yv2RoLhM1ZNrWa8rwDw70jEvKJEMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I28KAais; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I28KAais"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770726521;
	bh=FLS3/kP8QNaAJIcU5QfuE/SgjLKs1Kb/tNgU66Xmnmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I28KAaisV8FMwZNssMO9y1nG7vtp9e0aLYGSWkgetzPbq6DYtP6eIExe/hXcSuEuv
	 Ft+Ehh348P2LqwA5OJ2RBCt10dUbpY/gusNAAbQAtR9pFEy5Yoix39P9xdc3pShGpR
	 e5ugNPXhK7gc+wP/q6RbhtaKjwht6jilkB1RSlrY1rMgncOP05/EnuaScSK/yW4ReA
	 3aMpx/eZomchHSOC2KDkk1l9oXi52j4hV053HT3JJbZkKdVoQHaJ6p4NF1wijRhwBY
	 KGojXvEx+imCdu96hzw8DeCbYvKZ3TCBTFZyr+vC5QfOnXaxIbqmyxhw7gUncueWCZ
	 v6okco0qL3UFA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A2C817E126B;
	Tue, 10 Feb 2026 13:28:41 +0100 (CET)
Date: Tue, 10 Feb 2026 13:28:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@mailbox.org>,
 phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260210132837.26f7e7bc@fedora>
In-Reply-To: <aYsZHhX2IVO2kOSm@google.com>
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

On Tue, 10 Feb 2026 11:40:14 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
> > On 2/10/26 11:36, Danilo Krummrich wrote: =20
> > > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote: =20
> > >> One way you can see this is by looking at what we require of the
> > >> workqueue. For all this to work, it's pretty important that we never
> > >> schedule anything on the workqueue that's not signalling safe, since
> > >> otherwise you could have a deadlock where the workqueue is executes =
some
> > >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> > >> meaning that the VM_BIND job never gets scheduled since the workqueue
> > >> is never freed up. Deadlock. =20
> > >=20
> > > Yes, I also pointed this out multiple times in the past in the contex=
t of C GPU
> > > scheduler discussions. It really depends on the workqueue and how it =
is used.
> > >=20
> > > In the C GPU scheduler the driver can pass its own workqueue to the s=
cheduler,
> > > which means that the driver has to ensure that at least one out of the
> > > wq->max_active works is free for the scheduler to make progress on the
> > > scheduler's run and free job work.
> > >=20
> > > Or in other words, there must be no more than wq->max_active - 1 work=
s that
> > > execute code violating the DMA fence signalling rules. =20
>=20
> Ouch, is that really the best way to do that? Why not two workqueues?

Honestly, I'm wondering if we're not better off adding the concept of
DmaFenceSignalingWorkqueue on which only DmaFenceSignalingWorkItem can
be scheduled, for our own sanity.
