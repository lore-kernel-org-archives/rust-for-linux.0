Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54422145B2C
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083898; cv=none; b=tEDRkgD+uoIgo7lj0tGqNL5X1O7qzyXwxM2+vF+9ELclup8BJu2V62/2jXiK2eHcaFUi8TnCxKgg5hOUMior6liM1vMkbknp2a4GBRAYxsG+8nbn7H9LusXkveN7V8e7lk2BhnkWCpdw9Pww1Z+RkXN4NhA8eWLMFVeNRn952kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083898; c=relaxed/simple;
	bh=cXnHg0QuLNUYyJOorGso5uFmaeWJlUBHIzaSOgKFQBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ljpjz9VAF+ecmoPXcfFADR/c/qnKvQ/e4yh/oCzD1K8AjEtpEmLLBhCO0/EDg83or8Sv0accsAOVdMNttZgERfUgL2dGmQmL/CV6o0qHNTA3WuMZs48A7gHAlz808VhAIag0Tcc0E612HIQcM2cnMM1C68hT/h8SrRibFaGh2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MpCAgxvo; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MpCAgxvo"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee7885aa5fso3773671fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720083894; x=1720688694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC0iPRTa0Tp+6wnSRZw+Nypk195vi+wp+1Whl/cijnA=;
        b=MpCAgxvoJHm82amOIpvQj9D7h0LWb51/3QlrvY19S2I55YC+qZoECrJM2ejX1WDtcy
         Xqbfsbtb+ndJOKFNXAREnwUw9wGAC+yrJNWRY3LiLgiApl5+qxclVa7zJNCHbvZIQPNp
         0EVTibfnip79e9b6wYZUkU8wm1OJXMb6pL1Dm/bossY8kIIRhA6vHZH96gD78MUIYwuI
         L2mU9PhaxK7XfMjpFG/6bDepKluZPRf6dYEBwVklCgKoBQCdmJy+mtsGbncChG0YUAjs
         ASC8WJGOLhZGcOX7ixuwGDfGPpNDBAAjogCrM/GqWnIp5aYVCnFSZwbhDPYScudsT9EL
         MVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720083894; x=1720688694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mC0iPRTa0Tp+6wnSRZw+Nypk195vi+wp+1Whl/cijnA=;
        b=OCvNNRWFKMmW6l360ALeimg9euTJw9sjbNoTcFIQ3Qreinr12haHI++iMdYcLsY2MG
         /TRSxdOeDo0YmdX+uTM68D64YLhTkVYVy8UAJwRVIGfljv+f3tAtqZUhaAZz7P7JwQGT
         oFNuwtYzZAmh5pV/hFKjjW447v/2m++ll8dhn0S6gqdVFEFp/KVMMRDYGZ+cY7U5iCWD
         kqEeucrJjejrnN9vTymC1TFFG6Z5M3GqiHFIT0Zznt1iYHWlb+3YNH5eiWsKYd2diaOk
         wuEqcbP52fj/firYL1E4eNUZrrzwFLR2Un2dZXgmMDYADsRiCai7TZuIiStK0EFPqgjQ
         aGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKQay7k4vqmvhTfEJA8gPJAyzBIID2u9DZauZ+R7EqTRo60bIKXq5U5UlCVfAvwPBjAEFflt/mzX8hmhEaT1wACeTsLm2gBmT0BK2a+w=
X-Gm-Message-State: AOJu0YyCluKhHRGCPOnrEcv4AsMD7h6PR3eHqRpfFoyr5MC8kF5xD/UX
	t5tFmhLFuiFrZWnXTb4ChxwbS1p5+c3nz9VmVdw2/xvdcaMpoez7SIKiCmIUusqFWNAAWU+UiSy
	naSh6yWueE/yzqX3tgVV8AiXEj9HMb5mOPQic
X-Google-Smtp-Source: AGHT+IEoQz6XrBtbF3SqYJycMjsWJckbHK9rJBs57w8vKFwwtM2ZhWFpliDSS2ec/glXwNt0tRjJ5gTc/BGHev8Vdpw=
X-Received: by 2002:a2e:7d07:0:b0:2ec:5a85:66f9 with SMTP id
 38308e7fff4ca-2ee8ee1b10emr5688761fa.51.1720083894215; Thu, 04 Jul 2024
 02:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com>
 <CAH5fLgj3z4TMnXz=zygLW9Fku6N6nX0jyw2b0uvg=Kat-d-o2Q@mail.gmail.com> <CAMj1kXEHpaOnFTDiLUZEUcq-SzwyXnRgbYokrAnrZc_0YOH31A@mail.gmail.com>
In-Reply-To: <CAMj1kXEHpaOnFTDiLUZEUcq-SzwyXnRgbYokrAnrZc_0YOH31A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:04:41 +0200
Message-ID: <CAH5fLgj5KENn0_zEgDp7xnokvvPLchY-bFDs7mTN=vkf1Rr2Kg@mail.gmail.com>
Subject: Re: [PATCH v2] arm: rust: Enable Rust support for ARMv7
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Geert Stappers <stappers@stappers.nl>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 10:42=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Thu, 4 Jul 2024 at 10:20, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Mon, Jun 17, 2024 at 6:04=E2=80=AFPM Christian Schrefl
> > <chrisi.schrefl@gmail.com> wrote:
> > > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > > index 71afdd98ddf2..9cc10e32e8be 100644
> > > --- a/arch/arm/Makefile
> > > +++ b/arch/arm/Makefile
> > > @@ -150,6 +150,7 @@ endif
> > >  KBUILD_CPPFLAGS        +=3D$(cpp-y)
> > >  KBUILD_CFLAGS  +=3D$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $=
(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -m=
soft-float -Uarm
> > >  KBUILD_AFLAGS  +=3D$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-=
y) -include asm/unified.h -msoft-float
> > > +KBUILD_RUSTFLAGS +=3D --target=3Darm-unknown-linux-gnueabi
> >
> > On arm64 we use a target called aarch64-unknown-none. Should you also
> > be using arm-unknown-none? Or maybe the arm64 target should be changed
> > to aarch64-unknown-linux-gnueabi?
> >
>
> Neither. EABI is highly specific to 32-bit ARM, no point in trying to
> align this between architectures.

Ok. Thanks for the clarification.

Alice
