Return-Path: <SRS0=mOKO=ID=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C089C433E9
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 17:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43933650A1
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 17:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhCERny convert rfc822-to-8bit (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 5 Mar 2021 12:43:54 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:33107 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCERnT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 5 Mar 2021 12:43:19 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 009653B54A7
        for <rust-for-linux@vger.kernel.org>; Fri,  5 Mar 2021 17:25:27 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from [127.0.0.1] (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 27D9C40005;
        Fri,  5 Mar 2021 17:25:05 +0000 (UTC)
Date:   Fri, 05 Mar 2021 09:25:02 -0800
From:   Josh Triplett <josh@joshtriplett.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: [Rust for Linux] Poll for call
In-Reply-To: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
Message-ID: <03864FA7-25E8-45DE-AF60-6B82B7C33588@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On March 3, 2021 2:26:15 AM PST, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>Hi all,
>
>It has been about 2 months since the last call. We have a few bits to
>discuss regarding upstreaming, so I think it is a good time to have
>another informal call.
>
>Like last time, you are welcome to join even if you have been busy
>lately but still want to follow development. So don't worry about
>getting up to speed -- I'll give a quick briefing if needed.
>
>I propose next weekend Saturday 6th or Sunday 7th at 18:00 UTC like
>last time (EU evening / US afternoon).
>
>Please let me know which day you prefer, if any, and feel free to
>Cc/invite whoever you want!
>
>Cheers,
>Miguel

Either works for me.
