Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F19C433ED
	for <rust-for-linux@archiver.kernel.org>; Sat, 24 Apr 2021 21:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 259A4611ED
	for <rust-for-linux@archiver.kernel.org>; Sat, 24 Apr 2021 21:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbhDXVIq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 24 Apr 2021 17:08:46 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:50392 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbhDXVIp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 24 Apr 2021 17:08:45 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id AD59FC3DA7
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Apr 2021 17:08:06 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
        :to:subject:message-id:mime-version:content-type; s=sasl; bh=Tgg
        a4JrCWAiv8ku2mJquC6mY2yZo11WQPYSakMzTG7w=; b=R5AMFMGSMz9apiP0fnh
        B71106oMV7WkzL/ELhU18gTWSAJi2c4H8WNE4kYd/btwzFDyvTInmXnM+dmAiqn2
        FBRJEnnzYnWwmC3Kk8zvHnGMxxNRafZRJMWNf5OfwAQ5peiYF9AIXx6h55TTW0Yp
        z2YqBpFIndxkVtzvIEUWEJjE=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id A3C50C3DA6
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Apr 2021 17:08:06 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ldpreload.com;
 h=date:from:to:subject:message-id:mime-version:content-type; s=mesmtp;
 bh=Tgga4JrCWAiv8ku2mJquC6mY2yZo11WQPYSakMzTG7w=;
 b=uDCSKz5s2FJD9rtEWMNmzKuHC8qDuRqgTgDU3fBn65Cle6FmPrjkwWREVXUR4N4K6XmxSoSaqTHMmCWn7l8juJE8bI5Zm5Hl4eyIgKwHlF1vxj4DysEbKFLvkv2elamlS1eezyFG1aARR3kHedVl8xqgXkEbYO0y3zhYAX4jLkU=
Received: from cactuar.ldpreload.com (unknown [198.27.64.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 83560C3DA4
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Apr 2021 17:08:05 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
Date:   Sat, 24 Apr 2021 17:08:04 -0400 (EDT)
From:   Geoffrey Thomas <geofft@ldpreload.com>
To:     rust-for-linux@vger.kernel.org
Subject: Notes from 2021-04-24 call
Message-ID: <alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com>
User-Agent: Alpine 2.11 (DEB 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
X-Pobox-Relay-ID: 29ACA7B8-A541-11EB-80C5-74DE23BA3BAF-67873895!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Here's what I remember, please let me know if I misssed anything!

Meeting infrastructure and timing
===

We've been offered the use of LWN's BigBlueButton server if we want to 
switch to that instead of Google Meet. It seems like a good choice but 
there weren't a lot of very strong opinions either way.

Also, there were a good number of attendees who were interested in this 
work on behalf of their day job, so we might want to have a meeting on a 
weekday. We might also want to find a time that works better for Asia time 
zones, or alternate between the two times.

(The meeting also went two hours long - in my opinion we should just plan 
on that for the future, there's plenty of stuff to discuss. :) )

GitHub Actions
===

GitHub is no longer running Actions (their CI service) for new 
contributors to prevent abuse:

https://github.blog/2021-04-22-github-actions-update-helping-maintainers-combat-bad-actors/

It also seems like some existing contributors are being categorized as 
"new contributors" by GitHub. If CI isn't running for you, just ask (here 
or GitHub) and someone will add you.

panic and doesn't-panic annotations
===

We should make sure that any Rust code that (for now) intentionally calls 
panic!() or equivalent (.unwrap(), etc.) has a comment explaining that it 
panics under certain conditions, so we can find it and clean it up later, 
e.g. when we have support for fallible allocations.

Also, we should make sure that any code that panics that expects not to 
actually panic in practice (e.g., we can convince ourselves that a certain 
unwrap will always succeeds, but we can't fix the types) has a comment 
explaning why we believe it's fine.

There's a discussion here: 
https://github.com/Rust-for-Linux/linux/pull/207#discussion_r619298277

(Hm, probably we should have some brief coding-style docs on this?)

BUG vs. OOPS
===

There's a desire to avoid increasing the use of BUG and exposing BUG to 
Rust code via the panic mechanism. It seems this was just a 
misunderstanding by me/Alex in the initial code - we were expecting that a 
panic should just crash the current thread but should not crash the entire 
kernel. The right thing to bind to is OOPS. On the C side, dereferencing 
an invalid pointer gets you an OOPS, not a BUG, so Rust should do the same 
thing in the same scenario (but _before_ actually dereferencing the 
pointer :) ). This should be a quick change, it doesn't seem like there's 
a particular reason we needed BUG.

liballoc and fallible allocations
===

Rust's "liballoc" is the portion of the standard library that wraps the 
system allocator (e.g. malloc in normal userspace) and provides various 
container types, e.g. Box for plain allocated objects and Vec for 
growable allocated vectors/arrays.

One of the (very understandable!) major points of concern with the initial 
RFC was that the liballoc types panic on allocation failure. This is 
generally fine in userspace (especially if your OS has overcommit) but not 
for the kernel. The upstream Rust community is interested in extending 
liballoc so that it can report allocation failure through a normal Result 
type ("fallible allocations"), but there are some open design questions.

Miguel proposed maintaining a temporary in-tree fork of Rust's liballoc 
that has only fallible allocations. The strong advantage of that is that 
it allows us to iterate on the design and provide feedback to upstream 
Rust, without running into trouble with the stability process. The 
downside is that all code in the kernel tree is generally expected to be 
open to changes by kernel developers (with a few exceptions, e.g., ACPICA) 
and we want to make sure this is indeed a temporary fork.

The current best plan seems to be to say that, as maintainers, we'll 
accept minor changes that don't make big changes to the APIs. If people 
want to add Linux-specific changes that won't necessarily get accepted in 
upstream liballoc, that's okay, provided that it doesn't impact our 
ability to drop the fork later.

We discussed whether we want to set up CI to test that you can replace the 
in-tree version with the latest upstream liballoc, with unstable features 
enabled, and builds/tests still work. It's an interesting idea, but the 
difficulty is we do actually want to introduce new APIs or change some 
return types to Result, so we can't use upstream liballoc yet. (Maybe once 
we get a draft design into upstream liballoc, we can come back to this.)

There's some work in upstream liballoc to make it handle environments that 
cannot panic on allocation failure (not just us, but also embedded 
systems). Here's a work-in-progress PR to disable all methods that could 
panic on allocation failure:

https://github.com/rust-lang/rust/pull/84266

Also, it seems like getting a bunch of try_* methods (try_new, try_push, 
etc.) would be acceptable upstream.

GFP flags
===

Another challenge with allocation is that the kernel allocator takes flags 
indicating which context an allocation is in (e.g., whether it can block, 
cause filesystem activity, etc. to make some room), and the standard Rust 
APIs don't really give us a way to specify that.

For things like "am I running in interrupt context and therefore cannot 
block," we really want to figure out how to make this automatic in some 
manner, because it's easy to get wrong in C already.

For "allocate memory from a specific region of physical memory for device 
drivers" (e.g., GFP_DMA32), it doesn't seem like there's a lot of sense in 
allocating the richer collection types - your device hardware probably 
isn't going to know what to do with a BTreeMap. We think it will be enough 
to have code request raw pages and, if needed, use unsafe 
{from_raw_parts(...)} to get an object they can work with safely.

Kernel Summit and Plumbers
===

The Kernel Summit and the Linux Plumbers Conference are coming up this 
summer, possibly in Dublin, possibly virtual. Both of these seem like a 
good place to work out concerns that kernel developers may have. We should 
probably propose something for both.

I believe Nick and Josh will submit something for Kernel Summit, which 
wants submissions fairly soon. For Plumbers, we should submit something to 
the microconferences (which are for discussions, as opposed to the 
refereed track which is for presentations), and the microconference 
submissions will open later.

Safety, terminology, benefits
===

There was a good bit of discussion that the "safety" value proposition of 
Rust may not be totally clear to people who have been writing C for a very 
long time and for whom Rust is new - to some extent, the entire idea that 
you can write serious systems code in a "safe" language is the innovation 
of Rust, and people might be thinking of Rust as a langauge that's more in 
the space of Java/Python/etc. in order to be safe.

There was also a mention that the term "RAII" was new to at least one 
experienced kernel developer, and and a mention that the idea of 
"zero-cost abstractions" was surprising to people.

It would very likely be worth us having some documentation explaining how 
these things work - especially what we mean by "safety" and how one could 
possibly write device drivers (which need to access raw hardware) in a 
"safe" language.

Sample drivers
===

Along those lines, a priority, but not as high as sorting out our liballoc 
story, is having more sample drivers.

One idea that was floated was to port the "scull" driver from the _Linux 
Device Drivers_ book to Rust.

We've also been asked to provide some sample drivers - but it seems 
worthwhile to put a little disclaimer that if we're porting existing C 
drivers to Rust, it's as a demonstration to see what it would look like in 
Rust, and not a proposal to immediately mass-rewrite everything in Rust. 
Also, it was mentioned that if you're rewriting an existing C driver, you 
need to keep the copyright statement on the existing driver.

Samantha Miller, the lead author of a neat-looking academic project to 
implement some filesystems in Rust 
(https://gitlab.cs.washington.edu/sm237/bento), was on the call and and 
expressed interest in using the Rust support that's being proposed for 
upstream. Some of these filesystems might be starting points for examples 
of Rust drivers to include upstream.

Other notes
===

I remember someone mentioned something about control flow graphs and 
having the compiler automatically do something, but I forget the details - 
was this about tracking panics? or tracking GFP flags?

-- 
Geoffrey Thomas
https://ldpreload.com
geofft@ldpreload.com
