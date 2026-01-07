Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607F2F5A09
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781339; cv=pass; b=ZmL1qExwzEi/hZu9y8kYeQNeDEQfB7KUAmgkvyGClnSZMBjR6ifacXxn/u+oAPTyAlFH6lT9CfyD74vdU21cvMhCUwdKGeDo8thtp0TqyDmxsKHX47/OwsKzKuew8yjaFFPHePEN3mDdEJYbJ3FVg0Umy7iuWIPEhIY1ErGD3QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781339; c=relaxed/simple;
	bh=4SrWBuwr6RrSnRbpQSMJqUyxQWsz4NCVaKwPApe+uug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skxatzDC6eFuS87ooPMhXOmoiv+Etc30iWTdE1zQ/WyL2dbr2kVVTR2wx57ZsktBgNizadIseo+F8Nh6bbMrv8RJUOCzmu1t0IasjXpgWfxOxMTZ3H1XRLiCBAKnCsLfiLc3o7/V99zv1guCpjmtVN3wDrfQXl7inGJPspTy96g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPiLOpx5; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPiLOpx5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11f1cb6cefeso104076c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 02:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767781337; cv=none;
        d=google.com; s=arc-20240605;
        b=O2vu2biwfflljwZHGe0qDudARMJHV7oocExxvp4VAsvVGPXlDWUmsB2hNiv+PmxhMB
         +YtfVRAEvlI4P0xcY8/telbf1tR35y9Dg0pWpEJA2xJAwPT9+ZEbnxJqV8QaqTcysTxv
         p/nuoZECRiq1BE/ymjoVUF/aqtI8A4iwN3TmvXRlq04+GVXir/59+Iu2/WM3E+uywJbS
         HHSSfht7bTOmxYLnFvy5VeaQoQbpCvL4dmSD908YXOR+UKE6/fzeV49+KNAEfCJcp9Pp
         F6hg9vm3eexhmJCizvHNUr0AazpvDV2NZzSAmp8eB68VJ3OaUwXY/KiuNXpZgH6pIPJ0
         NqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        fh=xo0+dmeMc+o2boakpkhFm5dn2CpZm9p2RWhLXRJ2e9k=;
        b=aL8Yg/U/kGLiYHhimDb4/2ZIVUm73CgBXK5LRvi6dyWQ/RfySrhiP9Oxq/v72KHKML
         PNQA97n31zk323YmjGReiM2Dyd2qvZkHQlCFwq/xVP/7Nby8KPVG+TrB8iIH5cj3kTWf
         RqDoctghWXS7rCZk+wVsjSZnkHpcq1dw//dxIg9pxvlKCU1qJljv6E7KYe/gKI6ZGu0w
         orHx6PeUEPA3KsrLMqtC6/EUKjIJRCokpeJWmI69sQIyeYXlU0L5Pde2admaCacEtxSJ
         0g/3GfdoEapJUB/dcPGdXggYGFfZHHcbrqtAUo/Ns3Iyic0AyxxKDGzuAFKFdKFrn2z9
         Rw/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767781337; x=1768386137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        b=dPiLOpx5pCd+tjxXVcu2k+HT/aj0lghARFoFtIJFJxPsXPD9X52VaHYSFSMgS43Ex8
         e8UXK4c2kV0o2cp73/pix5m8G9DPOmyZ+faS3+3pv+/Y/Q2Dy0ViZPUJQhMe3UbkS5uN
         Nla2XAxE1HyYQvBhVhv7Qt1P8MqSTc6EZ7Ip4RkCgQPI23kbu38b8hgR86Gd4KnViy9M
         gpLwMF1zoctUsLr915uM2oI0AzttgPPTKq+OFQlFKB2ltFijkbJt+NXPlXUJzD2PXQsY
         LiWNQkaxgZAGhrUGOC1Z75ET/VvCubVsbKaISpvtZ82ED9+iIoorv3hfTFbAtYzCo/GU
         TRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781337; x=1768386137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        b=W79AQjx0cUjGEl2vXvYBcGY663Owszx6ErQbGvoR1e+9mF7iNBqDp3W+FV/rsG6VgY
         02EhIpp8jp8hpnMFATpyTBc8iHpNo9Q3yzmRZiE3oIBU/yJ8PD3b1mSTfW+hAtFc0nHB
         XpKzf6ZJ4i+d2MIva0e0QIHnsh/8TCeHP0JyqF0XSRibKIrdpv0PvUGDZ2MpT+5FsgDX
         mWxEWoFXsS6Zu8jw+zdAp6kjt2CqokoNHvA2O/KjPURo011MMd7jVP6oHico4JX5dq2F
         bw1RSll3bde83wFzYhLrvsb5/qLAcVKuPjgnU6d0uz781kdh8LZDo7dJtzmAj4jijyN1
         bm/A==
X-Forwarded-Encrypted: i=1; AJvYcCVd5Ef01R4wr+zQOfJoAq/52AeYz0v85KMg1ycN5h0nsINNxWyQG/zauoko1rSwIT6OaCckgTXbkkPNQrtGdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjtv4AUL46WzYxEU10fOhmgCbQ9vgZKDfysQT8FaHWHqhnuxAS
	rEXy0dg6x2MSpDmQuZnBPU4ZhWQGrqbtLRllK+46WbwgXnMlcZFBl6kPcDNA9Jf/SPTrG4hH5lN
	0Tl+qjt3HEiIeNMqmdtojvLFI1IWS46A=
X-Gm-Gg: AY/fxX5Kr1WBlvlowTTvflVA/aaB+SWAnsNO8u7fSf7qEZutgN1DEC0pt9bZ/4zQ1mD
	IKpSua8khUIuafNpa7DjkVl+8OIehlgH/6WzT4WgOher9cLq66Kzz2ziLclM9iSI2GQ3K9ChFsv
	hQa6IFVsqBBga67uVybmnhQnku10atPaR1/iHBAVIWftgTmfv22lUaePDK6iR/zgwuKWOFKKKD6
	uUF+GRnOedMkmWVkuGxIZlE8taLWoC5qhBO1OkW+XQuVe1cCqrPA8TTYP8QgM8u5OBYzf16VftZ
	7F06bNuvjzU5aet2fywZ8apnJW79m48H2jmuBctsTev0ovZ7UKxrvWRKW6DZbQVbhpg7yuYrf7T
	oX30s7LHyd2G+
X-Google-Smtp-Source: AGHT+IHfFeGKwpSxoEw7wvWXxXuhPqYFWR2DZ4U1jG2+RFCEMUW5WfmNqx+EbqNMnb2jRGTfm9cGxkYPIXaNkpSitnk=
X-Received: by 2002:a05:7300:e9c5:20b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b17d06e857mr568526eec.0.1767781337368; Wed, 07 Jan 2026
 02:22:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com> <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com> <38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com>
 <f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com>
In-Reply-To: <f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 11:22:05 +0100
X-Gm-Features: AQt7F2qX0fRX-1cI1u2SPHWZHP47yPTczxbJZU6ADBL-ZnLG8wR6-v9o-mgeA-o
Message-ID: <CANiq72nTWoAPzqyqQNegxznSg64Cd+2b-Fb89fmOxKOjMHBu+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print strings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 3:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> samples/rust (pr_*!)               29             6          83%

2 of these 6 are expected, 4 aren't (`cont` level follows).

I have had a good first issue for these:

    https://github.com/Rust-for-Linux/linux/issues/1139

I just added a few more pointers to see if it helps people
contributing, and also a link to your table since it is a recent
search.

I also linked our other issue about having a `checkpatch` warning for
this, since most (but not all) should be finished in `\n`:

    https://github.com/Rust-for-Linux/linux/issues/1140

and the patch that would be nice to review/test/revive to see if we
can manage to land it:

    https://lore.kernel.org/rust-for-linux/20250207-checkpatch-newline2-v4-=
1-26d8e80d0059@invicto.ai/

(Or we do something like our past ksquirrel bot which is probably just
easier, to be honest)

Cheers,
Miguel
