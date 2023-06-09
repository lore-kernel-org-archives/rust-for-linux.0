Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A19C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbjFIKIT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjFIKHU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:07:20 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686CD4C03
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:57:38 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-565ba53f434so14650867b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304657; x=1688896657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr/q5VeZ9cHY1J1SHt/FGBPosI9UGkU04/PG+BNQn2I=;
        b=kGYNxMOyXFQSJksHa2NWnlOs4suKs7ClgGKV3Lyyxffu7EUJshT8v3u7tcrlW9pzZP
         Ghog5ypjoUMny23hsda8a4aI0d/RcSgSg0bHMiKhCWg7K3U0P4ATct5VPcSTPxgYY2P+
         FvT37SpncBZVRLhilDuAxeJgRVb05ja5cdvxfrVexDy1q/axWDfD5UWtBSpyp8XVZeNi
         s//dwvigtLtd/gc2BcU0XyuNO7Zy5/LRu9vJLRTHRPE3Rztw0OSE1LGPFu9//C7qK/nv
         iVO/wjrlgVESt9MbBzdfjAe//59GQJXRRFKv7I/C+hK+Ei7yvutMbLD23XVSZMCvOcCt
         lXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304657; x=1688896657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jr/q5VeZ9cHY1J1SHt/FGBPosI9UGkU04/PG+BNQn2I=;
        b=SgrFPNIZ3uS1lFwDDPfN4NNIJI08MoqdJM/pX+rv71dCfwzu7XmgvcpxDBEqBibaE8
         8oymwP3r/FZPIaQCBilBF1ePdkjXGoQnzQCoh1Wdui+14TvxIMqGcSw+tt+Q8Mkt7kib
         y+Cn/0GBXlyLPmxqAT7uO+jzjLFQ8pF29XY1/Yw5jf5dk+50oHQU1hvCdz6q5J67luAC
         e7srZyyZ92gOUrKqBpx8UZW9ZuS1bkfSrh9K6VWixoWmur/qeiBwI7xhv24OdZbBvO5Z
         IyexLQHPTvXrqTsTqdfnFtSCpOXg1PTkj6jjHxSJIe1Z07Ob/57ZoMqvY5ZClHK6vPSQ
         aMwA==
X-Gm-Message-State: AC+VfDyDZhFzCkokONNOEQW7tzqGVhh9ydClZc2L034AnPTbO5XCHSTU
        B3XZQnxEx4A4MYQkwkFMSgAZkKTb0GTxy6gRLh31i+qh
X-Google-Smtp-Source: ACHHUZ5e2C9u2Jy1eTiIKP2G63XpcrysJ/7wcnlqkRWTTvTK9DAn3V2MrrvNEJ/8Gf83GZ/5yMQYnBx3ewYwqv8J4Pg=
X-Received: by 2002:a25:7288:0:b0:bb3:a5ef:a9c0 with SMTP id
 n130-20020a257288000000b00bb3a5efa9c0mr658005ybc.44.1686304657568; Fri, 09
 Jun 2023 02:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-17-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-17-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:57:26 +0200
Message-ID: <CANiq72ms79wkJ3LQS1qwfbVED5bWGpuDt+Tme1eqL0FBm69vKQ@mail.gmail.com>
Subject: Re: [PATCH 16/80] rust: helpers: add missing rust helper 'alloc_pages'
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:03=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

I think this could be added to the patch where the user/caller is.
Otherwise, the commit message should explain the need for it.

Cheers,
Miguel
