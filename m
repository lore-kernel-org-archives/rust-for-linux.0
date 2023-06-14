Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03B3EB64DC
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jun 2023 12:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243263AbjFNM10 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jun 2023 08:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244430AbjFNM1R (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jun 2023 08:27:17 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416301FCC
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 05:27:15 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bd744ffc263so549597276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686745634; x=1689337634;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kwP53YTz46NOCudbBkIpxBeO9Za/GrhCWcFrSoN5PjM=;
        b=oWLaI1mkQIrGMNHRf5v3jKrLdbUvlgod+mtP6uHJgOdo6OYGFJQyiAegjfeqHEEfH1
         RNwBHbk9OgKh9q8Zgjk+ACgbkSLcAd6FWDf5Hpu2nGo22jy+79UvbggvpCuQr90TkAGj
         SBg+n2CEA5oSvRz0to+VWFPTSaCaqaudCkuUTe1RjWypAduMggltEJHvtWosZ345L08r
         Tjui5+I6QVrdGpZifnXU9egFwtPpo7jJlwLB3mYXm+gOHBSMTiYyIso/e/UI2Yhjgkze
         EyzbIy9sS4zuDcpiyspp5xZbq0nvZ6Zc1B5vX6GRgLGYL0NWZiMT8oJSp71GogeQhe4F
         riJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745634; x=1689337634;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwP53YTz46NOCudbBkIpxBeO9Za/GrhCWcFrSoN5PjM=;
        b=ZM0SZJqFeXsF4TBxe7d5hu2OfUcY1Hm2Ldq7mPgDPIuVlCPNqZIbcSG8Uag+dXopEs
         82Px9Vb7t0pCpQE2hFy0R4TFnHUETs2WkJeU5wX10A3qjrp7/Dm28sJAqfT90QoF2Mg/
         pRsRc+FA9IFGufnK6j6DazhrY0ll7IdFGi8s4ke04NVjp3yvEtCHitdfoxa/3o8lLH8V
         Q+OXA5lldOK3ojiPXhaVvHi1/CdK0JcTQpEUCHG+JToHkcvFFmjyRHlWvOEs6nXpZKEZ
         S9DhhSgDr/jtVYu5gVTWCFvZxDOcggkimPB7tz0J5M04aj5b6IZSx276zPyKdWD2nMqQ
         ef1Q==
X-Gm-Message-State: AC+VfDzMhh++LX0Pt2SdPKGYmi/+NQHfp9mGcteswPmuFi9Z0oCJ6Dqu
        fF10CaAx6NFeYTfo2POGidPCYyr/QyEhsv6PUApifdXqYWZ7HA==
X-Google-Smtp-Source: ACHHUZ5ySsnOrn1wrBBfRC+0spRdDOQemkdKmJ6h9vzR6JwodxYgZCFdhXOsqTmK+h9B3jAVHDBAw3lEFY9GtG6n8Y8=
X-Received: by 2002:a25:8012:0:b0:bc8:2158:63cf with SMTP id
 m18-20020a258012000000b00bc8215863cfmr1825840ybk.23.1686745634178; Wed, 14
 Jun 2023 05:27:14 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Jun 2023 14:27:03 +0200
Message-ID: <CANiq72==dtWOe_XwE3_BhqzCs+jfywUGfK5s=u1iMzd+RuqDXg@mail.gmail.com>
Subject: Rust MC at LPC 2023
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

The Rust Microconference for the Linux Plumbers Conference 2023 has
been accepted!

    https://lpc.events/event/17/sessions/170/

Proposals can be submitted now at:

    https://lpc.events/event/17/abstracts/

For those of you that want to attend in person, please note that the
registration is opening soon:

    https://lpc.events/blog/current/index.php/2023/06/14/registration-for-lpc-2023-is-almost-here/

Cheers,
Miguel
