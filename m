Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596FBEB64DA
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Jul 2023 15:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjGRPdZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Jul 2023 11:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjGRPdY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Jul 2023 11:33:24 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321651BC9;
        Tue, 18 Jul 2023 08:32:58 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-cc7863e7b82so3812211276.0;
        Tue, 18 Jul 2023 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689694361; x=1692286361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Ew4xDSq7MPi86/w9VZGABdvX7HcWbeJ7xpN4f/T0Q=;
        b=FmqGVJCml02/ilNevpUFn/TQWqjlykL92VfRnD+cKehmvmOsbBdpW2grMoNXm2reHp
         1EjtfCmx1n5HLtCIRw+z6znkwfps/sMFwItmDxxO+5ZUiyTiMRQKGAhC6pfxpm/Bs7mZ
         fG896h10jrFADrHG9duWLAljqr7LMuZfMKlj1HBq3+kqupzZ50UFG185bzDknuxDa/lj
         tbAxLimD/oVh4LgCeRKhRcqDYU0cLIHVw/jRsK5+iN4uYcPrLA1KXGHQ5Tkb5fm0qRUf
         naWAXSMJYYiffHZ6tRo1+6JBtN75MN0Sw8ag83GAGEk6MSNcAeG1zRb0l3bepoW0fNPZ
         7maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694361; x=1692286361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Ew4xDSq7MPi86/w9VZGABdvX7HcWbeJ7xpN4f/T0Q=;
        b=ji9FnvnBjmavb8FCQwBNypAyx/jF5O/fHoda65tH29Z2pG4SjpLw/E/mhCPOJaVZul
         1RofyDSb5TncmtZgMSrX6gCPaApSH/NP+AxFN32n+wC8qDpZiYZkqx1fILEb2KhverME
         UQQNL8mMSmJ1xe4Le1olUvrwgDozxT3pSNggprmkzPsCFCSdaAtWNxRtR/8TLubrtCw0
         3GgqOsFu+s830SzHZdcrxJwwsKzZvEIP8hj44O+LW0oCjdiwj+qqow5S+FAzZU/+7eeI
         0mZRVW4VQ9i5I9iNEzLk+HCXfwP5i6id9bGp/APQRRJzdFGTodL0EwUqF81/r+FEA5Ew
         y94g==
X-Gm-Message-State: ABy/qLb9bvEpQXpYVgdDkp0pRGaAg6rLEVUERI2bexGL+/NSAeYS09E3
        gh1ZZo56yy8aVEG2kpWEIqxBGPvAwzhenOGyowM=
X-Google-Smtp-Source: APBJJlH0ne69dDk1mq0QwkUUsLJPBFfYY2V3/WGOX0if93HKy07/Z0XGrjiTXhKPcqu08pWmPMdFFF2957u984MsT60=
X-Received: by 2002:a25:aba1:0:b0:c6f:db67:cbf7 with SMTP id
 v30-20020a25aba1000000b00c6fdb67cbf7mr95826ybi.16.1689694361102; Tue, 18 Jul
 2023 08:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230717151624.3470714-1-carlos.bilbao@amd.com>
 <20230717151624.3470714-3-carlos.bilbao@amd.com> <CANiq72=jiEqYfEvcRAxXsm1BCODnpxmWZOmbGB_YwM=pUGYEeA@mail.gmail.com>
 <88eefdcf-5398-97bc-161c-78f056c682a0@amd.com>
In-Reply-To: <88eefdcf-5398-97bc-161c-78f056c682a0@amd.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 18 Jul 2023 17:32:30 +0200
Message-ID: <CANiq72nTYGrHCCGmhavHU=qTs4XJoXsgTf3KgdrjEnuLjy4W9A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] docs: Integrate rustdoc generation into htmldocs
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     corbet@lwn.net, ojeda@kernel.org, jani.nikula@linux.intel.com,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, konstantin@linuxfoundation.org,
        Akira Yokosawa <akiyks@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jul 18, 2023 at 3:54=E2=80=AFPM Carlos Bilbao <carlos.bilbao@amd.co=
m> wrote:
>
> The previous patch works without this, the generated HTML will show in th=
e
> Rust index:
>
>   This documentation does not include rustdoc generated information.

I see, thanks, then it does not matter much. I guess you put it in the
first commit because the docs were moved to the URL the docs talk
about, but it still means we are using a tag that does not yet exist,
so I would have put the "link/URL feature" as a separate commit
(together with the creation of the tag).

Cheers,
Miguel
