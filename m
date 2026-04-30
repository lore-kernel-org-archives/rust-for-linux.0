Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F00737998B
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584190; cv=pass; b=i4c/Su7RaKOX3AuoeLjMX3InIjx1NPgNPpS08MNNF800R1eFeBNP50mdWpQDBhHDC4gZvRFpX8i46Pxa0ddWTuaPCQAk+wp5CRJNj/poMgq8Xs7KSi8+A3riaGko2IlEWnhWIzjy5Nd99xJkOPvZbgypFDRC+leCHBVBC3i0N+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584190; c=relaxed/simple;
	bh=2uxDae9ONJwe0Y0DiJfQRd5vGS73WGpldKj8Ll5+1w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgcfwiZs4uS5K+Vq3qSQ82e6XxtsHMdVU95xhXjMJiWZLo73AGT7nrDsTrN2ZPSWEwhD42XZjlpeZbfkD+TsMcEnBod4y9srrGt3qMmjjFEO2lSZ5ogXvQZ8NQrvunP2QNPNrqRC21zo3oFsx8Elx43SACUuVGSKmHyq9YJWj7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E54yCNp0; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E54yCNp0"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12db205ca0bso156501c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 14:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777584188; cv=none;
        d=google.com; s=arc-20240605;
        b=guExly/p1FQ2knIdnQhl3CVET4m2aj4lufX2qZuvJWhzyCb5iqUMhtn6KdBh6RPcDj
         wux+YQ+nDnc+UXpTGqOY/0bCS9fcUzh0MQOotdQ/hMPx96spyD8eSlo343scKbYxJxtZ
         QDnGRieplZM0mUmDK20VENsPC665SOdyd/PKJSNgAk4lDpPQrxwHcKdt6GNHO9UECIao
         NOGZxLiOPvIlgbsgF0WJ87Zk9wfTx1o3X6hNGaKRLlaGBKkz8NEr5ekG1+AtobNHbZNl
         1xlBkSzjNTZBIFhS44yJsBzQJPF+00BzDxXi7ta7oXT7+TfqFfPrf0PQAyjJix0bvPGe
         ZwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        fh=jxgXnKvMiJlr8xiT0TS8KZcaASbeqdamKnn7W39hvtM=;
        b=Hr4+a7qt1UWOBFzoW+kdkso0T8qbqYqZpGcQaLPB0lcxYrR2BNkdaVADgJkzhgn6k3
         vulq9+U8PwkLBtvq5pfFoO8eSKkZmH55mviDovQ5q8nTqRnuCQUSK6/n5cc6aMit9NLG
         f/wXjJ2p2e7dihtrsk+I6EB3PM2bfXktnznKTLoHOJOdEgO+M31beKNfgjq3fW1I7HYU
         TcX/Fo1kSS0rTvTnTTdlH/WBwLK06d6rMBxPZyKFAn40EL2mJjMYW6+dKTh+SWOJqHnd
         cdzlagNoW0QRU8JrQ/zBOmAp655cxAEiehaChUEiP+ZBaT6DJNkDzKVXCgKMF02pHJ1c
         uzww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777584188; x=1778188988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        b=E54yCNp0FG43nSKEpwde3bQTmZl/TTAtQZji6dbtMHoP19ZG6tOCoGU6An01Nb/X0b
         /uj1WufJRkFeawqWBtNPw8FwSY7jNFtte87EaN/byvdDgGuA7GU5AzQ+rqpwN//XM36I
         dJnXLcl+RqjnfO6q+++cJI1S9HdYGLUolLRw/gTNSWFkaKSg7KX72HNaK+o1/OyYdZ6v
         Y4tw7d/DzivwdfumkbTLLxdNtsBe/pI4Ff/lH6uobn9S81UZujUAj9K5TuLPwKund+ND
         2cKY8Z7vZblsho2GNeoY5vMaPGYoVhG8jPw8huTBa/BYe2KJkri14wlXjQoKX3OP38SE
         fUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584188; x=1778188988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        b=q07qUkddKI3dt9fWlTDj09lIlqN4lbOivTVVU1EqMiAIQ/ZB5fghVHHUYNH8Yye9IS
         hYQQ/sAgmM3vi79UdX+0sXWiVm+QiKnDDjOrXc/3fLLmaxptlmaBTxTFMRm4iH4TQ6UG
         QdOA5R/EmTNorDmGu+nDky4dGZ0yfA5EnBXtHfGXG1/9POrS+Z8/+I2iDdvbqb6YCLlD
         XL+YeBz+RBL1qVxdnTQW8AVUm0o0y2oYCuhLR1r3m9bx0okk6u0sMgV+J1QuWqoPiEsd
         +71klh+h3NXJhG/3Qy2DdNpPTeNvZ8BApZWJb4Ip2FdHOx4xGB/GSe8RgBBsaPvQfpqn
         PxAA==
X-Forwarded-Encrypted: i=1; AFNElJ+eCF3gH2Bvo+k3sATTyGS+LE3okTFVrcfvtnj4ZAs8RoHngWoPY6aBPKQV6YyRGxi28lSuTVK4FOjXetEu+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw626HI/j/t8DHWiM4WP8qij9IYuDWnMreHwcJQV49ExQ9W0Wuh
	4iFncit04zEpEJ82LN4BuBiMHlfEk1tTvTbhrsyxfHK5NVhfb6uBahUm8i5DKwHX9VTOyJSFaPC
	t8WTt4b32pIgZpWnHEyxTMsjPTdyoROk=
X-Gm-Gg: AeBDievhQ2xIOqAvHZBw/IpUyQ6bZj3Aoc1g48/Pi5yUk4PvXI7G8TH605wzOW35xP3
	/kizBNPmUFmDQNv6lfG5cJsjUe4gzm2MPtiw571T1MSHfH/QEwubmQ2s8tX9EM34DSrHWwGPJoJ
	eaAeOmmMU5kbBkp3U+/lkJkXyJPKa96t5GLbS5BuFEeT8DmZME83n2D3jihwkbp5t1B7q/rlogF
	xGjIaRrd1lE5rrsuYL/oZ7L8/B06NQ3Nrpc/5/9swM/ko0pS1bzSSA/+xwGvzOCF5U6g4/f09t1
	lOJpsSLTNlojcPU8P5POqUtEXp60xg54Y4JLCYcx/DzlXrFRw48+LaZlOha8v+98Lby1jhWuGt1
	lMcv+x6zVXzfgcvoN1d8M1brL6o5GdpV4bg==
X-Received: by 2002:a05:7301:5803:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2ed3ef6ebd6mr980570eec.8.1777584188058; Thu, 30 Apr 2026
 14:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426144201.227108-1-ojeda@kernel.org>
In-Reply-To: <20260426144201.227108-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Apr 2026 23:22:55 +0200
X-Gm-Features: AVHnY4IfHY-QpW189HGIBjOv408u-WVPLp2De5vzk3HKKlMEGMU_6EDA8ddRWI4
Message-ID: <CANiq72mSsW2PwOb++YyHM518s=2A7TEVugqL_ufZjGuiSsg4Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: allow `clippy::collapsible_match` globally
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 4:42=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `clippy::collapsible_match` lint [1] can make code harder to read
> in certain cases [2], e.g.
>
>       CLIPPY P rust/libmacros.so - due to command line change
>     warning: this `if` can be collapsed into the outer `match`
>       --> rust/pin-init/internal/src/helpers.rs:91:17
>        |
>     91 | /                 if nesting =3D=3D 1 {
>     92 | |                     impl_generics.push(tt.clone());
>     93 | |                     impl_generics.push(tt);
>     94 | |                     skip_until_comma =3D false;
>     95 | |                 }
>        | |_________________^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#collapsible_match
>        =3D note: `-W clippy::collapsible-match` implied by `-W clippy::al=
l`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::collap=
sible_match)]`
>     help: collapse nested if block
>        |
>     90 ~             TokenTree::Punct(p) if skip_until_comma && p.as_char=
() =3D=3D ','
>     91 ~                 && nesting =3D=3D 1 =3D> {
>     92 |                     impl_generics.push(tt.clone());
>     93 |                     impl_generics.push(tt);
>     94 |                     skip_until_comma =3D false;
>     95 ~                 }
>        |
>
> The lint does not have much upside -- when the suggestion may be a good
> one, it would still read fine when nested anyway. And it is the kind of
> lint that may easily bias people to just apply the suggestion instead
> of allowing it.
>
> Thus just let developers decide on their own.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#collapsib=
le_match [1]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nWYJna_hdFxjQCQZK6yJB=
rr1Mb86iKavivV0U0BgufeA@mail.gmail.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (both patches) to `rust-fixes` -- thanks!

    [ In addition, as Gary points out [3], the suggestion is also wrong [4]=
 and
      in the process of being fixed [5], possibly for Rust 1.97.0:

      Link: https://lore.kernel.org/rust-for-linux/DI3YV94TH9I3.1SOHW515524=
97@garyguo.net/
[3]
      Link: https://github.com/rust-lang/rust-clippy/issues/16875 [4]
      Link: https://github.com/rust-lang/rust-clippy/pull/16878 [5]

        - Miguel ]

Ideally, we would have an `Acked-by` on the second one from Binder
maintainers, but it is trivial.

Cheers,
Miguel
