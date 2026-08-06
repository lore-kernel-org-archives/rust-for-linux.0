Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449048A2DD;
	Thu,  6 Aug 2026 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040484; cv=none; b=solgCCuY8gIdAmCb5AUITxZqRAlUU7zQFBZmDu7w30EQer5ceVYpiWCaoN0OGNiaFY0jfNl4UDATXHjii3kkcKq7oo33kE67yQdVlGYDBgJOGAgwomC3LVAGuJP492F8JlX0ulnP7C2uhBMH1fmsJ5CZ0fxlGU3XI/+sKILC1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040484; c=relaxed/simple;
	bh=xPuwthsu+FLNZm9K8avhVOx4b9YAP/eBMgBB7ygt8nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsFBRs7jwL8MPCoRsoVggPUsXVifR/ofqK698moKoXL2uDokH8TzE39v6ECM9qOlJtGS761w6hbxn7NTbz5MAbruGlF7LHxzPisbHj55mGmoCSaOkNLUIoS5rxizLmq2zKSulUuWCy/RIWZJ/TOCpJ9XiXt2sMSMXaiuJ/zHJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZRyKrcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZRyKrcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048A71F000E9;
	Thu,  6 Aug 2026 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786040483;
	bh=+M2sh8XBulOkRf4S8y2053lmdd7XaENfOoPyDPt+9t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZRyKrcD0Jy2qlI1rlbCFZ0vouPPhXkUwA7opmZLyholqiBPoGaazHYuwJVMBmtgn
	 sZazLkRd8AE+bgSJOjciFZeoTVYuP7gxD7z+1Ys7ptmjqAsuC1BE42d+xnAw9Skd7j
	 bbS3HeWzYKD7W8XK9dduXtYIGZNfPn7agwJE56PnRuajJyyVfB83jt2FGRRTghpqkr
	 6wiM6Rw1FLBX4mQM64SjOX0U/PWKjbsnCeQ5WE5v7UHvvJ7tagGhRAlEtd+XnhYw1N
	 Ihn3ZtNfsTEgpEVCYd+6VS/mWLGiGGzoznWt69Ric5cqBayJ6W54ptDytLu69YoSG5
	 kdi67elBmZNtw==
Date: Thu, 6 Aug 2026 19:21:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org,
	linux-next@vger.kernel.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
Message-ID: <5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk>
References: <20260805190012.2934907-1-gary@kernel.org>
 <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
 <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
 <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
 <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hknfrg9Eow0WkSeX"
Content-Disposition: inline
In-Reply-To: <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
X-Cookie: Brain fried -- Core dumped


--hknfrg9Eow0WkSeX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 07:53:41PM +0200, Miguel Ojeda wrote:

> (Please let me know if you prefer a proper patch etc., of course)

In general that's going to be easier and more reliable than copying me
into the middle of a thread with a patch buried in the middle of it,
there's a chance that if a subject line isn't obviously relevant I might
just drop an email unread.  I get copies on *lots* of stuff.

--hknfrg9Eow0WkSeX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp00JoACgkQJNaLcl1U
h9BHjAf/U+IetpBgXfzsbOeAW9renFIc3/jjOaRggadcvGqfwXqgTZrU8PHuTJZh
BaVSazxkhLX/ZY7VyuTlNU+eS6cZvVuGCSYsTCGrPeCBgbnuByqp65hZJ9GbzU8H
19lU78TIY5ldjZ+A7TVjQCcOcvKsoaEwCpVzY5H5jg7bhmKkHWM4zhgsO932itdH
YzWIxjIpWBAfMGVKi+J3uJsREs4f+LJYUaqxGhgA7BK0x7cl6GDplU4j5yQamVIb
4l0hXy31PlT3ZsDKpGi/T4XChCvyxMe34gHB8A/oTuDY4AFjsA4iHoWFsrgBziGs
NMLetkxNU+Jbnpyq2V2F4VHxooaRsw==
=WGki
-----END PGP SIGNATURE-----

--hknfrg9Eow0WkSeX--
