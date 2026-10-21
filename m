Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595073;
	b=241u2gN7EX3AaDHJjlmYFYWrYKEYonRVvnVMEcSyeNjrLgRlJlbqVlJwMnKxiMvrR+0Q
	 mE8MQhEFyh1L18k7yM4hLJGOM4rikfRz8tp/0EeffaYBVaU0p5F0QW6h5IvoDDYsEJYqE
	 gAMs8AaYwAQs+Ot3Y7rEBQ5I+95ppX1ytPNTksmxoM7K15Vg9cu4TBfNRxrx2QDSp3t2k
	 IXYmQdcNmg8HvecofYQULQ31FUQ+6MvW7pKXuNg25KpaU5BxdOtaNDbRR6K3/voA+eQ3+
	 mN6/fMUvZPsgLPo7LLJyL/iWCc3cfBEZ8RLpGZ+3d1c8EvhNRTxJjsSdPmgqB7DoPyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595073;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XO5kU4TA2hsV8P7bI/3a0t4nzK1sUFsih2IqSO0IkMs=;
	b=fqfuJVJLb/ZAKFyxuPQGK5JKbhELwyiZXViY8T0yNm07fWurVOzH2hF1ffBAKbm+dfcn
	 7W6iMeyvq1dxiFKfw4lutQJjHihk+zEKqR+7QHMAiVAKlDA/CCMbRQiwvc6gceyEzKPJ3
	 7jIAX2/1S1mdub5AFAnaeX8tra0J2KJa1t42qDDIYupXnZLP6m3RjLo3oDVuj3nfSdEP6
	 T+bECh8BrVjWvkjZUZmw+1Qad5c4nkjlbea4Tmwypo+t16zaPJG9Av7GimqCrAZ0YctAy
	 9+gSDV07NOsHctL6GWBH5HzxWMQqpexjzCF8fhxJbOr2Y0uCg8HktYk7J9i+qscFbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTS2ydON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE4606A319;
	Wed, 21 Oct 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTS2ydON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D031F000C1;
	Wed, 21 Oct 2026 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595073;
	bh=XO5kU4TA2hsV8P7bI/3a0t4nzK1sUFsih2IqSO0IkMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTS2ydONSSO6OigfGcGip2G9X7UcUMUYTgHs9wwKKmV3PQWi5nxkNFMdkNfn5Xuic
	 M+yDYURU1FgBRYcx2ZXhdzeBO6oUJ+Se/skX1ZdNUdVvzFg7L0zdZTheDuLdQAzhBY
	 Baj74muZs4Xd6YJDv9Ckcvp8O8prgjV9Blw7KstpuQ0vynKFSEfNqYLgD9l8QtVAX+
	 d1p7scuPa63YBmoVCFqBcEcacorrqwiD1y1VXldz6Zrt6doVfZllKu4QDli8HZAjWW
	 YqTt0UgGAC/H86363Yt9y0lm3wLRVII09i8FWL9cEg4kxm2w0Iu1sMt/SpNSc8yZrz
	 zGf/Ia5geAoOg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F3D971CCFA94; Wed, 21 Oct 2026 16:04:30 +0100 (BST)
Date: Wed, 21 Oct 2026 16:04:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: ASoC: Exploring Rust support for codec drivers
Message-ID: <atjUfiQ2fDkNpLYz@sirena.org.uk>
References: <CANBuOYrCHc=HSe2z45EKXjfHqPO2Dzh7L7Atwrzboz9d-H=Lmw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="KGdcTBIzfaVoCt5A"
Content-Disposition: inline
In-Reply-To: <CANBuOYrCHc=HSe2z45EKXjfHqPO2Dzh7L7Atwrzboz9d-H=Lmw@mail.gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--KGdcTBIzfaVoCt5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 11:31:48AM +0200, Jihed Chaibi wrote:

> I haven't found any ongoing work on Rust abstractions for ASoC
> component or DAI drivers, but I may have missed something.

> My initial idea would be to investigate the minimal abstractions
> needed for a Rust codec driver to integrate with the existing ASoC
> core, starting with component/DAI registration and callbacks, and
> expanding only where needed.

> Would you be open to this kind of work in ASoC? And is there a
> particular approach or existing effort you'd recommend looking at
> before starting?

I'm not aware of anyone else working in this area, I'm certainly open to
it.  The main issues I see are that most meaningful CODEC drivers use
lower level abstractions like regmap which don't yet have rust support,
and the ongoing refactorings that Morimoto-san is doing.  I think the
CODEC drivers should be fairly stable now, though.

--KGdcTBIzfaVoCt5A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatjUfgAKCRAv73Ows9A4
iVUOAQCM1zv3B+5o3wFbwScgAPLDSnMIoWOzTogE57JBHBStCAEAk7EOlbED6oRX
LS2l0IqwUfXzzLdVq4LsGtByay+wjQE=
=smTh
-----END PGP SIGNATURE-----

--KGdcTBIzfaVoCt5A--
