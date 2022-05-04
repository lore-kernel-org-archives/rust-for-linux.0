Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D713C433EF
	for <rust-for-linux@archiver.kernel.org>; Wed,  4 May 2022 07:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343870AbiEDHSr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 4 May 2022 03:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiEDHSp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 4 May 2022 03:18:45 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2072622BF9
        for <rust-for-linux@vger.kernel.org>; Wed,  4 May 2022 00:15:11 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id g21so611420iom.13
        for <rust-for-linux@vger.kernel.org>; Wed, 04 May 2022 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iuEfYVvgYecrXNz+AgWYQO2XqFiK7sw9c9BKRccMgxs=;
        b=U8Z+BTpH0RkWlwcUetO9xF3DenxkuSRQt7tXHWRxLjPHHZiQHLbpi5ZHwilnNeEoK8
         RysTSj59gpMSO/VoKhG0JCu4B4oyCokNHEWPBPysxIbyYoqxVQWMf7NLXBinw+PVCHMj
         diI0wV31H0H1EAfe5MTjfCZ2KHA/cOFTYGF/8QQgc9Zo4xjDgXIIy5TtBYw0w7lbq7Mh
         xqpGaKMG4swqZe6vyhTWMvd1IF1CBztMnUpYh4tzlemxmoWZWNh11rO6Qn/4avJGJ03J
         AXE9gyptnFQxd1KgmCkrZzn3DtLzm3iGLclA04plPEfSzDoquF8XyjCp820D8nvjx6CI
         mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iuEfYVvgYecrXNz+AgWYQO2XqFiK7sw9c9BKRccMgxs=;
        b=QCB9tvkTcIRBNfM9gA12pk8GrVdHQSIO26KvqkSPFNQ+x+itZrpOJUm+xes/JyP1bB
         bAYWlwlHlGL355DmG3x8eG8CLEB1R3OueIalkP1NTYOU+1evE//21GFZCGSc7xM0k/c2
         eYWibTURoh/lhmNCnG0+t0CffTWiWeDYx/W5uDLTJo/F2E/Gs4sTB01H5zbUEe81djCW
         ucESUrfEWJaPyOsraUkms2U0tuiNxi0Yr1zng4+7wzBpY4D2FLpjxPSxnDMk4BMXSAhZ
         SQl7yWOF4n+0G4pllyAHl5KV40kASIz8B9RGmQDDJr0GNmabotOXRTSdtuantyrXgFsy
         qzcw==
X-Gm-Message-State: AOAM5333fqbm4EnuJi/nFn1Syqf5bKSHfYqxBX/0cMMeEjxSIy3H9Cg/
        fw0ydAqFfQQ+36aEeXFVVS81AEbBFPjNoOI555rCweVRy0g=
X-Google-Smtp-Source: ABdhPJwylN4Fg39vZQ+QbbE7ziUqG8hhNr28nuh/9rcML+W6laB+sLY2egDzQvVircqWtYhO8DopRLtjxP5FE6YGjBo=
X-Received: by 2002:a05:6638:16cf:b0:32b:6ee7:8d7d with SMTP id
 g15-20020a05663816cf00b0032b6ee78d7dmr4941017jat.256.1651648510490; Wed, 04
 May 2022 00:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <5D3D873F-97B9-4E09-8E78-0112ECB7CDA3@ucsc.edu>
In-Reply-To: <5D3D873F-97B9-4E09-8E78-0112ECB7CDA3@ucsc.edu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 4 May 2022 09:14:59 +0200
Message-ID: <CANiq72mqr5+WVBwAWXRYbEcnfz+j+d8_vUucMdWBYrJkVZ_Gow@mail.gmail.com>
Subject: Re: Request for invitation to the rust for linux zulip
To:     yyang363 yyang363 <yyang363@ucsc.edu>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Yiwei,

On Wed, May 4, 2022 at 9:02 AM yyang363 yyang363 <yyang363@ucsc.edu> wrote:
>
>         I=E2=80=99m enthusiastic about rust for Linux and doing some rese=
arch of Linux CXL drivers. I=E2=80=99m looking forward to writing it in rus=
t modules. Please let me in to the zulip. Thanks

Invitation sent -- welcome!

Cheers,
Miguel
