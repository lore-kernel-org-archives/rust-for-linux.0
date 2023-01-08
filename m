Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9D7C54EBE
	for <rust-for-linux@archiver.kernel.org>; Sun,  8 Jan 2023 15:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbjAHPTI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 8 Jan 2023 10:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbjAHPTH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 8 Jan 2023 10:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E906D60E2
        for <rust-for-linux@vger.kernel.org>; Sun,  8 Jan 2023 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673191099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EPjethgfbpXdoRd0XcBNPqRZDZHvORJ5WlXtoiZqGUc=;
        b=TIqzD15Sz/YmSo6ZiKCBD7lhIXiz/VX4KHAfQVuj26zt1/6ET2VRRNklxxQH0oHQQFCz7L
        IhM4h35BdvsYk3MPMDrhIWj1E4MkV/76nrDTpkVcN3PR3xLiIuoKneA8TR16PzKlunl264
        KIEVnPzLL96WoVIH9VjrnU8BmN1nrak=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-JcUcTvsgMvKKVuEuyJNLAA-1; Sun, 08 Jan 2023 10:18:18 -0500
X-MC-Unique: JcUcTvsgMvKKVuEuyJNLAA-1
Received: by mail-ua1-f69.google.com with SMTP id q35-20020a9f37a6000000b005bb2d3a1805so3055846uaq.18
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Jan 2023 07:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPjethgfbpXdoRd0XcBNPqRZDZHvORJ5WlXtoiZqGUc=;
        b=PT2v3jOSjI90UHaOXTFRV07pTSmK2/eOZFV7L8bKvjjuBo2zRQavaeMTh+7TnYDQZL
         yrGmAutHQTK5hwpLdJWEfTLYBgqnkKUAfZ8YoAqs/JTj5X6WsvGobxsitvE+NeZsNNkp
         XO4E2KAoRf4JqwMflMBGG15EUmFjtjb7kwVxabT6yij8/JVIQvMseMgZE92iLukJu6hS
         Dpz4MZDX/xknt20hi9JLQ3HWub+TU//KcDP56WmxjgJ3SC/haD8+jdnanQgSNAJEZt7G
         5yMUGlxgIS053ozZlkTK8xoFKV6hr1kXkoMXXCo7q8hHhd5VMlrZD0iyWOA5EPUau7b7
         T4Bg==
X-Gm-Message-State: AFqh2krB3sTP0k1ysBeXa8zlJhp3LyUOQxbuRWjEktv9jmIw+hEsOFDC
        19zvSWZRb1jL0yxuVIYF1LMr2vxM5cZiiFrzKSAlNJTA7y07a/B31TsZ786No6IYvbrxbVM7Vki
        Ro1gfvQBkl/27HbDOuHF2zqm/ZRWhUOnFyuRkRfJfr94=
X-Received: by 2002:a05:6102:cd4:b0:3c8:92b3:7a28 with SMTP id g20-20020a0561020cd400b003c892b37a28mr8001453vst.13.1673191097006;
        Sun, 08 Jan 2023 07:18:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5uPF/b7nQYydA6iJsSIN/vLj3t+rmsB67d7rcUj743rnIxdOe6LNBEQfGJwF2XY2FZzdDep8AFEmkHmX2BdE=
X-Received: by 2002:a05:6102:cd4:b0:3c8:92b3:7a28 with SMTP id
 g20-20020a0561020cd400b003c892b37a28mr8001446vst.13.1673191096800; Sun, 08
 Jan 2023 07:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20230108021450.120791-1-yakoyoku@gmail.com>
In-Reply-To: <20230108021450.120791-1-yakoyoku@gmail.com>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Sun, 8 Jan 2023 15:18:01 +0000
Message-ID: <CAOgh=Fzc3_bCLCKE+6KVzyMbBUOcQ_s9ef6Rw33amD5+yu-_WA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Exclude Rust CUs with pahole
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

On Sun, 8 Jan 2023 at 02:15, Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Version 1.24 of pahole has the capability to exclude compilation units
> (CUs) of specific languages. Rust, as of writing, is not currently
> supported by pahole and if it's used with a build that has BTF debugging
> enabled it results in malformed kernel and module binaries (see
> Rust-for-Linux/linux#735). So it's better for pahole to exclude Rust
> CUs until support for it arrives.
>
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>
> Tested-by: Eric Curtin <ecurtin@redhat.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Tested-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> ---
> V1 -> V2: Removed dependency on auto.conf
>
>  init/Kconfig              | 2 +-
>  lib/Kconfig.debug         | 9 +++++++++
>  scripts/Makefile.modfinal | 4 ++++
>  scripts/link-vmlinux.sh   | 4 ++++
>  4 files changed, 18 insertions(+), 1 deletion(-)
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
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 25bedd83644b..a880f2d6918f 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -30,6 +30,10 @@ quiet_cmd_cc_o_c = CC [M]  $@
>
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
> +ifdef CONFIG_RUST
> +PAHOLE_FLAGS += --lang_exclude=rust
> +endif
> +
>  quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o +=                                                   \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 918470d768e9..69eb0bea89bf 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -122,6 +122,10 @@ gen_btf()
>                 return 1
>         fi
>
> +       if is_enabled CONFIG_RUST; then
> +               PAHOLE_FLAGS="${PAHOLE_FLAGS} --lang_exclude=rust"
> +       fi

If it was me, I would do things more like v1 of the patch (instead
just checking pahole version), because this is the only flag set in
scripts/Makefile.modfinal, which is a little confusing and
inconsistent. It's ok to set --lang_exclude=rust in all cases, as long
as pahole_ver is recent enough.

+if [ "${pahole_ver}" -ge "124" ]; then
+       # see PAHOLE_HAS_LANG_EXCLUDE
+       extra_paholeopt="${extra_paholeopt} --lang_exclude=rust"
+fi

But I'm not too opinionated either on this so...

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

can be reapplied. I'm gonna test this again to see if it works in a
Fedora Asahi rpm build.


> +
>         vmlinux_link ${1}
>
>         info "BTF" ${2}
> --
> 2.39.0
>

