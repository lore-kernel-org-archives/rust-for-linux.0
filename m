Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B52EAE6
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087685; cv=none; b=CH5UNj/Wxq1St9ler68d67zQo0p91F4UM1a7wkeuiTAHqwXhxqqkho9jtKkyDs/rIsLqEUVX93d2LB2NCgZJoQvxqRIqSe4+6ecu8vOT+Q6uamSV+pj61dDEsKRxUZaGrx55ccVUyGnQYbcb670SjGiVHBgNh1ELvFDR3zOSwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087685; c=relaxed/simple;
	bh=nw4pv5R1jm6ML9J+yCdzCtUQffBtXQqAQI4BoDJp0UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxcAi4Gc+u0REKDpXZ1WapBjjTiHopO+EOwJQVlGAclW46bY5aF8x3gSxbvcAI2SPW32gYUvxyVp2q//VcbDJJ5EwygLJJE6FyGwQn+JcSsAQ2qp5o8u7rkJAkoi5wrlEe1vrOYviAURxzU0TZz8A7pMFhDzxlNsq+A2VoqIBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=PBKCEw+k; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="PBKCEw+k"
Date: Thu, 27 Mar 2025 11:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1743087681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IcvekZQH+j+p97YeB4/yEpAZzvs9KIEsKULl/WK/9vQ=;
	b=PBKCEw+kRjk95sKh2ZN02rlprYFY1nx3B1WFeMmw7eLoMLXmyGrSSLAxXkStIsfagZ8zmt
	T0udX4ZTrsEPWsOGQl/xc4tctgdpgepLyZMh4KsRJGGfbfNGtotW+VZAuorJzQRKIjTMky
	GQ4SPU30Sh6aswM8Z8+OQya2j/4jo57b6G1LEc/9Ay2kuP0t0c9lluUYtYgCAvhMalgSUI
	HHvev9srG7jpm8+sI+1kgVsJ96knrCfxNuQyGHO3kTVcCGx9BJt0XOPYxUr8EERyuaen9S
	hKKn/BEI08vUpHLo7MJAJJmATNahJhpRf5mDypvOmC/qWx+5yc61WPwQX31eLw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neal Gompa <neal@gompa.dev>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
Message-ID: <Z-VoO7l5xzuN5RUX@blossom>
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
 <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

> > https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v5 contains
> > the DRM driver implementing this proposed UAPI.
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
> > the Mesa patches to implement this proposed UAPI.
> >
> > That Linux and Mesa branch together give a complete graphics/compute
> > stack on top of this UAPI.
> 
> Do we want these links to be present in the commit message? I doubt
> they'll stick around permanently...

Permanently, no. But by the time they go dark, the relevant code will
hopefully be upstream in both kernel & Mesa. So I'm not worried. Not
really weirder than any other links in commit messages we have.

> This looks good to me, and the referenced integration code also looks good.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>

Thanks!
