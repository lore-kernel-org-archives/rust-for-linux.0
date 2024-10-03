Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF11B969
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956139; cv=none; b=GS4w5jw70l7YuiNbiGvfI+QQ3Nv4/eNFrTqrmUWLW8ENpNlNKOUxl5wp5HaTTkaKrjtjlE0MlT33F8St3sKLVp/Fywl9w50Nne/fJ8gROqxWH0RMHqhe6eB+eI/MQjiY2bw0yJx4yb4TUanOQMtsgz2uZIe8sanAaGScDoawVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956139; c=relaxed/simple;
	bh=LcbZHZklkPhzbB0UP13arDXOpJ+P8Qxs5+3maTRtpv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcUv2JyNJsE/c5oVeLpIxOTy5Vt57ZCMUXFRkyP9aeiiouxNZdT7pX/rp2e3OK1Jm6kAauH46ZpNHIYDEmQ7jiqTAJQw5kUEYd6cOYcPv1vVA36jaNgCfwpUOc6MGkUr+YjgC0Uki01QoxvTf8zhPE91AuOrgorlqFgKYWT1Dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bacMWzKz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bacMWzKz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71c6ea6d276so27294b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Oct 2024 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727956137; x=1728560937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlrWh4YCnbOsdt+CWMIWB5p+FT9VcC9mWfJFoR16WfQ=;
        b=bacMWzKzIAQV5mG3d0oiVbjg0AFzIDj+4EUPrt9p8LVcdFHaJn2LI2SgL6ZgFyDano
         QabWoG7HSWsPqjglpFbmJDCTxXuk4ThPcnPg01HLg7O9217iXnUaeDB6oqN94yRAs0/i
         /PW5JMQndHdutRrQ8hwpOm6yuesnhMH26RdpbX7trrl+WqbYUqDzzS89ibfrMPBF78Jn
         70WhA911xUksWVy9PHx++gigAcNYQHnkp0CrAkFOtAbvX2CGBmcThKjWO8wtnRko0hDM
         X5YV293BsTxa6GEDX+zvvX+zV5zz6LD4ERbr7hfZ+fv8oHChyUmJRTfz3P682rmYNSZf
         TITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727956137; x=1728560937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlrWh4YCnbOsdt+CWMIWB5p+FT9VcC9mWfJFoR16WfQ=;
        b=ENCuEdng5ELfjhHfViz/8LuGYVrefxFPMTo6Qck4kOrq8Vjg3QOy17VZjDZZ6fsLzi
         BZdUq+AOavgOahKDtsnIZK3KaOJwcQDgDaI6CNkilP4AsYRTWDyKNkEHtyauRruwpszo
         HljKW2L+cTFOEGxqtW8IX4mu6S9dTYfxqfHKKadjTrOT6SZrxv2D+yfm+GHlelv6wWM3
         mAJDs3xrqY1e119IVXvjrPWUoJWG1u6jIVmpSht3ysOkvSYiEjPTozbKzsqzOvpwOZQL
         bRIH+VSv9yEObbOeNArX03lV/2lN2axZmBhJYsN0yI58/bP8fHKkYfDUQ1NZX4pqKhZK
         dT+g==
X-Forwarded-Encrypted: i=1; AJvYcCVLj13/gtggXbs6vL3WJRNpW+e6QDGVj3C3atMwt6FSGkiSEn4u7PXI5ORLitLK/bWG1QuVJGHKdDwh4Dst5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/PtIWMsy6Vimqu/y9bgwmzVpHlHFWvFRnBkGkMuiYwkxX5mZr
	TI6Z6pgJG3PMz+4lj2YZBbknBfFMorD8hyADsImIOS0rua/Il7cXSbVrIW/vIqOifaYF+UMZorQ
	omqV2isJeibA7KPIxMJ7ET1Mlan0=
X-Google-Smtp-Source: AGHT+IE99QOUTE7jfHGwS+irtlhPNqyWc/0ygsoFtyFhkA1Hxd9tf3c6ac0GYE4MMu0Zixwb+luxQrnlEgLnB1VXoVE=
X-Received: by 2002:aa7:88cd:0:b0:718:e49f:4185 with SMTP id
 d2e1a72fcca58-71dc5d75ed9mr4106287b3a.7.1727956137233; Thu, 03 Oct 2024
 04:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Oct 2024 13:48:44 +0200
Message-ID: <CANiq72=nbaKsUWC-C=jL8nfEDk8m7F17ni+QJuGaUo+MQkWV=Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	"gary@garyguo.net" <gary@garyguo.net>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:33=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> @@ -20,7 +21,10 @@ macro_rules! declare_err {
>              $(
>              #[doc =3D $doc]
>              )*
> -            pub const $err: super::Error =3D super::Error(-(crate::bindi=
ngs::$err as i32));
> +            // SAFETY: `err` is checked to be non-zero.
> +            pub const $err: super::Error =3D unsafe {
> +                super::Error(core::num::NonZeroI32::new_unchecked(-(crat=
e::bindings::$err as i32)))
> +            };

Where is it checked? `$err` could be (in theory) zero, no? i.e. is
this macro unsafe now? Perhaps you mean we are guaranteed get a const
evaluation error? If so, we should explain that more clearly. If not,
then we need to make the macro unsafe.

> @@ -107,7 +111,8 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {
>
>          // INVARIANT: The check above ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: `errno` is checked to be non-zero.

Similarly like above, in general, when we say something like "is
checked", it is good to mention the answer to "where?", even if it is
as simple/obvious as e.g. "above".

More generally, `// SAFETY` comments should do their best to explain
why something is true (or the way to double-check it is true), not
just state that it is true.

Thanks!

Cheers,
Miguel
