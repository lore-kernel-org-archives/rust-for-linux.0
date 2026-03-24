Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D583F7E90
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355751; cv=none; b=s4BUxyCIok6yWrW8VgoWRKgqMLojsRC/zHCstpznnwoz08KWxgrxvsh8t57LzVdOP06DY9MCHphmbWh3rIKA8tB3qHsJWyniar0bFsPCtxfKrdP1SmXUaViBMUHphH0D9BuCJ/6U/JtcOBCPA1yjoNbcgPswfsCP9VpZMcuTLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355751; c=relaxed/simple;
	bh=7Dcg5eco6i/ujT7qNFwgJkN4hiRsS7Dg+Wf5hnusGso=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDgsuCs686F8IU9M2tpf42ndEuXel8SXBxJ7JecaB+wTeJKFBsEF3MEHLcFvNhQbC8occIf2zsD1xNr9gOUeRJyBX5NkECRoB3ZUbzesmQt7Clc+36YewH++yctRqIjZFV26UbyT+goloAoHDrVF4VYDaG/s1e0TdJFUlLXxO44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ClwhG9FX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ClwhG9FX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774355748;
	bh=7Dcg5eco6i/ujT7qNFwgJkN4hiRsS7Dg+Wf5hnusGso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ClwhG9FXQusc5qYjKWyYHeQaddYHdiBA+Zf704OTV9o5/WfE8ZaedkQVzec8FKP8L
	 h4c97kpzeKTmVEAO91j5P0g+b4K9xNr5nft7i1O07yDV3H/q3eou6V6JqOGkIJo+sq
	 57yI3yY1u2MLN1e4SYhJkim+XCkrmPOlNpn5EJPjtzDEVjx//+Kq38kYWnZDo6ekMl
	 nlkxJuJy27Jbmi8i+QLGwCx+jLEO2yMquVVrq+dBvf50oJv4dW4X/vJRL2kpdBt9gO
	 kH9+UzMnsPwT8PlI5j2fyO30pPRsaqJGKIE5gJtPPxj5uoMbNZh7uZRIXIbrA+WwL/
	 xAmaVXVJoOyhA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F21217E5B23;
	Tue, 24 Mar 2026 13:35:47 +0100 (CET)
Date: Tue, 24 Mar 2026 13:35:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun Feng
 <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 00/12] drm/tyr: Use register! macro
Message-ID: <20260324133542.0401c33e@fedora>
In-Reply-To: <CAH5fLghWAQOkH0bDw3vC5UZaCJyXaXn16D_2K8wWOraBcktg3A@mail.gmail.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<CAH5fLghWAQOkH0bDw3vC5UZaCJyXaXn16D_2K8wWOraBcktg3A@mail.gmail.com>
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

On Tue, 24 Mar 2026 11:58:36 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Mar 24, 2026 at 1:18=E2=80=AFAM Deborah Brouwer
> <deborah.brouwer@collabora.com> wrote:
> >
> > This series changes the Tyr driver to use the kernel's register! macro
> > for hardware register access, replacing manual bit manipulation and cus=
tom
> > register structures with a more type-safe and maintainable approach. =20
>=20
> Please double check the AI review:
> https://sashiko.dev/#/patchset/20260323-b4-tyr-use-register-macro-v3-v3-0=
-a87daf9e4701%40collabora.com
>=20
> There are some concerns regarding clock cleanup on patch 3 that seem vali=
d.

I think all comments are valid except

> The commit message explicitly notes that the previous format matches
> the ID printed by the panthor driver. Is there a strong technical
> reason to break this log consistency between related DRM drivers just
> to avoid a single bit shift operation?

I don't think there was a good reason to hide the lower half of the raw
ID in Panthor. It's true that all the fields in the lower 16-bits are
extracted and printed separately, but it's just super confusing to have
only the higher 16 bits exposed (I've been tricked multiple times when
looking at some logs, and had to go look back at the source code to
remember what this raw id was exactly).

TLDR; that's one case where I think diverging from Panthor is a good
thing. I don't mind if the decision is to not expose the raw ID at
all and have all the fields extracted with something like

	mali-<name> (arch: <major>.<minor> product: <product> version: <major>.<mi=
nor>.<status>)

or if we decide to keep the raw ID around.
