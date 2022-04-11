Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583AEC433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Apr 2022 12:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244591AbiDKM7m (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiDKM7l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 11 Apr 2022 08:59:41 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B91F00
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Apr 2022 05:57:28 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id g21so18489749iom.13
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Apr 2022 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykbd6S+xBZzKi6gx4pwvqoyslhZc5uPBJAzoBhOfaS8=;
        b=D9cuAttxKJcLfSy9G6Li1Vz1X1l8bGTyj3qFgRF6fSCW8IGqxzknKl0rOMK10OJyaz
         0SOIT6xa7ngjebu4e2JuoEpo0XFqFglZckZOOwJf0yS+5dOHakF9tklfUExsiO466ONr
         Sr5Ces0k+v6XyA5uv+28M/WNJmTTUUNZZD9IqYzKOUYwGzx1Cz1HT6wE/bxT7erNEYsx
         4uUk7UIgNITwX7fESBaiky/YPRMrd2DiOmkd7Rqb8wFzZYwgv1KXX06BQZBziOTfyuBP
         KGDignkKB/8keMKv7V+kPH9HSd51qChOuJexZKxrMnGhhaLCxyrlezZpJpz0PefTHukn
         vI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykbd6S+xBZzKi6gx4pwvqoyslhZc5uPBJAzoBhOfaS8=;
        b=zJoWba7A4q9lMJCoxHgXExCFJze2nymQltW8BqJXKeOqeWrc/ZO+w2t1ig996CJCTr
         6hE/wJW62Q8O5F+60qr8OEs3XjwdcMpWuUF0oSn3Ih4qR29O21Dl12qIvrJsCR2PNkSm
         i9PyRy/IDBTnzfEfUXiotnD1oV0QB6Ore8MeHur1yLYH8Tqtm/ByiL4xR2aPcIwuTN7n
         Q7bbKnd+eTUSyKB/0ZIOrBgf39lM0RaNCRvdobGATD2kZAeuATzynn4axjGL2bbSqfCK
         R5WT+cmtsx/0oogKCVOhJd0va30TpQy8TpTVWP3wm77v+/1LQjEdpmrVvFeJMlsEYm6J
         KqcQ==
X-Gm-Message-State: AOAM53349L/bPEiRzzpnCN1d+Js2qRak//8VHOwf9lg2NxnfzCiyd9ZI
        UVk4PrgiR40ti4XPLRmH3v7Q03fTaLdDXuOBaKLL5dQZ
X-Google-Smtp-Source: ABdhPJwbMUegVX5iwXcnTO2oOWDxOuqE6MOVQ7kNSVLbJo6KA+bkTSpmFLqez67riCTz3P9VSnwX5bM0eGxwl87IRj0=
X-Received: by 2002:a05:6638:22cf:b0:326:34a6:f3b4 with SMTP id
 j15-20020a05663822cf00b0032634a6f3b4mr1371485jat.256.1649681847511; Mon, 11
 Apr 2022 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <OSZP286MB21285364AD0AF0CB33C45279B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OSZP286MB21285364AD0AF0CB33C45279B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 11 Apr 2022 14:57:16 +0200
Message-ID: <CANiq72mC22YLLDte3adP9M17WVF9BQvkX5wG=Gx6Z3Z889wDgA@mail.gmail.com>
Subject: Re: Does Rust for Linux support kernel socket programming now?
To:     Howard Lau <howardlau1999@hotmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 11, 2022 at 2:36 PM Howard Lau <howardlau1999@hotmail.com> wrote:
>
> That's awesome! Please let me know when you have published your work.
>
> By the way, by saying 'using async', do you mean that you have also written a runtime like `tokio`?

I think you may have intended to send this message to another thread?

Cheers,
Miguel
