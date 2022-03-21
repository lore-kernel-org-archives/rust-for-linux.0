Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8F9C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 21 Mar 2022 16:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbiCUQvG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 21 Mar 2022 12:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350310AbiCUQvG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 21 Mar 2022 12:51:06 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910E650E14
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 09:49:40 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id 125so4081335iov.10
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wrvQiLxr9cUrd1siTjQ7Qe7vY7dMJneu/UjdgIPOvr8=;
        b=DfUn8djZtQka/X49hRwEc9v8F8ue54eEr9Mjl39RXz8hlXr1uLzx4EEyCZsc1ZNb3e
         E0SOuTao5+F6M7HI6oKD9uAOTFLNT3nkytOP0pSzVW/yHClIKJfDzXV6Xnv+vDSHQtwe
         pqgnWeKkn/rB5lC1RcIAu9B2Vr8oFdDPGFVyZ2Cl62zp0BFwEW1tRK9KxfOLgdq8BSkO
         mXI9dlTuFSJsViCLscyu9zo1RK/j4+360xezDutQBet41Gp+FcQlssJ7BZJpSlYM1r5q
         BhiJGX/O5gXLXijyFjxLZXhWG1COCKaZlCyKYQW2OeuRL6tt6CS7ZFUApFAzrEO0j6sR
         fzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wrvQiLxr9cUrd1siTjQ7Qe7vY7dMJneu/UjdgIPOvr8=;
        b=J6diKuH57luGEUyB4d1GbG3AELQxQNYnLoNgDYItEZer4HxCZcD7NW+DIim/vrt6JU
         2ivZ0DNjVnP5oMU09OkogysHJHjl/Ie97/a+xZbLRlFnvP6/ocg+JtU6m3dIfm1WOBKM
         76XIh3NXNock/M46bpQDKfIx/v6ySHboVeo4IPrmd5ds3FTBjWgA30wxjHZyskkZfN76
         FKXBb0LhKjeFWcNYSARy/2W87wQxwhB5pWmrXmR5vbzweTQ/2pUp/f3k3AJUXNJ5kLxM
         8FG8sbCm5UHdg6Fw4/jFfj0DgOgCrYteMqGt4RxbMmaSAcOBSfj7EkPPIMEVG6isTj4V
         QMCw==
X-Gm-Message-State: AOAM5338Cj0clK37m6Glhkzu/4Au/EO4NFkRQDOLX0jiiiQjJ0Nq0hve
        dLuagvz9rouS6BZpAw5rGGZpNK9kFMoPuzdpM++21Q4AX0c=
X-Google-Smtp-Source: ABdhPJzOZGYrm2mEa0ToH8lV0ewRpFKjZoO2my/arVIpS+MEDTRWzhjV9oHCEPSfzMRJGDYh+dJxUY7dAMbxxNo2RqY=
X-Received: by 2002:a05:6638:1382:b0:31a:1caa:5755 with SMTP id
 w2-20020a056638138200b0031a1caa5755mr11157813jad.199.1647881379958; Mon, 21
 Mar 2022 09:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
In-Reply-To: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 21 Mar 2022 17:49:28 +0100
Message-ID: <CANiq72my9N51hhryv-Cp79eUmPVCx6q=0fJrhkzmvT+nVPq+WQ@mail.gmail.com>
Subject: Re: Using 3rd party crates in an out-of-tree module
To:     =?UTF-8?B?TsOhbmRvciBLcsOhY3Nlcg==?= <bonifaido@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi N=C3=A1ndor,

On Mon, Mar 21, 2022 at 3:12 PM N=C3=A1ndor Kr=C3=A1cser <bonifaido@gmail.c=
om> wrote:
>
> I was looking at the out-of-tree example at
> https://github.com/Rust-for-Linux/rust-out-of-tree-module and found
> myself in a situation where I wanted to pull in a 3rd party module
> from crates.io which can run in kernel space as well. How can this be
> done?

You can do it by importing the code into your crate. However, it would
be best to have the functionality in mainline, so that everyone
benefits: which crates are you looking into? We have a few crates that
we may adapt in the future or provide similar functionality ourselves
(e.g. `bitflags`).

Cheers,
Miguel
