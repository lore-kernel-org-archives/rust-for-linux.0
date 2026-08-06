Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801048A2CC;
	Thu,  6 Aug 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035945; cv=none; b=QGSMQ7EIXtmOWAKGakN6ix9IXjIs+ALoUZCQyCrGBbLV6fwQnWiqpIrD9cqQACi19m5clwNY2wJszLfwIpUzg4iX3TyBeRWnZRpqaZbehSSbL0PBIF/b0fftRpUMapXGClqTY7OuAVT4/or/KmS0JkdvyOg8YlRMFL8tEIpJzhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035945; c=relaxed/simple;
	bh=R8bksiKUhR5UR9vA/uQlvpAWoMJlgQlWSjwnO7ZDpA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ/Wjt1Bd3nXnKXJJhXR6yftegHdRRvoVHPyryDPC6MmV8eYoQZwdgdj5a8FSDW4UcpW+Sgw3Foufm0iH6Xk243rWrsRSfGQDBhEbV858zA3XgaPlPT9RcgclPG8mNTzEk6NuZkx1aylnlBZzYhGTCd42I55Um6emfxcn3CAqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfYBsa0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfYBsa0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F881F000E9;
	Thu,  6 Aug 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035944;
	bh=01PXLsXXlp5vWpKujdsyD+Lq7fKOKOGlM4wiIx1SD04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YfYBsa0Bd4f8yJqVrK0sT2lONl3KmwY1Ze4Cbn5XMq6QjKYfsixlUN7dufexSjauX
	 CVYGabqkrb/JX3UjSiux/qbYyVvXaSegm76eTfVvxSbtReV2nuKqFgXY1ED6bQqOX3
	 7e79SpGkw9oy6cy71vgBD4HZSWn8VIExDKweytVuwJjJy7MV6xqWfO4NXOgKcrsRG6
	 +ETfXJB7uyMm5vYDf8UgcmAUBYTIRnXXoUTPl7W9LlyKEktC3LlB/BC32rmizH8FOS
	 7qfVfz5MrOzJC52sf+zr69kJXozfUiFBPCisue5Uan17Y5zzoHKxVCo3aw8647L1nZ
	 FfGebg0IHFWzQ==
Date: Thu, 6 Aug 2026 18:05:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: gary@kernel.org, linux-next@vger.kernel.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
Message-ID: <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
References: <20260805190012.2934907-1-gary@kernel.org>
 <20260806170101.67544-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jSgN/m5QDQfwnWX8"
Content-Disposition: inline
In-Reply-To: <20260806170101.67544-1-ojeda@kernel.org>
X-Cookie: Brain fried -- Core dumped


--jSgN/m5QDQfwnWX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 07:01:01PM +0200, Miguel Ojeda wrote:

> Thanks Gary -- we will need this on the merge commit in linux-next due
> to the changes from driver-core-next (Cc'ing Mark):

The merge commit for what?

>=20
> diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> index c0cd24481ee3..a4927452016e 100644
> --- a/rust/kernel/serdev.rs
> +++ b/rust/kernel/serdev.rs
> @@ -197,7 +197,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::ser=
dev_device) -> kernel::ffi:
>              // SAFETY:
>              // - `driver.as_mut_ptr()` is a valid pointer to uninitializ=
ed data.
>              // - `private_data.driver` is pinned.
> -            let result =3D unsafe { data.__pinned_init(driver.as_mut_ptr=
()) };
> +            let result =3D unsafe { pin_init::raw_try_init(driver.as_mut=
_ptr(), data) };
>=20
>              *active =3D result.is_ok();
>=20
> Cheers,
> Miguel

--jSgN/m5QDQfwnWX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0vuEACgkQJNaLcl1U
h9DJVAf+PbjrZ35QnhyTpbI2uRfb2QUwsZGKmI8+7qjfJatSK3gFoRVmOP6h/rxG
CKmFIZeVov4CRnf0CJr1uZF0JymPeXU6L0vbYFYZt7SJgr++jYkakvz9cGHYHHGU
+p7QqMDXG9ynH7NDAHITJFX133RCPC6L5d3Ro2pY4t4G9k6bFWiMwFb9bbSsb8rb
8a5LkxPsJaMmyI/A5Q2EEbEqXc6eTtiUZuQrzbEt1xZG8NKusZftPC2X5l1y4CAS
xWm0k3N0GB3goE247syoj/r5SZ+oyV0RTruvvt3+/ZddCecI5S+hh6/oXzFnPo6a
Sgn5M6QEYCh45BssPv8fG4/6buEgYg==
=wn1A
-----END PGP SIGNATURE-----

--jSgN/m5QDQfwnWX8--
