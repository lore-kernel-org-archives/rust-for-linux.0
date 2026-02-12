Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE43570B6;
	Thu, 12 Feb 2026 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770899031; cv=none; b=FtFwymdzaGV+BIM4ignAPYJqDfGqraCin6ITEv0g33xoAqgSzbX80ApuWCCOGsjkRbafE3DaC43oOanJMkB9WtUTaJf2HM3QVxRJoYv4G9ja2lFBKaRAuaHoGyhSi09/+UQyInOpPfqAfJP2+KkytZtibA2mhdykxNXhWLedwwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770899031; c=relaxed/simple;
	bh=3nk+50fd7HlNWHaDdsGj1623qHGABv7bsMKtZYB0Qro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEhd7L0vCk+Huh7N7MEN8ElWcdkPNEiQl4/1HTY0O1X8OWjcwOISTkAnnBV2xk/heb1LwX4eMMuuI4ILJkf3k1ddPWhDMQOmqw2xWkuzzBBJHp8yqlvkFmTDnbkvQqVkYF4mZcHVXEZbESV+ub+jLHtPjHWrS9oGRsIosjY+9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fdJ9OmYb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fdJ9OmYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770899017;
	bh=3nk+50fd7HlNWHaDdsGj1623qHGABv7bsMKtZYB0Qro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fdJ9OmYbui5EdEhkPHlyiUTMobzX/RqGMxCzijigSl3ToGUY5IJE2iy7d0RXXekY/
	 ONyeP8Jqy7GqXnBGXGJxfpL6kuELXYUCuZoZsfM2iN9YF4j4Xc4ssstBMoAw1lyJ2p
	 dRjf0qoG6fTg8iJne2wqE/6cMSlf5NUAk7/cWF87iUQBLAM0NT7ZbrTZdkq6Ab1zQf
	 pjLDZkpcxh3Qrp9qfaE5kuyACcPDTYWOQ8If9He4d1U6YfqSaja23u9iRRWKjmoK9w
	 ezdFwjTvLKS/GV9OpYo7eYUzofA8qKWYIbQgHo8HR0EIlARGZYFC48N0r6hdzKkiWy
	 cSF9+L2fHUnBw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B403717E0E90;
	Thu, 12 Feb 2026 13:23:36 +0100 (CET)
Date: Thu, 12 Feb 2026 13:22:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Mark Brown <broonie@kernel.org>, daniel.almeida@collabora.com,
 aliceryhl@google.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212132222.0708d190@fedora>
In-Reply-To: <20260212151644.4c179594@nimda>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
	<20260212151644.4c179594@nimda>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Feb 2026 15:16:44 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> On Thu, 12 Feb 2026 11:34:41 +0000
> Mark Brown <broonie@kernel.org> wrote:
>=20
> > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote: =20
> > > On rk3588s, `dmesg | grep 'tyr'` logs:
> > >=20
> > >   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
> > >=20
> > > This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> > > which goes through the non-optional regulator_get() path. If the
> > > device tree doesn't provide sram-supply, regulator core falls back
> > > to a dummy regulator and writes that log. =20
> >  =20
> > > Panthor handles SRAM as optional and tolerates missing sram-supply. =
=20
> >=20
> > Does the RAM really work without power? =20
>=20
> If the platform has no separate sram-supply (meaning that rail is
> coupled to mali), RAM should still be powered and work fine. Panthor
> already relies on this model by treating sram-supply as optional and
> as far as I can see there are no RAM issues on Panthor.

Yep, some SoC integration have just one power-rail for everything in
the GPU, others have two. The sram-supply is documented as optional in
the DT bindings, so I think that's the right thing to do.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> - Onur

