Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568D1C00140
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 Aug 2022 04:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiHLECC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 12 Aug 2022 00:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiHLECB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 12 Aug 2022 00:02:01 -0400
X-Greylist: delayed 50266 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 11 Aug 2022 21:01:59 PDT
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194C79C234
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 21:01:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 38122425BD;
        Fri, 12 Aug 2022 04:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1660276916;
        bh=TJC7frcAaMmT+/k2IxSJ1DCTfXpkR5jLMUZ00nvVxTE=;
        h=Date:Subject:To:References:From:Cc:In-Reply-To;
        b=VXCfgwQF3skAxoHGVZcl0Po3UNMj7pyXgjJwHLuzrWwix2HMPvl3skB2n5NHr1Jjd
         VtUSdJ60rZJjGSN14sdypMbNN672vxzAZskjXDPrc7EvcvIUMUjCTOF2c9f64Cb9z+
         XA+FSUrVpDajkOCATLuOstT1MEWa2vjYaY41+0NM7GZNEcieac5Z0SD/dxcvOs67Om
         fyAtc/S8ufx2yfhI0FyC5GN31qPOd1piiJmyoGMS8mzw1Lat73Tr340tE0nUZr0lQ9
         PkVILBGERC9a3feATVkEh/R3vvPiZr1hh+BdH0mOPKEY3PcWxjLvH4eL8wflJQR8QM
         AxjugcW7PL/Ww==
Message-ID: <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
Date:   Fri, 12 Aug 2022 13:01:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Writing the Apple AGX GPU driver in Rust?
Content-Language: en-US
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
From:   Asahi Lina <lina@asahilina.net>
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
In-Reply-To: <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 12/08/2022 03.45, Miguel Ojeda wrote:
> On Thu, Aug 11, 2022 at 4:29 PM Asahi Lina <lina@asahilina.net> wrote:
>>
>> I'd like to hear your thoughts about how crazy an idea this is. ^_^
> 
> It is less crazy than writing it in Python, for sure ;)

Well, considering I'm crazy enough to sign up to reverse engineer
Apple's GPU in the first place... ^^;

> But joking aside, using Rust for a particular subsystem is up to the
> maintainers of the subsystem. From what I understand (please correct
> me if I am wrong!), you are part of the Asahi team, so you are your
> own maintainers, thus it is up to you to decide!

Kind of! marcan & Sven are the maintainers for the soc/apple subtree for
Apple Silicon hardware and that covers a couple drivers and the device
trees directly, but most individual drivers go in other subsystems and
therefore go through those maintainers (the team has a global
MAINTAINERS entry that tries to cover everything, but it doesn't
override individual subsystem maintainers). The GPU driver would fall
under the DRM subsystem (though it would have RTKit as a dependency,
which is in soc/apple).

> Now, of course, reality is more complex than that, and you will
> probably want to discuss things with the DRM people to see if they
> would be willing to accept and/or maintain their part of the Rust
> bindings you may need etc.

Yes, I'll also ask around the DRM folks to see what their take on this
is! I just wanted to get an idea from the Rust side first.

But this also ties into the question of where the Rust boundary is: even
if, for some reason, the DRM folks were against Rust bindings entirely,
I would still want to write parts of my driver in it, even if it means
calling into them from a smaller DRM C driver, since it would make my
life much easier as the author/maintainer of this particular driver!

> In any case, one quick note: so far, we have been doing the "Rust
> driver that talks to Rust safe abstractions that for the most part
> wrap existing C facilities" approach. While it is of course
> technically possible to mix C and Rust in other ways, and it may be
> the case that we need to do it as some point, it would be best to
> avoid having to expose C APIs from Rust code, to avoid losing the
> advantages of the type system. So writing the entire driver in Rust
> would be the way to go if I understood you correctly, and would make
> also things much easier for others later too, since some safe
> abstractions for DRM would be there already etc., which I am sure
> people will appreciate a lot in the future!

Keep in mind that GPU drivers are complex and themselves consist of
multiple semi-independent components (this isn't a GPIO driver!). Safety
isn't all-or-nothing, right? So it might make sense to focus on doing
the subset that benefits most from Rust's features and safety (which in
my mind is all the GPU firmware interaction, including render job
submission/management, high level memory management, etc.) in Rust first
and then consider moving more code to Rust over time, instead of jumping
straight into "let's bind all of DRM into Rust".

In particular, trying to make a comprehensive DRM binding as a
prerequisite is a huge task, especially if you want it to cover KMS too.
DRM isn't a self-contained API surface like most smaller subsystems, but
rather a large collection of modular components that are intended to be
reused by drivers. On top of that, KMS is quite complex from a
programming model standpoint. There's a lot that goes into display drivers!

But when you focus on GPU render drivers, a lot of it can be simplified
down to a small interface that mostly maps to the userspace interface:
alloc/dealloc memory, submit job, wait for job (there's more to it than
that, but that's really the bulk of it).

Later today I'm going to start looking at other DRM drivers to try to
come up with a more concrete plan, but based on what I know so far, the
driver is going to have at least three major parts (which already exist
as such in the Python prototype):

1. GPU MMU (UAT) page table management
2. Object alloc/dealloc, ownership and lifetime management
3. Firmware interaction, including:
  - Initialization
  - Logging
  - Render job submission
  - Fault handling
  - Stats

And I'm thinking (1) will likely reuse a lot of common MMU code and is
fairly self contained, so that could be written in C instead of trying
to bind those APIs; DRM already provides some facilities for (2) (GEM)
which I'd then want to bind to Rust and extend, and build a richer,
safer layer on top of; and (3) I definitely want to do in Rust because
that's where all the real complexity is, but it's almost all bespoke
code (though it'd talk to RTKit, that needs a Rust binding), so the
question of whether the underlying interface to the DRM render subsystem
is a full Rust binding or some calls from a small C driver is
comparatively academic, I think (and could be refactored later).

As another example, we already have a display driver written in C which
uses the DRM KMS interface, and has a similar firmware ABI issue (plus a
bunch of crazy complexity in the ABI that we haven't even gotten to
yet). That whole "talking to firmware" portion would benefit a lot from
being rewritten in Rust using the same proc macro approach I tried (and
significantly improve safety on its own, since we have to assume
firmware is untrusted...), effectively using Rust as a binding language
for the firmware call ABIs, but I'm not sure that rewriting that entire
driver in 100% Rust is practical in the short term, with the complexity
of the DRM KMS API that are involved.

Of course, it would be great to move towards a world with more Rust! I'm
just trying to be practical and not bite off more than I can chew right
off the bat. I do hope that if I can do this in Rust, that might help
the Rust-for-Linux project along the way and maybe encourage other folks
to try writing new drivers to Rust (or rewrite existing ones).

> As for the proc macros: so far we generally try to avoid them as much
> as possible, but a lot of details on how we will expand on that are
> still in the air (and we have not needed to generate a lot of
> hardware-description-based code anyway). Some of that will likely be
> discussed in Kangrejos and LPC in September. In any case, when talking
> about proc macros, it can be useful to consider whether "raw" code
> generation in an independent build step may be easier or not (i.e.
> like your previous Python approach, if I understood correctly; but
> maybe based on a Rust host program which we have support for) --
> especially if that code does not change often.

Sorry, I think my mention of auto-generated structs was a bit confusing.
The goal here is to implement support for a (potentially increasingly
large) set of firmware/hardware combinations without outright copying
and pasting the entire driver for each one. That's done, in both my
Python prototype and the Rust test I linked, by having a facility for
struct variants with different subsets or types of fields, based on the
version. In the Python driver, that's currently determined at import
time (not runtime due to a technicality, but it's fixable), while in the
Rust example I wrote, it gets monomorphized at compile time into all
possible struct variants (and impls of code that manage them) by the
proc macro, so in the end there is ~zero runtime cost other than the
top-level dynamic dispatch to the right version of the code (at the cost
of binary size, but this seems like the right tradeoff for a GPU driver).

The auto-generation is just that I wrote a feature into the Python
prototype to print out its structures (the generic ones, complete with
version conditionals) as Rust syntax, to make it easier to keep them synced.

This could all be achieved with offline code generation, but I don't
think the Linux kernel is very keen on having in-tree
generators/preprocessors for driver code, and I also don't want to do
the insane thing AMD did with their driver and submit 100+ megabytes of
auto-generated headers; that is clearly *not* the way to go, especially
for a reverse engineering project where all of these definitions are
going to keep changing as we find out more about the hardware. It would
make diffs unreviewable, since every time we rename or fix a field we'd
be touching potentially a dozen variants for different
versions/hardware, and we'd still have the problem of how to handle
multiple code variants for multiple structure versions.

That's why I went with the proc macro approach, which lets me write the
code once and keep it looking like normal Rust code with something that
looks similar to #[cfg()] conditionals, except then it magically becomes
many code variants in a single compilation step, without involving the
build system (more than it already is for proc macros). If I were doing
this in C, the only reasonable way I can think of doing it would be
#ifdefs and multiple compilation of the same files with different
defines (or multiple #includes into one compilation unit...).

> (I sent you the Zulip invitation soon after seeing your message -- if
> you have not received it, let me know!)

Thanks, I just joined!

By the way, just a minor thing: I noticed that all the rust-for-linux
code seems to be GPL-2.0. Was this an explicit decision, or just a
default? The DRM core is dual-licensed GPL/MIT, as are some of the major
drivers (i915/radeon/amdgpu at least), and this allows OpenBSD to also
use this code directly. I'd definitely want to use the same approach for
this driver, since I want it to be useful for other kernels too. So I
wonder if it might make sense to license some of the Rust core (in
particular, proc macros and common code written in Rust) more
permissively, so it can be directly pulled in if other projects want to
reuse some of the drivers that depend on it.

I think the subsystem bindings matter less here, since those are
naturally very Linux-specific, except for DRM of course, so this is
mostly about common scaffolding code.

(It's probably a good time to think about this if it hasn't come up in
the past, since changing the license after it's upstream would be a lot
harder!)

~~ Lina
