Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D843C066
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922930; cv=none; b=DymFjnG5xTJuyTT9zMI784+p4QNRsVhAt71r/zbVJiu/N0xGQHC4vTGZQb6fkFqjHnys3zwgr88F+rUi23iNRUxxkOJXM4cVlBjtwg0GehOyu9iRdsBfZ7ldz6BXjmjNl6glg/tT6vCKbaNByyeJgnA7MpvmfqaOg0aDOzlEPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922930; c=relaxed/simple;
	bh=dl3n6fCypG8vkThD9BAp7rguf6h03v9XsKH7wuiZifw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRIq1/rR3ieF3/cMRi7vteDD2Mu4JC0Lk2Ib7VC7YLjyXly2/IfY/S4xmj8fC6XFQH8ZM0ra346auDt+0XLNzliPj9go1K4HiLOVuBmyH2kaUQb9NO5m5ti10QVFS4h7EgEsuQ+Cep85krF5p8OiN5gWSA+FrN2b+yKYqpjUFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REZAzfyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REZAzfyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4F6C4AF09
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922930;
	bh=dl3n6fCypG8vkThD9BAp7rguf6h03v9XsKH7wuiZifw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=REZAzfyUg4MOS+AvyirJQipGS1lgQbuDRpFSYDAQga9B8WTowkViNQ1SemgnnIADV
	 MytMt+qPvCvwCXMfnjqgLnJHDqyfd077giMM+i0pIqUZmijfpRw/b7yf09/0eaiDf1
	 sUI/7UJdPnybtdD4MGHM9oe/35jeLHkxFRZrspWcHfvxUYflAtVLGsIfZ3DWqY/DfP
	 4kHepsASidYZX3iUExkawpgW5jGMKjWaoZbDCnxs4TzlqLPS5TAHBi54oHGvu7W0y1
	 /n+SRsQIFcInbnxVgKTl0GoXZj+LDx5pmFdQzRvzVvMPGbZQvKRVNcrZUzDukVc+yJ
	 cZnlUpyJOAwqw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f9930e54so50681561fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC/7qIYvS31Y4zFVy1kbqLFJQvd1mNbiLpa/BaDm56FOzJDQDucFU9/7a2wHt/bVqdx43lOkbZTgHcCq+ZBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1egkXWwS6IDEdZRiLPIMOBdiBQiN0BXN9eSNk0fLICagGEZY
	UWOfoYpDVQoRLgo/jg33jsMua8rL3GE6OjO1G7rsp+PYymJvJxP7wSgkQ2idH7jRgoJpJPgs8AA
	4fH/o6sog41N7UTK1+kyUgsEXZmcSTu8=
X-Received: by 2002:a05:651c:2128:b0:37e:6884:6756 with SMTP id
 38308e7fff4ca-38384dc857cmr61735921fa.14.1768922929328; Tue, 20 Jan 2026
 07:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:28:12 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nNv2oDGeCbZoBzEJdrKj-pLgcniUbyss8uSoxXiUvLkA@mail.gmail.com>
X-Gm-Features: AZwV_QjIhIRBLh1D5esl4khZclzoZ0r-NLtnQuo5LxaAeKd7McXAhJVBHp5ZiUc
Message-ID: <CAJ-ks9nNv2oDGeCbZoBzEJdrKj-pLgcniUbyss8uSoxXiUvLkA@mail.gmail.com>
Subject: Re: [PATCH 2/6] scripts: generate_rust_analyzer: plumb editions via
 command line
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add --editions argument to pass crate editions in a similar way to the
> existing --cfgs mechanism.
>
> It sets editions as follows:
>   - core: 2024 for rustc >=3D 1.87 otherwise 2021
>   - quote: 2018
>   - all others: 2021
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/Makefile                     |  8 +++--
>  scripts/generate_rust_analyzer.py | 70 ++++++++++++++++++++++-----------=
------
>  2 files changed, 45 insertions(+), 33 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 4dcc2eff51cb..2238b0b69197 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -95,8 +95,10 @@ quote-cfgs :=3D \
>  quote-skip_flags :=3D \
>      --edition=3D2021
>
> +quote-edition :=3D 2018
> +
>  quote-flags :=3D \
> -    --edition=3D2018 \
> +    --edition=3D$(quote-edition) \
>      --cap-lints=3Dallow \
>      --extern proc_macro2 \
>      $(call cfgs-to-flags,$(quote-cfgs))
> @@ -567,10 +569,12 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET)) L
>
>  rust-analyzer:
>         $(Q)MAKEFLAGS=3D $(srctree)/scripts/generate_rust_analyzer.py \
> -               --cfgs=3D'core=3D$(core-cfgs)' $(core-edition) \
> +               --cfgs=3D'core=3D$(core-cfgs)' \
>                 --cfgs=3D'proc_macro2=3D$(proc_macro2-cfgs)' \
>                 --cfgs=3D'quote=3D$(quote-cfgs)' \
>                 --cfgs=3D'syn=3D$(syn-cfgs)' \
> +               --editions=3D'core=3D$(core-edition)' \
> +               --editions=3D'quote=3D$(quote-edition)' \
>                 $(realpath $(srctree)) $(realpath $(objtree)) \
>                 $(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(=
srcroot)) \
>                 > rust-project.json
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index c188d1f1fd5b..17ed5546504b 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -11,6 +11,13 @@ import pathlib
>  import subprocess
>  import sys
>
> +def args_single(args):
> +    result =3D {}
> +    for arg in args:
> +        crate, val =3D arg.split("=3D", 1)
> +        result[crate] =3D val
> +    return result

This is a bit sloppy. If we expect exactly one edition per crate, we
should error when we find that is not the case.

Separately this is almost identical to `args_crates_cfgs`; it would be
better to unify the implementation.

> +
>  def args_crates_cfgs(cfgs):
>      crates_cfgs =3D {}
>      for cfg in cfgs:
> @@ -19,7 +26,7 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, c=
ore_edition):
> +def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions):
>      # Generate the configuration list.
>      generated_cfg =3D []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -34,8 +41,35 @@ def generate_crates(srctree, objtree, sysroot_src, ext=
ernal_src, cfgs, core_edit
>      crates =3D []
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
> +    crates_editions =3D args_single(editions)
> +
> +    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse):
> +        # Miguel Ojeda writes:
> +        #
> +        # > ... in principle even the sysroot crates may have different
> +        # > editions.
> +        # >
> +        # > For instance, in the move to 2024, it seems all happened at =
once
> +        # > in 1.87.0 in these upstream commits:
> +        # >
> +        # >     0e071c2c6a58 ("Migrate core to Rust 2024")
> +        # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
> +        # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
> +        # >     993359e70112 ("Migrate std to Rust 2024")
> +        # >
> +        # > But in the previous move to 2021, `std` moved in 1.59.0, whi=
le
> +        # > the others in 1.60.0:
> +        # >
> +        # >     b656384d8398 ("Update stdlib to the 2021 edition")
> +        # >     06a1c14d52a8 ("Switch all libraries to the 2021 edition"=
)
> +        #
> +        # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=3D8xCUhSHM=
y2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/
> +        #
> +        # At the time of writing all rust versions we support build the
> +        # sysroot crates with the same edition. We may need to relax thi=
s
> +        # assumption if future edition moves span multiple rust versions=
.
> +        edition =3D crates_editions.get(display_name, "2021")

This logic is incorrect, and the relocation of this comment is also
incorrect. The sysroot crates std, alloc, and proc_macro should also
be compiled with core's edition (this comment explains why). Your
patch changes that to edition 2021, which is incorrect.


>
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -68,31 +102,6 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              deps,
>              cfg,
>              is_workspace_member=3DFalse,
> -            # Miguel Ojeda writes:
> -            #
> -            # > ... in principle even the sysroot crates may have differ=
ent
> -            # > editions.
> -            # >
> -            # > For instance, in the move to 2024, it seems all happened=
 at once
> -            # > in 1.87.0 in these upstream commits:
> -            # >
> -            # >     0e071c2c6a58 ("Migrate core to Rust 2024")
> -            # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
> -            # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
> -            # >     993359e70112 ("Migrate std to Rust 2024")
> -            # >
> -            # > But in the previous move to 2021, `std` moved in 1.59.0,=
 while
> -            # > the others in 1.60.0:
> -            # >
> -            # >     b656384d8398 ("Update stdlib to the 2021 edition")
> -            # >     06a1c14d52a8 ("Switch all libraries to the 2021 edit=
ion")
> -            #
> -            # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=3D8xCU=
hSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/
> -            #
> -            # At the time of writing all rust versions we support build =
the
> -            # sysroot crates with the same edition. We may need to relax=
 this
> -            # assumption if future edition moves span multiple rust vers=
ions.
> -            edition=3Dcore_edition,
>          )
>
>      # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
> @@ -120,8 +129,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
>          ["core", "alloc", "std", "proc_macro", "proc_macro2"],
> -        cfg=3Dcrates_cfgs["quote"],
> -        edition=3D"2018",
> +        cfg=3Dcrates_cfgs["quote"]
>      )
>
>      append_crate(
> @@ -224,7 +232,7 @@ def main():
>      parser =3D argparse.ArgumentParser()
>      parser.add_argument('--verbose', '-v', action=3D'store_true')
>      parser.add_argument('--cfgs', action=3D'append', default=3D[])
> -    parser.add_argument("core_edition")
> +    parser.add_argument('--editions', action=3D'append', default=3D[])
>      parser.add_argument("srctree", type=3Dpathlib.Path)
>      parser.add_argument("objtree", type=3Dpathlib.Path)
>      parser.add_argument("sysroot", type=3Dpathlib.Path)
> @@ -238,7 +246,7 @@ def main():
>      )
>
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.core_edition),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions),
>          "sysroot": str(args.sysroot),
>      }
>
>
> --
> 2.52.0
>
>
