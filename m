Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571A388E42
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477451; cv=none; b=Ys5xc8KUn9SwPvmU575+BV2rL2mcu8dmNwh6urvBIz0/VHSOcGiCfDCnjgjS9872gBkDxCZ74ID7L0jWjdFaykS3+hkUJtrpjpYsM+pjTnzfXk7f0DSpO8p/3KztFR6Wjf9AfA5gXlw/8TzuJSKC0VwhoBL8+V4N4Vu4i5Z0ROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477451; c=relaxed/simple;
	bh=/VVVjmX1JfWP6hqisABCxeuMAvh5vYajE8kQfwLPrEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epbxDdqvM3W4jPKUYME8gHshtqkdM3nhSuN6Ntig0ueHusR6Smn92iaPT/6idA9IuWpYPWW/fu2Bp37DrRbauTz0HsFj01ibchijxHH7bdkDRDXY9tb9Ho5TN1MlYzl/cFe2qOn020D0SJWEjbUmCx/SvAztWNghqkinud4iz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WI8vnGON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WI8vnGON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D30AC2BCF7
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777477450;
	bh=/VVVjmX1JfWP6hqisABCxeuMAvh5vYajE8kQfwLPrEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WI8vnGONBQS4SIDTya85jOhwzaW41bFZddiCPlQEoaB1o7fJPLoq0DM7IqZDQlZgF
	 O5b+veqpvjtKdGWm/JK8BAGAMHfzXTeG5QZwrp7Pt5jlYkw2SiI3wOo1sGngiiwj4c
	 7rWXJ42yBD4c/FxsTrC/ZMSU7heD85bOt+wMhGvzoxvLGHfE7iSIsXRLXtEkqe6fJ0
	 a65PnluULEywNXfKRFrQNYSz5a7L9yFy1G7JpQQmnz5s4uSNSHvr7dsct2OCkBvno7
	 qAoHWt4SAoTKefsgdaOenRFG9BA4jVvc+2IhyXeLGp1jK4PW5mB6ehRtUf91AlZzOP
	 HFsHkfYqiqJPQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so13588668e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9TE1GJzD9/Eu8yBzP4FSngN8f+n7eh7MQfgFoVK8zeW+7zhbhD/QT3LB2768KYbMIXqvn4zPtRTf7fW7JA4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1PD4Zxbyeqm7G9OPfXMUu5xo452Rb0Lzl8SYsN90Z9cFJE4O
	JpWVIU5ea0aHi0ZS9eM4YClp+fjy9Ww+Yu/3e5l1M2zQum/Gt+SNcabOArgg5Zq1mlFN5IGv3+W
	QCR73dpkJextqAu+tV+9VWXKNZvcoYoQ=
X-Received: by 2002:a05:6512:3c82:b0:5a3:c690:b4a6 with SMTP id
 2adb3069b0e04-5a746409f94mr2779816e87.7.1777477448960; Wed, 29 Apr 2026
 08:44:08 -0700 (PDT)
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
 <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com>
 <CA+tqQ4+GFw83fFz-ykqLqae-ao-3oU0G-mxm2wD+xB7bHQ2Y6A@mail.gmail.com> <CA+tqQ4+z7jxNjPnAPXSK_sO8CfC9cDG6LexTK9YLF3DqnF8j6w@mail.gmail.com>
In-Reply-To: <CA+tqQ4+z7jxNjPnAPXSK_sO8CfC9cDG6LexTK9YLF3DqnF8j6w@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 29 Apr 2026 11:43:32 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nMBvgC1UOyVt866ECNBUxVMgnieBpPq5jaanLDhiZ+Dw@mail.gmail.com>
X-Gm-Features: AVHnY4ISLBw4a3U6sJrNgLyP32oBNMNgqE-dn_a2wybAgrdGYtSWXDxozfXZCEA
Message-ID: <CAJ-ks9nMBvgC1UOyVt866ECNBUxVMgnieBpPq5jaanLDhiZ+Dw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 10:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> On Tue, Apr 28, 2026 at 10:35=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com>=
 wrote:
> > On Mon, Apr 27, 2026 at 2:23=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> [...]
> > >
> > > ```
> > > T =3D t.TypeVar('T')
> > > if sys.version_info < (3, 10):
> > >     def wrapper(func: t.Callable[..., T]) -> t.Callable[..., T]:
> > >         def wrapper(*args: t.Any, **kwargs: t.Any) -> T:
> > >             return func(*args, **kwargs)
> > >         return wrapper
> > > else:
> > >     P =3D t.ParamSpec('P')
> > >
> > >     def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
> > >         def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
> > >             return func(*args, **kwargs)
> > >         return wrapper
> > > ```
> > >
> > > This also works and type checks in both versions. Of course, the type
> > > information is discarded on 3.9, but as long as we run mypy on 3.10 w=
e
> > > are OK.
> >
> > I'd go for the latter, since the former would require Python 3.9 users
> > to install an extra dependency to run `make LLVM=3D1 rust-analyzer`.
>
> OK, I did some more investigation and it appears that `ParamSpec` is
> generally intended for "preserve and forward" behavior; IIUC, we can't
> modify an arbitrary parameter type with it. To quote the docs:
>
>   They are used to forward the parameter types of one callable to
>   another callable -- a pattern commonly found in higher order functions
>   and decorators [1].
>
> `Concatenate` seems to be one possible way to transform parameter types:
>
>   `Concatenate` can be used in conjunction with `Callable` and
>   `ParamSpec` to annotate a higher-order callable which adds, removes,
>   or transforms parameters of another callable [2].
>
> However, it requires the parameter whose type we want to modify to
> occupy a fixed position. In our case, we would need to, for example,
> move the `deps` parameter to the first positional argument in each
> `append_*` function to ensure its placement is consistent across all of
> them.
>
> Given the above, I now think the simpler approach is to 1) modify
> the type of `deps` to `List[Optional[Dependency]]`, and 2) directly
> embed the filtering logic inside each `append_*` function:
>
> -------------------------------------------------
> def filter_deps(deps: List[Optional[Dependency]]) -> List[Dependency]:
>     return [dep for dep in deps if dep is not None]
>
> def append_crate(
>     ...,
>     deps: List[Optional[Dependency]],
>     ...,
> ) -> Dependency:
>     return register_crate(
>         build_crate(
>             display_name,
>             root_module,
>             deps=3Dfilter_deps(deps),
>             cfg=3Dcfg,
>             crate_attrs=3Dcrate_attrs,
>             is_workspace_member=3Dis_workspace_member,
>             edition=3Dedition,
>         )
>     )
>
> # ...
> -------------------------------------------------
>
> (The commit using the above approach can be found at [3].)
>
> Similar to the decorator approach, this requires less cleanup compared
> to the original `sysroot_deps` version, since we're only touching the
> function definitions rather than call sites.
>
> Of course we will need to revert the parameter type when the time comes,
> but in my view, this is much more straightforward than the decorator
> approach, which needs extra setup to work generally.
>
> What do you think?
>
> [1] https://docs.python.org/3/library/typing.html#typing.ParamSpec
> [2] https://docs.python.org/3/library/typing.html#typing.Concatenate
> [3] https://github.com/J3m3/linux/commit/ada5d5af9348

Seems ok to me. I would push the logic into build_crate to avoid
needing the `filter_deps` helper.

Another thought: where you have `# TODO: use `typing.NotRequired` when
Python 3.11 is adopted.` we should split the definition of the type
for < 3.11 so that we can get the correct (strict) type checking when
a more recent version of Python is used. We should get in the habit of
running type checking against all Python versions we support.

Cheers.
Tamir
