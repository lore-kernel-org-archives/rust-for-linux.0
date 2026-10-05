Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18340B0E8;
	Mon,  5 Oct 2026 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240609; cv=pass; b=XH5he/XW8BsGnx8NuQb73KEId0AMtxQjaPthW4+7a3l6LGlcCu5efDCeOsZ2C6t65TmEQQvydwQ2Xhf2MQ2VPudW4+5hqlBr5HaXRPd5z7lmPkyvyka/Eytw4dqGrkIglGB/AoDMIY2zhWExjLe05mFIR3HiaJXkGG+K2eE9iKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240609; c=relaxed/simple;
	bh=VFepN7h5qqTbJbhyEV8U0xpPziyJ72GfiGBwv5VldSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPItX+7+958XwiLchWBTKSCf1yT55Svp3F5A99jNZqTO6j11P+svlP8vRY2nFObnj0FZSoCuVIecCeU03VPBZlU97TW5waZef7tuEH/0yV5Di+G/HmafXvDShKL4AHSvxFUKA81dBn3FdUEJJGI8LgYamI7j/5c4u+6OV08Hhks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=bUgjn8iQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="bUgjn8iQ"
ARC-Seal: i=1; a=rsa-sha256; t=1791240584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RcYwHBqWZ15+iEM5RiLujJWlBVELidKGw3sXMC7t+M++X2uQrORaKDeMANPrDRgOUzqGwdvZ2LXrS6sbVTjixCizJQhRQPOg+knfzdeYUJY9rUbfaatXMqDQTiJVJdiNstACQi10AfLRSIzl7bLm+yPtA6unytDlAVqg4PxtSmk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791240584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KbgkUmImB3gJ/Dbx30iIP/KkThXAz28Dg0j80jo2Deg=; 
	b=QbUumb3KsAzMa3CmAT8aLJjkUct5suvA7HAwx9JQBkyRe1gxKCEvuqXb49CB9H6YIOT75yskmpfo7t3bh+Ra5yX82rvacZYBr7YHzrdhBLlN+xNBVWrvj7WmyaFWewe6+ktDx4aTM3uuwFhVT1hN/Lo/5lipo1Gy8qwVW2ISZOc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791240584;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=KbgkUmImB3gJ/Dbx30iIP/KkThXAz28Dg0j80jo2Deg=;
	b=bUgjn8iQ8aiQnhTY/6FCDgwrnStJJnQWpl8dzBNrDiRZiDet0FTyXsae2FDVlIAG
	g9JmI4Jpy1+VLvzYb61B/JkLNPNiqFAgWi1EKTuGttaxyCEmeKnbq6ZY84M1j/QYljW
	/cdmwbSGqw1fNj2m58CbStEp+/aV5PylejjN0fZQ=
Received: by smtp.zohomail.com with SMTPS id 179124058317319.807065784842052;
	Mon, 5 Oct 2026 15:49:43 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:49:42 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: uapi: add zerocopy/zerocopy_derive
Message-ID: <asQphgGWe9KmQa5r@um790>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-1-e19bcb71980d@collabora.com>
 <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net>
 <DLPE0D8F96DE.91C7E0MAERDS@kernel.org>
 <DLPJT1IUSKQO.1CAWHDECQAFPO@garyguo.net>
 <DLPKN532X7JJ.14Z51ZIBUIK94@kernel.org>
 <DLPNFF0JNNOQ.14JE7RL8LT79Q@garyguo.net>
 <CANiq72kvkAWmJEgOathMVwuXFzUURK1dVN=OWmczykVWpSTv6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kvkAWmJEgOathMVwuXFzUURK1dVN=OWmczykVWpSTv6A@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.236.60

On Sun, Sep 27, 2026 at 02:08:36AM +0200, Miguel Ojeda wrote:
> On Sun, Sep 27, 2026 at 1:49 AM Gary Guo <gary@garyguo.net> wrote:
> >
> > I think the skip-on-error default was added in a version newer than what we've
> > vendored.
> 
> I was going to update, so that shouldn't be a big problem.
> 

The skip_on_error() method is available in the kernel’s vendored copy of zerocopy-derive
v0.8.54 and it doesn’t change in the latest version so I don’t think that updating to
0.8.59 would help us here if that's what you mean?

The problem is that skip_on_error() has a small scope; it only skips errors when
generating the implementation blocks for these traits. (For example if it’s a binding
for an unsupported representation type.) Otherwise, zerocopy-derive will generate impl
blocks with trait bound requirements (e.g. on struct fields) which only fail later at
compile-time type checking.

For example, when I tried deriving most_traits for all of the generated structs I got
about 300 compile errors due to unions inside structs that did not implement KnownLayout
When I derived most_traits for unions as well, I got an error that deriving IntoBytes
for unions needs a special cfg to enable because its soundness is still under discussion.
  error: requires --cfg zerocopy_derive_union_into_bytes;
  please let us know you use this feature: https://github.com/google/zerocopy/discussions/1802

Also, I get about 200 compile errors complaining that KnownLayout can’t currently be
implemented for bindgen’s incomplete array field helper.

So I do think it’s reasonable to implement these traits using zerocopy-derive on a
case-by-case basis.

> Cheers,
> Miguel
