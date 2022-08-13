Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325A4C25B0F
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 15:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239794AbiHMP7W (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 11:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239594AbiHMP7V (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 11:59:21 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED56A464
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 08:59:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 5B03E4267B;
        Sat, 13 Aug 2022 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1660406358;
        bh=rgLsI53sN7Ivgplx9KGEsyPgp/T4AJC2vAa5vTyW4kg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=W0bM5JBAyQfqORcJvM3s41DsZaVAU7DSR9K1BAv+sY1zWTn5cQiWrovnj81BoVraG
         S/O0bI8qJzaD4IqdaDim3pdjqdcUzT//eit6VHILjp/88VUj+CO0pgy3YYoeWepgf4
         UMgkOYd+ZRbtUAE1/x8YqhiEgKr9/swyqjnaKeH+B/PvRiae0QnOQvmCZGwR1Kl/SW
         +PE+SufxTgI9IdnrzBI1RiG8Vt2icvc/jrQQ7Rr5B84vrB1p3XKcUCYJ0zItK3vexq
         PfUSX+Y+Ymd6ztF84xWXPtDqfFs8Nr0mwlDeSJXc5zzvTcwEVmsCr2Boi6qtmaNy/9
         EDkQHjLsuBzWw==
Message-ID: <38b91f62-8606-30e7-09b2-4ade40ad4e40@asahilina.net>
Date:   Sun, 14 Aug 2022 00:59:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Writing the Apple AGX GPU driver in Rust?
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Rust for Linux <rust-for-linux@vger.kernel.org>
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
 <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
 <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
 <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
 <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
 <YvfDsavi5gkmbTjh@kroah.com>
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <YvfDsavi5gkmbTjh@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 14/08/2022 00.30, Greg KH wrote:
> On Sun, Aug 14, 2022 at 12:06:08AM +0900, Asahi Lina wrote:
>>> From what I have been told, dual-licensing in the kernel quickly makes
>>> things trickier. Whether your case would be an issue or not depends on
>>> the tree that will pick up your patches, whether they accept
>>> dual-licensed stuff, whether the thing being abstracted is GPL-only or
>>> not, etc.
>>
>> That's odd, I've never heard of dual-licensing being an issue in the
>> kernel. Lots of drivers are dual licensed, as is the DRM core as I
>> mentioned... I did a quick search for SPDX lines and about 10% of them
>> are some kind of dual license in the entire kernel.
> 
> Most of those are legacy drivers and/or for the few Linux subsystems
> that do allow this, like DRM.

I see a lot of dual-licensed drivers in drivers/net/ and sound/soc/...
and nobody mentioned the license being an issue with drivers/soc/apple/
either (the Asahi drivers there are dual-licensed).

Of course, if a driver is based on another driver, then it should follow
the same license (or at least those portions should - if the driver has
several large and independent parts in different files, they could have
different licenses).

> For some subsystems that did dual-licensing, like IB, they regret doing
> that as it has caused nothing but pain and suffering over time and there
> was no benefit in the end at all..  Other subsystems can handle this
> properly but it is a lot of extra work that usually isn't worth it
> (again, DRM is the exception, they know what they are doing here.)

Right, but then the DRM bindings should also be dual-licensed, right?
I'm writing a DRM driver here, that's why I'm bringing this up...

> One of the biggest issue is having dual-licensed code use code from
> gpl-only subsystems.  What happens then is ripe for lots and lots of
> arguing by lots of lawyers.  For core interface code, like the Rust core
> is, avoiding all of that nightmare is a good idea by just keeping it
> simple as a single license (GPL) to remove any arguing at all.

I'm talking about bespoke scaffolding, especially proc macros. Those by
definition do not link with the rest of the kernel, since they run
inside the compiler. I'm not talking about kernel core abstractions...
those should be GPL-only if what they abstract over is GPL-only.

Really, I'm just saying I think it makes sense for Rust abstractions to
follow the license of whatever they abstract, and it might make sense
for shared, scaffolding-type stuff like proc macros to be more
permissive to encourage other OS projects to also adopt Rust without
having to reinvent those wheels.

~~ Lina
