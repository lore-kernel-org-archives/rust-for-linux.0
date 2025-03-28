Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE91714AE
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173365; cv=none; b=sMfOkmCcocm0vRrlDe14gJD0h3xjbf30IyQBgU7eyE1H8yzlZ02n4MbjEnublcjG8bCdf7issxdFOmUSsMChC4rpyWCXD8qVQ6rBEF6lje2LWo3XxmAOFFX052R7DIrrwjI5JQLWul4KfmrLSHXy3JIH9NDdYcbJvmd7CIakSn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173365; c=relaxed/simple;
	bh=nCNyUjLSyc/6W6kjqwkGb3v5fugdXcWu3vUlj0/J0io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPNXPty8hkStt5PgdAdHicA2WRZSLZjNNMedfgGas5/WSJmYDPSjoVFDJ0l3hI6KqBFAMIMMNYijIVIPUXTCXDV/blLv3e+LEDlYY9moDc2WeJZEjeKaqK21WiZ9vMRpY+xdNfFtR9EzV2ubkok9KASzPo76VyTuIWWKukNJ8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl2O/IJ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl2O/IJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1728C4CEE4;
	Fri, 28 Mar 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743173363;
	bh=nCNyUjLSyc/6W6kjqwkGb3v5fugdXcWu3vUlj0/J0io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl2O/IJ3kxY83bZbkqCJ8RQmekSAMV5eHsQ5zUkzVYUYOt8af1jeJmXFyGfS8hSrJ
	 QMVZ7whp0cxe+PqsFK38DbXMJ4FfNyEpcg4oJ6x52W46ND7FfBiZ1Zrd4QlOD7ZyI9
	 FR7+VUAeL6lt5SmXC7NB++7ja6O/thAgFq+i9bojip+PQg6V8GBH051pk7k7Tbd/s1
	 b85DYxQHMstt8uWc1H4BEFYLLFwMe8odD+y570IuvyvI1CBiRtAQh4FQZo4Szw7gGX
	 p32DfkYocqmrmbWnmy0nbtn5KwAwh+EBZulYxJdE65ANQqr2ZODkfTjxbkAoBImZgB
	 rqyjtEwnbbvPg==
Date: Fri, 28 Mar 2025 15:49:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Message-ID: <20250328-pink-ferret-of-engineering-bf7818@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-9-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qeasnvjyl35m5qhj"
Content-Disposition: inline
In-Reply-To: <20250325235522.3992-9-dakr@kernel.org>


--qeasnvjyl35m5qhj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:54:35AM +0100, Danilo Krummrich wrote:
> Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de46acc247c3..c704431f02aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/
> +F:	rust/kernel/drm/
>  F:	include/drm/
>  F:	include/linux/vga*
>  F:	include/uapi/drm/

Our MAINTAINERS entry is pretty weird and kind of duplicated between drm
and drm-misc, we should probably put it under drm-misc too?

Maxime

--qeasnvjyl35m5qhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+a28AAKCRDj7w1vZxhR
xRGtAP0VrYpSSrZzNC5PFcDo/LsX6mq9K1YbjE+oo4gH1ajFdgD/Q6K8PqStFyYI
bymn5NJfQqYNLiouUXJmKW1Qfngs8As=
=U4t+
-----END PGP SIGNATURE-----

--qeasnvjyl35m5qhj--
