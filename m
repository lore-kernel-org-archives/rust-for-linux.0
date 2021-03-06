Return-Path: <SRS0=ZQ81=IE=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B92C433DB
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 14:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 755F86501A
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 14:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCFOQr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Mar 2021 09:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCFOQW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Mar 2021 09:16:22 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDDDC06174A
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Mar 2021 06:16:22 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x9so7151272edd.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Mar 2021 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DTTMbAy9PKj0DSSOVPG2/T30Yu1Fr+RzzhTeqiWRqxk=;
        b=rkDG8iRCkR6IXMjldTzh8OJT4zKSR/z2b47YyqajpzL8NVmdoa67y0jb2+O0CcfV97
         Zi+U/9in4+wZD/AF9NR3nIO+N7sPM8MsVXNkLuszLDtKS5Z5PhM91eCAe+VVI2eJLGIq
         9vu23LgGF+stzDSj2xedQSlJteMNIEftCvieB1a9giEW+7FEgq3beSSbQGIY5onLivhi
         bvELcJM/RGOtpCDh1+RhyFjbhgzXjlLkTYfNWmu54aQHBD2dUCp3AHCXPgMH61l3eb1Y
         ne1H/awjCgzcK8hdKLbD2jdQsjHbHhmTNxLqyrsataj+tDvxpi0cMUD7eqs0IpaXRVg7
         DtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DTTMbAy9PKj0DSSOVPG2/T30Yu1Fr+RzzhTeqiWRqxk=;
        b=F2+5+mkHyeWayXc9MFfgB24wexxmYOPJYshudMFEuG/8B7r79ZyNRnk+1+bUV4mJm+
         E21ae0Jwz1h+mMn9OBexyrfsSStQLXdO5A2HQ5pbNbKs3h9IoAFf+z+aHV+Wm4TvqH+D
         hKp/UGFUgywrqKWPuGuG9NnVxmpbZv+xKYw3O95xmiM9uSsaDL122LaoPsgh/3DhoCe/
         B988gbA7Lrl84LSvmIcRafGEbocOv9dur4iJH83gblPN7YTUiCiRubdCKjrCPFCfWi6f
         Ib1j/0SEpM4dZHAw85wyuqHASfD2P+b+1NSUX9XiU71J7KCZ3KdDbPb819rWp+pSawMG
         8kpA==
X-Gm-Message-State: AOAM532oKBOLagumb2Ot+5OyAvMEKTLjZ4X+WsO9HJSmOjG+3fVkfG6S
        ZDzAOPEGHNIg7A3yznuj3/Y8QsFziageR0CA3ik+n3tCjTY=
X-Google-Smtp-Source: ABdhPJwuqBx7QKsNFrzLoiBmWgCUH6pznPUknFLDV4iFWNb1++ucCaOFFujaRweANKTH3o6AbkuyZ6tvf9LDnkKkoq4=
X-Received: by 2002:a05:6402:12cf:: with SMTP id k15mr13676107edx.192.1615040181244;
 Sat, 06 Mar 2021 06:16:21 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <CACAkLurwvSnV-5VuY1=Pocaw0VW-Axv=DgmU83v1NP=+a6ExAA@mail.gmail.com> <CANiq72k+gkuq77edMTQwzEC9ihxJZC-5ky3i7JZ40x1H9TM09g@mail.gmail.com>
In-Reply-To: <CANiq72k+gkuq77edMTQwzEC9ihxJZC-5ky3i7JZ40x1H9TM09g@mail.gmail.com>
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
Date:   Sat, 6 Mar 2021 19:46:10 +0530
Message-ID: <CACAkLuoPcevAh8RRX0LAy0GMwDEDpqOrWnvQ77d-tSCx59jemQ@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Mar 5, 2021 at 5:30 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Sumera,
>
> On Fri, Mar 5, 2021 at 12:53 PM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
> >
> > Hi Miguel!
> >
> > I recently came across this project and joined the mailing list. I am very new to rust, and (less new) to kernel programming but would still like to be contribute and be part of this, if there are any beginner issues.
>
> https://github.com/Rust-for-Linux/linux/issues/90 is possibly a good
> one to start :)
>

Awesome, I will check it out!

>
> > I was also wondering who this meeting is for and if it's okay for me to join in.
>
> It is usually a handful of us that are involved with the project in
> one way or another, but you are welcome to join!

That sounds great, thanks!

- Sumera
>
> Cheers,
> Miguelv
