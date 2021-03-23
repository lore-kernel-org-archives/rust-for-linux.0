Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90762C433C1
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AD4E619C1
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhCWRiJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhCWRhn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 Mar 2021 13:37:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18AAC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Mar 2021 10:37:42 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so10233837pjb.4
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Mar 2021 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=or4LphBCZIG5K2SBG+5gkoRIaMUEHSr2v0RHyL1NKQI=;
        b=d2EC74tGIqxtilws9wGjIPHCsE+OjX/eGWxEuYIpLWCmTqxRWAs9JmAjw0sMkxKnn5
         qv+MLExKuzq+hCZ9pOlQJAn5RjjsvSMB2Q8EQNqiQKX28nCs/BP30ERbkgLhTmJ2rRvF
         IExKa6regPEBkB+Z2xxtVGkTngTDTKFQo9tTX6WnQJHRfCM2imLzA1VuXwxnLLxNFcig
         vmheD/6/NAYUGf6bcZrw1t5/oOOBezSGgiORKbjYa5UhHflF9RvuDJSbePjF4NaEQjZT
         wIFrRDsOc3Z1GIGtKUCzQpIKnSN0N8iCQu5A7vi/cmT8COApr40E25LYmYNL94LGGqKG
         E1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=or4LphBCZIG5K2SBG+5gkoRIaMUEHSr2v0RHyL1NKQI=;
        b=HDOYp6KpFskbRRqR7q6powDLxEwNlcptKUsTfUq+AZxTvGc/5SXJFiDONEcHfy1dDV
         og6q4SR//X6sB31cPBPYa+4UB2DJvb7l+L38JizNvdr2od3oO/ulC8l15x87enHhDo0L
         3ToGoGwaRdBP3Q84UQvv9d9WCC06Sk1xwvOP73eM6L9+IiXyTtsNsdT6H0swdNYIcva0
         g3WqCwHUKj31mlXHnL83d1iOj8PRv1AArNBaxiQIC47cyornzliK89d63cYiDy5sTApo
         bU/lNCAO/5EA74b2Syb60ecvyF9CMiuWuqLsPWuuMWC2/shJCl/JAv8V7ybfKmNUihbZ
         vtqw==
X-Gm-Message-State: AOAM532JLDhtKHv7MBV18eBRENpvW6k+bsA8iUL10G9+Wy/jPBJvw9dc
        kNOGZJaWyO5J3hHZ3Qk3hl/+4QC2+KaJ0WSok34=
X-Google-Smtp-Source: ABdhPJwemRd6FySqvsn/JmxIR7EEFVB/RJKos1vFp3OqdmiLS5xmpZF84gJ2cC2IsOW4JXsJe1MSlvX0KyiVaT8hTrA=
X-Received: by 2002:a17:90b:4b87:: with SMTP id lr7mr5223405pjb.5.1616521062030;
 Tue, 23 Mar 2021 10:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkAN0c6+gDTiBEbV6zNSVdSjg1ANg5-_6=H_5b5rVpzqg@mail.gmail.com>
In-Reply-To: <CAKwvOdkAN0c6+gDTiBEbV6zNSVdSjg1ANg5-_6=H_5b5rVpzqg@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 23 Mar 2021 13:37:31 -0400
Message-ID: <CAFRnB2US2Wsu8jULkaFEqUn+5BgNgNcbwHPQ2n7NX7HTP8XGxQ@mail.gmail.com>
Subject: Re: ZDNET: Linus Torvalds on where Rust will fit into Linux
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I think it's good that there's a lot of alignment on how Linus is
thinking and the way we are: that drivers are the best place to start!

Alex

On Tue, Mar 23, 2021 at 1:36 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> https://www.zdnet.com/article/linus-torvalds-on-where-rust-will-fit-into-linux/
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
All that is necessary for evil to succeed is for good people to do nothing.
