Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AB6C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F914613CD
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhDTRdY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhDTRdX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 13:33:23 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC813C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:32:50 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 130so138948ybd.10
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eH1/ARWpJZ5uMJGxI3mhVmh/oxtyBXqBMi6eZ7UHxc=;
        b=dBXCGLgjwig3Cy19aVHVfCvxa5ST9IWxNSygGARHbLr3f8hvMaze8P57ZUq7N0AgY1
         MvKq4pvIv3ki+vOvWE9Z1Z8CYgJM0LDLiKT0jZVAgcWBgZcmdK4XUuxP1X4Ea6MKgIQz
         Ffc+kxI+QMYLXaLk6+g/hf0RI/gp98p+38P/8xY8/hZwlahLl4WXId7TDXMXcoaD2jQe
         myf5eISNXocavB6r8MnofIY89e746+O9F4Ow+4vg1iYem8OUlEe9SUcwyG0WmYw3jbpN
         Yzo3dPZBFBVJiMfIildJXfd9y8sGP2s5C/vAvUySfI2jgcHKOdTsPQPCFS9dv+bNon/5
         9zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eH1/ARWpJZ5uMJGxI3mhVmh/oxtyBXqBMi6eZ7UHxc=;
        b=kqz7bmhTM5d19yaY8OkA21RyjFQnflCESfMZyjjXsu7wMF3a8+FYTM7nxwuPUvUHOc
         Q4QMERIAE0UU62e3mxyY1WFniSLsQpvg7RBcYxtdCepQMXQ2pDC0EyCYjiMwPLW3qnEI
         GepccjFKWQSSVPgAg3ac7T6OqRGgXlMIB5FS8PwJ3Ye0PgqbbCIc4EvUBlYFH8BtpMBY
         wuXo5Zwh5hxtNwXakyPS9Bovc16jDK3plNo9dBMP00zSfuFTeMwQ1UhirDYyX0D9Tybs
         5jmAVqia53EaWQU3eLl14dPV6SbbGGa4Xy2/k7aMx0KGopiXaO8AdVekrWq4zF6R4R2x
         Uggw==
X-Gm-Message-State: AOAM530ay8BMMslUOF2z2l7lUXRZGk+Jat0Gyxlwp7oRP7Oij1RRhBFk
        OHgLzjzq9JpPaSpg+i1GmV9rF8ifpJtfLdsRWto=
X-Google-Smtp-Source: ABdhPJwfScKIxPI7yYLXK6M2lM3h7EHrCzFL4SxZdtSDxveVbdiWYT9+uUMQIbhC6aBkBpSpqYecdaT5cuNiXJdC0Xs=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr28041203ybg.26.1618939970351;
 Tue, 20 Apr 2021 10:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
 <C3BF5681-DA8F-4DD6-9769-11A19C5FAE3F@gmail.com>
In-Reply-To: <C3BF5681-DA8F-4DD6-9769-11A19C5FAE3F@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Apr 2021 19:32:39 +0200
Message-ID: <CANiq72=a-C1A463pm8Q-MX2aXYEecJ0PJDyfSYejM-MP5h6=Gw@mail.gmail.com>
Subject: Re: Video conferencing platform choice
To:     "comex ." <comexk@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Geert Stappers <stappers@stappers.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 20, 2021 at 7:25 PM comex . <comexk@gmail.com> wrote:
>
> What is v1d30?  Googling it does not bring up anything relevant-looking.

Good question -- I have not used it. Geert, could you please give us
some details? Thank you!

Cheers,
Miguel
