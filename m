Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961FEC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 23 Mar 2022 09:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiCWJmP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiCWJmO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 23 Mar 2022 05:42:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440AC7659F
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Mar 2022 02:40:45 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso5897642pjb.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Mar 2022 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mx2F7QR3AvbuMzUWd2aCBUjMiUJ5k4IBgShvg2YNZbA=;
        b=eFGax/UBcF4JYv4mtzo70WQXtT/n69RsZrVb5ZFFniW6Z/gV7+E++L29ufCZESJIsL
         NnGO9F3BTa6aWwnaiTmKETxbpgbwsjNZ8+dSXFfpDiMvPNBAtn9p2Qkmz0oqrnaBOKCR
         XpSAULirslDpPV8FzfmEv7xP8GlRvsai7Ru05Ha+2On9DQWtL+3ATmHI+7H0YY3sz/cO
         TZKQKanIrt7KI2tjm0LkFspGWe5EaNJTWAEae9wdDQn11FbiytP3ZtncRLThhIWNNK9z
         AHNLPmVOmhg2h2VYFqX6Qom2TQnnkiAr8fAaYDXTnXCt/zEpmtWc8fm9dXnESfev5/UL
         dHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mx2F7QR3AvbuMzUWd2aCBUjMiUJ5k4IBgShvg2YNZbA=;
        b=uT1PwIO5Vuxz+xYpxok6VjH8rO+VHJcPxmvaT3OIWBCCbJkzgfVgdgwC5MBgBH5PA6
         7qA14KvI7Oa9xBfZxqGlwXBZoZWRjtZMqP0CgrO24lRXAv9Idk0oVe9c5ZdxgmPdlRiD
         Mlc1OzYdOr7BvSBFS0YWnBcLS+nYH9nok11Xydjug3Wh0aMDPsg7roTCuIPuc8HpvV1f
         nHFV8hZSZpcamlF+bIBCpOvICrMeG2Q1uRpapIswD6fU4Qkk8T1pQfo7LypnNOJcCCit
         CyASRryTPq9v69boK+Pt2Csqj6+OvhI39rN3Grfh1bY3375wuAjnKo7PQqoOif2dVF9j
         DXCg==
X-Gm-Message-State: AOAM532a1F1vSeVDkP9GEOP+9BpBmNAnX59FtLrPFGlm/VDxZGxLv5Ev
        Urn7b42Gw4DhLataGGFKj2YjYtvfUBRBLx7ox8jyFSmvT8866g==
X-Google-Smtp-Source: ABdhPJzeza1Q1x2Rw72CmqGvirDOEpleKnXpov9x3r5H7GFhDYmJXN2utgRnbL+TZwNbOpBizFxuJyuf2JDCPbs/958=
X-Received: by 2002:a17:902:8ec9:b0:14f:11f7:db77 with SMTP id
 x9-20020a1709028ec900b0014f11f7db77mr22600851plo.136.1648028444562; Wed, 23
 Mar 2022 02:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
 <CAFRnB2W+8XqOj0aL5DP2cMNLO2uR0DpPk-qB-oC7r=zT5N5gGA@mail.gmail.com> <CANiq72=q2FWAfyjPs+VC-H6o8RXCjrXwKbCFJ1kDKGbfYDYnGw@mail.gmail.com>
In-Reply-To: <CANiq72=q2FWAfyjPs+VC-H6o8RXCjrXwKbCFJ1kDKGbfYDYnGw@mail.gmail.com>
From:   =?UTF-8?B?TsOhbmRvciBLcsOhY3Nlcg==?= <bonifaido@gmail.com>
Date:   Wed, 23 Mar 2022 10:40:33 +0100
Message-ID: <CAHkG_ewQ3uJBTTPQ24+faW6v2ZHvGhTR2qTpfrj6URTr6hy0SQ@mail.gmail.com>
Subject: Re: Using 3rd party crates in an out-of-tree module
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Alex Gaynor <alex.gaynor@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Currently I'm experimenting with different crates which I would like
to use in my module, serialization libraries, math libraries. etc,
even complex ones, are really hard to pull in as a direct source
library (copy the code to the module), and if they have a transitive
dependency that complicates things even more.

I totally agree, that submitting something to the mainline with
libraries linked out there in the "wild" makes them hard to merge,
however a kernel crate sounds really good and is a bit more native to
rust.

Regards,
Nandor

On Tue, Mar 22, 2022 at 12:15 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 21, 2022 at 10:17 PM Alex Gaynor <alex.gaynor@gmail.com> wrot=
e:
> >
> > I don't know if anyone has given any thought to supporting 3rd party
> > crates for out-of-tree modules.
>
> It is possible that we will have some form of dependency support
> within the kernel (e.g. to split the `kernel` crate), which could be
> used by out-of-tree modules too.
>
> Extending this to Cargo-based crates could be possible, but we would
> need a clear use case -- if an out-of-tree module requires a
> third-party crate, it is fairly likely others in-tree also need the
> same problem solved. It can also complicate submitting the out-of-tree
> module later on to mainline if one relied on third-party code which
> now has an alternative in-tree.
>
> Cheers,
> Miguel



--=20
Kr=C3=A1cser N=C3=A1ndor Istv=C3=A1n
bonifaido@gmail.com
