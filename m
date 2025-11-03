Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6113D503
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762192078; cv=none; b=MY0yg0SLOMhG1O6mZs0wgztbWjitZlbiHLGJ+9vXgLEGonrR//S9rxQF8XsaIogQUfkptu+X6bgLpLN3ODIFFuDBwxwzjqMqV33iKdCWwOBNIhwfLFTvvjHZhUo1F/WN1oQ2p6czx5vSvas0NzcHC7ue+Y6+QX9+nmp6/fDqtaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762192078; c=relaxed/simple;
	bh=SgKh3F2MqSvY/+atnwKQbzqTAv1ZnedXCRhqmQOnc24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfbz0JmPjF8RM1VwNUVL8uGtpKHCSEpIeHr68pNLSHMFNxzhg447gsYaW2TTQ9fUbwK1I515g2cq1iFmmafgLQRbt2Vz4NXmIhDUX2pEa/v+ZhIVPLXb9s9bnfcJU10/449Ed3Yq1+WVoxYG1rZHNDkPi7xRorKu3kc0hpqNyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=OBJcL6dm; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="OBJcL6dm"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-945a42fd465so199737739f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1762192075; x=1762796875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjAKDCwmdTaGo3dsotYYIlyzJDEkmULXfXj+ZPIjvrU=;
        b=OBJcL6dm59zkEX2MVYKKWpnpZSg60u3gIanBYB1fBVpqGfbfKbY/MwUcefeIz0Mp69
         XNDI9sY9Dl7TwK5CpY+q2XnBWthJXWDzY7MNOGBQiW68lQAvl9lJggMoyfQs44diVvDQ
         /wdZpYucEgUnuNZG4/h7eHk3y0lHlkIRayb+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762192075; x=1762796875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjAKDCwmdTaGo3dsotYYIlyzJDEkmULXfXj+ZPIjvrU=;
        b=sHAvM8ZptDzofPQbgcAPUcUNDyr2+oWYLECnxGzkKw9WyWDmqQt24WVrjENol4EC+I
         1208R0o3kJpwd4GBwAhv7p0HJqVhBUnmR9rvSSazk9ykal+UkYbgnkh6lEQAVtrVP2Ot
         hCqmoKbavTzeZonr/oc43nwopVutFqAmSE6g4cMPybLllGeUEvbS3lAClFXEIZpyNTeQ
         JlRL0y/ZSwCeS2AyT4H/kmYwHfPiiRZwrku+VRgva5t0PGBaiL5yuvxVXYZ8y9YOIpGM
         ltba32YlBhL/iB+kJhptEqYkPBVgsXahNeYfZDK4letKj5FH0LgjX1ULwWcwdCMlvH2P
         wRyg==
X-Forwarded-Encrypted: i=1; AJvYcCWdGoXXDO1TpIpygxIIRcogmR1k31IhElzkoBWT44TNk5obXa7CJtMkPzutxQRfcplIdeobNt9QOG9XyN4jCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7F68y6aKKfonxflmvuakdAC6VAgBvIs1vGj2Plt2TmE4/QhhJ
	LMZ/qYo28Ma33SeY7c3E8y/BTqB30fIKwEUNYwN4LQDypobbzOnoF5qndTXku9rC5rAvP5EwMdu
	qlyd2luUwyljIUbhK7PLySu5y2I8oLDW3vu5JxAdg
X-Gm-Gg: ASbGncvk8pYwerY8ieJVo/PEife/cJlZOqDqEq09bYr9lUx+fN4aUMkRE00dISb/9S7
	VNACF+dKbP8UcOw3K3EYb2mrErShRFBlNsCPfLDEJWqYo7ln9GbOlqPTMHDpXLVJViV75c9ODH2
	18m/FyzqU7WaDXy2XVw74xv6SZXs6D2aHSSVgXUapEHxtzoebtXkTnhwBohluJctS3g+chB010Y
	nArnjgEhnUiLJwWgl9Z6wiuPfasfvY9d/8YS0P7j5na/E3BFOd+TkUHabIZsFMApesjU51O
X-Google-Smtp-Source: AGHT+IEoZVeUMOUD21Jwvlvqg2DuQudLZFKN+F2ECw8IcJFa2Y5MP2DG+/93iqFN9rXQ8x3ei5N8FSQ+NKgZ+YBpzNA=
X-Received: by 2002:a05:6e02:12c1:b0:42e:d74:7260 with SMTP id
 e9e14a558f8ab-4330d217155mr180383195ab.29.1762192075132; Mon, 03 Nov 2025
 09:47:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org> <aQiDjuHK0qpgmj1J@google.com>
In-Reply-To: <aQiDjuHK0qpgmj1J@google.com>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Mon, 3 Nov 2025 10:47:43 -0700
X-Gm-Features: AWmQ_bnqgY3TD7_cPq8iTJOPSR5fRhrV4vLHy7AAe5o1XlAgXCBBQw2b5bBW9MI
Message-ID: <CAFxkdAqxuFDMraNBNrOXPDpRzQTQftmc+QQMh_PVMgmLkuv=Tw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kbuild: treat `build_error` and `rustdoc` as
 kernel objects
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:29=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Sun, Nov 02, 2025 at 10:28:52PM +0100, Miguel Ojeda wrote:
> > Even if normally `build_error` isn't a kernel object, it should still
> > be treated as such so that we pass the same flags. Similarly, `rustdoc`
> > targets are never kernel objects, but we need to treat them as such.
> >
> > Otherwise, starting with Rust 1.91.0 (released 2025-10-30), `rustc`
> > will complain about missing sanitizer flags since `-Zsanitizer` is a
> > target modifier too [1]:
> >
> >     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `bu=
ild_error`
> >      --> rust/build_error.rs:3:1
> >       |
> >     3 | //! Build-time error.
> >       | ^
> >       |
> >       =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates =
compiled with different values of this flag cannot be used together safely
> >       =3D note: unset `-Zsanitizer` in this crate is incompatible with =
`-Zsanitizer=3Dkernel-address` in dependency `core`
> >       =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or uns=
et `-Zsanitizer` in `core`
> >       =3D help: if you are sure this will not cause problems, you may u=
se `-Cunsafe-allow-abi-mismatch=3Dsanitizer` to silence this error
> >
> > Thus explicitly mark them as kernel objects.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned=
 in older LTSs).
> > Link: https://github.com/rust-lang/rust/pull/138736 [1]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I can verify that this fixes kernel builds with rust 1.91 in Fedora.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
