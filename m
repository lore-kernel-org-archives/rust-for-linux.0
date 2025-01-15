Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387870811;
	Wed, 15 Jan 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956829; cv=none; b=GDbRpUoG8vCwQX3/2ONvLCTVkFRMT7DDRGZhobtV+iC9M+nZ5eAOfgCz565ABAKbZmOUkO4urrMl3Ssnx7S0nYNzBBy26VgEAYRlnrgVeHSnH7yLh4sz8eG1gELa9DGLLVR5S2IzAjIUBQxbL9QeJVe8fPKNCnzT/DXP87CoJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956829; c=relaxed/simple;
	bh=TrqPBNPg+1aCpfJ/+QdNLhvZKw/JF8eGCUG8zcSujHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEeYWAxL3oy2Rujzv3tuky0BrxWhHFdU1sMc4hk3/qCHRN6Jn2r+mny4EbWr7GibFQFAzce0bbAcotCfDxnsy1rkkX5s3wNme+clHisKpbR7Ioe7aZcOYMPYZ4ZzlNa9dx8F86JgjDlhIPno9131/H6/fLrOAp62sxV167Sz/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbO3/P9y; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbO3/P9y"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46c8474d8daso48377521cf.3;
        Wed, 15 Jan 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736956826; x=1737561626; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+fjAf5KG9Ahy3fEhH0G0ZPldWGNlF/TQiKdi9vLy39k=;
        b=lbO3/P9y4VC0vgbXqdIZkdN9PeVEZLRFxOEe1rZ2jveWyzgBmOGOxyyEWlG46uwtUL
         qoyV+NAR0/6WMbJCsgHMe8RityXouOuPfpte18nK5pVTduxoAqtIfg1YdqNQs+4mx5u0
         6RIRcbg3CURQj04xCoReAiLRQWkS2GyxrrX6XmbevMEbzU4xWSOf8/MQtC38HWRJA+V6
         YR9NAQ49zSpFHgwK33/Sit2olhs0uS5FSI3EMOcLMpBxunXHv9Iek3UFjrzPE5QuOuMq
         AoiLvmqLmeWOAFvjRpZpNfx5SnxJ564TO4z8ZrEhiJKLMQc46GAmEkBOaevOvFs6x4UO
         6QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956826; x=1737561626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fjAf5KG9Ahy3fEhH0G0ZPldWGNlF/TQiKdi9vLy39k=;
        b=MEDW4Cargj2JMQ+W4HjNA8bmj0KMoUU4eHosjqFWqzzJPHEhgumEKr37gBBDV+Czty
         9BbT6TRYq9rDe875o5mGRRwLpb2HLHBiob+zJ+C3ltv1Bhg1WpFXB9aRqhG+fx388ciR
         jc6wv1yC/J1Q35my/HR3Chf6uhlA8/pd9ZiRlo4xD/a/iCK0nySUMon/jKl52lJekP1y
         6V6Km0RDoI+vxU83KPEDLOdHUD1/mLpNou4VBCyNXMUnJC/wDomz4B+5zRJCWpRn0UO+
         xc5wlVgky8e6bLQNi9L+lCAgsgbrPfQ55iEmxoDahWLCX3wTkFhYrAfVEyrpnbrdZaPN
         wIeg==
X-Forwarded-Encrypted: i=1; AJvYcCVlwOgAxL43g+G6i3HUTNgupNkoTM4s+ZGze7otIcMt2TxrBPhRmcsD1pF3UfFrI3w99ChUDEJf4H+22zgIYFs=@vger.kernel.org, AJvYcCWCfzxEtsS/vvTVlwgxmhVVM7h0xCxJx2AY2Y2dmDqhs6l/dE6QV6nsD41o+a8l1sS5JFChU/SdF+BvYJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHOeyoXPWOmg0o5LPq45ZT04ZbGxsUXF+1mgktEwhJuXAOd57
	0PpBU97XXturqq67x1DJCv4hcKbLqI0nhJJH2qZYjsH55HD9hrO9
X-Gm-Gg: ASbGncuLobxsEOlYG09BNPxIEKNMMVhXPSz6hij+dZYGcadQVpuVqAD3SVVQY/dRAYO
	0gtUPxOE094ctBOt85u7DmGmDXisQzIeZMmAsJGb/P1b5tC8xl6pMVbYDDJDRCeseYdwfb/HMN1
	htVxyih0XR7D7sEE692eEPsNBdE1O1Mw126mkdrDEzjuqAdAauHvMLrrF0hA6IcvCzGnFhPuxwP
	93xAAAhwyI3mlFYLevb/VNV059cFQm9WAUGZiSl2YGFx451slYaZuOsxhzLSV5lb6G58N4XGBB9
	xHL38mxtcSiy8XN4rSwYsi1894Nk795i3YM0Jo/KhMQXV2I=
X-Google-Smtp-Source: AGHT+IGbwYuBFncqKSEQqAEhlqmHK8KPRjGJSMfQKZUgy5BSFJY7VexRkcv6KYrHjrSdbHOU/JLRUQ==
X-Received: by 2002:a05:622a:2886:b0:467:4f9a:6511 with SMTP id d75a77b69052e-46c71025410mr386854731cf.30.1736956825687;
        Wed, 15 Jan 2025 08:00:25 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873dd656sm65719791cf.75.2025.01.15.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:00:25 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id C960A1200076;
	Wed, 15 Jan 2025 11:00:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 15 Jan 2025 11:00:24 -0500
X-ME-Sender: <xms:mNuHZz9Qe8ZFfgzwRSTHlOC8BcpGjLixwVyQCJVxSs0eW6OptOfBvw>
    <xme:mNuHZ_vgozB9ee7GpegTXYXDEDXPqTYJzWxV5WsavWDmLc-cUacDLwZZkbf01GWR2
    H7cS-vNy5EybIYWug>
X-ME-Received: <xmr:mNuHZxClrPoY1ZeQO0IwCwT8P4j8p6mZ3g9Om63u_CT5loAbWVhMMGC_eyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:mNuHZ_cTcif3Oyjvn1krSk47VZs4W9k5ynjxJKiV6juKeRO3MHdfLw>
    <xmx:mNuHZ4Mueh_3Jo5XOQb0KbmtSzCH6veFOKmUrMKkDgQZhUJivYF9Pw>
    <xmx:mNuHZxkceigFAPNvGm37D9C-tRwLDxXvibr6kjgKsGyOgm_WzkHgYg>
    <xmx:mNuHZyv-5fiHakAlGrWvHHTh1d3fZ9RvAFx5MDccILZ4PY7GOnb2Xg>
    <xmx:mNuHZyunnD6SPimOeK-jTnlbc34xPzqth312Vn0yEFONxqIB-adfgNdz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 11:00:24 -0500 (EST)
Date: Wed, 15 Jan 2025 08:00:22 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <Z4fblpj57QgW_-5M@boqun-archlinux>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
 <Z4cFO5NIW-E07Vl5@boqun-archlinux>
 <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com>
 <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
 <CAH5fLgj6Wnrn6Ois+MbX16j2szRsBEgqVyArcGwhjEK52JnD3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgj6Wnrn6Ois+MbX16j2szRsBEgqVyArcGwhjEK52JnD3Q@mail.gmail.com>

On Wed, Jan 15, 2025 at 03:42:44PM +0100, Alice Ryhl wrote:
> On Wed, Jan 15, 2025 at 3:39 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Jan 15, 2025 at 09:27:39AM +0100, Alice Ryhl wrote:
> > > On Wed, Jan 15, 2025 at 1:47 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> > > >
> > > > On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
> > > > >
> > > > > >
> > > > > > It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > > > > > it runs the destructor of Opaque<T>, which does *not* run the
> > > > > > destructor of T.
> > > > > >
> > > > > > Alice
> > > > >
> > > > > This is pretty unintuitive if you take into account trivial examples like
> > > > >
> > > > > ```
> > > > > struct Foo(T)
> > > > > ```
> > > > >
> > > > > Where dropping Foo drops T.
> > > > >
> > > > > Is there any reason why dropping Opaque<T> doesn’t behave similarly?
> > > > >
> > > >
> > > > Because `Opaque` implies the value may not be initialized, it's similar
> > > > to `MaybeUninit`.
> > > >
> > > > Do you really need the `Opaque` here? C code won't touch `handler` if
> > > > I'm not missing anything.
> > >
> > > The irq callback is given access to handler, so it could touch it at any time.
> > >
> >
> > You're right it could, but would it? C code doesn't know the concrete
> > type of the handler, so what it usually does is just passing the
> > pointers to the Rust code (again).
> >
> > A similar case the `func` field in `ClosureWork`: it doesn't need to be
> > `Opaque`, although workqueue callback may access it.
> >
> > Am I missing something here? Daniel, why this has to be `Opaque`? Could
> > you explain?
> 
> It needs to be !Unpin, otherwise it's not safe for Rust to access the
> pointer. ClosureWork is not the same because there are no *other*

Could you elaborate it, maybe with an example? I asked because the data
wrapped by `handler` can only be exposed as an immutable reference to
safe Rust code, so how could Rust code access unsafely? The pointers are
always not noalias in Rust PoV. Thanks!

Regards,
Boqun

> references to it than the workqueue.
> 
> Alice
