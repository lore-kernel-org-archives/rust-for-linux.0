Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652233D6A
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Mar 2025 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979911; cv=none; b=gr67jGNIUdmMOm37XHEQsEyYEgiQ/5FIlUVrxhaBa0usSmVYThm4YWN0ulqZaCipv/Z/AiuzPZ7I0PeSBQeBKe0ESs2fp+pgaydUyTcZtMas63kFCjEvnVy4wGIASnh//JirReiEVl3cqcI6nKnbxjXr+pOvM6Mb6cAU8Ytc8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979911; c=relaxed/simple;
	bh=mnpakjbsWDJ6QAVeTop1dEsqx82RPFlsUvEaSg9Qnso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1FU81Fk47+d5daNTMjvJPQ68e/BS04hcrk6SUbcZ4fxH8NnbThnJYKyd4EI9Jhg+UZ0TnV87L+6MoFvU4Xz40eCMjyvvdJ7/ftyn/Q8L1jn/79BxUPRNjW0h/7sO0VSbh05jFS2xcs8nOdREqN6jBCjyy4ismBTjORp2WIObRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlzHLupV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlzHLupV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533D4C4CEE2;
	Wed, 26 Mar 2025 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742979909;
	bh=mnpakjbsWDJ6QAVeTop1dEsqx82RPFlsUvEaSg9Qnso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlzHLupVbXC7oA/dBv/3qAYn1HNw/X5aK2ip0IvWs2OhHplce5FphmYbEphDuBw3K
	 kBcCC+qMlmJpVtv1XkQmjk94iTq3DRFjI0JG9iaMLZsxmRCG2yWZ8OtUSZHmVRuW2R
	 t5hvpd/0BpIeon00c/KO0BvZgPBXK6cyIeKuHB4qO4rCcUV42RfQWrRNQrc5I7woTl
	 Ngot/O7k4if/2TkxvdRMA2cCQn8VSZ4hDZA/wJkOIJLM7fk9wm3hadLjaYXPllQvzd
	 E+U17Ih72+yLKJNR7vvzKf7vWimdXqz98SEsbsYTY5GeVngX140APL4Ip+dzYHz6o4
	 cczhzEWbIQs8g==
Date: Wed, 26 Mar 2025 10:05:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/8] rust: drm: add driver abstractions
Message-ID: <20250326-meaty-talented-beetle-16c5f7@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isazp2xhinn5rgim"
Content-Disposition: inline
In-Reply-To: <20250325235522.3992-4-dakr@kernel.org>


--isazp2xhinn5rgim
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/8] rust: drm: add driver abstractions
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:54:30AM +0100, Danilo Krummrich wrote:
> +/// Information data for a DRM Driver.
> +pub struct DriverInfo {
> +    /// Driver major version.
> +    pub major: i32,
> +    /// Driver minor version.
> +    pub minor: i32,
> +    /// Driver patchlevel version.
> +    pub patchlevel: i32,
> +    /// Driver name.
> +    pub name: &'static CStr,
> +    /// Driver description.
> +    pub desc: &'static CStr,
> +    /// Driver date.
> +    pub date: &'static CStr,
> +}

The date was removed in 6.14

Once fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--isazp2xhinn5rgim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+PDQgAKCRDj7w1vZxhR
xUWeAQDUf8hSkOKxfYvnjZemM9/6PvcrFrTM6kkpg1vPqJ++pQEAngF4F51QZcBt
hwYoQsXR5pQHnIaqtsZn1FGzQDY4iwo=
=PzkD
-----END PGP SIGNATURE-----

--isazp2xhinn5rgim--
