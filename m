Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A22C433E0
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 14:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6B3323884
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 14:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbhAHOf5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Jan 2021 09:35:57 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48707 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbhAHOf5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Jan 2021 09:35:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 792161A90;
        Fri,  8 Jan 2021 09:35:11 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute1.internal (MEProxy); Fri, 08 Jan 2021 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=syImBwPVUrUUf9vBLpsirZQrX96A
        z1feZM1HFngf3rg=; b=XYHD/TbGXJo+RZrL1blwu4yTlrwZkHpznipfPqAeTQQZ
        05rR8u3noCJshwb+ogc7c1iZer5gQfeSJwa47EbHs7KVqF8yDzNyiNzTHHRSqLbv
        /PdBsTNH2++sAzv2ZERbjUvW2M2+ZED7PB0U3juMGkHpLqYPohr89WyNaUX07c29
        Oikv5PahotiKh7rWBB3w+1Hqo8yJJRuLCGBjc90VHIkufO/dTG3ZbyfayHpy3a7t
        ekBrM6jtwP3eme2k5a5HDUsdzWYK4Or2owbLpYti+SShyIhtJsdYv17lKPDuqFR1
        Ea1/lJkzBJNpzNf/jZTbqD8S4XgC8wD7UWIonoBhLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=syImBw
        PVUrUUf9vBLpsirZQrX96Az1feZM1HFngf3rg=; b=dSZ7LUNcASTdnVSCinx88f
        TfSQ//lYIqve0ZodnLlt0MHrr0B9L3GjaQFKhfsb48SWmQlN3l5MSzsQfSGCEJAu
        6BmUXfiFFVefMUtK2YId3SwtVe0vIsnhwWQZ056rtJ0FhymzUxDYKsO8/yYeAJoI
        yULCuhmXKlIpN7jfdc0knnHYXf3IRXCKWF/wYQrzH2tz/JQr+end1u/zdxzflasP
        8f041V57RvlM8+3dBrlrTRqZh7gFAi+psETbdoDQCQmMxaqkj996CGL1wHkACkcr
        TlyQfTIa9XwwdndC6DpWOdylx3fhz9ClOszq0YTKKsKxsDA1iQJlzfse12yYreSg
        ==
X-ME-Sender: <xms:nm34X5orXqQ1bJr7wDKzVoI_k8mvxos0uPa9gatcJH2OXA89YBHgGA>
    <xme:nm34X7oIM53bOsX9nb_d-zwBFKT6xDVF_i_oUHE31K18vxO6QfPhxf5z0lF5G6KiE
    kgSsq1ypHq1e3cAMQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedflfhohhhnucfgrhhitghsohhnfdcuoehlihhsthesjhho
    hhhnvghrihgtshhonhdrmhgvqeenucggtffrrghtthgvrhhnpedvhedtvedtiefhieefle
    elteehgfduveehteevveelieetheektdeikeeiheejjeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhsthesjhhohhhnvghrihgtshhonh
    drmhgv
X-ME-Proxy: <xmx:nm34X2MrahfH_VWGKsSmV6_P523llQDDOs820qgpulWHWcL_0cBTHQ>
    <xmx:nm34X07XVnkl2PV03Z3ozqWOqXHtP6mgHRzjQboAW3BIsCB5vlfkLQ>
    <xmx:nm34X46ElQsqXVuCyDu0bNWgKgdlMxvlYhHIAHYn9Az7eZ2BK8lx9A>
    <xmx:n234X9XYpS5ZuQOjUUaFV9WRub229tuFtDFLy0zKoxUescS703HimQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3484BE00DC; Fri,  8 Jan 2021 09:35:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <f8fc7d60-9f9f-4892-85f9-1ae1d20f3291@www.fastmail.com>
In-Reply-To: <CANiq72mb4G=Hb9j8BxxFFXwW2YvU72KbPYDw3SvV1Wn080gEjA@mail.gmail.com>
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
 <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
 <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
 <69c0082d-3505-4d65-889e-452a4ce3cea1@www.fastmail.com>
 <79e121e9-a651-4dca-af50-1f82bee8aed5@www.fastmail.com>
 <CANiq72mb4G=Hb9j8BxxFFXwW2YvU72KbPYDw3SvV1Wn080gEjA@mail.gmail.com>
Date:   Fri, 08 Jan 2021 09:34:48 -0500
From:   "John Ericson" <list@johnericson.me>
To:     "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [Rust for Linux] Happy new year & Poll for call
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jan 8, 2021, at 3:26 AM, Miguel Ojeda wrote:
> On the topic of -Z build-std, I have been working on [1] which integrates the building of core, alloc, etc. in Kbuild instead of using build-std.

Oh cool!

> even if build-std stabilizes, starts getting used by rustbuild itself, etc.

And for what it's worth, I think this approach also benefits from build-std maturing, because it's really compiling the standard library from the source alongside the rest of the (Rust parts of a) project vs using pre-built binaries that is the crucial distinction here. Both build-std and this are squarely the former not the latter.

John
