Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8D35C180
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904946; cv=pass; b=jawrm5QH+nawccuJEXJP+aYiDI96s801ybtZBasXtabeujK8jevNdspgs0JXfsBJ0o2m1LLI9LWsiCHWwYAdJYi8JLRsUG/I721e2FAPvJtRhv2bjfP90x0b1QrWkoDFqvQ4tGXxY+e9TtlkSRglhOeFFRcEnXZHYGEzGUWf1p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904946; c=relaxed/simple;
	bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYxznSLGB1CCynpCxlqh50zwJLcMCrpczSb+M6wawCgtnCfZ53g81f2bnscLVGyRuMrCC2p0lNHqQTfEXioN/ghm0B9lItIOgkeOGWcGKclruEARABKmtGMRbnYtwHQLjn8bHy0Rzmzoa5C3zjK5NzzGg0dQFHW4fXcAONOXvsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkcGJitf; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkcGJitf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359249bbacso1468621f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 06:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904942; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/YZT5zs36rMZcGKHTAhCvQ+AqfJTnn8eDERL6g5Mtwzg1iwI8Akpj3M5kbPgkwFY3
         gqvXGQsze5H4HCzDKIRyvNiXv2bW2t3L24xnPUOChwyzFvAJqczOHoVKFS2nNHPzB3n/
         Y0mLMFGZoo7E7vLUGDxOPGTGRbjxFskKSP9SDbpzBbWtDF4Aktb40Nw0nUhMFLhH16WB
         un+urX9Fl56FemejrgyhYqogx0HnNL2RbD/fUuXmn3N2hz2wH0ewojB/AFWcjsnHHiLX
         ENLaKDuM2xPUXQicOY+kfEycs7RgxNVvlT5rGdMcsqeMtR7aKmT7kKShsCPESo+ccIy/
         5FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        fh=ZmfmmME9FY7zZ7+YJqkqmFknrh45csVkk82rCCbeXRI=;
        b=XAdYqGyX7ApFuJfydB5gy+kg0nhGDy/eZ/IoB3/xCymCCMQQ5S+HMTdj30y4WQglYq
         S5IFZB9TF3czRWLLxX/5MAQLOkTYTv9gDKMovCa8JzZsCcpTYVNJslOqaDEXPtWQl8p3
         nvOA6HuplvkRCCNet+I/oGxehYJKhIfTrbd+gNMj9JxuZlmAB3rA/rNze8mNBzXthQBR
         VGmK4lTsmMHl7XfBvh/iZQIV+frIxLVwGu4bwoHFya5nX7KNJHUExPufuIiZTr5E5/0i
         8c3v4xFc8lQlDee/KLi1mSSUIBuw24JKJeqJoPk27/OqC1AwRweHeql4QC9iTe45gu6x
         zFwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770904942; x=1771509742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=nkcGJitfKN0G4OfJOrGGOkiJ4pep0Vj2H3zB2WHtir1skPnmZ2efKXXR4RuUFigA5R
         ELKCWtFkouZOXQnuR0tL7jhAx2Gr3bBXjvO6KWK6fH14AMZAPZj/G+9C9kA/EAS30mPk
         erAIoqjIVqObUE03pQFYFbtSuwZ7sFMM/8U8ZglXH1Q1vMITd/9c0J8am3BJd15dD3fJ
         qC8I4R+q8RlUzVM4NB7AN5O2+nKrj49RVgzuaf5a9dOCqcokCwbYzx6CPe5RLVR4uLMJ
         /rRAhxT6hS+Upz6G+tuDxAu8TfJXQvY9zC+jXEZRHS70MH9x4H4jBPbnxCT6tyPMqBQv
         7j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904942; x=1771509742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=QeB1JGhKlwhJyBCoF2BGqzarfCQT12IBbEOrFOIXf1cifiFbngIi4i4NSCkidVHLco
         ewN76hDi5x4pNa9oXcIDLOcivdnZuyD/m20smKYW9Rf6CGkRoO7qY8miKUtL16+5Iv/5
         b6/ZV8T8+0IqGjgBwccfLAMtXmUwGC2CSQdIcrbJ9TQ6J+taeQMUdckg3hx+6KslrjUQ
         4EQqg9SFY0aU+PyR7HCRgAm8kjaDir7eJloatv0P5yCHkW2fGBoV4AG7LRuTV71tmwOl
         Vqi/PmQEaG38G6va9nMDC3eUfEBGZIGx20twAcLL2BMKjg9TfzOJYpiSsMumG7etHUvk
         sLzw==
X-Forwarded-Encrypted: i=1; AJvYcCXbD2vPMR/DM3tNiKM/mddUIw/c2Le58DYkfXncactW2lV6WueM8TvIApYfrsXakGLpambqrR1kkpq2vS/5Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAebtih2wjoKB7qDdj2PPDOWy4ZpkIv7Y0WCO6OFVDcpSeOPBR
	b+6FNh6J/zOrah866IR566QxcUOA4b19tRiIFBOmwqBSGhAeLVqxjIxTAHlHywKgKx33JBg/yq8
	3f1+01JjdJcWuJErI2q8si6BH/ve6qxGQQvL28jiT
X-Gm-Gg: AZuq6aIBjtUpENSFsUmHHu45owXtTnN/u1/0aq+7Ly4vlCNYftGAQsGphQPqLiVxBdm
	s9ZRDDdoSk4u09H5yziKa93Zxli6813jgukKhuhbM1ldiQE3x3VLdMNR9g1diSigQGwrncfg/QB
	91B79brsLlEtyjjHv9gEOw7GdSMcR/6TqhPVG0tSsImpGYdS/hzFYnCMiq28AHbVQDnZK3jR+fH
	lyWB3/xNlGX/BH+u7WDBuZfLxQdTGWRTH3TfMs/0VAPptqq1vOZ9QG+QdU3xsNqn+Eve46f2fC9
	QFQQqFhx4jFM6OgY/581TCj7lr3cFIrmNQ0uRpwNkDlJx2sTIHiJwOgMrNme5UeAzIQjcA==
X-Received: by 2002:a05:6000:208a:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-4378e6d8d92mr4583407f8f.2.1770904941572; Thu, 12 Feb 2026
 06:02:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com> <20260212-lumpy-uptight-petrel-cac725@houat>
In-Reply-To: <20260212-lumpy-uptight-petrel-cac725@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 15:02:09 +0100
X-Gm-Features: AZwV_Qg2-1q5B4F446nU29Cn7SlWuusys2TSQd4MD8qGMnFLRNj2Nk7LREIXN9Y
Message-ID: <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 2:38=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Alice,
>
> On Thu, Feb 12, 2026 at 09:16:51AM +0100, Alice Ryhl wrote:
> > If you make the raw API unsafe, then that's okay but any use of an
> > unsafe API from a driver will receive very hard scrutiny.
>
> And that's totally fair to me. If drivers want to have a more optimal
> but potentially unsafe use of the API, then it should be flagged,
> documented and scrutinized.
>
> > Yes, there are occasionally good reasons to use unsafe from drivers,
> > but the entire point of this Rust exercise is to isolate unsafe code
> > outside of drivers as much as possible.
>
> So, aside from the risk of fuckups, are you concerned about something
> here? Do you expect that scrutiny to be constly on the maintenance side
> of things?

Well I do think it's mostly the risk of mistakes, yes.

> I guess what I'm asking is: except for the obvious "review" cost
> associated with it, why would that be a probleme if we have, say, a few
> dozen drivers using that unsafe API?

The reason I wouldn't really suggest the unsafe API is that, if I'm
the reviewer of said driver, then my review will be "just use a safe
API instead".

For example, if you really want explicit inc/dec calls for
convenience, we can make a safe API with a counter that returns an
error if you decrement more times than you have previously
incremented. Or if you prefer something else, I can think of several
other safe APIs.

> > If Daniel's proposal is inconvenient for some drivers, it would be far
> > better to have a third API that is both safe and convenient for those
> > drivers.
>
> Yeah, I guess I was expecting that one to come after we have a few
> unsafe drivers using it and we do need to consolidate / make it safe.

For most things, we implemented and used the safe API from the very
start. I'm not going to say there are never exceptions to that because
there *are* exceptions. But I don't really see why clk should be one
of them.

Alice
