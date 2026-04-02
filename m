Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488736C9E4
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132589; cv=pass; b=C7wJ5YG8MB9tBBsF5H/AqY9aTy9Z0pzxgGMQdsVyiXfRiIT8YVtiRyx6g+z1WXV7BSWfGU/mAq+sUlMSONnPhtESuGRZvvasRj6lYz6UUAH3+oa6gsPQkwydxKVIEcGaETDdhr/FKrhApesm3ZLYUC3IBxHu1OTc/qMQegIzeMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132589; c=relaxed/simple;
	bh=vNk2YfyFJtojxIBisEYJvJSZYcidlJbrWJ6Lt/aJdPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcdIX7poeBsHWLnuuE37GAIaKbg28MCfbbV+UFx9YeGxk+MGUGYX+6CV9qJgXjlBN1R03HU45+8caG6XNfR69pc+DQVphOzmqUqcWb1Zcfhm6TcicWybMqL6vgdkail5mqXFYFkbP52egeaoSL+IoO/UJLfs10RpU19U0tzFzrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hrzd4OPn; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hrzd4OPn"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d9e22176a7so401073a34.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 05:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775132587; cv=none;
        d=google.com; s=arc-20240605;
        b=j6KqMOyiUfxKUzMREOQk5pI3/aGI8zO0uT8A4wqxRAlApjlxTBqKbBs111AGRwpX5O
         AUDKqCufUrt8LbMUICkZN9lM8NC0D5W4ctua/S56SEB+7T5VQaySBwNwACOGuh3UeuEz
         mjCjF8wJcWwF+R9K1/8WYjkjQNKfnmw+dZ64vUovM/fhx91/G8qAEldWvPjNhpMceWUQ
         FfJvfe75nshZVtb0O4wOVCQNyMgDiPCQbKXbh6nD2c1rHo9op4BGzIaknYl2Skrm/67f
         WFtAo4O1AalSs3ThoZtDZ9mIfUe3+Xw5F9OvlQYTJNWllw504/bHGSwdWAgfHfgo7fw3
         RHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        fh=MUSFiiOucfKztuXSnJ1LjpTScZt2cMkGiQGRhq5+fI8=;
        b=gXQMH5afeRhJuQJQoGLsrKbL9/Q7S8YVDyJVqiLV9tSZyjmKrY/wpYSnYbhcNTdhfy
         fgtHqGXgLTB7UcqxZHDmLaula6kGskS1TFTTACg0PuRfk8XlOGPQD2DGo7MlB4gCDY/F
         gr5b8uSn/FAoVfOo1VMGAk7B7eRttCndzbQs87sPT1abgrSz19tUvB0HTjpcaFQ+KrXK
         wf2haSTrp8CUBwTrCw3sJYUo8aeEBUPTC/W5lwzazsaznnaPSknFjJToOL/J+w9DLBD6
         uG74i/850KCe3LS3PU2rAJrwbEeb4KEVZGYltK89lWFvv1nsQruRuIDUE5AjwuzFq/S5
         5DqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132587; x=1775737387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        b=Hrzd4OPnCkSA+8gtZV1UU9vrVjoUSG/HnE0PDFdRLPVaq9ubJZ+Zp7u6doCdDxhup6
         bW4hSuvpbsFmcTP9DqVMwVLQZyOff46nku4uG27ee4SMPtopmstLs134mcuw1XsdVwH5
         NkoxqJBQK3jTPP64Ygu/hD/XdsDHmGxQoLKO8dcvE/VEQW2IWDX0Y4Yq2IxPSHI2tZ1O
         rZNS4ywdSLI1IcDzwuSTBfDVWQfw0lpECxMtqGKud2uD7e7lVA1bAGuhnJW9NjwC0arJ
         1SGhFy12SleQGb/4gd7izVbM2HssrNOp3H2ZJEagT5TrXvcnAqh8WN0VWrxgL93BOAyk
         sc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132587; x=1775737387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        b=pFVWCaoqws9XGtSpgCEGzw0goiIdNYQEo3vf5iF/lvTyc1Qf0PzpoXb5zRcvqUKin5
         OXbucz1znIizGaSVxEehsWKpv6w2nje/9rg3SY1M+QyMV/h5FOEzgBvCOJIv2O0qyq7b
         mGsuMTuD9X/7pmE5Y3keFZ0LfMly4hvVDZiOJ84m+5C4NJe1yd71RnSX3PaHFeVM7WAy
         0zW/LIBsUmT7JPHIA3HjyQ/myPLR34giEXP0UCgazHsPfcDjkK7+w9huH56jF2U63UKx
         kfwvamY5Ud35PaZCsQq33Eho3oUW93X4qJsadYkR1rUqGB8tmmHTug6VjJPGO4u2tSkp
         zyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGqAoIJZT4mXiM3x/St4kwqfqiQWpNqpyrhFe5sOus+Y3BSAwh/tfOaBw2YE566pn56+ayk5KldydXGVy+6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1MaDPbBdTyUTgFvwn77gYsyv4v8GMrb/A2XuPQjtJyIEo0cf
	JBjRNTNZbgtbC/+dfS9Ys4hlO8+mxKQQcCN7E0ko6cGvrtjQK/BF2rxGGuKTf0CEz6GXB+9/lKQ
	olC8ERW8Z/BgFXr1b3/U5xFX9a9q3u/c=
X-Gm-Gg: ATEYQzzOmGNbtfjUxU8n7uuCdOfvqy6VyNrCnhy/mXxfIOJ+Jyb/suusJdmsPvkmlzV
	ERwCNCJ18QGYHPZNRtft2Yc/63n2slIX4QCvt3JMS8JLG1D01+WSZUwp1EI48BkIJy0kOsz20yX
	GCrUJjc6+mzZQ+oWHNC6dxognHr1Ixv2soK3kvb3UX5V2ryghkyTx6UYoWKyAc30KgskbCSrBy4
	0mZBbSnzYLVmLjcVq0/gjqhDJeW3/1wjAiOE/1XKQLot7sAv4DEW0JBueeSR/KeCBRx1HcZ/Ow+
	/Vh7LLE=
X-Received: by 2002:a05:6820:823:b0:67d:f55b:a992 with SMTP id
 006d021491bc7-680a7e5c101mr1497873eaf.46.1775132586668; Thu, 02 Apr 2026
 05:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com> <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
In-Reply-To: <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 12:22:54 +0000
X-Gm-Features: AQROBzBRNx153WZo64pYdVSefraS_pL90sNsVFLruIpafoMF23s3DRn-0o76Bg8
Message-ID: <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
[...]
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index b4a55344688d..de6ebf14e2b8 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -12,6 +12,12 @@ import subprocess
>  import sys
>  from typing import Dict, Iterable, List, Literal, Optional, TypedDict
>
> +def invoke_rustc(args):
> +    return subprocess.check_output(
> +        [os.environ["RUSTC"]] + args,
> +        stdin=3Dsubprocess.DEVNULL,
> +    ).decode('utf-8').strip()
> +
>  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
>      crates_cfgs =3D {}
>      for cfg in cfgs:
> @@ -69,6 +75,9 @@ def generate_crates(
>      crates: List[Crate] =3D []
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>
> +    def get_crate_name(path):
> +        return invoke_rustc(["--print", "crate-name", path])
> +

Could you add type hints to `invoke_rustc` and `get_crate_name`? You can
run the following command to verify if it's all good:

mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9

Once that's done, for the script part:

Reviewed-by: Jesung Yang <y.jems.n@gmail.com>

Best regards,
Jesung

>      def build_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> @@ -112,23 +121,15 @@ def generate_crates(
>              is_workspace_member=3Dis_workspace_member,
>              edition=3Dedition,
>          )
> -        proc_macro_dylib_name =3D (
> -            subprocess.check_output(
> -                [
> -                    os.environ["RUSTC"],
> -                    "--print",
> -                    "file-names",
> -                    "--crate-name",
> -                    display_name,
> -                    "--crate-type",
> -                    "proc-macro",
> -                    "-",
> -                ],
> -                stdin=3Dsubprocess.DEVNULL,
> -            )
> -            .decode("utf-8")
> -            .strip()
> -        )
> +        proc_macro_dylib_name =3D invoke_rustc([
> +            "--print",
> +            "file-names",
> +            "--crate-name",
> +            display_name,
> +            "--crate-type",
> +            "proc-macro",
> +            "-",
> +        ])
>          proc_macro_crate: ProcMacroCrate =3D {
>              **crate,
>              "is_proc_macro": True,
> @@ -324,16 +325,17 @@ def generate_crates(
>      for folder in extra_dirs:
>          for path in folder.rglob("*.rs"):
>              logging.info("Checking %s", path)
> -            name =3D path.stem
> +            file_name =3D path.stem
>
>              # Skip those that are not crate roots.
> -            if not is_root_crate(path.parent / "Makefile", name) and \
> -               not is_root_crate(path.parent / "Kbuild", name):
> +            if not is_root_crate(path.parent / "Makefile", file_name) an=
d \
> +               not is_root_crate(path.parent / "Kbuild", file_name):
>                  continue
>
> -            logging.info("Adding %s", name)
> +            crate_name =3D get_crate_name(path)
> +            logging.info("Adding %s", crate_name)
>              append_crate(
> -                name,
> +                crate_name,
>                  path,
>                  [core, kernel, pin_init],
>                  cfg=3Dgenerated_cfg,
>
> --
> 2.53.0.1185.g05d4b7b318-goog
>
