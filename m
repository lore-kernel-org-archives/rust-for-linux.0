Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036339EF25;
	Tue, 18 Aug 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064276; cv=none; b=dFgsG2QmvojEMp6dUQQVzIvHUE4anZKjK7hi5h1jSkaDIZBpek6J+Wl5cqUJPa75XJel6MRoY/91O4eeioKeS3onuDbflgkNSAKEeMImQhdKpj4/8KmIRK3u3D02pUAWreb8unkxfKWPOP79mCQ3FBN1/fDAuyP5Yj8WvP2PyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064276; c=relaxed/simple;
	bh=VJ3VrkGIqKu4rRcYlBwibjLN/NuLwO/s/AYVP6CYXuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNxLEOe7lrA2yc89CJNCHWl6dSNB1CQoRFBW7dYtpet/uJN3gswQ0qhj+dFtVEge+ABtRlsoEu05HcAE2W6d8snFJjpU+Pe/gXKa4jzPdIYqMA6PleZFqW74w+F85dCUdaXZ9mmPjZVFELXQcmMJ+YOk0n20sIpn0Z8VEiiekXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ3oq4/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ3oq4/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEFA1F000E9;
	Tue, 18 Aug 2026 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787064273;
	bh=8+iw/VruUZ82Bdc8x9y+IT3lK07tu6bWBpSoM1qju6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJ3oq4/FzEwZzZ/uTXISDQO7Mr8KOooDzPHbUCEwwoCxoiMUYj9CgplYFaRBUHUW1
	 d2fNo+bEYVYP2/FZIBySKzWEiQHQKSkgUwIGN++x8b88DOjwU3eN7+7viCj8DqETRc
	 JCkSRBwl0g1WNWIPzx7mmWKkzhho2ymEo23w2EoFGI33aOAtkTtGm9h7/8AKuYRHLL
	 e5IS0RBj0wgX4za0YAOVRyrJbTHnmyhH0Kat9XtBSVo8kTzDywZdMxwxtZ5fJhdHrl
	 Rf/LR0p28AaQKyHZTx/Wh3beHGDXp2MuRHtJiRx2vccbtHTZoE6RlEqHRuuBgjMMeo
	 +7sdbIm0t3lEA==
Date: Tue, 18 Aug 2026 15:44:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>, linux-next@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
Message-ID: <21017f30-df8f-40e0-ab54-ffbf326b6c43@sirena.org.uk>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
 <DKS53ZVUOF01.12DKD5ITC77TI@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hOlFe18Bdi+DU2OS"
Content-Disposition: inline
In-Reply-To: <DKS53ZVUOF01.12DKD5ITC77TI@kernel.org>
X-Cookie: Smile!  You're on Candid Camera.


--hOlFe18Bdi+DU2OS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 04:30:16PM +0200, Danilo Krummrich wrote:

> In this specific case it is indeed what Gary already explained; the API was
> removed and unexpectedly gained a new user.

Ah, OK.  That's the sort of thing that -next is intended to catch,
though it does sound like a shared branch for the removal would've been
helpful to cope with people wanting to add new users of the removed API.
It's also a bit surprising that a new user appeared during the merge
window, I guess that's a last minute addition.

--hOlFe18Bdi+DU2OS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEb8oACgkQJNaLcl1U
h9AQFwf+N5H6HYAXr17Bt5+sfzs/tcIKIDrgtfHKZ4ETpBJG5DQUWO9CYmyoG3DA
GV9ojLi3xyvmpb2gvjWKDpx07EsjSZwdXhu5lu551KADjGuI1bucP04aacMau/bO
vnRiLDiWdIGiEW1SxVkYHrOEvvAh1l4s19yUcsC7xlrS3UpPUaIKmUluKhSVeFxK
Ixg5KCibGcthA7qKSh2HO0Z+afAIiDi1UCvanQcMfW6Ry8gESBot8Yay/VL40bqJ
Q8Rt9vMC9RXCDyCkLauChmZ38KnJ85TWRKIYBNbGaP37FBEJtT7Ictg9cHwrXSkb
QluXKuhjXh3hdsH6oHTnz6FrpVmmUQ==
=GfEz
-----END PGP SIGNATURE-----

--hOlFe18Bdi+DU2OS--
