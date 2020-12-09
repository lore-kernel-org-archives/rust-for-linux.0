Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB33C433FE
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 23:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FBC622B51
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 23:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgLIXSy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 9 Dec 2020 18:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgLIXSx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 9 Dec 2020 18:18:53 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53CDC0613CF
        for <rust-for-linux@vger.kernel.org>; Wed,  9 Dec 2020 15:18:13 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id j17so2929302ybt.9
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Dec 2020 15:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/kpl0UwfX0jjeJxVe/GYWMna61i1R+lB3ux/H1m8XbQ=;
        b=Z7b5MvYLqwbNqH+qXHdwqMqWMVD4E2wxCoUvWfQPLMM+5K89OBNpzh28GaKI2yLueF
         qvpHXeUvJ7hzXQS0RB20IBfnlG6ph4TFm669EcI0EOzzi5UIN1rvYC3OIS5UlsaDte0n
         JjCoZ2sgewn2C9p/IawwfgdLE0DRy2LKgkyhT0q9ltOAyUoRsy60XJxWo4MJI77rU8Sl
         n+BKsxodH7hzRbjdiMLf7pcTD2LTW4KOb5VPSewWHgf9oXbeaawcQTKUYG3xlG/EfbTc
         ii2h3Ef45N0lXpgdGnI6+/E6krbPxi2S7BEYtOCOyzdINqmxkMt/tOgelGq2AHn1LM40
         BdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/kpl0UwfX0jjeJxVe/GYWMna61i1R+lB3ux/H1m8XbQ=;
        b=X1ir1QrUsKgNc6aRJuSk3A7IRc511Cj52h8eyTtPuB1G/A7wXJKnR032khtNAE3F7W
         ETwhA3yUjrdqc0vuDrdjAFfN0nx2jk8HRePuwBFAkmqo7WaluoQz+rm3EBRk57uRyMwZ
         wa6+ZUjbZ6LnpWIsen8gf3OVdBoN45dd7BlSetY0SxvOuOIGYrkQ2IdqP3TBsorG9iLq
         4tHpIwOBNYznSn02NgVlBgYmTE1KfT2xtskAYV8diR998Uv16uod4QPfogS17HFUJY+6
         AHaUEZgA2VjtrPdJr4KT6S9aOxHfkUGHr6RC1koAMTAxbvy0QfffilKA4g5li4+ctLCK
         uA/w==
X-Gm-Message-State: AOAM532KwM1NFNdurW6CM8+V9nFln+0RwU3HYul4r4UJnU3KuWM0zH9+
        EXmTE80CkR8rcE7TmdRU/PAFkuTHpRGlFEuBOVk=
X-Google-Smtp-Source: ABdhPJxc4gL7Hmu1YUUiP29YX6VpRP/0jgTr80oABS/lYOMgvqzVCrXjdfD4hsIPa1HcPeORjTy3zHDAa9nOh5JL4oI=
X-Received: by 2002:a25:25d5:: with SMTP id l204mr3176110ybl.26.1607555893020;
 Wed, 09 Dec 2020 15:18:13 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
In-Reply-To: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 10 Dec 2020 00:18:02 +0100
Message-ID: <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
Subject: Re: File operations
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Dec 9, 2020 at 10:49 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> How do you all feel about this? I think it is an improvement but would
> like to hear what you think before spending more time on this.

Not sure... On one hand the first snippet looks very cumbersome; on
the other hand, introducing a macro for just a line may not be over
the threshold of "is this sugar worth enough?".

The macro makes the fileops functions look more normal, so I think it
would be fine, but don't spend too much time on that if you feel it
gets too convoluted: we will likely know how much macro magic people
enjoy if we end up being successful in introducing Rust in the kernel
:-)

Nevertheless, however you do it, having actual non-trivial drivers
implemented is a *very* nice thing!

Cheers,
Miguel
