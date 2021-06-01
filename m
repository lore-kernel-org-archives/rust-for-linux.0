Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94550C47080
	for <rust-for-linux@archiver.kernel.org>; Tue,  1 Jun 2021 11:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7187B613BD
	for <rust-for-linux@archiver.kernel.org>; Tue,  1 Jun 2021 11:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhFALca (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 1 Jun 2021 07:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhFALca (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 1 Jun 2021 07:32:30 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132CEC061574
        for <rust-for-linux@vger.kernel.org>; Tue,  1 Jun 2021 04:30:49 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id x6so214793ybl.9
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jun 2021 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g3FDrWpJm25NrYpRr4EVFmiotGAtkGOMB2DCz62FarE=;
        b=oUTk5fZmxluDekewGrWjuGlx/kYviBcnQb/g2q9fe0O3sjTX0lO0k7pflBX5XVQ2Va
         E4IIu1pUsrpj8AaYZv8BE/Ic2J7lgCaYhX7DNk5q2RluyArn2X9XqWw53qN5bL0bsSHR
         DTthvQpV3ZPPpF0bnGwbXWx/tyRsIzrPTtls+E1oG7FzYOw5wYLrBP4pbMBw9dq2vkMn
         p5Ou9klbnkxYnhZd7BbzBV4ZXOf+/bqvUGQYifvDvz49DVu3inMtWc2zXNKn2CxpQyLc
         g0gkluPpjX0n1OntvdVgUkcoe50j93NWpDPXFFJMbAhpmqQ85V0BcuJQQLJj7gCQiLn3
         yryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3FDrWpJm25NrYpRr4EVFmiotGAtkGOMB2DCz62FarE=;
        b=U6CFPdUrPcXi90lgX4w0JPOFB5GW9JGI3jR0WVFXZz05KXtWddFYcWd9i/ILu7badZ
         uiYXzz/mhSU4B2ESWsrex5yMVOPog09X30xrTwNl2muyJNF52WplO7rvJgVkRLxeygGF
         A9zQ0oh0IRpD/TtmFQJZjWOhqa8OfXuQpAEfx/koaeUMfvTQQdCvHtHrudkwhx3LVhs7
         de3ac9fH+X99dLyzNMPnlGCtDalYRYgq7q/Ya5LO6utdGM3r4gB1ZsbWDuUMO5xWCH38
         jQF9VmlTWPhxYvsQzSWw7yKQv5wBXBU7SI/yheDFZ4wzexe6EynYVQkIzeNNuX+Web9w
         Wh/Q==
X-Gm-Message-State: AOAM5320/S4ImsxIpfsrVaXb8d6VulgVo8vR24YnlkinpI51mrR0ElHV
        FBcExGeqF8WZxH8w1HE8/NTIfiGAwGtucm2psRQ=
X-Google-Smtp-Source: ABdhPJyrxxRTscUlK/jWeH/IcfygcYCHhORJYOTSELobz211eeZRri07bOK+43mEWxQB1oCCC7ugEAH+gxz7zfMwoAY=
X-Received: by 2002:a25:cc44:: with SMTP id l65mr9720394ybf.115.1622547048386;
 Tue, 01 Jun 2021 04:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABDqbH3s6Xr-5xhxAYyTt44w16A-Sq8sK7wgvxJuyDgg8+bWXg@mail.gmail.com>
In-Reply-To: <CABDqbH3s6Xr-5xhxAYyTt44w16A-Sq8sK7wgvxJuyDgg8+bWXg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 1 Jun 2021 13:30:37 +0200
Message-ID: <CANiq72kxfZt9A_ky_UMK+Un5HRVFng8-_yBgw3W4cwjLx+St5g@mail.gmail.com>
Subject: Re: Contribute documentation
To:     Douglas Su <d0u9.su@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Douglas,

On Tue, Jun 1, 2021 at 11:56 AM Douglas Su <d0u9.su@gmail.com> wrote:
>
> Hi, fellows. I am composing a series of documentation about Rust in
> the Kernel. Currently, they are published in my github repo:
> https://github.com/d0u9/Linux-Device-Driver-Rust/tree/master/Docs.

Nice!

> I wonder if this documentation is valuable and if so, how could I
> contribute these to the Kernel's source?

From the perspective of putting it into the kernel:

  - It seems a bit too detailed, i.e. it discusses implementation
details which will likely change, and thus it may be hard to keep
up-to-date. In particular now that we are still in the early days.

  - Some bits are covered by other kernel docs (e.g. Kbuild), so it
would perhaps be best to cross-reference as needed instead (possibly
improving the existing docs where lacking etc.).

  - I assume the `Doc/` maintainers would ask you to convert the
sources into reST format.

Cheers,
Miguel
