Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89FBC7EE22
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 May 2023 00:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239464AbjELADG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 May 2023 20:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbjELADF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 May 2023 20:03:05 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B447759D2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 17:02:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-307d84f5ce4so310498f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 17:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1683849710; x=1686441710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWinxUwhtu5eNjLOLo/d6MfJx9f3Ly03OWprvWdRCuI=;
        b=YzeRHXEL4YfR1e1cCDtjo7kQcqjHr7Sa7tbsjqaqkoXnx62FbjEHMBmdkavmbbgpFU
         Pe+Z9XwlDm/ibuSr9RPPq7dIbAmzo5v1n1jpmjvKElJs/CcjHImrZBXXo7y9V+0K2oIe
         eCYgqHhhdgnzvNGeROC+lftp++kM1EkyXbvAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683849710; x=1686441710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWinxUwhtu5eNjLOLo/d6MfJx9f3Ly03OWprvWdRCuI=;
        b=SHoH5JruGAO/5RWxO/PmVGa8ag86iy+ITtemC9cAo8o2Mzehwf8d6etetrZSphOgcP
         sIHy/t65Gpk3LWdrOwb+KOQFW0aepDtwYqIuEi8FmwXlle8uFsjnJnDKpjmyQBsVp8tM
         5XTidZ2LFBOcJGCv+XLHOc6nj//OIM+Sd/uay8mtH+giBV4o5Uzq81VuCUcEin79VQxL
         wP62KlEEwzxaBoablHUrFD0VCWiEJo56/SrziowxVE7NdlARxzPUbHMV1gfTBchHxLxc
         +FwxIM/t9z4zSeMzAA7saScQtMHqfy2hF636o0kb6fHyE7MA9u3GMSVQZ39eThriOvgj
         QkBA==
X-Gm-Message-State: AC+VfDwkCppaIoALv1rhSi6amqG9USDdAe0kupYUfnA1o2fO38Dar5KG
        Xs2c9z6LXSzlHqNydXbDqndnlGDrBeectkK39LSSSywgYZW+tHE8pKPuwg==
X-Google-Smtp-Source: ACHHUZ7x6ywDHSxFJB+A2IJa5gMzwfyxGEQTfZx4HPNEr7ovpoCxN8IvMSaQZVptMsH6D8or/gMA9nFcpvV02/tvgHs=
X-Received: by 2002:a05:6000:1047:b0:307:7d31:1a7a with SMTP id
 c7-20020a056000104700b003077d311a7amr14871925wrx.13.1683849710060; Thu, 11
 May 2023 17:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230511230837.63114-1-i@truongsinh.pro> <CANiq72=gH3vvn+=VmPOgUXZ-Utqbve8_3AfVbGP0jtKZrM_FSQ@mail.gmail.com>
In-Reply-To: <CANiq72=gH3vvn+=VmPOgUXZ-Utqbve8_3AfVbGP0jtKZrM_FSQ@mail.gmail.com>
From:   TruongSinh Tran-Nguyen <i@truongsinh.pro>
Date:   Thu, 11 May 2023 17:01:37 -0700
Message-ID: <CAMy36z4Md=+2kXb2GMAh1+0-ttmB9tZj=a+xYzzKid08=9U5xw@mail.gmail.com>
Subject: Re: [PATCH] feat(rust): include bitfield macro into kernel crate
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 11 May 2023 at 16:51, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

> What I was doing is integrating the two crates you needed into the
> experiment PR, so that you can start using it, and then we can discuss
> whether we want it or not etc.

Sounds good. I appreciate having a PR with both of those crates. But
just a heads up, I will attempt to follow Bj=C3=B6rn Roy Baron
<bjorn3_gh@protonmail.com>'s advise builtin {to,from}_{le,be,ne}_bytes
and {from,to}_{be,le} methods. I haven't worked on it yet to see how
feasible/verbose it is to use builtin instead of `byteorder` crate.

Btw, I haven't subscribed to rust-for-linux@vger.kernel.org, yet, and
I assume I have to to receive the patch for the mentioned PR.
