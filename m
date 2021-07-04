Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7595C07E95
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jul 2021 21:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99A12613D2
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jul 2021 21:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhGDVbD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jul 2021 17:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhGDVa6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jul 2021 17:30:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A35C061762
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jul 2021 14:28:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r26so11305531lfp.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jul 2021 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbAGqDDbQnmjvsoTclpanP0h7gMK/AYm7CJnJS7LBY0=;
        b=EHudwuo4e7cs9iy4bKTttxh5r9bMEt+Or14SkbnP8XxX+YLimbIhboHjNY1YI7rJb1
         BQgZulzERbrQhHRG6dgvXGd+bH8g8ubQtBJwB6kCRYzc86HwozOTZo/k6oJHPk7lUEHT
         e8WtFHMImLSrmrRRFjuGao0CPcAtgaoBdpI9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbAGqDDbQnmjvsoTclpanP0h7gMK/AYm7CJnJS7LBY0=;
        b=eTzk5lr3PJjSJjUV5ugfGVXWW0p7HQdqXvqxzXRdrQUdkdfB7UYY2eT8IrotIeJ4oY
         S3psQv4d6y/pfWggQGEwNII5Hz3sK2CdnXxFnLlf6tsM6u6709BMN87zR3uKh0sDa2hW
         N5PEk8Ecq21yibUjqeIOrOxTMOUmfda4Z1wWSG9hW9uMK21q+fBOh6FcVsDiNxYCFkux
         DRCFlZ3q0q2M4q3JAG60uFNvjsM3OSOC+KRJ2KgrC8OVhvqlAkxl8+TZJiz6b1QjuBPI
         bh1uSWG3E6kXu6oFBO7l79XjhkRFpO3GoJdOWuMUEDO9Aw628Rkg5bmg/iz3XEwRjO/t
         WDhw==
X-Gm-Message-State: AOAM5327WbJYQ9rqUaXglPmpXCj36TtifGWTp+8HcnrpI5rmQESJc1pj
        kJGKWzlXclZrIj7G4gkuPjokEZHvWjsqpumF
X-Google-Smtp-Source: ABdhPJzPIqF4zTgLlyKliw1O5nk4yLUkWjL6uaJNwklZLbcYOPeF9+tHumUux0AfrJyd5rQ+N4efCg==
X-Received: by 2002:a19:6a05:: with SMTP id u5mr8124806lfu.628.1625434100743;
        Sun, 04 Jul 2021 14:28:20 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id m4sm890219lfp.15.2021.07.04.14.28.19
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 14:28:19 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id n14so28788891lfu.8
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jul 2021 14:28:19 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr7787093lfi.487.1625434098906;
 Sun, 04 Jul 2021 14:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
 <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com> <CANiq72n0SeubFWsFXkTT1V-BCQB+MzVRqC4L+PT8QtA0=C2r8Q@mail.gmail.com>
In-Reply-To: <CANiq72n0SeubFWsFXkTT1V-BCQB+MzVRqC4L+PT8QtA0=C2r8Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Jul 2021 14:28:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjFa-d_Gha9KyrXb9UxTKNJY3L3D1D-f6jPSz0_AWSuLg@mail.gmail.com>
Message-ID: <CAHk-=wjFa-d_Gha9KyrXb9UxTKNJY3L3D1D-f6jPSz0_AWSuLg@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
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

On Sun, Jul 4, 2021 at 2:15 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> No particular reason. It makes sense to use LE -- I will change it.

Matthew's suggestion is denser, which is nice.

At that point, it would be neither BE nor LE. But the "LE-like" version would be

   len = data[0];
   if (len & 128)
        len += data[1] << 7;

which ends up having a tiny bit more range (it goes to 11^H32895).

Of course, if the range is expected to be just 0-300, I guess that
matters not one whit.

                Linus
