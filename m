Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426617CA
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dc2v+PVJ"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5476BF
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 13:39:27 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso2449014f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696624766; x=1697229566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBnY223+UcCK7rzFoc5ulYVlozys8xUWOd34LCUCsy4=;
        b=dc2v+PVJvVr0uoQ1UKJpUoQvg0hKyxhQJnGZOMO31fdSqSocFG5hozuNR+OPpAouoZ
         EslfSr5iHQagc1GQ/3slV9tHwSD4px1Ppk9fOInBW1Yg1uD0Oqoxn4SbEngrmMrupRfq
         8ARNyZh65P7T06uk7eFwWmPmhUq0EBtZq4PmHBDiMGcQm10jqFfHwJSl7H+fZcwPMqgo
         ST5jJO9mRJi8Pl/2L4iLOiPiRp9LihXWTtAD/kLam685elHMJoRbjoQHwxppRwAbwXdU
         NbTYOlzNwhgfpO4hIgNNKqmPZPYAZlxgXpqu/HfGWUJdV0DsWwXTY5SSfjZk6KNwGA0t
         bx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624766; x=1697229566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBnY223+UcCK7rzFoc5ulYVlozys8xUWOd34LCUCsy4=;
        b=MflkGOATl/0YEWbhz36D8TzrpBa2bUeAMLjocjfx0rwPhLkq2P7Ob+a8m6G1+DGQAq
         zEk2z8hmOJ3bmYw4ZeNR06c6Isr+p7p25pPVcxBHhlUGQZh+Yl+Jf9jgHwUjJLF2RjJQ
         2jijJqdd6tUO7hWmNm+P8sUm7Ga80W+0ar/ZdGGP6Wanwo8yMX686Fp5jZIHD4JMCQAz
         uwezL5NJk6fMmzOQeRWhiFm/EFUZk+rbdVcyYgQ3GxSF9K8YnSFVwYLLM4I6faCwz13m
         EWplFIOlbHWhM4ktZySwX7mmgANFiL300UlZJdBON3ajkzXBXBsmqY2ypukLY3xkCDDl
         S2kA==
X-Gm-Message-State: AOJu0YxxEow9l4KP4lxgSfv3ZKJm1zBMYoOwqC6vagHNLBA+EHy3qoeP
	7NQqRNDQZm1s5h5Y7HlYmr4gmFyNygCY5MT5nkWPCQ==
X-Google-Smtp-Source: AGHT+IHzDNuNkLetmngGytv8DBCjIwTFYkdYhI5xAmjMNGnAyOVLiTphU/0Zdm665xGK7Wdop5gObd6L4XgXt6BqlkA=
X-Received: by 2002:a5d:58f2:0:b0:31f:f326:766b with SMTP id
 f18-20020a5d58f2000000b0031ff326766bmr7910442wrd.6.1696624765796; Fri, 06 Oct
 2023 13:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Oct 2023 13:39:11 -0700
Message-ID: <CAKwvOdnWc6b9-XwC56ADXx6K2XCzrUPc_VMsAt=syKsp_b6ZSg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 5, 2023 at 2:41=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
>
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>
> Edited to use escsq in both Makefiles, as per Masahiro Yamada's
> suggestion.

That looks better; thanks Matthew!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>  rust/Makefile         | 2 ++
>  scripts/Makefile.host | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..2ddd821d9435 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FO=
RCE
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>         $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> +               -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +               -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --exter=
n proc_macro \
>                 --crate-type proc-macro \
>                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 8f7f842b54f9..08d83d9db31a 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -91,6 +91,8 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> +                -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +                -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
>
> --
> 2.42.0.609.gbb76f46606-goog
>


--=20
Thanks,
~Nick Desaulniers
