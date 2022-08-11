Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A91C19F2A
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 Aug 2022 14:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbiHKOFP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 Aug 2022 10:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbiHKOEw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 Aug 2022 10:04:52 -0400
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2438E46D
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 07:04:18 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 6521B426DD
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1660226638;
        bh=J7/E/WcXSdigycJYa0fnHL5gc0rQjrQCiZMYhqVlASE=;
        h=Date:To:From:Subject;
        b=RDIfVN59yPhOMRpB+KQQeIsLMasIyIdeBd5et9qnrTeh7OZtN6gJjXQfvkahRW3fX
         qFw+UdrEnaPrL6+Z9IhDziV4pRvvv3TfAJm3RG46S86sAoaaKcOjxA92YG73xTh2Cg
         jSY9L2WjqSCuMRRWlJ3Q22QJAwQe2hL7FILyBGVj3TSGG5qFn+t7blRf8/DkKFgsxC
         NqMCntmqBsT+lr9+JM7vItd6Yikh/Akb2Z1tOWeew+eys3Fa9DNr5UfcY08MJqDiBc
         EUx2I+Qc47HsXxZhehAuwkPiUfzrhy5kRAO0asg92jo5KhZpSctqAMVyZkZmwNTz5g
         FlEMmbd5NcZsg==
Message-ID: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
Date:   Thu, 11 Aug 2022 23:03:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To:     rust-for-linux@vger.kernel.org
Content-Language: en-US
From:   Asahi Lina <lina@asahilina.net>
Subject: Writing the Apple AGX GPU driver in Rust?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi!

I'm starting work on a new kernel GPU driver for the Apple AGX (found in
M1 and M2 family chips). These GPUs run firmware and have fairly complex
shared memory data structures that need to be managed by the host, so
I've been leaning towards Rust for its safety, better metaprogramming,
and general expressiveness. I have a prototype driver written in Python
(running in userspace from a remote host, long story), and having a
higher-level language has been very helpful in reverse engineering the
GPU and prototyping different ideas for how the driver should work.

I realize it's the early days of Rust on Linux and this is an ambitious
challenge, but I'm willing to learn and the driver will take some time
to stabilize to the point of being upstreamable either way (in
particular the UAPI), so writing it in Rust feels like less of a gamble
at this point than it used to be, given that it sounds like Rust will be
merged in the next few kernel cycles at the latest.

I'd like to hear your thoughts about how crazy an idea this is. ^_^

I think the portion of the driver that would most benefit from Rust
would be the firmware interaction parts (managing shared memory data
structures and interacting with them), so I see several possibilities:
the whole driver could be Rust (which would involve writing bindings for
the render portion of the DRM subsystem), or just the bulk of the
firmware interaction logic could be done in Rust, and then the top-level
driver would be written in C and call into the Rust abstraction layer
for the firmware, or something in between.

(For those not familiar with DRM: the display/KMS API is very extensive
and would be quite an ordeal to bind to Rust I imagine, but I think the
render/3D part of the API is significantly simpler, especially the
subset likely to be used by modern drivers. This is a render-only
device, no display, that's a different driver.)

More specifically, there are some challenges that I think would really
benefit from Rust's features. One is that we have to support multiple
firmware versions in one driver, across multiple GPUs (unlike macOS,
which ships a separate driver build for each GPU and only supports a
single, matched firmware in any given macOS version). The firmware ABI
is not stable, so every new firmware needs many scattered changes to the
data structures. Doing this in C without copying and pasting large
amounts of code would require some horrible multiple-compilation #ifdef
hacks, and really isn't pretty.

I was wondering if it could be done better in Rust, so a couple days ago
I tried my hand at writing a proc macro to automatically generate
versioned variants of structures within a single compile, along with
versioned implementations with conditionally-compiled portions. I
prototyped it in userspace, and this is the result (along with some
example structure definitions, so far only with 2 firmware variants and
some dummy code):

https://github.com/asahilina/gpu-rust-playground

Do you think this kind of approach would be fit for the kernel? (Please
be gentle, I have very little Rust experience and this is my first time
writing a proc macro... I did avoid adding any external cargo deps,
since I know that's an issue in the kernel. The actual struct defs were
automatically generated from the existing Python ones, so I know some of
the naming conventions aren't very idiomatic).

The other problem I thought Rust might be able to help with is the
actual management of GPU objects in memory. These objects have two
addresses (a CPU address and a GPU address), and it would be nice if the
type system could help ensure correctness here too. Structures can be
firmware-owned, CPU-owned, or shared, and their state may change at
certain points in time. Perhaps the type system can be coaxed into
extending the usual correctness guarantees of object ownership to this
model, including things like making sure there are no dangling GPU
pointers in GPU structures pointing to dropped data, etc? (using
PhantomData perhaps?). This also ties into the actual memory mapping
(there are different mapping modes depending on whether data is shared
or not). I haven't started exploring this yet, so I'd love to hear any
thoughts about it!

Beyond the GPU driver, the firmware version ABI instability issue also
affects other drivers for these platforms (display/DCP for one, but
quite possibly others too), so that macro scaffolding might be a good
incentive for other drivers for these chips to also partially or fully
move to Rust.

Please let me know your thoughts on this crazy idea! I haven't seen a
lot of ML activity lately, so if there is any better place to discuss
this (Zulip? I saw it's invite-only...) please let me know.

Thanks!!

~~ Lina
