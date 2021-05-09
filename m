Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C8C433B4
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4766A610CA
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhEIVaH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 17:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhEIVaG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 17:30:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2428DC061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 14:29:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id m9so14549807wrx.3
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=uJwvDw1Y2fmJO20sszlIEeEjYtH8H2NAxq7dZ+E+Y6k=;
        b=ND63pRjgBvMgoTVIjfELdnD/5oriDhunFXJi+JxZqET9Z0Tb+vlNzIai3lIqLRigzz
         DFzZIboCMPCIdxFpao53N3jR4BQGbgk54thkjbTCsPQ9K8gO30aM16DllMdiUuh4FFQJ
         59tt6uy+CS7qkCaSyANSrUrBxTaDSmRP6Qf4cfMYFIsDtpF7fN/dTs1g2vPdHDWdRrxS
         60fD6jrvkQGGCjYss4e96oyTHrRcfoq85LhojuUfC6n9qQfX2MC1PDKewKnh/EVzRwFO
         WkQUj/ho/I/bsD4+WXBTCCkx50c2mR9osYveui4dX4U3FmeAf12IZPV3uwXyRQpICkU9
         Vn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=uJwvDw1Y2fmJO20sszlIEeEjYtH8H2NAxq7dZ+E+Y6k=;
        b=ENB9zUnizbnVDoryml8JlB3gjA5gEAxs++PhTRN5lp0+lLmPbBeANJnwaBFulxonwh
         pFDVNFZhoB96+J/e10+VbT/updIMl2asArg6rTM4LAASW502kSfwBCz7QnpSep8cZSjq
         rFNyCX61VuExLMI5Xkwyu3c9T/6ndC7ZLjyZEzt6sNvO3CieXOIlFUIfxl0ge6eVS3x3
         awRC03+RCuz8d/Ey859R+YZ+kXaf+3CR6oNb85vxtMJK7BXdXZSApWxdLxF/DYEhSPJ8
         i5xKYzpzjpA9zMqynVifjufO0JvR1NvWFnzkEzhBnvNhOIZbJcXn89r/x36OjkhESIGr
         U11A==
X-Gm-Message-State: AOAM532+rSNY/M1n++fa6V0ECeAcnmaeqmn0fWdkv4vWZa+mJcOrHzZZ
        fr0Ze6KByMXkwZhss7uKrUOeQgSv4LW/VX4JKDGs2AFbImIWmw==
X-Google-Smtp-Source: ABdhPJykZsxRMC/eUeWnmwRBMak0T8Xid/l4DRHyhTZc0oI4gFM4Hswc98D71Ywg2/cXWbcfnZGcuNLTUQO8kN3hEZM=
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr26594435wrs.5.1620595740940;
 Sun, 09 May 2021 14:29:00 -0700 (PDT)
MIME-Version: 1.0
From:   Leandro Coutinho <lescoutinhovr@gmail.com>
Date:   Sun, 9 May 2021 18:28:49 -0300
Message-ID: <CAN6UTazQwN=oZutVvRio1ZoXBMDm4DXNnqEnZJ_f4fD7vFqFPA@mail.gmail.com>
Subject: RE: [PATCH 00/13] [RFC] Rust support
To:     Laight@aculab.com
Cc:     peterz@infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> > The more you make it look like (Kernel) C, the easier it is for us C
> > people to actually read. My eyes have been reading C for almost 30 years
> > by now, they have a lexer built in the optical nerve; reading something
> > that looks vaguely like C but is definitely not C is an utterly painful
> > experience.
>
> I'll see your 30 years and raise to over 35.
> (And writing code that accesses hardware for 6 or 7 years before that.)
>
> Both Java and go can look more like the K&R style C than any of the
> examples from microsoft - which seem to utilise as much vertical space
> as humanly? possible.
>
> Those rust examples seemed to be of the horrid microsoft sytle.
> Nothing about that style makes reading code easy.
>
>   David

One thing I miss is the good old for loop.

Rust `for` works fine, until the step is not a simple unsigned int, eg:
for (int i = n / 2; i > 0; i /= 2)

In Rust you do: (please let me know if there is a better way):
    let mut i = n / 2;
    while i > 0 {
        // some logic ...
        i /= 2;
    }

The great thing about the C 'for' loop is initialization, condition and
step at the same line makes it very easy to understand the code, and
less error prone, like forgetting the step at the end of the loop.

Some code if people would like to test too:

```
// https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.step_by

fn main() {

    let n: i32 = 10;
    // for (int i = n / 2; i > 0; i /= 2)
    let mut i = n / 2;
    while i > 0 {
        print!("{} ", i);
        i /= 2;
    }
    println!();

    // or ...
    i = n / 2;
    loop {
        if i == 0 { break; }
        print!("{} ", i);
        i /= 2;
    }
    println!();

    // i = i == 0 ? n >> 2 : n / 2; // nope. Rust does not have it ... :/
    i = if i == 0 { n >> 2 } else { n / 2};

    // for (int i = n >> 2; i > 0; i = i >> 2)
    while i > 0 {
        // some logic ...
        print!("{} ", i);

        i = i >> 2;
    }
    println!();

    for i in 0..4 { print!("{} ", i); }
    println!();
    for i in (0..4).step_by(2) { print!("{} ", i); }
    println!();
    for i in (0..4).rev() { print!("{} ", i); }
    println!();
    for i in (0..4).rev().step_by(2) { print!("{} ", i); }
    println!();
}
```

But Rust has many nice features.
I hope it works. :)
