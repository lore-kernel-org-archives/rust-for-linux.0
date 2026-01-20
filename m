Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC944BC8E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932137; cv=none; b=eKU+Ja4xs1BhUW+KNIJvNm+WLg7bY8xSK+8NHhOnObP7ooaI9BZwQ4qjp23QR0Qe+LpXbj8jT8g8J+vRLY/6IjDBc9h0wI8DmkDgKFSRh3gHQOm7PgZSAvL6w7Y3LnWgN7FsVt9oTtbeJVDfQzt3A77m/V6HPR7vN8O8rpF7Vy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932137; c=relaxed/simple;
	bh=1feF74p1hZuJuzZ/zjxof/doJAtUR/T5sZ3KS8Yscfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPQ3LcLV8wfSFbUuc/BbuLGGZQioyIldy3CDKSEX3sU5LfR9lIm6FBnT6bVpAnJQ+2OilAXA5Moe2O3IKpgBqbyGPnyB9TFgZ7pvTjxjQK3G8diWfSqWfCXoBVxZ3rU/eNyEi7iVxFltvDrLL0deLEZ0839CKOERZ8sfk27F810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ep6vB2aS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ep6vB2aS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2670932so4410885f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 10:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768932131; x=1769536931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbQTjruPv+79bC7NXUKMnpFpvOUvYwvd8LHHgIF12mQ=;
        b=Ep6vB2aSYaZy/IZdbrgU+uaRbpqvP/9b42BsiXEBt99zuGXKP5n/1P9tTrxG7rPg/X
         nJPi8tWZK/mmHHxaa8Sagbk/BmdNTSYCTDD1ceOgpufgMfnWYOfjnFovOAycqDzq9TQK
         MHxrz+DsvEA7kVF3eYjS9ZrP/90+XKJGlVEnS1SDL4+C4xg9hnH9FY/hu10wzqqO5gMT
         bAuhFmoV4n9G28CctrANHpoXVUHiokIeFzVe52POVPI09vFczq+4zoTSVqko1uU94xYr
         FZAwuaL5cSAXdiSrnOCtOL4RTKmXXOr0493Ph86n+JgUxSUQduCWPWilKbb0n10KidPB
         F0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932131; x=1769536931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbQTjruPv+79bC7NXUKMnpFpvOUvYwvd8LHHgIF12mQ=;
        b=OWjxmYc6HyQu8VbIjTR/etXbxtzLtWUZpfxRmbhg4Dwg3pAEygJeNFKyo20VQbiTs2
         Gkcw17cJBR7zrlHytf554lHF7zrvced5Zs3D+rfILWXLnDSyoXQsFWYkLx8IvBOPtR9m
         DCsdjA9E0awoqFd/5G3e3AXC/aHcAesZf2oCaVVBQaUptOHkV0E8IUjQ9HbhCMMEBgst
         rcBPNwUNKnBNFJX0b2sQBaIBAa/uxpG7U8QqAWmdeMo5LYMxoWiyZMVCt7GcG3O8oItW
         E3+/Ik+NvQbS4dFH5EPsn+ADQiyUSIbNlb8BTgpHaEu46c+oK84BnNjFM4+U7P+11vmh
         ryGQ==
X-Gm-Message-State: AOJu0YxOr02meelIDCd/fupEP2m4D3ccO29sRxh6KKs3k8rE5gSuOxLM
	ILNU80yaVSZ61s7InELIXRRn+aogg9TS9RZR1PYBru3RwSpn0Vc5FDFPlmMWDyZ7G2+WcwT0u0C
	u45lc
X-Gm-Gg: AZuq6aIJAiypM45Q9h+kaFa1/AZv+vCYdHJK6+py3otqNWwPUKik2PMgzK5zYHb7qnj
	Uo/61WddkBzYL1CejC0kdCO+Fpi2kVmIPTsosTvGd4509VACmJ9IUbGXWnzB+aDIDYFUm6cNg65
	CjS92rUb8yPWSk/u4G1eODxlupQ5cn+mVvMFps+igeqmEe9HOf1yLdZ1uc2fY5qa9BIHE0/Y9iK
	5iUD22l6LNjRMPu3hT8kZiwdoQ5xbNAVRZGbplOtNSoy04hj4rNfaEemSiMQZjSLgxUURj2fk4N
	ThN0YSodFwuyEpfjFZ2SWCt+AOhCaKICLFec/n8pV8nuT0LEagvoCwsOOr+WNSrgT/aK7/HqWx2
	yfKKoGjx62f/VgCNZBehqdvMQHSuLBguBbeWBMpljZiCh1JKXjvw8EV8XEM5IlWrChloEODzVqS
	SoYkdXDxiHv8DFeU40A7n+Vj00leTzhB9wT2GI0DeypEOt11rUbvUDSQxdg9A8klGlYcvZ/ObCC
	7s=
X-Received: by 2002:a05:6000:bce:b0:435:8aa0:a30c with SMTP id ffacd0b85a97d-4358aa0a34dmr5194709f8f.48.1768932130909;
        Tue, 20 Jan 2026 10:02:10 -0800 (PST)
Received: from localhost (p200300f65f20eb0448044bf769fbb982.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:4804:4bf7:69fb:b982])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43596291e0asm2105352f8f.15.2026.01.20.10.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:02:10 -0800 (PST)
Date: Tue, 20 Jan 2026 19:02:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Wilczynski <m.wilczynski@samsung.com>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 14/27] rust: pwm: add __rust_helper to helpers
Message-ID: <ejdtzcvxpz5iih7o5ppgpdo6npdjut6utofacdgrwkdntvurhs@vgiuagsrzo6b>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-14-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b724s7lxgfngeqjj"
Content-Disposition: inline
In-Reply-To: <20260105-define-rust-helper-v2-14-51da5f454a67@google.com>


--b724s7lxgfngeqjj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 14/27] rust: pwm: add __rust_helper to helpers
MIME-Version: 1.0

Hello,

On Mon, Jan 05, 2026 at 12:42:27PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> Cc: linux-pwm@vger.kernel.org

Applied this patch to
	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next
as merge window material.

Best regards
Uwe

--b724s7lxgfngeqjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvwx4ACgkQj4D7WH0S
/k7S9Af8Df5IfayQwO2CKCypBfDYh3ig8BbcsVXk1PrCDqs4gsZ/tsbSTUwWoYgI
Id+1r1kUyJ7ssv7Jsh4IBW6Yu46TKFKVUtzDVKveNKFlL+aYn9zdipnYr8xH53u5
ibLNg7n6CnI7hP2oYb1+nnZpCWdOBufQXm9zapjIMkTXl0bMrndlHyVZI+gz+bWD
f8fhMKfKiHPp9Oq5wBMO3tAhAqt6EO1XJnVyM9EoJG8gx5cX8E4oclQun92XzR0h
eR/RdRi7aMeX3WOolRzH8EWeb1ZSFyfOPltbocl3wAvQw4Ojc4Sx14xTXr6IH+Y/
1I56LvvHrlkqyRoflNIHFXAy0fO0Nw==
=a+NJ
-----END PGP SIGNATURE-----

--b724s7lxgfngeqjj--
