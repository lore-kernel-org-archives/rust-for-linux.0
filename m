Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05681C38142
	for <rust-for-linux@archiver.kernel.org>; Wed,  1 Feb 2023 09:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjBAJ7N (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 1 Feb 2023 04:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjBAJ7M (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 1 Feb 2023 04:59:12 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BBB2CFE7
        for <rust-for-linux@vger.kernel.org>; Wed,  1 Feb 2023 01:59:11 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p26so38533194ejx.13
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Feb 2023 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1SL9T3aYS6IFbexB1JuHREwm+6T3mP2MZTJ1gO4rfD8=;
        b=JLMtddu8szNLSJZLkW9ydSH98s7vymptf8mo+LrPH+7xSLZs7MWOHlZpVOuapE6pne
         +n0FVXyXbBJ372+UrAdqSAELmVDfie7c1OcvIRosaZF8sYjjygjN2gDMde5p8R5zrryt
         8xMy5OAdjPU3KMPDvE2Nj7b9Fj8fyp/ikHGD79pOiVokqUsYifCjW+y7k5utHkUa8aRs
         2mNgkBhnkOeI9K++AAaNYq/R8Hb9gJt4cvysEiuGfVEm+yNCwY8TeWjWBwqfB1mm2wvo
         xja/wZBAw7vSVUy3xClcaNHGHtAWoT4RTBBpifYT3kIL5RV1jzzwswDTd1Mmrt4ZLt/A
         tiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SL9T3aYS6IFbexB1JuHREwm+6T3mP2MZTJ1gO4rfD8=;
        b=mOY6wyMgjCKsrL61JVRAfNSk5eMPuGrTgDExD0Lt7G2hEjMgrOpbhWEyRgOak+4xHg
         gtmC1qNeyg1Sjp6ZuokRwfEyW7sqy8iL6SR7vQ5zaYtilBee8K4ENzapxAHbth/lFCXx
         48GPAzyjzDaaKlx/loYKEFFnJj2V1Y0zXm8UpLSb3+bAHTIcCXmHiK3zsx1s2xTSXSpS
         nNoarKAEcKJJ2/yjCO05OVIZeXF1NLawt6Ba1ErweleAo6+uPEWfUy5S3X/7kQvqNrWk
         zpRwaX5s2v5WNb7KUzZt9T8NiT6w/AfvwtkKjoYT2oALt42IFGQc598qY7LRvwcdT2bO
         X0nQ==
X-Gm-Message-State: AO0yUKVJWD9xGO7yI7T7h+HeynongV0mIoDTbr/zXfVu52yv29TsesW6
        FPJM+tJLT8LatrvPQYWQA7Kp0g==
X-Google-Smtp-Source: AK7set/Lz63IZfgfOEQQvMMBr8y1TLVqn7Fh8Arg6FsBJWPglWOg6nc4cnXcx/TRA7AxEmRn0d+Xdw==
X-Received: by 2002:a17:906:d8ce:b0:87b:f7dd:792f with SMTP id re14-20020a170906d8ce00b0087bf7dd792fmr5638272ejb.8.1675245549817;
        Wed, 01 Feb 2023 01:59:09 -0800 (PST)
Received: from localhost ([79.142.230.49])
        by smtp.gmail.com with ESMTPSA id g9-20020a170906394900b00872a726783dsm9736926eje.217.2023.02.01.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 01:59:09 -0800 (PST)
References: <20230130064404.744600-1-wedsonaf@gmail.com>
 <20230130064404.744600-4-wedsonaf@gmail.com>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v2 4/5] rust: types: implement `ForeignOwnable` for the
 unit type
Date:   Wed, 01 Feb 2023 10:58:27 +0100
In-reply-to: <20230130064404.744600-4-wedsonaf@gmail.com>
Message-ID: <87h6w5k8pf.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

> This allows us to use the unit type `()` when we have no object whose
> ownership must be managed but one implementing the `ForeignOwnable`
> trait is needed.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

> v1 -> v2: use `NonNull::dangling` to generate pointer
>
>  rust/kernel/types.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 411655eca3e9..9d0fdbc55843 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -85,6 +85,18 @@ impl<T: 'static> ForeignOwnable for Box<T> {
>      }
>  }
>  
> +impl ForeignOwnable for () {
> +    type Borrowed<'a> = ();
> +
> +    fn into_foreign(self) -> *const core::ffi::c_void {
> +        core::ptr::NonNull::dangling().as_ptr()
> +    }
> +
> +    unsafe fn borrow<'a>(_: *const core::ffi::c_void) -> Self::Borrowed<'a> {}
> +
> +    unsafe fn from_foreign(_: *const core::ffi::c_void) -> Self {}
> +}
> +
>  /// Runs a cleanup function/closure when dropped.
>  ///
>  /// The [`ScopeGuard::dismiss`] function prevents the cleanup function from running.

