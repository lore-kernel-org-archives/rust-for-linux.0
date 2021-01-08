Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BE7C433E0
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 01:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3953023601
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 01:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbhAHBYC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Jan 2021 20:24:02 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54591 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729729AbhAHBYC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Jan 2021 20:24:02 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A46A9174F
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Jan 2021 20:23:16 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute1.internal (MEProxy); Thu, 07 Jan 2021 20:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=WtKpWd2QA92+1HKtYrwH0aJnun5SRBG
        l8cvhTzvXkC4=; b=LToVM9Wx92kSagrApVejNXQ4oy90icUSh2MEq+avRK0MoHm
        vhlE7p8Cqn8snHZxVS0XM/QQgqqHQVgFHDuwtbRNfhA5/ASH1G0DPkFvzNpPnVF6
        o2Q3lVQw104yP1J7+GE+HZDkd6wv6H6a2MtAIKk9UpFi1qbFToRPPKj58j5Xq0YM
        Y80YzJoSfnBYkar1m8Iw9oeELPnQRKbvZtYX0UDoUJXWbqAkuIrXpbbWIpXVM8ke
        NLNwDVb9EGGNwEpr4Tcc3xTPAZR4GGhyytn8nV5k2w6ktkhMKeUKqHmOnCGLLcxx
        bCJzxnLmpamqIgZ62bFH94DuL4MiPtiX2DOZnKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WtKpWd
        2QA92+1HKtYrwH0aJnun5SRBGl8cvhTzvXkC4=; b=iV3lLb79DLHJRbdqL6YfVs
        0TfpgGLfi+E8ACmAU0PKXycaB8LzJY1nAFKJeBNX2tYvXJRGP7tRt2clNMdi1uGx
        wLhTq8v1Sm66uouNacmWZO3qFvYUafO0IxuiAro+w2mN/zWfIv+vTNpp2q9IAeHo
        G4AdjF7HYTgnAiy7LWLIduxND7P7FOdmZMjvDSG7rda8ZrgGET1vRYLsD25FrvRb
        vCkU3wHK6897tIJbX1U8F1jfsrzTk4tSs1adFSRehx4qIkcGXLy4wygyNCJCCJEl
        ctZATRYDr5qNqlZfeKlr0W9t4q0I67CyrphbNhmHU4GypZwM4xXzCOQuVojNuSQw
        ==
X-ME-Sender: <xms:A7T3X8kz_CFhunpRb2M33PDIgLyP7Q-zyrZHBxCnOjaenvXMotsPsg>
    <xme:A7T3X72-KmJ6XHzfg3Z4u8TANXEp8age0HZOy-TQs0EnkK8xCk2M8WutQPtpMCn9t
    zS33faxH4I3Z1MAogM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedflfhohhhnucfgrhhitghsohhnfdcuoehlihhsthesjhho
    hhhnvghrihgtshhonhdrmhgvqeenucggtffrrghtthgvrhhnpefgtdfhveduffeiueelfe
    ehfeegvefggeejgfelfeehtddvgeevheekgfeijedtudenucffohhmrghinheprhhushht
    qdhlrghnghdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheplhhishhtsehjohhhnhgvrhhitghsohhnrdhm
    vg
X-ME-Proxy: <xmx:A7T3X6pcLef8l2XOSP39X8R2yP0j0wpHT2Bfo_7ZIXr7L9G4DarNLg>
    <xmx:A7T3X4mcLE2Q_s1I-2wFfdWjSGCbtUXjxdil6wPXPleYtJ2nOvTP8w>
    <xmx:A7T3X62AMUmex6-xXsJys1pFEk-9EJA14zPwUSOMWAwsjzL8ShVt4w>
    <xmx:BLT3X7DuCeXH9w4ma6FcBXUx10B7lhx-hw-UJ79n5ninznP5V-F0qw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 43A37E00BF; Thu,  7 Jan 2021 20:23:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <79e121e9-a651-4dca-af50-1f82bee8aed5@www.fastmail.com>
In-Reply-To: <69c0082d-3505-4d65-889e-452a4ce3cea1@www.fastmail.com>
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
 <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
 <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
 <69c0082d-3505-4d65-889e-452a4ce3cea1@www.fastmail.com>
Date:   Thu, 07 Jan 2021 20:22:56 -0500
From:   "John Ericson" <list@johnericson.me>
To:     rust-for-linux@vger.kernel.org
Subject: Re: [Rust for Linux] Happy new year & Poll for call
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I'm sure you all actively working on this project will have more to say than me, but in the interest of keeping track of loose ends I made in the first place, I

 - Posted https://internals.rust-lang.org/t/dogfooding-z-build-std-in-rustbuild/13775 about how -Z build-std could get more polish
 - poked https://github.com/rust-lang/rust/pull/77916

Hope some of that is of interest,

John

On Thu, Jan 7, 2021, at 5:46 PM, John Ericson wrote:
> Sounds good, see you all there!
> 
> On Thu, Jan 7, 2021, at 4:14 PM, Alex Gaynor wrote:
> > Thanks for organizing this Miguel!
> > 
> > Alex
> > 
> > On Thu, Jan 7, 2021 at 4:05 PM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Sun, Jan 3, 2021 at 9:18 AM Miguel Ojeda
> > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > >
> > > > I propose next weekend Saturday 9th or Sunday 10th, at some point
> > > > between 16:00-21:00 UTC (EU evening / US afternoon).
> > >
> > > Thanks everyone for the replies! Let's do it Saturday 18:00 UTC then.
> > > Hopefully that is not that early for those in PST, just after lunch
> > > for EST and not too late for anywhere in Europe. :-)
> > >
> > > Cheers,
> > > Miguel
> > 
> > 
> > 
> > -- 
> > All that is necessary for evil to succeed is for good people to do nothing.
> > 
> 
