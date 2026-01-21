Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB8495517
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004842; cv=none; b=m06KZhGzcgr+OoXTK/xL87VRnNx624olYv6kw9VBY5xRoibFgkkBTdMcR4LripYgb5qCcZBNDLqF4ibrN60XliHAE1qc4v0M51nAh4K5flojpuCahkrOmUanFL3f5hL9UfWDigTd0ETeZa5DPL8jjeRdlzZoQSHG1kRd4UTRaDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004842; c=relaxed/simple;
	bh=dALV+63Fzoy41F4fy26VgRoXnNwwyJxM4zltpxBL5Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9kqV+6+5Q1CNCc3+wwEZ5GuVZ+tKfGae2Bq9zu6o7vVLwe3lyDK5SKJbbsr5HFfMrCH7mmGa+xroDEoNryRc1kngQlfnNf0Y3nLn8tWCP47rzrywgIthRm6ieCCuHDx0+yCn5MHKGQ+93ncEO2kd102k+q3RMSttbxvo97pd9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDpkBu+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDpkBu+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92550C116D0
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769004841;
	bh=dALV+63Fzoy41F4fy26VgRoXnNwwyJxM4zltpxBL5Q8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oDpkBu+iZgorRUWoMmGZIZKU1uK0el+c17p3lrXIgCWo+/8J8cTgx4fNKI5QwALPJ
	 GkOUWGAJJlTC5yFYq8R2zECkvPSnxGxYtN/IqS5+UaPMsZfUtAQFEVDMKLpUFwQagv
	 rdnoK0FK1v6ZGMrm9ZTMfoMEASDsREN5d0RmYi6S2lYbIm5ahqtVHw+FZfD4oY8Ocb
	 6WKJ9X+fIdjrdGA41T2WXutDhvDgKGRv4DtTcNV/qSF2PqRbNOQNClTwUp5gkC0b2G
	 fNEDkJ6akdyEn3ceL42VtJg8tDqt+i8Y/lBjPB0YH4qCz2hjlxgiKcZs7Nw4iZvt0A
	 J4Kjmo/aZ7bQQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso35845921fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 06:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUr/o6WuiTk2ypVgXM9Cja1Ea/fqVOQ8MonO5ViSg54kbqVFUGhWDP1qh9/HVX8cV9yZ3XxXJzDZVkkU4QJzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydVwsy4wnljRMaZxyDFu003M3fIPTNQrxg4D5m9V4S9BmVG3T4
	ip5ySUP6F1DEEGwbaksJKvWoVy22CGjWjRwgWi3E+QXJBFg/J9ocjK71KO9HrJhBgs6f5kr0Cyh
	J98e3Hv98TAeKZGFxOXoRTSM8n93A/1k=
X-Received: by 2002:a2e:b88f:0:b0:385:9b50:91a2 with SMTP id
 38308e7fff4ca-3859b5092b9mr29951621fa.10.1769004840173; Wed, 21 Jan 2026
 06:14:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
 <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org> <DFTVC1IH8KM0.VR14LX627BWD@gmail.com>
In-Reply-To: <DFTVC1IH8KM0.VR14LX627BWD@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 21 Jan 2026 09:13:23 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nVxs5aGWPO5m=7GBjEE+Rn_qS_Yg0HD6qc5=Na6-K9OQ@mail.gmail.com>
X-Gm-Features: AZwV_QhYNNKy7sIHHRhr8zkXpBxFZ58Ic9PsgObhDVsrzCHPysukuyErONLjYGU
Message-ID: <CAJ-ks9nVxs5aGWPO5m=7GBjEE+Rn_qS_Yg0HD6qc5=Na6-K9OQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:16=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> On Wed Jan 21, 2026 at 1:10 AM KST, Tamir Duberstein wrote:
> > Centralize `cfg` lookup in `append_crate` to avoid having to do so for
> > each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now that
> > these are passed from `rust/Makefile`.
> >
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  scripts/generate_rust_analyzer.py | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 147d0cc94068..b96d3cbe3df1 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
> >      crates_indexes =3D {}
> >      crates_cfgs =3D args_crates_cfgs(cfgs)
> >
> > -    def append_crate(display_name, root_module, deps, cfg=3D[], is_wor=
kspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> > +    def append_crate(display_name, root_module, deps, cfg=3DNone, is_w=
orkspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> > +        if cfg is None:
> > +            cfg =3D crates_cfgs.get(display_name, [])
>
> Could we add a brief comment explaining how the behavior of
> `append_crate` changes according to the `cfg` parameter? Since `None`
> and an empty list have different effects, documenting that distinction
> would make the intended behavior clearer.

I don't think this is necessary - it won't age well when we change the
entire API surface here in the next version of the series[0] that adds
type annotations.

Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67fe5=
c38a@gmail.com/
[0]

> This would also help later when we add proper Python docstrings.

Same as above: a lot of change is coming. Is this worth considering right n=
ow?

>
> Thanks!
>
> Best regards,
> Jesung
>
> >          crate =3D {
> >              "display_name": display_name,
> >              "root_module": str(root_module),
> > @@ -60,7 +62,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
> >      def append_sysroot_crate(
> >          display_name,
> >          deps,
> > -        cfg=3D[],
> > +        cfg=3DNone,
> >          edition=3D"2021",
> >      ):
> >          append_crate(
> > @@ -75,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
> >      # NB: sysroot crates reexport items from one another so setting up=
 our transitive dependencies
> >      # here is important for ensuring that rust-analyzer can resolve sy=
mbols. The sources of truth
> >      # for this dependency graph are `(sysroot_src / crate / "Cargo.tom=
l" for crate in crates)`.
> > -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", [])=
, edition=3Dcore_edition)
> > +    append_sysroot_crate("core", [], edition=3Dcore_edition)
> >      append_sysroot_crate("alloc", ["core"])
> >      append_sysroot_crate("std", ["alloc", "core"])
> >      append_sysroot_crate("proc_macro", ["core", "std"])
> > @@ -90,21 +92,18 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >          "proc_macro2",
> >          srctree / "rust" / "proc-macro2" / "lib.rs",
> >          ["core", "alloc", "std", "proc_macro"],
> > -        cfg=3Dcrates_cfgs["proc_macro2"],
> >      )
> >
> >      append_crate(
> >          "quote",
> >          srctree / "rust" / "quote" / "lib.rs",
> >          ["alloc", "proc_macro", "proc_macro2"],
> > -        cfg=3Dcrates_cfgs["quote"],
> >      )
> >
> >      append_crate(
> >          "syn",
> >          srctree / "rust" / "syn" / "lib.rs",
> >          ["proc_macro", "proc_macro2", "quote"],
> > -        cfg=3Dcrates_cfgs["syn"],
> >      )
> >
> >      append_crate(
> > @@ -124,7 +123,6 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >          "pin_init_internal",
> >          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> >          [],
> > -        cfg=3D["kernel"],
> >          is_proc_macro=3DTrue,
> >      )
> >
> > @@ -132,7 +130,6 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >          "pin_init",
> >          srctree / "rust" / "pin-init" / "src" / "lib.rs",
> >          ["core", "pin_init_internal", "macros"],
> > -        cfg=3D["kernel"],
> >      )
> >
> >      append_crate(
>
