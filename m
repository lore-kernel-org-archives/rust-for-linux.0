Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9674C19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 15:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbiHMPGQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 11:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbiHMPGP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 11:06:15 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C1D10FFF
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 08:06:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id AD6FD4267F;
        Sat, 13 Aug 2022 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1660403171;
        bh=9hwWmTI/6uitQCAgHC9hp8k4uSFOBpI5WFOBHpEcN/g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=CQ+9BFtYn1erizF0uhQp7esRmngompNkIO/xz+JEFqxNbSBImf8eMIfON4wHas0yz
         10mO4eNqMeyjpIq2BXYr4xItF9ZxFtdZVBCQrI12G6WVG5hCGtzC3xaWMFySdvIDbh
         3Wu7zFXvMJ3ruUVulyKXja/B3IMWQkOoabzmV5a5Mb+VVkU+Jdn8oC7Eoq3NIbuBo1
         GCxBTaMFRc2QZJuRZMdrKFa9UQ7cD/HENcEXbQTEMC0LIbf7ZavYU0pvTLBbkIbCyj
         lWHODk05rbFCCR1dHDJ3xya5M0wvn0kGiPvPr8ApKGAcvwUcue6KSYm1Ouoziovu/4
         XEpTvUFoELbGQ==
Message-ID: <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
Date:   Sun, 14 Aug 2022 00:06:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Writing the Apple AGX GPU driver in Rust?
Content-Language: en-US
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
 <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
 <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
 <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 13/08/2022 22.05, Miguel Ojeda wrote:
> For "core" subsystems (in the sense of APIs that are used
> independently by drivers outside that subsystem), I think abstractions
> should be allowed to be written even if the subsystem does not want to
> maintain them today, as long as somebody is responsible for them.

I think the main issue there is that refactoring that changes the C API
also has to change the abstractions, so if the people making those
changes don't want to touch Rust... how would that work out? Refactoring
patches couldn't be submitted if they break the Rust side.

(Of course, ideally people aren't scared of Rust and simply make the
changes themselves!)

> The goal is to get the respective maintainers to maintain their own
> abstractions as soon as possible, since they are the experts and the
> ones that know what is best for their subsystem, future changes etc.,
> and it is probably the only way that actually scales long-term; but in
> the beginning and until things settle, it is indeed a bit of a
> chicken-and-egg problem (see also the point above about the "core"
> subsystems).

Right, that makes sense.

> If some tools/modules are optional, and you don't need them for your
> driver, I think it is fair to only cover what you need (even down to
> the function), especially nowadays that we are starting.

That's good to know! A lot of the APIs have pretty long function lists,
of which you only end up using a subset for any given driver.

> Wedson wrote a NVMe driver prototype which included a draft DMA module
> (e.g. with a `Pool` type to wrap `dma_pool`). Andreas took that code
> and is working on the NVMe driver now. FUJITA Tomonori has also been
> working on another NVMe driver, too, and wants to submit DMA
> abstractions too from what I understand.

Cool! Do you know where these branches are being developed? I didn't see
them in the main Rust-for-Linux tree yet.

> We are avoiding direct C calls from Rust drivers (and our goal is to
> forbid them) -- but it is possible to create unsafe abstractions.
> 
> That way, you don't need to figure everything out in the beginning and
> how safe the abstraction could be, but your driver gets already a more
> Rust-like API, the advantages of the Rust type system, preconditions
> get documented, etc.
> 
> Then later you can refine the abstractions to reduce the amount of
> unsafe APIs as much as possible.

By unsafe APIs you mean abstractions to make the API more idiomatic
Rust, without necessarily enforcing all invariants (and therefore marked
unsafe), right? I think I can work with that, if so! It would definitely
be very useful to start to document the preconditions as part of it (the
C kernel documentation is often quite terrible at this...).

>> More specifically, I'd like to ask for some help coming up with a Rust
>> GPU object management approach / API that is safe and works well. I
>> think if I can do that "right", that will be the most important safety
>> backbone for the whole driver, and it doesn't have much of a C API
>> surface behind it (just alloc/dealloc/map/unmap). If it works well,
>> whether the rest of the DRM/etc APIs are safely wrapped or not initially
>> is much less of an issue, and that could be refactored later on quite
>> easily.
> 
> There are some people with quite some experience already coming up
> with non-trivial abstractions (Wedson, Boqun, Andreas...), so I think
> you will not be alone. Björn and Gary are our main in-house Rust
> experts, and can help with out-of-the-box approaches too :)

That's glad to hear! I see Björn already replied on Zulip, so hopefully
they can help figure it out ^^

> We try to avoid proc macros where possible, in order not to make
> things too implicit or "magical". But sometimes it is the right
> solution/balance -- this may be one of those cases. We just keep the
> bar high for new ones (e.g. Gary led the `#[vtable]` push).

Fair enough! I couldn't come up with any reasonable way of doing this
without proc macros (even with a lot of brainstorming with folks more
experienced with Rust the other day)...

>> It would be nice to see what others think, especially for the DRM case
>> since that actively shares code with OpenBSD/FreeBSD. I assume at least
>> making the DRM bindings (and the driver, and my proc macro)
>> dual-licensed wouldn't be an issue? Of course it's an open question
> 
> From what I have been told, dual-licensing in the kernel quickly makes
> things trickier. Whether your case would be an issue or not depends on
> the tree that will pick up your patches, whether they accept
> dual-licensed stuff, whether the thing being abstracted is GPL-only or
> not, etc.

That's odd, I've never heard of dual-licensing being an issue in the
kernel. Lots of drivers are dual licensed, as is the DRM core as I
mentioned... I did a quick search for SPDX lines and about 10% of them
are some kind of dual license in the entire kernel.

The Asahi Linux project encourages dual-licensing so other OSes and
projects can also use the code if they want, and I don't think anyone
has mentioned that being an issue for the things that have been
submitted so far... As far as I know, you can license drivers however
you want (as long as one license is GPL or GPL-compatible), and then if
someone wants to use it under the non-GPL license in another context,
it's up to them to replace any usage of GPL-only APIs with
reimplementations (though usually you'd have to change all that code
interfacing with the rest of the OS anyway, so it's often a moot issue).

Of all drivers, this one is probably the most important one that other
OSes would want to port directly... and of course, DRM accepts
dual-license drivers, and the largest ones already are. That doesn't
mean all the abstractions have to be dual-license, but I think the
abstractions for code that itself is dual-license should be, like much
of DRM... otherwise merely using Rust ends up having more restricting
licensing than not, which doesn't feel right?

For example, this fairly large subset of Linux DRM is used directly by
FreeBSD under a permissive license:

https://github.com/freebsd/drm-kmod/tree/master/drivers/gpu/drm

Cheers,
~~ Lina
