Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC43F4110;
	Thu, 28 May 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974802; cv=none; b=DSpXb38g7E7W/mbn4ywJPibB4vq3DZ8uyW+iPV3Bn2j36LjP06ovl4SjKnA66HQAIqG9HXrrzw6qCOCOztib+njxJ9R8+yhBwApN2swAZRmDurkI0ty4SrAS/AXP+KE2F3XDPb5auqEv5B+2KQMQFZMvQdb/uM6KEUvtLWy2mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974802; c=relaxed/simple;
	bh=TDitgptHOC9Dzo5uKX5gn4HcyDWtTEjfw8lV9o8XCFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic4vzVWxiHjc3irbFo51rt5FC8dmR42eBaF9I4ZVZ5XIfn+cX0uc8UwXTxmJfXTrLIY+O/RR11y7l4exVDPwDHjtL+DucR4A7mtCzJwhSrkbR/glrMVMJ/Jrr8Lzki5v20v66IxaLE1DbUrLIoYIbJ3EwT0WtMUkqjMDTmGIBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT32aZA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT32aZA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B531F000E9;
	Thu, 28 May 2026 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974801;
	bh=TDitgptHOC9Dzo5uKX5gn4HcyDWtTEjfw8lV9o8XCFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cT32aZA6kykmHia6n9JQSJmQbNoEud6P2CheaD+BZpFlAyfc2YyFP4zHLQiJBJ8KG
	 3H9KE2dwmqbx3L6ufaNKtzoAMV2GP6sPDfJzuWlWEKDdHRcNEuYEr7AEhIPRYnfNpv
	 fkTawitHl3A7jiCcN/3u+ImtUtlWzweFIKq3+fO/rZrssi+VCQNiQ6O8Y9fuDFqZXw
	 Tq9lpCJDJd3kWQWA72utkcdcOCHzffqOF3dSMljgWhtt3Q3AKmE6HfMNcXNVlF8uCc
	 CdBpsKklSsqKOBm+rzYeiAwQ7gj/N014XFx4upEgdZIjj4zMjXqDXGGLMJ7fV67C81
	 9fe7GZRZyK73g==
Date: Thu, 28 May 2026 14:26:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <75a8b15b-5060-4e5e-b0a0-50fd3058306d@sirena.org.uk>
References: <ahg4XDoVOR7LD63p@sirena.org.uk>
 <CANiq72kJ=iFeTCo_D1WdXhyirhOE1Rayz_DP673H_ijSCNp+Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eil1YJrr8chIAf0D"
Content-Disposition: inline
In-Reply-To: <CANiq72kJ=iFeTCo_D1WdXhyirhOE1Rayz_DP673H_ijSCNp+Fw@mail.gmail.com>
X-Cookie: Someone is speaking well of you.


--eil1YJrr8chIAf0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 03:23:33PM +0200, Miguel Ojeda wrote:

> Which is the hash that you used? Is it `rustc` and LLVM and `bindgen`
> from Debian Stable?

Yes.

--eil1YJrr8chIAf0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYQowACgkQJNaLcl1U
h9Bh+Qf/ZrHSWAooGGU+ZmdjULdmxFbQC/Cm9raRJf7Xhv9eT0NQFOa0wpSXclkz
1Aue2Uv0uxxM6TA6AEZOE5ofKN1hjzES1RSLo+v1fnyraX0SbUcktpYLdYk7QKRP
RAI7eapxm67IVwZdrPd2ji6VMWYafv2eQ+gpW+TsQt9WYQSmoite5MAriBVnbKSq
LCVSPE5QtubNFpJ2pc+ORzixGZcX4mCupima4nJjchOsKLzEflg110eLX4MaTP+N
6G1jseqrsr95eaIPPvn7p5eWVJPBddNGxEHV73A87wcMzvXTD09tV3I+06rQJPZ7
LzIG9FuhBDmpRgWOMh0WVBsNv3q1gg==
=0k+1
-----END PGP SIGNATURE-----

--eil1YJrr8chIAf0D--
