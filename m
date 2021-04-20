Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA33C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 01:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED21613AC
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 01:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhDTB3H (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 21:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhDTB3H (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 21:29:07 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5D4C06174A
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 18:28:36 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i4so3523106ybe.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 18:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UnQb0Vu94c9dkMR3rytGieQQSr95SXH+beC1dz6cerA=;
        b=ABYmnGQcezslDhJ5Q0TLYfd+O3eTEyViimZmceXSjAyCRMY4IG0tlNkZrcBhCnyJ1X
         Es9jZwwubEZ63aQs0FYHU/YHawGZdDZjceK2D6bmA2ST876bnOMARQb4iqVE40tDPf7D
         Az1nIPazmxLRPcm32n2GgE0nYzGEewS1SED+6xUhkhVktHfzMyNc8ques49QUQZiDYQ7
         bj520m475l93OLSYxETreZW6jJShPc3Ra6UZ41B9y2kxpi0xbRBW1oIwfHdBwEqKmQwO
         7FKPXapahIT0cM3zp6qmKLk0XeekhqrRLTxUGy0lJOs9v0KFk9fVLw6HXWzwHroqEnaH
         qoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UnQb0Vu94c9dkMR3rytGieQQSr95SXH+beC1dz6cerA=;
        b=i+OHU9iz+lsmTQ8JnnRE9URa4FeIJCnvg17+tOkojqXBBg1G6ikLK8WgnohF3SYQFA
         wn8xPy7A0GEDCBSupj4MsCJqQYn803LxeYmcpNiiif77wbkmX46wj6C2kWbcWMTsV1ry
         y1lUvTI2arHNg5dzgP5vEKBWSbm03GajMoX/gJIdsLK+gELzrN2UTGlFUiAfmrw5sHiN
         QskdYi9JRhUi1RIAdlRZGwjrFU/7A1cWN7O4ZczTRDLvHzbm2osFCjIbIhYs96pL+D0W
         KU6Xmd9YaFCgmXuz9JHNauz1KyZ11BHr8QHjVEjeOftIrWLT5RTC5f3oZLFlQjAOeW6/
         Kmeg==
X-Gm-Message-State: AOAM532E+a0F7ylrv0Ve/lUDSJyGYgRIboa+13NkgsWh843bKcjt2F2p
        U0XQK8GPPQRR/Xe8kPrqlb3jpgy04BH224ojvk7UGK05bEo=
X-Google-Smtp-Source: ABdhPJwelPNRQjcAzv/+w0GnLJFX1psk501xrnL1hSe4q+BqtGH+dqWnxa0B1WIHDxSdB8QfItVrnqAeGPdoQN4+1FA=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr22117038ybk.115.1618882116309;
 Mon, 19 Apr 2021 18:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <YH3rUsLYFF0VefDR@localhost> <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
 <YH4NRfghnRB2z1E4@localhost> <CAKwvOdmwhn4_Uba-WpGKJd3aL_1Re2Z7xJ3rT-qCzuFpKxx_ZQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmwhn4_Uba-WpGKJd3aL_1Re2Z7xJ3rT-qCzuFpKxx_ZQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Apr 2021 03:28:25 +0200
Message-ID: <CANiq72k+WN5KQwa50TH9o-PCT55Lm1osE7e3dYVG7eD4RnQVbg@mail.gmail.com>
Subject: Re: Poll for call
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Josh Triplett <josh@joshtriplett.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 20, 2021 at 1:11 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Ok, I will recall the "Toolchains and Kernel MC" proposal then; my
> main interest was to have a venue for discussion about Rust+Linux; if
> there's another venue more appropriate let's use that so that conf
> organizers aren't confused by multiple proposals.

Yep, my idea was coordinating this rather than sending different
proposals around -- I have received no replies so far either on my
proposal for a Rust talk (back when the MC was discussed).

Cheers,
Miguel
