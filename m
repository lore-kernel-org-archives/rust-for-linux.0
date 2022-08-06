Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAC7C19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Aug 2022 15:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiHFP7g (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Aug 2022 11:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiHFP7g (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Aug 2022 11:59:36 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09FE0F5
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Aug 2022 08:59:35 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id q124so3950628iod.3
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Aug 2022 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=SyikxNvZFoR2to0jhPdn24kSjVywjl8yz+SYRTW8MJE=;
        b=N/qqmeFfmcETKOZan/V8tviw4yhP4R7621BBwzeR9cvEapdqlaKjznsAJKMvxkvEpK
         S87zlFfCHabYggWAP7zFHuTkPbdb1SV2q0dJrZVALnTPo5yuVl3q3rJf1tmmuPAzcTq6
         bXFBdg+qHSJRHSa1Sa56YDCKYBfleR6XO13Bz0Wm8yBd2/xT9MA+XKZ80bxM7FiGx00b
         lhQR2p5NSZHwpBC0K4dkODAYXJs3m/AR6wPq0nT2cREM4isBwbrtgNRT3Ll4TzsQonLU
         vOqoJvTY+jwGoyjmg48RAhOEReGIhHmwOdbYoBU8CszAhBalkGdfKtl+uORFrLPkfWrq
         esYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SyikxNvZFoR2to0jhPdn24kSjVywjl8yz+SYRTW8MJE=;
        b=06Akhd+RwOimSp87iD4azhBi4nlfmDPHuxYeVtWne0EoAE2zVMZz4DBtRKjKtXYy1X
         h/V4awjehTgyPOUhijWVU7R5KM4Kl0MgUeK3bi81oUNR2pHiKtD2o/4vrfTbLVfVs+Pg
         9/HLBIuBGFe3Bjvm5pDgrIN00mp7qfZHCf4knjBoHQ/c21bxS+UTvzlGrAos7dtEHxA+
         lLKDbE2NetYgWUekbz6pjOiDMkkDWmJRWnAk2uUdgOuZIvASWa/170qCBzLQS6ulPabo
         bS4iXu3yaTAQHFSylgRvFyTdWxU0ut+HwI/DTaWIj8cKz2jCIf6eJ42vme70Ph3Agq86
         wabg==
X-Gm-Message-State: ACgBeo1aT3YfIoaryYWvauobrEcWeXhl7dZIuUBKpfs4GKoMK77Z8E+t
        CWcTlseLySqg/dNRXzhr6M9OdtTpJ6iEbj1Au5DBDZbuRt0=
X-Google-Smtp-Source: AA6agR7inwYbm9ZUuA3N2I8NIgazyo924hXyGuF1QNAFvZbrJChve8Qnj+TSXZj23DCWwtSWEd6DXhD8tPMK976aHbM=
X-Received: by 2002:a05:6638:410b:b0:342:8542:1f89 with SMTP id
 ay11-20020a056638410b00b0034285421f89mr5488722jab.264.1659801575055; Sat, 06
 Aug 2022 08:59:35 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 6 Aug 2022 17:59:24 +0200
Message-ID: <CANiq72kHd_0i6x0O0e6KMVS-DkyH9qCwvPdnPuQAUxS3vx9vVg@mail.gmail.com>
Subject: Reminder: informal call in 2 hours
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 2 hours from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
