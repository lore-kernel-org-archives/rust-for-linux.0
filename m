Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13D2C7618E
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Apr 2023 22:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbjDZWG6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 Apr 2023 18:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjDZWG5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 Apr 2023 18:06:57 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BEEF2;
        Wed, 26 Apr 2023 15:06:54 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54fe2e39156so92466427b3.2;
        Wed, 26 Apr 2023 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682546814; x=1685138814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB27/xkS1ZORZE8U10J0r1v6U1ip7jl/0pwGCpzNH3E=;
        b=rAtvJ80WLsOSlFmslUbWsJn1lVKfvgO7mv2cxxahNB8DDliMuVNAiTZzFDL4YIb7V8
         wE+j94aErhwt4IkgbaHbuqb0a/VViH3dfmq+DXs5GAwRTNXkLqoVGOlRf312tdNbBzpG
         PRXve+5sEloCdJOFnCjbg2DPp2hWGOqZ9Vq39DrEWcEvcL2YviW9xUzLGC5frNQeX15q
         bYtWBLcENSQWXm+fYIUfpeby86hTc7yZYOSkRNKVjyzWXhS/Y9k2tf7Bj4IVY2HZHrIG
         kN8DKHQ2EZBQXxjbJnOojx0UsMxmnzrNtkkbe2I3jO+jiaZyMpuEI9U/+kyNo9ZDi24F
         GRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682546814; x=1685138814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB27/xkS1ZORZE8U10J0r1v6U1ip7jl/0pwGCpzNH3E=;
        b=G0xjMmpgI5paLWTWQqq+UJwcSe3Hheql6+wniNElIyi1ozQvOuhVkbuUXMJjwf/Ndz
         4T6052PEFaRVJmBjonu6TvW4aizLFfOitnFxXBU0VXh4LzbwkSxEoB+JA3EeKB/pbB9r
         Mv3pXFnUGelt/OwsuphTAvGFK3KbFbgm9EjuVUuFNCfRgYDWiPQ15vcB38qmJ95zNCGW
         4zK0ZpMYDt25Rbwjk3LN+exycSI6kY8PMR32j2pRQ7DHdAXqq0frs8hdu9CGxvKJBtuK
         0HYvavMh3JJ2RcMqWTRdUaSxAXRZkkfeth0vviKmBP4c3P8bjaZFo9asR2ajwr7Akjxe
         yyiQ==
X-Gm-Message-State: AAQBX9fOc3jvPeMgSGCiDTlnVVaCRJkBdj0sOCZN48MtJIfNNyDDcIzb
        mGZMuwiTH1tR3FseLnjNEJP3Ok6Ls7oBKh3XsJU=
X-Google-Smtp-Source: AKy350YnbbqCqx/MyOk/r9MHPHTb7RDIS4ol/PTLuR9dlSf9naE3buQWIzfeYllEd3yN9JTMHdbVCi5gd70MbRZmiM4=
X-Received: by 2002:a81:658a:0:b0:54f:badd:d148 with SMTP id
 z132-20020a81658a000000b0054fbaddd148mr14277444ywb.14.1682546814094; Wed, 26
 Apr 2023 15:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <ZEmbeAUklqmb8leS@virtual>
In-Reply-To: <ZEmbeAUklqmb8leS@virtual>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 27 Apr 2023 00:06:43 +0200
Message-ID: <CANiq72ne324Wvp4RG-BtF8V9hqb_qhTZH+kNJwigB5vZHkMz0Q@mail.gmail.com>
Subject: Re: [PATCH] rust: fix sorting of rust/bindings/bindings_helper.h's
 #includes Suggested by: Miguel Ojeda <ojeda@kernel.org> Link: https://github.com/Rust-for-Linux/linux/issues/1002
To:     Roy Matero <materoy@proton.me>
Cc:     alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
        yakoyoku@gmail.com, aliceryhl@google.com,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 26, 2023 at 11:46=E2=80=AFPM Roy Matero <materoy@proton.me> wro=
te:
>
> Signed-off-by: Roy Matero <materoy@proton.me>

Thank you for the patch!

Something strange happened -- it looks like the body went into the
subject line. Did you use `git-send-email`?

Also, please use a dash in `Suggested-by` and a title like "rust:
bindings: sort includes". Also, please add a commit description --
please see Ariel's recent patch [1] and discussion for some more
details.

[1] https://lore.kernel.org/rust-for-linux/20230426204923.16195-1-amiculas@=
cisco.com/

Cheers,
Miguel
