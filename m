Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D70C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 12:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1235E64E4D
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 12:47:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhCOMqa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 Mar 2021 08:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhCOMqJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 Mar 2021 08:46:09 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F23C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Mar 2021 05:46:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id p193so33054844yba.4
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Mar 2021 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d28Mpk8UJFkR6/THyMM4jI5SWWDQw36IwvMAa8ihK3I=;
        b=U0J1DWCTehjUxJLrEZ0Wcp1q/9tIh5NoQYypX5h76fBsXpVd2fD4+Q3YxmALnJUmKR
         qjwjKif0gwjTq8337jnaK++IBlshr3so2Wj+vpK534ea5Y2Iht3BJiRDXVZK7o28CIeS
         pXaBQkEOc4LIfU9HAsfCkex/CIzKCoRxgzBy4TqHqx9mwE0pNcHExI0NRkeybKCmrlRM
         /B9rsjb7y0VibYwzrFF+7m3aJKUl4Q1IXYcFCJTxo6SnJK3z1Hgk/6Nkdhr2inODrwyU
         1zl81VLXkL/st5fON8Lyu4JDFrisfVLpSWEDxRnfyWhRAxuynrc+9IY5N4+I6ykEH2uc
         qK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d28Mpk8UJFkR6/THyMM4jI5SWWDQw36IwvMAa8ihK3I=;
        b=PWMWQMtMtutjJKrQRip1TOHoRB4qay5aN2uCDvaMhlUwDEEinMTuw3wwpL+V9jWF6s
         DonPjo7TDcttVJQpLZGp04Ag8nk0wk2l3DmgFl8ikHR6SJfmKePIcXNhxtRu0rzNUEnH
         7OgKe9ZKUBl9C4ZAMw2RnnvV6CzucOz2UiwZZk2WbGnd4JOH0eNRhvjKoWeHZVzdfgAi
         Ii3wvA8aEF8U8gabiVWBHlk7XcOdmEB6+StQM9e9yn8OQZJt+3SNuPrvnXAaJ3x2N3z8
         aoWjDLg5pU54/EqHACkGyRsNqUixzzNyUtKwNA/W9aKUZMV3lVzuMWyMgKzYgu5IEC7M
         MSdQ==
X-Gm-Message-State: AOAM530tmsJUZMOXC4EDakXcvgX/tyykhFEXZu99C7YqwYa9d/79IXpZ
        3igbg+9w7skbvzav6G0Z1fEPvF3m3Yj2aovqCio=
X-Google-Smtp-Source: ABdhPJxHHZfehgbvxpBgQnTD6sYgpxPdw+HZItfXwAxqG8VlAJTldG+ZlCWowyUO8niGFNBwzJttETxsgPHOlKKrYtM=
X-Received: by 2002:a25:b91:: with SMTP id 139mr36405941ybl.115.1615812368820;
 Mon, 15 Mar 2021 05:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin>
In-Reply-To: <20210315063044.ur3lvxv7emo2egu4@adolin>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 15 Mar 2021 13:45:58 +0100
Message-ID: <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Sumera,

On Mon, Mar 15, 2021 at 7:30 AM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Could you point me to where make is trying to find rust or how I can try
> fixing this? Is there anything else I might have missed out on?
> I have the latest rust nightly installed.

By default, it will call `rustc` as-is, so make sure it is on your $PATH:

    $ which rustc
    /some/path/bin/rustc

Another reason could be that you are using the `master` branch instead
of the `rust` branch.

HTH,

Cheers,
Miguel
