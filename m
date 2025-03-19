Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816A2147F8
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419540; cv=none; b=YXZ/FZQ4IDblqvPYYk3+zvt9BoVGDaWnx5rc5JJzsHkEtFiA/yzE0Bi+cLUORORlXHjEzIXGUEnfvtS7FpjpcgnxV3FkpCz2W7L2lVKilWEat8a/zWI5tE4DfTXxWcZZl59Kz68bgJpdFahTaorhhEWDksZlowiLuQDMj2se+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419540; c=relaxed/simple;
	bh=Ig+u3+/ODh1zv/iOoK5g+sng3bQakePW+dvgzLUnOt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Om07aSDgD384WH+twrUVFi26EbaCoSenoeTbee1XyioBNw/0017/CnJo4xNci4KTfZyDxz/COQgdQVcGodq9XF6/ziOEFspLyVXTGfjeG+4Lht+uYmUCravp93CS8v24Q5TqQoKSfQ90Pr/kzV5Xl4x9+9DgNkEafALFfQBo2BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=hVoPv3Zh; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="hVoPv3Zh"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so51282276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 14:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1742419538; x=1743024338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTbmtHo1Thm56e4q0jzRdOqtoitf0AMwi3Ow1DlWGCA=;
        b=hVoPv3Zhn3V5Iu/H/jMc8b3B3e/C2VmH0CGFrwNIlWclow4ELQ8VAActtydqnXKKl8
         PjEPoH+LZzpEIAWZRyD9T6wqQts3Eqqe4FPZkoyeCt6+TNQzZ4+EtP+PU66X44NPUyMH
         wq4FYhnnSNFeU+I9vPwCNcHW+N6VUPJTdFDnCAZiulKxavW+LecwGsslso7pZvFx4LXv
         NKRO3tkBpNEJSAv8WdeJE7eLpSX8QgXnHeN8aNgvD2od9+R3u6RkHLBV5tRTcN1qkIt6
         sn51MhF0mrFC3mAd+lpQgxgI82rUJ0TyVUapETNzU/DLWq6iV4BvI2heZa4Jq139A7tR
         RMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419538; x=1743024338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTbmtHo1Thm56e4q0jzRdOqtoitf0AMwi3Ow1DlWGCA=;
        b=Ubr4HltFu7lQQe3PGYsXJkIMdmaE6tRa04miQoY1ryFeOgJ13h5hPfH6jgO2Kq/z7g
         OUKP14TfdzPN3k7DJ7JJ2z+JyZ438fFhNR8gutE5PI1i2K1J6Qob8soQy9ZCzyi871mA
         FAdjH3DlcQz7NDNjRvZWdzvWucnHjclIcBt5ZyaHIyM3Sg9QkCXYM9qRxUG9MhzRrigZ
         Aw+huZVpL8AmTH55UVw8azFyok82mMq7sENTzYXA7JeH3HKnZjfSQOUcWW5JTk8cpmTF
         aT1+NWEm/5p5SqwEuE20eEI/yagX8rqOaVEZugfmn9R9e9/MeaCc2J0IKk5+FvP6bomx
         ozeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqis9w5dmgrctvXrNdH9f7RNqRsL7XisCbH3xPT1TNnN84Wx/nTDNEDDdQaMKjQH17uip86eEHpxwji5ZVCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/C6HASXjd/xhWXLGXTQM3RzTgk5mTGyhVR3xpSKDR5pmC2S7
	a98bswbFksldurGWUY+SplTOJ+xdS4gPmQ6F1mUoAZIq2mm7/k3dszkP5IbVUXuUsO39APPiEHK
	kX/HZx/dxRz+PbiJqiXyaZw/ydCTFCG8UbnvwJw==
X-Gm-Gg: ASbGncvAAEgoybW0uKdrc3U2O6Ge1c6hlEsWo/x1tPrw0N0BfceXqlZufCeEZ1erxQ0
	nUjmT7cDKBbwORNw218xL5aSqmk+QAS/BKsG3/nwKQPoJkpHmZqqpCoim/ywD4UXr+gTgeOVMdv
	2zFbsqq21wBoVWfJnByIpGU8G5GQ==
X-Google-Smtp-Source: AGHT+IFi4VMgQLi3VrPRHvSwakwOVMTuBghiBBQ0FKIpksWR7DcB6Pqm4wfGamlJxEPu7n5pY/3dKECkoghEmdtPYlA=
X-Received: by 2002:a05:6902:260e:b0:e63:d13e:80e3 with SMTP id
 3f1490d57ef6-e6692011550mr1142828276.16.1742419537761; Wed, 19 Mar 2025
 14:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-rust-analyzer-host-v2-0-30220e116511@gmail.com> <20250311-rust-analyzer-host-v2-4-30220e116511@gmail.com>
In-Reply-To: <20250311-rust-analyzer-host-v2-4-30220e116511@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 19 Mar 2025 17:25:00 -0400
X-Gm-Features: AQ5f1JoQoPFI4tqgz9Rnx-JZePGWLp-lMPL_KZCP-adAcUqFFKl60CdkmZ12Khw
Message-ID: <CALNs47tKdnJ1rcC7pAqnxrppQWK4iQpXr3u4n38-RbSDi75yVg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] scripts: generate_rust_analyzer.py: add type hints
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 9:18=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Python type hints allow static analysis tools like mypy to detect type
> errors during development, improving the developer experience.
>
> Python type hints have been present in the kernel since 2019 at the
> latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
> running KUnit tests").
>
> Run `uv tool run mypy --strict scripts/generate_rust_analyzer.py` to
> verify.

From the discussion, it may be better to instead mention the direct
invocation (without uv).

Could you also mention the target min version? Since apparently the
kernel has a spread. It looks like maybe 3.8 based on what is used
here.

> This removes `"is_proc_macro": false` from `rust-project.json` in
> exchange for stricter types. This field is interpreted as false if
> absent[1] so this doesn't change the behavior of rust-analyzer.
>
> Link: https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa=
1f08404269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1=
]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 130 ++++++++++++++++++++++++++++----=
------
>  1 file changed, 96 insertions(+), 34 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 7e78b926e61f..c73ea8d116a4 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -10,8 +10,10 @@ import os
>  import pathlib
>  import subprocess
>  import sys
> +import typing as T

Nit: is there any need to keep everything namespaced? I think it
should be fine to import `Iterable` `TypedDict` etc directly since
they aren't confusable.

Same for `pathlib.Path` since there is no other `Path` (some of that
is preexisting).

> +    def append_proc_macro_crate(
> +        display_name: str,
> +        root_module: pathlib.Path,
> +        deps: list[str],
> +        cfg: list[str] =3D [],
> +    ) -> None:
> +        append_crate(display_name, root_module, deps, cfg)
> +        proc_macro_dylib_name =3D subprocess.check_output(
> +            [os.environ["RUSTC"], "--print", "file-names", "--crate-name=
", display_name, "--crate-type", "proc-macro", "-"],

Nit, may as well use this opportunity to wrap the line.

> +            stdin=3Dsubprocess.DEVNULL,
> +        ).decode('utf-8').strip()
> +        crate: ProcMacroCrate =3D {
> +            **crates[-1],
> +            "is_proc_macro": True,
> +            "proc_macro_dylib_path": f"{objtree}/rust/{proc_macro_dylib_=
name}",
>          }
> -        if is_proc_macro:
> -            proc_macro_dylib_name =3D subprocess.check_output(
> -                [os.environ["RUSTC"], "--print", "file-names", "--crate-=
name", display_name, "--crate-type", "proc-macro", "-"],
> -                stdin=3Dsubprocess.DEVNULL,
> -            ).decode('utf-8').strip()
> -            crate["proc_macro_dylib_path"] =3D f"{objtree}/rust/{proc_ma=
cro_dylib_name}"
> -        crates_indexes[display_name] =3D len(crates)
> -        crates.append(crate)
> +        crates[-1] =3D crate

The unpacking is a bit confusing here, can `crates[-1]` just be set
rather than duplicating and replacing it?

Maybe the body of `append_crate` should be `build_crate(...) -> Crate`
(which could then be a top-level function), then `append_crate`,
`append_crate_with_generated`, etc call that and handle modification /
appending themselves.

> +        crate: CrateWithGenerated =3D {
> +            **crates[-1],
> +            "source": {
> +                "include_dirs": [
> +                    str(srctree / "rust" / display_name),
> +                    str(objtree / "rust")
> +                ],
> +                "exclude_dirs": [],
> +            }
>          }
> +        crates[-1] =3D crate

Same note as above regarding rebuilding the last item.

- Trevor
