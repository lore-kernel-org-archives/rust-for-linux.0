Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA06C433DB
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 22:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C9AE235FA
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 22:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbhAGWr4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Jan 2021 17:47:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49075 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727406AbhAGWrz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Jan 2021 17:47:55 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 893775C00E7;
        Thu,  7 Jan 2021 17:47:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute7.internal (MEProxy); Thu, 07 Jan 2021 17:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=Zjz6AL4PXJn8TItcMDCYsLoTK5JT
        I74ZXh5Optht0BQ=; b=CbKAYB1qpdI7s8VCLngNqSf1qOmYPTFeqOeUkIeTamqM
        NtJpGTfXE4WmZ5A9bgL7QOihXLLQDc+3+rfsm+8FRh66tnTZ5lYlR3mJsaxomE92
        Q2wAoKiwQADyUsnsE3NaHo2XjEYml/jHQJeVMM8SNhCNDyE6awVyx1I80Uucy8Zz
        4XBv9v1B9ZipGJ0UfzJAzhYRs4fet6eH+dtHzMbPTkKqOjzfUl4NjcC1L4QlAWB+
        vClfY5GaY3X5yWFP7g/AtNssBKmwu0KweZp/Tjo7PMkVzv8UF1ROAToD6/D82rhQ
        /yB7NGptiFNBfJj4Q+YwUZilYK6GWrBTqmXSD8bjkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zjz6AL
        4PXJn8TItcMDCYsLoTK5JTI74ZXh5Optht0BQ=; b=QnasvTxa6zElKGMbwQRmsl
        sWL9DDNksgGmyr7sKjqwpPcUjZ5AH1E0sjuFylksMbBeh6pyizlSMwVdbK4UdeYy
        QXKA55s66IiFG9wR3EDhNwqizU4cVy9Ed5x/vzfHTeVnb5XZh+uHEBTc+9iHpEpe
        zDUgf2ZJ5x8VXmQhz1T4y4HdDzf6srytZcPwuxQZn0ynvcmWZO9K/aBugUbuMlvz
        EmgCNysVCOhDMFQMgsW/5/UbQ9/HzMVkw69F5hvD4v3qgPWxDJtFjNxxmMpTsY+M
        I/LaXQoFHHPHe6/IkkfOPo+cQoQ/jJePLyIpuVxd2FFlIfxtJU10JA9/hsXCwuzQ
        ==
X-ME-Sender: <xms:bY_3X4tB1ZVrdu2oq7jPvrs6hNhVafyxxcm3aAxBGNgLvBS0F0zaCg>
    <xme:bY_3X1fmyaJAPoX2bY91Dc3vZ6QwzrJOcWhgYJOWqLzCjKPruNr1QA5_wQGvqsufo
    Dis7yqqMJbbuaj_s7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflohhh
    nhcugfhrihgtshhonhdfuceomhgrihhlsehjohhhnhgvrhhitghsohhnrdhmvgeqnecugg
    ftrfgrthhtvghrnhepgfdutdetheelgfeigefgvdelgfeiudeutddthfehveffueefffff
    gedvvdehgfegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrihhlsehjohhhnhgvrhhitghsohhnrdhmvg
X-ME-Proxy: <xmx:bY_3XzyVfXZ-fhHAQaU8GGE3RNfkykWZ8p44t4Kj-JwGkK-QlLLrpg>
    <xmx:bY_3X7PevyeFVIamQ06002fBfb3OQ2Fn3LIHZmkNNKuScQ6DLWj9Bg>
    <xmx:bY_3X49oDhIw1W6Ldj0JKGwIvqIWQ4cTlIr4rh103MtB90KDxJ-rSw>
    <xmx:bY_3X9Gd2UP6cgxQXEC1NFhcbJuCq7oleUE2ie9BQI3TX4Wr9c0u8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A33C4E00D8; Thu,  7 Jan 2021 17:47:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <69c0082d-3505-4d65-889e-452a4ce3cea1@www.fastmail.com>
In-Reply-To: <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
 <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
 <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
Date:   Thu, 07 Jan 2021 17:46:49 -0500
From:   "John Ericson" <mail@johnericson.me>
To:     "Alex Gaynor" <alex.gaynor@gmail.com>,
        "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [Rust for Linux] Happy new year & Poll for call
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Sounds good, see you all there!

On Thu, Jan 7, 2021, at 4:14 PM, Alex Gaynor wrote:
> Thanks for organizing this Miguel!
> 
> Alex
> 
> On Thu, Jan 7, 2021 at 4:05 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Sun, Jan 3, 2021 at 9:18 AM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > I propose next weekend Saturday 9th or Sunday 10th, at some point
> > > between 16:00-21:00 UTC (EU evening / US afternoon).
> >
> > Thanks everyone for the replies! Let's do it Saturday 18:00 UTC then.
> > Hopefully that is not that early for those in PST, just after lunch
> > for EST and not too late for anywhere in Europe. :-)
> >
> > Cheers,
> > Miguel
> 
> 
> 
> -- 
> All that is necessary for evil to succeed is for good people to do nothing.
> 
