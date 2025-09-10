Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA41DFDAB
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472671; cv=none; b=dE3/LmIAQP8Dk/k7hgV/HPSG/Mo0IR8jq66OdDZblitWZLc2v9GiY6/nrBp57JTXMu34bw8n8tk5SuPm9fXZlqMtkYCeQIO+393ytAr5EZ+CJ4bAvsX64AlscLc0GwgvhFI1xRHRz5viLZv9/h4K1I2WbHHGut8eeyGiO0+JewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472671; c=relaxed/simple;
	bh=EtsERrGuUPQUjphbYZJJaJS3niN77FqxYnzLWZQAx64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FqRidMfkMQXqq15/tQDm0VrOOKXZZ3kPb3vRPv0OAQqHJaETo3fnqL0p3bIWoBb2tDcnZla3phaI6OeotcUIQJspWuCPEBhrlDAFxLF6iHR4Ak3xixxRw199k6O+/JJgqYeLGG8BFKuuQeShQ0GV3Ik7qmChIrtcW8D+GBnwA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELIyMPzk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELIyMPzk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24af8aa2606so11514085ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472669; x=1758077469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3cDWVvExlqY0E+Cv0lKzyo4mEyiBol+XD/LhCh80Vo=;
        b=ELIyMPzkR89YUy1X0gXm/c+cO2CzjLO8+D0rRt8Yp4nzrx/Zrqux1fqod08eXhDFW0
         HZVO8bMcBg5QduJMLHPITAM2RB6/7Unu4wLUat2nGl7XoRFXClofvV9Q+n1fgMURy9SN
         gBCz46VIC5Xkn/WbpDpgKm9CeiNIOpa3gBc5W0TZyU6XeOOvA0TRl59s3izGGLItrhhN
         d+PhpdisnhRCDU9CewjxxS7la7ly5sw5GRdj2jHCbrRpDOHt5MwZlu9lYlTbr+ZX190z
         2fHdthQuyHfklJarPge6fTwHHknW6hHQaYQnGzQ5VF9vJ3O4GC1CP+Wmeh92W463fvii
         1q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472669; x=1758077469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3cDWVvExlqY0E+Cv0lKzyo4mEyiBol+XD/LhCh80Vo=;
        b=PHxLpdzqiqphtc3OlskwrLJFuONbSu+juNPKiveSpRCar2p7xqEeMZNWZyF2FIwpqw
         2CrzezIIOKSJbKM3pqXvLk4f9mJ4SlEml/Xcixi04UUHck2KG3MEHI2PtWXwA25DqsnX
         1bZ2WDPwIjk6rHYhWB0TvpB+0dPaKS4osCTCuBHhwx0Bzlpibft255yUbT+ILgbtLJ/g
         YPH9vmAEZe+Y5Nk2x38zA4pSfgenIrJj7TWCOyctP2p401wfdBd3T5+0IrNghURm2PSb
         93O58vfihknZSpDiXLrEm11IjQNgUeAoFpG8GrJkqlW7RxEBph1Ki9FZ0o8Gj5zIee4q
         ZMIA==
X-Forwarded-Encrypted: i=1; AJvYcCWYLCaY7pxdFf31NshfQtfIIzDZ8b6sPoEiZeJyMWB8CFBikgh7jr6mvGBVEU7VXAKToK2vB12h+mBdYqT8Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGgI4+tzZ5Rn5l9fsPsAv1Dg4Hwwcz1tBdoMnDCrt1RvDHcAHV
	bXB5g9YGs9N9nZbmiLF7hUoAdZQt6FdOTWLmNiItZK5ahrVVoOvrefGbfQbRRef9bZzieQ49PnV
	1Jpf/rcJ4+KUko2z54fopBtnHKklAmqE=
X-Gm-Gg: ASbGncs3ImauCHFW/83i5+Y/eXEYMBW2mHvdux8butJXhbvwdEv5TdUmJ7gwu7FOK3w
	zaLlcgP2aBjxdy+DdUXWv5+nXsv6cz1RzwhIRQYKR1jrXwOMcu8Lm80Cy4lMc0Yty7TE/Qb42kC
	LX53gJLr2G137yynAJJeu5nJPQncZIEfbIs71hO9OwO8yUl/tZ09Yok6PxbQ9xk+7L6DARYXcLg
	8bqLdB4Q+YUYGMTftY0A2S5iKF6KBCTFbTgFgDQTiEbfoBOCUfveuC9NX1uJwZ+BCiqH532gXxl
	nxRs4ahfSGWAqEaJyNqO4yxMHzz8j6TTsjUT
X-Google-Smtp-Source: AGHT+IGOVxPPeHlaId8gR8lioyyzsheNaiwTT3Z4mTxmXaDAiOl1rybxKWa35nYEmELwWpePOnf3WMn/mBBDODtw6NE=
X-Received: by 2002:a17:902:ce83:b0:24c:b881:201 with SMTP id
 d9443c01a7336-251757ba959mr101664375ad.9.1757472669129; Tue, 09 Sep 2025
 19:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906140256.3059395-1-vitaly.wool@konsulko.se>
 <aL6YHkF96ICqqbBZ@google.com> <94252007-f389-41d0-b5a0-ed948225543a@kernel.org>
 <CANiq72k6OXcvjzKimfzKAAw8QPzDoVxUx_smFA8KU6gEwJ3yeQ@mail.gmail.com> <3f8de021-8eb3-4a7c-9adb-8244c5aa250a@nvidia.com>
In-Reply-To: <3f8de021-8eb3-4a7c-9adb-8244c5aa250a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 04:50:56 +0200
X-Gm-Features: AS18NWDFbBI9-w6QOjK9I1s_Ny3SqcFb8YmUlOePJpvF51e4H4-1WzSgXfRqZlc
Message-ID: <CANiq72=ex8zJx+KZTV5eRoqkYE=PUkbG5TTvOJo5cXTtd7b1Fg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: rbtree: add immutable cursor
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:09=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Interesting. I know the topic of rustc minimum version (1.78 right now)
> has been discussed a lot, but I'm somehow still confused about how this
> works, on nova for example.
>
> The &raw feature requires rustc 1.82.0. So I thought we couldn't use
> it. But clearly we can...right?
>
> So confused. Please help. :)

Please see what I have at this subpage:

    https://rust-for-linux.com/unstable-features

I hope that helps!

Cheers,
Miguel
