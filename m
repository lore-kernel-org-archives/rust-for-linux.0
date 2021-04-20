Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A195BC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 19:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B9F1613B2
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 19:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhDTTvS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 15:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbhDTTvR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 15:51:17 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D37C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 12:50:45 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so13883880wma.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G6KRqzMz+svGDm6yNGYtkZjTtwbWpMh0e4WbSGqncTg=;
        b=kMemPVuoqrUg9YgCJGOcqqEhujXKHyH0JkyWO/LfNBkSBS9ZMkavT3et0RL/ukmwqC
         Hx3Ykl24ajpJR4mTbcvM+92vxCl7X2SwGNcpzMoRX1s/uC6ymp1zEjLiZvM9f9QKH7Ms
         2yNUf3KaDNL1E1vmiD5rLZGlqBPZQvskJQJsFB/0bNT5QImQn3yPCaPT+VT4+tiI1R17
         bPZjUGQ2QmrRLH+NNEw6uY86RAR7YEVwAoF6EiIdCXNGQm1fj0CJYuFv1fQ71UssKwG5
         mqnKxvLhHH2d9jITjT94lYOmextyFVynEhIefT0J1iBb8jXuFKgA8bneLWgMcexMn2sg
         +Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G6KRqzMz+svGDm6yNGYtkZjTtwbWpMh0e4WbSGqncTg=;
        b=tRiS2FCtniasc1z3RTLnk1uKJqOASrk2IkhFvNU+qFkJIZJ5mryP0cb/WDILVcCV3d
         S8NIWspiGJUltHQeNJiLaSLI2WsMgwChIJhV+bNzKwWep9D46liPH4nX88gLLsdN3xGW
         mKlWCHECX6AKqLtKcab7iavTL9RuNnWFCuQn2y8lHKZ9NN7AkL6N8wfBGZr7n8Fl4t5m
         R7lAndd3pl0Nliw0Kh5Z8mNhpgrJ11fHYNFeyx7sB3dmqwo+GtuR9/kUFAu7wbM0pHoP
         gN4yNQRapoq3BZ+o5ABnmQXyX0lANzCH7s8/hKe0XJpPraqnB9UlKcY8DXbP2cLzTZy2
         nVUQ==
X-Gm-Message-State: AOAM53017jiHy6XUGEDKONzvkwH/1BSsV45Gf2UBSh9OAVDKVi24uMBG
        GpPJQ+Uyf9YLObGw+kkA9cKO
X-Google-Smtp-Source: ABdhPJy90z9DPB10YP2/Q5RHFdDNCXjG7MLZWnHDsHvZvqR7/n5fhj7DfLFa2L1wEohjMfB+p8r4Ew==
X-Received: by 2002:a1c:5454:: with SMTP id p20mr6229708wmi.187.1618948244505;
        Tue, 20 Apr 2021 12:50:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:56fe:fdf1:6a4:4a7b])
        by smtp.gmail.com with ESMTPSA id r2sm28322001wrt.79.2021.04.20.12.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 12:50:44 -0700 (PDT)
Date:   Tue, 20 Apr 2021 20:50:40 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "comex ." <comexk@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Video conferencing platform choice
Message-ID: <YH8wkC4IAfSu6sk+@google.com>
References: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
 <C3BF5681-DA8F-4DD6-9769-11A19C5FAE3F@gmail.com>
 <CANiq72=a-C1A463pm8Q-MX2aXYEecJ0PJDyfSYejM-MP5h6=Gw@mail.gmail.com>
 <20210420192936.6kxvgn2l6zsnmgaq@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420192936.6kxvgn2l6zsnmgaq@gpm.stappers.nl>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I'm running a test session for the next 20min or so. If anyone else would like
to test, ping me and I'll share the address privately.

Cheers,
-Wedson

On Tue, Apr 20, 2021 at 09:29:36PM +0200, Geert Stappers wrote:
> On Tue, Apr 20, 2021 at 07:32:39PM +0200, Miguel Ojeda wrote:
> > On Tue, Apr 20, 2021 at 7:25 PM comex . <comexk@gmail.com> wrote:
> > >
> > > What is v1d30?  Googling it does not bring up anything relevant-looking.
> > 
> > Good question -- I have not used it.
> > 
> > Geert, could you please give us some details? Thank you!
> > 
> 
> The server side software is Big Blue Button.
> Documentation at https://docs.bigbluebutton.org/
> 
> People of v1d30, video vowels became numbers,
> have video conferencing service as business model.
> Their website is https://v1d30.net/
> 
> It is the user expirence I appreciate:
> * Visit website
> * Enter "Handle" or "Nick name"
> * Continue    (no need for password or other account hassle)
> * Check of your microfoon  (without bothering people in the "room")
> * Entering the room
> * Choice on using camera (no package deal with choosing micro phone)
> 
> 
> 
> 
> In-Reply-To: <CAMKQLN+t1yyOeptSRQBzw=1pCV4CML4WSxV9Q4s_cyi6c4-P6A@mail.gmail.com>
> On Tue, Apr 20, 2021 at 06:35:22PM +0100, Wedson Almeida Filho wrote:
> > Geert,
> > 
> > Do you have specific concerns or just want to try something different?
> > (I'm happy if you respond privately if you'd prefer.)
> > 
> > If it's about having a google account,
> 
> Both "account" and "google account".
> 
> Account is pub versus club. Just going the pub, not first becoming
> member before being allowed to enter the club.
> 
> Google account is "be one of billions". It makes me feel lost.
> 
> 
> > I just tested it and you don't need one to join a session.
> 
> I'm happy to test it from my site of the Internet. My test setup
> is from outside Google employee network, webbrowser without Google
> account cookie.
> 
> My main reason for testing is to reproduce the account login
> that I got at the previous Rust for Linux meeting at Google Meet.
> 
> I'm in UTC+2 and awake till 20:30 UTC for "login" test.
> 
> 
> 
> Groeten
> Geert Stappers
> -- 
> Silence is hard to parse
