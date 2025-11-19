Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063F9475
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 00:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763510804; cv=none; b=sCd+KOTptDNuuxac2Fg2DhtDLuedoqg7rp2dQQF/6Ld5eKmhy1BUMa9a6/0W8tTFTrhXNYyiP3LZ2aM51PP1WlVH2JbmYuGqF9rltax59OwiaNpEW+/yjH6pkmqRofRMYMgqFLqqSfG6W6LJjylq23j7PPCrV7VfzmirH2WJGFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763510804; c=relaxed/simple;
	bh=2n4S4NW0Wxg1n9y+xNk62jYhloEyE55WoEZDptB1i6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlW19yPFdCIOwQPgdz0GY0E+DKvQnRNG7IG7jRD7HQrGheuJBLybLEyWVGdKnDZO4OrxNS+XCd5JLDJM7+7pJc25uhHWVXQXMqi3Gy/+Zbl7HCZNP74hPvW4FNO+bpl+29i0ChebFok13HmZANkXyCj5ZzsApTP7dVr6UNHsTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7QGcR9S; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7QGcR9S"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297e2736308so5977765ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 16:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763510800; x=1764115600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HteR0LJ56sz/nK1VXZQ1r/p69g+KmmX5KPjAYoOcxaI=;
        b=e7QGcR9Sq76ULpn0SoEf/LF/RfXjt0SUHK0fLbFI7rZAN1FVUFASfhAEMyGYQNCRU5
         E1j8py4YK3RWQFeaf0iMYn5FNotCXS+rkCIqv60Hnm/D1m0oSY56Bor+kjNlAYDwHHX/
         tQxKnbra85n7vy2nk4wf52E7QAAmPAZ767j5Kt3jfezXgso6HRmk2Kyg8jtFfYqaMAJE
         nTbdjcOYnshBx7Q3waLL28WwXreOAS4dXl2XVGy8QoAZd+SvqAWYZzhPJrPLj1HhGYvp
         PVp8b9rzmKrOqRhQuYKeCaqazPnV9eZBOnCaYH5LAcZURqsub3QZ+Kr1bTu0qm1DkOAZ
         F8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763510800; x=1764115600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HteR0LJ56sz/nK1VXZQ1r/p69g+KmmX5KPjAYoOcxaI=;
        b=xB3l8oy/ZBLF8ltfAwvu3VjLW9yk/jD1kfIMV3FGyF6ev5nyF5XcP4YyKjv8wZx7Oy
         xftcSlZneEa6uuYp12NuX4xTCf4IIifaKP1KLM5PJJXfdHfMfOsyXEX2xivv076uJ5BS
         vP5qJd4rqOdzPwlYjj4kOicu3/eQLtm0CflsTG2EDTI2CL1fBgmKC7iyNG/+dn7Ey5FQ
         OGMMyb2/X3sgWpejPCT8CUT/IBuzI59wnRr1csI6ZJ+fTJrHgvr0MFjMOlJFZdU1ikus
         pw1R3/FOrTkVPc7mBOUeaIeOafZTKsSelycKLQE/+w+v7eYmdqk8HfYU0DsE9fK5x2Jd
         +Hug==
X-Forwarded-Encrypted: i=1; AJvYcCXLEY56hJs6piIgJv8WVIifNQMwkubbjgtShFRi3lq9zE48lm2LmHe+U95T/db+9oAmzK5QO00b2xb4nwXmWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyd3DHM2IDpqmtQM0VZcveZ8jm1qJrhuSa3uq4w4bRqYdX/dqX
	XsmpeQD6yqimWvIR4YdGQfzaHpiVljrmy5OjdqcWCg1+NZb3VdneDY/puDufo/yHNEgBIE7hNG6
	aaRA35zerPiUbst9FkS3uR1jMeOfIt2w=
X-Gm-Gg: ASbGncvSytvodFhgZ5LA6OxbOmCjS6aSQ6CJ1p55ZWwp1jtPdG0tqUg8bAuXDyQpBkl
	0/N5AQ2VMAtmdU4FxWFi5GQO4iazjVav/SO+BDH7YtRcqYseWgdasS+UPy1JTrVHMZp1MkADnG4
	higRHYcm+hOU/CrNzN9XRMUdcWmqHpkrZ40MYKjpKtn4LJ/rDROHTLRUmKP99c8Z/3txbKTnhVk
	mYqzsfeWZPwo60ERvPRGFTZ5QC92PKJ6AvWY8sa1PjIWRb5LsQ/EI5ykqXlqEZTM9NwuhHhpPB4
	H+YMx0qHc8p2ueAxMlJPrNY7gII4W7jNLJYOwJ5tCQLomRW319T6WUS3e8OsG2ogl06ogAHH3YF
	e800x5Lk2MWxsZw==
X-Google-Smtp-Source: AGHT+IG7yRnCnGcEbFwphKpmLnQQldYHNSG1gV/rq3IjVPCGNMDfseC8Zi8l9veiYGI/XsJkwdx2sleSiEMXxETyHKQ=
X-Received: by 2002:a05:7300:d0a7:b0:2a4:3593:5fc7 with SMTP id
 5a478bee46e88-2a4ab8a954cmr6052875eec.1.1763510800330; Tue, 18 Nov 2025
 16:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
In-Reply-To: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Nov 2025 01:06:28 +0100
X-Gm-Features: AWmQ_bnh4bwo6dnThGfprh2defJ-7xO1bNHI4uC0L49cZrGwZpXqqqcRW8uyZpM
Message-ID: <CANiq72nV1zwoCCcHuizdfqWF=e8hvd6RO1CBXTEt73eqe4ayaA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] rust: add Bounded integer type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Minor revision adding the feedback received on v3.
>
> Patch 3 adds a MAINTAINERS entry in case the Rust core team would like
> us to maintain this, but please ignore it if you prefer to take it under
> the core umbrella.
>
> This series provides `Bounded`, a wrapper type for primitive integers
> that guarantees that only a given number of bits are used to represent
> values. This is particularly useful when working with bitfields, as the
> guarantee that a given value fits within the number of assigned bits can
> be enforced by the type system, saving cumbersome runtime checks, or
> (worse) stripping data when bits are silently dropped.
>
> For a basic usage, please see the rustdoc of the `Bounded` type on the
> second patch.
>
> The first use of this will be to represent bitfields in Nova register
> types to guarantee that no data is ever stripped when manipulating them.
> This should eventually allow the `bitfield` and `register` macros to
> move out of Nova and into the kernel crate.
>
> The last patch is just here to illustrate the use of this module; it is
> not intended to be merged this cycle as it would likely result in big
> merge conflicts with the drm tree.
>
> This series applies on top of drm-rust-next for the needs of the last
> patch, but the first 2 patches should apply cleanly on rust-next. A
> branch with this series and its dependencies is available here:
>
> https://github.com/Gnurou/linux/tree/b4/bounded_ints
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added intra-doc link. Fixed a few other nits. - Miguel ]

Cheers,
Miguel
