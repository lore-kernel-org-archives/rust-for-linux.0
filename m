Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15991C54EBC
	for <rust-for-linux@archiver.kernel.org>; Wed, 11 Jan 2023 15:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbjAKPXi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 11 Jan 2023 10:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjAKPXg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 11 Jan 2023 10:23:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A451741C
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jan 2023 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673450568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KI0yozfzdsV3itB+vtEutzzJl6QUZ8urWnALQve9kOY=;
        b=fANmiygd3Dp0vlDDUX0ha/c2GaMHafzhd1Q8IfzayJwFVMuEkM5uiM6Il3Um+g1A1iItgg
        EdB8PCsBpx0LxYcvInPkvLXNKVTgesr+wCxmvzE0aCI9z48Gc4tdgEzi+BgqOrz7dWxV16
        VDy8oanjy3ey9PNmZmyU8DlyAPeAqgs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-k2kdrImzPPmgex6cxIqUkQ-1; Wed, 11 Jan 2023 10:22:47 -0500
X-MC-Unique: k2kdrImzPPmgex6cxIqUkQ-1
Received: by mail-ua1-f72.google.com with SMTP id q35-20020a9f37a6000000b005bb2d3a1805so6863633uaq.18
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jan 2023 07:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI0yozfzdsV3itB+vtEutzzJl6QUZ8urWnALQve9kOY=;
        b=lzM6A89l0Wl4YyCMdJ6iVmz55Z6LkqFHMoE8KWLlN0a8RvsHvWG0QiEGz8hyetuEyK
         iaZukSGiq1rAvuB+BaXI6ItV7G7pe4jXfQcIAJJoeHSQ4oLp3cbSaq2/hNowQHYlEf6t
         D8BXFROLjsGJiNaf4nBt5iKPmUU8OtppV+YR09NPSR2NikNPHoPUiNIVERd67Esgrb1K
         CBs4fs79FvdVU74t8WJ2x8AA17E0xqKozLko93BAhwd9ofOrMb+qKetNgBKm7+rsXulC
         0E9VYwNuUEFMhl2hUegE5joErHbiCksk0TM3wi635zK+O3GPUnbT5lnEqv6cmC9gn/Sk
         4u3w==
X-Gm-Message-State: AFqh2kpd1shdriiKrvTS0ToRnDQimKCnHmxF1bVjSioPmFbuVlQMf2nB
        yDKND808LDdcG1ELZjncumMx0ICWEquc92NlDnWdQifGDZw3fcSCEtvHxVkT8W7iVty+l3yFi4B
        RgPMfZ0FzD7ofpgJI1qyolOpWF0biMHDWRlMGoARjcX0=
X-Received: by 2002:a67:f918:0:b0:3ce:97c7:28af with SMTP id t24-20020a67f918000000b003ce97c728afmr4802254vsq.41.1673450565797;
        Wed, 11 Jan 2023 07:22:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjE0S/WV/NDpsMDiI+oAuhiI5nQ2DubTEK2l9K3KdKpW3KjxUumLCHkjWZ99/USIUrU5A+zslosrOkdqj+drg=
X-Received: by 2002:a67:f918:0:b0:3ce:97c7:28af with SMTP id
 t24-20020a67f918000000b003ce97c728afmr4802244vsq.41.1673450565490; Wed, 11
 Jan 2023 07:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20230111152050.559334-1-yakoyoku@gmail.com>
In-Reply-To: <20230111152050.559334-1-yakoyoku@gmail.com>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Wed, 11 Jan 2023 15:22:29 +0000
Message-ID: <CAOgh=FxQQ6o6+JS5DaXu=SPyYssXTXgt4+njvnZ5b0msKj5c_w@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: Exclude Rust CUs with pahole
To:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Neal Gompa <neal@gompa.dev>, bpf@vger.kernel.org,
        rust-for-linux@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 11 Jan 2023 at 15:21, Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Version 1.24 of pahole has the capability to exclude compilation units
> (CUs) of specific languages [1] [2]. Rust, as of writing, is not
> currently supported by pahole and if it's used with a build that has
> BTF debugging enabled it results in malformed kernel and module
> binaries [3]. So it's better for pahole to exclude Rust CUs until
> support for it arrives.
>
> Link: https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=49358dfe2aaae4e90b072332c3e324019826783f [1]
> Link: https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=8ee363790b7437283c53090a85a9fec2f0b0fbc4 [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/735 [3]
>
> Co-developed-by: Eric Curtin <ecurtin@redhat.com>
> Signed-off-by: Eric Curtin <ecurtin@redhat.com>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

I think this should be able to cover all the quirky build techniques.

Tested-by: Eric Curtin <ecurtin@redhat.com>

> ---
> V2 -> V3: Enable pahole option upon comparing with version 1.24
> V1 -> V2: Removed dependency on auto.conf
>
>  init/Kconfig            | 2 +-
>  lib/Kconfig.debug       | 9 +++++++++
>  scripts/pahole-flags.sh | 4 ++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 694f7c160c9c..360aef8d7292 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1913,7 +1913,7 @@ config RUST
>         depends on !MODVERSIONS
>         depends on !GCC_PLUGINS
>         depends on !RANDSTRUCT
> -       depends on !DEBUG_INFO_BTF
> +       depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
>         select CONSTRUCTORS
>         help
>           Enables Rust support in the kernel.
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index ea4c903c9868..d473d491e709 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -364,6 +364,15 @@ config PAHOLE_HAS_BTF_TAG
>           btf_decl_tag) or not. Currently only clang compiler implements
>           these attributes, so make the config depend on CC_IS_CLANG.
>
> +config PAHOLE_HAS_LANG_EXCLUDE
> +       def_bool PAHOLE_VERSION >= 124
> +       help
> +         Support for the --lang_exclude flag which makes pahole exclude
> +         compilation units from the supplied language. Used in Kbuild to
> +         omit Rust CUs which are not supported in version 1.24 of pahole,
> +         otherwise it would emit malformed kernel and module binaries when
> +         using DEBUG_INFO_BTF_MODULES.
> +
>  config DEBUG_INFO_BTF_MODULES
>         def_bool y
>         depends on DEBUG_INFO_BTF && MODULES && PAHOLE_HAS_SPLIT_BTF
> diff --git a/scripts/pahole-flags.sh b/scripts/pahole-flags.sh
> index 0d99ef17e4a5..1f1f1d397c39 100755
> --- a/scripts/pahole-flags.sh
> +++ b/scripts/pahole-flags.sh
> @@ -19,5 +19,9 @@ fi
>  if [ "${pahole_ver}" -ge "122" ]; then
>         extra_paholeopt="${extra_paholeopt} -j"
>  fi
> +if [ "${pahole_ver}" -ge "124" ]; then
> +       # see PAHOLE_HAS_LANG_EXCLUDE
> +       extra_paholeopt="${extra_paholeopt} --lang_exclude=rust"
> +fi
>
>  echo ${extra_paholeopt}
> --
> 2.39.0
>

