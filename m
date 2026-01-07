Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3581FCFEF
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767749382; cv=none; b=sSQYvL3q63nOxfA+mpFYTquXtSG35+v50lOzaTgnHTykXn+C/R1xjwjuHC8vYi6shmnlkBXfRj26y1W9GVkWmWgzYB4gFTssU+Hy8fgXXWkIYNXvel4HTc5BS6S48MxwXBhGsQ50TKpWg3OeyYyIyXpCa45JVcQ1XQ384NwUdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767749382; c=relaxed/simple;
	bh=DRFKsp+Ap5KxmehcMaouR40Asxsi+0n1hhESSY4aars=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2knZTgBmssdUPLIHZXwEULAeb/0IdkwfFuRzecIWnn8+Mfl2/OYLpmyqcfTubED49YezH5SG5XfWGw/43dbm63+NHlOVWn70jmteCr2/DXo/pFPIjzfptGaPblFFM8T18h+VV7dxE2tDs/k8TBHpwa6oHHuprreTdP2Nk04Zy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EXmpLceC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EXmpLceC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so1403788a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 17:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1767749381; x=1768354181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0pBefQbuso5i5RJAZg20ofCLs/9BTYjoo+5IsxGPF0=;
        b=EXmpLceCA/JRwHAbIUa9rrRMjXPq6V61AFql+i2WJjS1UkFA9aAeJntX1myOSYPqSK
         kVncWerxncXYm+sxXMmBq8CxHXhhdCyLQdRgjYwERnsY/jwI4BS0OSZohl3SdsmC07NU
         CZKyIyjfTA3QwiENe3E1m1wjCrHBKlb5fuXST4A9eO+gTSl9yvUIFdnZjjoKAQ2oAsG/
         pscghClF+K1gNPesTGBoLAEXk5D9cXrHVaIqu5fZKin9t6+4CDnk6kOI1CNrUF/2+PFp
         uzLCDnKoQYKHZppHtwHUqwKwWfZG90jsFBzkZ+xqIsnAPRDoM0QyPBLXVrX6VAofUcHL
         1xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767749381; x=1768354181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0pBefQbuso5i5RJAZg20ofCLs/9BTYjoo+5IsxGPF0=;
        b=cVS8lGPX/UgffVTvtKVE3fV4VLlX2LpYJDaFcDONk6Hh749vVRSCrhokJFNERliiT1
         zjVEr3LiSYlUJO781upiQYEj566/p/YAybB+QkDrUTKCx2pX/YKD6gaLLE62g6nVWPOW
         dNxFqtixU93zE4GL3WLnjZnU1SmwfiflvWYfaqWEMcODQOludDHeVXJsu/d8D9AGs28K
         oslSjpqVEnzVTxbCPk9+ewq6TJuASoo/yLC9GsZ2/ePAdnB5sIzjIxOr1DA2xO6o47iU
         tdXsox1khvj+JFwf8BpLk02ym14VmYCI9dIug3qoWAtk10K4Ss3csxgAdDwdMo9CIlnC
         fKIw==
X-Gm-Message-State: AOJu0YxF2mI6bn95faniLHmj1SD4TIRM1zaN0zNBDZuYToA7bF3KNM2D
	cUTho/+uUb/wzciEDKAAbnTNwPaZ9ARxkb44jZCItKATKSxRydXgkOMY1FxRGnqGVXUrsYc5Oyz
	fD/7UJ+i7tXGJAv+xh+7DXkz3bB17Rs49C1A9+X4M
X-Gm-Gg: AY/fxX6Fzp3n74ihe+Cls8bX9WskLB1XW9fSS2qpGX2RnuouBwZDr08m86KOfSUC2Rz
	01gyfpjuU7LyDURz40KwTJ7hu/fgBR5DHsE0hMx8gbgXwAo32n4gcyKnRBRYEMb1Oghn+wXpBaQ
	Q+rEu7XpD2aHlR5mXjqI6m8+8xFfzT68DjY8Pt9I6QvUA1Bm+nkM8TQPfV1BNK6YiWc0Q3iWjbI
	67m14sLoNqwad5Rpa8RJ6hjl5TToK4zPkOmVIl8mb3De8K3vD68kgCH6Iw6CHAWPFNPFhdzBbOg
	EyWz0Q==
X-Google-Smtp-Source: AGHT+IGfb2A+nhvnNQOx8TMMH9EiNVUlKYqXZyMaRyVzB5cl3V/K+cnLO+l81AYET4vPB/8feGDBkgFNGMZHFYAt6hk=
X-Received: by 2002:a17:90b:4b0b:b0:330:6d5e:f174 with SMTP id
 98e67ed59e1d1-34f68d0bc5fmr895604a91.20.1767749380695; Tue, 06 Jan 2026
 17:29:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com> <20260105-define-rust-helper-v2-18-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-18-51da5f454a67@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Jan 2026 20:29:29 -0500
X-Gm-Features: AQt7F2renVuLVVe8wWTbuH4q3nq7hx1KIccN0wGk6bVav0-qDU8XzYmfHUWf8lI
Message-ID: <CAHC9VhTscH7SE1WTQrtXRrhNV61f_MAYViF4eJisfEYj0-ZDoA@mail.gmail.com>
Subject: Re: [PATCH v2 18/27] rust: security: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:43=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This is needed to inline these helpers into Rust code.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-security-module@vger.kernel.org
> ---
>  rust/helpers/security.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)

Merged into lsm/dev, thanks.

--=20
paul-moore.com
