Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06026B777
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408266; cv=none; b=BqYjlnGzRUWmlZvHggEN7lWZmy4AhHtUFhsN5vi+irqIGbNbGCrfRSYtEpM7tWtXIIbxNG0qv2F89P7ddNRW0mWQskTULXuuOBVTlRRlAoFWVDpfCLmY5ONxPLvu1c+BdjgI2cJKrqkWMK0dL4wiMjRM6uc1DF27TXo5B2QL2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408266; c=relaxed/simple;
	bh=PSlS4Q9N8FSMlYq+evkSTqDZvOhmh8neJQMMReaF6yQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pItzL7jKcZVQPrHjTOfwKGaC3pWiAF/H9zZEsiwiwOEQQ2W59zCYQx02Lho3JI6TwnsJYhzkTD/lQrFsod119cvlyF5hs/lDBrpVzfDDvv8gIIgiAxE7X8qynrYSPN98F+K0c7zMM3fafqNXZUz15WgtDNPqVxDIzNyyRmFAlw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ciTUu873; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciTUu873"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836e35292cso39467795e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771408263; x=1772013063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSlS4Q9N8FSMlYq+evkSTqDZvOhmh8neJQMMReaF6yQ=;
        b=ciTUu87345Wuyt6m++LarI/gCXEYCFokD80fUmyaTgOia+c7AMB2MCZ/lBKA4Npdt5
         OEraM3Zk0YVuAHOHn3W3nUvC+cYf2w8c7fGYP7uyex1AxOdrJ5tjuAVJ0gHroPcMocYs
         YqDbeauXVBjd+qSAP8oVKM9AWTGvQjsbFeNAjPyJm4Bq3O0mIsPNovpDevnZ9kDYwiuQ
         6j6MKOsr7hFOv8wgjuRkILvTTSSPE6lv6gCuTmnb2Cb3FGaYRxwftWIHJZnFrOCj4i8h
         RcQqVZmyLr59AyEbEt7UiEriyR66jXUuKvDON+F+bBBekFoy7cF3uWO8UfT+ZHfDLISM
         632A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408263; x=1772013063;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PSlS4Q9N8FSMlYq+evkSTqDZvOhmh8neJQMMReaF6yQ=;
        b=BJar5+xfSbU8sivcF0TK0IBr0QIJ3slonMn31RinG3BMHtbnYT2taDIpObKLM+CLHY
         XBL3jU8hOr+fBJoqHW3n04TE7biCkuwccG4Lfp11Ii5pgHE3r9Tq5JHOBkYdtC4O7Fep
         Q4tMEAOVyyc/+YKuC9lFZ7EDz3aJ950KH+sItg8e28XaHuSA8sSY2PYmvFqEenNLkWMk
         cvStikXsHBZuYJpQPcSfocQGY6uMjWTRE2kuZ2hcDG3gXWzwwtzkaYWhdsMFyJPLDmYD
         fRf/fAvjiHWbBRbiPjyKcadx0UZAtFCt7Dtg4MMVJ1MtEwnGNXUI33+vv/3Uvc11gLct
         WIwg==
X-Forwarded-Encrypted: i=1; AJvYcCXn9RGwmtjRKvCIuYF8GFnhym90+PMyjrdDv3lz3+c1jMAty9xOgJAqyTAN+qYzSaI0MmLIGcIzmbt7mbEtdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBWkcNkNyiJ6cg83EbvRx1ZIF8zPPz6mMqwklUL7VVmxUG3g6
	AJC6NQbaDijNrnv7+Qrp0e9OMj3fZhPZ8zqazTX48nIe53NCJN5OmKDglcohG7BmvfxDWPMOOpw
	sL84nL7z38JqN9xxEdw==
X-Received: from wmbhg17.prod.google.com ([2002:a05:600c:5391:b0:483:7b48:cd99])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c21:b0:483:47ae:7c00 with SMTP id 5b1f17b1804b1-48373a3eac4mr314707005e9.20.1771408263104;
 Wed, 18 Feb 2026 01:51:03 -0800 (PST)
Date: Wed, 18 Feb 2026 09:50:56 +0000
In-Reply-To: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com> <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com> <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Message-ID: <aZWLgObIwWVaCPkv@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 03:28:06PM +0100, Philipp Stanner wrote:
> On Tue, 2026-02-17 at 15:22 +0100, Christian K=C3=B6nig wrote:
> > On 2/17/26 15:09, Alice Ryhl wrote:
> > > On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mailb=
ox.org> wrote:
> > > > > > >=20
> > > > > > >=20
>=20
> [=E2=80=A6]
>=20
> > > > > > > Thinking more about it you should probably enforce that there=
 is only
> > > > > > > one signaling path for each fence signaling.
> > > > > >=20
> > > > > > I'm not really convinced by this.
> > > > > >=20
> > > > > > First, the timeout path must be a fence signalling path because=
 the
> > > > > > reason you have a timeout in the first place is because the hw =
might
> > > > > > never signal the fence. So if the timeout path deadlocks on a
> > > > > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you u=
p, boom.
> > > > >=20
> > > > > Mhm, good point. On the other hand the timeout handling should pr=
obably be considered part of the normal signaling path.
> > > >=20
> > > >=20
> > > > Why would anyone want to allocate in a timeout path in the first pl=
ace =E2=80=93 especially for jobqueue?
> > > >=20
> > > > Timeout -> close the associated ring. Done.
> > > > JobQueue will signal the done_fences with -ECANCELED.
> > > >=20
> > > > What would the driver want to allocate in its timeout path, i.e.: t=
imeout callback.
> > >=20
> > > Maybe you need an allocation to hold the struct delayed_work_struct
> > > field that you use to enqueue the timeout?
> >=20
> > And the workqueue were you schedule the delayed_work on must have the r=
eclaim bit set.
> >=20
> > Otherwise it can be that the workqueue finds all kthreads busy and trie=
s to start a new one, e.g. allocating task structure......
>=20
> OK, maybe I'm lost, but what delayed_work?
>=20
> The jobqueue's delayed work item gets either created on JQ::new() or in
> jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=93=
 implement a
> delayed work in its timeout callback?
>=20
> That doesn't make sense.
>=20
> JQ notifies the driver from its delayed_work through
> timeout_callback(), and in that callback the driver closes the
> associated firmware ring.
>=20
> And it drops the JQ. So it is gone. A new JQ will get a new timeout
> work item.
>=20
> That's basically all the driver must ever do. Maybe some logging and
> stuff.
>=20
> With firmware scheduling it should really be that simple.
>=20
> And signalling / notifying userspace gets done by jobqueue.
>=20
> Right?

What I'm getting at is that a driver author might attempt to implement
their own timeout logic instead of using the job queue, and if they do,
they might get it wrong in the way I described.

You're correct that they shouldn't do this. But you asked how a driver
author might get the timeout wrong, and doing it the wrong way is one
such way they might do it in the wrong way.

Alice
