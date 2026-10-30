Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363188;
	b=4+B8UxQfm6HKJlevql129BZkZ9Qp/GUNGwe8PzOg9G9/JEothjrf6t/QTjPOH/7u5Zao
	 zUjnk9Jg96ITL1RUILxkfeHUV2ni3RMjfHV3rlRvPCPJ6IaLQAgTfYHvvh1TkV2muxoyb
	 6eMTGXC3IiT30umGZD57gs3wAlO+BKGtO6p4GQvVMNLwdeyX8cD7kK9dAkkWW6tPn5Pp5
	 au7p1652hIJmEXrxWHgqhhU4uQOeTlyY+Z72ZPpIa8UGH8ixWvOgANWyglQr9SxhjMXy4
	 aGh+nyDNxUNbj2RCLVcISIS+LfiPZYhJhzQFhv4cTgbENQwt3lna6YFuSauqRjKxDrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363188;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ww4hxT+DO/r5Zqh+aXlvOPoLHkrtotsPxdbejagtKQA=;
	b=LJFBFpBQeiXAt7bcXDpCqj9eDvTU1j98K1diYzLTgGtcCEvSYXg0RLRFgVAFFAzxW09k
	 ZHsw+ggSxn6//QCisLPiBp/2HMYmH44TEiyi4hms5E66LgBsjjLerEkCd0nxFZU/+bYSl
	 UUyjGAhk64Y/pWQ/0in2s/I6hFGIOfzvaSB2yrUCuZLMqHzNP3WyzMOCbp+EUS5HbYQ7y
	 +sGVIk+j7uCvLLNY7TRiMRbYuKqnZ2j/9l6x8JQ2H+4A6U2AQeBimQ7ZCnOc3JjDW1VOI
	 8YxTxNktN2urqGbGevRuhqC0I+ZtH7LzW8lWnWSPnpphEoC+BuA71W7gXhoBFyEvEgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZJKc1G/m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E1606A31A;
	Fri, 30 Oct 2026 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJKc1G/m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD091F000C1;
	Fri, 30 Oct 2026 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793363187;
	bh=ww4hxT+DO/r5Zqh+aXlvOPoLHkrtotsPxdbejagtKQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJKc1G/mQupjhQJygc+z+JNzbL+D3IAjfUTh2GBSHHViZ0YvXPCOM9qducl2cBZ69
	 WMHLwhTj9RO5RcxGvZz5K5qEwHMtBoeVeF2ZxdUn21FoUzailMlq3Ts2MUY9K1WKug
	 cnLcYr67xldWqsXTxUFcpGc7krUJ7STA362g9c17rbQD3sNCsAO+lv6QnrbV5ksGP0
	 kKImrPbeqfxKXkg+FjEXVxT2xAUmXcT002oV0S+YYEZLTNimVFxSJp/2GAGWTg2y5I
	 AhBIM/QUtSKA1T3g7MDqKXhDwyInARdZN07c1pOIoAv4NuMYtoOpsietsORh63Y5Df
	 6ZaS+o/8GzH9Q==
Date: Fri, 30 Oct 2026 12:26:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: Please add the rxarray tree to linux-next
Message-ID: <a692c537-cf5a-432c-81b4-372a6bfed69c@sirena.org.uk>
References: <f2df460b-bce2-47f5-97cf-d70773876019@kernel.org>
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
	protocol="application/pgp-signature"; boundary="4bHUU/ZlB7d0teFx"
Content-Disposition: inline
In-Reply-To: <f2df460b-bce2-47f5-97cf-d70773876019@kernel.org>
X-Cookie: Orders subject to approval.


--4bHUU/ZlB7d0teFx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2026 at 10:22:49AM +0100, Daniel Gomez wrote:

> Could you please add this tree and branch to linux-next?

>   https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-next

> It's for the Rust XArray (rust/kernel/rxarray.rs), a Rust reference
> implementation of lib/xarray.c [1][2]. PRs will go to Matthew.

How does this relate to the existing rust-xarray tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/Rust-for-Linux/linux.git xarray-next

Should that be dropped and replaced with this one?

--4bHUU/ZlB7d0teFx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrkjO4ACgkQJNaLcl1U
h9AyzAf+NcVnmFUvj8SMQYkpvELk766PYBteyLsL7vrX4jocsXOCCFOfFKnY/i//
5FV3vhctsckcuzdm+lb23tW7Kuglv02t32cTyJey3Z3+Wr+6w+amMV+Mt2OH/pK0
4uCJzBb7g8jHk9T0RoNu3fWP/AOXv7QpLxCrg9+qmbPA2FpIs+8J8wtd+3oo8Xq6
WRRPizodaUnyWKOJxu3TbqvroCQUQ8dBTU2lLVHMAnGvQf6EeneNYen43x8SqcIG
WqIG2hrSdQtA4zDg1/RQUjBmhLaWkoigLm6pS4TNFkEQ3AG1YlcabhXN4j2QLEvy
gWxk+8EMZ2WLsOsK6D/2IlDnYhqp4Q==
=OeF/
-----END PGP SIGNATURE-----

--4bHUU/ZlB7d0teFx--
