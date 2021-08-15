Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC8C4338F
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 17:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B5F1611C0
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 17:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhHORtN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 15 Aug 2021 13:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhHORtN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 15 Aug 2021 13:49:13 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1E3C061764
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Aug 2021 10:48:43 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id f15so12290663ilk.4
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Aug 2021 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Obp3fn1OsVVZ5NSJi3Ok1oXv8TFaf984kEG4QIkouTQ=;
        b=B19mJ/uP9vJdxFd/OcfipmvHefnFIBfsJyQMW5DXkBFxf4eHjpgaBgXpGEPwSOv5gV
         ZIK2GA3WXzaruNZJxfEpendQq2BlmYvSWJhmZ5ASXL8os5YUz2RI8UOtXaSfSWFI64Cz
         vKsoc4VU+2KT4Inh0gANx28JFAXTj8mQou6a1zoctNKlopewPzwbc52pTwFpJXKt1wCb
         Jzi6eaL8ZeiE5lsLjWKlg9wO/NjrXxMLznKTSLAmmlemTN6N0f8osEcMhWfqw+SFmxiM
         PG7Cnh+wkNfabvtykvGyqMjIhdOPpLi5FcjbUHv/O7YDy75qFdNEWycR/Ps6FZdR0VPX
         GD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Obp3fn1OsVVZ5NSJi3Ok1oXv8TFaf984kEG4QIkouTQ=;
        b=LRvbogcQPVbcHLyRt6DgICD/v0BStdwI9ZaqeLPG3SXaO8fP7pM5hI4LQg4V48bbt9
         1AuCdHJ1U65qarPxKyBfM/adFVfhYaEbTIKbZ9Qju9N3tv9nrOR2sMx9cKGhcm6qS77i
         H8LQArN+IU0tS1WrvA1POmWU2GXSPAA6bOvgnmtUXVmO7R7zrDFepcnD21+1c3lZDtr4
         EsG0TD3EaoJTq+3+n+EMZGdCxeX6SjGyVk9QLHdSi8o+7m4Ne7cLm4Hl0sor3zcnDbzd
         5moNs1qMViwxbvW2QIAt3vZjJtP4Ei1PH5NwoWVHq20na/ROXqsMOZLt7Ua8BisCz+K6
         8BjQ==
X-Gm-Message-State: AOAM533RWEH/rYtCOAAyWs+037eP/lhHEhwwbSIdQj9jxH7tWwI5sQnY
        LQ4qJ3nZ3rBdLyGZCJUVYv3i4HuFyVMRmvR8+m5ZDCyU
X-Google-Smtp-Source: ABdhPJyDskbe2LJZXmKKEBzmHK1zRbJ/8G+jQVSI0ffyhMx5Yxy40y3lIJoTG7cIlIhjLnq5cteacVp8qMC1hu1UVWA=
X-Received: by 2002:a92:6802:: with SMTP id d2mr251431ilc.40.1629049722395;
 Sun, 15 Aug 2021 10:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANc8B5N6gYW3+zdG2qo9+ma4s5=xTxUVRk8s=A7-17KhnY+hzw@mail.gmail.com>
 <20210815143053.xumpoo22gb4cueho@liuwe-devbox-debian-v2>
In-Reply-To: <20210815143053.xumpoo22gb4cueho@liuwe-devbox-debian-v2>
From:   Gioh Kim <gurugio@gmail.com>
Date:   Sun, 15 Aug 2021 19:48:31 +0200
Message-ID: <CANc8B5P9V_w+B0TO3nwZUWaJcK-MjtB0zzTbeBgyvRacXhkMCg@mail.gmail.com>
Subject: Re: How to setup Rust code tagging in Linux kernel
To:     Wei Liu <wei.liu@kernel.org>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Aug 15, 2021 at 4:30 PM Wei Liu <wei.liu@kernel.org> wrote:
>
> On Sun, Aug 15, 2021 at 11:01:39AM +0200, Gioh Kim wrote:
> > Hi,
> >
> > I've just built and booted the kernel of the Github "Rust for Linux" project.
> > I've used emacs and gtags or Visual Studio Code to read kernel code.
> > But they didn't work to read the Rust code in the kernel.
> > I failed to find the solution with google and git log rust/.
> >
> > Is there anything to make tagging for rust code in the kernel?
> > Maybe it would be better to make tagging for both C and Rust code.
>
> Check this out:
>
> https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst#rust-analyzer

I got it.
Thank you very much.



-- 

Best regards,
Gioh Kim
