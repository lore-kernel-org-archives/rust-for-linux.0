Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0402C433DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 22:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0F0364F33
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 22:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhCQWzQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Mar 2021 18:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCQWzI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Mar 2021 18:55:08 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F25C06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 15:55:08 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id m21-20020a9d7ad50000b02901b83efc84a0so3404302otn.10
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 15:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zv5k4+kieNPnvtBakckw3WOH05nRKEhJzD2q/p4XIdc=;
        b=HlL5iqXTvgnktMy/O+yqsQEX9ihHfOP/e0GWsjnI5Ky+ds05bVCq9ktL6W+3+UtV/z
         PIJz2HzOS3KN0WhKYT+GFwhJt8eLjKQASxieY6DcxuTsIVWSjId9lAdZRqIMDmo1+Zei
         qFM8VL4vOmEhsfaBcWIeNzSml8q1xzZPT0c/lCtloS9y3uIv54Bm1XgScj/kat5Mg/aU
         Gi2yIUDOEAWGO5+Jd1QF7nzAcwJnKHmx4Bsk/xHQClkpPmPRsLhgJx3VjbT+eY1lea0V
         6AP6dvA1akJ9c3iV/1ggwSKSRCabFRXeE4q0ts38m+Sk6ZXgh0UYprKmGngZaEpQRPnH
         Iraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zv5k4+kieNPnvtBakckw3WOH05nRKEhJzD2q/p4XIdc=;
        b=mEO+LcinpEQkfyC9P7w0nypxTyY3oKdl/EAvwW2yHUVlIDuUzarMjS5pJ3KWtQN7i9
         IsBHXjE9bPkVtewhlrLJa5BSq6EUsD7aI4Huavmd+bysHVb6PUNPaFeqGgKcwku04cyV
         ob6VTjTMxghS9vf34IgR296Nd/05P/FjU40m7c3Ao+XqML26PvJzucyVRTHlZZ/G6Z1d
         MAnItweBFh/mcRu15bvKq56im+4Vn2C+H3cTM3zxxsPBdIJ/aUvkkyU8avUmm/0FsbSd
         ri0RARvx/oiLcImQ3gi9Y0VfRcHa15TFCSQC5kBuv5TVjPb7jPCNwPoYVNPvVe0Difrj
         yMLA==
X-Gm-Message-State: AOAM530sPTkPo5Hg/Xq7dY06e/JBu9i9VEEtJGnnW28EX/XO2nUltzT/
        0LVZvWH0jWP5jl8uCtZ376tN82i+9RolMxHyJ1YUx9uEoJhr6A==
X-Google-Smtp-Source: ABdhPJzCL7zIGehmw55Fig9XOqj5yhmix8fDVN3BcvGeTm7a3TdpQGdJG73YwUw+nj5HGF9twv88puajYvKZFUpUIWo=
X-Received: by 2002:a25:d94b:: with SMTP id q72mr7368025ybg.135.1616021372254;
 Wed, 17 Mar 2021 15:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com> <CANiq72n0anrr7E_2D7nTt4PxQQPn0KxT86y5dS3AE47su0Ff7Q@mail.gmail.com>
In-Reply-To: <CANiq72n0anrr7E_2D7nTt4PxQQPn0KxT86y5dS3AE47su0Ff7Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 17 Mar 2021 23:49:21 +0100
Message-ID: <CANiq72n5MB8nSkYv7E0G1d58HqUazrcYVTTdxM4WJ_mcuCursQ@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 17, 2021 at 4:55 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reproduced with defconfig, building with GCC. I'm sending the fix.
>
> Thanks for the report!

Done! https://github.com/Rust-for-Linux/linux/pull/115

It also works for a full allmodconfig now.

Cheers,
Miguel
