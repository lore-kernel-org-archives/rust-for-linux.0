Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295613B52FB
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349307; cv=pass; b=VfIKUhgGfnRMyZh1oiye28mCArAj25k5+CCTpS0re2jQzEa5fPbE8illmSJb+jxKyuIxOG6YIQul9AiIJHb21WizfiRX8PWA8WRIii0Pgu+zkXOMchh/v3N4mJHPdSzxgHcyH8gbJCSVThGQGchdj5A+WvLE8U1JdsG+kDTUuPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349307; c=relaxed/simple;
	bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK4b8q5ThcjojxwI9de9VJXw+R+6ZJFs5FgBrb4SJtZcu5ul41r8xgxVZ9/lt9+/3J1tZ+ohjGam4dH5EOY/tRJEanEazGkl+wtiTXBf79tXmx6/5bg/UUc2TKrKE2MlNiGbX+tvwMB3PYDAjCH8CIRap/ohz0g6sCeBv3X/aw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZJ2uH/7; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZJ2uH/7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c0710afdso1033802e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 07:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776349304; cv=none;
        d=google.com; s=arc-20240605;
        b=USMzCg/6GoQhGjKFfMBdfRj/C1h983cOw/fmK0spn+RMTzC2bj9YGhdWtIcIWV46EX
         k0YBWFlND6IESdhJ3JlLyzgFSIoBgDbV6NUT5ZDY1uqNEuPC8Ca2nK+Hps3/ntndEvHN
         1OiPAgPdd2boREfDQsaoLOYwumvb9DbrakRFI9xN2oC0SYijIU/Pj2fjNcsO+DQ++U51
         TvilTN+0L5F947kPk3EXfwbV2z1kKfkyJANa7SqY7xxGJnUWvNdLO9dyiejY46uifEWZ
         WIczlpRkC+p89+PUwqtSAz4FYkhvi4g/px5+4mOrPI/1lbHBEqIPuIAFSMoxxO6eRX32
         mFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        fh=mU2oy7qt8LehYKn2x8KqY3wL/RRQn9imKdxZ3Je9yKc=;
        b=XYETz9wYzB7qrueMAKFkMqoiOqVhPPRhg+c1u/N8/l/8BspXmiall+T7aMoMg1MOIL
         mCiimyna42imtEU/G6wAaJzVGoHOuNoBY0D5FzT68SlBGABk+XOXhdXTf2oeeJJdd6Qb
         1VzOSjOncgI6e5UMPS0qwTVMKowSzDmknVczGgBqnvvzm3Cjbbwgz4Y9LNtFbs7Fp81J
         PK7UFiqy1oGp+XoOgqM3vBISpyGVIwDWIYPOl51/MoNiouToOntCkS+v6tsPBm8tedsu
         d+l2msOkO7UUGVsEwNiNFS8DTihEXrxPs6HoJxcWQ2efr2gnD7eHa0hUHWajKCYBwDTQ
         uRTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349304; x=1776954104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        b=ZZJ2uH/7AIlncy8xue0J7AFcTAkBXPh2SnbPtGx4uDCvJPU6B32n8xAUhTf419c2FY
         Wj3xj6xb+RzGmcgNmSyHP70ZC+Fuuf5kA7CuBqyxYfw+eKMsWe+TAefn+a8KgWz8npFm
         PcdGwlxpfy2F8ZwThdygYOIGpyW3dUJtPT+smvDc6wPHblo9JzSePUyub2tK7OAbBtL1
         EqYNm8VPyrxUkVyHU7mnTfYf2B6IPepWxaHckIv3cPaiTfj2GH8TvkiUOn+8hkSmygId
         eVtGf0wo4LvFzPJKDqcgZmx0NicXDzFaQz+bu2OgMzz5yuHQu1Y+vECiBQCOaFSPWo+J
         A3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349304; x=1776954104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        b=O2LNiRp4O8IohBJX9PZubDA4Eb0uSp/j28icKZaf3yZQEolTRmHBdVQFtputONiCsB
         H/NSZ84H3/cQ1y08wG61etdddzJovseT8gsooPXm/J3GcOrFKCg/AIuZrAPxmIg9DaaO
         j9XC8BFcHdc7aeFZjQf1U1qmXBPeY+uJg43MzDQ3uCPQyr3TOAXPHnsYd8vMbWrilemS
         klgs9FWisT95NzeXd8+N2Va3e+I+N8PhoOwRfMkGk7FCPZ3fIF/ZTc7rJwKEpBeOpUIu
         IhO/IO1AEeMi01bFR2wQJDv4vI43h6T7k1AXnUIFqLnsMd3YJZq5iquKC+8LurO+q229
         Qotg==
X-Forwarded-Encrypted: i=1; AFNElJ+A98lExxDItJZ+CqeOwJknsjnuh4jiN3eexgv6p6iCCSKLZ+XqnvPGUOkffYREFPV/FeF10Z6OtKaVqsAn5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCVesmK9WTZe9gbYkoJa30xe3B9BpiJY/mLh8Xpte3JzGPaGL
	evoq5u2sBNT/EaIEBficNOMoPs4RxT/rDpLRQF/EVCd/U9Dgz+XAYwLGHBo+caHXKyLM9SWh1x7
	u14EUBppeUPnU76ytjH7YLXUirU42vws=
X-Gm-Gg: AeBDievhBRWMsy00UhzHNaz/Idnq9Gy0f2gUcF0/KwoySntSAOlVchNIhdY7iLuPQmc
	dmi3qmiLrr8FYSdyvCJzq0Idwh1ywHkvUCY3SxNRHJR4Ejf54SXmNeFAHY7/V1IR1QjBjXZgpCW
	4b0a2qeMjVSU7kcFIj+lb6VunsZStLchzQm2Q3gxGGeMcFnpswUulZN5k2nzXiCUdH63J2V9+GJ
	MzBVRrm2TEc8xHLA++Zl55sK7vLN1rE2rMsrxvog8gbOoDxVX0x/r+Cmd4n40wtOyZn1mAuRS7g
	34RvSjtk5qudK2Kmo99MLVqm8yih+FqghhscXBz1bPWchpE9c01QEMSwGQ8HMWj8UvEQPeV7dpY
	hwG8Jr4rcb4X3/ysj29+KB/Y=
X-Received: by 2002:a05:6512:3d88:b0:5a1:38c4:424e with SMTP id
 2adb3069b0e04-5a40fddd84emr585786e87.7.1776349304126; Thu, 16 Apr 2026
 07:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aeDrt2FkMD6ZWaVS@sirena.org.uk>
In-Reply-To: <aeDrt2FkMD6ZWaVS@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Apr 2026 16:21:30 +0200
X-Gm-Features: AQROBzDSw1n5xKGRMRYnlZwT4qYegkVwm-YkQL-Am7-V5rgnKG2Nddsqu5EA96M
Message-ID: <CANiq72neRbNCDYaF3Q1Bj5Jt9HrE2LmLksBPR3VoFokxHfurMQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 16
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 4:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Starting from today rust builds have CLIPPY=3D1 enabled.

Great, thanks for this!

Cheers,
Miguel
