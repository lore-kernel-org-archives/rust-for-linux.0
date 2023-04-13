Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D7EC77B6E
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Apr 2023 19:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjDMTlL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Apr 2023 15:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDMTlK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Apr 2023 15:41:10 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA27765BC
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 12:41:08 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id h198so23160937ybg.12
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681414868; x=1684006868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnCdnkci3iWZ+t43/zwBJjkYD591D4k2UgflyTNq5f4=;
        b=mcnKOHiT90a4APZfDRa8RvbsBP+c+W2hymcBQNI4uJ05nzgW3PteHnbPCf5fP/QOoi
         HThCeqV2DZrCcK2GqxKjC+BB2rtcLjwCwluTDNVjsxekz85v5SeUzERWmGylu3tWNU0x
         uCUDZjzNUWP1M8p/YPrToskbrrlsMsFBGD7ewMFJR4eJMy7LFMUbdUP1T3T4MPLAkoTN
         NI92J37zN1gO8/lP2x1ffzfJJe/TsFQcpuQdm87X/HdnnGFZDwPAVgq3SRP7R2ssC7GA
         JHy1aPXsN2ML1iPNcAB7h2PHoLfMYqBP/vvmTzqDpM3qnX1/+Z6RqAGEekrhH9wi0Z63
         qAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681414868; x=1684006868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnCdnkci3iWZ+t43/zwBJjkYD591D4k2UgflyTNq5f4=;
        b=NQGdK7m26acp3XF2MOMqJ3sdX5u1Qx4dzUIl0JiTt8JIqIuS4aIsDGWKJzOa+Lz3vN
         wJVdPOtcg2Xn9uSV08IYoLNO+eJupk3kHDZ/xxflIoQAF86EX4kfhIcjb1kuLP24E0ms
         V53eNMaPToYe8mV3ehSbuunYl7WcrT2L0mWVm9jCUKuLra0IHMqvA7hr8UxXaonfZ60z
         ALYgpPTlLcY2xo6MSyQ9juqhkZ/C7fm4O8B30qh47OqMgn9bC8X4qJOe4AWU7favidWS
         Cwb49GlfrEiJUbCXUN/cC0qbyeoj2VhgdSpWIfiJmTBFIJvdMSRWRPCWLHcHp78njr2b
         ktog==
X-Gm-Message-State: AAQBX9dl5wPQSjPq2k1UKVGSE2lv5rUNRsy5x4WwmMlinO+pz6w+xULB
        vPWOEL2AWyZu0hHIAynqRvrMpSDExDhJcrg6POsK21/E/60mig==
X-Google-Smtp-Source: AKy350b+kkXB1rBUYlHJ2iI0n6e2g6eNINOIUcDRXgcE6ocHGKIIcXgKjys5w+n8YLr8LXf/vV6BocO1ICM4GoqhzfM=
X-Received: by 2002:a25:7412:0:b0:b8f:3e29:fb9a with SMTP id
 p18-20020a257412000000b00b8f3e29fb9amr2211171ybc.6.1681414867833; Thu, 13 Apr
 2023 12:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230413140138.348137-1-amiculas@cisco.com> <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
 <CAPDJoNsPWEBWqH21Ho409AkkFDaN9mvM2YDjwVAjSyjqGjEbNg@mail.gmail.com>
In-Reply-To: <CAPDJoNsPWEBWqH21Ho409AkkFDaN9mvM2YDjwVAjSyjqGjEbNg@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@gmail.com>
Date:   Thu, 13 Apr 2023 16:40:58 -0300
Message-ID: <CANeycqpPSQVrHqo4RLXn6g5LwMZn382W8YzUp2QE-UOBN80pLQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Add functions to create and modify an Inode
To:     Ariel Miculas <ariel.miculas@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, Ariel Miculas <amiculas@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 13 Apr 2023 at 16:05, Ariel Miculas <ariel.miculas@gmail.com> wrote=
:
>
> Thanks Miguel, you've clarified some questions I had about the
> branches and the development process.
> Regarding the rust branch, it says:
> > However, please feel free to submit new PRs for this branch.
>
> Does it make sense to open PRs against the rust branch in github and
> ask for feedback that way or should the existing fs.rs from the rust
> branch be merged into rust-next instead (and then I could submit
> patches)?
> For context, I'm trying to add the necessary fs abstractions in order
> to be able to rewrite lwnfs (https://lwn.net/Articles/57369/) in rust.
> I want to ask for feedback early because I'm not sure the abstractions
> I come up with are the right ones.

Please checkout https://github.com/wedsonaf/linux/commits/fs

This is the continuation of the code currently in the `rust` branch.
It allows the creation of a read-only in-memory file system as you can
see in the sample code.

I was working on it with the intent of merging it to `rust` but then
we decided to cut down what was upstreamed to a bare minimum, so I put
this on the back burner while we push other pieces (on which this
depends) upstream first. We also heard from Matthew Wilcox (the page
cache maintainer) on LPC that he has ideas on what the interface
should (or shouldn't) look like. So we'll get him involved [if he has
the time] once we have the dependencies upstreamed.

Some of the code we know will change for the better now that we have pin-in=
it.

Anyway, you're welcome to join us if you're interested.

Cheers,
-Wedson

> Regards,
> Ariel
>
>
> On Thu, Apr 13, 2023 at 9:36=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi Ariel,
> >
> > On Thu, Apr 13, 2023 at 4:15=E2=80=AFPM Ariel Miculas <ariel.miculas@gm=
ail.com> wrote:
> > >
> > > Add try_new_inode function associated to SuperBlock which allocates a
> > > new inode and implement a few setter functions for INode.
> >
> > Thanks for the patch!
> >
> > This seems to be based on the `rust` branch: the filesystem
> > abstractions we have there are not yet in mainline, so we can't take
> > this now since `fs.rs` does not exist yet. Please see
> > https://rust-for-linux.com/branches.
> >
> > Also, I haven't reviewed the patch, but some quick notes below that
> > you may find useful.
> >
> > > +        let inode =3D unsafe { bindings::new_inode(self.0.get()) };
> >
> > Please follow the coding conventions / guidelines of the rest of other
> > code. For instance, we require `// SAFETY` comments on all `unsafe`
> > blocks. Please see https://docs.kernel.org/rust/coding-guidelines.html
> > for some details.
> >
> > > +    /// set the field i_mode of the inode
> >
> > Ditto, for docs.
> >
> > > +    pub fn set_fop(&mut self, fop: *const bindings::file_operations)=
 {
> >
> > If this is intended to be used by modules (as it appears to be since
> > it is public in a public module), then you will likely need to avoid
> > referring to `bindings::` so that modules do not need to deal directly
> > with the C types.
> >
> > Moreover, the fact that a safe function takes a raw pointer raises
> > some questions -- what happens if somebody passes a dangling pointer,
> > for instance?
> >
> > Cheers,
> > Miguel
