Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B42C77B7C
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 May 2023 03:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239792AbjELDTB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 May 2023 23:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239739AbjELDTA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 May 2023 23:19:00 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD04C3E
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 20:18:48 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f42c865535so38763465e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1683861527; x=1686453527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Krp0a0YI8Q15imchFiYZ/gFL0LJIO6QggQFOb5dlMVI=;
        b=MyNeK1lsRWzO84OxIVjMjzJTvHFEVl5xuLhsQZWaxu7P+tUKS+DO8921hn4M/k+5/q
         JXpsAUvFx6BXaGU+ka748+WOLGhbEWnyEIfEfjH60F+IbF9DdKkfE98xObwpIxOaf67r
         dUY4C2ggg3a20gdO+/V24IYIC/VQlCQ483PN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683861527; x=1686453527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Krp0a0YI8Q15imchFiYZ/gFL0LJIO6QggQFOb5dlMVI=;
        b=ekg7TNIuGdy6ezGferY3jTyvRaMdPbZBOR2dow5xv9E6CLXz8Y2jnqmgpcNt1ifhj0
         eTKkemch05FO2RmNwPeyF3JnhjJU9r0dyFpZd4mqYg+gkPkLAkJYwGus5yoMgNUECNsq
         eY00DBxs892wxHUoOhBObixW4j+IYK/4EyXaMMuJgeZSa4196U2o5XfW267OnPm6xD94
         Ds6B3HIZimtNOTSKvX0tYNjfXuwvExIRCLAY/jaf6oFL9Ca/I69yiBFRetHsSr8C2Nz7
         nhEAgppur7V1J2K/QGT7IjdfvTO9PTNDNl88mZHPW+MCLtw+s/EwHjrTeQzBS3WaxPr8
         O1YQ==
X-Gm-Message-State: AC+VfDyfGMZ06W9A7gp0ztiXvJACm/lD7/y3ZR1ORx9fa6I0ymEvMYus
        jZ8y22+jFcUi8SuLiWKI1mYT6NUN6MSOanIq/1BmCQ==
X-Google-Smtp-Source: ACHHUZ6VwNcoXHr871aNuxR6Vg0kw9ZXSHrU5rdT6XOMFke/kxzxUlGlLZ9JeKaCuNiMO8Yu/g32A5iUuh4BLeHNIYg=
X-Received: by 2002:a5d:470b:0:b0:306:2ddb:47ab with SMTP id
 y11-20020a5d470b000000b003062ddb47abmr16288754wrq.39.1683861526762; Thu, 11
 May 2023 20:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230511230837.63114-1-i@truongsinh.pro> <CANiq72=gH3vvn+=VmPOgUXZ-Utqbve8_3AfVbGP0jtKZrM_FSQ@mail.gmail.com>
 <CAMy36z4Md=+2kXb2GMAh1+0-ttmB9tZj=a+xYzzKid08=9U5xw@mail.gmail.com> <CANiq72nPekj0uXcM30aNmeeJXx48i3wQYhtxsNqh1HUYdy3=iQ@mail.gmail.com>
In-Reply-To: <CANiq72nPekj0uXcM30aNmeeJXx48i3wQYhtxsNqh1HUYdy3=iQ@mail.gmail.com>
From:   TruongSinh Tran-Nguyen <i@truongsinh.pro>
Date:   Thu, 11 May 2023 20:18:35 -0700
Message-ID: <CAMy36z4WNrDvHYT2FFgED6nGoM79SUGaxoYmNy=Z76agfH5t+w@mail.gmail.com>
Subject: Re: [PATCH] feat(rust): include bitfield macro into kernel crate
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-bcachefs@vger.kernel.org,
        Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> You didn't answer where `bcachefs` is using this, by the way -- it is
> important because we need users to justify merging new code (of
> course, it may still be useful anyhow for other users too).
>
> Cheers,
> Miguel

It might take some time to explain but if you look at
https://github.com/koverstreet/bcachefs-tools/tree/master/rust-src/bch_bindgen/src,
there are several `rs` files. Except for `lib.rs`, all other files are
expected to be move to kernel side of bcachefs. A little bit more
background, https://github.com/koverstreet/bcachefs-tools/tree/master/libbcachefs
is actually the kernel side of bcachefs, and most
https://github.com/koverstreet/bcachefs-tools/tree/master/rust-src/bch_bindgen/src
are wrappers of `libbcachefs`. Now, to specifically answer your
question of where in  `bcachefs` is using the 2 needed crates, please
take a look at https://github.com/koverstreet/bcachefs-tools/blob/master/rust-src/bch_bindgen/src/bcachefs.rs
, as that is the first file I'm attempting to move, which use the 2
crates mentioned.
