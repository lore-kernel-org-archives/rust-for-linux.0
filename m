Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E82E5B27
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769260503; cv=pass; b=iQnC+hrKWr9Yf3KRxVrh8di9EDwTYgBQR77owZNeXASRZkd1hkWNQIiyd9GNS1JvlX+TsMK0MeZNZrENVC38WDjJxUAV1svT85nEIoJXfsec6NKREU+k0vD+eEYh+CyK9NmUcdZCEesxq+YyyrXVHclRCWN45YVnMa/0wmkhKNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769260503; c=relaxed/simple;
	bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6I8RDrI7c+jcDcdpt4RTNwWO3hYC33z8OEMmGHFxOMRi42jUw2JQpwoIXs1OnBOUqMkvhmzaaODyaLhC9nDD7oWtdH/lqCMMtAUSa4oebC04Ghi+zY3fA7vG6Whkji/+CNB+tunlsHmsthgvWnepLHDMM6MNsM08uszXHTpcRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIiDT+1y; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIiDT+1y"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6aa67a792so111373eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 05:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769260501; cv=none;
        d=google.com; s=arc-20240605;
        b=U+CWg8vovLUBeoeDVIxj2yQ1dm0eSA2fANPTzdJq2HKgTVeB2eu/qX2+iwOkdPexbW
         tPUMlpk0P77tVjbBvG29FHMMEjw/lm8Htr3HkPM7VFJRsLXmbO54rtsKnlNBubYy80Ae
         Hcr4HEa4vtE/Xdtv7RWt6Ws7yIEnESW6rXwOntfIC7IZ21pOhPYK8pHgonVMc19WJdgn
         OSfZ1As43LHVqcv3CAxRQorUlMaanvK8SVbfCSdA7YuDnml717rDQ0kEqFOaEw5SU59u
         V+R1OswG+GD1VLl8n6/PgxrjhRfMNntvEsYU+q4Ig+N8l3alVL1pWQisgaqZ0IeU6mZ+
         o9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
        fh=b72xl6EqjAKrBvoHlWsOWSz+/2EaNgCDqRhVmQNTYN8=;
        b=SeLa6+lnRLPEnWzqf0iq0Or/xjXDf5y2RpjhupQr26iCLLkz/obqBQ+Gq2bUjzEt06
         c6EheJJzBvHPoMM0JuuVzn4yWmRLCTV9xzlIXbZvs3IsGIuf0GX9Z/2xy3mb3jC8XD8F
         g4Avl54i8bKWil1zc4mA7uRgH1zDpqsVPhdvggaQ/3/o0Q/rWNbsBpH2Lc3/ABRHKIiA
         Um32WzRZuD6rjUXZwAQ7Cv7kbs23sA7Z2fv59Oi58TSMIsgxda+e+1wXzKKAo8ajpPMc
         UOt3nu4IUAWvVnWTqamA5qzpFq25vV98A7kOBxmMfbe/lEzGMgg8AYdXUrksmTdJAueK
         wStg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769260501; x=1769865301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
        b=BIiDT+1yoZ2zcKBQ6Zd1olj+jruvS5sV1u0h94SF7HV/3FWUPIlxmdtblVbUMwE68V
         /b9nImO3bqQf7eViSGSnyajmzBsUxbpQxAicPIgUEL8dg6FiQR0ALgJyyCMZ6XpLwrhe
         UZoRT9kK2HmeMSUmua55+M7AtCvMwlU+Noz1WINZT61eDbdwut/vHKT/K+QywHkoJ8YN
         oFyZ5DFk5woNrr7QEDTA0C7O8M19TV7gJtnMo2u4myMTMMh+UBCJX/rbjk4bZdK7S8MX
         CbzQnOKEkDZwKbnqrW/dgcaxOiqB/Q4I4niKa4S95V8glq4lGrHIqIA6KIRfEH8OmW6E
         neYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769260501; x=1769865301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
        b=JuwLUZNFq+vnPAjO3i/5ief6oHsRFGahu30IfunQwCT0FZWj8SYZQHom5mOkcwz+EH
         +/K1v1p+67lSbXjl01xORnW9AWfHz2TOMXnZrujmOWO8rmpogOfqjQUnNW5nzdW4/3Fb
         iE5FjOsTxjDiodRHVxSwmY4Ya+tNbzzWp+PvWMPHv3Q9MAcM5RlDT3z56BpzmPeC2sCq
         5cBQhiAqr3TEe3V8I0J6bw8gS5mTwL8or8CJh+knhTcNpLES0XyXjbYFgcD8+Mpcz49+
         E836ivIAJNXijshbf/VKGy2hGP7AacReaNUK2Y4BeIBgD9zZUpBTC7LkDFnr8Wa93LxL
         w8gA==
X-Forwarded-Encrypted: i=1; AJvYcCXAPMeP/tQBBCcRCEtZ+NOlgEEjIO059UgZkYsZ6mi1w0IbTiBH7+ZPu5BZzcK9WHQZ9hT0nk2E5q+aFDrvtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9imWvdWsqKr/7E2JcomuPsotABRpwoUYWKNjlH9U3uzKwX6Bb
	5Fm+7BS7mnu0Bio2tHa11PIZ071m8wRlFdx/+61W7RExJtr5ago1qVUxIEe3C4ylLidrf17VoSE
	EpZgcCkhb7uhQUeU14pReNuFjK7M0uLs=
X-Gm-Gg: AZuq6aIPlHn8MywR4RQvnSiY7oKLaQ99slUecMHYBRJyKrNsrR4SWgAqfr8CK7Z5M4a
	xBCQKc2Y/VI2QQei5Y9733u+N/ZI14vrD5u1CJI5CoW5aoOsYKGn/syw8Vj/JkzxBLfYUyeT+7i
	NapO4/jBStIBCkHjrxnou1zefYL4zJCguTxTS9BscGiZZuZN8G8JoyI5uVgcE9XIz7IQtKKtBfX
	dFmfvvq0KiAUV17xBmZKiqvwAnRk6C3BBdlh8qCCAovNMXVaWsf3hUrHcECK+Yh9WFYkjBBfK/H
	TPrSj8Mtvc+JhlR3oXjWitsXcYcbfcabhwM98bM2LuYBprfSMV0aPE2pY5jK/zY82OalWnoDvp3
	XmnuA9DW6VQIHG19YdNOy8Po=
X-Received: by 2002:a05:7300:5707:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2b739998d29mr1718285eec.3.1769260500501; Sat, 24 Jan 2026
 05:15:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com> <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
In-Reply-To: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 14:14:48 +0100
X-Gm-Features: AZwV_QjXqBFZOGf5JkyIpoeKssJ5kZ4ktB_L9npprLQF2ToUkR2vgcZr8uuR2YA
Message-ID: <CANiq72nrmbLP6mhHKcGJaeLeOa4g_440NiGCZBB7cVcWoyrjCg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Mark Brown <broonie@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	aliceryhl@google.com, boris.brezillon@collabora.com, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> As I said on the other thread I'm seeing this with what appears to be
> 1.85.0 in Debian stable.

Danilo asked me if I knew what could explain the fact that Alice and
he couldn't reproduce the dead code warnings while we were in the call
the other day.

One theory we had was whether the toolchain was different -- Debian
sometimes does patch toolchains, so that could have explained it, even
if it would be strange that they would change something that affected
a warning like that.

However, I tested Debian Trixie's toolchain in a fresh container as
well as upstream Rust binaries with next-20260122 (reverting the
`BROKEN` commit) and I can reproduce the unused warnings (and the
Clippy other ones). Same for next-20260121.

Which I guess is expected now, given what Deborah posted -- I can also
reproduce it with e.g. the latest stable (1.93.0) too.

I hope that helps.

Cheers,
Miguel
