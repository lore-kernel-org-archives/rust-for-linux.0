Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1173B95FF
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558442; cv=none; b=JippPIWM38X6z8N1l1vHkCxrB6VUeMtapPrFlL0STdYD/Qr8bV/TBgCpZN896u92PcMp+Cy0CwU2ySDOuiqhQ6IqIlQr/usjmGVpJUnhV0NnYbl1HfXFrmqy9j+hlRjWSC2usVwrRv/9b26Z5vnOQA6fEvpbVyRgwXswmG0qatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558442; c=relaxed/simple;
	bh=IG8vEZL7UfAObuTtFo5UmOitrRJMFf57V9C9+P+zv4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsoE/2j3aBKpZm5a7DV5tP34asukhTS5hveYOAiwvlXYzo4zymJIXSuDaofmetgBuIN38eLArpL/lDKhg30RB2fxT2j5AzW3QIkRz6/n7Had7fvYGZU9IFkKsEccSmXgGllN4owWMlqDpd/l1L0mG0yUS66vCpdlHdS84jNt26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVyD0Amm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVyD0Amm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566AFC2BCB8
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777558442;
	bh=IG8vEZL7UfAObuTtFo5UmOitrRJMFf57V9C9+P+zv4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WVyD0AmmBgD6Ngk+xw7FcxEsFb9A4JemNUpQ0iNA4VtPGtZpxPtLEXGQXHqLAVfwK
	 OHxzdDcP1i5WbaXUuOSzXdmKekZn9JNVO9QK/kxfZAYwnPiEGdrXclSbt6xOdtJaqk
	 jnSwW1v1FfZ8ec3Gqbv7oxjJExZpBjcXkyKLpA9RPZ3NBUUfD2fxXR4O9lNSV5gBrY
	 GibF34Zp28zDFhf4gqBZnCdomk3v1iPdOSxx8+ZjBxvDbgB/Kz5AJIs0/svJ2657rG
	 3xm/iZvVMgLphpw1dnTcJYiE/NiCyGxcXgo1mu4UFN+07gt0VHwWJ9O86VJeC+M214
	 /cC64EntSH6ZA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38ddeb0f5abso8282011fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 07:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9EVhpfOYAel/pQ3wOUtYwsnAGIIcoCmh4AY3aGgodhbtOC6D3fYrt9288HFh/Poe70QuQcvpjEp8npgf8O3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAmtg/KJCqy+PbP4n3w3ZbGHjNz9Do4aeWnuwzUiqDre9M15G
	dKPTKij76Z776LfbvZtoQbpV99dpRDjj+3ajG5H4yiXgG672k2PHpYWk2Z2l8/e1w8idXgNk4EM
	MLHHPQP8B85rf1J2Mei7syTu5UoAUdDU=
X-Received: by 2002:a2e:be0b:0:b0:38e:23c9:2f77 with SMTP id
 38308e7fff4ca-3934dba8724mr13718141fa.0.1777558440847; Thu, 30 Apr 2026
 07:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com> <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com>
In-Reply-To: <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 30 Apr 2026 10:13:22 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
X-Gm-Features: AVHnY4LcJI6AvFrOtEbmVLmn2BtnQ9hl45UIaeINLceO3GWq9ZEsCUG5GxeWDho
Message-ID: <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 8:15=E2=80=AFAM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> From: Jesung Yang <y.j3ms.n@gmail.com>
>
> Introduce multi-version support for rust-analyzer. The script now
> executes `rust-analyzer --version` to query the version string.
>
> This is a preparatory patch to address inherent method resolution
> failures for primitive types occurring in rust-analyzer v0.3.2693
> (2025-11-24) or later when used with our current `rust-project.json`
> generation logic. Since the actual fix requires using the `sysroot_src`
> field with a feature only available in rust-analyzer v0.3.2727
> (2025-12-22) or later, this infrastructure is necessary to maintain
> compatibility with older rust-analyzer releases.
>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 171 ++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 167 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index d5f9a0ca742c..f1828620bbbf 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -4,6 +4,9 @@
>  """
>
>  import argparse
> +from datetime import datetime, date
> +import enum
> +import re
>  import json
>  import logging
>  import os
> @@ -343,6 +346,148 @@ def generate_crates(
>
>      return crates
>
> +
> +Version =3D tuple[int, int, int]
> +
> +
> +@enum.unique
> +class RaVersionInfo(enum.Enum):
> +    """
> +    Represents rust-analyzer compatibility baselines. Concrete versions =
are mapped to the most
> +    recent baseline they have reached. Must be in release order.
> +    """

Until this patch this file wrapped at 80 columns.

> +
> +    # NOTE:
> +    # This rust-analyzer release should be kept in sync with our MSRV (c=
urrently 1.85.0).
> +    # When the MSRV is bumped, follow the steps below to retrieve the in=
formation needed
> +    # to update this:
> +    #
> +    #   1) Clone both Rust and rust-analyzer repositories.
> +    #      ```console
> +    #      $ git clone https://github.com/rust-lang/rust.git
> +    #      $ git clone https://github.com/rust-lang/rust-analyzer.git
> +    #      ```
> +    #   2) Run the following script, providing the new MSRV as an argume=
nt.
> +    #      It uses `xdg-open` to open the matching [1] rust-analyzer rel=
ease page.
> +    #      ```bash
> +    #      #!/usr/bin/env bash
> +    #
> +    #      RUST_VERSION=3D$1
> +    #      LOOKAHEAD=3D50
> +    #
> +    #      subject_string=3D$(
> +    #        git -C ./rust log -n "$LOOKAHEAD" --format=3D'%s' "$RUST_VE=
RSION" \
> +    #          -- src/tools/rust-analyzer | grep 'Merge pull request #'

This grep can be replaced with `--merges` and then you can just use
`-n 1` instead of `-n $LOOKAHEAD`, right?

> +    #      )
> +    #      readarray -t subject_array <<< "$subject_string"
> +    #
> +    #      hash=3D$(
> +    #        git -C ./rust-analyzer log -n 1 --format=3D'%H' --fixed-str=
ings \
> +    #          "${subject_array[@]/#/--grep=3D}"
> +    #      )
> +    #
> +    #      tag_predates=3D$(git -C ./rust-analyzer describe --tags --abb=
rev=3D0 "$hash")
> +    #
> +    #      link_prefix=3D"https://github.com/rust-lang/rust-analyzer/rel=
eases/tag"
> +    #      xdg-open "$link_prefix/$tag_predates"
> +    #      ```

With or without the `--merges` change, this always takes me to a very
recent tag. It seems like `git log -- src/tools/rust-analyzer` in the
rust repo never shows merge commits?


> +    #   3) Grab the release date and the version string.
> +    #
> +    # [1] Note that rust-analyzer releases may not perfectly align with =
those shipped
> +    #     in upstream Rust. We take a conservative approach here: use th=
e tag that
> +    #     directly predates the latest merge commit found upstream.
> +    #
> +    # v0.3.2228, released on 2024-12-23; shipped with the rustup 1.85.0 =
toolchain.
> +    MSRV =3D (
> +        datetime.strptime("2024-12-23", "%Y-%m-%d"),

Could we use date everywhere? Why datetime?

https://docs.python.org/3/library/datetime.html#datetime.date.strptime

> +        (0, 3, 2228),
> +        (1, 85, 0),
> +    )
> +
> +    def __init__(
> +        self,
> +        release_date: date,
> +        ra_version: Version,
> +        rust_version: Version,
> +    ) -> None:
> +        self.release_date =3D release_date
> +        self.ra_version =3D ra_version
> +        self.rust_version =3D rust_version
> +
> +
> +class RustProject(TypedDict):
> +    crates: List[Crate]
> +    sysroot: str
> +
> +
> +def generate_rust_project(
> +    _version_info: RaVersionInfo,
> +    srctree: pathlib.Path,
> +    objtree: pathlib.Path,
> +    sysroot: pathlib.Path,
> +    sysroot_src: pathlib.Path,
> +    external_src: Optional[pathlib.Path],
> +    cfgs: List[str],
> +    core_edition: str,
> +) -> RustProject:
> +    rust_project: RustProject =3D {
> +        "crates": generate_crates(
> +            srctree, objtree, sysroot_src, external_src, cfgs, core_edit=
ion
> +        ),
> +        "sysroot": str(sysroot),
> +    }
> +
> +    return rust_project
> +
> +def query_ra_version() -> Optional[str]:
> +    try:
> +        # Use the rust-analyzer binary found in $PATH.
> +        ra_version_output =3D (
> +            subprocess.check_output(
> +                ["rust-analyzer", "--version"],
> +                stdin=3Dsubprocess.DEVNULL,
> +            )
> +            .decode("utf-8")
> +            .strip()
> +        )
> +        return ra_version_output
> +    except FileNotFoundError:
> +        logging.warning("Failed to find rust-analyzer in $PATH")
> +        return None
> +
> +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
> +    baselines =3D reversed(RaVersionInfo)
> +
> +    version_match =3D re.search(r"\d+\.\d+\.\d+", ra_version_output)
> +    if version_match:
> +        version_string =3D version_match.group()
> +        found_version =3D tuple(map(int, version_string.split(".")))
> +
> +        # `rust-analyzer --version` shows a different version string dep=
ending on how the binary
> +        # is built: it may print either the Rust version or the rust-ana=
lyzer version itself.
> +        # To distinguish between them, we leverage rust-analyzer's versi=
oning convention.
> +        #
> +        # See:
> +        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2d642=
/xtask/src/dist.rs#L19-L21
> +        is_ra_version =3D version_string.startswith(("0.3", "0.4", "0.5"=
))
> +        if is_ra_version:
> +            for info in baselines:
> +                if found_version >=3D info.ra_version:
> +                    return info
> +        else:
> +            for info in baselines:
> +                if found_version >=3D info.rust_version:
> +                    return info
> +
> +    date_match =3D re.search(r"\d{4}-\d{2}-\d{2}", ra_version_output)
> +    if date_match:
> +        found_date =3D datetime.strptime(date_match.group(), "%Y-%m-%d")

datetime.strptime throws ValueError on invalid input; perhaps we can
catch that instead of using a regex match.

> +        for info in baselines:
> +            if found_date >=3D info.release_date:
> +                return info
> +
> +    return RaVersionInfo.MSRV
> +
>  def main() -> None:
>      parser =3D argparse.ArgumentParser()
>      parser.add_argument('--verbose', '-v', action=3D'store_true')
> @@ -371,10 +516,28 @@ def main() -> None:
>          level=3Dlogging.INFO if args.verbose else logging.WARNING
>      )
>
> -    rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.core_edition),
> -        "sysroot": str(args.sysroot),
> -    }
> +    ra_version_output =3D query_ra_version()
> +    if ra_version_output:
> +        compatible_ra_version =3D map_ra_version_baseline(ra_version_out=
put)
> +    else:
> +        logging.warning(
> +            "Falling back to `rust-project.json` for rust-analyzer %s, %=
s (shipped with Rust %s)",
> +            ".".join(map(str, RaVersionInfo.MSRV.ra_version)),
> +            datetime.strftime(RaVersionInfo.MSRV.release_date, "%Y-%m-%d=
"),
> +            ".".join(map(str, RaVersionInfo.MSRV.rust_version)),
> +        )

I think I mentioned this in an earlier review: this warning is logged
under the exact same circumstances as the warning in
`query_ra_version`. It should be one warning, not two.

> +        compatible_ra_version =3D RaVersionInfo.MSRV
> +
> +    rust_project =3D generate_rust_project(
> +        compatible_ra_version,
> +        args.srctree,
> +        args.objtree,
> +        args.sysroot,
> +        args.sysroot_src,
> +        args.exttree,
> +        args.cfgs,
> +        args.core_edition,
> +    )
>
>      json.dump(rust_project, sys.stdout, sort_keys=3DTrue, indent=3D4)
>
>
> --
> 2.53.0
>
>
