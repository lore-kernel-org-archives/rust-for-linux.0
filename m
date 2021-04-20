Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEDFC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A39B613C4
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDTRpP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbhDTRpP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 13:45:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C12AC06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:44:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j18so62795987lfg.5
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMZiZ2qFxEBBX2Jmdngo3ur6OrlK9k06hl1juhIxk+I=;
        b=aERP9mKGli9T+h/GNUhnB5KLSL6DzwOnbaha/NFrpBFRfpVVPeMi+zrcqKHfB7fO5W
         A1AbG9CxLW3yKGChG+gtbNuXHqLEHKn5SGGmHlV5qaHe++sh6SSnVZEDmDq6V522dKMb
         107vY1AsCofgKvD1341uYAyyk3KBRlrjy+iZ5CVGRfLQVUHQLqGllsC/7+0XBXCv1mHb
         ZA3px2wi286DRsbMmjfrr49qIftaY4rNj68F/bihC4+Kr+Eu32Kf2QDktYXXq75hJOOh
         V1L9gBbc6+MNZ3nQV/CaJ2vI5AHmG2OZHzjOHgls1o544srwnVheIvOH52YVdOdXRbFi
         4etQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMZiZ2qFxEBBX2Jmdngo3ur6OrlK9k06hl1juhIxk+I=;
        b=HIIE0UsRdyQWP9S/K82AN8EZNlIcv8+bzlfHQ8BI3/+nNjBGyabUXJ66lRF7dgiU+5
         18MhXjH0CV5RlGNJyrTBEn7c2uAdKe7XC7VpXmh0CPt90wIppklh4Tl/ilXI7SnL46V1
         5Cal3LzKoRRUnXsE4vWFYL3XRf7TqMNabte/oDZRoxB01PETrEAorqP8b9UN/SW7tDuc
         QY/gA65YIld0YOIWPjX6OY/XNa6I7zPizliAcBFd5RNSPu35xPHX4laglIy9w6JB5nhE
         mjOd89HC1JMTlICY7EkxVLS3hmxTmKUfmDpAakmn4wTBt2Un3X7TX4A2+ZSp6v2Fmwgb
         WyoQ==
X-Gm-Message-State: AOAM531csL2Qo47YsX4+xqvkLYtTjO1vpQmIiINkAEpj0hAZOEfggVaW
        9IH4d2vxnScx/4cSjV5xTtFAId7W6Zt0aPtMEc5CyD+8
X-Google-Smtp-Source: ABdhPJx6OYC9mLFmdPBd6xIl8y9AON+9UZlXnGgvFUJ8hR+/WRYZ9HaIq0lhlUghvBYssG9cfN0ASIcwsgcEQpCgVg8=
X-Received: by 2002:ac2:55ba:: with SMTP id y26mr16520863lfg.590.1618940681657;
 Tue, 20 Apr 2021 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <45530278-D0FE-4868-B48A-3C01AC422A2C@kloenk.de>
In-Reply-To: <45530278-D0FE-4868-B48A-3C01AC422A2C@kloenk.de>
From:   Adam Bratschi-Kaye <ark.email@gmail.com>
Date:   Tue, 20 Apr 2021 19:44:30 +0200
Message-ID: <CAHaybgkeHSJ2Z6-kFqVuHdRv-0N4EB-PrQGr-HyM=RzVfXK7kA@mail.gmail.com>
Subject: Re: Poll for call
To:     Finn Behrens <me@kloenk.de>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I can do either day.

Adam


On Tue, Apr 20, 2021 at 1:04 PM Finn Behrens <me@kloenk.de> wrote:
>
> Howdy,
>
> I would prefer Saturday, Sunday Could be really complicated for me.
>
> CU,
> Finn
>
> > On 19. Apr 2021, at 18:14, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi all,
> >
> > Now that some days have passed since the RFC, let's have one of our calls.
> >
> > I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
> > as usual (EU evening / US afternoon). Please let me know which day you
> > prefer, if any.
> >
> > As usual, anybody is welcome to join. The meetings take place on
> > Google Meet. The invitation link will be sent later on to those
> > interested.
> >
> > Cheers,
> > Miguel
>
