Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F94274B2B
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367677; cv=none; b=E5CO3R71jXrFXjLs7RgZSI5Es2soetqd2b+9Y+KxDvi1XccZ1/i6mcqdzXu2H5cPMRTbK4Mr90ezrxaJr8uhfWc9fRkcGq0Pce1jKMgKYkwUhRSoMzTtgoj21X8V1ck2J+OMMWrhlRIvgIOmVuFgCoFdIXJyxbALsrZY5Tt/4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367677; c=relaxed/simple;
	bh=+2SzLxivGhFqBrX8bsvZmQJd5yk72s22OUKPy3SAaRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwZsXHkD1pK3z14v5ZOi3vTFk8YirwTHCpVFioECxrhDPPjS8XP49+qiTCQl9QqrjPSlagHtrQZAjE1T5A5bn7wjlfuuPadtS1HKHomI+ret5sJxNt439P6VQey8ulQ1P4cKTv0IERlTe+W27ryhVeoKxoYhNsSaF3w7BhYjdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHVsExl5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHVsExl5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5943b62c47dso11583777e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 07:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767367674; x=1767972474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCfIH+GLvYAmxudHmYkUXiS0BYzYkNuhCDwPamlMAv0=;
        b=nHVsExl5Jal/zDCGOAmAuS6cSGnp0UJaFU9DxYYQva6GqTnistIWMqcQ4J3Aa61ra+
         NCSlKOZzZomYYVma10yWlHNlBw5njdRHMFp3E+3/Uo2QN9BH33HX95bvCxckYckVdKWQ
         5/LbMd1QTHPgiJekvyaxCkY7RsNvazcmeyoatCUvsMvHlRHMLuRKvN8HtX5gE9NVEHWU
         X8IOsIjR9PGEM9Mq+HqBamTdAX0WY8Ggsm9C5bVzc0C6JlMiI/L2ks0da/pGhzjaNzUP
         v0k40joLY4fB9GkaVC665ReDwyxOz1pdtyXFU9YFAQQHCyzc3T4Ybggub2TTyok6B1Fd
         lqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767367674; x=1767972474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hCfIH+GLvYAmxudHmYkUXiS0BYzYkNuhCDwPamlMAv0=;
        b=ChOoLw3X74Y+eIK5OqQqSlB0EPj1Xqvj8zkubAAsqsbgzmzWzWudZrnwqJ0rDPfg5S
         xsxroad6uHqSUlk+Ha3QHMzNJWqhGf8e3tT05Yy7uXPg3+kEwvGuBlSoz2Nz5XKfeTAw
         CFZd8eLRyM+QW9xHZSJUHQSJyRPMvr+YY6g3OyrfnMuZAJxIYhVMOQi1SIYHNSV5kgpm
         i1GJ/MQCArd8/WvvzT2WdLAnrLOyPDGGqvUmAjBKWzts5xs77f8I0gWzGs4ZNupank7M
         wRjMQavfpMxwuHeIBNjo1geFMCT7fTbOE7MZovQuT/KFIREOXDzcxCpGx8AC7MKWlzIe
         LNpg==
X-Forwarded-Encrypted: i=1; AJvYcCUlm4QfktLlkXyNDnvc5SL8nb+5s+0yAuTmuPjfOnmDLLmdBc2PZ0S5K9EIvOiM/se4CYZT427EH8O5rTRlOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweKGGLTTNFEjkZ8dhmJ3a/tRqtqinaIbM8znhX2GCumzPQdJV8
	/1NVKuF+rKpDexuW//ED8a3s7+JosG1eSVy8QKbX5aTdlHGKsL9wQbyybNmOePhypADf0s915N6
	Ges2PWox+i1r6I3Gh12T0LVhw0uvEHBY=
X-Gm-Gg: AY/fxX51SB4I62GVuI/6LRC51t8XOLAwRnX4mlJcBveSVGpROc4MT1KbLiXOwDgQNk2
	IXu9bYoSj6QxLRemYAKPz71Ps9zrKgbOb/R4O8pq13GqQxTvLH9+FFT4l7qn9KbxBmWTcC09gvf
	4xUXpPj0OjHpi2+lqN3lcyfW/AYYZtoL86un/af7a9OhhuJ9Y5aFHCJBd/c//6r+P5cirOuf4/s
	yjZrnXz4LPJJyjQTmcYaE4UMyPsO0xx4TpzOP51SCK/6ihJb5niZb0wpB5PGu9qE+KOd+9so5rq
	DEYlL33LqeYnNr8ksNzsHj6cHKO5uejLZ1wxoas3XSi4FIIQgkXs+EDJxp00oprRqoA6UDVENdW
	VKuCLzuob9hhOxOmTop8LqC1ChyKhZuIMXJOEBJXQVjeMCxCDoNT6
X-Google-Smtp-Source: AGHT+IFmb4Th3h9TXjPAP6CEwwsAyzVqpNjeSvQ1idkNniNy1ziqjMgJ6eMZ2bQrwqjlJncIQ1iAToiBLc7uv5pGhyk=
X-Received: by 2002:a05:6512:3503:b0:595:910c:8eeb with SMTP id
 2adb3069b0e04-59a17d41d5amr11732483e87.37.1767367673629; Fri, 02 Jan 2026
 07:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
In-Reply-To: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 2 Jan 2026 10:27:17 -0500
X-Gm-Features: AQt7F2raKKQUVmuoXa1UZBvWm7cggg4OaazH2ki9v0q_-EFU9ml9ZTpHo2_wJAo
Message-ID: <CAJ-ks9m8o7AM_WYjprGwrJc30KCzzY_msvBVavMOieBvfR_iXg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file size
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 3:22=E2=80=AFAM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> From: Jesung Yang <y.j3ms.n@gmail.com>
>
> Use the `cfg_groups` field to aggregate common configurations into a
> single project-level definition. This avoids repeating identical `cfg`s
> across crates.
>
> As a result, the size of the generated `rust-project.json` is reduced
> from 11MiB to 406KiB (about 96% reduction).
>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
> This patch depends on [1] to ensure it merges cleanly without conflicts.
>
> [1] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1=
-def809357b4e@gmail.com/
> ---
>  scripts/generate_rust_analyzer.py | 34 ++++++++++++++++++++-------------=
-
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 6178a53516ec35f308897e65c5001edd81b0d3dd..2a8578fb784d08b2a5e628bfa=
b935080759d2dce 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -19,15 +19,7 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
> -    # Generate the configuration list.
> -    cfg =3D []
> -    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> -        for line in fd:
> -            line =3D line.replace("--cfg=3D", "")
> -            line =3D line.replace("\n", "")
> -            cfg.append(line)
> -
> +def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, k=
ernel_cfg_group):
>      # Now fill the crates list -- dependencies need to come first.
>      #
>      # Avoid O(n^2) iterations by keeping a map of indexes.
> @@ -35,7 +27,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>
> -    def append_crate(display_name, root_module, deps, cfg=3D[], crate_at=
trs=3D[], is_workspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"202=
1"):
> +    def append_crate(display_name, root_module, deps, cfg=3D[], cfg_grou=
ps=3D[], crate_attrs=3D[], is_workspace_member=3DTrue, is_proc_macro=3DFals=
e, edition=3D"2021"):
>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -48,6 +40,8 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
>          }
> +        if len(cfg_groups) > 0:
> +            crate["cfg_groups"] =3D cfg_groups
>          if len(crate_attrs) > 0:
>              crate["crate_attrs"] =3D crate_attrs
>          if is_proc_macro:
> @@ -134,7 +128,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>              display_name,
>              srctree / "rust"/ display_name / "lib.rs",
>              deps,
> -            cfg=3Dcfg,
> +            cfg_groups=3D[kernel_cfg_group],
>              crate_attrs=3Dcrate_attrs,
>          )
>          crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
> @@ -189,7 +183,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>                  name,
>                  path,
>                  ["kernel"],
> -                cfg=3Dcfg,
> +                cfg_groups=3D[kernel_cfg_group],
>                  crate_attrs=3D["no_std"],
>              )
>
> @@ -214,10 +208,22 @@ def main():
>      # Making sure that the `sysroot` and `sysroot_src` belong to the sam=
e toolchain.
>      assert args.sysroot in args.sysroot_src.parents
>
> +    # Generate the configuration list.
> +    cfg =3D []
> +    with open(args.objtree / "include" / "generated" / "rustc_cfg") as f=
d:
> +        for line in fd:
> +            line =3D line.replace("--cfg=3D", "")
> +            line =3D line.replace("\n", "")
> +            cfg.append(line)
> +    kernel_cfg_group =3D "kernel"
> +
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, kernel_cfg_group),
>          "sysroot": str(args.sysroot),
> -        "sysroot_src": str(args.sysroot_src)
> +        "sysroot_src": str(args.sysroot_src),
> +        "cfg_groups": {
> +            kernel_cfg_group: cfg,
> +        },
>      }
>
>      json.dump(rust_project, sys.stdout, sort_keys=3DTrue, indent=3D4)
>
> ---
> base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
> change-id: 20260101-rust-project-reduce-size-d829a7a708ae
> prerequisite-change-id: 20260101-ra-fix-primitive-78154fe8173f:v1
> prerequisite-patch-id: 0544fdf5522949047a81c3580960183375574fd3
>
> Best regards,
> --
> Jesung Yang <y.j3ms.n@gmail.com>

FWIW this was previously sent in
https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-13-40e67fe5c38a@=
gmail.com/
back in April.
