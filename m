Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F781EDA3C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024230; cv=none; b=NeVACg1SskR6o6PnLA4LIF/JXzXRYJyjsHGZipMFDdpztpqcYayXye5KfhG9LACsH5uiRg5G6Fyi++iw5uYd2q7LtoM0U42UR5Na6MPOyMyurxohax5tANnCUNP3pngBTa6oxG/do8tthUNviATSjeVV3wu4Ql4mNGm1+N14pDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024230; c=relaxed/simple;
	bh=7cICcofpdyjl1+9gvfvBCNX8KnStyEhFEANPQEOCcig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+wfR0HUroljC/hFgvd+LbZzJ+5OfOFkpenahlr614pB/cPf8ktu+960SCiolX3nxqvokI+MPE8DKQD5OA1EYLg6l2qOUZg5wEWSGb3SFh1KZfCihg7/1pgQS1nw9HiD8wkvhaDKWhI9imXB5KRFxWTuKoGpDHselhRO5BN47oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWeLS6vX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWeLS6vX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2061910f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751024227; x=1751629027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
        b=YWeLS6vXBh9YnVAwyP+VBpJcr2q9R7kUspXTui4qNLIb5sfPDlItUgy68tuLVKNCHf
         OprpsE1ahAAqVdoF0iOcdNYjW55/pFnefhLtxb/+vLmLeivk3koXOMWeQtTyh8IMRBga
         RtMEqL+cYIGJnvPAhg91VFOXZ427fpwXQrTTg6k3rFJ0E5U5zlMs2etRJl1s57EikS//
         xjoV9bFTjo7zbuIkUzb1Lw7yyGEb3SJGIR3xtb0ARNa/mwHeSoY/EKX+1Ai/8YuCEqUp
         DOb3OHNFZrHjc9V4NNY5qMoQWwFtyerJ9FbfLvx7YO94UuE66siLXrHn9WZ0FX/REsaN
         GRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024227; x=1751629027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
        b=CQmmPQ1ZVA/ecYf34IglOiB46ofG5K85giFeEtuvtFAqCmKZQ5xDN2+uoP0hQ+ZYjg
         f0Sl0aKnDPvSCWc1RgK0OcRhC+mqXCZvp8HG3v1IaKlEtaB06ZUKqxdUTQCsPTC1cRLc
         Uc3pxJKowO+X65wNVKEQBFd4KXd/iE+hDT6yeFTT0LXMlFrLl74Y4ItHKy2sfq8ZN7qu
         XsfDNwqu6MiVysPnm7WzxYLE7g7psbTjXMZOt2lMXnD4KpgQuGOgvJ8B5kLLSdVkkgvx
         cBEoeq5CdXmOUBrqEqmiNsNml2MDJ8Haz8rL5zZ+7tR+15dR8kwRSO/b2s4kG7e5yShc
         eAtA==
X-Forwarded-Encrypted: i=1; AJvYcCVzWF7OnM85ppoVT3TL3SmmNLJclGCm/9jbiDIWPwmo7OeTdsEQGhydQtPpvAK90jZk8QbEqKXKkaF7nOyFNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/hRQ4o6Qfn1dPrlj6ezAY1Ouic5mZSwVuGgMOEdwQ1DXAK/8
	83CqHL0YWm3JHFz4lXDKa34lzWZNU2KQjqSqKZpP3PN1vYw30nbPoBnYBENXfQzjYkaQeJ2GmMP
	AkAbeSyvxaphzj4f8bZLsAeOV0NzDHrsXHNV86tyW
X-Gm-Gg: ASbGncvQJNqIUbPet2spRnT8j/bXC1JIdZeOtk83uJeMmms+QqIi7qYWQwZFrlX1so5
	tOCHKBQJb5kEvaoetVBjqY/NJa/eaJs2opeOVVgc6WPS4spOaJTTlGHgxJaTdckZqR1WpoUjdCX
	0X3DZjNmetkbgXroK9M/OHHW6jE86cym3wuSWvVyjaPrAi
X-Google-Smtp-Source: AGHT+IHhQwveHXquBiq2OL5jFul3X4Iqrm3gaTcQksYUbptvQShoEH4ZnoLoGPXB5w2cgF2SU8OAzk3Y3AeFtNlDlKs=
X-Received: by 2002:adf:e18c:0:b0:3a6:d95e:f39d with SMTP id
 ffacd0b85a97d-3a97fcd2910mr2337836f8f.4.1751024226841; Fri, 27 Jun 2025
 04:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Jun 2025 13:36:40 +0200
X-Gm-Features: Ac12FXzCmQBarxz6DrTB7aiRsIFjDy1zyR5MJjJQhJ3mD38Fryft7yJAf_t0jpw
Message-ID: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
>
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c=
5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 d=
ivide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Not to block this change, but I think this really ought to be fixed in
the compiler. We should not have to do this kind of thing to divide by
10.

>  drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index dd55b1cb764d..82acecd505d3 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,24 @@ struct DecFifo {
>      len: usize,
>  }
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.
> +#[cfg(target_arch =3D "arm")]
> +fn div10(val: u64) -> u64
> +{

Please run rustfmt on your patch.

> +    let val_h =3D val >> 32;
> +    let val_l =3D val & 0xFFFFFFFF;
> +    let b_h: u64 =3D 0x66666666;
> +    let b_l: u64 =3D 0x66666667;
> +
> +    let tmp1 =3D val_h * b_l + ((val_l * b_l) >> 32);
> +    let tmp2 =3D val_l * b_h + (tmp1 & 0xffffffff);
> +    let tmp3 =3D val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +    tmp3 >> 2
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk =3D data;
> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] =3D (chunk % 10) as u8;
> -            chunk /=3D 10;
> +            if cfg!(target_arch =3D "arm") {
> +                chunk =3D div10(chunk);
> +            } else {
> +                chunk /=3D 10;
> +            }

I would get rid of this conditional and declare another div10 function
that just does input/10 on other arches.

Alice
