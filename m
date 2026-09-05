Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FBF2D7DD4;
	Sat,  5 Sep 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600713; cv=none; b=QzFXl4gF2WnLeKy8aEfI+Q/vwtW9lb/ebnm6YUtyVx9lDdJ5dkYufc+Boe9NEL9gSTp0Z8NFk0BG1sifcgNZlSQqFXvi84p8/HtADOAGLzqBhhJpAC5IT/OFlPT5to9nwLcxsu+Dup43tJZruh8xX6OvOmZCUTpCknuUOAS94bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600713; c=relaxed/simple;
	bh=FgZynRmD9vHs8fVwu+0Q3CDriaBiUT7qGyVPwjPPEjQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GWOo84Wwtf3xdrGasYM6Goxi3Wc/Ri5/6NNlyzUmF7JEaU8GgguLb0JUYK+atoPW3W6byDBFXFdtw2o/AUos3mw7z0ESBi7xRJh9GFThkoMUjbAu3gatPsdDTnpbeQCxIR+sKeMzIyXrqVB05JVVNk3Sb+jWT3Z8G5+Vlu13T5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XPOorHN2; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XPOorHN2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hcSlQ5BPYz8sfB;
	Sat, 05 Sep 2026 11:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788600706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgZynRmD9vHs8fVwu+0Q3CDriaBiUT7qGyVPwjPPEjQ=;
	b=XPOorHN2XqqDgVVKdA9iO8ExLdixgWeWmELPuWTKFu8uDs7B8aH8sADsc2xeullHDszWPB
	36vV03mphrZUTObIPvm4eWpaVsf6N7dIKx9crjcFZTFkbXxm1ePW01zsOLS6M8zNmoukqH
	TJmGBMEogljX33HIgNwmjJ43WeV06ZXZi6OIQXFGf29YMxICLqm9JWQpfsrLvvEyRLyrNB
	pTfr2Bzoqo2aHvnmeDqbWcejlt4R7vlSdz9XD6hYdU2C8dg2i4NZ6lUeek+tTWsov9qYvu
	U3P9QBqrPSS/VBa3PsmmQO5TzqM97caIefz6wgw2Lts8ytcl6yNcBXkV3WSNyQ==
Message-ID: <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/gem: Add callback for when handle count goes to
 0
From: Manuel Ebner <manuelebner@mailbox.org>
To: Thorsten Leemhuis <linux@leemhuis.info>, Alex Deucher
	 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Felix.Kuehling@amd.com
Cc: Mukul Joshi <mukul.joshi@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Mark Brown <broonie@kernel.org>, Miguel Ojeda	
 <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Sat, 05 Sep 2026 11:31:41 +0200
In-Reply-To: <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
References: <20260831183311.1090131-1-alexander.deucher@amd.com>
	 <20260831183311.1090131-2-alexander.deucher@amd.com>
	 <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 9d5iowodpfcuperubek5wusbfdpqohho
X-MBO-RS-ID: 780ec277d222eeaae0e

On Sat, 2026-09-05 at 07:36 +0200, Thorsten Leemhuis wrote:
> On 8/31/26 20:33, Alex Deucher wrote:
> > From: Mukul Joshi <mukul.joshi@amd.com>
> > ...
> ...
>=20
> > > error[E0063]: missing field `handle_free` in initializer of `drm_gem_=
object_funcs`
> > > =C2=A0=C2=A0 --> rust/kernel/drm/gem/mod.rs:265:58
> > > =C2=A0=C2=A0=C2=A0 |
> > > 265 |=C2=A0=C2=A0=C2=A0=C2=A0 const OBJECT_FUNCS: bindings::drm_gem_o=
bject_funcs =3D bindings::drm_gem_object_funcs {
> > > =C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
> > >=20
> > > error: aborting due to 1 previous error
> > >=20
> > > For more information about this error, try `rustc --explain E0063`.
> > > make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
> > > make[1]: *** [/builddir/build/BUILD/kernel-7.3.0-build/kernel-next-20=
260904/linux-7.3.0-0.0.next.20260904.221.vanilla.fc43.aarch64/Makefile:1442=
: prepare] Error 2
> > > make: *** [Makefile:256: __sub-make] Error 2
> """
> Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-43-aarch64/10951622-next-next-all/builder-live.log.gz
>=20
> Reverting this change and 2/3 from this set fixed the problem for me.

Verified.

Thanks
 Manuel
>=20
> Ciao, Thorsten
> > ...
