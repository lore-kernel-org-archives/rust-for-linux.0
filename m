Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADD1F5821
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707053; cv=pass; b=Inb0dRhh4L198CspV7O94d+Rkju2e9e6/20dyzDAhUUkUYdps2rIvEV1oVlgaG0uqUWOSTKK9kKPoFjHWUz00yEAh1dYU8yDJ7MlyyINcYGPepSw5ykRyPTJgpvVs6He/hkKrGDMaktw0fvS4gVpFqh8s3X9zJXas3zH2PCD93E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707053; c=relaxed/simple;
	bh=sv4gpeKJ3lKDcY5qcUsvj22vWRhw5lvoCjOYk/LvcPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFafXIXKR5plUxpofJxFseiD6qRSxlBVCIfIaCPsmHMnYIZ1jVxfUUvZKgUlbbL2fMqXVNuyrikinIUMe1b+7V+Ls0BI/w197LuEy1omad04f9kfZXN7oPbVUsWjXJIvbv7VohOPmf4cCn4yWu6R/rL2E5glv/5PCz3bGIzpNe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDZajHSm; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDZajHSm"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12734af2cdcso299339c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 12:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771707051; cv=none;
        d=google.com; s=arc-20240605;
        b=LmO77zhvp95PHCihCoYAKw4WgDYmQGvctgYUD8BFL+O3RotB5VKiyDSls4Z7Wri0oy
         I5v8dTBTOoZJfKx+7+ykQWze2arx5aJAZgznhDlK+kE677/paFwx90/Z+/aW0Neknfah
         SOM99UOtXrdA0i5uMWate8Qaw9Dd/lmsKbIOnJ2oNtSdtNCN4PFzIGOLe/VhLnvATrvr
         cPac8J0JEdXaBKjFa85mOhH0Q/JcTF7i3QXHpdyUGe6CjKdv40Y/oeWu7MwB9e1Kn995
         a/eivtEIyxFT+TSBrFjLyrMShKSTGAXK9pj4ck3wUo7nFe2YEoqDdcxycV4X3/ew69Uk
         bFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        fh=x831Ohm8U251tvw0G4iNZRxWQqJlT46csSQQT6AoZss=;
        b=XUbph21Ubz0GCSZTkEBUnE8ebXmmnbfP2LNY6WVHhusJQVlEocsc4A9xq+Y6u62Gl+
         xlSB5MfqKZDmukADs97pBuiIBZIgRfqCt9Vz4N8f4kidMOfQvcCuMz80i9HKmMdDcRA6
         WV/QaU3x9cfjXX0uEcO3qHKk+k7iE29oHXaMUOCJNNn+K+P9QbkFLClayJw2Gb10DU1r
         H6r7+2A3RhVq1Qk0/hW2vuKeJ1kghQgSRxTl1YCW/yX+U9uFr34NGFA/KHftocwVtl4T
         gWx3lJLP4jth8Xbwyf8FHa9aYWTNmzmyP18L/x2m0RM+7O3Bu6dD7/aTTKn90jCkJBJl
         C8uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771707051; x=1772311851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        b=eDZajHSmf83MGRluIKiaH45B5FQl04D3Zs8jlxYxiz/ZEnPefSA/0RcQ/eus56eakf
         c45xb8t37vR0MhE2UTdt2O4d9lwpLVxL+Sb0Cd4tJR8OlGwlV08iH1R1+F/tmxTyB5ZV
         Kr5pOWc1q62XbSXePgd2M3O4kF+gzr28ah604+HLkP12uZK5Zy7hOM0kDpW/lTX4Fje1
         yEXuoGsrC/FRULRF1PrHjmrYVO42lkPGWU9ygkapqp1cJXQzkPSLzrNcRusCaPjlbbvd
         s1y/AnWf3sRpwJfdErmqvcfWI4M7hDqBMDRm6poOYiJ3IVpLm7lkT8vlahEIJeDZ/wGE
         ri2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771707051; x=1772311851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        b=iC2RcxdU3YBklTJWT3g7qR8URzrTZr3LisF/+Av3CLLfal0P7ggCXnLNGaaMt8Zww8
         kM6IyGDWEx6dSuvuSM6ZsiL92cjNr01SmJdYrHDmGZ+T6yKkMO+qVD/aH/kAntnXGgSb
         zOVz7wW4IplIIHPqt2LnJAiHWGhymUR5c5c9AxqcboG+QFu+yk1WNohpDVPemvtbow8v
         ruqdRP0ASeWxU4xluywZFdmcopxuH+oL5SQxj1HQs4bl/aSFq53zCT3WHMONlih1raWH
         NVA2Pn1X9DIa0OsLr2WqeEHpM/FMDsN58RoOwoAvMnbGKqChPfCZKxSmMl4XNweG8xIq
         f1aA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3ubieAd6pKE+gIJSSqmXX9Bcx6r9gnNBbxK22Ha2P/4vwQdE92VGN7C/OmmYbmCpEEgaGsG6MtP5+VIq3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvihQH671NqO5bGdrKEAPQdwvEWjcbx5ocp+2gz36tWVvwU+sy
	jeIDeFrJMYGgOkUmKpREMd6oEepA9B1KjVuXwXV5Es0syv4/fihN86YAqY6Lkd8/+Tt7+QKQaJf
	2znfIc2UEOY1iXGOzDsKYX19POxaP2MA=
X-Gm-Gg: AZuq6aL7el1tki/mnKvZuZTlGIJbN8QzNHjWBTYKAhgJykTY6MkydKgQptBLQoVJ/0l
	sP4XZpzvxlzlkv2p+f7REACVyULLrCsqfKiGmmN5L6jCHh8GiN1oRx0zlCVAhtw2gayFimT2B4W
	MeogpqkvNk86WVWgmqImvkfyFIgvuIuFX5cXr1+3N4riZHJxIDnvGWJ5CWb9ELuPyXpoObOiGNQ
	/KQ+seBXDLyaFDN34yDknW/UCWFMfHpqRajm0vCmBPkixoBfDfNTOxtyhJU2XE/DXuARhEKB28g
	TImJvriQxw7JRydYB6NtpqEQWHBoNXUS/ioXbQXDnfrEPA2tBQyKYrV0MTYPFZ4QS2/uOweetiD
	fgONks/O85k2LoC8EjWjmJHHn
X-Received: by 2002:a05:693c:25c7:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2bd7b9ed182mr1020616eec.1.1771707050982; Sat, 21 Feb 2026
 12:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com> <20260221020952.412352-22-jhubbard@nvidia.com>
In-Reply-To: <20260221020952.412352-22-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Feb 2026 21:50:38 +0100
X-Gm-Features: AaiRm5172XvDnU3UePKgPHx_CxnJsXnvjVHL2rwEQ4swbyAbhJulY3nsCIuvnT4
Message-ID: <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 3:11=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@=
kernel.org/

Link: https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@=
kernel.org/
[1]

> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {

Ah, I thought you wanted to put this in `drivers/gpu/nova-core/num.rs`
like in the previous version.

If it is here instead, then you shouldn't need the
`rust_allowed_features` change anymore, because we already enable
`inline_const` in the `kernel` crate.

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build

Having said that, if you do end up needing it elsewhere, then please
add the other line added by Gary's patch, i.e.:

  +#   - Stable since Rust 1.79.0: `feature(inline_const)`.

Thanks!

Cheers,
Miguel
