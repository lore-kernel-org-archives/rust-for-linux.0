Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67C22068F
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596637; cv=none; b=F1uIIOZR8oeR9qZoCGG+8HUyM5xjyDy6ttfgVGqOZJ+lwmBIixzaoBkF7IisXHPl4Ok4tzxUsGuuzGv6rb6A0E7TnmY/ZawMzIxSrsVeGwWGAlgGNvsO7Kd92ZQIzf3zAGEjl83gOoKcvkyyh7EGnLtBtxs6cYlr11pOW9NeZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596637; c=relaxed/simple;
	bh=1RkNBJupzvZArqOqWgVZokElFboQ4rTBOglEjr/NA+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+y6/xKAXwpuEsuMIrjTvhHnQrX2ld1A1OW2CBIkWYOPyh5TDa9eeE2SNQR1nQ7buO2gf82qll4RVkz+GY0WIz2uUwtfY5haPiVzMxua8n6JtFoql7ZmEj++MQDlVJbQntJrWXkdtzFoLIgAzQPOBD1iah4m9CtLB3m/1W+KpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPjqJtNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPjqJtNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95182C2BC86
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768596637;
	bh=1RkNBJupzvZArqOqWgVZokElFboQ4rTBOglEjr/NA+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uPjqJtNStfyiyLmJCZNtepHZKxhBRsnjEb+5sZ0qjk/hR/GDb+By/0tYX5NOapxTT
	 JqRLc1wxmRxad/c5HzsdKroFM2Mbj8EQlY02Ce1Gibi/DWbon9t0VQxK3Z12ZpF/t3
	 X7TVMY4H5Mrfm/8CU3Tx9Bc/bDEIgBfOt/zRUwnX88+3YptSz6JYQC3Kl0q9kim6Ga
	 3swMiwIug0Vk/EBnFsRHGOri2vcg0z0g9pmpNkgs456A6Iu+tHFLqrmbf1DE9IDunx
	 Hy9ByJ8ivO+bMUluDvCti776B+YpvaQqh9tWf5NmX55AO9RGp996Eej7XL0O5BAZLO
	 Yy7AwGACO+wXA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fd45a1feso22136651fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 12:50:37 -0800 (PST)
X-Gm-Message-State: AOJu0YxvXbqmWnsAde/Ucrd2ZUX7xQ04g+SvrhFHIqeBEtVaSW4F3Usv
	DQ4ch4zNH6pgcKT/xpjNWMy604SoBBynxqhiqJUUAwYLCpdmx7n5Oi4KRoai3M9N6avLeD/X5oL
	/Tf6dmbQQFlXNQtfd8PRVzfabyIYLMIg=
X-Received: by 2002:a05:651c:325c:b0:383:236:1e0 with SMTP id
 38308e7fff4ca-38384cf0710mr13634171fa.9.1768596636098; Fri, 16 Jan 2026
 12:50:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-rust-analyzer-sysroot-v2-1-094aedc33208@kernel.org>
In-Reply-To: <20260116-rust-analyzer-sysroot-v2-1-094aedc33208@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 15:49:57 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9n7CivAbzx6yhTNw8C5EacQ3VQGF1GVmTHGGf6iTiFabw@mail.gmail.com>
X-Gm-Features: AZwV_QgBheXGFYXDQFHIV9AVLp7wkSHhh-QdjW3LaY2BUZkhEzUaXWZ0ppAZzu4
Message-ID: <CAJ-ks9n7CivAbzx6yhTNw8C5EacQ3VQGF1GVmTHGGf6iTiFabw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Use `core_edition` for all sysroot crates rather than just core as all
> were updated to edition 2024 in Rust 1.87.
>
> Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+")
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Changes in v2:
> - Revert rust/Makefile changes and add Miguel's analysis.
> - Link to v1: https://patch.msgid.link/20260115-rust-analyzer-sysroot-v1-=
1-4de831df234a@gmail.com
> ---
>  scripts/generate_rust_analyzer.py | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 6061bd6e2ebd..187243f7f7a8 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -61,7 +61,6 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>          display_name,
>          deps,
>          cfg=3D[],
> -        edition=3D"2021",
>      ):
>          append_crate(
>              display_name,
> @@ -69,13 +68,37 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              deps,
>              cfg,
>              is_workspace_member=3DFalse,
> -            edition=3Dedition,
> +            # Miguel Ojeda writes:
> +            #
> +            # > ... in principle even the sysroot crates may have differ=
ent
> +            # > editions.
> +            #
> +            # > For instance, in the move to 2024, it seems all happened=
 at once
> +            # > in 1.87.0 in these upstream commits:
> +            #
> +            # >     0e071c2c6a58 ("Migrate core to Rust 2024")
> +            # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
> +            # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
> +            # >     993359e70112 ("Migrate std to Rust 2024")
> +            #
> +            # > But in the previous move to 2021, `std` moved in 1.59.0,=
 while
> +            # > the others in 1.60.0:
> +            #
> +            # >     b656384d8398 ("Update stdlib to the 2021 edition")
> +            # >     06a1c14d52a8 ("Switch all libraries to the 2021 edit=
ion")
> +            #
> +            # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=3D8xCU=
hSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/

Oops, the blank lines between paragraphs should probably begin with
`>` so that it is all one big block quote. Happy to send v3 or let
this happen on apply.

> +            #
> +            # At the time of writing all rust versions we support build =
the
> +            # sysroot crates with the same edition. We may need to relax=
 this
> +            # assumption if future edition moves span multiple rust vers=
ions.
> +            edition=3Dcore_edition,
>          )
>
>      # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
>      # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
>      # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []), =
edition=3Dcore_edition)
> +    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []))
>      append_sysroot_crate("alloc", ["core"])
>      append_sysroot_crate("std", ["alloc", "core"])
>      append_sysroot_crate("proc_macro", ["core", "std"])
>
> ---
> base-commit: 74e15ac34b098934895fd27655d098971d2b43d9
> change-id: 20260115-rust-analyzer-sysroot-5fb95aa985d2
>
> Best regards,
> --
> Tamir Duberstein <tamird@kernel.org>
>
