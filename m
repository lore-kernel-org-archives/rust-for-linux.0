Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA4214A84
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534126; cv=pass; b=i3xDREzQdK/ShPue8JtFob5ZFGKzSxpXlXWa0dZePsqLu+nnviYjQRH8zPDKlQfQG0Pge11Wl+jakJEPpdInmcXfIvHvbMsJRGLFdW7zHToNFAmDMiVLoEB63+fD7tKf7iXtJGdGYTk9F5w7u0OCcStoIxC5AlhPHE79l5h1D/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534126; c=relaxed/simple;
	bh=Wac+pf0DsXlahTayTTxHtjZ+4vjz4sfCHeWQqn9W9gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpFVZqysbTomzu5vETy6mPXYsROHA8oRmmGQE8C7m1QlOrnWdMKk/lnackA/orLGS/SvYMfFHOBRp/8cuCVotCygv+FtUSPYGSH+fk4BK0E2AjtGFFBQyXcilLDET18DkVKl5xcWIRVAaODcg+SKVvk7nHSfOV8YT/LhO9xxIZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVozVddr; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVozVddr"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so240989a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 18:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534125; cv=none;
        d=google.com; s=arc-20260327;
        b=XW0eNoQIjJ6ben9YhVXfDvV26t2czJB0OE79uhK0S0ChPmhaNxMshiqLXdO6SRDSi0
         051Pp5ksndKVSOxuwEnpRpMMNDT2hhhyKoAS81RhlREawGndW/F6kNFYs6MH6xtKn4hT
         GPG2VIsF0VVpC7nOJl87bm/zEus9jwYzK4YTRmHpAyCrDG2EmO8opYx/XkSJiNaagnPW
         NeiaNsvE7FhvgheiTN24januhojnxV3kag832H9eVD2vAy9DFij3cBAMQRaUWPe9uTZc
         ZtbuYUun1Ih0X3YWbG0qmeyGEeuTN6ksudyyRstGYoIbzmee1orCKZ9Thr/IN8GqHFBY
         Cvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        fh=0CgxU95wHDO9r3Ys5GQvcP+Q8BB1D6Wh5ELrVKVsfUM=;
        b=cO1CgffqupGmJFp7mIg+optsl86vyxAdgDmTM/BoUBMCUCnKWl1UeQOKtzIP/qVDBI
         A2k1g6YWFgJH3P9Tlf5vd9d4Rw9kHPQ/JTU7mOiZ58u1SwSTF2vxhg3YEfiLx6nX4Y+R
         nURnnq7VIRgOAglBCgOY7Ee4SGMDNLVfCPnVBlXxMm+BLLm//0mfK+cWTEAdBmyld9zh
         g5YyFlzJn+bRVw5FEMUNZJ++mo2bSatess+eBzrr31f+jLypqBTHLpGIkn9JVVPjXEaZ
         o/gAWSdqijGA9WT7prEqzYfE1MlfLj3B9oL767reCqdEAwaTMylVk9jS3byK923liG8r
         INFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534125; x=1788138925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=lVozVddrwveh9RYPQj+CvqDsGC1Ji7CNqy60SL6ouwK4UQ/Uek66mBSz3K2DQ6HciC
         pRKOYoZ2HyaR4jGjlfd2xE/J5F1GL0iVw26dLHp2JotyYjN0yqd40yppG1vRnj/+8Udk
         +qaMP4M3lW+x5NZZ41IrSQ7wIaywOV9qUmoLulLLedv1gFh7rIlMOiXKj9x+xPUwm4FT
         CK4P2epy3tZul+qe2vQHD/gHIrVN7mWCdY0VDtmW6LI93D3CA0B3NQlABsbghGnnqZcc
         xq/+jfmoZTB4wl41/hCQbTqNXytX9iWBwzD5lqq41hk3m/thKZ53zIvBfVe7mjHRknjp
         n4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534125; x=1788138925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=hRvEzCIxbP4OQEYjETazDKq2Sy5Yo04/gLXD0QrMUHV/1TXVTugvAQNmTjciFDDTw8
         R1XHtKRbh1xIHbjwTJprkvxs8Dub4++5bXUS/szoIGzPaG5KsSyJRcbwtFvn/crw+aKz
         QIkxlxuS9YS3IzVyBBzmIZneiSYeL3enXJvZToQF6PfG9eCgMRhN2yf78VlZSzHedQ9h
         8nm7cZwgU/N9fk18hgyPzQ7ihoIeQuNJ2QMShGUrAop30pok3l0TYkGwt1ulQRHvljdB
         jPLjU7oNT2U5bKcZcPt6pWWOeYmnIAge0iGqXOJBvozB/8+znb0CDs4LhxkooLUJtgjE
         VRsg==
X-Forwarded-Encrypted: i=1; AHgh+RpZ5vJIzfl2Ye8sGSQus4ok0CJRe1pEqCcUpFMCkRw86LlhOQCNDFKiM3Clwoa4zLSghLs5ly8yZkqz/HCj5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kCLc0HyX0rCJnkp/21dPD+WboCQRnfvpsxl44DBrq7eivSVLxA
	b26VQY0g+TN0v2PMRyghotEMoOQoAgGV6QoGThhy1WfWmUNXu+FtE8Fq039EwLfLMauw84JI2T7
	QZkgeQqM2EdepSZDmBdMzwU+Czcj5zGI=
X-Gm-Gg: AR+sD12D8rd8JLYjrfUzalkLR2SdDps2v+UMkrVFMFGs2DA5TlupeRxQxSXbLPBW0c4
	COGNeF3fqR3cklAs+olFw5KP/T4gHsTfYndd6u9LTvfKKPiRXKHanc2cONaNAObwXHfHXCKFpfk
	nXXryBCHbQtuw6qXWlvNqGn6DW62604m2TI/JSrCUy1PE2GWlX/xloRVt9nQRA6E65C/bRzTJ0g
	ikAXk76wXBU+FBs0h19HSBFXpRf+YFGHwd05bHdNkdvU3nZG4ifKK5HqY9s21MnsVcFxk/5CFdQ
	9PGnhmUcbnj150yFtUzgCxzdbRRBITO+P1m9UMHvPm3s3+DG3IWbPEJajvoBMQEpLJwW4Gi8DAi
	i0O5KoH4xC6QB0W6LfHXrhdFvgt56F2GAh9JjusM0vmZLOSgqz9odKALGEgcw
X-Received: by 2002:a17:903:1447:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d64b009f3fmr217086915ad.2.1787534124733; Sun, 23 Aug 2026
 18:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org>
In-Reply-To: <20260820135733.37121-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:15:11 +0200
X-Gm-Features: AcwNN1UtjcFt1AZ5tdG-mZdaQzytXvl_AMwSBSeb5Dd5Blo5Jox-8q4zsp724Yo
Message-ID: <CANiq72=SL4A-UQbOxngRy8-6Q-qHKyGbqOTvqo=uJNyhr5nTzw@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 3:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> In Rust doc tests, there is a dummy `__module_firmware_test_init` functio=
n
> generated by the example in `module_firmware!`'s documentation, which jus=
t
> returns zero. Many other documentation generates function that produces
> zero. LKP test robot reports a `Flags::zeroed` instance; my local
> reproduction has a `Bounded::new::<0>`.
>
> LLVM's MergeFunctionsPass incorrectly merge functions with the same KCFI
> type, causing `__module_firmware_test_init` being merged into one of the
> zero-returning function. As module init is invoked via indirect function
> call, KCFI is checked and this produces a KCFI failure.
>
> I've reported this bug to upstream LLVM [1]; in the mean time, disable
> function merging if CFI is enabled. No separate treatment is needed for
> CONFIG_RUST_INLINE_HELPERS, as Clang does not enable function merging by
> default.
>
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.co=
m
> Link: https://github.com/llvm/llvm-project/issues/217629 [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

    [ LLVM already has a pending PR:

        https://github.com/llvm/llvm-project/pull/217665

      which solves the issue. In addition, I asked upstream Rust if the
      unstable `-Zmerge-functions=3Ddisabled` flag will remain around:

        https://rust-lang.zulipchat.com/#narrow/channel/425075-rust-for-lin=
ux/topic/.60-Zmerge-functions.3Ddisabled.60/

      and it does indeed look like that will be the case. - Miguel ]

    [ Fixed typos as discussed. Reworded slightly for other typos. - Miguel=
 ]

    Link: https://github.com/llvm/llvm-project/issues/217629 [2]

    Cc: stable@vger.kernel.org
    Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")

Cheers,
Miguel
