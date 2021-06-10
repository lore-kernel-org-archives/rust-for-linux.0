Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD62C48BDF
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 15:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24EC60231
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 15:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhFJP0S (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:26:18 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:44734 "EHLO
        mail-yb1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhFJP0S (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 10 Jun 2021 11:26:18 -0400
Received: by mail-yb1-f172.google.com with SMTP id p184so41327054yba.11
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jun 2021 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=d2nWESb9H2+inIKfajgbRW1guqlGHEt1+AyCq3j26Vw=;
        b=dtJLVZ5DBSDgiBXaCpNSHA1DdFJzUPMF9+VjMpHTVbgbgMNfrtfICc+T6NutK4fFdK
         hHTGkc4Ejh2MsDBe2WXQYkICS2WggrTh9AGQgT7r+7D5r+mLTMD9sF+7A96uZ29ONILm
         FFFMX21cbpTyybYZe81vvo9Nv5LwPs8I312ezPKKLf8B2ONbRij8/bhfFtQTJUBO9j0h
         +8fS5MI9fOuldF38VSrEAtpm1I6rqYrjQFOvvQqw43p3ynRw4bSQ65h/uL7UQX5Cypa6
         S/+d/7csksunUlL/LcGd2uEUec/HJtvPErOCLOHVEg2c7zapdw91pzraBF8J2jAC+Hvc
         DssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=d2nWESb9H2+inIKfajgbRW1guqlGHEt1+AyCq3j26Vw=;
        b=j4VyZjKmzDgSt2XYTDJdwX3GCfDYLVXsld454biVc+fzBwRjo7wOYH7qjznz0XAvlv
         Pn6bUMvCTTcGw6eBkDAkW0fPpCebYAK5GSwAnepeh40NnqEsHLK5zQOuonPO/Ja1ZPx/
         6OwPnKVbFrGWh867z0419NF/4YbrA6SUYlNW7xSWEO2lzpVAxDE1s46RPFWfmyJrZBqe
         JZwHYSuqF8o9Fup4LTGg8QF8n41oOZCZtc0RhD63G0GKdM83fbsWpaGT6lQWik8N4nkB
         CP7eo4i4/WVfiNXOMyYZLkh1xtH0VZVRc+fnWH9/g5do1O2Xv1EfXw7SGVWcp0eFq53K
         GeTg==
X-Gm-Message-State: AOAM532zkNpLLf8V/tAjM7RlkjGbxaDvEXQ3kHN9lm7X6mGjskoaN3aZ
        jNJtEKtXLdKZM94/FEGlCG8EJVFqCa/KimuSfdbQtzWy4Qg=
X-Google-Smtp-Source: ABdhPJzaizjW4QSaG2xdlzjIYN//8w8p0mW6LhKcn8z30Wn9P4Vv7xBzQ3ux/fFOO31usqSunIJQg6NzNzuYfzCNgb4=
X-Received: by 2002:a25:1f57:: with SMTP id f84mr8383876ybf.22.1623338587402;
 Thu, 10 Jun 2021 08:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nkghBWopTK1CErYGcU3PriQGaGrXxMwgCc+MhvS+HfVw@mail.gmail.com>
 <CANiq72=f7bvzc291u24_x+M_=wGaJMXYFEKOLXON35icuJoKSQ@mail.gmail.com>
In-Reply-To: <CANiq72=f7bvzc291u24_x+M_=wGaJMXYFEKOLXON35icuJoKSQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 10 Jun 2021 17:22:56 +0200
Message-ID: <CANiq72kZPOgK7NRkmfpbaks365s-9VcYN4N0Trwb0c+2xBzYdA@mail.gmail.com>
Subject: Re: Technical call on `alloc`
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jun 10, 2021 at 5:20 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The two best options seem to be both 15:00 UTC, so I have picked the
> Monday one to have Alex with us. Fox, Josh, Douglas: sorry!

Sorry, I meant 13:00 UTC (15:00 CET).

Cheers,
Miguel
