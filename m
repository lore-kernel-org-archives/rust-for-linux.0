Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61051C001DC
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 15:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbjGNP4F (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236201AbjGNP4E (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 11:56:04 -0400
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028D635A0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 08:56:01 -0700 (PDT)
Date:   Fri, 14 Jul 2023 15:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1689350160; x=1689609360;
        bh=+lfAu7VehWmb/sypc51klkDAwZxgntdzllO6FE/sTJI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=MmSIGoUGR7ervr1C1lzbE6cJNOLmgL6btTqbE5NxLPXwIuJ6GzLF4uwA/aoEmB792
         m/ts3op4I0rDYIcv0NgDafVYe/XivsJaM2bETGyO6C1BJy+B/REfyWu/QYL4bAPgif
         kStSzpnzEDsLjsr1YCG5jPi8dTfdDVUZ8+v/Qyv0c5r9uJYahUE97Xu7BJ51GTOY3k
         lIGgHmI4atWKqfo05DzL76NePSGZC91W8+dXyAdDAxEi073zR+cnCaJwdlmtoeJk3t
         R8L9ymgpITqCHn2YCudih6tL5BwedY/plyaPrIOeKDbLkSsRwiBNq8HzRqIopgTDEc
         88zKYGX5GIxuw==
To:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Message-ID: <diYQuBM2vYke0twpM2m8npuzVA2tHeJ2y52qN25pwSUmgBG0wxwaEQjBVg8eZnxu2kqcBf8wqNiu0aqgAGR3mlmtT2wPuO_HbVxAyhxR3X0=@proton.me>
In-Reply-To: <20230520231701.46008-1-yakoyoku@gmail.com>
References: <20230520231701.46008-1-yakoyoku@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`,
> to remedy this `generate_rust_analyzer.py` scans the Makefile from
> inside the `rust` directory for them to be added to a dictionary that
> each key corresponds to a crate and each value, to an array of `cfgs`.
>=20
> Signed-off-by: Martin Rodriguez Reboredo yakoyoku@gmail.com

When I try this patch *all* configuration options are input into the `cfg`
field of the `core` crate (others are also affected):
```json
            "cfg": [
                "CONFIG_RING_BUFFER",
                "CONFIG_RING_BUFFER=3D\"y\"",
                "CONFIG_HAVE_ARCH_SECCOMP_FILTER",
                "CONFIG_HAVE_ARCH_SECCOMP_FILTER=3D\"y\"",
                "CONFIG_KERNEL_GZIP",
                "CONFIG_KERNEL_GZIP=3D\"y\"",
                "CONFIG_CC_HAS_SANCOV_TRACE_PC",
                "CONFIG_CC_HAS_SANCOV_TRACE_PC=3D\"y\"",
                "CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP",
```
The snippet would continue on for about 1000 lines.
I think this is wrong and not intended.

--
Cheers,
Benno

>=20
> ---
> v1 -> v2:
>=20
> - Read values from command line arguments
>=20
> rust/Makefile | 4 +++-
> scripts/generate_rust_analyzer.py | 16 ++++++++++++++--
> 2 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index 7c9d9f11aec5..6234f5b70aee 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -373,7 +373,9 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC=
,$(RUSTC_OR_CLIPPY_QUIET)) L
> $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
>=20
> rust-analyzer:
> - $(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) =
\
> + $(Q)$(srctree)/scripts/generate_rust_analyzer.py \
> + --cfgs=3D'core=3D$(core-cfgs)' --cfgs=3D'alloc=3D$(alloc-cfgs)' \
> + $(srctree) $(objtree) \
> $(RUST_LIB_SRC) > $(objtree)/rust-project.json
>=20
>=20
> redirect-intrinsics =3D \
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 946e250c1b2a..5a850f055609 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -9,7 +9,15 @@ import logging
> import pathlib
> import sys
>=20
> -def generate_crates(srctree, objtree, sysroot_src):
> +def args_crates_cfgs(cfgs):
> + crates_cfgs =3D {}
> + for cfg in cfgs:
> + crate, vals =3D cfg.split("=3D", 1)
> + crates_cfgs[crate] =3D vals.replace("--cfg", "").split()
> +
> + return crates_cfgs
> +
> +def generate_crates(srctree, objtree, sysroot_src, cfgs):
> # Generate the configuration list.
> cfg =3D []
> with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -23,6 +31,7 @@ def generate_crates(srctree, objtree, sysroot_src):
> # Avoid O(n^2) iterations by keeping a map of indexes.
> crates =3D []
> crates_indexes =3D {}
> + crates_cfgs =3D args_crates_cfgs(cfgs)
>=20
> def append_crate(display_name, root_module, deps, cfg=3D[], is_workspace_=
member=3DTrue, is_proc_macro=3DFalse):
> crates_indexes[display_name] =3D len(crates)
> @@ -44,6 +53,7 @@ def generate_crates(srctree, objtree, sysroot_src):
> "core",
> sysroot_src / "core" / "src" / "lib.rs",
> [],
> + cfg=3Dcrates_cfgs.get("core", []),
> is_workspace_member=3DFalse,
> )
>=20
> @@ -57,6 +67,7 @@ def generate_crates(srctree, objtree, sysroot_src):
> "alloc",
> srctree / "rust" / "alloc" / "lib.rs",
> ["core", "compiler_builtins"],
> + cfg=3Dcrates_cfgs.get("alloc", []),
> )
>=20
> append_crate(
> @@ -123,6 +134,7 @@ def generate_crates(srctree, objtree, sysroot_src):
> def main():
> parser =3D argparse.ArgumentParser()
> parser.add_argument('--verbose', '-v', action=3D'store_true')
> + parser.add_argument('--cfgs', action=3D'append', default=3D[])
> parser.add_argument("srctree", type=3Dpathlib.Path)
> parser.add_argument("objtree", type=3Dpathlib.Path)
> parser.add_argument("sysroot_src", type=3Dpathlib.Path)
> @@ -134,7 +146,7 @@ def main():
> )
>=20
> rust_project =3D {
> - "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src)=
,
> + "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src,=
 args.cfgs),
> "sysroot_src": str(args.sysroot_src),
> }
>=20
> --
> 2.40.1
