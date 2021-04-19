Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879A4C433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 23:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B7116113C
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 23:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhDSXM2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 19:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhDSXM1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 19:12:27 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC92C06174A
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 16:11:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j18so58632468lfg.5
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 16:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8J/6au+P4cnlCQe3ljy+B6SUJAlBeLsDUiP0RDCjbRw=;
        b=laElqGVK7U8iYEOAOnRX+Wsu/9JqjJpAlpQOTYP40n8uc0FTCdw2YsqJqwLCu2AZc1
         oq+kJW+fpwjUQce9s0BfiojR8+JPmeCT1z7yn/gmF9+QhX0MmrYUtICTRR7mGXhBqmLK
         mwcMW+1p+cy5WmOcRdKzOr3E7i+8MlCaMtPNPRwm9l0rms4FSDHuJejBjMFnxe1nTuT5
         +TyM2Mpm+NxvZ8HkMcoK8wCUyw6sbXIcSChgEoy8834Bct6kwVuFVj8sGGbhgD7pjT16
         ceJPP7WhC9dm39neAYivnrqYpBuRIk7y4zT7GnjW7du+XQCdRfLD6q247P7yGKOy5D4W
         p2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8J/6au+P4cnlCQe3ljy+B6SUJAlBeLsDUiP0RDCjbRw=;
        b=rVKkjLqm63xp9ubBO7X+Qzjj8WBAgbio/wOrTIlcVkFJCBf9YQcYXCA0T1smcYuNPe
         +2F/Ge2ytLQv1obej509gR5Im8ucfzbo1vcrYonUAIJn+ks0U3mDj/Ucsr35IrPti6eG
         Sdh6XGqXYIdmmNAGECiCqVSv93+Y8sF3KSx2SB/EcFz8UfDHsNIef7kkyhsgVHhpt0il
         N6wjFSvezsnsCYSJbbJOhO2yiDnPtTBCJNYalxIqPqgFtn63UQ/usqpjAXf6c/Q/1kW3
         pH2TLW1XUC7NHup9pxwV+J8g3Qt5LT8F/IRQRx0A3cTU64uR1UiiwXiIwGX9du7Ch3TO
         l2Xw==
X-Gm-Message-State: AOAM530U3fSDdkdxFcM3rRk2PUBOc7AmMVPBPoBVB6e3opp3sJM3iC6e
        Ej3HTo2KqmkmaMJbIIdv4dd5rn6EUYP5LPyWb3thWg==
X-Google-Smtp-Source: ABdhPJynFygDpbWllt9bdxsF43iGEN9e6z15c1Bhs67woECShCdvMGy7QT41gZk3wnAixT7RfniDzT/snSpTK/4oXlw=
X-Received: by 2002:a19:ac09:: with SMTP id g9mr13924382lfc.547.1618873915180;
 Mon, 19 Apr 2021 16:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <YH3rUsLYFF0VefDR@localhost> <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
 <YH4NRfghnRB2z1E4@localhost>
In-Reply-To: <YH4NRfghnRB2z1E4@localhost>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Apr 2021 16:11:42 -0700
Message-ID: <CAKwvOdmwhn4_Uba-WpGKJd3aL_1Re2Z7xJ3rT-qCzuFpKxx_ZQ@mail.gmail.com>
Subject: Re: Poll for call
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 4:07 PM Josh Triplett <josh@joshtriplett.org> wrote:
>
> On Mon, Apr 19, 2021 at 02:20:11PM -0700, Nick Desaulniers wrote:
> > On Mon, Apr 19, 2021 at 1:43 PM Josh Triplett <josh@joshtriplett.org> wrote:
> > >
> > > Either day works for me, and I'd love to join.
> > >
> > > Linux Plumbers Conference and Kernel Summit are coming up. I'd like to
> > > propose a "What Does the Kernel Need from Rust?" session, with my lang
> > > and libs hats on.
> > >
> > > I'd also love to talk about the recent LKML thread, and the plans for a
> > > custom alloc crate vs reusing the Rust alloc crate.
> >
> > I have a microconf proposal for "Toolchains and Kernel MC" (similar to
> > last year) that I'm waiting to hear back on.  It would be nice if you
> > could hold that proposal for that MC, rather than the general
> > "Refereed-track."
>
> I'd actually like to propose it for Kernel Summit. I'd also be happy to
> participate in an LPC session similar to last year.

Ok, I will recall the "Toolchains and Kernel MC" proposal then; my
main interest was to have a venue for discussion about Rust+Linux; if
there's another venue more appropriate let's use that so that conf
organizers aren't confused by multiple proposals.
-- 
Thanks,
~Nick Desaulniers
