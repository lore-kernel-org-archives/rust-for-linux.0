Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929CBC19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 13:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbiHMNFV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 09:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbiHMNFV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 09:05:21 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6645B11C2A
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 06:05:19 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id d187so2752466iof.4
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=jZby727aN7UyuVXVjmgOF8sgrfIYZgDYSIk1EYZ76HM=;
        b=T8gSoK2lWHixvXD4I2IVcofSG3VpVVI5tf2OhZP32ZDHSRYjezggZaswlijKcIorBY
         1fqeaiWYWn0qo0SleU/VUqXvGPOCCJPjgo6Yp6Xt65EcNld4EC5VBOXV519pC7Dqm6d+
         OKjySvBDdkynu7dZmZSkCO0X+VOmQA6e5Ck8zkbwqEVX/VMnuOsCrVW5RTvwnEeiCNUq
         aJHQXb97SEkYSOrS3z8kW6z5fasmS9UmiJgLqDMwuxp2CElMSrCsh+v01UUr5aaIQnDl
         9f507Dh4zn1tu1/H+quZIb/GjRfHvtMTJ17ZtmcuZN3jEj/7RYFoolKta0eSdU5UWomU
         ge7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=jZby727aN7UyuVXVjmgOF8sgrfIYZgDYSIk1EYZ76HM=;
        b=4zeYt3sJn0FKqh93B8bzKoNAMsf/WlB5jIRg/NYmxCcbIZEiRTGhtwTi1C9ZFrRSwD
         RSXqv6LzuS4xPvV0CqA57u778Pu8dcY5SNmky4VmzSCWVg0sRHOpcbGcQCO72aZVfwn7
         ckfkxAbirkh5C9/w4pYSFolYDU5xuV/L2bAeSzigiU1VOnxoQLhJu4tgv5rXEiKmi2Qy
         UChO/bpt1VLISPee1wvLNJnvV+pm/Wjm1N+F4YtHd5jNlzq/g3RajyVlgQbpshpaDgUl
         LqGLWHy3W+omzceRNI9QTpS8/Elq8W8Nen7wLlFBcsFduzY3/KMxr6TpEN+kK8K8fccW
         DkgA==
X-Gm-Message-State: ACgBeo0E/kW+NxxwuBRNRsc0/M1I41fuXlzXraXq/iND72lzHAZnMUHB
        xP2dLN7YyK6Ax7aR9cH/whDw3IxAvDkfaCEoy0T1SZEh
X-Google-Smtp-Source: AA6agR7G3xCSQlGnDDaCJlJa8H1jy0w6im3z7XdJjnoPWHsq/d53/j320o22Ob+3SIrS+9k8sCnNgXuQ1RtY7oKfx7o=
X-Received: by 2002:a05:6602:224a:b0:681:2125:a85b with SMTP id
 o10-20020a056602224a00b006812125a85bmr3348239ioo.44.1660395918739; Sat, 13
 Aug 2022 06:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net> <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
 <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
In-Reply-To: <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 13 Aug 2022 15:05:06 +0200
Message-ID: <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Asahi Lina <lina@asahilina.net>
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Aug 13, 2022 at 8:17 AM Asahi Lina <lina@asahilina.net> wrote:
>
> Of course! What I meant is that if, for example, a subsystem maintainer
> is concerned about having to maintain the Rust bindings when the C API
> changes, having only effectively internal parts of the driver be written
> in Rust would insulate them from that issue (for the most part). I

Yeah, it would insulate them, and it could be a last-resort solution,
but we want to encourage the safe abstractions to get written,
supported and reused for many drivers, as well as getting maintainers
on board.

For "core" subsystems (in the sense of APIs that are used
independently by drivers outside that subsystem), I think abstractions
should be allowed to be written even if the subsystem does not want to
maintain them today, as long as somebody is responsible for them.

In the end I think it will be up to high-level maintainers to decide
how they would like the kernel to approach this.

> didn't mean I'd want to push it through without their agreement!

Sorry, I didn't mean you would want to!

> I've heard good things about the DRM folks either way, so fingers crossed=
 ^^
>
> How are Rust bindings usually maintained? For something as complex as
> DRM, my instinct would be to just let it be maintained by the driver
> authors who use that binding (at least initially), adding/changing
> things as necessary (and the DRM folks for changes affecting the C core
> that need binding updates). But I guess that's also something to discuss
> with the DRM team.

So far, for the example drivers etc., we have written the abstractions
that were needed ourselves, but they are not in mainline, so "nobody"
officially maintains them yet.

The goal is to get the respective maintainers to maintain their own
abstractions as soon as possible, since they are the experts and the
ones that know what is best for their subsystem, future changes etc.,
and it is probably the only way that actually scales long-term; but in
the beginning and until things settle, it is indeed a bit of a
chicken-and-egg problem (see also the point above about the "core"
subsystems).

Starting with v9 we sent a very small subset of all of the
abstractions we have, so it will be easier to submit the rest piece by
piece to the respective owners.

(By the way, in case it is confusing, I avoided the term "bindings"
here because we typically refer with it to the raw, automatically
generated ones).

> That's right, though even that portion is really a significant number of
> tools/modules, many of them optional. I started looking at that

If some tools/modules are optional, and you don't need them for your
driver, I think it is fair to only cover what you need (even down to
the function), especially nowadays that we are starting.

> were a C driver, the dma_pool API would be the obvious answer. Is any of
> that bound to Rust yet? If not, that would be something worth doing,
> since it's something a lot of drivers are going to need, of all kinds...

Wedson wrote a NVMe driver prototype which included a draft DMA module
(e.g. with a `Pool` type to wrap `dma_pool`). Andreas took that code
and is working on the NVMe driver now. FUJITA Tomonori has also been
working on another NVMe driver, too, and wants to submit DMA
abstractions too from what I understand.

> I have a question here: what's your view on directly using bound C APIs
> from (unsafe) Rust, instead of trying to build a fully safe abstraction?
>
> Of course safe abstractions are better, but trying to design safe
> abstractions for everything from the get go might be a pretty big hill
> to climb, especially since I'm actually quite new to Rust... so I'm
> wondering whether you think it would be okay to start out by mixing safe
> abstractions with direct C API usage, and then over time move towards
> making more of it safe. I will probably need help from more experienced
> Rust folks for that... but in the meantime I could get ahead in writing
> all the firmware management code (which should be almost entirely safe
> Rust - at least I want that layer to be abstracted out properly) and the
> bits that hit unsafe C APIs could be refactored later.

We are avoiding direct C calls from Rust drivers (and our goal is to
forbid them) -- but it is possible to create unsafe abstractions.

That way, you don't need to figure everything out in the beginning and
how safe the abstraction could be, but your driver gets already a more
Rust-like API, the advantages of the Rust type system, preconditions
get documented, etc.

Then later you can refine the abstractions to reduce the amount of
unsafe APIs as much as possible.

> More specifically, I'd like to ask for some help coming up with a Rust
> GPU object management approach / API that is safe and works well. I
> think if I can do that "right", that will be the most important safety
> backbone for the whole driver, and it doesn't have much of a C API
> surface behind it (just alloc/dealloc/map/unmap). If it works well,
> whether the rest of the DRM/etc APIs are safely wrapped or not initially
> is much less of an issue, and that could be refactored later on quite
> easily.

There are some people with quite some experience already coming up
with non-trivial abstractions (Wedson, Boqun, Andreas...), so I think
you will not be alone. Bj=C3=B6rn and Gary are our main in-house Rust
experts, and can help with out-of-the-box approaches too :)

> Ultimately, the way different drivers approach these problems is up to
> driver developers within reason, I think, as long as it doesn't break
> with kernel build tooling/code standards. That's why I'm asking here
> about the proc macro, because that falls squarely in the Rust-for-linux
> camp!

We try to avoid proc macros where possible, in order not to make
things too implicit or "magical". But sometimes it is the right
solution/balance -- this may be one of those cases. We just keep the
bar high for new ones (e.g. Gary led the `#[vtable]` push).

> It would be nice to see what others think, especially for the DRM case
> since that actively shares code with OpenBSD/FreeBSD. I assume at least
> making the DRM bindings (and the driver, and my proc macro)
> dual-licensed wouldn't be an issue? Of course it's an open question

From what I have been told, dual-licensing in the kernel quickly makes
things trickier. Whether your case would be an issue or not depends on
the tree that will pick up your patches, whether they accept
dual-licensed stuff, whether the thing being abstracted is GPL-only or
not, etc.

Cheers,
Miguel
