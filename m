Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD53202C38
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Feb 2025 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400209; cv=none; b=K/3Er58VvWT3K0gj/g+BqwV6/+LpFWoMNcNowDVUuSUKBs4Yf+f8d0mZ7RdHrUbv86kt22MTrw0T07wzncJWuczu7Gt1zv7HkUakQxSfVNV8aQ8G9UEVeHLyUqQJuL4XTSBwHi3vsDKfdGuKBHRYNyHjQiizXVblFU7Fyw3CGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400209; c=relaxed/simple;
	bh=/tQrlmszWJsKde80dHHVd+GKcUFNLpNm9aIZPlxNykk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucYrFR9CWeUZ5X31cYnKmTCf+fzVsKjAdKvsMdwFR1SPpgg7uyyWlItOid/X1n+J6bV1tzxf2aBi/+S3fKQUvGB97MxOJ3ktDu903CvXUpbAvm10exqNQXPVsQ/OqnkrESbWntx05F+6KQsTOU/SsAGtXQ1yM2xmvB0VWvY3DaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtsQ3RPX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtsQ3RPX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so60103a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Feb 2025 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400207; x=1740005007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGpwJjt4s+CtqC85hSXrb+fnaBSTzVzUkIpKOo2jMqU=;
        b=CtsQ3RPXoR88Z5uBJshakafhI8oCxUqhEZR1UkOpu4+NCloHkV4UkorKGjyDDLz41G
         2exGaIt6WhjRwUP6ijp5G5tDRzFevXC1ZmITBSspcSSRaaIUzwi7DXeJp3pihzgj3Z5X
         eub/nbdmoASsuf67e/JoPq7mpI8kAhKL59AC+zvKzGYgRig/vHmscnJjUAUu5fY2lWgz
         eu77272bLfqpFRMFEy4+1ysBm39RUwmE+gxcWkgoMeFgNct2N5cF22g63WU3ltuS786J
         PSKXGI8OE24PFe/IV69ejiGrIKn+ZY+Nk1R+BpCx6oKNDrNZ2VXdsnlCIiJfHq9Y+Nkf
         yYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400207; x=1740005007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGpwJjt4s+CtqC85hSXrb+fnaBSTzVzUkIpKOo2jMqU=;
        b=h31XU4XT42ZBJ3XgFyabqRUnoWdyUsEDbvIN3WerpxEAbPH/7WrbmwHm4CAsMy9KqC
         rCqUe1XUp7OUW5Ge/yEcTQg3w2+U9wIeFv/vWpyNYTlcqpvHF3gcNz+WC0W4iPXmLU4Y
         kc4ZA8BLlcsdz71KxIdgIV/857QXB+dfjtEgY51tNb39CMpaChaJv4CluQHlcGv1ByH4
         LKRYNVMTonF4h+3vUFq9UhB+GwENzVVc9YMSqZN1TsMFFzo9gv+zcfAnFBIrPFxT1rIY
         u/zsWcMbFlGh/7eCUKdbvIPq3lA8Wj58e7LU4vVFGFgBNckWWcJZ+RnMomE64W5SYTNP
         hGtQ==
X-Gm-Message-State: AOJu0YxI8IcUF3GUa4T1CiMBrk8nYxXZbq8b+RSfGcyMRha9i4Ovyh9X
	cT0vSIJZnfPMvzxGhjgI/imhs+BxTDnZM+8kJfJAtb25KNMzuq1fXqVPkHPGCjxqETuGeaDq8oR
	em+IeGhIy14/DK5SqAUMl+TAsUX3MHlSrYaE=
X-Gm-Gg: ASbGncvI1tq6iP3CZj997G3nNQUGKMBOllredyQjc+Alijo3vSuOjyKRpfGhyU+jFxc
	g0TfjzameTtaHno3rwwHQKJ7h1TPgNvNvFvLf5P0JZCm6NmzoCKOrnnadjO3EIHz/mEysJiLL
X-Google-Smtp-Source: AGHT+IGdPBcCtzcDP2dor1l7dCqzCdSmnLRQjku7zOtuWESB6+2hPJLUzhGtRBjWBQP0Jlsa+1O0MXRtAzL4WVRHDV0=
X-Received: by 2002:a17:90b:4f8b:b0:2ee:6a70:c5d1 with SMTP id
 98e67ed59e1d1-2fbf5c64c71mr2838007a91.3.1739400206103; Wed, 12 Feb 2025
 14:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Feb 2025 23:43:12 +0100
X-Gm-Features: AWEUYZkBq07f0dYqkN2xP8BlHpYy8jPoCCMfWXbuzzLjGuJRoaZmpqHtGlyC1Zc
Message-ID: <CANiq72=PuwT9-njLRQckdfzQSRk4aD4-L+JsyhOj-PS5tqVxww@mail.gmail.com>
Subject: Re: [PATCH] rust: types: extend `Opaque` documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 8:25=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> In the discussion [1] some `Opaque` documentation updates have
> been proposed. Add them.

Thanks Dirk! A few procedural nits...

Commit messages should explain what is changed, i.e. "some .. updates
have been proposed" doesn't really say much, and requires opening the
link and figure out the discussion. Lore will likely always be there,
so details will not really be lost, but still, commits should
summarize what is being changed without requiring to open a link.

In general, one should also justify the changes too, e.g. in this case
perhaps mentioning why it was confusing before.

By the way, in case others get confused, Lore says there was another
patch with the same title as this one... So perhaps a more concrete
title about what is changed would also have helped here.

The intra-doc links are good, thanks -- though perhaps they could have
been split into an initial patch to make the diff easier to read.

By the way, please Cc the team, not just the mailing list -- you may
want to use the commands e.g. at
https://rust-for-linux.com/contributing#submitting-patches.

>  If it helps reviewing I can share a screenhot of the resulting rendered
>  output, e.g. on Zulip, as well.

That could be a good idea in some cases, especially for big changes
(or even uploading the generated HTML file to a server somewhere).

Thanks!

Cheers,
Miguel
