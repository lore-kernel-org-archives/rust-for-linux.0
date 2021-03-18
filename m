Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA9AC433E0
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 17:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4576964F1D
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 17:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhCRRGO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 13:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbhCRRGK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 13:06:10 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ADAC06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 10:06:09 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id u75so3288427ybi.10
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6QtgYFOEUkbdH2Ky4kBMxbN3VE1EusgT2elLjYS81F8=;
        b=O2ZGNB2IipAb31Eke2kdmE8vDLL4AuWkHNJxcRd8GImbY9oR8D3uLbxtEaTRspHerF
         CyMOgkUX1xE/pUGyI64puq1GvCzAgU8nvcZJDxs3R6HAAJIQIKVnDqrs69+mz3Wc5wPh
         SYhIwX1uuH+ZSVv0jKA66EbM2zMWUIrLrWY5pecaay/YzIvNRK3Wg9DjWXwL+Wb2QNc5
         +DejaifGjmrwxQ0j5PshFiMIZYQ28aTilXPIunuW5TltGq5i6IgNrotW44JGeRM/Vvq7
         19y/GiCYI7JnYrq6Y+PcYEQ4LhXar6/07Xa1IssawefrOaAmjeD0raUZOvQDFN4ZcON5
         Bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6QtgYFOEUkbdH2Ky4kBMxbN3VE1EusgT2elLjYS81F8=;
        b=dvOPqavhYKjfvkBTsS6gOql+l1m8xYfQNfFl4iUu3mSPpJsvpZ+DRitKbaO1G9cLUn
         Kvbh4yqQZDIQyt2WYce56kSeFX7FhqhGHHDZe8qZpbzbUsfNFMRPgN4FyRrXG2Ez+KkY
         bSqroEpJdIngod98AaNsYiOjiwwQmmKo1KlQEQYqN+YgK6/VxJmzM6+V547eoB2IzXt7
         UXNFXQjvZVNKwXIOGkNc3700KCFgGf9mrubNrSItgbEI88xp9cAu8CwbcVelxDiMVQy6
         EZMjRsoggYCDEaZpKkBov4RBIa389irbeSoq4aQ21IMrs6HK0fSMgDqZ1R31M25o4sMY
         mThg==
X-Gm-Message-State: AOAM530piVTtIa/zvoEgubxGvgI0lwHl6vVnYPEMbcc6PyyRUIic7Qoq
        JzFZA2stRVnzgk1A5mGc/VG5m78FB/RTrXgXxoorVJ2zLtI=
X-Google-Smtp-Source: ABdhPJzRc5c34zWfsoiymGJN0ZBhjcW+JFbqPfuLKL7T/AfOxTllpXqM5dJdPVVWCzn7FlRCfpp0LIPiZO6xDIJMHFY=
X-Received: by 2002:a25:d6d5:: with SMTP id n204mr455319ybg.22.1616087168749;
 Thu, 18 Mar 2021 10:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72kaiyZjhQiH=b8O3d+SzjB6AE0zEpR4WS1_iFCFyjqT4Q@mail.gmail.com>
In-Reply-To: <CANiq72kaiyZjhQiH=b8O3d+SzjB6AE0zEpR4WS1_iFCFyjqT4Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 18 Mar 2021 18:05:57 +0100
Message-ID: <CANiq72mCsRuiDT43M2G8qFdMrqHsgH_RXgcjWmGC4md3NB_y_w@mail.gmail.com>
Subject: Re: GitHub permissions
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Mar 18, 2021 at 12:00 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Since we are now in linux-next, I will be tightening the permissions
> in GitHub to prevent mistakes as we discussed in the last meeting; so
> I will convert everyone to a "Member" except Alex and myself. But
> please feel free to ask if you need anything to be done if GitHub does
> not allow you to.

This is done -- if you want to send a normal PR, please create the
branch in your fork instead now.

I have also given Finn admin permissions to the Nix repo since he is
managing that.

Do not hesitate to contact if you want to invite someone to the
organization etc., and let me know if anything broke for you!

Cheers,
Miguel
