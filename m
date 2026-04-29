Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7B19D093
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473537; cv=pass; b=ZSbT047yMKSy7E8du1EyCwse/S2YTThfVD7Ag0RNIX+jox3+evHta9owRu/kXGIbbD8C1y+QqAqF5Lp7kySKL2X0SLNfMBeqRgkG4noDj76M00tLF9dFB2PV8bCl3sM/9wGvxbclvOjuEWImt6AV24j70dqm2yR7ljJgak+U+po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473537; c=relaxed/simple;
	bh=ekLOZBzYJkGAaf4kOm1EfNzSWBr1ZTT6hjPRXI5yUz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CaImtl/MR/lHPOYBFx0eFwLyZ9JyrombX3LRpCxZ6mNiGLIbfBtPXwhCR5ShngnnVN1wgZjr4q6APZqmrLkIZpmfXF4dXogmHWVNrR9qXVUn+qkKmaRTwkxTrN3aRF9hZAGGOGuXWq5sHzYjUqQ8/B8wcGgPzti/AfAA0fc0abY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STEKe5SY; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STEKe5SY"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6966d16b978so268953eaf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 07:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777473535; cv=none;
        d=google.com; s=arc-20240605;
        b=RQZipDMlfXgUCscWUK4FNkGHWJeRu23hu6lKkkf90grwu0j4dgKznH6zeipJkMe+28
         bqdiDH27D791panHeQiNhOxj7AuGsP0FTweA3LOTI8qnr9AFixYIeCOoWQn9DtMfSOeL
         3lZJUqNBaXw3ZxwnE6hsUpLdOj8qtsJIwH9uP/2iuKAI6uBbFEioYFZp6ac9U9G47CdB
         voRNiz9mOizg2+zRHiiUMQoHvMPR0dcIONd+KeWulLUeuXoM4W9tZlkiH4lOHuNIFy0K
         ajB+4BU0cpRMyalV7LqoAj9FL+y6km20ldmVmQBEWTu9VEz5wvHQxyYUKJCahewDJ6uh
         qlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ESioWuuDXYFS9tz9bPpxRZt3ykzorhCeXmkN12W/8t4=;
        fh=i187yy91eKE4QUEK1wTt497lQw9rvIfHBgWY/YwkVkg=;
        b=lFjKLCSDX2it3JA0I5KiElcVgCVrKnVTTHrEigtxuysKqAyXw8is/YbT6ORmWcN5eZ
         bCJNksinktYAWbRKnC6RmnARAhfYYSep8CW8zp+Lo+EEtKdEDtLN064gpUfsEqkiYNZx
         YarFVNZJCfTJSVzgzpJ6kzOiCOE+LziMn90ZSuK186w6LIch51ERmZ8/CdrMM0/Io4UR
         7Tan669UkdmSUc9dxXGlKnZLlPAOULEC8zdfBpWnKVSqGwLUTfy5J7c7Y1EN0vO72KuT
         rrLNrgdPYghf1K/1TtX+9NzRMTuFr5tckE9MqZRpBeKHGor4HGB3rybNzAnYNtxgkboi
         Vwgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777473535; x=1778078335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESioWuuDXYFS9tz9bPpxRZt3ykzorhCeXmkN12W/8t4=;
        b=STEKe5SYTrFK6bqclXiBIZLuXOYtqDx9ooYmW/GU3RK9iG1KAIjRWgN1GTJdp2l0sQ
         Y6jm/NV7u4YSL/SJ6tGNTQwRKKkEvIfFpfqtvEUK0KxyKcnrTQ5zGlxOYaswYMlPbT/g
         QQWH5eWQVQ6NtHJgTV9N1v9tZSp8qCMqZufkvEgwaxkItvnbF/kkAxoYjEYK/W06OdGc
         EXUMdJN444TpVjd+hOEp7ahc1rTfskac1jjijMQD+7mMXhoCsQosUFqLftOnTKoIicpm
         tQVXFR0tMpv6qcf19FUE6cxPoH2wd5GT13liFDfpVW/x+wkND62TygSFb1peXlf8VQzn
         xtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473535; x=1778078335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESioWuuDXYFS9tz9bPpxRZt3ykzorhCeXmkN12W/8t4=;
        b=hD7byqxlOrSV7/oTV+Qzqzfa9kZwgELFRXurJi4N02CewWm2eUJnTUvciNedz45EUp
         Tdrd4xroApugSAk/Xut7gvVVqhX2b20POg7JcXJ37Jdvly03jbtlqIZr/nYaFkwXKSjB
         D1cntkBKDneBeikfXXYVEdKFizjQhsOXCE5YbMaGrFgPpKrSzKBnldkpUqpKbzG/qMBI
         CLuLq84MF7UdPaHf8AcCWOxHTwfcHTcy1ufd4Os9K8tFNqNKj6ZsspriHAQdbhT/XloC
         4zs63b/eJqIf8VGctHOH9T9n6lUb40feBf4nxmHXRd+daJcCL2AInnfHr7YfZF9gug6/
         MvcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Nbm7BWOvOwYT1NkluWMrCuogDwiqpjON/fuixKhVhEp7IdR3eEc6e0e4lJnNe6x6iillFKsASacLuovdC8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJftfBihB5jFWS3gVxA0eZP7L92D7nXoJcoLxRiu0q/oE7jyOr
	4vxtiI+tksQWMjhxzxk1wV72ep/RfO5krmwutMDS4XxfN7dOGMSk7ZQbbMCcUe48vUoGK07nNLT
	iYoJyZGAUg7CGXTcd4XPR0yCREKKcyXo=
X-Gm-Gg: AeBDieuA/AVJsvDQm6lMf4BzTEi6YPMS+Wduw6TSekvM600od6biWAwfyGxPX9+J8GZ
	WHP/9598HRj9m4sRU913lQmmMnF6Kct2NgQFfo0hnmxZqznAZ1W73/n4YzEBwdnYvyzSa6K4qVa
	iea5/osuKgFWShTho92blYSA7ZtIbpuHEN5+d1Ef56dJACMUO2NHL529MP1cVxZOA8FpYKRkuTq
	3d+DdrDXs1jgq+CLZpKb9c87rHxbyvPkC7iOROQj365ujFkKBmi4di35/5XrxMaQJiQ2lRg2lqx
	8ByVsCMS1Kbo0holLw==
X-Received: by 2002:a05:6820:99c:b0:686:48b7:d822 with SMTP id
 006d021491bc7-6965cb5324amr3822778eaf.39.1777473535383; Wed, 29 Apr 2026
 07:38:55 -0700 (PDT)
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
 <CA+tqQ4KzOUS49vn3SkKjA89=VaDECsLz+Q_XBs0PguK82zr5Vw@mail.gmail.com>
 <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com> <CA+tqQ4+GFw83fFz-ykqLqae-ao-3oU0G-mxm2wD+xB7bHQ2Y6A@mail.gmail.com>
In-Reply-To: <CA+tqQ4+GFw83fFz-ykqLqae-ao-3oU0G-mxm2wD+xB7bHQ2Y6A@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Wed, 29 Apr 2026 23:38:43 +0900
X-Gm-Features: AVHnY4Ju2wmwD74eUnAXXlYGL27dOYrxFpxoTYqStQX5MTYEGItsrKPU0g-6ImE
Message-ID: <CA+tqQ4+z7jxNjPnAPXSK_sO8CfC9cDG6LexTK9YLF3DqnF8j6w@mail.gmail.com>
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

On Tue, Apr 28, 2026 at 10:35=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> On Mon, Apr 27, 2026 at 2:23=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
[...]
> >
> > ```
> > T =3D t.TypeVar('T')
> > if sys.version_info < (3, 10):
> >     def wrapper(func: t.Callable[..., T]) -> t.Callable[..., T]:
> >         def wrapper(*args: t.Any, **kwargs: t.Any) -> T:
> >             return func(*args, **kwargs)
> >         return wrapper
> > else:
> >     P =3D t.ParamSpec('P')
> >
> >     def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
> >         def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
> >             return func(*args, **kwargs)
> >         return wrapper
> > ```
> >
> > This also works and type checks in both versions. Of course, the type
> > information is discarded on 3.9, but as long as we run mypy on 3.10 we
> > are OK.
>
> I'd go for the latter, since the former would require Python 3.9 users
> to install an extra dependency to run `make LLVM=3D1 rust-analyzer`.

OK, I did some more investigation and it appears that `ParamSpec` is
generally intended for "preserve and forward" behavior; IIUC, we can't
modify an arbitrary parameter type with it. To quote the docs:

  They are used to forward the parameter types of one callable to
  another callable -- a pattern commonly found in higher order functions
  and decorators [1].

`Concatenate` seems to be one possible way to transform parameter types:

  `Concatenate` can be used in conjunction with `Callable` and
  `ParamSpec` to annotate a higher-order callable which adds, removes,
  or transforms parameters of another callable [2].

However, it requires the parameter whose type we want to modify to
occupy a fixed position. In our case, we would need to, for example,
move the `deps` parameter to the first positional argument in each
`append_*` function to ensure its placement is consistent across all of
them.

Given the above, I now think the simpler approach is to 1) modify
the type of `deps` to `List[Optional[Dependency]]`, and 2) directly
embed the filtering logic inside each `append_*` function:

-------------------------------------------------
def filter_deps(deps: List[Optional[Dependency]]) -> List[Dependency]:
    return [dep for dep in deps if dep is not None]

def append_crate(
    ...,
    deps: List[Optional[Dependency]],
    ...,
) -> Dependency:
    return register_crate(
        build_crate(
            display_name,
            root_module,
            deps=3Dfilter_deps(deps),
            cfg=3Dcfg,
            crate_attrs=3Dcrate_attrs,
            is_workspace_member=3Dis_workspace_member,
            edition=3Dedition,
        )
    )

# ...
-------------------------------------------------

(The commit using the above approach can be found at [3].)

Similar to the decorator approach, this requires less cleanup compared
to the original `sysroot_deps` version, since we're only touching the
function definitions rather than call sites.

Of course we will need to revert the parameter type when the time comes,
but in my view, this is much more straightforward than the decorator
approach, which needs extra setup to work generally.

What do you think?

[1] https://docs.python.org/3/library/typing.html#typing.ParamSpec
[2] https://docs.python.org/3/library/typing.html#typing.Concatenate
[3] https://github.com/J3m3/linux/commit/ada5d5af9348

Best regards,
Jesung
