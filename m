Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258A6C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB56C6112F
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbhD0K7W (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:59:22 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43171 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230365AbhD0K7S (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:59:18 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 55C6C5C0070;
        Tue, 27 Apr 2021 06:58:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 27 Apr 2021 06:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=fI9ULTwzvzpqHkrBRVcAC2U/hNL
        0PEgi2IWwBkSJxJM=; b=I7tuFZhg5ut6NQbrXsVUd7PLBhhXTaMAV2HzqyPBsry
        Ysunlk3379XXsyblNr1kGaWcM+M3WA5cyGJ8SUbyr2KZ6506Xh1aAKgGOoxeScDi
        Q4bnSeqlDIR6y6phZPPrz5kxH7jXtgEUrj4IwYFKzWcKKhqJGH9Y40eFDzK5LzkF
        dmIjCpcn0FnK7fevP5ekPRl/ilGC8APUQakG5Bs7MpfQS/y6WzvwXmR/6wvjpv6n
        UQGWtKn6SU/CpDpNuMoJSHmotFmqixIWInC3CkYa1PXKrSFHAyV+hjW9G1tHcTWT
        IrmhYIoZl2IaVp7OgiWU6xB/6WUM3QA73m5/oiTDmng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fI9ULT
        wzvzpqHkrBRVcAC2U/hNL0PEgi2IWwBkSJxJM=; b=wid3aF2vYvDVpDrFm9ZWh0
        3oWlOFQqU4OXzNJGd2NsbsICykPpAkN0EF+CWaXbaaUnUmMo0vDmMYCaTcRuXpWa
        dg87cYHeJ+LOirwnyv6HzCxaRJcLVQ+NAig1WugGT1IkSKgiHbb0Q2f4VzSqEyez
        CNOoCJUmJ+zIRFi7OvJ4dqFaurYtbRrNPm01UynjLcsXFriMyGa5qqMm5cvll488
        mWC5SWxylqBnaxwa4ew9GBUEdTqhqJzSQFVG9Gl74JfLO2SF6Zkc1r51YvTXBB5b
        W7c5PH1riKoI8t/hyVJazehj+XINAOYLw5etccESSvxqVLRnQ3/TsHrHqOtbmf0A
        ==
X-ME-Sender: <xms:Wu6HYBGpcIt2QOWyjTOK74V0js9Bqwo8pCMywL04StjLnucNdrQqkg>
    <xme:Wu6HYGVef3hBAtMoE24NQzbPB06E012PLu1D5Srj2_dQfwzmKv02wZUe68NGT6vns
    ygUk6iQLZ25pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvtddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgfetfefftedvffeltdegudduteffuddtudevfeevtdeuge
    eugefgieetheefteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Wu6HYDJHhk9ekIC4XhkbdFMFu4lr1eVC55yr1coHT3jiE2Kt4l79iw>
    <xmx:Wu6HYHGoHsNMvryNy0Jn6fEcEr3SxZ1dx6gNcmtW2MGZg73NtR6OaA>
    <xmx:Wu6HYHUC0yE6T4SUk_4J8BJpkO3CCELEse6rLXIBcwiHlz5hhhn-yQ>
    <xmx:Wu6HYCStj0E05tfZV1NJ_6ElQkOVsFVbctbHY0VHiKE_fqUy1P8sHQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 27 Apr 2021 06:58:33 -0400 (EDT)
Date:   Tue, 27 Apr 2021 12:58:31 +0200
From:   Greg KH <greg@kroah.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Carlos <carloscarral13@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: Exposing semaphores
Message-ID: <YIfuV+S7Umsuqz9C@kroah.com>
References: <YIdUf1C5VtWn/D2G@localhost.localdomain>
 <CAGngYiUMFuzRmjM5__RUTZsp9N63zr+Y6R7kVuMU5BxRS17wcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiUMFuzRmjM5__RUTZsp9N63zr+Y6R7kVuMU5BxRS17wcw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 27, 2021 at 06:18:52AM -0400, Sven Van Asbroeck wrote:
> Hi Carlos,
> 
> On Mon, Apr 26, 2021 at 8:02 PM Carlos <carloscarral13@gmail.com> wrote:
> >
> > I recently began assessing what functionality from the kernel is missing
> > for implementing a basic scull driver.
> >
> > Semaphores are the first missing primitive that caught my attention, and
> > being such an important part of the kernel itself, I will make exposing
> > this functionality my first priority instead.
> 
> Isn't scull's semaphore used exclusively in mutex mode, i.e.
> initialized using init_MUTEX?
> 
> If so, prefer "struct mutex" instead. At the time scull was written
> (over 15 years ago) it did not yet exist.
> A Rust-for-Linux abstraction is already available:
> https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/mutex.rs
> 
> This is before my time, but I believe that the use of "bare" struct
> semaphores in drivers used to be a common anti-pattern, often
> resulting in buggy code and/or performance issues - most semaphores
> have been replaced by conceptually safer, higher-level primitives, and
> today one needs a valid excuse to use them in new or even refactored
> driver code. But I do not know the full story.

I agree, never try to ab-use a semaphore in the way we did it in the
book, that is not a good "pattern" to follow for the majority of kernel
drivers.

A simple mutex should be all that is necessary.

But also, while the CUSE driver has a lot of history, it really was only
created as an example to show how things could work, it isn't all that
useful in the real world :)

thanks,

greg k-h
