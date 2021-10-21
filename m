Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E79BC433EF
	for <rust-for-linux@archiver.kernel.org>; Thu, 21 Oct 2021 17:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 761B860EE2
	for <rust-for-linux@archiver.kernel.org>; Thu, 21 Oct 2021 17:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhJURE6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbhJURE5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 21 Oct 2021 13:04:57 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DC2C061764
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Oct 2021 10:02:41 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id k3so1433769ilu.2
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Oct 2021 10:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZTBfMwUOYiDBs8EKHqDYc13YuNCculAECEdgcrh4Ic=;
        b=PcRLdToI5nJepb9Lfm0vGKGBnVjFdxTFYK7qW58nszW64LYiqxk3QS6cgJhFCHzfF7
         bMZ7Mx3taByR3ONYpsPSrKCEmEDFy6S+gPZZhp8GLC7MHZn5anznTcEpc626UQGwvOdB
         BaPyAEsCmCs1f+P2MEzYBa9XCerOIYUuCefIGTR9yyIjk+93EfBpPAQVgA1Ok42S9WU7
         L3p1rxNsmw5HUeN8kzh4SLzFTN8+821F8I5CAi09INHPH6yteqbiHPBPD8QGsLDF1yp4
         lb6d+iybid30aHx532e5ms8OeWrUxfr1OC4/c/5rg3SdZtgAs7oGZZa1/jMIvrK5lZXR
         cDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZTBfMwUOYiDBs8EKHqDYc13YuNCculAECEdgcrh4Ic=;
        b=X3waIXZBNjyLiy2Oia9aR5aBHL5hqJRiXNvwTdId2uJOR94H1+Elg9nje2JF8kz9GG
         j2zxrgfLyLyOn9G2ip9ok3/C7dqD/k47iOHCP2+FzaGuduKEBu5tGHEDz294v9EDlyDN
         iwlxwk5k5/A1ygikUzIAHlOEo3EDy4PPpNS+4apy6LZm6gozmLg8ZnxsaYeRlZgcbPV6
         Lf4AP+5wLoyIpud8PGwdZ10BZUvnDhVAk4u/x2k8gcr8Q07dDWw18KWd4ZibUn4ayoTL
         aJxWyln+e6DUeE2PSo0ZWjk1T5iB142Kp1TrRa9cLhDjRTc7/G3XrTMCBTjFZyMGXxR1
         WqwA==
X-Gm-Message-State: AOAM531F0TZj8ilHzyqQoQEzCaQx5CJWmarQzMZfUon7AEJyAqlT7DaY
        ySDuKn3Zuwr46QmIKC33yjzt268RsAfgpoMQADU=
X-Google-Smtp-Source: ABdhPJyTL/nNxaArJ+cQFudNmn4GeBCSZVOCIL4MPPygZ8YoqeZBYwgG/F1KC4DNxpYl9hVLkvP5Np/LGBYsGjVtdcE=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr4532257ila.72.1634835760947;
 Thu, 21 Oct 2021 10:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPOgqxFkNBF+DnGv2YC0zAT1xfrqQTLuHurtP=6xPwyowBXU1Q@mail.gmail.com>
 <CANiq72nKn7MS7pAeA3ydRRJv64OFjtCaB30R=B0Za0zfLqUG-Q@mail.gmail.com> <CAPOgqxGvV3n5eC6kvU1uRXCOpxpz8n-rwVZZ5Q3eXcKVH_h4GA@mail.gmail.com>
In-Reply-To: <CAPOgqxGvV3n5eC6kvU1uRXCOpxpz8n-rwVZZ5Q3eXcKVH_h4GA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 21 Oct 2021 19:02:29 +0200
Message-ID: <CANiq72n-VjdRdT3Lgk3Yni4QYN5tzNHV7_yN_XUaUFRJkZNexA@mail.gmail.com>
Subject: Re: Question about compilation
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 21, 2021 at 3:56 AM Amy Parker
<apark0006@student.cerritos.edu> wrote:
>
> So how do the Rust versions get linked over the C editions? How does
> it become that the Rust variant is the one actually executing at
> runtime?

If you are asking about the code inside `rust/`, then there is no
override happening, i.e. that code is, for the most part, not a
substitute for C code. Instead, they are wrappers ("abstractions")
over the C APIs so that other Rust code (outside `rust/`) can safely
use those facilities (for the most part). For instance,
`rust/kernel/sync/mutex.rs` is implemented using the C `struct mutex`.

If you are asking about code outside `rust/`, e.g. a driver module,
then yes, you may have a substitute for a C one. For that, you can use
Kconfig as usual (e.g. via separate option, or with a sub-option
toggle if they are exclusive or perhaps a `choice`, etc.). So no
special magic here -- an `.rs` file in e.g. `obj-y` will get compiled
as the root crate for your module.

Hope that clarifies!

Cheers,
Miguel
