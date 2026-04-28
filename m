Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC683FCB03
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383522; cv=pass; b=o58Q0Oxp+sdb+HbZAJfiDkRmRYX+ez77RAzKzNXsVudRXrLDnBnyshuoHpNAOKEUdwWy1ij9oz0RoTwLBvJAJP2cK1PNsluFKni7Ie/JJRLFkye0BeFppHuucLV2y4SvKsQlXAAyeXAglJV6b2KAVVeBnAr6OSV3vtUwNFTzCyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383522; c=relaxed/simple;
	bh=9QYxTznaCsgba/b4aFPLkCDVI5GHoI8MmnwYPVrR9YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrrLkZwEE0A/GCcWHeiKh8KdfGtOblq4aOY47uliXyVyOPIcOJv49DHw5qPNiy+BSawB14emKf6oetoLNvXaO/a1SYv80P5qYlND5A1lzNazIEBAX2Jwb3JQoqT+VJC5aNSzgmYafL73OEzYj/kNmTIr5j7c37cajlTVhqqzkyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiaSGMMC; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiaSGMMC"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69489b43d66so3398382eaf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 06:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777383520; cv=none;
        d=google.com; s=arc-20240605;
        b=duVPQUQBaEk8inbtodO33NqJd0nM4UK7o5SZJcAym+51EEm6zlQ8nBpZ34MZEqjQEv
         czJ8AhqxKpIXuzRuR3FqUWtlXeNGFiDIQNzNVr+yfBxPnY0/VVDnbzeOlAHJkrYImyMe
         f8KAKtUy7nesLexzQo32f1pia1E+vROcbhuHjFtFCHZidARdQR2DLtQVVCzStvb3mfG3
         +DSyTL4cyPSjUxT5/Wt96yWbDX/UpOReQDXbwKUsiGc1VKoUBdOhHcEJlGZ7lkowlEBA
         PiomPn7kpzyx0e/siFC8Jv+AcwQHecQZ5WXm8xcKXaGs1VP167x6NERvhXDEBpHWblTr
         vVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zZ8mVeCBb7rRjTfHf3eO62KMo1YZmCiqjn3LH62mO8=;
        fh=E/dsP6uFj85axwGRgMBMtonTpzoOXXEbj5yWt7Hf0sk=;
        b=ExTHex6Mc1IR1wKozUtzU8akRePysH+00kvX7GGchHUJIVYKV9MdjCRHl7enYLPrQ6
         uZ1ofetIVORj3+YG+/z4w/Bq4FQsrDe4r07gGOvYtT9DkjlTfg8JcIYx2NnCTAID7yBG
         dj4xZjOQ2XEKlmekugbZYNe4zbA+5QTOovFx8BdHdTSjT5wGP8R0z8gE7j8fYNGmdIPo
         vEckberrzWpvgy4qHTsF6Wu895Vyfe4h0eadlrr1k0BTfRgJX/dJ8pnHxQmLjPtEeD1u
         sV9hXPPNVPel4f7PUkPL8d+1NMqJDJq3QDZBgeUAUF7gphynGslCJRQBkVZBzH0s5mP6
         5eXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383520; x=1777988320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zZ8mVeCBb7rRjTfHf3eO62KMo1YZmCiqjn3LH62mO8=;
        b=NiaSGMMCXsxGdzEpl+/LjzhRZ860IDn21rKI3pp+hJ1XuN4kJmizcJp4MZsReSe2Ty
         Hv25cSTKQJGGs2t06PEPlKclp0gUq3bese5sDkP205AxKxiIy05Gua6i+EoxOoRsJWPa
         tWwVBD0xkbyRPP9Zed3lXmb2vu06AM5/OyNX0QOB5NMzYgCDo1Ai4CGHFoYvNVg9I3Sa
         mkfXU/it6XQmhnEXjndGki3yKdNlniZEzZK8sawf/wTFkYKZQDyv3W6t/gVVaxEJmy9O
         1Gy7BnPkjlc46m/fYsRLFEt/wcGbzxwhcUACmpW3sWM5ZoEmDAqEaCDRCKE8zoHTDcAt
         x8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383520; x=1777988320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zZ8mVeCBb7rRjTfHf3eO62KMo1YZmCiqjn3LH62mO8=;
        b=Yx2kgyN9MoxhZ+/piSJ1ZYVauW2bS6DsDfOELpNPKAPcosTlGnMwBz/nvUhbZMACPO
         USSfFX6bBTfJBq5N/+2Ne40aEts8E6olSsWW5UiGEdiLS2T00/RZhiTyIcMwiI7jGaIy
         VzI7F/3sUDlCwEsGQuV+4LEjCwRRJhXYy9eOZA4RV1YTbLp23+hpOYrcW9MttYEodLZp
         kxJw/QAM7j0LArtVmRBZ24K7bM0zCk6R2sL9aeF6DnxEuiBEpKI7h9JImu1PuGc295iH
         50liKQmG2VM1f3ZfKT6l2KV7/5DUz8YTb79TphVSax8zRG9nNJsh1P2dkqsCy9fboc1l
         6VKQ==
X-Forwarded-Encrypted: i=1; AFNElJ819Gor+FMNBuwBHnsfsf5oUGiEMfKImmXCj/Y90wGlCMAucQ2KSAqGN1qSGw1+sn+3QA0eUaYfiMsclQ7t+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw37ROUNvHsvctDWfYgOuUfDHt0CHz4vfrykKRZ2cJ3RYS9AxHb
	6o677msbhhJonAwZBkQMfz6eniSX2K0kbKrkZ5fTxHzPNqjC3ktLviuJg8ACIOi3yN2K3yrkZfM
	kAYy7TOaGhdPEj0P+B5q/iTf6vQR/IiM=
X-Gm-Gg: AeBDiesCNZ3zQ9cpYmPko9HnXpL6aTcFMuJlPsf8RqgbS9Ggg6kYRcUow8O68pj/Yp3
	LwmwI9Uwi9Qwp/3ezrTtwob3t4w+/tvow8JVo8cwDLJeZp0n+8Sio3QoukxIrnynkQf0JBZGRtW
	o18H7I2nGa16QcFPOzFL/oQ+WkUlMhpxv7PrLB6B0P3YUWozBAqHRaOim0g8brHYwrk9wCDK/wg
	pWqG/fEown+VLoNaRm1elnATK0CUycpu6Awt9uQnQ5YpGvu02VO9Tt8Uvp7AnV+leC3kIYH4QOE
	ADgNhTlUkzCQFp0r4VO59h/beDox
X-Received: by 2002:a05:6820:1849:b0:694:9175:9d47 with SMTP id
 006d021491bc7-6965ca7c05fmr1598669eaf.18.1777383520326; Tue, 28 Apr 2026
 06:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com> <177393252082.237.17419844885611963902.b4-review@b4>
 <CA+tqQ4KK=Ukma8-S47+Lr_YK94Pz76BRD5cfwxSxvYytFiy2qw@mail.gmail.com>
 <177713082412.98244.16931124285886474486.b4-reply@b4> <CA+tqQ4JrdxiwV4OLJa_Qq_dkqf6LjSdxZLyXFx42S_9cZVR6XQ@mail.gmail.com>
In-Reply-To: <CA+tqQ4JrdxiwV4OLJa_Qq_dkqf6LjSdxZLyXFx42S_9cZVR6XQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 28 Apr 2026 13:38:28 +0000
X-Gm-Features: AVHnY4JcVLxjiFNy1tzBTG39Hapvs0D5ur3IcCxvfFpGWjBBC4HZ4UdNDzV21YM
Message-ID: <CA+tqQ4+uRA7JnpvOY9xeTYLzShg5wcyLgDzBF2V+sZWO82zJ3Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 12:43=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> The conditional guard actually lives in the first patch:
>
> +        crate_attrs =3D (
> +            crate_attrs if ctx.use_crate_attrs and crate_attrs is not
> None else []
> +        )
>
> ... and I don't understand why I bundled this into the first patch.
>
> Apologies for the confusion, I'll move the logic related to
> `use_crate_attrs` to this patch (i.e., [PATCH v4 2/2] scripts:
> generate_rust_analyzer.py: fix IDE support for primitive types).

I think it'd be more natural to locate the conditional logic based on
`RaVersionCtx.manual_sysroot_crates` and `RaVersionCtx.use_crate_attrs`
in the same patch, since both need to be grouped together to properly
fix IDE support for primitive types.

I'll move the introduction of the entire `RaVersionCtx` to the second
patch.

Best regards,
Jesung
