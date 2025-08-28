Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925930F937
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386366; cv=none; b=lmzqKrLmzGIn18V+T4KWIMBRTlwjDxHe79jjWTR7E0SCGX+P4WQe8fiwR1FzTQP8A8Jw06UXj48ssjcrTT8lq6jvoyP14IBb6nKQ40LGyczgsvsPoSLfKJnvARgdCFyRlYWyGmenVEKXChqE1v36f0FvxIKjKR2w76H/26nWC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386366; c=relaxed/simple;
	bh=Hjgvl7t3N4uxdg+VbGK4c3KB1Vgb26p6IUDC/BXZ9bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7YwvngL0zgVKPeWZOPNPeO7hOhCSY/Nb+KiX41rvhM9quXkvfu/gTDPLsOOq5kHQggwrO+zIZbsQF4oRG9mwd+zLzcZAMhu+SEq8z2ZyHPPda8SoHsfgnKM8soaCsELuebuLGRKV6CO5kbju2Duar19iFrKU9JFgSbC2VjOPp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOWP2W1a; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOWP2W1a"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-771e15ce64eso756035b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756386364; x=1756991164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEg72LM7YmmLe/X9iW3od6t+U8qtbnknaRFc97jQIUM=;
        b=NOWP2W1aIoUpJHmT/oS8pr05zrI0tG3rCgqCcycFfnToXluWIRz1zLY6IJm2jkk+8v
         QEriiyHIc21IPmX85Onvzer0FaQBWscmUFPYmT3odB+loMJY/1ThGuW6K+zQY6p7qEvt
         DYpI3txbEu95L2ODb8jm9twujLr/hJ2VfD8JfSOiCSdfAMDgb8eDsdpWqJod3SpiMytu
         zwDPB2pc/epHSD8dTpDM5I/hwxa30HfnA2PpCg62pfQYjE22hyVkaLE2k9kAaAfQdX2r
         NlJXao8IbYGZcUf/F42YVktaFV0srowHziZAAvzn1Tg/T7Ddf0TjxRLleXhgdX5G2q8B
         Bhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386364; x=1756991164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEg72LM7YmmLe/X9iW3od6t+U8qtbnknaRFc97jQIUM=;
        b=vB8sfUOPyMv4sJ0UJ4IcnH/4vsBjcq2Xgr/cYOWjH2gi6tKyV80uNyCKL13jBg95is
         mqxuTA01EWvINesuUtZgtD8vTNS5oJOJN3JGbpzq6lOrwJh07bDFVPO9q4AUWn+nyHFp
         JG8NRd8GddYOyt6t98o9LNz5cmdNoPcB/8fE84sbXJwNUf21Zz8/U0IEmA5/ZNCQPxVn
         xCiCZu7jWU/LfrGgh1SVFMHkLUtFkvrac3Lo+ZLaVqK/z+7Y+DWHpDQfv0nHe8gqHJG4
         oPNloFklCfeHaiHtCo2mW7iIDowX3PvLtSu6E/Fvg+vbzPnXKpg2j8dvhK42AFa+sbf/
         SqCw==
X-Forwarded-Encrypted: i=1; AJvYcCWtBs1W5onl6yW3kvPRn5KS+QvnFidO+iJNMG7DcgX8QLMc0sg03ScjaupEsaq3/Xc5CwPrsfl8imnTHtxvCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+GkCjqaaBUfd5sUX38AYL4PBh5SngzX0QnVVWjgSUFXrOvUr
	XSWMuTiGd2VrUyHhcaaKkl9QjLmxaGPuhyADAWJvJX8DGjK4/HpYkMmUsUNEWnqmbjIdnJHe5hH
	mLIwNFA9Uwgs9fSKKD7GeS8oF76slDe0c+4Ti2cVh
X-Gm-Gg: ASbGncsvjtME+/7s6cjYqur5IBleaoNlc7U7hDsu34WDxRFtXLJchx1aWAlhoMIFtME
	n8Pe4knmUS+dVQOxYIlwbh9mueD7gkkp91vgFnma2roc/PdlwUR+bt1Z0aW7plT2DGgdoBzHtch
	3Ue+rbgTJlyJkm0qTnyHMJ4PHduxp1bIbOMf9OPT/WP9VTTp5Ti5Bqu/tdvT6iNVDDx+f8NJKBW
	RBxdjyzhpTsl1zr3F9j62vr0m1Iwz57eDPIadY9wyw9QU5y1lb7YNMB5/06OjXI2zcTgrU381k=
X-Google-Smtp-Source: AGHT+IEijpLfmDUkI2YRHjD1JTnwxBU7IhvhlzVkA/BtS2G2IpI0QWOacCq7I9/JLZl5QwxZz27rxdhYKViR835y/Ls=
X-Received: by 2002:a17:902:da4b:b0:248:f30e:6a10 with SMTP id
 d9443c01a7336-248f30e6dcbmr10418755ad.35.1756386363491; Thu, 28 Aug 2025
 06:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com> <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
 <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com> <DCDVIR91LFHQ.1C87G5A0OBJ39@kernel.org>
In-Reply-To: <DCDVIR91LFHQ.1C87G5A0OBJ39@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 15:05:48 +0200
X-Gm-Features: Ac12FXwH4U9kGaajYn8SjgOofY0bZTg3SyJryTzi3q7AIGGDgeurcC2n44p8_rs
Message-ID: <CAH5fLgjDwayRzHXS2Dp6ztURBvnv3md3_jnzyL0ZmBQzTnH7gA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Benno Lossin <lossin@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 9:14=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Aug 28, 2025 at 8:39 AM CEST, Alice Ryhl wrote:
> > On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com=
> wrote:
> >> +    (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> >> +        $v.push(::proc_macro::TokenTree::Punct(
> >> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing=
::Joint)
> >> +        ));
> >> +        $v.push(::proc_macro::TokenTree::Punct(
> >> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing=
::Alone)
> >> +        ));
> >> +        quote_spanned!(@proc $v $span $($tt)*);
> >
> > Not a blocker, but if the way to implement this one is to push =3D
> > twice, then I think the pattern should just be a single =3D and then yo=
u
> > push a =3D once. The pattern can match twice to handle =3D=3D.
>
> You can't do that, since the first one needs the `Joint` spacing and the
> second one the `Alone` one. `=3D=3D` also is a single token in macro inpu=
t,
> so matching only on `=3D` doesn't work.

Ah, ok. LGTM then.
