Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07D348C7C
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599525; cv=pass; b=mgv1+zW7PQBH3lyhTF4ZI9yJi8Vzp8rzQCDnrEAkGFCx1HwWhg81Aw/H3OXKZMoQCNC2FTBRJ7gWPI+oqladkyq4HS4abq3R5tMqR+zV/JBJ8A+91r0CnF6Goc9wBGsCyWg4wk4QXasrAwcaNW4lOljdw8bPero56V2yBleY+cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599525; c=relaxed/simple;
	bh=0Saf9Ku0AdbaZ27kploZ5WAYm1wQnaE0aLpGzNXq2UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFQrktO/KLkvcY1YDEeu9kRG43x8P/zc+K8vMaC07uXmBq373kBxfmU73SB9GrwA7R/pB7XVbJ+0rETCI1UoWrLPB6OeD0EcNxWc8lug+qLMZAQs0cO2pcJaVBToNRzL9uy8QGVEMZoPGRehzDvZ4efuKsFvvYgXoOQH7urshVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS8GLNx5; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS8GLNx5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3042a99f0ceso534814eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 01:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781599523; cv=none;
        d=google.com; s=arc-20240605;
        b=JVKN/0zUe776fKJ4F1q3tMlDsf5fyz1zAn8Z5QigD4by2bi1tDhJsQ+hdshdvze76z
         uNBnpk0PPInixdhTHQuIz59HnhKjUcp5F1+IvCvXXI2SMUBjILPW8aUzuT4KC2MQMXQG
         Zkp7qtoEZx53LVWUfhYCorIQbAwrQDPjBwBO+dvuACe0c5mKHL9urSvqOoy3B0PL50hV
         fQcVrunClI5pjCTJhjNoivS4TH5OfcGmXLIWz5yUlPy+yYfjeIYyxtBkomqRm65v0Go9
         UmQUCcNKB9a0TILpDcdJQztaYeTLlOAcFRd0sFnOTmOJRnUFQb7YzWhuc8vFXAhW/8AC
         2N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Saf9Ku0AdbaZ27kploZ5WAYm1wQnaE0aLpGzNXq2UQ=;
        fh=1PUGG/rey1Y2IXQTqYf/PoOJ8nqRNNov9/zFLxBXZpY=;
        b=hGAbYBSEjFiiBBl4LmSBLVTLgX4hEmjViQkknvwhNjAdSnnTh2onqOPmdkH1mkItcM
         jFrk4uThjfv8GOHEBAUc5m0YFKrZbrRqmfxTFVQNG7uXRFh4UEmZq48J3Qqtc5fS2P1K
         BAS1KEB16k5tGpcDZId5dOCJYOZo9BgNqn3b1y0UsYv5YjEoOa2e9VcAoeN4k/pXjo1p
         rVqZLnF5XSFrQQioFuZUDUMg4eURefEOkhr8EOk6LHQqLoLu1Dvi0CaI1ZXXStfzU22l
         POiGSxaM+7OBcoUeluB0fbiL3cHQudqvZXh8uMtAWZrkEW9s1wryfjdrRIhN8VR3YkNQ
         DyAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781599523; x=1782204323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Saf9Ku0AdbaZ27kploZ5WAYm1wQnaE0aLpGzNXq2UQ=;
        b=HS8GLNx5+l0If7AsxApYNwiXrhwwzsaCruPWPZyiEfLXo4Kl4R60uzKkyevd06JoC8
         UtHa2InpaPlZMYMbimnJ+o2/7djBQusFoGGKAOv49VIOOboEvyuA79bGY5diD4sgWOaj
         Bc36NaAd3TJHYf51xmHQCMFtjniVd2Gobcks2GT0Nx/7Wxp28yvH+NgBh+du1grpXc6v
         NNuuVL9WbTdKWnTIha/xgTKF5VeYXpcUfQ4KAhv0zj3DzZkrbu7+Kw8IHxacX0rKAWyN
         RYFulNcbPMd2d4qm3x/hcFS17YbL9tAqhDEpUBwoC2sC3UkPkRvT8ODuOKTcBrOfgx7+
         OVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599523; x=1782204323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Saf9Ku0AdbaZ27kploZ5WAYm1wQnaE0aLpGzNXq2UQ=;
        b=hBatn2xKQZhMZQ/L4NoIseQ9dHzkbAQ7TH2ZeuGYIf5ExAW6Ak6c+nz6GcSU9MfPX/
         tnSpBE4hEB0K1ckEdbl4TAQ3UrmWTFIE4I6q8B+iToF4iR9zIcYsG4N+0xYRLZN+8gdx
         1DsVrhGevl6Tx5QeLadGrQmi2QHlMjkyuQ8sYT7SSc9Fb/nvR408m7NoDtybU5pGKX8A
         nnn5nWXyiLxR/jsae6ldn+n1M+kQQf1jNzYmeEMubFPcVlfxGWZIqV3oDcK2ouRBAbFc
         5jHZdNkD/QtTIpk+y5SALsFDiyH2f5HlDxpgHn9nSHw/H7pFFcEGK9Ebd1sOBdgmVdlY
         do+g==
X-Forwarded-Encrypted: i=1; AFNElJ+yMJBzXTd9/OzpBN/OZjFPVKCwtvTFoUzaMLJ4GbS9zWyLDQKlTgXgCQ04MgUxM+qJT50MnVsNZOSLulqqPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbRJfJy/bKu5dH0gt0XOEPMx4Iexu5iU6Pu/Qeh0VgVuUJ/Pq
	BLRpFFmP4g701dKvuVD+iBuaP1JvI7hp2IdDbLJuVsdtDhxD8gKxHMvpNiQqg2AOhHn+7eJKL27
	90FMmmJ6in2Saa/GJX7BlSH0XSzgDXKg=
X-Gm-Gg: Acq92OG1SmNfagh2UPgeRI++wQqA+THiFymYU7fZ1htNjcKKC8YxXMjKlmPVhIT6l09
	9j7ZyPswMzMe40gR0uA/ak3ujSqG7XTjYkjMYsG39opYogU8y7JSA1vH6ufIFA0P8uIfOPKteGx
	3A1B1b8G2lGoOveTgs5pDVNwWHdyPxVWsBdrepmpzrfThJ4+x02zBWbFsv+UGjSdslRiUO217tn
	0MpO1lCaaWV5k6UJVAspXET5yVeaaomc4p+EQG5zhUffiKQkLQNd0ydVoktovNCwY+L1xTVo6J9
	cb4ECixsmzlli1MJ9lqEJshA1LT1Ge1o8NIbox5X+1fbzqLPCIVgBIE5julANEki3ESzovdNvjc
	os74me4TZHa1YdsgHqOibahudrFFbRZLhBw==
X-Received: by 2002:a05:7300:2318:b0:307:d4e7:b178 with SMTP id
 5a478bee46e88-30820054649mr4116001eec.4.1781599522964; Tue, 16 Jun 2026
 01:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608181451.3734956-1-japo@linux.ibm.com> <20260608181451.3734956-7-japo@linux.ibm.com>
 <20260615164013.GA249489@ax162> <CANiq72nkm2YwxcV+vwDj+v0svd6e1dro-W_0ybVms3pG_oJiXg@mail.gmail.com>
 <ajD9uw7MhsisxdzY@google.com>
In-Reply-To: <ajD9uw7MhsisxdzY@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 10:45:10 +0200
X-Gm-Features: AVVi8Ce8ppVywZIY_ATJ3pLfGr5qRJIh-p7Powg4rirApr2Mm_Us5rATobeRnQI
Message-ID: <CANiq72=Dv8wUrMz7jbsHOwAyd2GtgnRxvXzZeER91KvPcULzhQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] s390: Enable Rust support
To: Alice Ryhl <aliceryhl@google.com>, Jan Polensky <japo@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, ojeda@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 9:39=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Since fixing this requires a change in rustc to recognize the backchain
> target feature, has this work been started? I think that for stuff like
> this, we should make to at least start working on fixing the warning so
> that we don't emit a warning forever.

That is the expectation, yeah.

Jan et al.: for powerpc I have been accumulating the links etc. in
https://github.com/Rust-for-Linux/linux/issues/105 -- do you have
similar links to the ongoing work for s390 so that I can fill the
equivalent https://github.com/Rust-for-Linux/linux/issues/106?

Thanks!

Cheers,
Miguel
