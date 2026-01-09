Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684886353
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000094; cv=none; b=exC4TeKQI/9/0yXRcKtjez9Znjt/TBR8Pb/iMMbKXQz29kwbOvgtCOyPinDo/e7f7WGfSmDf8RgqRyDKRz4upmmzZ9HJoNQxfUOB12sExrl2ziHGkM/Jg3j5CWn0YlgdRTwNDmwkqLOohSU4AC2EVCOcNt7nZ8YF2GJ3tUtUS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000094; c=relaxed/simple;
	bh=f5rAUVWj9an9o8OnDsNEYsmMfi3qHPlu/xXXdKy9QNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+61NfRjCK7Iaqso6pUn+ENwP8oLuwfPXk9x6Rcb6cg17mKpmIrfVpNvIkGqkmnYafSpDR24l+DCpc7ZbBHMiH7zufbTyIL8Ahq06V5VG3hbZpcDj4IGDMyuiu99LLzVxGKh/81EjLSRqpvAdv2N9qNPMv06Zk/H080qhIpI0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoKu/Lh7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoKu/Lh7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382f9211cbfso45039631fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 15:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768000090; x=1768604890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8NPhZsm/mN1BeTxKa9qdXw6U11/RULkChtqEj2Y0UU=;
        b=YoKu/Lh7sy93JuBrB1kSxjKlahBaNqfzpT9L0NwdrskNvMI20z/lQxWlOtkHw7In+Y
         1NuJ+b0W1FVwRQUgvbJMu9WjMAAvR6fmOQi6CLnOUOUVw6o/4Ekr7I3avd99BLrdNEg7
         O5TyNWUAg0EOUBJNswHV1AK2kNcE/PNpu++jHG6j4J0qVUglBqqA3CUCn2hf2MuRl6G5
         CqjoMH47kcu/6Yn1zzw7f016SHovcJMMZq121YRXDrQQJ9lWtmwF3Axr9Um4JYzFoum9
         /B25HSnL855G+WZYUUF+vY32y7wtiO32S0s+7tHZcZZRuULEBbAMdZNH/bjV5dH54bk9
         5fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768000090; x=1768604890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8NPhZsm/mN1BeTxKa9qdXw6U11/RULkChtqEj2Y0UU=;
        b=oSG/ERuIzkgUp0KhXNFp07W5oDyhe7vI0UYxX/j9spB5S3xKePybLDDjUazb30oYYG
         hQ/IrWp21WWu2f8n9Rv6sRUFmLYRVEExjQLgvfOnhRqeJV4lXkK+cFggtzSe+5XkvhYG
         pFo99bPFn76p7peZagyFVd574lkAn7e487964Ozv0XgK/boIQxPQ4TgJ5nqwNhkU+kAW
         oTjMphnPltO+b1XxB2Mgee2Yv17lecAYFqOc+l6Lhzb4wpiJ3eW8wqwNqlLKk2IitTjJ
         7MXZ11wROQRUa+S7wtVOIJHNC5dbDnf/6/cdAEnDs2FA6yAsmqW90vsWIFOXrzZezygn
         fc6A==
X-Forwarded-Encrypted: i=1; AJvYcCWzICSL4cn0ggy8viUL4+cA/PrOSGwB/jAXEimbJpyMVY83xHisLtdEr9iU2bl0SLVdHbcNMCw3rpbrCNYUqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQPpPgV608O1rRfCpe43vRm9hKZxXOKu16t2u5njGiXM72+i8
	dlEusW6ioeznpZSDgOuAoecCYhAOg/g9bSThsAIbxpw6O91LokCPuVwDNLlmpQojm9a+KDaJCPu
	+MHVSjTCWxkPLke3EZ+qEOkbbUEu+4Gw=
X-Gm-Gg: AY/fxX4skQn+ofu2iXUA7e3TG9SoSbtEk5CrM12NvUiglT6ab+UcY80Yp19FO1U/nsW
	HvmmxUVkKecOC4xil2ELK9z+WsXX8ALWKxdeNqmtiqrpxvGmRooSi4gBx3ukyIbJP0LR7VtxCHh
	acv+VnPFwhjNeM4rMXw2p7cq4qZKAeInnAfjW6ddebMw7TociCh4U/d28fp5gHWwYjxOHh1Gt/e
	JSeVysV+zF8TCBMPVR7WU0h50d40HaR0hsHbQpBrLggCD3G400UVb/d003F+Rtq2CnSbm7/DYxv
	qj8oAXvArqBl+cG1bIV4pq8WK4fLtf+HzBDY4DKfuJ1VUU2FfhUI7JFR1LkO7d09BX4snTkMH5x
	kp6E0JoseAcYLmZqZe7lYMsRGQEYPm2t47bKJSPHGOQ==
X-Google-Smtp-Source: AGHT+IGTk7z+tXFORtVeV6dWqA8FBKar6e4i6TtIpeHAI+vaG5muxqOkmjNy/T27EMp9PMd9EBirWq5fgVXZj982zyU=
X-Received: by 2002:a2e:ad13:0:b0:37a:3fbf:b16f with SMTP id
 38308e7fff4ca-382ff6acad3mr28197681fa.19.1768000089114; Fri, 09 Jan 2026
 15:08:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com> <20260109-ra-fix-primitive-v2-1-249852a4145a@gmail.com>
In-Reply-To: <20260109-ra-fix-primitive-v2-1-249852a4145a@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 9 Jan 2026 18:07:33 -0500
X-Gm-Features: AZwV_Qh7ProRfq_YYHx3Xuar2mNog3GfkcCf2YWac2yNJviB8H-qhWOACrgcqUs
Message-ID: <CAJ-ks9kj-RGbWh8uPxayQnpZU4E5WSY_X_SA7f3fKzZKC=ARVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: generate_rust_analyzer: add versioning infrastructure
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:10=E2=80=AFPM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> From: Jesung Yang <y.j3ms.n@gmail.com>
>
> Introduce multi-version support for rust-analyzer. The script now
> executes `rust-analyzer --version` to query the version string and
> generates a `rust-project.json` file compatible with the detected
> version.
>
> This is a preparatory patch to address inherent method resolution
> failures for primitive types occurring in rust-analyzer v0.3.2693
> (2025-11-24) or later when used with our current `rust-project.json`
> generation logic. Since the actual fix requires a feature only available
> in rust-analyzer v0.3.2727 (2025-12-22) or later, this infrastructure is
> necessary to avoid breaking compatibility with rust-analyzer v0.3.1940
> (2024-04-29), which corresponds to our MSRV of 1.78.
>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

I think we can get all the information we need about the compiler
without shelling out to RA here. In KConfig we already have options
like

config RUSTC_HAS_COERCE_POINTEE
  def_bool RUSTC_VERSION >=3D 108400

and those configs all flow through scripts/generate_rust_analyzer.py.
Could we add one to indicate the new version of RA, and then drive the
logic from it?

> ---
>  scripts/generate_rust_analyzer.py | 181 ++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 157 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc940681426771db865bc2462e7029a6d7d..32b0da99f17549ecc83e9a689=
11373310a2c9617 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -4,10 +4,13 @@
>  """
>
>  import argparse
> +from datetime import datetime
> +import enum
>  import json
>  import logging
>  import os
>  import pathlib
> +import re
>  import subprocess
>  import sys
>
> @@ -19,7 +22,7 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, c=
ore_edition):
> +def generate_crates(ctx, srctree, objtree, sysroot_src, external_src, cf=
gs, core_edition):
>      # Generate the configuration list.
>      cfg =3D []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -35,7 +38,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> +    def append_crate(display_name, root_module, deps, cfg=3D[], crate_at=
trs=3D[], is_workspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"202=
1"):
>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -48,6 +51,8 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
>          }
> +        if ctx["use_crate_attrs"] and len(crate_attrs) > 0:
> +            crate["crate_attrs"] =3D crate_attrs
>          if is_proc_macro:
>              proc_macro_dylib_name =3D subprocess.check_output(
>                  [os.environ["RUSTC"], "--print", "file-names", "--crate-=
name", display_name, "--crate-type", "proc-macro", "-"],
> @@ -72,52 +77,58 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              edition=3Dedition,
>          )
>
> -    # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
> -    # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
> -    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []), =
edition=3Dcore_edition)
> -    append_sysroot_crate("alloc", ["core"])
> -    append_sysroot_crate("std", ["alloc", "core"])
> -    append_sysroot_crate("proc_macro", ["core", "std"])
> +    def sysroot_deps(*deps):
> +        return list(deps) if ctx["add_sysroot_crates"] else []
> +
> +    if ctx["add_sysroot_crates"]:
> +        # NB: sysroot crates reexport items from one another so setting =
up our transitive dependencies
> +        # here is important for ensuring that rust-analyzer can resolve =
symbols. The sources of truth
> +        # for this dependency graph are `(sysroot_src / crate / "Cargo.t=
oml" for crate in crates)`.
> +        append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", [=
]), edition=3Dcore_edition)
> +        append_sysroot_crate("alloc", ["core"])
> +        append_sysroot_crate("std", ["alloc", "core"])
> +        append_sysroot_crate("proc_macro", ["core", "std"])
>
>      append_crate(
>          "compiler_builtins",
>          srctree / "rust" / "compiler_builtins.rs",
>          [],
> +        crate_attrs=3D["no_std"],
>      )
>
>      append_crate(
>          "proc_macro2",
>          srctree / "rust" / "proc-macro2" / "lib.rs",
> -        ["core", "alloc", "std", "proc_macro"],
> +        sysroot_deps("core", "alloc", "std", "proc_macro"),
>          cfg=3Dcrates_cfgs["proc_macro2"],
>      )
>
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
> -        ["alloc", "proc_macro", "proc_macro2"],
> +        sysroot_deps("alloc", "proc_macro") + ["proc_macro2"],
>          cfg=3Dcrates_cfgs["quote"],
>      )
>
>      append_crate(
>          "syn",
>          srctree / "rust" / "syn" / "lib.rs",
> -        ["proc_macro", "proc_macro2", "quote"],
> +        sysroot_deps("proc_macro") + ["proc_macro2", "quote"],
>          cfg=3Dcrates_cfgs["syn"],
>      )
>
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",
> -        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
> +        sysroot_deps("std", "proc_macro") + ["proc_macro2", "quote", "sy=
n"],
>          is_proc_macro=3DTrue,
>      )
>
>      append_crate(
>          "build_error",
>          srctree / "rust" / "build_error.rs",
> -        ["core", "compiler_builtins"],
> +        sysroot_deps("core") + ["compiler_builtins"],
> +        crate_attrs=3D["no_std"],
>      )
>
>      append_crate(
> @@ -125,31 +136,36 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
>          [],
>          cfg=3D["kernel"],
> +        crate_attrs=3D["no_std"],
>          is_proc_macro=3DTrue,
>      )
>
>      append_crate(
>          "pin_init",
>          srctree / "rust" / "pin-init" / "src" / "lib.rs",
> -        ["core", "pin_init_internal", "macros"],
> +        sysroot_deps("core") + ["pin_init_internal", "macros"],
>          cfg=3D["kernel"],
> +        crate_attrs=3D["no_std"],
>      )
>
>      append_crate(
>          "ffi",
>          srctree / "rust" / "ffi.rs",
> -        ["core", "compiler_builtins"],
> +        sysroot_deps("core") + ["compiler_builtins"],
> +        crate_attrs=3D["no_std"],
>      )
>
>      def append_crate_with_generated(
>          display_name,
>          deps,
> +        crate_attrs=3D[]
>      ):
>          append_crate(
>              display_name,
>              srctree / "rust"/ display_name / "lib.rs",
>              deps,
>              cfg=3Dcfg,
> +            crate_attrs=3Dcrate_attrs
>          )
>          crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
>          crates[-1]["source"] =3D {
> @@ -160,9 +176,21 @@ def generate_crates(srctree, objtree, sysroot_src, e=
xternal_src, cfgs, core_edit
>              "exclude_dirs": [],
>          }
>
> -    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
> -    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
> -    append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "pin_init", "ffi", "bindings", "uapi"])
> +    append_crate_with_generated(
> +        "bindings",
> +        sysroot_deps("core") + ["ffi", "pin_init"],
> +        crate_attrs=3D["no_std"],
> +    )
> +    append_crate_with_generated(
> +        "uapi",
> +        sysroot_deps("core") + ["ffi", "pin_init"],
> +        crate_attrs=3D["no_std"],
> +    )
> +    append_crate_with_generated(
> +        "kernel",
> +        sysroot_deps("core") + ["macros", "build_error", "pin_init", "ff=
i", "bindings", "uapi"],
> +        crate_attrs=3D["no_std"],
> +    )
>
>      def is_root_crate(build_file, target):
>          try:
> @@ -190,12 +218,103 @@ def generate_crates(srctree, objtree, sysroot_src,=
 external_src, cfgs, core_edit
>              append_crate(
>                  name,
>                  path,
> -                ["core", "kernel"],
> +                sysroot_deps("core") + ["kernel"],
>                  cfg=3Dcfg,
> +                crate_attrs=3D["no_std"]
>              )
>
>      return crates
>
> +@enum.unique
> +class RaVersion(enum.Enum):
> +    """
> +    Represents rust-analyzer compatibility baselines. Concrete versions =
are mapped to the most
> +    recent baseline they have reached. Must be in release order.
> +    """
> +
> +    # v0.3.1940, released on 2024-04-29; bundled with the rustup 1.78 to=
olchain.
> +    V20240429 =3D 0
> +
> +    @staticmethod
> +    def baselines():
> +        assert len(RaVersion) =3D=3D 1, "Exhaustiveness check: update ba=
seline list!"
> +
> +        return [
> +            (datetime.strptime("2024-04-29", "%Y-%m-%d"), (0, 3, 1940), =
RaVersion.V20240429),
> +        ]
> +
> +    @staticmethod
> +    def default():
> +        # The default is the 2024-04-29 release, aligning with our MSRV =
policy.
> +        return RaVersion.V20240429
> +
> +    def __str__(self):
> +        assert len(RaVersion) =3D=3D 1, "Exhaustiveness check: update if=
 branches!"
> +
> +        if self =3D=3D RaVersion.V20240429:
> +            return "v0.3.1940 (2024-04-29)"
> +        else:
> +            assert False, "Unreachable"
> +
> +def generate_rust_project(
> +    ra_version,
> +    srctree,
> +    objtree,
> +    sysroot,
> +    sysroot_src,
> +    external_src,
> +    cfgs,
> +    core_edition
> +):
> +    assert len(RaVersion) =3D=3D 1, "Exhaustiveness check: update if bra=
nches!"
> +
> +    if ra_version =3D=3D RaVersion.V20240429:
> +        ctx =3D {
> +            "use_crate_attrs": False,
> +            "add_sysroot_crates": True,
> +        }
> +        return {
> +            "crates": generate_crates(ctx, srctree, objtree, sysroot_src=
, external_src, cfgs, core_edition),
> +            "sysroot": str(sysroot),
> +        }
> +    else:
> +        assert False, "Unreachable"
> +
> +def query_ra_version():
> +    try:
> +        # Use the rust-analyzer binary found in $PATH.
> +        ra_version_output =3D subprocess.check_output(
> +            ["rust-analyzer", "--version"],
> +            stdin=3Dsubprocess.DEVNULL,
> +        ).decode('utf-8').strip()
> +        return ra_version_output
> +    except FileNotFoundError:
> +        logging.warning("Failed to find rust-analyzer in $PATH")
> +        return None
> +
> +def map_ra_version_baseline(ra_version_output):
> +    checkpoints =3D reversed(RaVersion.baselines())
> +
> +    # First, attempt to resolve to our known checkpoint using the releas=
e date.
> +    # This covers patterns like "rust-analyzer 1.78.0 (9b00956e 2024-04-=
29)".
> +    date_match =3D re.search(r"\d{4}-\d{2}-\d{2}", ra_version_output)
> +    if date_match:
> +        found_date =3D datetime.strptime(date_match.group(), "%Y-%m-%d")
> +        for date, ver, enum in checkpoints:
> +            if found_date >=3D date:
> +                return enum
> +
> +    # Otherwise, attempt to resolve to our known checkpoint using the ru=
st-analyzer version.
> +    # This covers patterns like "rust-analyzer 0.3.2743-standalone".
> +    version_match =3D re.search(r"\d+\.\d+\.\d+", ra_version_output)
> +    if version_match:
> +        found_version =3D tuple(map(int, version_match.group().split("."=
)))
> +        for date, ver, enum in checkpoints:
> +            if found_version >=3D ver:
> +                return enum
> +
> +    return RaVersion.default()
> +
>  def main():
>      parser =3D argparse.ArgumentParser()
>      parser.add_argument('--verbose', '-v', action=3D'store_true')
> @@ -216,10 +335,24 @@ def main():
>      # Making sure that the `sysroot` and `sysroot_src` belong to the sam=
e toolchain.
>      assert args.sysroot in args.sysroot_src.parents
>
> -    rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.core_edition),
> -        "sysroot": str(args.sysroot),
> -    }
> +    output =3D query_ra_version()
> +    if output:
> +        compatible_ra_version =3D map_ra_version_baseline(output)
> +    else:
> +        default =3D RaVersion.default()
> +        logging.warning("Falling back to `rust-project.json` for rust-an=
alyzer %s", default)
> +        compatible_ra_version =3D default
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
> 2.47.3
>
>
