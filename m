Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985439;
	b=F3PStNLRLRN3cUC1F2feodHwsm1CTAE49lx35TgK59Eh9iABOYsPZ+av428EgZRygx5Q
	 ipqBjKVaobUxPs2sfA8tLz+3lQPf0XfUuJEVQEpWL7PyKkh/EvCYnz21KOiytBdaMMN+M
	 jXHSmWOzqTaRKosrpvggPGRWAAewcstn4JGPul3N7XFnyKWeG3iW+pqMB+nnkIkys7emn
	 GmYTgFQsDR9msXkO2ZaVg49uQLSdUMfRUPuxvb4V1tt2ZZstivdvHEvCF123aUvpjKUoz
	 G+gR65IC+rYvSe2fFRgR9kX+/phju+cdQ39k3SkyT18NPTtoa8Te69ge7cvAFcImvsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985439;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9oKtJzzwarYUJiv7jlPjh+yzmRSqn2gjanS9mNX4SlA=;
	b=shtGRjjfdhe/rakta0y2SbJOGJ5gSZzTa1SR1s7q7XkfkGzCnHRka7sOPlRLoOhfSnvb
	 ilhECRbbuyl4iERlrfl6CQcuvtbbYMQ1zaqhFis4jwP7RAaXnLlqcpAqYwVM8z6lKm03v
	 O5fTMLw4Hux5wivbJZDwoCC8tbWUqW1af/1NxmnTP5WKlR0mlfr9oa58wjetDotvTvM52
	 v76ozEkWQU5XKGNHTxDdbH1C+g0piH1zh4eJA9cXGKsxGyPWQY4ABtOjpgQYauVGsVKq5
	 KZBhzHd3G/vuEi3F2cSL0uKBRxmrWg6HOGjrywtxAc/gs1PQu0BDLTVuLjsIdREPrng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdsKOFx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600E606A326;
	Fri,  6 Nov 2026 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdsKOFx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F8D1F0089F;
	Fri,  6 Nov 2026 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985438;
	bh=9oKtJzzwarYUJiv7jlPjh+yzmRSqn2gjanS9mNX4SlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BdsKOFx8Fo9DJdwDbgz2wj26tgTqPDVvzevk5w5vP8mQcA8jVXw3UYC/USvw9o44h
	 cdyea92E4IFG01B5luPNipM0sDj8iD7OMpMMQjowEIZMatkgGLO1qq1TOJ5lnWadsz
	 mma+h33PEMEpwd+hBxaJbzYSLYNaFWCcbt0TZig4BThotUQH5QF9+x9XJyZRO+Zd+A
	 x7DRIpClp98U/ceBQg5rSHCPjxOGmqiUttil8hh2YP+DlC9v+kQjlNvHQZ6GpMRr+p
	 7KFB5e9uxQlvk7zwGC1mDpnTlxhSgrcD3KS6Jlt0F0krvhBmweGXrB7SX524xeUrA3
	 34k3GljwueBwg==
Date: Fri, 6 Nov 2026 17:17:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, robin.wang@cixtech.com
Subject: Re: [PATCH 1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
Message-ID: <20261106-overjoyed-uprising-bcda8196d8b1@spud>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
 <20261106104735.1651267-2-cunyuan.liu@cixtech.com>
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
	protocol="application/pgp-signature"; boundary="TL3BuhlNyfu8TC1S"
Content-Disposition: inline
In-Reply-To: <20261106104735.1651267-2-cunyuan.liu@cixtech.com>

--TL3BuhlNyfu8TC1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TL3BuhlNyfu8TC1S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4LmAAKCRB4tDGHoIJi
0qkCAP4lUa8NxvJSR4tsLoNVyXaFW5xl+a+v4xBkMN56edTbEwEAvt6berL7udJW
J6YV6LryD66prWkFjrzJlKzTHuNVkwI=
=bAJc
-----END PGP SIGNATURE-----

--TL3BuhlNyfu8TC1S--
