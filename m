Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07596399015
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288471; cv=pass; b=mIeJqho0k5DpUoArkSeqlp7t7acQRpBnnkQ0ZzXsjxD9lDiwrEWgBiyIJPU168cugv+k/HlmUhgC36KaBtQcMohYRaVhXIWyOsWukjA2+5//+503VBrLAkLKgHuF+dvo/IQDTTmd2WHUrEMjNz+QcRJVoo0fjokiWylIophgRwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288471; c=relaxed/simple;
	bh=IcUsahE6+wkuyB/tzKHvzx5Sz0L+qqdflPC8gPGmKfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elkv+tKt14xd6yRddfRKRExkXAYyY8gitNs2Z+Nz/ElMSe1i9WFbA5+l1yg03TTSRfQ9M3lJV2zil6V9Spm2/HiF3rtFFKnj7nNVLMpRnqqxl/SRjEgbVVMex98/nQbvVTz7hXV2tRJGtuwP/jHOxSLiKWiec4bnZtHlWuNpd6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwnz23dO; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwnz23dO"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso4774279a34.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 04:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777288469; cv=none;
        d=google.com; s=arc-20240605;
        b=JRY61EQweslsTabN5k0YMhBvbRwgkpayqdUYOS7rlwJJKtdf10ds+yTIlgqSTYb/L3
         A2Cq+8WVxs/bvHQXwvuVQ36DE+YdLyVPnVydrQY88KeMvvdYnpG7HQclrXAbPO0Mi9De
         pC4C4k/KK6qa7DEBUz51uiUpxG3m+lhfPIY/1nNGpXyauFSh0WnMtJMpvFG9GPPVsdPG
         Kby/cojy/hpWgbF9bdAzSXSmP5HNJXTYpKFVuiiltepOT+PZjF2kUu6dYGSaQU5Z8fzC
         oAX7mr2O3BuxNpxQyFvJFslwjg8+//jbGnlHeGt8UNkzP5YVRTN31uuQhvYcrKIrW1jz
         8NwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5igXzLonoLLDKCzupFNPKDRb0Hn9CZkOJd+PX1TeruE=;
        fh=8lHtXTfZNIEi2xS0hUgoHfy0UCTtojnRc3mjOejF/ek=;
        b=dw8xQZgvkJR4bEV0a0+g22yaM+5YGuW08nqySVBXTw8LfLlION/mW/EyKbEpsW+owu
         Au3Los1t5sAfZ/bhYiczW6rt8VzhNeiOo2aGLVC1Nnr3SapYM483z6+DmuYkh+nNxeVy
         FnLfvzAGwz53ieJiCgyHtPiDtrLE2Nal1Qaay0E6Z9CIKvTZQuHB4l8GWVPef/SCDSNb
         Ss2ocF5fj4LhaluXDbV/9Y5KIdsI7yJZp3FINfe314uoBaSCFEHwcjgVa6cfxrmt5yZt
         MfvGHORFh3NulPK4tzhemm7wn78hUHNm/GfJlAauTVDZQtgJaNyIxU6cGFbu0TZuHMtP
         wv2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777288469; x=1777893269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5igXzLonoLLDKCzupFNPKDRb0Hn9CZkOJd+PX1TeruE=;
        b=qwnz23dOc9HuFYabkKa2VQWryzvvp0XRXDaIBcOhs4A+7pNUZt3RyR+lq/VwVZKf20
         2QAqMqT3Ki7NkPE97kdyaZde4SrOXFY3LSlVovXFr7LM6Igu0fGAZndBa2ckB4E9phBS
         m/V1gjGxAXuxH0DlT/yQJzKYYXGM7DjhoJYBQrAiLUfLt725HGACaYzvN/8mJtlFZKby
         p8YbwMLCuVxyogzGvdgRUJR9aPoXg7uIQRKVmyCSbCZs6ztONE9pWVzSh0U8qGzr3NSi
         aR4BgPnhYIv9QOsaw9u7mFgsoIJAyEA8z4Ud0ERzbuZtCGamDh5YKpsuSn4KeFkixoQ7
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777288469; x=1777893269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5igXzLonoLLDKCzupFNPKDRb0Hn9CZkOJd+PX1TeruE=;
        b=Y6KYFy0Gn16lx4/oGe/bLtob23hXINDuTPOe0LtmgSb1mjTKmvOusYdmsQzYlBTFZW
         QDjwfSUqcgMsnV2pwwXk3edAyMkQq5A9OI9HMX24vLj/LNxcR6qxIDZurKOCBVa5M/GO
         x+oOfrf4cMt1vASwEmXxEukFbn30FYFjDMRaj1iq7+fHUJqctsbLg1eW27CGkEI3HoGg
         7ldEyVZ5YyAoUekxU3AMNIhjO0LsSYTOAcz8ArILe7bSH7Lk/l4qArlTol0DX7c9ewVx
         VfifIHppOVhgqYlN6fX8ElvqIFMxcxUbFlZT4CQnFMrMksipB7UasANUO6AxRgR8Nu6M
         UCZg==
X-Forwarded-Encrypted: i=1; AFNElJ+TIANL3E88yX+r9TO+yTQ0n0EvRRxaaYuhJrtB2x1STmy7JcdpwvVuklCAODacTU2u0DQayZ+d9Lpo4NBh7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Dg8TZyAU3VkueSi/QqNflu2U/KCaWW7WYZ1b8CiM21F2Lt2Q
	0hHOhWp2fQQ2ttWQRWXr8/gNJpE4j5DQpU8TvOpFqbvvIt9S2RF+FxnFW0hAHPSKGiN4c0wZ3XE
	No6DyduvQDyxYEMsjwRm2nhSTUKELQIs=
X-Gm-Gg: AeBDieua7rng6v52RrK/aXLIky0dcvUSa02HQMPatWgmxiuvKwqxIYIkOvr3zuxbjdY
	ab5twIU9NNtYvcw6QKvNBjp8e50Lfjk+Kfe1fRoylvgvBXJxnsJxbDgqU96rVS9Ejdm5XvIMllh
	aYVQpOAKhrcRoFdNxB9TtFi77yRpAAI6v7vwcdWC/r5xqFhKOKZcJeQGl48hqHzIYyBKSUvpuw4
	/etjd2z9mya32QPJhXO8++p7qNR80hxCZfkFrdMVp4bUmE7ZvRqTweh9Y0nUz1oUkt4CznLoxg+
	r92SgFqFZeCNztpWnQ==
X-Received: by 2002:a4a:ef05:0:b0:694:6817:fdee with SMTP id
 006d021491bc7-69468183685mr14208184eaf.19.1777288468822; Mon, 27 Apr 2026
 04:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
 <177712995819.98244.11409833540971152770.b4-reply@b4> <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
 <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 27 Apr 2026 11:14:17 +0000
X-Gm-Features: AVHnY4KHIXOpCRjqibjgfgCN7oqdFZhcb0RegICe1dPVtWX2LnWTHzmUPN2fZvM
Message-ID: <CA+tqQ4KzOUS49vn3SkKjA89=VaDECsLz+Q_XBs0PguK82zr5Vw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 1:50=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
> On Sun, Apr 26, 2026 at 8:42=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
> >
> > The idea was to augment all `append_*` functions with a decorator that
> > contains the `sysroot_deps` logic so that we don't have to call
> > `sysroot_deps` multiple times at the call site. Something like the
> > following (not tested, just for demonstration):
> >
> > -------------------------------------------------
> > def filter_deps(f):
> >     def wrapper(*args, **kwargs):
> >         args =3D list(args)
> >         args[2] =3D [dep for dep in args[2] if dep in not None]
> >         return f(*args, **kwargs)
> >     return wrapper
> >
> > @filter_deps
> > def append_proc_macro_crate(
> >     display_name: str,
> >     root_module: pathlib.Path,
> >     deps: List[Dependency],
> >     *,
> >     ...,
> > ) -> Dependency:
> >     # ...
> >
> > @filter_deps
> > def append_crate(
> >     display_name: str,
> >     root_module: pathlib.Path,
> >     deps: List[Dependency],
> >     *,
> >     ...,
> > ) -> Dependency:
> >     # ...
> > -------------------------------------------------
> >
> > Since this only touches the function definitions, we have fewer
> > things to clean up.
> >
> > Note that this isn't a clean solution: we'd need to keep mypy happy,
> > `deps` isn't always the third parameter, and there's a discrepancy
> > between the written signature and the wrapped behavior (the latter
> > effectively changes the type of `deps` from `List[Dependency]` to
> > `List[Optional[Dependency]]`).
>
> Right, and also the way you've written the decorator won't appease
> mypy; you'll need type annotations. If the goal is to change the type
> of `deps` to a list of optionals, a decorator is a nice way to do that
> without polluting the git history.
>
> I believe the proper way to annotate this kind of decorator is using
> ParamSpec (https://docs.python.org/3/library/typing.html#typing.ParamSpec=
)
> which might not be supported in Python 3.9. That might be OK though -
> our minimum Python for type checking need not equal our minimum Python
> at runtime.

I've experimented with `ParamSpec`, but it seems we can't use it in 3.9.
If I understand correctly, neither `from typing import ParamSpec` nor
the `def func[**P]` syntax is available in Python 3.9, and both cause
runtime crashes. Could you elaborate on what you have in mind?

Best regards,
Jesung
