Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA80339A5
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 19:44:28 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93329C
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 12:44:26 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7a7e11a53c3so105628241.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695152666; x=1695757466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiKc36SyKHESSsQhenaXrpw2Mp7z+R70C2lZ6X9q9Pg=;
        b=c/eClF5eozlmFoLiWQEOaPfhBFu/BJGgBqJAjp6ENFSQHogFLXbBxMFIOaBvsFXutQ
         YgN1iwYlLg1xGqGkN4BQE45OBUjpZflQvqBGNf1O+7O+35R51Sx/Sszv3pqBwWOcKmfd
         nwYad5nsg6GcA/O/z6FY3/iEpqoYnpcvGKx1yB3IkWNoSV4aVF9/QYU4XnbQiQDP/Z81
         cRRWnaWmR/CySN3TcfyaZdCqiFuOyfYjgCQe7TTWJcfbby6PD+rgjgXVdncMhK/MM8nn
         VWbS7bwQfyq7pAbSMlzmD2k0y4ZiXzUVBBX6Kcrhi5lKrNe7lRuwVo1bfiUi0HqXL2Qm
         5iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695152666; x=1695757466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiKc36SyKHESSsQhenaXrpw2Mp7z+R70C2lZ6X9q9Pg=;
        b=NdK87/Bq4SK8gmSP6OLzYNBiRUL9xxsRClDWKwCpyLTRnzxRbdk00f1Mt+ig6ke1uI
         B0x6aEKlZ4wpIeQvLJJEaRwBkE9g0Jvb3FWDlZBicZnWwJ7EsLoaM7iIAKD6/D/Q5g5S
         B3A59lVdGfDX/FlkuXDXocY9YGeL3v6PFFoI/3ELOK6kFWsQfkuV/whvlyHJH3QRwlVb
         kIGAhhZ67eQdtaBrcFHGAROtSiRIErf0qjSx14G5F369gZXmJ1+MZF/RqF+jlTp0cH0H
         iQpkK9fKZhnjSnhVhbpoX45ce9LVwLWzubNf+QlvNqfaEaRAsTxB6Hglb+8JWcIa250j
         ms5g==
X-Gm-Message-State: AOJu0Yxw61kP+DG/tyd5G1wkLdkRqJutA3doJRYIpYrnm2+KttTNPP2B
	dZu8v4Y7HH2y7kXaYpFSKtTK79EmSjH5peT8jRd72g==
X-Google-Smtp-Source: AGHT+IGBVHqkqtQlPF8qBlSmXV3/FZ7czBxLNbksB4YaG/ipYuIEVUvfF2iODtAvNpAGbyZoSFERxdqT4Ark6Z02HVk=
X-Received: by 2002:a05:6102:1522:b0:452:6834:b8f6 with SMTP id
 f34-20020a056102152200b004526834b8f6mr2060855vsv.3.1695152665688; Tue, 19 Sep
 2023 12:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230918234412.363087-2-mmaurer@google.com>
In-Reply-To: <20230918234412.363087-2-mmaurer@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Sep 2023 12:44:14 -0700
Message-ID: <CAKwvOdmsNwszu4Vk1K7e39hencNcjEmjr5q7EbTJCjdY5TDsFA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 4:44=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
>
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>
> Updated the patch to reflect Nick's comment that KBUILD_HOSTLDFLAGS
> should be respected as well.
>
> I did not switch it to use HOSTLD for two reasons:
> * That variable is not globally defined - it is only available in two
>   subdirectories of tools/
> * C host scripts are linked by HOSTCC as well, even when linking a
>   collection of object files. It *prints* HOSTLD, but invokes HOSTCC.
>   See scripts/Makefile.host cmd_host-cmulti for an example.

Sure, that makes sense to me, thanks for pointing that out.

>
>  rust/Makefile         | 4 ++++
>  scripts/Makefile.host | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..b60b7eb8c5a0 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -380,9 +380,13 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings=
.o FORCE
>  $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
>         $(call if_changed,exports)
>
> +KBUILD_HOSTLDFLAGS_SQ =3D '$(subst ','\'',$(KBUILD_HOSTLDFLAGS))'

I don't think we need to do this kind of escaping. If a linker flag is
passed to the linker directly as the driver has spaces such as `-z
relro`, if it is instead passed to the compiler as the driver will not
contain spaces (`-Wl,-z,relro`). As such, I don't think we need this
escaping (famous last words).  Mind submitting a v3 without it?

> +
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>         $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> +               -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +               -Clink-args=3D$(KBUILD_HOSTLDFLAGS_SQ) \
>                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --exter=
n proc_macro \
>                 --crate-type proc-macro \
>                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 8f7f842b54f9..dc0410cae5ca 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,10 +87,14 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
>
> +KBUILD_HOSTLDFLAGS_SQ =3D '$(subst ','\'',$(KBUILD_HOSTLDFLAGS))'
> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> +                -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +                -Clink-args=3D$(KBUILD_HOSTLDFLAGS_SQ) \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
>
> --
> 2.42.0.459.ge4e396fd5e-goog
>


--=20
Thanks,
~Nick Desaulniers
