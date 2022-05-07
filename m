Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A652C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 14:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237680AbiEGPBf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 11:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbiEGPBd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 11:01:33 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7D128E24
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 07:57:46 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id g21so10925070iom.13
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=5Pc7Bn98q3l0IRlq17PzMhLZEz/pFZh3uViNXfEmV3o=;
        b=qTF4YSNC44ZQk5Ds3nLoxBWqWFsxDvD4j1r83CcHGmj5Se3L77GWGrgJo1dMcrtqgU
         /43InnnT6BkVOM/HVHf73++/45KIZgCX1O6UExiKiM0Uzi25w6mwMIq8UT6FXZ27kXIi
         f42gi2mBqU2LugKsS+g/KYMSN9hzlI6N/Pts1alTuZymIBpZPOtxaxjfEV8u0qS9I7Vq
         toutG0GhzqrspNs8CycjdknSoyGApA2tmIusg7PRI6jhL1dPAyVKvDraFCnQ4rSZdzMa
         fJpi0TjdMLpYrR7Q5v0sbwFmemk+wibYGTX2DP3EwBRJPHE1lWOsvfEDzuIDU0/osEi+
         9wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5Pc7Bn98q3l0IRlq17PzMhLZEz/pFZh3uViNXfEmV3o=;
        b=suXeYEWsawTtVKPO2Uvhg//WItsqUgf/ytj2AriCPKTths8aPqlCgruqpXL/Nf4J3j
         3Y7vdN8fpILNu0PZX7D7hV+DWV5OlgYildWw1L16001/RdsMHZbDNtEcsXVATNHoSwbN
         FzTupRzTjZZpwuU9q7pxQ3Tc/la8URD5dOSYhbt3YbtvZaAd4oz56phy66zAx9eF2NKY
         qKnsNE8cF/kXM96AyN3MahxeI3kbxWPGpUn2PkD+AE8lT17rO2BW9If5Ba4fSwVGqTMA
         fMZoXWfH7XRxeWXluhFkxrutDIDpUBvMtLMNLKOgKs4IJ/5PR0DkIU2vEJzhxPDdZYnc
         Czjw==
X-Gm-Message-State: AOAM532ixpOI5waC+IIgCSvBzwFBypaBxDPEamlIdCpocDuqRQkwWB1D
        oicBqM1pHwbfNZGd7qhOUbCG/i7iHBbwon+ITAQhGzZjtng=
X-Google-Smtp-Source: ABdhPJzwd8pf210MS1iYrTrmU9pfxp0GdPSxlIK44G4fIvt1LznnomENqPs4zeuqDYCSl2CKq8q3J3DZlgtjFYFrOhg=
X-Received: by 2002:a5e:c643:0:b0:657:b1b0:8e2d with SMTP id
 s3-20020a5ec643000000b00657b1b08e2dmr3373031ioo.64.1651935465964; Sat, 07 May
 2022 07:57:45 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 7 May 2022 16:57:34 +0200
Message-ID: <CANiq72ksT5YV_A-Tfgun3Bq+4m1m7FHw31P_PLNBR-W=zma2pA@mail.gmail.com>
Subject: Reminder: informal call in 3 hours
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 3 hours (18:00 UTC first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
