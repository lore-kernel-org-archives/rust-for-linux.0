Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7807C07E9A
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jul 2021 20:52:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2F34613DD
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jul 2021 20:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhGDUzG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jul 2021 16:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhGDUzC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jul 2021 16:55:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B77C061764
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jul 2021 13:52:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v14so3113414lfb.4
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jul 2021 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=DDKedwHAnd/R9xdhNG2krhsT+Nw/0E+PNH+jTyBdnlj/cEeFjebi3V2C3060Nznwiw
         vtlfihLS1N6oGS1nPJo971wzPG320Cr4ei5n8FjoPqsNRC/sBQhpBRy3FWWHn7ysHPW0
         LY6Jmq2nQLEukQRziXJban++K/Kva/xuLIO6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=t5SFKl7TKp264WUKGYYwyKknTh2JbALFEzmWpS4wWiMVdzQ/Prs+YMMXcmT2rGHQ7I
         od0KGoVV6591Yq/g/Q0WYO0LsXBCSDuY9/2ybsSEG7ROJzGT82e2TEj59We7zgxjHt6d
         9/XnrlG0iZXBdELwQbnL6inLjU8oTWuMIqTqClDoREDwmV4HiFptGLVX1OfINpoBrMwl
         Srx4P2OPrVgMXRmduABaxtKLaIgCeXoDOCN79PRBpSMPmKh2H8wFmnUKjiEs7Irl4IjV
         7d509K6hiF0kKcrrTcBHwOFZEGORSwKrQiUv3G6wywB33LRDAEs1DrGxI9EweMxLH+wq
         jrgA==
X-Gm-Message-State: AOAM531U3BAsC+WRd1800EJwEVdS13FGky0tC4V2JFDN7guqeefFDifd
        1zyllP+0Se9F85hOL8utFvbnyreurVgRs9CK
X-Google-Smtp-Source: ABdhPJwmEP2jVCe1Zdc94XxgZYH8Van3UEkRwEJNxaOZHOLTn0OPDzjWK7Tx1oCiBbDn7lK5y6FOjw==
X-Received: by 2002:a05:6512:150e:: with SMTP id bq14mr7914932lfb.20.1625431943645;
        Sun, 04 Jul 2021 13:52:23 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id v18sm885594lfd.189.2021.07.04.13.52.22
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id p21so6933431lfj.13
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr7866162lfl.41.1625431941847;
 Sun, 04 Jul 2021 13:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-2-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Jul 2021 13:52:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
>
>
> +       /* If zero, it is a "big" symbol, so a two byte length follows. */
> +       if (len == 0) {
> +               len = (data[0] << 8) | data[1];
> +               data += 2;
> +               off += len + 2;
> +       }

Side note: it might be a good idea at this point to verify that "len" is >255.

Also, why is this in big-endian order?

Let's just try to kill big-endian data, it's disgusting and should
just die already.

BE is practically dead anyway, we shouldn't add new cases. Networking
has legacy reasons from the bad old days when byte order wars were
still a thing, but those days are gone.

           Linus
