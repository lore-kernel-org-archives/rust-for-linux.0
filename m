Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D7DC47090
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Dec 2022 01:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDA63 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Dec 2022 19:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLDA62 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Dec 2022 19:58:28 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751941AF08;
        Sat,  3 Dec 2022 16:58:27 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3a7081e3b95so85000277b3.1;
        Sat, 03 Dec 2022 16:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08OqTfpjEPIElzgm0b3XrsSLNPOJHA8nk6UGImZBGMo=;
        b=G8bd266JZeEMVezTktX5sBBXee/WS2YVaOVvlcrBqxqKaj30U4vEvZZTLGf50yRrgG
         Hp3OsMSGRd5eXDNQg/IuK8WCKLqnlMyPeWWSvexkhxZML/9L0n1QesgbX+nMTneYatRq
         cWUVEaADZsCVnZUkBNDUQUbTGksxgbqY0+9aeIWee6RTI9l74A3NShjoSNsvGqU1lazQ
         hn1IiKuZ0NYyMW7Mkpu2mla2xwRfCfbZDuY0Dt8CaLe+YeoTmLWEAG/ab6ffdFEppxGr
         ylbest2ijb8/Zxz3RevXcShDX2f8DW39oClIE0VDtpBuUHb8A5xBN38/fxvqwPbXCPaw
         +jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08OqTfpjEPIElzgm0b3XrsSLNPOJHA8nk6UGImZBGMo=;
        b=m0qGkLwiRxit650rCO3gcIwHM3HzGKQ2Mutqzopdim0YwCREXIiwJ8ansxrFbNWobd
         P1sjNWDPvd7ncCM7DDspezmKQOM5xq03bHl7vxGTPq/iLAjwC6hvuJZ3GEqbiUmrwAN7
         V2cNADCHnPS3qHwzLnQaowXhmhbnZMlupZHWUSmefszklS/Cu7Emn9ME9unEC3dH2WSV
         m5IV7VHORCeBA0j5aQ8qd2krPa+ReLarbJ12lKgq5+du0ZqBDeoSGEts3retEb+ebFYW
         58liabkl+fJlzBziSKmclFf1OIEEKYulBQdBvybUe9yDiBYtVDHhCV5f3UtYW+pycl8u
         pSXg==
X-Gm-Message-State: ANoB5pklMdHQqmmMesJ6Yae2fXzyNS4pMx991pX8OjGrECe8l1pFMNdR
        1dy8T+wvSANlvI2LYrvqcISTXeKABtl08GlXEBo=
X-Google-Smtp-Source: AA0mqf4lZ7z7AnfKCgO0Ru5daFq4rf8z+ZDnC14H3+AUPNFjDCq6S7DQJsZ4081Jt2vYSF1s6sVJgzlDIU1M+WrrzqA=
X-Received: by 2002:a0d:ccc7:0:b0:3d8:8c0e:6d48 with SMTP id
 o190-20020a0dccc7000000b003d88c0e6d48mr15165100ywd.462.1670115506664; Sat, 03
 Dec 2022 16:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20221202161502.385525-1-ojeda@kernel.org> <20221202161502.385525-28-ojeda@kernel.org>
 <Y4qNR+Nn9utDftHq@localhost>
In-Reply-To: <Y4qNR+Nn9utDftHq@localhost>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 4 Dec 2022 01:58:15 +0100
Message-ID: <CANiq72mY97PXbEev1b-ZO=RV-oeAR8Hr6W4v8ndZuegByqz0jA@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] rust: types: add `Either` type
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     ojeda@kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Wei Liu <wei.liu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Dec 3, 2022 at 12:42 AM Josh Triplett <josh@joshtriplett.org> wrote:
>
> This specific example seems like it would be better served by the
> existing `Cow` type.

Yeah, possibly -- it is taken from one of the use cases in the full
repository. Perhaps it was deemed simpler, or providing a way to go to
an owned instance was to be avoided.

Thanks for taking a look!

Cheers,
Miguel
