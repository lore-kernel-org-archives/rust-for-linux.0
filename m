Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22482C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Apr 2022 09:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiDKJLX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 11 Apr 2022 05:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiDKJLV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 11 Apr 2022 05:11:21 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E6A286C8
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Apr 2022 02:09:04 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id 9so17911032iou.5
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Apr 2022 02:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ye0+6FVGtz+XDH8TwxdcTJcLKavTBBe1tOBsz+8a4+g=;
        b=l/frRRbM+NFEHw41GuoWliIgY9a1syrixcGFEqJ9/tVq7TIfPDZEvYIRlIwuegI34P
         al5MWaCpdgMW7G5fvDZC5863w4IM8WXQSdmNPNZvuWuRKNOxQteKiNxZWV00DRf+SmBV
         t/BF2rV/9iIO4LJ0M9vIr++bZQgUs4oQcPQgqEPX/Sn6BwYwxu8X4AZcujlct42xpca9
         g4KvsPYjDrYuU58Sj5xtaRusSdZqTbdB2hWPo83r/ZuZ5XDu3hp3RuQTwKFmSU0OQP65
         ciKppk9ZfOFMkWCUZncL1w1iyBesKEondD9ESEq73bwXORpWw4DE1u67UQ7HbwCKr/Wc
         otMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ye0+6FVGtz+XDH8TwxdcTJcLKavTBBe1tOBsz+8a4+g=;
        b=TPfUihjUAU7CNPEDkCMJDEnRqtj+gRm8gSxJerRi6flpzlBycyhNEW+cojnwSCjOpE
         F/D+Eeq+yUpLh4Po3SoVM8rGdju2AaIphvnHVGN+tEnahqbx3ffjXDlGTxmJNc7FmGzm
         yT3j9fWhB6hShqdz8qtz7ENmPZ0rb+9L2/iQ16q19So2fx/HzHdLcBZW+hTqo/hmMAUJ
         BuO28gNC8Zp5s5F3dhH1gmVy3vWorAW/rriHO3F7IxLTeL15dzccd0RB1XhcE5bzxA1p
         5b3DBNCK5SjtPUBWndKZ+/NXeQZb69BO7FRklochz08yfX9f5at3n7sqttSzlpaS88AG
         4Drw==
X-Gm-Message-State: AOAM531tQoMyCZjnj03TRs3KEGd6SZQBQzF8qu7+KvWYyP3sF1Gf7Bhf
        lZEZWgjIByMdcduLCrLJRPatS5yzRF4RR5r7u5TagvtwobM=
X-Google-Smtp-Source: ABdhPJx14MZSELfSF8FLar/JStfGfaTXE61btzhVluSMaFciGXMf7RDEK4DijQahPPT4dYn9Ay9OWMukhIO1yGUNBW4=
X-Received: by 2002:a05:6638:16cd:b0:323:f11d:864b with SMTP id
 g13-20020a05663816cd00b00323f11d864bmr15679708jat.264.1649668143756; Mon, 11
 Apr 2022 02:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <OSZP286MB21285514FAC4E0FFBAEA6CA0B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OSZP286MB21285514FAC4E0FFBAEA6CA0B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 11 Apr 2022 11:08:52 +0200
Message-ID: <CANiq72=4yuGunw_cQSNqrhRtHbE2CWy04WDGs4iA=ceC34QMQA@mail.gmail.com>
Subject: Re: Does Rust for Linux support kernel socket programming now?
To:     Howard Lau <howardlau1999@hotmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Howard,

On Mon, Apr 11, 2022 at 2:18 AM Howard Lau <howardlau1999@hotmail.com> wrot=
e:
>
> Hi, I am quite interested in developing safe kernel modules with Rust for=
 Linux, but it seems that the project hasn't added support for kernel mode =
socket programming yet (as I didn't find anything related to socket except =
for `SkBuff` in `kernel::net`).
> I am working on a high-performance network file system and looking for a =
way to use API such as `sock_create_kern` and send and receive network mess=
ages in the kernel with Rust for Linux. Could anyone please tell me if I am=
 missing something or there is a workaround for this?

For missing kernel APIs, safe abstractions should be added and then
used from the module. If you want to experiment, then a workaround is
calling the C functions directly through the bindings for the moment.

> Thanks!
> P.S. I would also like to join the zulip group. My email address is howar=
dlau1999@hotmail.com.

Invitation sent, welcome!

Cheers,
Miguel
