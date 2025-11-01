Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351031FE451
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Nov 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762011388; cv=none; b=rQR63jYhIpC0+iHiz/A0KbFm48Rnvd3eITyh+ugB3eE71nXNw2575j/Mlx8VtXGIfjkiTEuY74Gyi+AoKAGelS5f52TFyRNsjA8EZ+8VS3xuiqlzn64r9TC9Nw1YvHkewMwpiXlXfBAnWwgAB/gHKUkxgVB8s7GWLbJKXxE7jyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762011388; c=relaxed/simple;
	bh=bdxPdHZEuhQ1dkWTiW1iF9wThJEn+irBUmR5Dc6YpDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvN7yrmz3cq2FDcmA0E/2Of0kWIO+gukxg3trr8WiHaVzJ7jOfbWwP/4GZDMBlO4udrxwATpHioqm5JlJhx7nQ3Siyc7Ff5XwYIBML71/3dAulqTDJxO1M8BVEe0n9ac/+ZPW9UqoBTcaFaunooIPwVviGCNXulKZDTWdQCD4O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTuw/mL8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTuw/mL8"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso464115a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Nov 2025 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762011386; x=1762616186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfjJn/f7oQqzZoFQTxcwXAUfHD/4AwfoEc5HZKyEpqA=;
        b=GTuw/mL8H4YRyM8i15Qcv3m8RrOMcwBNytiDg6uIpMqBoR46U72MHQ90reQbtYzOZS
         74gb0RLYzBS6C2miI3ntTvSyOe2016MoEsvDkERZP6ufAms3euZgTUQuxFxJRMQb15kW
         l5a0e8upgxHxF/ngGrLX2iA5d3BNj7tGtj7Ni5pkppyXIvIIhGM1Bi03O4r/sPcCPDPR
         bBLYZWsl+7nY4zaI9bU0ZsOzaBNh6lb0JEJYbZTAqmtHTMqjO33tenacj3eHAnCZ5f9y
         0Qq5PH1QvB/ZZUs8fDFC1jsuxc1C1KE+YqGarp+/ZjijdXazBW0MONUlgUJtxbRRAyVA
         E0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011386; x=1762616186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfjJn/f7oQqzZoFQTxcwXAUfHD/4AwfoEc5HZKyEpqA=;
        b=p5eCIZ6Bm+BrX02MwN7ac8eFM8y3pxCHO5KsamQN6fdENTNu/YqcjuMaROC6yVDw2n
         wAmAWOs2YMPWs556zjcghM5+u2m7DXFseKN+JpFt8LnaM8n/hHysqmud4SGaHOuP+bNk
         vaKAFIcroQNYm4qZk0ZNLJIJFrI59h9lWb6jPJyJdl8TI6dGjnLuRr9HMJuBJzKF+z0y
         Xq7nhzKNkxb2hR4jEppiZFY3yk5fFubF+MbcleDRyvf0cyLiSIfLKhcf9Z/xKjadUEup
         Nw4akt+L62GhF1q8fQyjw5gtkZPdGy7tABKgcjJgVxeMGfNuZmqyw+W2Z4MG6NxMtr5u
         A72g==
X-Forwarded-Encrypted: i=1; AJvYcCWYebFO3nRQgQzY8FsYs2l932J6yIi8QHGhOhj3QxWRQ5W9joCAnjUEXd2fA6cqfzOp4Wm0XpY1jMy9NE/icw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8A0pFoSqMwfTIqyoVwt1WnA3hIjYe3bCOq3Gc6S9CGjq6GP3
	m4wjRh01oMHxJ6dbJ42DEJfEmEEVAT1Ny+e7VtYmGBEydwJxwt5vr9Th9N3Nyw28LWfzZ1TN2hS
	cxUVqGzB6f729O67Xri4uFRESZCqjGFA=
X-Gm-Gg: ASbGnctNm1uIX0iX+PledRLDh55fDssLhIlK8fVNcCe8ODwy1BQjktvwCGaxM8qN82c
	XX2aATRSERSgXw72NHc7UH/fUYBT9zjzkGPJe5CoH5dAxrCaacHu5gHitnyu9TZQguctddW7LZh
	Hc2rsfBvLe0D16QVAdPrGZNU8y+L3YnOF0uJVyky6ELZbr3fdcfkk1wZQs6x4IW6HAJODmrdJ5N
	/mC9Kf4DsylSEzLInLAYi+CKaW4kY6altVkbsmH8Iw29r4FwvdkS4UpEqK6mEv8NkTUnRIEkfx5
	XGNiTppmNTe+KWtASOrLCS8tgXHQOUfb1UrfBnzrHa5X7EMqod5DsXZ3Q0NfRMEawp+IZ29depD
	nfUkwhl5lw475Jg==
X-Google-Smtp-Source: AGHT+IFPkL9moEs1IDaYMib+cnXVWvLGHDmNr26zj8ffw14If7Hx8/KbyBNWa9R59glcpNMaDzsQ03S+R0Vk6uJtUK8=
X-Received: by 2002:a17:902:dac9:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-2951a4d86bcmr59790335ad.7.1762011386406; Sat, 01 Nov 2025
 08:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
In-Reply-To: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:36:13 +0100
X-Gm-Features: AWmQ_bmv363FKeQLbteYinlQkLkfy3udKcWiF4asqch5Ak2oOTQbYYj6c7b_nbg
Message-ID: <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 2:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Hopefully it captures Miguel's suggestion [2] accurately, but please let
> me know if I missed something.

Yeah, this is what I meant and looks great -- thanks!

If you need to use it this cycle in another branch:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I will pick it up.

> +config RUSTC_HAS_SLICE_AS_FLATTENED

I guess you used this one since they renamed it and since we don't use
the `alloc` method. It is fine, both options are confusing in
different ways, but sometimes the feature name is the only one that
can be used (since it may enable several methods etc.), so I wonder if
we should try to use that consistently.

> +/// In Rust 1.80, the previously unstable `slice::flatten` family of met=
hods
> +/// have been stabilized and renamed from `flatten` to `as_flattened`.
> +///
> +/// This creates an issue for as long as the MSRV is < 1.80, as the same=
 functionality is provided
> +/// by different methods depending on the compiler version.
> +///
> +/// This extension trait solves this by abstracting `as_flatten` and cal=
ling the correct  method
> +/// depending on the Rust version.
> +///
> +/// This trait can be removed once the MSRV passes 1.80.

These paragraphs sound like implementations details -- I would
probably leave that to the commit message or normal comments instead
(we should notice we need to remove these thanks to the line in
`Kconfig` already).

Nit: two spaces above.

> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.

Nit: I don't know how one is supposed to pronounce these, but I guess
it is "a" in the first one, like the second one (the upstream docs
also do that).

By the way, it crossed my mind that we may want to use `#[doc(alias =3D
"...")` here to guide search, but I guess not many developers are
using local/older versions and this will go away soon anyway.

Cheers,
Miguel
