Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3BBC433E0
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 12:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FEF64FED
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 12:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCEMBP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 5 Mar 2021 07:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCEMAt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 5 Mar 2021 07:00:49 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5C5C061574
        for <rust-for-linux@vger.kernel.org>; Fri,  5 Mar 2021 04:00:49 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id b10so1682328ybn.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Mar 2021 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7TzbO/wMH1DskbcFWiWfrkwWQgVOGxqjNF/slSuBz8o=;
        b=c23JO6YZzbdDhR81FpJB5gRoYLYZV2CFU0+q6eWvGKBYx4hBzXYXKaCsrb7q4grPRS
         WBfEJpUU4QgxBY0lSZHo89S1POCpCLyRc8c3HYr0oxr5fXmz1q/RxMl4JrBLZrfGnaER
         sy+4fKKK0BODBSVcxKFIvMcRgipXIeyiyxHK29+89Qg80/q6Nl7OXCKe2ACq1sALipFn
         ms2ggz92v4F6QdQWxn2hzeg++Zx6Pn0fzyueG+OShxkpGMIM9qnxRZj9FSmjUMvuaD+5
         FC7L+M14S6fzzai1CU1JdYWOD4MT2ukvab1g/lSnc0b1/ESIXE6a+rXsmNfPKI1AmP8m
         WBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7TzbO/wMH1DskbcFWiWfrkwWQgVOGxqjNF/slSuBz8o=;
        b=e9J3krsG/pAkqxaIBazdxZ7sfOdE3XVriBefvhR2OQWhrng7uQYWNEH1FEhEZJJD1D
         Jz6VlwUZWtAqdEu5ocwjOj+FqRjAtYBqdfCM9BBqA3c3RB2TDRRITJ/Y9iQ15mOeEVwn
         iYWFTyjzdS86tjqSBAHRr9pJrDNBUhoGTd33WRFLOnu7NNoohWYvilrO4/M22nhy8RPA
         z6HwSPaQ4JuAQEp91t1sw96au7GmIZjly0ArTSAYJbhzWjBPttAjKyZBjXzak85ir57S
         qVklRxIabve+6NYEMMfuo7csSXHCCb4xcdi3bzdBlHyIHjbNPubfVc8mdWn+BiXeTtkg
         V6TQ==
X-Gm-Message-State: AOAM531VHQ3OhU6GnqSejR2CvSQvVuDQyr9RszBam4zwHbLRIYvDlSFi
        yvms9w6vDjYUb+WSD15qgJu7tLoMlfR0znVz1tQrh3yCp8c=
X-Google-Smtp-Source: ABdhPJxU/GbOAws7CU2U9tKa+sUZC9LDW2ZPLx9vzmrdVqi7B2rS9F/IjnBQ/fr59LJwS56qQQn4FllAWbU0HydWIKM=
X-Received: by 2002:a25:d94b:: with SMTP id q72mr12700754ybg.135.1614945648702;
 Fri, 05 Mar 2021 04:00:48 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <CACAkLurwvSnV-5VuY1=Pocaw0VW-Axv=DgmU83v1NP=+a6ExAA@mail.gmail.com>
In-Reply-To: <CACAkLurwvSnV-5VuY1=Pocaw0VW-Axv=DgmU83v1NP=+a6ExAA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 5 Mar 2021 13:00:37 +0100
Message-ID: <CANiq72k+gkuq77edMTQwzEC9ihxJZC-5ky3i7JZ40x1H9TM09g@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Sumera,

On Fri, Mar 5, 2021 at 12:53 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Hi Miguel!
>
> I recently came across this project and joined the mailing list. I am very new to rust, and (less new) to kernel programming but would still like to be contribute and be part of this, if there are any beginner issues.

https://github.com/Rust-for-Linux/linux/issues/90 is possibly a good
one to start :)

> I was also wondering who this meeting is for and if it's okay for me to join in.

It is usually a handful of us that are involved with the project in
one way or another, but you are welcome to join!

Cheers,
Miguel
