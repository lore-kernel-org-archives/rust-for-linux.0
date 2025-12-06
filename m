Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561252EC0A4;
	Sat,  6 Dec 2025 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765037540; cv=none; b=pxFCituz5S1VXWPrRi8OqPbNAZFBx/3JLFXz+mH8XDgYbFbN11kql78QIlN4EDOnFrqkouQfquZn3Tqv+do8zNGrFgItvJXCPhlZtxELg8+/3E2+FIfXNGw8qETiXDrAsMPlI8wnGpiUS3GvbbXIjhyi3K8y8Y4LNilAWxvTDqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765037540; c=relaxed/simple;
	bh=CBHAAnw5khEHCjAQO6yfUon4jcU2DVVVCzs1PhIb3Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJP6cwENeVKPsOPoz5RErvCROp07PPnGTVs1/7XZNQSpY/PFR3I+lvF1a1Zw5nm2toh56RhiMPKcQEh6Nupkf7Bibz/G7YrBxdhbrOR94wirnFudysnbynotc5cLVMpdpl79W/t4Jfv6tYT0HKNWaLrD+cYcg7dwD7n99cn3k0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=hkTUx/OL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N+ZT6ZsE; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="hkTUx/OL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N+ZT6ZsE"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 2E9E31D00166;
	Sat,  6 Dec 2025 11:12:17 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 06 Dec 2025 11:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765037537; x=1765123937; bh=MTIdpj+rpv
	3945oOw4R8hSyX7wcBsVw+Ac3eE8LU0JQ=; b=hkTUx/OLreMr/z5lZsL9Q86a4a
	BbSiyO4LKW8umnLoRlgkS/3SnQHcOGcLdXk5S0shov+IHpecw5AKyfpOXqkqqfvu
	Q2vZ17fUVQyp5mNP98DGb4DYYEcdoBwCInwF8AZrUrESORVWaAsdNLbffERpjVvC
	nrDafePEZJlGEBY0CufxEDrK4anuq/GNldd889f3mGwcTyBEJEcus15+pp605Onu
	9TZCRr1K16sGp4JxwzS5LR9u1EjfLQM9N3ge2whG7AOiKjcNLGtHrS4KKopBYYTr
	gffGgk6nuw8sqopV3QI3dMgfxizakcddqUP/B53hNUeK2GpzYD89CtObUlrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765037537; x=1765123937; bh=MTIdpj+rpv3945oOw4R8hSyX7wcBsVw+Ac3
	eE8LU0JQ=; b=N+ZT6ZsELzpHm9Lw8KmJs5RXhjVfUIDu58W/N7512hRYFyVyHo6
	/GY4VwaSVtayJT8hg+3D16bt3ki0Rsejce0YFqZQuY6dWVtdT/Ib689+t/SR7/Sm
	R178ENkIEOneS1bf0hos7G4PemcQ3KireviOMB3vR362FR/DckmnwEXh2KbixQm4
	9w02EvBedESDFx7gTxJq8Vb4a1upjp28Y/CpCmTYZUQiUdm5v1WC91TQ9JcVQhko
	RCPHTJ+bZ3WpE4Ky9HQOfgYn7qsEjp3HZpiEAsizjab/pwTvZsu7ly1GzDjwF3fh
	ijQVs9nR+yP4TkRs0pfVY1L4/6kr+Bg18Zg==
X-ME-Sender: <xms:31U0aU36gnXpHeGzhhKTHHNGC6qhV_fbWSkJefrNVwjFFDlDZc5d-Q>
    <xme:31U0aejkCFY5zQXyl279v5we8sSIjLcvEZzFr82kJgUpIXqPQd42mLa9_8y0GFyGT
    nTEw-Z3nf8476jw2s88rZNmDwqjyCKU3d6ZBI5jYR1rxkffsVp7rgo>
X-ME-Received: <xmr:31U0ad_rfGkT-2o-OngVnnctCe4QDsFIMFOi3SXvpzPh3-qjxa2oNKaPLr5XiW6PvfWUNNWXpScZSiP3PtCTHuWhWS1518zSgN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepudefte
    evvdduhfeugfehuddtlefgkeevtdeggfegteeiieegvdevhefhgeetleefnecuffhomhgr
    ihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphht
    thhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhihuhguvgesrhgvug
    hhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggv
    uggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrg
    gsohhrrgdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhg
    rgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:31U0aSI7WS1G8QJwpnlzMAEBy7Qbtbi2MShSq5lknsbQGFfJgcFMMA>
    <xmx:31U0aawpWtrKiDPvCgI6SNuBTOaw4t8Q0pogdPLW3RO1IUR11-kouQ>
    <xmx:31U0ad0V9uLSnSsBkkoL9EgPVWJVk8vRtmpSZnq5gdCHDrot3NOcLA>
    <xmx:31U0ab_n0qIEfIRGqllKdc0VK7HPlfAUNVDUJnrAp6kd9r5JFpH-WQ>
    <xmx:4VU0aerrpfa5v811lamC1EkpfHAJQIJQxd4HEwFexjh5NrDAarHcdex5>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 11:12:15 -0500 (EST)
Date: Sat, 6 Dec 2025 17:12:14 +0100
From: Janne Grunau <j@jannau.net>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v6 0/8] Rust bindings for gem shmem + iosys_map
Message-ID: <20251206161214.GD1097212@robin.jannau.net>
References: <20251202220924.520644-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202220924.520644-1-lyude@redhat.com>

On Tue, Dec 02, 2025 at 05:03:26PM -0500, Lyude Paul wrote:
> This is the next version of the shmem backed GEM objects series
> originally from Asahi, previously posted by Daniel Almeida.
> 
> One of the major changes in this patch series is a much better interface
> around vmaps, which we achieve by introducing a new set of rust bindings
> for iosys_map.
> 
> The previous version of the patch series can be found here:
> 
> https://patchwork.freedesktop.org/series/156093/
> 
> Changelogs are per-patch
> 
> Asahi Lina (2):
>   rust: helpers: Add bindings/wrappers for dma_resv_lock
>   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> Lyude Paul (6):
>   rust/drm: Add gem::impl_aref_for_gem_obj!
>   rust: drm: gem: Add raw_dma_resv() function
>   rust: gem: Introduce DriverObject::Args
>   rust: drm: gem: Introduce shmem::SGTable
>   rust: Introduce iosys_map bindings
>   rust: drm/gem: Add vmap functions to shmem bindings

whole series is tested with the asahi (Apple silicon GPU driver) on top
of v6.18 plus further modifications.

Tested-by: Janne Grunau <j@jannau.net>

Patches I did not reply to directly are

Reviewed-by: Janne Grunau <j@jananu.net>

Janne
