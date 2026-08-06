Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D074534BB
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030069; cv=none; b=j6yyC1yxWx0EhmzqKW3HJW30Q5UTqrrP77Gs6EQpqV3+nAO7B8OAymTS/+PHtG1OcYEB4L0GLo88XpECaaSYlewVBxK03wXzG/A0661mPLNBGBiEDTXV10LceqbCusPvJaLiDFf3N642USRl+1UHmIL1u2C1YkboD18KxhZDI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030069; c=relaxed/simple;
	bh=sSOMPBG4fiWze6IAdyKEgJOvNuDwNVHf2DlIvHsEtKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxPCiuACQb4dNxg3VP+ieIIjlRek3C5o1G0nYmjEbS8yICqqUpJxqg5+BcePfdjWP8Lp6lc0tRaUniUwGYKkYyeusbPk4etAF/JWmf3X/kYaJJRHn4pYnPL/O/CCOuJj5Uv2g8InnjbuIIjoFJiPpemZnOsBXeGZeWkOiL+XkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8201447e8cdso38586227b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 08:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030065; x=1786634865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ohZ39jK4R7nHBsxWJDOlT0sMAW4jJSovzDHcfJTHmAg=;
        b=aF0cc6vbB7uztTMOtKsK9MMXeUbW9e34/RGPDIoDdPSL9rkYJUnjLhqeqW1AJx4VW2
         1mccsuGWcO71uEPElGlq3Pv/DXPvUiPQUtZ7DVS4P3XDNhq51iVu1q9ps+wc5mVi8RMy
         EhUSkTnqOaS+LWyOOXqC6UnXBGmLK/I60bPf7hZk65Xs3Ik4Q0Mo1pkRyNDqZRrO9bIe
         ALPLYYU4iUst3DhDa/KkYZsHVgrfKWXZRuQwMbWMgvcGBhCgB+5puvEFM8CZzkfu5hey
         FLPmgRlAXMLhjfTW6ubsOaIRFD0Z7a7qJDge/SN5SijVJyjbx+13Bm5zkOsC7xEokF6x
         qAJg==
X-Forwarded-Encrypted: i=1; AHgh+RpeNMQlJETUzemOvTgtJBZIsIGiZ9C7TYZL+wEtgcSNQF1/EYmxZOw9S3uduOPKL7vuMU/9/rSCub5ErmgOSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhcMNegjXOFcE7zxAHCn2ZtXCTOYBnJPvtR7WI+nkhz35Xn6O
	J2M88LcvnCGQLb+lf2RHD6GRnl/eTlTHg8N9oETTGxczwiYuoZ8YZjHf49YGQ1MR
X-Gm-Gg: AR+sD1348VNo2lmTdUkGJbyzT/q68mJeHmsg4OQM5JWpZz7Wpr+agbFGES+jgxclPsK
	qfFM2YfwKYtOXn99iCHrI7XA465gdtTPbdf3TXIQDrxvMAEoWlwwtnJJqhTYi23INnN8HmcCAcE
	VoxoHem9lf1jC5lXRcquFKpp0HVpNpfXvJz9Odz0hC6FY+Oo093G14k6dD+8I0/oaN7G8aeGAkB
	G5yGmdXZa/vH3D2Nj7HiSfo0gpQUljthfu1/hKbbNgYtjBPRRPNbzgIqZYhXbSyeOdG1MZoQ+JY
	tONxL0JfKnJJxtrYdsh3eMsLvGyDGvUZbI2as2dGiiDBpDnpV/uZjdcMxNPRx3XAF7hx44bqMbI
	2xLhwMgVOL2TMEeWjGUfaC9A/6RR1yS0tiWVtRBb+AV8ltdEuYD9H3b7pPkHMSpvcs0eao1XG6k
	6X1EjcMxZfOCG5O6eibwiREJhDuYYyesH2mgrzGPJ+punfHiHf3v87FxAlII5FpKQxu7G8KWogP
	6yiID+4dEeD/C5pcC6eO2TdjQ==
X-Received: by 2002:a05:690c:650c:b0:80c:8d09:3880 with SMTP id 00721157ae682-8201f4a69bbmr100134037b3.15.1786030065329;
        Thu, 06 Aug 2026 08:27:45 -0700 (PDT)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com. [74.125.224.54])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201323141bsm41232087b3.15.2026.08.06.08.27.44
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:27:44 -0700 (PDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664a09bc459so3746112d50.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 08:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7kC+QmCH/CLWataUm7PczSAiWwBpfil52gp9J24JPAAdPSIcDJQxvdqgF9hL+lEOtKGSikKsI95uMG+O0gw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b83:b0:738:133f:8d5e with SMTP id
 ada2fe7eead31-760ea747b4emr4930162137.12.1786029696259; Thu, 06 Aug 2026
 08:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803180931.97202-1-ojeda@kernel.org> <fb2daae7-4eba-4ca1-95a5-60f8157eb66b@app.fastmail.com>
 <DKFKXA6YWW8R.1NDZ44Q13XFQH@kernel.org> <20260804071330.24760Aaf-hca@linux.ibm.com>
 <33ecacea-ed2a-409c-ab1c-a136e06b1b7a@app.fastmail.com> <1aac654b8d333cc058a345b03ae0f798f1724ced.camel@linux.ibm.com>
 <57ac7553-4034-49e2-b686-b7272591da00@app.fastmail.com> <94c3ebc645e80feae1044a57b8b5c82d4d4ff408.camel@linux.ibm.com>
 <f2002ee7-00a4-4a3f-a516-409886b724ab@app.fastmail.com> <2aaf01a4417cea313ce0cce7cfdbec65d350a41f.camel@linux.ibm.com>
 <f85a48cb-4ad9-412c-be00-a8227d6c8fb1@app.fastmail.com>
In-Reply-To: <f85a48cb-4ad9-412c-be00-a8227d6c8fb1@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 17:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBiCA6+SWatmbB5bVdFd7_9CPNgR_eaTcOUpqAEA5J4w@mail.gmail.com>
X-Gm-Features: AUfX_mytiRYZjGYX1aobVkgoZ5obof2d1lrRV5Gr1cwx_C_pvGoMLWUjStMFMZU
Message-ID: <CAMuHMdWBiCA6+SWatmbB5bVdFd7_9CPNgR_eaTcOUpqAEA5J4w@mail.gmail.com>
Subject: Re: `io{re,un}map()` build error in s390 under `!CONFIG_HAS_IOMEM`
To: Arnd Bergmann <arnd@arndb.de>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gerd Bayer <gbayer@linux.ibm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, driver-core@lists.linux.dev, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 6 Aug 2026 at 15:51, Arnd Bergmann <arnd@arndb.de> wrote:
> I think the reason is that there are a couple of architectures
> (including non-MIO s390) that take a shortcut for normal
> ioremap() that avoids actually mapping anything, e.g. mips
> and related architectures have a fixed uncached mapping
> of all MMIO space visible to kernel, while some alpha, m68k
> powerpc, and s390 do something other than a pointer dereference
> for MMIO.

FTR, several m68k platforms use the transparent translation registers
to set up a mapping to the main system's MMIO space (like MIPS,
but programmable), and thus just need to add an offset.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
