Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D028EC433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 16:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A390C6128B
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 16:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhEJQDi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 May 2021 12:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbhEJQDi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 May 2021 12:03:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13431C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 10 May 2021 09:02:33 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id i4so22348829ybe.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 May 2021 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S326sfkyUOzy9EEn2e80dHIFZ3UALsRAK1GZVTt5aGo=;
        b=PAn9TDmSNtlLp7HptGuHX0YF3nvgrBqgtpF46k/10ljH4EVKU2WmMX0UxffTTlDbC5
         JhLKAKMrphhqthr2qrUE72TljDMBKHaf1XbBRby/UZMnF1yIkRyy5z+Su2qx/Lfcdan7
         p90FkQdoN0gc8fMy4Nf6/JMD/8AL/Gb16RmgvLuEcdCQVgY/3b2L2YsXcirdf+a6H4fJ
         1edYNF5H7tHXnMdgf/Htxt02j8KB4xazXbwjXVEIonOEM9IXZm5wj+Y39QHEx5RMn4RP
         2+Cslnwi1ykbQYA2NBdGXRLEWvaztytK37rdV+ZFcglxCnkz+iboo2uZo+Axo3UBSpfF
         ZMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S326sfkyUOzy9EEn2e80dHIFZ3UALsRAK1GZVTt5aGo=;
        b=lVpQGKAoRCC7GJ7GqTciN5F3kUc4xi/h5uBFmGZkIk55UVRtdSVG3U6fNzk/Y9UugN
         nYQyCubmjFS+sKk/egQoGRRB4M3Yud4nG//4pKVwDyDoAXl+NIPMxrzVWQIC72GU03VB
         DPNTCOqaCpTRluGG7dJKOzFMI5fmaNjnIfiCZZP5D1tKaiBLY7CASXcK70G9ndVhGVzg
         CErdPqGunlvVJ5zoiZAueaIlP+WgU4HOiBfrtYUFDZCZuwS/bWoN/MY6xqj+mMrfCOxv
         rwWqhESlj2nLbm02dBxXjtQj9/4zytCIbVGYmR7Ks6Hfu4MbcYHM12hZ8ckN92cX7BxZ
         KnTQ==
X-Gm-Message-State: AOAM533TFuq0+WiaHHo3qayKmptKXPaNgZmwZGiVYMt/JW05OydtDtrM
        NOdHHYOF3HoNwamUkPRgOYcyK/itO3cE82AFmqwpIhQa2rBQuw==
X-Google-Smtp-Source: ABdhPJy/1iMXGPnOz35byOsamFKSvaGk+JXFEvjV+cvK1p2mI+0wUYS4pYLLOxlYbGArMKuQbKh7aNpGAhD4pAzuJRY=
X-Received: by 2002:a25:880f:: with SMTP id c15mr32462499ybl.247.1620662552244;
 Mon, 10 May 2021 09:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <76F51432-B120-4C46-BADD-8DC7B0051CDA@kloenk.de>
In-Reply-To: <76F51432-B120-4C46-BADD-8DC7B0051CDA@kloenk.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 10 May 2021 18:02:21 +0200
Message-ID: <CANiq72m5Bs=pL0Vp-QfrxqLG2ZBdOdM51kWNnrcoUbyg7yJArA@mail.gmail.com>
Subject: Re: German Podcast (https://akronymisier.bar/)
To:     Finn Behrens <me@kloenk.de>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Finn,

On Mon, May 10, 2021 at 4:07 PM Finn Behrens <me@kloenk.de> wrote:
>
> I was asked if I want to tell something about rust-for-linux on a German podcast (https://akronymisier.bar/).

That is great! Who is the intended audience?

> I would do it, is there anything I should mention about the project?

In what sense? (Obviously, you could tell them to check it out! ;)

> I got a bit lost in the current state of the project? If I see it correctly rust-for-linux did not get merged for 5.13, are we targeting 5.14 again?

Yeah, we are trying to be ready for the next merge window, but in the
end it is all about taking care of the main concerns from Linus et.
al. It may happen 5.14 or later.

Cheers,
Miguel
