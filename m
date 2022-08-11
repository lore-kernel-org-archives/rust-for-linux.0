Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873C7C19F2A
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 Aug 2022 18:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235915AbiHKSps (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 Aug 2022 14:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbiHKSpr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 Aug 2022 14:45:47 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D256B956AE
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 11:45:46 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id q124so15349325iod.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=78Py4ASSBPbPM7ve+O/dtWRa8hTm6rf42vsdu8fh8eY=;
        b=cbUrZVSuRX1B/TIjMiZa+moRTjNbMJWoHB3RxC9zh8aOyMi34WC1LZ43tOxfs/HaKT
         PilzFt/PApNMKOUXjF+8dVl96ADZ60GMQFrVIGhM7zr9GJI/5t8UJoOGEm+I9uVT+4gF
         kyYoiPjUN7SX5AGmavmb4Zi2pu3uVXPdBIKc5j+i8dRmY+x1DSeN6b9WKnhmdlMjw0/Q
         Ym9+D/x4OTYbuwAuGcPvc17UF2yvsukbxy33FWZu9l2BcEC2QMvwpzvyMz5g8XtcsIzM
         xOZsctlex0y2a+ZmKNc+ucZIxEtearw55TiM09wanTdUyszXcdu1co7Ou7egS7SauChs
         lS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=78Py4ASSBPbPM7ve+O/dtWRa8hTm6rf42vsdu8fh8eY=;
        b=501C9r3kqHJ6yjZGPfZIaWnLV/Ei6K7oocjwAz4j09LVuUiDVsNO0aG//wjo1nqu7c
         YULG+VKimGC8dTw1DdwmosPECAc+NdFJ7xDMkY/el3zqFKFakQgv6JT+chkQeG42ITmn
         bGiajOyFcCCyI+lDGwDNHmgzxKgB1VD+O/WcpuzLzrKosNK6VdnXeMSqJ61v4Ts41YmM
         /JubQ3lImpPeXmqv/hq9L4EJkzCGUt6/rfekY8k5JQebcRAtvniSpd5lbdamYLoFYT2Q
         +cSvs7sycLzVfTrxOrJt3tv7h+1qKLuw6DRzYWHBJedTzmC8Ee+Gn8Vzb8JWan034fQs
         uUEw==
X-Gm-Message-State: ACgBeo29pfcEwX9n7M+FmeDN45hfqJDZQApGnSl0lELLl0SJZpo1y/jt
        ZLn/bnIwJvrDEVhC4K7zATK2Oh/H8IcyKTGCZUL/Umq/A0ZpAA==
X-Google-Smtp-Source: AA6agR5MSYNTGxJ2v/s7m7DwzJNDElXr2EYDkqMV7dWPeaJeEeGTjMS51gbELQfdDgDyALKykjd+jKfapyJisG8sU8g=
X-Received: by 2002:a05:6602:2a42:b0:678:84be:c9ec with SMTP id
 k2-20020a0566022a4200b0067884bec9ecmr257148iov.64.1660243546270; Thu, 11 Aug
 2022 11:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
In-Reply-To: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 11 Aug 2022 20:45:34 +0200
Message-ID: <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Asahi Lina <lina@asahilina.net>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Aug 11, 2022 at 4:29 PM Asahi Lina <lina@asahilina.net> wrote:
>
> I'd like to hear your thoughts about how crazy an idea this is. ^_^

It is less crazy than writing it in Python, for sure ;)

But joking aside, using Rust for a particular subsystem is up to the
maintainers of the subsystem. From what I understand (please correct
me if I am wrong!), you are part of the Asahi team, so you are your
own maintainers, thus it is up to you to decide!

Now, of course, reality is more complex than that, and you will
probably want to discuss things with the DRM people to see if they
would be willing to accept and/or maintain their part of the Rust
bindings you may need etc.

In any case, one quick note: so far, we have been doing the "Rust
driver that talks to Rust safe abstractions that for the most part
wrap existing C facilities" approach. While it is of course
technically possible to mix C and Rust in other ways, and it may be
the case that we need to do it as some point, it would be best to
avoid having to expose C APIs from Rust code, to avoid losing the
advantages of the type system. So writing the entire driver in Rust
would be the way to go if I understood you correctly, and would make
also things much easier for others later too, since some safe
abstractions for DRM would be there already etc., which I am sure
people will appreciate a lot in the future!

As for the proc macros: so far we generally try to avoid them as much
as possible, but a lot of details on how we will expand on that are
still in the air (and we have not needed to generate a lot of
hardware-description-based code anyway). Some of that will likely be
discussed in Kangrejos and LPC in September. In any case, when talking
about proc macros, it can be useful to consider whether "raw" code
generation in an independent build step may be easier or not (i.e.
like your previous Python approach, if I understood correctly; but
maybe based on a Rust host program which we have support for) --
especially if that code does not change often.

(I sent you the Zulip invitation soon after seeing your message -- if
you have not received it, let me know!)

Cheers,
Miguel
