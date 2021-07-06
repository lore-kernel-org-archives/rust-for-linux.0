Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F61C07E96
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D194361C5F
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhGFRZz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhGFRZz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jul 2021 13:25:55 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8069EC061574;
        Tue,  6 Jul 2021 10:23:15 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q10so3906383pfj.12;
        Tue, 06 Jul 2021 10:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CEnGgs396px3IOlqYQv25XAQKPa7tvqxKzSEGryKztU=;
        b=nptC2NzvR5nIM0zHk9uWFjfy8uBWjRviFRtpdP7Tn73xuyx8UGBhbZVwvk4L7GOihJ
         aMXCyS1/7Bfn3DC1qBYwvuWgHTHwEhCYBcKgkL3xEM0RZWXw5TkXG6D9Wt5g/1YUsUV0
         rwUdLx3xqGDZE4RRJg0jAspDS57kg9vTyoecARKOgO3GL2h90yPNcBZvwWg/3zIljVnv
         iu3pRguo652YLcbBIDzDGPDhorGy7WIdBw/Jz5sYtxc8gvK8BemQpyAoMikHL3QOZHFI
         icGhsHnYGjAPP898Oo1nedQdhit9u252Z7uKuGlIlebgu9f3s9P+0KaoVroTxzDTx2vv
         K7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CEnGgs396px3IOlqYQv25XAQKPa7tvqxKzSEGryKztU=;
        b=I2CbCbRZHQrFKgOvq96O5g6zDutUkbquUpB8EKnSFJDlgz3S6nFenjjjFeLOmX0UII
         qgjNBf6wlTaSa8sKjW3xW0B6Q/1qfkASJ+LCf4fIH/z+SGi+Tb3bYQ4JB90usqoZOFv2
         /v0KHg9eS7JjHcck/LyhAcedY3ou9a2DlSO23wiVAL2Zk4gYa4A8735bMbGGDtEI/Fag
         rOZbepGAwm1JOsQrORTT0Eey8beTj8SaJ4u5UlayFk/YhTAkzHmSJItJBjkTD5C+UyA+
         n+wGSUbwbV7HAPSghZPGuCo2s3BgoqxmQD0/9Ii2FalbUyZ/pXsT6lYjTnBOEdCVpNqK
         Pieg==
X-Gm-Message-State: AOAM530X2iN6E32A0hISNVXbbm0Y2sh7TIOhKPGUmzRZ8EHcansgn9P4
        Zjc44Vbnxa9mcB4ed9Hp8C8helPZ+lFniB6wGus=
X-Google-Smtp-Source: ABdhPJwTsO60SLsD57xf1XuHpCAGgNLEw1nhexbc1baVcN3h/zOwwFSVWXg4r0gHpX8/YmXLcgWQVHfEFcNE/J4w6jI=
X-Received: by 2002:a63:4242:: with SMTP id p63mr2561077pga.185.1625592195089;
 Tue, 06 Jul 2021 10:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <f2f6fb7d-18cb-3256-b6c3-2d09905b02ca@student.cerritos.edu>
In-Reply-To: <f2f6fb7d-18cb-3256-b6c3-2d09905b02ca@student.cerritos.edu>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 6 Jul 2021 13:23:03 -0400
Message-ID: <CAFRnB2WMuOjP0S5vvCa9w1Wi67K+3XcBsZ+QxxQ2gvo4-2mOEw@mail.gmail.com>
Subject: Re: Assisting with kernel Rust development
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     linux-newbie@vger.kernel.org,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Amy,

Glad to hear you're interested! We've got a whole bunch of open bugs
on https://github.com/Rust-for-Linux/linux/issues, so that's always a
starting point for looking for things to work on.

Cheers,
Alex

On Tue, Jul 6, 2021 at 1:19 PM Amy Parker
<apark0006@student.cerritos.edu> wrote:
>
> Hello!
>
> My name is Amy Parker. You may have seen me on the kernel forums before u=
nder my previous email address <enbyamy@gmail.com>.
>
> It's been a while since I've attempted to contribute to the kernel, so I =
figured I'd post here. My previous attempt had been under Matthew Wilcox's =
direction to modify the DAX driver for NVDIMMs to use XA_ZERO_ENTRY to repr=
esent a zero page instead of DAX_ZERO_PAGE (allowing us to save a constant)=
 - but this failed since the ascending values of other flags conflicted wit=
h the value presented by XA_ZERO_ENTRY.
>
> I saw the recent patch sequence adding Rust support to the kernel. As a R=
ust developer, I figured I could get back into kernel development because o=
f this, and was wondering how I could help. Are there any active objectives=
 that need work?
>


--=20
All that is necessary for evil to succeed is for good people to do nothing.
