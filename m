Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220E278E75
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664471; cv=none; b=SSTKAcf+SbXinKNdCsZ9O/NEnRcMebrKgCUbTOdp9Y+9ljgo0pVxeyS97MOGtKGNdtUcDyZ/GBUndurZKnEFOl5+c+aMzFabvIiVeb39aik0T6CptNPOgdXkGmsM3WmArZbeMxlGCSut0LQDhN0+0HRctn1sT4Uf6y1mLIilqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664471; c=relaxed/simple;
	bh=6dXj1DLnmnqzoDVPW4Fl2VLUfC3mtT9bsR0Q8uz6bKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f96qyywDwUgtQkcQ9zkxbykTmK1YXyp2Rz+FW1vIBpfbQ6H/J1WvlWuMopVKXdMAjbuG7umCMKf7/DJI9chr6nLL/ZbKBgpzsl91CwM/wltAgbT8sWK5bB5JPYYgxp2aHYDVcWAqVpAe82/9WWqTRtG/FxtVWAprfHyGzp73RTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEANNBOt; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEANNBOt"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b16c64b8cbcso599229a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747664469; x=1748269269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sX2ZQWb6+b3QCwP/nukDDP0kKuHLHBuIsESslv1fcc=;
        b=JEANNBOt3THY2CUbDBVr2LZp6/vpkxb5K4B7rtp6MuA8P4oiLGTstuXzRYbmFestNW
         oQ1V0TftmlYwOx+Nqz++6mqV55kADodmDRUetGap+l0F++3BnZvQXD7pBsASoiISjFYP
         vdkpLiBcdNPshrV8eCE2bg1VklNbgwUj5nd0gzW31IQo+S0py2A8gH7GByFAxxjO/mcK
         fH9YlUn/SK6wT0jhTJXdtUuEBxFVYnIrOE7lgamecUpw0Xm9frp2c5H0ak7kLHLz161W
         5XsTehrZ90r4SzirQHcojE16o2T5/ZgpMPZphE/nXBXWVe30dY9xGGoBLjN9Tx0jokVj
         x0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664469; x=1748269269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sX2ZQWb6+b3QCwP/nukDDP0kKuHLHBuIsESslv1fcc=;
        b=JJrdLxDkUn//Ozq+rwZv8RsV3yprxk8GAlBkMHdLOypd953vK9sAx05epvK+PlSuUG
         Helorbp+ms7JsrMalmWkAfIJFqPmdlb87vzz0oPBV4EQKClGgDJ1xa3hQiroRj39UQxB
         PbrT3lMQPJ16+wYGNwSWqnUODMGXI3mFbFuH0yvr3fQaVWSOP8DAOdjQ1tUyjXSFFLFe
         TGPs11ucLB+Nx8SxGmppQUL9YsSauwn5HYOKNXJt8MIUCLZizWOKceVcnVjywNoWuVq2
         cXT/TAKdGvZyxmFazqdBzIgCsSXyIMSj8JKdf+O65+tr3fZx8jarjSikZ8Ai0ZleuWKD
         YgKw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+Ft1NFVAyJnaUyA8VwVk3+xCXmbUfLpg6fvbP9pvYfmC1RMRpTb3/CgXovDSmIkVlrEF4TvjzrZvrmBekg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtU/zkOcDPKWD3d0X7MoRgHZI5X78wACF6hs/5jV4pEnk4wQx0
	Y5W3Kz/JZfzVqAfn0ws33o2+U6R34VQR1vY5pcsSGm38+X9S324N7w6Imxn/VMrpfk9aakLWZOZ
	GQacFLbn/3tRK9W0mtQ9IQilvNqqDtc0=
X-Gm-Gg: ASbGnctA/0cxNa1wlqks54odNinJXkdCoXLsUFfSflWuFFzgkdz6tHvX5lF5VIzrjCd
	X8EMUeR/E5R9PFVNgaD/d9FmSZ0rf8q88pTx+A3/tNKEtOtNeJTuKVnmcX9lmONy2d5XqpyjZA8
	rPX+jfhcBTu9tB0NvEg1stMx4P/SmgyPrV
X-Google-Smtp-Source: AGHT+IH9b/cc6E3ixIMiSkOHZaj9RLWF6xshvQbv7VybZUmsopWkMmH1vtiUk22N+YSzpucNVBuTaf4LsOrrn/EvOps=
X-Received: by 2002:a17:903:1103:b0:232:202e:ab35 with SMTP id
 d9443c01a7336-232202ead15mr32055335ad.1.1747664469563; Mon, 19 May 2025
 07:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com> <20250516122349.1944895-1-igor.korotin@yahoo.com>
In-Reply-To: <20250516122349.1944895-1-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 16:20:56 +0200
X-Gm-Features: AX0GCFtk0ONXN8cdEoEC5nfpWpl-aL4A7jH8mpi66fgclvxFmlQfUFkB3cNygMA
Message-ID: <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel crates
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 2:35=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
> index d8120f838260..5e5a0bee9888 100644
> --- a/rust/kernel/static_assert.rs
> +++ b/rust/kernel/static_assert.rs
> @@ -20,7 +20,7 @@
>  ///
>  /// ```
>  /// static_assert!(42 > 24);
> -/// static_assert!(core::mem::size_of::<u8>() =3D=3D 1);
> +/// static_assert!(::core::mem::size_of::<u8>() =3D=3D 1);

Hmm... Why are we changing this one?

Thanks!

Cheers,
Miguel
