Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB108352FA6;
	Thu, 12 Feb 2026 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898615; cv=none; b=W7u6EcEIxhmr9ySNDSmZUTSHGj76c+YONRIWjsQfcP9DgDBmQ8q+/YrCqL/5m5e8gjs4ckHfpOwt+3+u/qtOx479D9HBJos8lAtDHR5yqUjCY8xLylqcozoYpEBzdMz2q72oL/iqn/TGeOOCtckqk5TPQMdAfaoLImwvAvreo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898615; c=relaxed/simple;
	bh=Ujv9JPoJoQzzRJHFGi1XQfQPJWU17v5tZcXF7ijk38c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4Ibcs3ECwxj7gEw1qmLRsaYmwUDY3Wt0zFARI3357PnEZ50xMGJHhZ9kv+O2o7EQOpql25V6QaAHFTodIGfOs0O46HC9yE0RrFyiAfzikB8sOTBkE6TKo64ZweiTHU4074YxK42uN9IWu+rhCmbdh9uBF8IbLY0muA24/1xAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=GeTsV1k2; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="GeTsV1k2"
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:b106:0:640:7285:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 308CA81B4B;
	Thu, 12 Feb 2026 15:16:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id jGTESQ8G3Gk0-NuQQV7gN;
	Thu, 12 Feb 2026 15:16:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770898609;
	bh=pcVQ/HWsQPlOx3AA8SIl++Ez9dHQYB3ABc7EeMn9rJU=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=GeTsV1k2Rw8lXsKzzu5CQNm2uWybu2c5u7UK+5xYORoeVvmVx/IhG5jZjW5nAjtyO
	 rv3OvcOvrKm1IcCOTzwLmAEss3wS7jsQL5MSfpd3AjWINT0oP9OvIbG3oTZue/scOY
	 4z6IoRLlOo+EGrWJkB6ebZeo0Gn5EnzJgwH5aplI=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 12 Feb 2026 15:16:44 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Mark Brown <broonie@kernel.org>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212151644.4c179594@nimda>
In-Reply-To: <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Feb 2026 11:34:41 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote:
> > On rk3588s, `dmesg | grep 'tyr'` logs:
> >=20
> >   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
> >=20
> > This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> > which goes through the non-optional regulator_get() path. If the
> > device tree doesn't provide sram-supply, regulator core falls back
> > to a dummy regulator and writes that log.
>=20
> > Panthor handles SRAM as optional and tolerates missing sram-supply.
>=20
> Does the RAM really work without power?

If the platform has no separate sram-supply (meaning that rail is
coupled to mali), RAM should still be powered and work fine. Panthor
already relies on this model by treating sram-supply as optional and
as far as I can see there are no RAM issues on Panthor.

- Onur
