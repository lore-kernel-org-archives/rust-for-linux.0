Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399AE262FC1;
	Wed, 11 Feb 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770818041; cv=none; b=aikQUTE8zn0E1Qh1paixsRJmoQ/S98Uzz8dup9UpIyoWBFmY9I9BvSUbQHn8BBOG/TBEgBYspd6tcDoht7rrIYxXYFouv+F5dPDVdlxSQjGiqY7Ew/lvN/HY9Sx1mVo7TaE9QVUHH5bIZALKGvF3ll2Sx6dfOyc9mwR9aRyzavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770818041; c=relaxed/simple;
	bh=YMMDA1BaSe6r+JjJIbOpvhc0hja6eg+QaZo9U6mphZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D7IjYChEpSVvyILLKKyxWticM0TzNJsgh2rgqHpaoSop6YOl7b7H1D6NrQEi6RHtB3b04MEUvlzziyci4+gXpYqgXrNQ2GEIMlUJptEfHwbsQWDf0DcUKjbzVx25RLJq/8biBHpgG+XQkbk1RYpw7+kZBi1qnyU8yYTjBR0MxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KuJa1X+U; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KuJa1X+U"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fB0Jy3VYYz9vBg;
	Wed, 11 Feb 2026 14:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770818034; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMMDA1BaSe6r+JjJIbOpvhc0hja6eg+QaZo9U6mphZo=;
	b=KuJa1X+U9mnN7rCIY65TdVjhrjF9uDXDDiUVuZX2txKfC2PJfWA4YP3wvh3Ow/nk3eVSyu
	8DNWpA5CcAl4TQS7LIoELD2UY2KIEFcOP8BNTIop6A+0fFtSOC02nfwMzUS4KJiquM2gSD
	siwKEyoFqfxz9PJzB8Kv0o18mPM6aJXsrKHW49AKQcO6s3Hm/0o9+P9EVtDqvHsMjxc00c
	2Ld8aac1XJB7BE4XG0LYNYHmq5GOesa9D34lNvxmIXCufRMwGw+sIulJCLKUOe8xWlgjC/
	NE6U+U0OtmzpiAhMJDYuxy/NOm858U4rFa0QfeqRa9fBn//ChHTbFLbeqPL1hg==
Message-ID: <535d0c8637319f14f2d104a928a75ae872be8786.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 14:53:49 +0100
In-Reply-To: <aYx7d21_hIWP93XW@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
	 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	 <20260211120742.0e9e7122@fedora>
	 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
	 <aYx0a-2eANbM_vnd@google.com>
	 <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
	 <aYx7d21_hIWP93XW@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 80e0c499da5b6706640
X-MBO-RS-META: cetihdejqmi5azq6j1g58qw9h9ts1z1y

On Wed, 2026-02-11 at 12:52 +0000, Alice Ryhl wrote:
>=20
> Yes, many people assume "list widely used in kernel" implies "list is a
> good idea". Unfortunately it is not the case.
>=20
> > > This applies to the red/black tree too, by the way.
> >=20
> > Can't fully follow, you mean that RB trees are supposedly overused,
> > too?
>=20
> When I first suggested adding red/black tree abstractions in Rust
> several years ago I was told by Greg that I couldn't do it because the
> red/black tree was deprecated and no new users should be added.

Do you have a link or sth?

First time in my life that I hear that RB trees shouldn't be used. If
something is deprecated for good one would hope that's obvious.

What's the justification? Should everyone use the B-Tree?
RB trees are super widely used in CS.=20

P.

>=20
> Later I found that this was more of a not-written-down recommendation
> than a full deprecation, and since Rust Binder has codepaths where an
> ENOMEM failure path is unacceptable for the map, we did end up adding a
> Rust rb tree abstraction after all. But this is where I first heard of
> this issue with lists and rb trees.
>=20
> Alice

