Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3151DB365
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857973; cv=none; b=jexwMEYjMLQ+VYB7j+FY6+Me/ntizLxmcrKiXgs0/n/mr+nkj5j8AZQ2cpPRdiGslQpTSS8ZX4+NZ7jFcjTlFcx7S+yNFtKWcLw96wS2olkl7CMYV3B7IamRvyL5w9QI6L4WXRaSbsI2lcnu3cZqPhqUpgDtxj9Fol/4/RmaIUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857973; c=relaxed/simple;
	bh=3Nr3rdAGLG+bEMBy2/W8X+wI8WL1Tg0+J7sPa+p7Hek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PR6V0WS/J5kjZS/Ffl7jvIYWUiTQU9MW72M8DdW9A8tVvrKAk/P9KTYqf19A4PBIz9t1rLsJQk7o5Jod+zn2OX4PHv3IQIg2kwXDuwMqLDjzU6zgnsnvraWponxxJcf9HRRe+o7j+1i5jVdA5XSAfL2gFTdIMLTDC7shP7hyYs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFUOki3h; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFUOki3h"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6021e3daeabso2129453eaf.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 02:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748857971; x=1749462771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA3ofLgxtfNebWUF4UqqforqyhiSi+NdjwHYvtGkbrM=;
        b=sFUOki3hcCO+Y1ycPhbXKkcOoB9R54EQrfJIZsRKRiMXP5+e4PZXKk9Tn2AiP2rJOy
         9pPrU/VUfgyn3P5lmwkz5Jh6iukhUIcTj5jt+vYrpjL+wi3LggOVOfXtnwx+9UG4poNG
         PV6bfnpY/HvRvPJxQ2k1jei795ZwYFPUUuK+qLaovabSSgHQen7kxTs2p5gJIupYqhid
         4Ywk41DKGVXVxOoYaoUp9/yhYkMqXi1QwW1YoZ5yccCieM32lr840CtgeNayKE6QOXWz
         RsZn51lziJxC2opWf9KIBFw+I4kaIHcB/b2RKg21ZQhfKRmYyc7VDY5Vq66uzwFdwggU
         jJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857971; x=1749462771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fA3ofLgxtfNebWUF4UqqforqyhiSi+NdjwHYvtGkbrM=;
        b=AQQJU5DKns+lz8lFDKmIkzDMAZG01tqjD8lDxcMGh0q72fJ8giLCXEuYbmBPP4R6BL
         vD/Li2y9b00g8yb0URoudpSTwfNw8efBohG6Wphv7vZH16N+Zw7lPsN3TTZtdi0p1lNA
         x9G4Kc5kzWE3xF8fbu30xFpRK1tQDzeHWJxuIWC/OyjAzzDXhFF0CK99pUxHKdksGQI9
         fbLjYN8l/JsE3tC0SS/xNMjrbZ//Lty8w9Lqr2j9ASgJ3pAlwTvE2iFjhH6w2BFZPrVy
         5caXWZNjfV+XRThuq2JU/JylASpElTQpWhNChharunZMDdlTQ01NwOGuUNOl3VfSvIm/
         DhLA==
X-Forwarded-Encrypted: i=1; AJvYcCU6PkSrUiaj1fd2tVZ+kicRLdMOTbMQn6WzjiJVDzETyGQ5JbdkfzvCowkMTlGO6vNQxzC0Bh+0k0u1MhZ0BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjoNq0P/GXF9DmIUQ8lR6vu30pebEerF59Tyh/uHPXipCUjIX
	muw7TCgZILLnN/4gNoyB33LBmKdEO+HAMlxUErLz6E7HxkDdcbkVzB2sj8U9jh0uiIayVrk9Ck1
	JYWVaH5w0G2+qDvkuKIShnH1Ll/wuU6QRgY1diwUf
X-Gm-Gg: ASbGncuxD7gsW0+RJJBI9ElUwbxb1u/BXSszmXjCH19MiSjXHLm4Y4KCsycY018RRya
	5UgJGC1kFzpYQONx5t7wq9roeCkza7FC/NqaBCC8Cm1UdQbpth2yEHLB6qMEPhavuHarI2SXBXu
	ONco0eB2nmbInIhQBguTTzxoXg37bxV7gsEgiaeWEYUj0o4DMxvXW3snY/NMkKdQPpEW0yhJNdV
	g==
X-Google-Smtp-Source: AGHT+IE0ZGbnN04vjx83CwiRAf58xPvogSS6sEqYUTYlTlD740NOxi5Aoj2v4ECI6TEk/um1u2Qod5ydbnaGW57R8yM=
X-Received: by 2002:a05:6870:9725:b0:2e4:68ee:4f21 with SMTP id
 586e51a60fabf-2e9212c9e5fmr7107654fac.20.1748857970178; Mon, 02 Jun 2025
 02:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526150141.3407433-1-bqe@google.com> <aDXLqJTWlsrvVYB2@yury>
In-Reply-To: <aDXLqJTWlsrvVYB2@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 2 Jun 2025 11:52:38 +0200
X-Gm-Features: AX0GCFvUUiFbUINzQ_Bdsf7EBt95VwNEYE5j1QvwuapbexknnbONhxI4OgqJICM
Message-ID: <CACQBu=WL=RLN_9sU-DcJaRxCrCcokFhHvOF4K+=Ui+=POH9jVQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 4:27=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:

> So, 95% CI means z=3D1.96, isn't? And to me it should be, for example for
> the first line: 5.18 +- 1.96*0.32/sqrt(32) =3D 5.18 +- 0.11 =3D [5.07, 5.=
29].
> Can you check your math please?

Facepalm... I used scipy to get the CI, and passed alpha (5%) instead
of 1-alpha (95%) for confidence level.
I am very sorry...

> > Results for sparse bitmap:
> > +------------+------+-----------+--------------+-----------+-----------=
+
> > | Benchmark  | Code | Mean (ns) | Std Dev (ns) | 95% CI Lo | 95% CI Hi =
|
> > +------------+------+-----------+--------------+-----------+-----------=
+
> > | find_bit/  | C    |     22.51 |        12.34 |     22.38 |     22.65 =
|
> > | next_bit   | Rust |     30.53 |        20.44 |     30.30 |     30.75 =
|
> > +------------+------+-----------+--------------+-----------+-----------=
+
> > | find_zero/ | C    |      5.69 |         0.22 |      5.68 |      5.69 =
|
> > | next_zero  | Rust |      5.68 |         0.29 |      5.68 |      5.68 =
|
> > +------------+------+-----------+--------------+-----------+-----------=
+
>
> Your numbers look pretty weird. I wrote the test such that on a typical
> x86 system it takes milliseconds for each subtest to pass.  Here you
> report nanoseconds-scaled times. Did you divide by the number of
> iterations? If so, please mention it.

Yes, I had divided by number of iterations.
Now that you are questioning this, I have second thoughts.
I will repeat the benchmark, without dividing by iterations.

> Please print raw output of your test in patch #4 which adds the test.
> Because the test is tightly coupled to it's C version, we need to make
> sure it hast the same format - fields alignment, etc.

Will do. In v10, I have removed the module name from the output and
the lines match exactly now.

> I would prefer to have detailed performance discussion in the
> corresponding patch (#4), and here in cover letter you'd just mention
> the overall performance difference - 2%, as I can see.
>
ok.

cheers,
Burak
