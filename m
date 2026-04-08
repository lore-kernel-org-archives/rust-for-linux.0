Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1434D929
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679426; cv=none; b=DJmB9xUYy/H5MEHjPMJagtjjQJZ+vO0w5o5DEeXJMNUDn50DIa306pq7lCjXfuGVuSunvz9RDqJhtz/VYzb+GrHuwooLbTYEFE5B+t60g9/N04D8pTgEpzAAhLVKS1HzLOPavT0FhSktSDApTRRpFhj6jR89GMmCokJ+IKhWMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679426; c=relaxed/simple;
	bh=bYK4Ah4FXTHJDVeTGJZ8TBqzHqdR0GVPH1qC+Ipj0xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvgxoXTa1q6f4/08ZB+SNc8/8shRVg4FKWG6q8XrDDalf6bL6agL4ARW1XIKdqGhoxCaI2A/dZ28RnKw/PUHR2HDBrh9P/qZAXJVq8A/e3zFpQ19DD3KXVVXZaYv9Wd490xj7c/hMVSk3qXE14WfEhJYwiD9cMFtlRmJpldpIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BybRBia+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BybRBia+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bYK4
	Ah4FXTHJDVeTGJZ8TBqzHqdR0GVPH1qC+Ipj0xs=; b=BybRBia+JXk+U2VHfykS
	JvO8uujKWC2r5TTmSKPw5Vld0yHVlpkCUP8wNXSwFDw7rmud9XJU9k3oBnYxkVaz
	NlQikgBmV0kdyzS5VuHL0RjiCdn7qegl3YYur57A8xlhRB5zdQSh+xBfUVUyRYlr
	E3ZRDE210dZBDGQar2rAdj2ykvGRwGFhpyaWk8rIAPtuyRVSUd3SscOlgAe1mrL7
	X+HeOVVAKhUSNp37lxhuUB8Dmi5Lca0XN9QT15zjGVVguwwIQjtSMRGZdWnK1Fap
	oylD5Fm7UdqrVO1gJiOGQz4bvh+u+3W6hUPrKNiDQ/jLxPHIiGxKX2dl1XifZ316
	yA==
Received: (qmail 574459 invoked from network); 8 Apr 2026 22:16:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2026 22:16:54 +0200
X-UD-Smtp-Session: l3s3148p1@2FyvlPhOOtQujnsp
Date: Wed, 8 Apr 2026 22:16:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
Message-ID: <ada3tSA4LdRl_nTL@shikoro>
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
 <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev>
 <adGOXajATeerw91I@shikoro>
 <c26d043d-43a8-49a9-a866-d2bd5922b549@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ukrR7N9U8CvcVc5o"
Content-Disposition: inline
In-Reply-To: <c26d043d-43a8-49a9-a866-d2bd5922b549@linux.dev>


--ukrR7N9U8CvcVc5o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes, this will go through the i2c-rust tree and be included via the usual
> pull request.

When will the pull request come? Merge window starts next week
probably...


--ukrR7N9U8CvcVc5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnWt7EACgkQFA3kzBSg
KbbaOA/8CE4MBn/lYSuv4VaKpMxlsq+0f+fOSt2SvfkczmO3WCrBraQZZ1esJPgF
d9j1Ceh0stA7C3LzdsG1st6QLgno4XpPT0MdNYsLHFVo1fs4wgeE6NQeseH/ffbE
PSb6P6N37ZsTML66IvlVrM30W0guP2gAzwkt7f0wVs59F3xrJrWan5a0/Z13d8X5
Q44soU5AeyzqR98VnwaPl/fydRzhN1YaNM9pYzrbZL4oPXEfzKJvUFvyxXKr43IT
qg0+Qa+RBDBuR2tKqNpPVEr48MykpjRW8FrWhoh7GGBOhCZvL2WHN87JY6j69ira
To6keFZNFXiwoMM70WP/gu049vGCloJO6wiWPmD1hvEETSEDSL6Nunh7X6NbhwD0
cLolBfiM21bpsau3wABq7Y8aYc+qxgZF88wHzDMa7v1aNj6SRzZRQRKQn7Rcr5aR
mrXnmDRNVT9UDpBKsW6A85yR4gUiUo1ifng3P43gDX601rbawkStbSce+wN0GHlB
TETKL4LzMQYY/9pbBNAlpLeZjc2jejuSrISW7QO9O/Fhse5kLO4MyMNm88IUkZd4
mMC2kgDWBbcnJG8tRUuJcH12sRwdl2gYjODnw+fci37/9pcMFkcGeKP7kBDFc/wy
x1V9V1abnemIbJT9zS2A+tnmVGMEMShcRE2hVF4jNo0EfHWZf1g=
=gCkw
-----END PGP SIGNATURE-----

--ukrR7N9U8CvcVc5o--
