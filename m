Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8DDC25B0C
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 Aug 2022 15:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbiHKP3A (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 Aug 2022 11:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbiHKP26 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 Aug 2022 11:28:58 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FC29413D
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 08:28:57 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id q190so18605847vsb.7
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pUlaIiVUDfwJDC7z524sDGM9mX/FvKWjaFUrBQpUp6k=;
        b=OsbuKP1ziCgqSOp6SvlWEi2Jqqc9ZaXkgdgSFfuCJ7CFLc59W5t6g2kRwiSuIqPgCT
         r469PpQU6ljDRqc5oA10RQmh5n7kTH9fN9u2iB/ocac8p/E0+/tCoIaV3fnj2T2HVkib
         mF7Hzh9OgoEHvmMKYEnxEFiqAcoMbgG7/8b8Z30c0A7/IRTQX21TALDijaMzVb3K6GKM
         2cztqGaS23PzG6tDifLC3vewWfHZLLOY8bv9CgMiVzoAkv1QO2M5rKf8r0RUuxZV20ek
         MashsFYaYwyuCI41S/2+AtLzRDP6ifcc7XWjzvU7JdHunRwoM2kk7T+Ql5gk8CqRKBZx
         b+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pUlaIiVUDfwJDC7z524sDGM9mX/FvKWjaFUrBQpUp6k=;
        b=X816eGUeY4UQQQNg7RD7Ai9EPtRYf8DPfzQmdtjqlKYyZGM5tgVee2fMytBbM4YUUC
         Ulozd216mWVU5mX6bVila1t6gIHU1R+KHWbfr4eMjcY3ib5RPstI6sB2fkFhKcK2eDlw
         5SHFQ6+m0gKWb09uCmTCQ2HLVXlqRajs6r17M3QjZjUu8V2PwCskUx5NEk5L/pFon9hr
         mvX37nbRjnh24twZK8VzoX+d6ButqhsQu0PB4K56ruG28byyc65OzjYTRqLzFwYtrQ3b
         R9dynSyd840Fb7zsHhyLcxO3m7y/9YDYMcmMO6JpCEKTsV/7wn7MR8IedtyYe3fVyRpZ
         bq+w==
X-Gm-Message-State: ACgBeo1Qn6ZD0ueQp1WMO5CWqJDA/HBzW0CT6F0shUmU4g3zUqpt+zVZ
        hIe2Y8bLJXqUNBZ3UEmrkW7SjmOATNn94czNCtELA5iK
X-Google-Smtp-Source: AA6agR4owmmIIf2bWCC6T5rGFnNYBRUxhJXlNdpLX9Msm0fOcnzJsf7B3/X+Mim81ORvjKtpWpLx4oPHcPNhYxMw4Cw=
X-Received: by 2002:a67:c293:0:b0:388:6c32:bd90 with SMTP id
 k19-20020a67c293000000b003886c32bd90mr13824361vsj.27.1660231736753; Thu, 11
 Aug 2022 08:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
In-Reply-To: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Thu, 11 Aug 2022 11:28:45 -0400
Message-ID: <CAFRnB2V1S8kVKm7WV7Pbk89GA5Rs0A1BYMeUq-ZTSxisYgX4Fw@mail.gmail.com>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Asahi Lina <lina@asahilina.net>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Lina,

This is very exciting! I think it'll be a big project: I don't know
anything about GPU drivers in particular, but this would be the first
one written in Rust, so in addition to the driver work there'd be the
work of implementing the Rust API for interacting with the kernel.

That said, if you're up for it, I think we'd be very excited to see
how to support it!

In terms of where we are, in addition to this malign list, there is
the Zulip (I can't remember why it's invite only, but we're happy to
invite anyone who is interested!) and the Github issue tracker.

Alex

On Thu, Aug 11, 2022 at 10:29 AM Asahi Lina <lina@asahilina.net> wrote:
>
> Hi!
>
> I'm starting work on a new kernel GPU driver for the Apple AGX (found in
> M1 and M2 family chips). These GPUs run firmware and have fairly complex
> shared memory data structures that need to be managed by the host, so
> I've been leaning towards Rust for its safety, better metaprogramming,
> and general expressiveness. I have a prototype driver written in Python
> (running in userspace from a remote host, long story), and having a
> higher-level language has been very helpful in reverse engineering the
> GPU and prototyping different ideas for how the driver should work.
>
> I realize it's the early days of Rust on Linux and this is an ambitious
> challenge, but I'm willing to learn and the driver will take some time
> to stabilize to the point of being upstreamable either way (in
> particular the UAPI), so writing it in Rust feels like less of a gamble
> at this point than it used to be, given that it sounds like Rust will be
> merged in the next few kernel cycles at the latest.
>
> I'd like to hear your thoughts about how crazy an idea this is. ^_^
>
> I think the portion of the driver that would most benefit from Rust
> would be the firmware interaction parts (managing shared memory data
> structures and interacting with them), so I see several possibilities:
> the whole driver could be Rust (which would involve writing bindings for
> the render portion of the DRM subsystem), or just the bulk of the
> firmware interaction logic could be done in Rust, and then the top-level
> driver would be written in C and call into the Rust abstraction layer
> for the firmware, or something in between.
>
> (For those not familiar with DRM: the display/KMS API is very extensive
> and would be quite an ordeal to bind to Rust I imagine, but I think the
> render/3D part of the API is significantly simpler, especially the
> subset likely to be used by modern drivers. This is a render-only
> device, no display, that's a different driver.)
>
> More specifically, there are some challenges that I think would really
> benefit from Rust's features. One is that we have to support multiple
> firmware versions in one driver, across multiple GPUs (unlike macOS,
> which ships a separate driver build for each GPU and only supports a
> single, matched firmware in any given macOS version). The firmware ABI
> is not stable, so every new firmware needs many scattered changes to the
> data structures. Doing this in C without copying and pasting large
> amounts of code would require some horrible multiple-compilation #ifdef
> hacks, and really isn't pretty.
>
> I was wondering if it could be done better in Rust, so a couple days ago
> I tried my hand at writing a proc macro to automatically generate
> versioned variants of structures within a single compile, along with
> versioned implementations with conditionally-compiled portions. I
> prototyped it in userspace, and this is the result (along with some
> example structure definitions, so far only with 2 firmware variants and
> some dummy code):
>
> https://github.com/asahilina/gpu-rust-playground
>
> Do you think this kind of approach would be fit for the kernel? (Please
> be gentle, I have very little Rust experience and this is my first time
> writing a proc macro... I did avoid adding any external cargo deps,
> since I know that's an issue in the kernel. The actual struct defs were
> automatically generated from the existing Python ones, so I know some of
> the naming conventions aren't very idiomatic).
>
> The other problem I thought Rust might be able to help with is the
> actual management of GPU objects in memory. These objects have two
> addresses (a CPU address and a GPU address), and it would be nice if the
> type system could help ensure correctness here too. Structures can be
> firmware-owned, CPU-owned, or shared, and their state may change at
> certain points in time. Perhaps the type system can be coaxed into
> extending the usual correctness guarantees of object ownership to this
> model, including things like making sure there are no dangling GPU
> pointers in GPU structures pointing to dropped data, etc? (using
> PhantomData perhaps?). This also ties into the actual memory mapping
> (there are different mapping modes depending on whether data is shared
> or not). I haven't started exploring this yet, so I'd love to hear any
> thoughts about it!
>
> Beyond the GPU driver, the firmware version ABI instability issue also
> affects other drivers for these platforms (display/DCP for one, but
> quite possibly others too), so that macro scaffolding might be a good
> incentive for other drivers for these chips to also partially or fully
> move to Rust.
>
> Please let me know your thoughts on this crazy idea! I haven't seen a
> lot of ML activity lately, so if there is any better place to discuss
> this (Zulip? I saw it's invite-only...) please let me know.
>
> Thanks!!
>
> ~~ Lina



-- 
All that is necessary for evil to succeed is for good people to do nothing.
