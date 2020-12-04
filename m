Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D967C4361B
	for <rust-for-linux@archiver.kernel.org>; Fri,  4 Dec 2020 01:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEFD7224BE
	for <rust-for-linux@archiver.kernel.org>; Fri,  4 Dec 2020 01:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgLDBOt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 3 Dec 2020 20:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgLDBOt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 3 Dec 2020 20:14:49 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68B3C061A4F
        for <rust-for-linux@vger.kernel.org>; Thu,  3 Dec 2020 17:14:08 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id o144so3881551ybg.7
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Dec 2020 17:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jTZbsBUeMqhoE25sldD46Foeum0qepLOPZXqOkwbTf4=;
        b=XJZyeW5p1p3vPius8dhE/LfUrWBdQXW6WUqx27v9ypYa/MSsS2lKv+MXI58cRtFy3m
         9678rXMlNIeLI7SZXkBwwIowNuYjZQBQNI8ncEPetQwMvWPFqLKQTHKXVkAu+iffSurP
         +RzNSTXfPMT0MaadkLTwuiLJBzsxTcRPgMmmFz3RbKGKkBMFrtT7So22Tqz78gHIdIvE
         EVCKLaTjJuS/7yLRUJLTANgcOgmoy7KvOiPLx3l3xmDV15UE10DM4cvSTJrhtw/Rn5Ib
         x7AHUcTCcS1q6AUrh31E9Gi6dqt5N33DwqiamGLXDWZ7FdAxh8k5ITuHAYGXap85XAst
         qjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jTZbsBUeMqhoE25sldD46Foeum0qepLOPZXqOkwbTf4=;
        b=N9xTBig31axPALgCceHZS8gWj5xH1FMZ1AtmEPUKAlKVeTDTLDUIwc66SiBD196iiJ
         zR2Rvz9/m6pzN1eiFKv5NmfkOcVSihm9PEy0nS8ckZ3zQtjsDM7PBOTcwOMnqoxoenLi
         gTwTTbF2152Zmr6kpXVrhZ/z+O7Y+24ZK68m9jhzXHR7auOrx9tEmqAxq2q51TbgTKX/
         hJ5QFmacaVdz26aUy/3oLwQlykmYbD2/mh1vZmS1loN4ZUTn+J31XMTg2pVSbi4ZF2Ja
         9hrM7K8YSIUeV3GY0eD/oWnYhhdkMT1jWG50W4Fevx7X9Z/3gZ8QixpPZtFZH7zUFPxD
         KgyQ==
X-Gm-Message-State: AOAM530Bzd0fMtRK5mfJHjicdxQ8ybDY8gAjlC1HDkHs1Sqh6beV2Xp4
        xhjo/0RMfLnd3XZSO2ERbdukyznxjuZHJ7ts+xq0nGrst3w=
X-Google-Smtp-Source: ABdhPJzWzU4hhy4u63xnZwuCTiH7qtPg84J0XVE+aF9ICi8UqQzKDFKX63DAfhbruFDrqTVb+ZXb23sZThwwBZcjPKM=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr2643993ybu.247.1607044448091;
 Thu, 03 Dec 2020 17:14:08 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 4 Dec 2020 02:13:57 +0100
Message-ID: <CANiq72mn3ii1A3zuygfsskcd+sR58K4rmEGZqSwMBD1UGzMPiA@mail.gmail.com>
Subject: The rust-for-linux mailing list is now being archived
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

FYI, from now on the rust-for-linux mailing list is now being archived
publicly at https://lore.kernel.org/rust-for-linux/ thanks to
Konstantin. I sent him the first thread we had a few days ago to start
the archive.

Cheers,
Miguel
