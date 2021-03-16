Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB460C433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 15:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80A016508F
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 15:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbhCPPQl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238138AbhCPPOR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 11:14:17 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A28C06175F
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 08:14:17 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id p193so37195286yba.4
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=fX4eFvasf9mQs6IGsngmcLyfeRR3sJNMSK/KMQ7YPw0=;
        b=WUHyWoMyFWZgkZXALGvxWTheSY8yArrCiL2zNpBeDuo1plbJyc6IuSQ5tfOwuZ+BQI
         MaRnvOFCEKe/RhNBWcvW71Xc0hxhiewabE4p7Oa+PBIDTa8O28U+4RIB5ZoeAkYCpcJn
         FcoyfvtH23qy4XZiMI/ne4w6vZR/ZnhkFRUYMQ1aINv+HvA/q3dHuBayzu0VB6+nVIJu
         x/eo5K4FX3x+NFB4RLYTkebHTdzu3QZE8FQDQR4KHnx9Fzi8DmxaTTlwcmEBM9ILzzuW
         cQMRtGQGxJVy2Yv/CVcpqqj5cMHKVR9EUVVYGcXBb9oNxmaeJdNAAUjDzEl3L5JrIuhW
         mDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fX4eFvasf9mQs6IGsngmcLyfeRR3sJNMSK/KMQ7YPw0=;
        b=rCyPlzAzFVwBsp9scnSsMd6iozhxxQdQAw6my0qiWnX+pJSdQfpdSqq2T7Ns5eMNbc
         ixkt4HbZv2F3xDa85nvQl73qNzt53yF1zg1LK4Al9zrK3DgaY4boq1bUTJQtQzmF6sCK
         KPB1m6U4HbkK2vZNWGVP/9w37S8XzfmeMfttKIXKWHVLf0hjXgI6AEeRF7a0XjhS+Glc
         SjssP0A7IWV90TqejL2Tgrwjk0YIWIA51jEZRjoZQg3ZlTCdRgcbhtEuhpgHs0gCY614
         GCj3xnWET17y2occi4R0jBo4mKuGdE60QrYgiMhurN0U44fONhz4AxDdnK+9t85nEon0
         DxlA==
X-Gm-Message-State: AOAM532JbfejRA1NbvhFkMw6fc+gl5G7T6ahbPfdqERNRazBmCwUOVvL
        AlLyk//hBRdMbmRUH9mQwBxdSXENpoMyNvtqRwambMHA6M4Saw==
X-Google-Smtp-Source: ABdhPJwREKFo7d5BWcFZnBtakMioRf1uX129qtrHDwZPNHrYslbihfPgWkPGLa3n1TKRKoEhLRUX97jWRksJRLhOZ1Q=
X-Received: by 2002:a5b:449:: with SMTP id s9mr4504533ybp.115.1615907656694;
 Tue, 16 Mar 2021 08:14:16 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 16 Mar 2021 16:14:06 +0100
Message-ID: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
Subject: [Rust for Linux] Poll for call
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

As discussed in the previous meeting, let's have one meeting focused
on having a re-review of the code for the RFC.

We have a fair amount of new code coming in and I am preparing a few
things too, but it should still be fine by the original schedule [1],
so I propose Saturday 27th or Sunday 28th at 18:00 UTC like last time
(EU evening / US afternoon).

If all goes well, we should be able to send the RFC soon after -rc5.

[1] https://lore.kernel.org/rust-for-linux/CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com/

Cheers,
Miguel
