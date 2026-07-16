Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C153859EC
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219596; cv=pass; b=TyB2jNX7WZVOodrs6D1JUDpVGF4uETZNRpznFkTGwPH71iS2UL4gDkO3JpZSyAl5bpa3tVm5KGXUKPYVmMdpmTu+mtAa7s0S0IwI+KBJ7E9tsFytLAtzSUReK7fUUHUkyPq3wIKxnPiCiBhycFfQUpWaTzTmhoT69GIIq3/3m1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219596; c=relaxed/simple;
	bh=tNGDQpr2wtelauRkyEV1WYWMk9U58mWKPY6Z5KYDsrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AH6fG10oDBuWmlszoxgoV9C9XPZzlTO73pK3DqHY/AgFuhBEUA2UhV7ZFzBAc6+Z+aUQJr2vUpN7OYVeAtI0I1/txUOK+BGildocCDBStsYwCsacz4FCqN/1LgmfGFmetSXwhI1u22/u+P8P0NIX01+5A/2ndkCLcGom19blfcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGJZKwc8; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGJZKwc8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad85b7b5aso9220705ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 09:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784219586; cv=none;
        d=google.com; s=arc-20260327;
        b=XBekz1c39a3frpsnIwzmNWaRKlAO0JeN+nE5GEl2NGJKZqjWhDErQC3mephhC0PIyf
         bVLrWQk0zwuipLucUA7TprW/8qZVI5GiFB8ES+sxopK6MQyQfPnA3ODJhJ7OpEN7YbwB
         2hPfIaqLrbgXqK/STahdvkSSvcoFZZwTPv5R7bHr6HsShaWn1zDjg5ktTz0fty+z2Myv
         aGP9+aE0zd9cbdI7tp1bHBYXh72Vyn6p5dhMs4W7y7yz6WC8KhAzOpT/PCFR2fEX7lH4
         vfBSNeOyO+9HsxfyNPR+Es+GRx/++jMlNtgtK/YHWP2mjfdLdbZUqZ4XukcmoMuyTmMf
         zUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        fh=pVSno0zPh41A7KpDAyqFTZJG1bmUCQI0kgV+0GiXq/4=;
        b=NNnN5+rAZDAwI+0VaX0tUAi4gKyLftCfQ70BSxcVfEg7pBb2OTx/yKJTBLk8gR+bRs
         dfjsezGhX2hdpxr2iH6Hef8aK30yFyov2iiOGbe9oVrC6CaOeg3rtmEoTXfvdDZkNwyd
         thhwz4lhsGCdP7zxme6vB/UeFjZLnA3Culi4HAjzao30TH0J6zy8vqUYNuzxCFak/ay6
         0WIYPpnnElAIMGCB7Z8fJubYCKT2rwBW0AzpCj2WUVpE+1nB/oB3KU66jriOFsAOkmZE
         3cpd8wfdEJaQu01rrPo6OInC7lGmZ71/KyxC9g3wWTQQULMSUhkFXQ3JtknN6fuK/YM2
         Kz6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219586; x=1784824386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        b=dGJZKwc8+Qh/R4dvnGAFK+yhTc330EbPYfh9yBTsbNRAtzo3GO3fg1In0C89Rasjph
         JwMHAgpyhOhQkyrgkqgjagYttBl9vNiL1t0MUS2AuoQ9krKgKQR3a/dkeLHmHc3hbyKI
         7cRsH5YJiVuSpF/duZL6Adw22LK1aL9rGoWaZOfPGsPZ2f030Q5TlIuMvftYt1MBxCJT
         ycFviZQH6Zku/v0P3746enkUHj6PU6y+bMhIxHU2rgfE1E/wyrqCIEfQc5pT46F3UPkb
         xsUV3EKSqZw3p7LYXIO13gDtbYGPg9ZV9sDDTKzz7qL9/U++ydfoNCdtMXjbyHkCNds2
         5eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219586; x=1784824386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        b=cqWAapqHmZF1HGmyemJVHxSuIzd7vqTknUimsh90sLguH0A6kdt8qF7FUVGWZT6V8L
         2//bib6r5MYJ0QibHA9K9UEm90aSH/mj9mhixbQ9HnwBuj9dNJfFpmE0p40vDTFcFUwE
         i1+of15hXTP/ZZTro1CKZy/Pt1dMjU0L6DOLY5jaJ4fPJDE2IfnI+AzAtDjHUpeE72yA
         Ni1vvhWAJZ7Pr5kNhsjqXEaVnCo50g7X2sTsGYUgzGrR3X9VidKS9gVO+SlWpnk2aR9Y
         7Yp6SCF9iyD4AVQ+erzP25+BWyxCTjhasIb+3ocnueWpFH0GLtM+WuNo76Wb+LnrrrfQ
         JU+w==
X-Forwarded-Encrypted: i=1; AHgh+RrLbIM9wDP4BxQicV8EoMzZPSDv3I4FmEqFECA5guYKeC43H/rexRWbEBdpVsXsr5u/Vzhtf3RPzW9aqV0XaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g/ODqphlZdYpKzw9U3EzELlkO3lWYhOI7hoiRdlkS7cwaHpr
	N0RKClmET5xOgwLWkjLzUPI2D+Hfn28q28P1TnORAqf5fvbI3wo4P2YNOH2ld83AB7+gt8/uJ44
	Fp3ygXwAKJtOOUuOb7zsap/JIB4sMlaA=
X-Gm-Gg: AfdE7clumuNyenA7qQdRnio5dFqYfYbhmL57LsCafRaxYuVvAqkQUr+j3JBnsb3Upd+
	bA+wNd3Qpu3wU86CFb3TmH62YdI0ZQQn3U+gFQ/hcunDgryAdRBx/+L7OzXSV6qcUaU65MU/hrJ
	jRQet4zE2QNEOcAQG9eep5s+qwC72ZkntMWibEYw3fD7lPfh3HV67DCFinnsTEtRM2zCOLI55K+
	/ENXfImGlF9jW5jv7pdUA5zOvKQNxTuQjvCYAC/Kh/z4o+3hsZZbp/yq8itK24TrRYyhTW8otbB
	RWHQXopOR/zM8EH3+S8XHIdgwBnwpTiwyUOQ2nbvBWYkUIIdj9sCZzFdUYn16f3jU//GOkDeCU9
	g+w==
X-Received: by 2002:a17:90b:4c02:b0:38e:bfe:81e6 with SMTP id
 98e67ed59e1d1-38e1a9d90f9mr7810297a91.1.1784219585950; Thu, 16 Jul 2026
 09:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
In-Reply-To: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 18:32:51 +0200
X-Gm-Features: AUfX_mxPokx3GaYpNkBp6-lei8Fb7lN_DjgdfGHoMR0h4GDo2j-4L4nqakTib6U
Message-ID: <CANiq72nhRy+LfZbEZt10artNGkpw7x8c9P3yMBrQiLEGv22ncQ@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> These macros are used like expressions, so they should must not emit a
> semicolon. This is being turned into a hard error in a future release of
> Rust.
>
> error: trailing semicolon in macro used in expression position
>   --> drivers/gpu/nova-core/firmware/fsp.rs:79:34
>    |
> 79 |                 .inspect_err(|_| dev_err!(dev, "FMC firmware missing=
 '{}' section\n", name))
>    |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
>    |
>    =3D warning: this was previously accepted by the compiler but is being=
 phased out; it will become a hard error in a future release!
>    =3D note: for more information, see issue #79813 <https://github.com/r=
ust-lang/rust/issues/79813>
>    =3D note: this error originates in the macro `dev_err` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)
>
> Cc: stable@vger.kernel.org
> Fixes: 5c7ca6fa603f ("rust: add `dev_*` print macros.")
> Link: https://github.com/rust-lang/rust/issues/79813
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ I was doubly surprised since upstream made it a deny-by-default lint
      a year ago for Rust 1.91.0, and yet we didn't see it; plus I hadn't
      seen this in my CI even yesterday.

      It turns out this just landed into today's nightly (nightly-2026-07-1=
6,
      using upstream commit d0babd8b6):

        Link: https://github.com/rust-lang/rust/pull/159222

      which says:

        "The `semicolon_in_expressions_from_macros` lint previously
         suppressed warnings about non-local macros. This masks
         a lint that will subsequently become a hard error."

      So that explains it. And this is the PR that will make it a hard erro=
r
      at some point in the future:

        Link: https://github.com/rust-lang/rust/pull/159218

      Thus starting with Rust 1.99.0 (expected 2026-10-01), we will be
      seeing the deny-by-default lint above, so clean it up already.

        - Miguel ]

    [ Fixed typo. ]

    Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
