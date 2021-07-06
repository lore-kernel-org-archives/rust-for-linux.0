Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E52C07E96
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3164661C24
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhGFRmt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhGFRmt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jul 2021 13:42:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F255FC06175F
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jul 2021 10:40:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f30so39716056lfj.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jul 2021 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VECzJml5k1hAS1TG8HVcjo85RdI8u0a+vF3JU1M+Re8=;
        b=o4KJCtYhMqkrrzgdzNgeRRJS+pof3hn6ZCN20b5yf6WIIFEB8/LHAdeMbfa3mfb5Is
         7KTGu6SCPjJ808xgHZjX2Vbt0cJrfnf/csinvkbdOaNyTIuS95ilCpFWKuWdEBTpBYrE
         H3lElOc5svi/s6936DcMvdagVwz3Z8VIBsy+nCZSdJbxVgqvv33E76gaCrOwPeZx/Ljl
         reW9w7Yn3ZvbFB2UP4Yvj/bIYxrQtQjeztI3hvegtZtAgRBQ3/BS8ZaUZTOtTu+H1MDz
         Tpucl6qWxLqWSIwrkK6UY5Uo7e7x9kPKvARfXZ+9Yt4xhF+2L++AZtv2gf6YEQmt65dO
         g1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VECzJml5k1hAS1TG8HVcjo85RdI8u0a+vF3JU1M+Re8=;
        b=HfjD1dgLBQP4JXoHtNsidi2OwlAvyC4oM0DiJJhTPZ5qLz22i3oQD5BFjeyeP+pshl
         wUi9JMYRFkIaml5Np0laGn98NanTAcWyk/YU2Tztze62CtZKD5TJ8/8o3/D6LP/nyKTP
         YO4jYnCfBX8Er8rnV2BuThP2wsX/JMKsCNBil7fK9fOTJMAIbNhZCM+PgKrSV7qC69Sq
         7joMBMyPzpvLEv9EyqdqJvs+gVIEPispSpOKFFOKqHUP2T0JS8f/txnXARCqgrP1FWxE
         2z+/wP2Lz8vXL++8jJEqnr1y+eg5d9LNdsZO3OGnBbP2PgPW/Fy4FdXjnA55qGH5IDJN
         PbxA==
X-Gm-Message-State: AOAM533ytmkbuUmCMgYGMCPWgGVU3sCxKv3JTYuNujBG0QVCiKa8dpHY
        zxnVKZXX/VLN8zTlpx2dCMBLaHeU6kuU191eXU90cA==
X-Google-Smtp-Source: ABdhPJw4wgPDcD4BQrHtsunVukrFtdauutHMqD8rIyt/Kq0mO7yQRWJs55kFueZlhPuvDOdsBIvwRs7jDOVDppAZ0oc=
X-Received: by 2002:a19:614c:: with SMTP id m12mr11311942lfk.119.1625593208352;
 Tue, 06 Jul 2021 10:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <f2f6fb7d-18cb-3256-b6c3-2d09905b02ca@student.cerritos.edu> <CAFRnB2WMuOjP0S5vvCa9w1Wi67K+3XcBsZ+QxxQ2gvo4-2mOEw@mail.gmail.com>
In-Reply-To: <CAFRnB2WMuOjP0S5vvCa9w1Wi67K+3XcBsZ+QxxQ2gvo4-2mOEw@mail.gmail.com>
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Tue, 6 Jul 2021 10:39:56 -0700
Message-ID: <CAPOgqxGUYzqxqO83fMY04uL=fUr_OGm3X+s-fBSCQtU1x_ur_Q@mail.gmail.com>
Subject: Re: Assisting with kernel Rust development
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     linux-newbie@vger.kernel.org,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jul 6, 2021 at 10:23 AM Alex Gaynor <alex.gaynor@gmail.com> wrote:
>
> Hi Amy,
>
> Glad to hear you're interested! We've got a whole bunch of open bugs
> on https://github.com/Rust-for-Linux/linux/issues, so that's always a
> starting point for looking for things to work on.
>
> Cheers,
> Alex
>
> On Tue, Jul 6, 2021 at 1:19 PM Amy Parker
> <apark0006@student.cerritos.edu> wrote:
> >
> > Hello!
> >
> > My name is Amy Parker. You may have seen me on the kernel forums before=
 under my previous email address <enbyamy@gmail.com>.
> >
> > It's been a while since I've attempted to contribute to the kernel, so =
I figured I'd post here. My previous attempt had been under Matthew Wilcox'=
s direction to modify the DAX driver for NVDIMMs to use XA_ZERO_ENTRY to re=
present a zero page instead of DAX_ZERO_PAGE (allowing us to save a constan=
t) - but this failed since the ascending values of other flags conflicted w=
ith the value presented by XA_ZERO_ENTRY.
> >
> > I saw the recent patch sequence adding Rust support to the kernel. As a=
 Rust developer, I figured I could get back into kernel development because=
 of this, and was wondering how I could help. Are there any active objectiv=
es that need work?
> >
>
>
> --
> All that is necessary for evil to succeed is for good people to do nothin=
g.

Okay, I will!

Thank you.

    -amyip
