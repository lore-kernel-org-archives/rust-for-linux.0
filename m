Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02AE26ED59
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769795; cv=none; b=dPfViR+bgi/wAHhesZC8q1Xayu4YafpQReWbtWZavRc6Q/5SCb4OpH+kXx+ax/5QQcNaseNo+ldl4TaZqnI4lpyNN7GqzkYmwVs6tiJQhhA9b18kTclpZKRppbrN1dvqQuB/2QIphTM9l6mbkhJAGXv1lUd8C+kdnkigq2Msm1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769795; c=relaxed/simple;
	bh=YGQAEjmAzZmM43FCjwJ92AtwcCRmR31MyKsLDZHjdfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufB5IxpZpG6ZgWOtX2fXq2x0WO4TjTVbERi7VQZLNGg9CxPPo9jfLqZzldaS6+9XJLOylK18TvlZcqZ8/FAiWzM9RcecnxE6TABgk6jgl2pTALqvY1knB6u7TfYMAxS9TVzNCpAmJIiPeAWIk/gMZQ+gxXtYoiMK7ac2d7ltbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WCULEEZw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WCULEEZw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd27754bso33536835e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 00:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774769792; x=1775374592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGQAEjmAzZmM43FCjwJ92AtwcCRmR31MyKsLDZHjdfE=;
        b=WCULEEZw/Q+x/gorA7XZF9o6umSdxkXcQvzEq4euXgZ4lpCiLXtYRXLJXpCKO4phpP
         UFgs+NyEgyFqHzey92FGMhHFqc6OybgfYWzQ63CjNrfQecEmBQwk2rq9dA3jARGiWIhh
         qpIgV8nkplBMtFF/DieZEY3U0OmaQu33YRy5PM9fw2I58+B2aXGUJ80pqHmdqcHxz/eX
         wf4nZJOQea4JOUpnEzmwNkBskxut4HkozSNf2K51TXA9uB8xX8PHHrvHnpu+HcJ6SZpU
         OBQxj0+vGTQdlv/ns3zxP26dPaN5a4GVH8x2lfwT4zxkjNH1p0OT1z3RQjXfPfCm3/lv
         Bq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774769792; x=1775374592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGQAEjmAzZmM43FCjwJ92AtwcCRmR31MyKsLDZHjdfE=;
        b=VqWM+Vw0N0kqesM4u5khG3aWTipESdMWP4rK/RpwzCNGfKXoxizwgAAJM2NXZ8fKL+
         D5Yzw43aEzYNlHwtQmfQAH+Hlq5Pwaw3fBtx6dFloDv7Npkn8U8vT1BgvNoNqee4TwU8
         MEcPXFbKaNywnJ8a0aeYB4HqjBiICF5xWLkZXO9gEsdpjtm/ANXnuOnorYXdD91l0cut
         mCsIkXvQSg/F49vU+1FCL/3BGw+8EyX2kmSV4R94DC36XCJjPTn0FNPydagNgi4f13Y+
         RVyYeju5PB1mJZ56078Gq1JardkPdk+xdjrGsdpf8xPBTnWzas6qljqjM3GemxBqfLqn
         /Bvg==
X-Forwarded-Encrypted: i=1; AJvYcCVzDXigNPqIIy4Fken+wNsMX+BK3yr0mbw5Mc9DWdt4UWLWSn+byCEabRkpIN/ouRpjwFITyctf113JoEDuVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy3zVOe9GmD/xY3XGhtusXS9d6BF2r81s8hu0AQI1owcLYtdwO
	2Dq4W8NdNDB4BH21g6Y0qHbsZ6laI4dnl2qw9pqRL51jBxvE1kFBx2CTuqiK3ZDRiKk=
X-Gm-Gg: ATEYQzzLM+oqNv4QCVvlyl1p/7RGKbZ+bUvJbTG+ctgG3tQTpt2SmsDh9Nt4X0vnqYz
	YhMMgd7u6Y9bgRhcAcVgkliiOa3sk7icoJ2jGzIkoLyKb5beyKprFplmSvnkS4usoNLilPNHQyQ
	jA8Fs9fupcLQmVVf96VJ3BgdsMN6ZLmS9W7i/WmQ6VuSgrNYXWy0PkLeDp8v6Ida8fEfg81SGN2
	l2yBDyo7TQ56vVl/5rlkoD/rJI6my4i8n69wDaDPuIJsK9R+pvmD0Nf/1paJE+P2qEz8e2tNd+i
	5TttG9Aq0n3sXfk1rIrG6UAJj1ofYwLJT+tezb/+mjp9ls8Rtl6ET3KsduT5R6vQygBnQlKCGus
	qVy6l5tYKVXEvjM0ImUQUnEqs6tElW4r76mnpzMcoFG0eLpjzC6+WDqNQU8Y7F6sg87k94SUPB/
	x1n4gLNynwA6NADUXGHXXM0l9nfyBY
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48727d73709mr136213455e9.12.1774769791514;
        Sun, 29 Mar 2026 00:36:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48725fc4827sm50781685e9.11.2026.03.29.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:36:30 -0700 (PDT)
Date: Sun, 29 Mar 2026 09:36:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Message-ID: <acjVGgDLnYAg1UAc@monoceros>
References: <20260121183719.71659-1-ojeda@kernel.org>
 <aYmgjEWaLrdsubKM@monoceros>
 <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5mkeeaofiokcizu"
Content-Disposition: inline
In-Reply-To: <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>


--v5mkeeaofiokcizu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
MIME-Version: 1.0

On Sat, Mar 28, 2026 at 02:53:17PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 9:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Looks good to me. I'll wait for Michal to add his blessing and then when
> > picking it up tend to drop the Fixes line. Or do we also care about
> > CLIPPY-cleanness in stable?
>=20
> Do you plan on picking this one up? Michal already reviewed it.

Hmm, I guess I missed that because that patch isn't on patchwork. I
don't even find it in the list of patches that don't require action.
(e.g.
https://patchwork.ozlabs.org/project/linux-pwm/list/?submitter=3D83457&stat=
e=3D%2A&archive=3Dboth,
or
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D&submitter=3D=
&state=3D*&q=3DCLIPPY%3D1&archive=3Dboth&delegate=3D
)

Applied with s/arithmatic/arithmetic/ in the commit log to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

Sorry for the delay
Uwe

--v5mkeeaofiokcizu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnI1noACgkQj4D7WH0S
/k5Flwf+KzKsAaEdMl6wSc4xOfiDF7nzYo0AsBFHTxGvoBdXye3ZU33stEw3kA3L
Ugumdo7+UHnF+8b/QzgIXeLtcYyHxgPN52c7nxxsXInEd0L5w//y/W2WdSQ6HbJu
icpbYEBGCM0GvLemMP8P42cnchR7+5a6G5fbRqygGXgJn+8Zlyf/jzWaZYmPAEvW
gZ47q1NgiKby1TaIKgnEPKe5Gqa98+zOxQF908RJ2/43/TPFFsVIfP4koBGqEd17
64ocAOTcKSQokKnMN68C5BZGaO7eZufI/IvunxoHu8R1oRC3iJU4zxrVOMX3vt37
lZN8EC7XTOHJ5xkFaPi0T2XNqeVFtg==
=5n6k
-----END PGP SIGNATURE-----

--v5mkeeaofiokcizu--
