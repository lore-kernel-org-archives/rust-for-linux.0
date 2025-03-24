Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE981DF970
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742850702; cv=none; b=Lq+YkymzwtcMbpvhl4D0ycwfMN5k+nOTc/O8fVpP3qO65zX8vv+XsXxbQdGZVuoKG4/MkFUG9repcCz7Z5Ki4Vufq1Bxrcu9mr+mdwWzINPGkX+1fOeOu2oaGWHpB/I6RWCA56B0jsX1OHzf4LOiHlgLrr3nGsSxcySmuw/RTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742850702; c=relaxed/simple;
	bh=98vXz7egy94TYLC682txQAnmAj5oaqSFvEunVbaJmLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4s+hjx7oRSNWB2oRD+pYB3jEZ5HRikN6mrV2hyAz14++V49EPdv+mLaWrkjDU7qzS5cCmoTxQXtmcwt36xot2tKwNjuuIX7ukYqmmwD/+XWXKD/r/eMkKCr2L/QMFRWsr1lJ/d/5zI/ss2HvDO9N4+OEaK2TISe+U4hiPFuVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LprbuVvm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LprbuVvm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30363975406so210637a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742850700; x=1743455500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98vXz7egy94TYLC682txQAnmAj5oaqSFvEunVbaJmLw=;
        b=LprbuVvmm1Jy68rIwBF/PWN+ioiv+GueMwYOx+jFiSfPHmfQMj07Ju5uu7tOpSNHV7
         D3mV8ILm4pgjmJBaL2BZlC98lVa6Wg0mKxlZ07eNurM3W7T6Pm7t+qyr5fG8i6TT/4LF
         NjEH+lkSN4T+l/JEBUNX9gdHsRtWXhtpQ4jnOMgrYxAHCAiEJHEl0mKiQGIPZjfN6ATi
         h/kEgm5vxoHc/ChOcE+Lqv7E5mvPVhqVhtFAGqk9pLgpVkDncQPLDScSQczyigzh7yAR
         0Q2Qjy2IAaQI05TBLoANdNYhRgK5ns4veKznUq+4A4IP5kjuD8BOOlTvHPfW8iH+3I8M
         /EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742850700; x=1743455500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98vXz7egy94TYLC682txQAnmAj5oaqSFvEunVbaJmLw=;
        b=fQzWq6D2SwYU9vypk7FNFLalTpGR9bl1krB+vw53TP3kW5veBSpdY7d773hIP3iU/X
         6AhsugkZF0q6md8LqEqY7gpwqVbMli8CeAIUY0MjuLAoZk+xchQRvpDG9SkxVI0mOMmo
         TDn1jpv/lZA+BgaMekIZoecvjbpZYbLTU1bVeg7JKkkt/5fmxF9EnBrLf77VJXlTR3Ak
         H7yd5zxmxRboyIBepsNvJORJ9c6Ww/IMPsDR+yAroWyAiu2Hk3kiPEqRx00zmPrWRUOA
         7nGnKcxQMGsPqgx+01G0BuJSHXZMmDhKMBU76OVTPNNWEZOqUuRldE1cggxA38coU3GI
         Yh0A==
X-Forwarded-Encrypted: i=1; AJvYcCUmfBo5GEUyLv07LQ+Gn67XqHDDNQJQXisdAJrtFmt99fCa3W4jXM4qyaZStCyvKdMHu4DfxjIBB3QtWPTDqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUIvbkTFqdRQdzXuO5j0MWHKaxTdXGeEZ66apFhNaqaC0soaQ
	4e2p+xCOTR0C1zGMpbeD/ZncI31hm8crTUMXNWx+IVPUqoChrO/L2KRlEDNasLanhqotkP8VR/f
	eFrcjvR3dF5Z3Eh5eI/MCbdvQkNI=
X-Gm-Gg: ASbGncvEl63vXpvuTZSKPkXlzFE7dIlUuiXZvqev5VK5QVfZDU8dOvpBd+KPCzBJ3Lm
	8JiCKBjp0L/bjHwCXYH08sSf71Sz0ZtHzckbsRzMIdfeXe5ZC5wIfPBvU0kATF/mPGA29Koe3Td
	nQ+amh3T77+vRILj4zza8P9pNxbQ==
X-Google-Smtp-Source: AGHT+IGlK53cW5O0J9yx+BwSA8UnEdXpaRs8Kk/3stYmWuxxMI8UUeYIqg8ikKaIOxrX88G2Ir7U1RGqdUhWbOpvm20=
X-Received: by 2002:a17:90b:1e51:b0:2ff:6941:9b6a with SMTP id
 98e67ed59e1d1-3036b489d55mr202999a91.3.1742850700190; Mon, 24 Mar 2025
 14:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324184403.868691-2-altan@ozlu.eu> <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
In-Reply-To: <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 22:11:27 +0100
X-Gm-Features: AQ5f1JqVYOX1XqT7O_qaw2l4yuORuILyoc3O9jwnTpEUdRJmNhm9i-ibytvvbSg
Message-ID: <CANiq72ncPFucbuL3M7tbBsahWj5Dv3u0VJw13-f8Q7sS-Xe4dQ@mail.gmail.com>
Subject: Re: [PATCH] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 8:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I wondered if we should use `*` instead of `+` nevertheless, so that

s/instead of `+`/instead of `?`/

Cheers,
Miguel
