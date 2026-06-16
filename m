Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055A361DCB
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613682; cv=none; b=XbEji3ABYMOh7gSgzUts5J7tbqQpOIPoBU4Duwcz7aGOT9RHJ36RoWWHGStmO/aKGEQc0NThRBDwe+q8pSMCm6pBNvFbwn6UFTzcXp8uGyjYnfgMA/B1vQEgsP+5AthMY6wgy6sPz/Y/1JcTp9bgIRGaFsU/xauPNtzqU723b3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613682; c=relaxed/simple;
	bh=rSAH4O+tZcqeOkqF3iQTYI28bq9NtT1SGbjApEm24YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7dHF3sylkB050MuUKIP6X8jRqFdyPJ4etyayHDW9lml4PYxICnRBnS/6jGVbF0/aMndncxR88rsB1MmXBxVnQOCm/A9US0jrWbdVxfV8Odbm78FaX5B2zMd8vsYqUhQb4l3cEiIWxPjqJki6Lg4eLcYY8rz+8K8cKH086jPASo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBjAT3c9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBjAT3c9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231A71F00A3A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781613680;
	bh=TSGXtFXwrd/juHF9iDmBndNScmq3rco7nSKLDRyMox4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dBjAT3c9/qOZ/eszLnDjVaLz8Z/397w+AM0esLNk8MMQ1vYOdDScwiU2XmVZCEzNQ
	 E8COqnkrn/hyprXp2nuJKdSlC0djIHoRcu2i9w79Nbeq/mdTP1QGzy8aQQsxCpVrt7
	 si/F2P/XTDxqchQvQ9C8gWbAG0Knw1vM4wp2h/GLRbHBflMcKQjEKfP4SAIc+LlQyP
	 prjUjfis2EiLS+kt+nIwU2LjtLwlpwiWXVA13+jtwlfJeqQnP+KlWfh46t8ScIlFLH
	 Pi3lYDOWtQku0EtLv3XzlL96ljiiskF/OO/IMe9J3TOZMW5SsjDJr1MBEp7T6E5o5p
	 R5MBPDfW9UsFQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa63628d26so4389901e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 05:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iBAGwfpDH7Qf0Dufvl/rUZTumFSHOE3ej+O4KueuqDIxhVJYNNEQmze3E0DzyKVau+bJcgoDlQtBD0JjXbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWOEw4DibD7tvKaun5aN2RFwr/W+gH4HCx9b7xH5iJPHi2i+y
	bOiSDTjs5rHuPYlsF9Plymzk7YEb9DUWrFnfwEGRRIC2VmcY9O9T8A7YeYdp/nUpIPMUA9tqaPr
	3DQAxnNNYK8SxmcrE5c4R03dESnXZJjs=
X-Received: by 2002:a05:6512:65ca:b0:5aa:7126:c637 with SMTP id
 2adb3069b0e04-5ad30d994c0mr2641108e87.1.1781613678820; Tue, 16 Jun 2026
 05:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-rust-kbuild-replace-procmacro-extension-v1-1-cad72998faee@fritz.com>
In-Reply-To: <20260616-rust-kbuild-replace-procmacro-extension-v1-1-cad72998faee@fritz.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 16 Jun 2026 05:40:42 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9kk2kQ0JVf3deTtCqGnp_MFTTRxecAwFWe5H6FBHrA-tg@mail.gmail.com>
X-Gm-Features: AVVi8CeHH7uUaOI6yXiAq2aRJmCNHDiUeQZZ8daZnAhd3q69LcW1L9DK3LXKyfA
Message-ID: <CAJ-ks9kk2kQ0JVf3deTtCqGnp_MFTTRxecAwFWe5H6FBHrA-tg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 7:26=E2=80=AFAM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Use make's $(suffix) function [1] and substitution reference [2] instead
> of $(patsubst) to extract crate names for rust procmacro targets.

The implementation uses `$(basename)`, not `$(suffix)`. Please update
the commit message accordingly. Link [1] can remain, since it
documents both functions.

Otherwise this looks good to me.

> As
> there is only one user of the procmacro-extension variable, do the crate
> name extraction in-place and remove procmacro-extension.
>
> The procmacro-extension variable is used to record the binary file
> suffix of dynamically loadable rust libraries -- which is 'so' on Linux
> and others and 'dylib' in MacOS -- to remove that very suffix from a
> target file name for reconstructing the corresponding crate name in
> cmd_rustc_procmacro.  Extracting the crate name from the target name
> in-place is shorter and reduces complexity.
>
> Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functi=
ons.html # [1]
> Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Ref=
s.html # [2]
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> ---
> Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=3D6AUp5mcDJVni80O=
RQr0AQ-4uCZaE+CzB5kV=3Deg@mail.gmail.com/
> ---
>  rust/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 63b1e355321d..30f882ba7620 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -50,7 +50,6 @@ endif
>  ifdef CONFIG_RUST
>
>  procmacro-name =3D $(shell MAKEFLAGS=3D $(RUSTC) --print file-names --cr=
ate-name $(1) --crate-type proc-macro - </dev/null)
> -procmacro-extension :=3D $(patsubst libname.%,%,$(call procmacro-name,na=
me))
>
>  libzerocopy_derive_name :=3D $(call procmacro-name,zerocopy_derive)
>  libmacros_name :=3D $(call procmacro-name,macros)
> @@ -598,7 +597,7 @@ quiet_cmd_rustc_procmacro =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET))
>                 -Clink-args=3D'$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' =
\
>                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --exter=
n proc_macro \
>                 --crate-type proc-macro -L$(objtree)/$(obj) \
> -               --crate-name $(patsubst lib%.$(procmacro-extension),%,$(n=
otdir $@)) \
> +               --crate-name $(basename $(@F:lib%=3D%)) \
>                 @$(objtree)/include/generated/rustc_cfg $<
>
>  # Procedural macros can only be used with the `rustc` that compiled it.
>
> ---
> base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
> change-id: 20260611-rust-kbuild-replace-procmacro-extension-22c459a24382
>
> Best regards,
> --
> Nicolas Schier
>

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Tested-by: Tamir Duberstein <tamird@kernel.org>
