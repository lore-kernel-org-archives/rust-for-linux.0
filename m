Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739CBC25B08
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 06:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbiHMGRk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 02:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiHMGRj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 02:17:39 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249CA82849
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Aug 2022 23:17:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E71CC41A36;
        Sat, 13 Aug 2022 06:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1660371454;
        bh=NNgeXivitsdNEcctB+NsKe9NcoQzwQs2CDq8nQAKInQ=;
        h=Date:From:Subject:To:References:Cc:In-Reply-To;
        b=HLUK5WWPkOcfPuPDm/FN2O571KN4qJR8idfiCTNyztWrv/lCu1eDl+ls34+yUHOVv
         yd/V+Z2JOVUK+BJe9QxX4PYTvKI+50xYZZnTDqLt+BXkE+OJSkypkmy/rknbnfmtRq
         WTDpZjAh3yFPAMhBRDR8HuV0asuWNOttWPSb/mebYtCxi43UEc+T/xC2Auy5rxAkiA
         aOyIZJqc8UHpmffJMz8ftOmx+B7iHll+YUK3+4fxK01f4UG9QjKiAGvyqwzQY+Ooyk
         etTokRxNIFfsyjir6gdVrJKfc+lY9E4RLKyGIR8WecIy3s+XUNKOgV/GvwqFt/lJVJ
         lIdmkJX0UMqjA==
Message-ID: <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
Date:   Sat, 13 Aug 2022 15:17:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From:   Asahi Lina <lina@asahilina.net>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
 <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
Content-Language: en-US
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
In-Reply-To: <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

(Resend, sorry, forgot to Cc: the list!)

On 13/08/2022 02.48, Miguel Ojeda wrote:
> I guess it depends -- for instance, if they would need to understand
> what is going on in your other Rust code for some reason (I don't know
> if that would be the case here), and they cannot easily follow it
> because it is in Rust, then it could still affect them indirectly at
> some point, so they could have a reason to oppose it I guess
> (personally, I think if everybody is reasonable and willing to learn a
> bit, that will not be a problem).
> 
> In other words, we would love to see Rust used everywhere (of course)
> but we have to be mindful about where/how we introduce it (we are not
> even in mainline yet), and be as much in agreement as possible with
> maintainers where it may affect them.

Of course! What I meant is that if, for example, a subsystem maintainer
is concerned about having to maintain the Rust bindings when the C API
changes, having only effectively internal parts of the driver be written
in Rust would insulate them from that issue (for the most part). I
didn't mean I'd want to push it through without their agreement!

I've heard good things about the DRM folks either way, so fingers crossed ^^

How are Rust bindings usually maintained? For something as complex as
DRM, my instinct would be to just let it be maintained by the driver
authors who use that binding (at least initially), adding/changing
things as necessary (and the DRM folks for changes affecting the C core
that need binding updates). But I guess that's also something to discuss
with the DRM team.

>> In particular, trying to make a comprehensive DRM binding as a
>> prerequisite is a huge task, especially if you want it to cover KMS too.
>> DRM isn't a self-contained API surface like most smaller subsystems, but
>> rather a large collection of modular components that are intended to be
>> reused by drivers. On top of that, KMS is quite complex from a
>> programming model standpoint. There's a lot that goes into display drivers!
> 
> There is no requirement to create abstractions for everything of a
> particular subsystem (sorry if that was unclear), i.e. what I
> understood from your previous message is that the subset you need
> (e.g. the render portion of DRM) would be feasible to tackle. Is that
> correct? (i.e. I am referring to the first approach you mentioned)

That's right, though even that portion is really a significant number of
tools/modules, many of them optional. I started looking at that
yesterday, using the Panfrost driver as an example. I also would want to
reuse some Panfrost code where it makes sense, so that also ties into
the question of whether the driver would be 100% rust or not... Here's
what I found:

The MMU code (~750 lines) is largely straightfoward and uses the
io_pgtable common pagetable code. I think I'd end up with mostly the
same approach for AGX, to the point where I can probably copy and paste
the Panfrost code as an example and just adapt it. So, it might make
sense to just leave this bit in C (at least initially), and that saves
us from having to bind io_pgtable and drm_mm. There is some very minor
firmware interaction here, but it is very self contained and doesn't
seem to change from version to version.

The GEM userspace object management glue (~290 lines) is also largely
identical to Panfrost (this doesn't really change much among unified
memory GPUs). That could also be largely copied and adapted, and keeps
most of the drm_gem usage in C land too, so that binding could be avoided.

The driver entrypoint (platform_device, module, etc.) bit is largely
trivial, and it's fairly academic whether that is written in Rust or C.
AGX does its own power management internally, so we don't need to
interact with anything other than basic runtime_pm to suspend the
firmware coprocessor (if desired; it might not actually save much
power). No clocks/resets/anything like that.

The core drm_driver (~690 lines) that includes the callbacks for
userspace requests could be done in Rust by binding that API, but it
could also make sense to leave in C if enough of it calls into other C
bits (the MMU/GEM stuff) that it makes sense to avoid the language
crossing there. If this is C, then possibly only the job submission call
(which is where ~all the driver complexity is) and other auxiliary calls
we define for our driver (tile buffer management, performance counters,
etc.) would need to call into Rust.

The job management is done using drm_sched. That part definitely needs
to be written from scratch for AGX, probably in Rust. I need to talk to
the DRM folks to decide if we need to use drm_sched or we can get away
without it, since the AGX firmware does its own scheduling (which may or
may not be enough for what Linux needs). So if that gets used, drm_sched
probably needs a Rust binding.

Fences and buffer locking use the dma_fence and dma_resv APIs, which
would also need Rust bindings unless that logic lives in a C shim
handling the drm_driver.

The coprocessor interface uses the shared RTKit code that the Asahi team
already wrote. If the driver core is C, that could just be initialized
from C and then Rust would only need the send/receive message functions.
If the driver core is in Rust, that would need a full Rust binding.
Honestly, since I'm very familiar with this bit and it's a simple API,
I'd probably end up binding it fully to Rust regardless, for practice if
nothing else...

The firmware structures need to be allocated from shared memory pools
and mapped using the MMU code I mentioned earlier. I think this depends
partially on how we end up handling this in the Rust side, but if this
were a C driver, the dma_pool API would be the obvious answer. Is any of
that bound to Rust yet? If not, that would be something worth doing,
since it's something a lot of drivers are going to need, of all kinds...

And finally, the real bulk of the driver is going to be interacting with
firmware, which mostly means allocating and mapping structures in shared
GPU memory and interacting with them. Where exactly the boundary is for
all of this depends on how much of what I mentioned earlier is C vs
Rust, but either way, there's going to be a lot of code here, and this
is the part I really want to do in safe Rust since it's where all the
complexity is.

>> Of course, it would be great to move towards a world with more Rust! I'm
>> just trying to be practical and not bite off more than I can chew right
>> off the bat. I do hope that if I can do this in Rust, that might help
>> the Rust-for-Linux project along the way and maybe encourage other folks
>> to try writing new drivers to Rust (or rewrite existing ones).
> 
> Yes, definitely! In fact, I am confident a lot of people would love to
> see Rust used in such a "big driver", and it would be a key driver to
> showcase what is possible (this is what I meant when I said if you
> happened to write a subset of the DRM abstractions, then others could
> follow your lead later on).

I have a question here: what's your view on directly using bound C APIs
from (unsafe) Rust, instead of trying to build a fully safe abstraction?

Of course safe abstractions are better, but trying to design safe
abstractions for everything from the get go might be a pretty big hill
to climb, especially since I'm actually quite new to Rust... so I'm
wondering whether you think it would be okay to start out by mixing safe
abstractions with direct C API usage, and then over time move towards
making more of it safe. I will probably need help from more experienced
Rust folks for that... but in the meantime I could get ahead in writing
all the firmware management code (which should be almost entirely safe
Rust - at least I want that layer to be abstracted out properly) and the
bits that hit unsafe C APIs could be refactored later.

More specifically, I'd like to ask for some help coming up with a Rust
GPU object management approach / API that is safe and works well. I
think if I can do that "right", that will be the most important safety
backbone for the whole driver, and it doesn't have much of a C API
surface behind it (just alloc/dealloc/map/unmap). If it works well,
whether the rest of the DRM/etc APIs are safely wrapped or not initially
is much less of an issue, and that could be refactored later on quite
easily.

> 
>> That's why I went with the proc macro approach, which lets me write the
>> code once and keep it looking like normal Rust code with something that
>> looks similar to #[cfg()] conditionals, except then it magically becomes
>> many code variants in a single compilation step, without involving the
>> build system (more than it already is for proc macros). If I were doing
>> this in C, the only reasonable way I can think of doing it would be
>> #ifdefs and multiple compilation of the same files with different
>> defines (or multiple #includes into one compilation unit...).
> 
> It is probably a good idea to check with those sending the MiBs of
> generated code, in case it is a policy.

I'm pretty sure that's not policy, more like a compromise due to the way
AMD internally handles this... that entire driver was originally quite
foreign code (it was written as OS-agnostic) and I think it was quite
painful to review, if I remember correctly...

Ultimately, the way different drivers approach these problems is up to
driver developers within reason, I think, as long as it doesn't break
with kernel build tooling/code standards. That's why I'm asking here
about the proc macro, because that falls squarely in the Rust-for-linux
camp!

> We discussed it soon after starting and everyone involved agreed to
> use GPL-2.0 everywhere. There was also some discussion about a year
> ago about reusing a file for GRUB modules written in Rust.
> 
> I can raise this point in Kangrejos/LPC to see what is everyone's
> position on it.

It would be nice to see what others think, especially for the DRM case
since that actively shares code with OpenBSD/FreeBSD. I assume at least
making the DRM bindings (and the driver, and my proc macro)
dual-licensed wouldn't be an issue? Of course it's an open question
whether the BSDs would want to add Rust support anyway, it just feels a
bit silly for them to have to rewrite the other macros/helper code as a
prerequisite, because it's a GPLed dependency...

Keep in mind that this is different from supporting proprietary Rust
Linux modules! I don't know what the Rust-for-Linux team's position
there is, but I personally think proprietary modules are not great for
the ecosystem, so I don't really care about that.

On the other hand, if the people trying to get Windows to run on these
machines want to try to port my DRM driver to Windows one day, that
would be pretty funny and I'd encourage it! I hear there's Rust for the
Windows kernel these days...

Cheers,
~~ Lina
