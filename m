Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6032247DD7E
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124127; cv=pass; b=ht5S/9g9ucDy5L0cJ8HohHREqWv91mxLWoI//tFeCClZD41Um/gJKvB3ejOmnTrSpXjjwaKcZqvViYac5M3PjVRuKsekBxI7qXWht93qkLyQwVPJyHQEsqyQJ6zD+AZO0egPvauMvLeUij9GnQ2V5qBWWTxKgsiVM4bZOyLnf3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124127; c=relaxed/simple;
	bh=gXP3ndAsKNjuDSlFH6w+TobFDE6Il8749kvMxRWmd2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSIV+K0Iifueb6ZKJ9zgz57h8vTsn0ldD5xaOEF0ZW96daMJKLMtFDfLFLSGxhNwrb+PlJsPqm1RXRzD+6+ov3//xMGOj/lazPtdnn/jtWM7r5PuhmoZnum4oSt582WLDesSzX3qWqRZNWOd4Taqjhg+I17+AWO2kvtOo7wKiyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdwAJ9yw; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdwAJ9yw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so968132e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 13:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781124124; cv=none;
        d=google.com; s=arc-20240605;
        b=g1/H0EQ049m9RKAGfOs7QrNevEVDDFo9orz2w7VIsCjbRX8d8LW1ZfmULJGwYjSx03
         9GxxhXm5vVB0rb49Z3wyyBJgbDM3HccFFblXOd1+EpugsA65snSWaR2B3MCgPkkwF9Ku
         z8tu9ZpP3Wwa7Jv2Yfvf8uf+FSObNQeb40SwFH7S2ZsC9Q0wpgiUM8d6U9x4xhisUYR6
         fZR9p0rPq4sibTyMjXAlTCkmU9zRi3nKiOsEo1S/yNbeKVMAksRBUPjxaTL7kfNtnQ8b
         VFsnTEcAg2+w7rembnOjcoqXI6Gs40eBduDEvQUNHaNeot3dcvtl/j1EvxUwRyffuRu3
         q2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ojjdRU7C8G8Jli98gKi2UMEANrqIYaK3aEdrLJL6lYU=;
        fh=7Xo5H6cRs1qaQSL5lgcPnuXmdyyhNYyrJjDZR5w9Dd4=;
        b=DCctiekR5jxipMm30msFGddyHW1/81dEBUw/W1mOc/W59x5MvrP7cEUCh32KJcOcoj
         U0emQfiCqgkUo+/dbSpqnxcYqCxr1oY92huXX75q579xXN7+zfq/UFD6Hjw5zapskFSL
         uRs+VWHlRiIKD0upGylI0v0DxWERBBWxODrABCYNpz70kzwN57OWeGmrUsUlJXttyQ68
         ypNsONXYUgvo68bwOV3fC4N5/FEFBwNzIyW0i7IFp2ClxJ3CyXbT0wWFZQWmbIh5bGZE
         j5AiWGLE9phW+lPq0HGe+upBRdjYMzeqI4XUpBTugzS+TZxSRII3gx3qZOHbyeT0MyiY
         OLAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781124124; x=1781728924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojjdRU7C8G8Jli98gKi2UMEANrqIYaK3aEdrLJL6lYU=;
        b=AdwAJ9ywfCRvkYxn7doKCw0g3pjI8SF+Hc4hi+SfYiTuGGQqFW6f1ex/kPEyFQw30A
         cYDzSmMmI36qC4HSGY/9gzekbSp0Id/JTvyK3rcAw5XuxE0PZZb/9/BcP9z9FqHuoCt0
         1ZpoWgmLapgCz7nQSLqVRSiNA/kMCCz8oAx1NNQaTjQrEZk0XnmwKZ/rmw3znaQq4e0A
         vA6XQfFj80bGI8eAlUt3HVDJ3pqXcLQPd6y3WgCRIgUPG4daWymxkvk5VduzeCOSLKi0
         jhLSfO+BJ/F8Ch/+TlPfq172IAYDzPlVWUmxzn/FxR+BCkHjI2+6g3Vzgxj/qdcGYsmY
         RLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781124124; x=1781728924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ojjdRU7C8G8Jli98gKi2UMEANrqIYaK3aEdrLJL6lYU=;
        b=Qd0Lo8D2KO/PVdkfOt4bDDPiNVpUOv4yHH8xv9cJVawksEcR4zZW14PO50W2g0LrWu
         jeiM3Zoj5d5er4xm/GZlM0ymHeDaU9d/PA1gOhGgRNaPUEbuUdj2VXPR3xugNy0qIiJy
         1sFMeyx9VQ23Ok//JnZwO0P8zGqkGywkycwtYT1rydA/upZ34R0qmfUgVkQhNa/O2M91
         YM7MP8X5K7uh5eSWj2xgbJcnTwPN2IjShBaE2Y5yZbtDn2hbqCmdPFGBY+xYJoRzkA28
         A62PBz468nkAB8up+wghKkP+wm8448zBK0AY7YnGu/y62vqBRKJBMVG/9vLxp6a19c2X
         rCzg==
X-Forwarded-Encrypted: i=1; AFNElJ8iAnwB3SR6I8TNMiwZFUtm4lMqYnVgIfAQEWY1gnkaXxbRgaiv709FGO51alh0TApuUJUgi14+Yk9TkmjiVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LQT1rh09FjRSa1p8m3ONo5s69E29SMJh1SD590GEVfeHYGMI
	2nmugxAu+B9sp1dt+1Nwq7rPG9QUCRafLUbpXiqKm7BGUFD7TWneh2ajJDswTku6SNvDx+awfXo
	gNjin8CsLDF5E7GLSKfUxESyfMW2RAWI=
X-Gm-Gg: Acq92OELBSh2XiT7j+kvQKQ+2SHytkKXSxPyRDkYlffY0TlKUNzKa633Pejmo7IXfn8
	D6EbwSSbAa65LMz+Rlh34z7V7UJTrwwnkAOPjOvYWfdNg4vAFpVfv33iU+tRdt+IBkPFlyrwo8I
	+PY9WuL1ga6fhJy6fAo59Nk0J6Gd9LgHymE2EPxNcBzGE2bM8qG+xgBGEcApBfW5BWixjzVVdk8
	cmP81fC+81jQmyuk1W3kUttnTBHfez7U/dIPnzGWWDBocq3i3O/KU4H+nq08fu6EaOeq6h/4Sg3
	PO+AtHRXuWgvVfA+wdEYjusFOFcj3gHuhZay3z2j4ngCXSHqvcf+kUWmSaFb6VfOPictEXi+6kd
	7v+1RZ04qzG7T5dnXibXAIG5KJB45i6bhGg==
X-Received: by 2002:a05:6512:a8d:b0:5aa:635f:7c08 with SMTP id
 2adb3069b0e04-5acfb00c7b7mr1360974e87.7.1781124124359; Wed, 10 Jun 2026
 13:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rust-reverse-randstruct-dep-v1-1-45ce9ee8d0d1@kernel.org>
 <202606101335.648C6993@keescook>
In-Reply-To: <202606101335.648C6993@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 22:41:45 +0200
X-Gm-Features: AVVi8CeKmaEylMIDtCA3uvyQRS2s97f1cBEsBG3LVoZ_J7jIYMPtfwWRp6_WCeU
Message-ID: <CANiq72=bH=H-pMHzB7Bk-A-L2421qZD=bz3Rm4kH9QSjFxNRbg@mail.gmail.com>
Subject: Re: [PATCH] hardening: Default randstruct off with rust for better
 allmodconfig support
To: Kees Cook <kees@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Can we instead just allow it? This has been ready to go for a while,
> IIUC:
> https://lore.kernel.org/all/CANiq72n=3DhgH4bqJjp8MsMHAaxaAo75GSBcHGTvFT3N=
TSaVPGWg@mail.gmail.com/

Mark sent a v2 where I mentioned that! :) Please see:

  https://lore.kernel.org/rust-for-linux/CANiq72mmzfBg0_y+TMTsUUuO0cJFE0=3D=
n60-ttwOynai06_y=3Dzg@mail.gmail.com/

Cheers,
Miguel
