Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0574CC433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 07:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5A396100C
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 07:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhD0H52 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 03:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhD0H52 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 03:57:28 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8072EC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 00:56:44 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d15so15911034ljo.12
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=28dabtIIY5U5ILpUYOhzR7djkSx2N/PghQXfaxlDNf8=;
        b=lvCP+ug/EvfZN593G58ZsTODObSR1lLz8b5WDEOYR8HacmAzCosBEZaaXth1GCnM2D
         O5M9u7cb6hhp1Aw9W2Cxz1MpOlyN1dk0282lSzqJLpeOqTwlH1FfgU2kXnR9GH3QZk0/
         U7iEr8vVAQ8HLMR2xK+937Rurmf5vvm+wtIhVo+BFApAf42+oy/PE3mPtV0dZgNpKS3t
         ox7nKYjxmYjqSJxMauS3sMFDxCnGXQ1PHyHsR76w501qG7IDhZKA2tV7LxfNi+N3mu0s
         Ss3rrOcUP64pebN8dJ6s9sMTphqQe6A5R839I8HRw8yec7MVsM3CcUEQaQSyPZ/53fvb
         By/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=28dabtIIY5U5ILpUYOhzR7djkSx2N/PghQXfaxlDNf8=;
        b=tCIf3/nmR91uxQMjHAvfBXvJrZFRJ8TdV0WjkSG+iJ5egCNVWlchlNM89ubep/nJGg
         P+0NFzIbydechKr1K4FUxzPZeQofUMJ3k/tk17KzkxcMUmr24PA+RxHxpBUqW28bcEUJ
         ienMhe0mR3a9DG4Tr6lq9MPfcuAU4U/a01Lnegop4FGw89rtcy8sEbILyVoC9TprcTRN
         Fr3AQQMjM68uuw6EratletdANekzDBJFR0aE11+yOpw554DlmdqcZw0eploCYTLeVnuH
         zysSsIUIDAS7AjVz9q3G2vRDPOLpu3PeD3HQ5T0mEuAmxLwuMipeIsp3a72FybFQ1Oew
         1+hA==
X-Gm-Message-State: AOAM530esovTIH9kRZY0388k6Jv5A6ydUK+MlGG1SOBkzvpDoPO2e9Zu
        PNPSP4LwIthzOFiT6xqADLlEsXDVvtAAHsXLTpM=
X-Google-Smtp-Source: ABdhPJyDaeT6g7dHYpW1KG1X5PHkclFbQf72Ibz21T23U7OY2cquHVbRmdBtVcNbA0rqw9DIXnlo+CHRkBhQTI6cgYc=
X-Received: by 2002:a2e:a3d2:: with SMTP id w18mr15575212lje.457.1619510202997;
 Tue, 27 Apr 2021 00:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJr+-6ZR2oH0J4D_Ou13JvX8HLUUK=MKQwD0Kn53cmvAuT99bg@mail.gmail.com>
In-Reply-To: <CAJr+-6ZR2oH0J4D_Ou13JvX8HLUUK=MKQwD0Kn53cmvAuT99bg@mail.gmail.com>
From:   Fox Chen <foxhlchen@gmail.com>
Date:   Tue, 27 Apr 2021 15:56:31 +0800
Message-ID: <CAC2o3DL3xt73PkbSFykod_5HpNPN4CzyrU5mDv6Sw=3M8fKqpQ@mail.gmail.com>
Subject: Re:
To:     Skylar Givens <skylargivens@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Skylar,

On Tue, Apr 27, 2021 at 11:38 AM Skylar Givens <skylargivens@gmail.com> wrote:
>
> subscribe rust-for-linux

For subscribing please see:
http://vger.kernel.org/majordomo-info.html
http://vger.kernel.org/vger-lists.html


thanks,
fox
