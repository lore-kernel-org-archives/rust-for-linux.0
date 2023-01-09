Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3691C5479D
	for <rust-for-linux@archiver.kernel.org>; Mon,  9 Jan 2023 20:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237657AbjAIU4g (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 9 Jan 2023 15:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbjAIUz5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 9 Jan 2023 15:55:57 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021BF8B526
        for <rust-for-linux@vger.kernel.org>; Mon,  9 Jan 2023 12:54:36 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 36so6742282pgp.10
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Jan 2023 12:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCpbMmW0eLev9FdtuyFUocFIcOdmXfyBWebTqFK5CIA=;
        b=h4agD+4jNY3gjy2SULguao1y1SDRTBALR9O8Bjx0eLoYRsDA2ETD9q9AMY5zysnq+q
         6GujFw61YQklfxifLoM25/Qx27WxO+muJS7gQ2/y584ocSmZlbkb+YerHNikmmopMt8Q
         8rlV/PMlrHVvPBQwSUX45mQgkl/lnEsPItg7VmFwxpKVkQ0wxzMolPIiKpSrMm9vWf91
         BdnidegVeoi+AAnpJEtgYYuR8Hj6cvvQ4gLOYJJiMwV7jAU647pgrMmjixSWC4tlr/XH
         6G2iG/BNRvOLrlnG/a3jkymflXl2P3YV8Dio+cecoWhApoEiT0ZHCb/LmhkfF6l0Q1eF
         Zn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCpbMmW0eLev9FdtuyFUocFIcOdmXfyBWebTqFK5CIA=;
        b=4I+vOKq2kBgfl6T0cSSDkJWlx528GPpCsv1jQb64GrFbKGJIAuj+Gu9IPG7DKcofBx
         4ld21psou4XAYZDajhHhkuCTmZhIMlfCDCCfVIC06Bt9MOBR9XrIsX3I20HTvos+SLA7
         d4YhO/zQuDjLPopHOoG9Kk4dlNvXkghEJPsjQFW4ITI1ssfVjWpUMHvpmXNeEXj4gbwd
         8rGQyLPZoJqwLoFtmi1VSbunhJX1G5KCv4F1ydWvoxIzMRQD8+COdluznQVTQVfL8djD
         g2O+WaRkTVdtKf6b2ygTVR8/8X3BdTWSP3Xq5AUU8caMcK4sOIMZ7Gh7cCz0GpfGvCuu
         KuuA==
X-Gm-Message-State: AFqh2koIFWSXnI3Gpd/mlCQFxKUKpbkoOmBNNEpX5HHrrvfI6n+LsH3T
        Fj/oK99GDjHIlFKVtFMxHnpbXZoS4lD55nEOI8vDgA==
X-Google-Smtp-Source: AMrXdXtJwhfbhqPtlK+wteYA6wJbhqZXNYUZFPHzEbZJNaISXYOe+1yfLa+PUkvrtxjs8n0M+KBV1ndODf+qq8fq670=
X-Received: by 2002:aa7:914e:0:b0:578:202d:a33a with SMTP id
 14-20020aa7914e000000b00578202da33amr3345635pfi.23.1673297676007; Mon, 09 Jan
 2023 12:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20230109204520.539080-1-ojeda@kernel.org>
In-Reply-To: <20230109204520.539080-1-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 12:54:24 -0800
Message-ID: <CAKwvOdkr6mAdNOkZqGdkosAN6JABHRU3bHg=K8ujjbw2GxEsKQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] docs: rust: add paragraph about finding a suitable `libclang`
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jan 9, 2023 at 12:45 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Sometimes users need to tweak the finding process of `libclang`
> for `bindgen` via the `clang-sys`-provided environment variables.
>
> Thus add a paragraph to the setting up guide, including a reference
> to `clang-sys`'s relevant documentation.
>
> Link: https://lore.kernel.org/rust-for-linux/CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This is super helpful for me, since I build clang from source and
would like to use my libclang.so! Thanks for this documentation
Miguel!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Documentation/rust/quick-start.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index 13b7744b1e27..cae21ea7de41 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -100,6 +100,23 @@ Install it via (note that this will download and build the tool from source)::
>
>         cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
>
> +``bindgen`` needs to find a suitable ``libclang`` in order to work. If it is
> +not found (or a different ``libclang`` than the one found should be used),
> +the process can be tweaked using the environment variables understood by
> +``clang-sys`` (the Rust bindings crate that ``bindgen`` uses to access
> +``libclang``):
> +
> +* ``LLVM_CONFIG_PATH`` can be pointed to an ``llvm-config`` executable.
> +
> +* Or ``LIBCLANG_PATH`` can be pointed to a ``libclang`` shared library
> +  or to the directoy containing it.
> +
> +* Or ``CLANG_PATH`` can be pointed to a ``clang`` executable.
> +
> +For details, please see ``clang-sys``'s documentation at:
> +
> +       https://github.com/KyleMayes/clang-sys#environment-variables
> +
>
>  Requirements: Developing
>  ------------------------
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
