Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198352F872;
	Thu, 12 Feb 2026 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900370; cv=none; b=IEl+GHwsyxhWnuPwr+RXxOfQ9R4oCzllLrW/e4VHdES9vBpZS9t3DGYOzp/v53ry/KE39zD1o5ySlrVUP8+qAFo/UH1QDveral3yHTc4vaoerWTP1Gj0+unvP0h4rd60YqVkAze9Mkh6pWtMZYmdiRxre2bqMzmvrLM/2Guscoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900370; c=relaxed/simple;
	bh=O/gsN/oNoD6OdxyEWVVk3ToCx9BOXvmAMQBNhd4XEug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpY3yd+5QEvzFqQWhzNkBSDz2CbrgSAKmMPmpiHpxq0fuvZWfn+18kt3pZX+MX2tMoG+WTtl1Q+mFQsgThH7GejH6Q7fF9Vg3e8bUUJiAEzLx/5XuDnUBculDPsOGCbak82jQlzKwOAEDshuyd4RTXsxBTRT1Hu2rk3ZXIZYxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L9sxyDAt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L9sxyDAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770900367;
	bh=O/gsN/oNoD6OdxyEWVVk3ToCx9BOXvmAMQBNhd4XEug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L9sxyDAtxLSrw1ojxnBV84pgcZcAlV38Yr6wYYBlVthlnF8jXTCIW5Ame0buJu7cy
	 l9jrbhOJPq2Q+zU0nq61EwN1pAtPzEnqHyVYOoxjAxerBE2AF/qrdArqfVSYYyTqq4
	 TS4u+xpeN5zcHAKzeK+ZvhgQ44A4uRNVASua/wWSApZ6ou3FhtBE+oRbX4gtOV4rEg
	 z8FHCRRqLx+4ajb5lCFQN371EaAjRr8UiaG95odx9vKSkm6oVxeTjbT+llq2jRsYjg
	 F08A+WAJ2Kmeph42N/BGo1IO6/bn09E5sN8wQz7JADGAv/YhN0xv5j467AFv+1+rRm
	 Y4dBYvivmK8ag==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D333A17E0C21;
	Thu, 12 Feb 2026 13:46:06 +0100 (CET)
Date: Thu, 12 Feb 2026 13:46:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212134601.7760f414@fedora>
In-Reply-To: <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
	<20260212151644.4c179594@nimda>
	<6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
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

On Thu, 12 Feb 2026 12:21:07 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 12, 2026 at 03:16:44PM +0300, Onur =C3=96zkan wrote:
> > Mark Brown <broonie@kernel.org> wrote: =20
> > > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote: =20
>=20
> > > > Panthor handles SRAM as optional and tolerates missing sram-supply.=
 =20
>=20
> > > Does the RAM really work without power? =20
>=20
> > If the platform has no separate sram-supply (meaning that rail is
> > coupled to mali), RAM should still be powered and work fine. Panthor
> > already relies on this model by treating sram-supply as optional and
> > as far as I can see there are no RAM issues on Panthor. =20
>=20
> The panthor driver is buggy here and should be fixed, the driver should
> treat the supply as mandatory and let the system integration work out
> how it's actually made available.
>=20
> Trying to open code this just breaks the error handling.

Maybe, but the thing is, the DT bindings have been accepted already,
and it's not something we can easily change. What we can do is make this
sram-supply mandatory for new compatibles, but we can't force it on
older/existing SoCs without breaking backward-DT compat.
