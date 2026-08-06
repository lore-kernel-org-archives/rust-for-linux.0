Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B9341ABB;
	Thu,  6 Aug 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036975; cv=none; b=eXJlqiZdzDIkIIbRD/2mUOU4ZkNnNSd6gcJxfY1XUSwA0SaEh6FuLUH63zy6P44RBAFpxZRQxErpDoWNZaLGS7HSe1BcXRtvBHKlwlR4vezymbAjqGn5kvk4CbNmRDtMYrwbFcxf4ztQ2REhxTnVmJ7L0351e+YWX7UUVVULYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036975; c=relaxed/simple;
	bh=BRXX8fl26snSVq0xnkOSbYn/ibQDEqgktaFe1GxMFtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzJStUJgZnd2/WAlUJFhewfPDR5KVyC6ds/J7mTpsh6SAAu2E3gM0ysEE43Idhp48dBIe9Yi4Dg/tK6wJ+GbRuuQWJcFpff8uf8053NP2eh1zWgtSMXjkFcMOwIizqyYMRjmqj/WaPOFOVv8syzfWMBvAEtuoEj8DMW6vQb0c6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJFo6HWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJFo6HWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2631F00A3E;
	Thu,  6 Aug 2026 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036973;
	bh=BRXX8fl26snSVq0xnkOSbYn/ibQDEqgktaFe1GxMFtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YJFo6HWB8skwlTvk3lvyAEG9d3OZMKFzkwLzxOKGrOPmjgKTX0uChVdAhGfts5MMk
	 mBYbOUNWtGIGDE7C42kNcDUENxaPdSwS2GkqXwsfz7jS2Z4keSmWrmf48ZL0P3AaXs
	 P3cAWRJqxZr+ZaTQZQPb7mh10iQ89LpsRJEuQa1aUUgLEUaUGk5Ivf1fqbVShd/iEA
	 uOdduYtcp3lPDFeqkWKh4ridb+pzenB7lmWSUti5G0eznclzbUuAPjTNtEcURWWcd9
	 woyf+NRPThKQ/cU8R90abit1b935xC6Fes9jIKj2LMslDaaqvAFmqFXnBNr8bcHHeJ
	 hy+VvZZi7X2Yg==
Date: Thu, 6 Aug 2026 18:22:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org,
	linux-next@vger.kernel.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
Message-ID: <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
References: <20260805190012.2934907-1-gary@kernel.org>
 <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
 <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+KATg0/ptjgF20c"
Content-Disposition: inline
In-Reply-To: <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
X-Cookie: Brain fried -- Core dumped


--/+KATg0/ptjgF20c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 07:09:58PM +0200, Miguel Ojeda wrote:
> On Thu, Aug 6, 2026 at 7:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > The merge commit for what?

> I think you merge driver-core-next after the rust-next/pin-init ones,
> so I assume in the driver-core-next one, right?

Yes.

--/+KATg0/ptjgF20c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0wuYACgkQJNaLcl1U
h9AYowf/eSno3Y0EUujoK+DOrwvEd4iNxS4CtcT0AAJEGEhi32p0RE6FiICYW6nO
ebQcqbimLKNGYo/7sW42fz00o6Q6Ykc0BcC2UP8lg/c/zM+G96AUmj8yn++hdR/s
pnGo8jndVMhh3YLN2uA3cLM/k0QbmzHfPs22xF0CO9u/W1OzCpalkTb6C4g4hMM5
l0rremBcpWoizEaXjjsMjVYdpDvrAstSH/Gv33HTLUOer451DrtxNBkrNt94V0AA
P/Na4WxMdFvZkiXJzWqjskooRpt9xpOr5a1uCLdC/v6QkYlHrMvgKwCU0hocXXAX
MfHWkLGRzr50rZDjDSR6xJZwbSg9cQ==
=AKrO
-----END PGP SIGNATURE-----

--/+KATg0/ptjgF20c--
