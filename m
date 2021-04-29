Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A7C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 11:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F87D6144E
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 11:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhD2L13 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 07:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhD2L13 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 07:27:29 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6EFC06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 04:26:41 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 66so33488697vsk.9
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utGCcckuItFRA3OB1xQhs9eScDvOTF27fYcfqUgQ+QI=;
        b=tr98cJbMcYdbo4RliWaFbxPThWKAc17Dxi+VVeKW9dbppfhRs4Cr6tX+naKv/9yhL3
         m3bHNGpiVmUrNb0XN6wrrG2E0lpgQjPNQ9cGEj8127vicJRDX7J03nI9SCURn7yT9zFd
         XF3Jv66hPD9yn7oKajvsIkUsGns9NQDfZzePXESjOAJC61jGQpAz+WxdXPTVxVMCHK1D
         aQBBtT+ElaKpAWVAWjJ+qC0+jGfh1/5PmwoeHuYGbESlCbRJfM4dA6vPLq/Y2pymwJ9f
         JCzaYfDakJAl+lh7FPKLJZTySqp59FLILB/L4OXytYbAHSoHfES//oOpEiXHmcDnaCXi
         4sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utGCcckuItFRA3OB1xQhs9eScDvOTF27fYcfqUgQ+QI=;
        b=oTLAhqLSXUwzGjUAeKVvGXBSvUWBqPRS1XNNVP8PSPN717dE56kj/7sS6T1TDTblam
         IkdUzwBHg7/bJuYIy9SA0QcmQKh0qnzz3/aZg8KSTbGhKQknMxdzRvAxz1pSbHvq4LBG
         kLJLiQ8o4Aj9YWcfeVoGJvw5/bYkTLXH9HcFpLt5vR+ioli9glEAh+uN4jKMwc4mW106
         OULY9LNdojd1hZ2ZkoJ64U+A/MEdxZMhnX+kMb8KMb5mlTkfqEIWNe8MTRHS2VYt9fEO
         PhIB25elidC5nljOeEpnAtkAPp0VLmZroAzOx8cE0pXx/eUdNM2WDgF5fAsntPzYsycy
         STgQ==
X-Gm-Message-State: AOAM5309AtQROsSAjNWOS7T/9c29qruyWrZ+sqKw9dltRCJATL/r34DZ
        Za04Gx6QG3Aq5uebziY9lN/6iRY0WFLb83YOK/0=
X-Google-Smtp-Source: ABdhPJw/gCL+SFl30IxyU2HBEK/qOh+eIE+rc022RZPp0sZrNmkX4nJs9K2V/q50sJXguI7+jS0nT8IzzXsaKC8pzHs=
X-Received: by 2002:a67:e34b:: with SMTP id s11mr7230901vsm.44.1619695600530;
 Thu, 29 Apr 2021 04:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210429095819.GE1409@agape.jhs> <YIqE1B3qMK+5AwQj@kroah.com> <20210429102543.GG1409@agape.jhs>
In-Reply-To: <20210429102543.GG1409@agape.jhs>
From:   Adam Bratschi-Kaye <ark.email@gmail.com>
Date:   Thu, 29 Apr 2021 13:26:29 +0200
Message-ID: <CAHaybgktoXXCYX1P0n5VRtCzGWC=4oW34nAg2McUH0aaRXOYzg@mail.gmail.com>
Subject: Re: module parameters permission
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Anyway I'd like to know what was the matter with those bindings...

There's nothing wrong with the bindings, the problem is that the
`module!` procedural macro will only parse a literal for the
permissions field. Given Greg's comment I don't think it's much of an
issue, but there's the same problem for other fields which it would be
nice to fix (e.g. your example works with the default parameter value
`42`, but will hit the same parse error if you instead had `40 + 2`).
We discussed it a bit here:
https://github.com/Rust-for-Linux/linux/issues/11#issuecomment-778569067
.
