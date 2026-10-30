Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390882;
	b=Y7dJBjl2lMa6YH0va01Lr5XbBA6gjqhZD2pOyoJ6Rvx0j6Qar1FQ+Aj+3DqC7jy8l7jK
	 akzDKbL7j1WS9T1N4d0aFX8JQVkfIlq3a8meW5gfFiSYYNe7i9hjgi7JMp7FJDRQgWXAt
	 i2frk/X5MCPuMGqWU58YS81dMWO2x3NQ8rmjfdqO/HwQ2hMg3aYrb0bXxtSU3xHpb+jcD
	 0GHQnH3L0GEG5AnhZfa624332KdLLcFTPQrHqpGSSBIl8Ea7zm2znO/ZXUk7bq1vJ1ca4
	 S97ssVrr9j7HDJ5Of8NAbRWHR7XrAwrlvIv8ThoWLWyap3Xi55cf9IBhZq8vmdfqabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390882;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=lB39h1MhWtaZrkbaAzkKVcGeiDt8CgD1IaZZHx6tbiw=;
	b=JO4RHTp8CBbZro1iF1Y7BcH1VHMXBPlCwE0cwjIZFeMEccPdQKIJVigA/w5Fshn4hdAD
	 GqB7P9YEbYHFgaS55exsvMmokVCLA95kZZhZlqt9pPdFKg9YVOxsZkPRV4vvpHkV/HtrR
	 O7h+Z1nVQfMGWB+E2p9Pr8NTz+TJ0cMFrnw4Qp1gXTqPu2rDkYTrOJa7HErhtb7Kf051H
	 n9ud/0Ma+3Ek69tBi9Zh8cOGjmV9QKPUW2mRTIpIS8a49n89aQlKt8BPaOb8s/fd2R/ps
	 Hbiv0rPIGpmxnu73vF8hgCeGmNb1caTrGSznIbpguIu2XHrt4ZOTRfReYht26/rU6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n2gU4Dlg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18F606A31A;
	Fri, 30 Oct 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n2gU4Dlg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0202E1F000C1;
	Fri, 30 Oct 2026 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793390881;
	bh=lB39h1MhWtaZrkbaAzkKVcGeiDt8CgD1IaZZHx6tbiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2gU4DlgNAZ3BM6ODjZcCt5ghKrwsS+KdoZ0tCwCV0NmXZfuph6+vndoVj0JVM8Z7
	 SI9927HfbnhyiNVs1nb19KZOvMK7WPWOkMEwPcnQv+7n62lZsWjT0uMpwDl6L8T1/o
	 KPGivxTjgWwtncUyeWM5PC2gG1JM4D6ZPRO/ZHGMolNx2Su9VdP6SwP22Vvl+VacG7
	 VVOdOpeVXv4BNnsDpFAuAwGCdD80Lfhm+2T0UonAlHY/PEdVis7gL3B9/HVf6uyugw
	 iop5viFEP0GmceP89cvIzGf8aIimPOjRikA3AguZENZIamzeArhwqKNwb5LqaynYno
	 3MbZBHd5a//BQ==
Date: Fri, 30 Oct 2026 20:07:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org, GOST <gost.dev@samsung.com>
Subject: Re: Please add the rxarray tree to linux-next
Message-ID: <4fe99dab-53eb-479b-b7eb-f93197b97cac@sirena.org.uk>
References: <f2df460b-bce2-47f5-97cf-d70773876019@kernel.org>
 <a692c537-cf5a-432c-81b4-372a6bfed69c@sirena.org.uk>
 <9f17c3a5-5d11-4fe5-a8db-4ad954ca864b@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ju7YS3+T1eVC6qyc"
Content-Disposition: inline
In-Reply-To: <9f17c3a5-5d11-4fe5-a8db-4ad954ca864b@kernel.org>
X-Cookie: Orders subject to approval.


--Ju7YS3+T1eVC6qyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 08:49:38PM +0100, Daniel Gomez wrote:

> > Should that be dropped and replaced with this one?

> I see it may be confusing, but we should not. At least not yet. The=20
> Rust-for-Linux/linux.git xarray-next branch/tree points to the Rust bindi=
ngs for the=20
> C XArray that Andreas and Tamir maintain.

> The Rust XArray is a Rust reference implementation (experimental) of the =
C XArray.=20
> FYI, roadmap in RFCv1 for more details [1].

I see.  I've added the tree now, it will show up on Monday all being
well.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--Ju7YS3+T1eVC6qyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrk+RwACgkQJNaLcl1U
h9ADIwf/YOcAqDIEwKSdOD8EKqsTd0AE0O4Ql9FUCHFFgbgvri2Ms19+Y2mGumbC
5MkFOMppssj+1phLLwC0ddfR/l1pyjs+7umUsEAsMJRJCLig2XOodEpHDpTt1N92
tqPpPc9S+UOnRx8DjyQ1eT55GwYbqMTesefzac2/ZQMUnpqkdJv+sLZHpoGPGu6u
EDFoEJYBxyt2TH/Hw/muRcwq78T2l27YbiaAjBrdjEeZ2auGHI25pHXzcdTdZz+3
+BMWAtwCxqn3+SuaVukUgPRD+xo1cdTV/GHA11OoxKscMSE3K7338BW5GZup/0Ka
Dq6AFCtas8wzp/k0iwoFs48EerhocA==
=5RCS
-----END PGP SIGNATURE-----

--Ju7YS3+T1eVC6qyc--
