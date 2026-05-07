Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F438F620
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170814; cv=none; b=ccJHqhigw01CXbEP0DlWTeDCg9djpZCkn4KEuXdMxPVoX6mDiO35TwRkhY+nTDP6+4czEMA3dMKnBAlujd6rCdT7UQ41K1cMvxSO4luA1XiiCwZGJ/LcE5ge0Gdu7F6h2D4/Vyh18NpirXjucugbSzhmp8D962kCw0HJRIkHCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170814; c=relaxed/simple;
	bh=npxUYwUmbR0TkxHeUcJKmdsstelDL4BK+tmEcP98LkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+PRAesTOqNyRFZUSHtimCHrzZj8uyFkOM8awVwF9eAIEcZcbZamNdAzi5gcm+UgyEzRAJMGpwQ2D2x0t0kwSr4mrfFeUqtJ67mrDEG6iDGuYZQJboVsRelM0xDzspM54D9Dyt5YiKGowLD/jFIfvWg/pgBzwV48HmN9ckOPM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwz66FMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwz66FMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581B7C2BCC9
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170814;
	bh=npxUYwUmbR0TkxHeUcJKmdsstelDL4BK+tmEcP98LkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iwz66FMI4BaslTtrTME8gPr5xBZsySB/dTEj8DuDOPWhOY1gQpfO5o6P62vFo3VZL
	 i6PtRQSAjaNHnjG4qJUblI3AxwSdkxRkK+01bqjwQWTC/pvBZcEoJiJKeNMeMAoOp6
	 aaoIk8tMML2l+lVENdpIKTrZbf+/Jcv6Nz15q1Fb5o0ys+B9VCF997fUrUbazi6Kk7
	 eGjI4lyIbh5QcqencX11B/W1P12W1aCGEOkynuxSt0YvUbLK3oeNZFgBd1UAqpDEfG
	 iDLLqtcNE+aL4vkM4+O3It4w/PBE/wiZBI8Ku6IwQTYvW8DMMokTpAXSQFSAMG2pnX
	 S6F+2JQLwGkog==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3938d17d6c5so7975851fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 09:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7ZROiu/XbHfU1zLmgduCq+mbeAPQ6bl9BnNjftTPJySAZeNpu+CJnrba5dBik9u6bz1+GuVLcvd51IFNm9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XGAS8HmEO5kC9BeKazcRSNYPOf9FLU5bc6rnJfUfgFhS4RVg
	sdCT+quN/b+aJF2wNBwmt0UFNUGoyY1d6bRd94mO2+EFfCrpoGr+1iUwXED0EwcK0eoOuiCGVJg
	rL92JjtzXuEWCep4EH7KRNovZLdSXBW4=
X-Received: by 2002:a2e:ad10:0:b0:393:d706:7c6 with SMTP id
 38308e7fff4ca-393d7063e6bmr16900831fa.23.1778170813015; Thu, 07 May 2026
 09:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-ra-fix-primitive-v7-0-cb8e3791f2b5@gmail.com> <20260507-ra-fix-primitive-v7-2-cb8e3791f2b5@gmail.com>
In-Reply-To: <20260507-ra-fix-primitive-v7-2-cb8e3791f2b5@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 7 May 2026 12:19:35 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=KQc5Gxit5eGOcceFqx8x3dXU4tHSihpxF5xi5Lm=C4Q@mail.gmail.com>
X-Gm-Features: AVHnY4LlmS-BRS--UdkQEXF38JKTy5A1FUEMJ2dHZmlFHLvlc8UyKJJ9ZXeTjW4
Message-ID: <CAJ-ks9=KQc5Gxit5eGOcceFqx8x3dXU4tHSihpxF5xi5Lm=C4Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:47=E2=80=AFAM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> From: Jesung Yang <y.j3ms.n@gmail.com>
>
> Update `generate_rust_analyzer.py` so that the generated
> `rust-project.json` contains the `sysroot_src` field with
> `"crate_attrs": ["no_std"]` specified for relevant crates. This ensures
> that rust-analyzer provides proper IDE support for inherent methods of
> primitive types.
>
> Since commit 50384460c68f ("Rewrite method resolution to follow rustc
> more closely") to rust-analyzer, it no longer provides language server
> features like code completion and go-to-definition for inherent methods
> of primitive types when sysroot crates (e.g., `core`, `std`) are inlined
> in `rust-project.json` [1]. As `generate_rust_analyzer.py` currently
> inlines these crates, our setup is affected by this change.
>
> Specifying the `sysroot_src` field restores this functionality by
> allowing rust-analyzer to locate sysroot crates by itself. However, this
> causes `std` to be treated as a dependency for all local crates by
> default. To align with our compilation settings, provide the `no_std`
> attribute via the `crate_attrs` field, as the `-Zcrate-attr=3Dno_std`
> compiler flag is not visible to rust-analyzer. This combined approach
> removes manual manipulation of sysroot dependencies while preventing
> incorrect symbol resolution against the standard library.
>
> Note that this configuration requires rust-analyzer release 2025-12-22
> (v0.3.2727) or later, which introduced support for the `crate_attrs`
> field.
>
> Link: https://rust-lang.zulipchat.com/#narrow/channel/x/topic/x/near/5616=
07963 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near=
/561607753
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 108 ++++++++++++++++++++++++++++++--=
------
>  1 file changed, 87 insertions(+), 21 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 79c69004aed1..8629dd186891 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -4,6 +4,7 @@
>  """
>
>  import argparse
> +from dataclasses import dataclass
>  from datetime import date
>  import enum
>  import re
> @@ -39,14 +40,28 @@ class Source(TypedDict):
>      exclude_dirs: List[str]
>
>
> -class Crate(TypedDict):
> -    display_name: str
> -    root_module: str
> -    is_workspace_member: bool
> -    deps: List[Dependency]
> -    cfg: List[str]
> -    edition: str
> -    env: Dict[str, str]
> +# TODO: clean up once Python 3.11 is adopted.
> +if sys.version_info < (3, 11):
> +    class Crate(TypedDict, total=3DFalse):
> +        display_name: str
> +        root_module: str
> +        is_workspace_member: bool
> +        deps: List[Dependency]
> +        cfg: List[str]
> +        crate_attrs: List[str]
> +        edition: str
> +        env: Dict[str, str]
> +else:
> +    from typing import NotRequired
> +    class Crate(TypedDict):
> +        display_name: str
> +        root_module: str
> +        is_workspace_member: bool
> +        deps: List[Dependency]
> +        cfg: List[str]
> +        crate_attrs: NotRequired[List[str]]
> +        edition: str
> +        env: Dict[str, str]
>
>
>  class ProcMacroCrate(Crate):
> @@ -58,7 +73,14 @@ class CrateWithGenerated(Crate):
>      source: Source
>
>
> +@dataclass(frozen=3DTrue)
> +class RaVersionCtx:
> +    manual_sysroot_crates: bool
> +    use_crate_attrs: bool
> +
> +
>  def generate_crates(
> +    ctx: RaVersionCtx,
>      srctree: pathlib.Path,
>      objtree: pathlib.Path,
>      sysroot_src: pathlib.Path,
> @@ -84,22 +106,24 @@ def generate_crates(
>      def build_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: List[Optional[Dependency]],
>          *,
>          cfg: Optional[List[str]],
> +        crate_attrs: Optional[List[str]],
>          is_workspace_member: Optional[bool],
>          edition: Optional[str],
>      ) -> Crate:
> +        filtered_deps =3D [dep for dep in deps if dep is not None]
>          cfg =3D cfg if cfg is not None else crates_cfgs.get(display_name=
, [])
>          is_workspace_member =3D (
>              is_workspace_member if is_workspace_member is not None else =
True
>          )
>          edition =3D edition if edition is not None else "2021"
> -        return {
> +        crate: Crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
>              "is_workspace_member": is_workspace_member,
> -            "deps": deps,
> +            "deps": filtered_deps,
>              "cfg": cfg,
>              "edition": edition,
>              "env": {
> @@ -107,10 +131,15 @@ def generate_crates(
>              }
>          }
>
> +        if ctx.use_crate_attrs and crate_attrs is not None:
> +            crate["crate_attrs"] =3D crate_attrs
> +
> +        return crate
> +
>      def append_proc_macro_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: List[Optional[Dependency]],
>          *,
>          cfg: Optional[List[str]] =3D None,
>          is_workspace_member: Optional[bool] =3D None,
> @@ -121,6 +150,7 @@ def generate_crates(
>              root_module,
>              deps,
>              cfg=3Dcfg,
> +            crate_attrs=3DNone,
>              is_workspace_member=3Dis_workspace_member,
>              edition=3Dedition,
>          )
> @@ -148,9 +178,10 @@ def generate_crates(
>      def append_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: List[Optional[Dependency]],
>          *,
>          cfg: Optional[List[str]] =3D None,
> +        crate_attrs: Optional[List[str]] =3D None,
>          is_workspace_member: Optional[bool] =3D None,
>          edition: Optional[str] =3D None,
>      ) -> Dependency:
> @@ -160,6 +191,7 @@ def generate_crates(
>                  root_module,
>                  deps,
>                  cfg=3Dcfg,
> +                crate_attrs=3Dcrate_attrs,
>                  is_workspace_member=3Dis_workspace_member,
>                  edition=3Dedition,
>              )
> @@ -167,10 +199,12 @@ def generate_crates(
>
>      def append_sysroot_crate(
>          display_name: str,
> -        deps: List[Dependency],
> +        deps: List[Optional[Dependency]],
>          *,
>          cfg: Optional[List[str]] =3D None,
> -    ) -> Dependency:
> +    ) -> Optional[Dependency]:
> +        if not ctx.manual_sysroot_crates:
> +            return None
>          return append_crate(
>              display_name,
>              sysroot_src / display_name / "src" / "lib.rs",
> @@ -269,13 +303,14 @@ def generate_crates(
>
>      def append_crate_with_generated(
>          display_name: str,
> -        deps: List[Dependency],
> +        deps: List[Optional[Dependency]],
>      ) -> Dependency:
>          crate =3D build_crate(
>              display_name,
>              srctree / "rust"/ display_name / "lib.rs",
>              deps,
>              cfg=3Dgenerated_cfg,
> +            crate_attrs=3DNone,
>              is_workspace_member=3DTrue,
>              edition=3DNone,
>          )
> @@ -342,6 +377,7 @@ def generate_crates(
>                  path,
>                  [core, kernel, pin_init],
>                  cfg=3Dgenerated_cfg,
> +                crate_attrs=3D["no_std"],
>              )
>
>      return crates
> @@ -415,6 +451,21 @@ class RaVersionInfo(enum.Enum):
>          date(2024, 12, 23),
>          (0, 3, 2228),
>          (1, 85, 0),
> +        RaVersionCtx(
> +            use_crate_attrs=3DFalse,
> +            manual_sysroot_crates=3DTrue,
> +        ),
> +    )
> +    # v0.3.2727, released on 2025-12-22;
> +    # v0.3.2743 is shipped with the rustup 1.94.0 toolchain.
> +    SUPPROTS_CRATE_ATTRS =3D (

Typo here. I can fix that on apply.

> +        date(2025, 12, 22),
> +        (0, 3, 2727),
> +        (1, 94, 0),
> +        RaVersionCtx(
> +            use_crate_attrs=3DTrue,
> +            manual_sysroot_crates=3DFalse,
> +        ),
>      )
>
>      def __init__(
> @@ -422,19 +473,30 @@ class RaVersionInfo(enum.Enum):
>          release_date: date,
>          ra_version: Version,
>          rust_version: Version,
> +        ctx: RaVersionCtx,
>      ) -> None:
>          self.release_date =3D release_date
>          self.ra_version =3D ra_version
>          self.rust_version =3D rust_version
> +        self.ctx =3D ctx
>
>
> -class RustProject(TypedDict):
> -    crates: List[Crate]
> -    sysroot: str
> +# TODO: clean up once Python 3.11 is adopted.
> +if sys.version_info < (3, 11):
> +    class RustProject(TypedDict, total=3DFalse):
> +        crates: List[Crate]
> +        sysroot: str
> +        sysroot_src: str
> +else:
> +    from typing import NotRequired
> +    class RustProject(TypedDict):
> +        crates: List[Crate]
> +        sysroot: str
> +        sysroot_src: NotRequired[str]
>
>
>  def generate_rust_project(
> -    _version_info: RaVersionInfo,
> +    version_info: RaVersionInfo,
>      srctree: pathlib.Path,
>      objtree: pathlib.Path,
>      sysroot: pathlib.Path,
> @@ -443,13 +505,17 @@ def generate_rust_project(
>      cfgs: List[str],
>      core_edition: str,
>  ) -> RustProject:
> +    ctx =3D version_info.ctx
>      rust_project: RustProject =3D {
>          "crates": generate_crates(
> -            srctree, objtree, sysroot_src, external_src, cfgs, core_edit=
ion
> +            ctx, srctree, objtree, sysroot_src, external_src, cfgs, core=
_edition
>          ),
>          "sysroot": str(sysroot),
>      }
>
> +    if not ctx.manual_sysroot_crates:
> +        rust_project["sysroot_src"] =3D str(sysroot_src)
> +
>      return rust_project
>
>  def query_ra_version() -> Optional[str]:
>
> --
> 2.53.0
>
>
