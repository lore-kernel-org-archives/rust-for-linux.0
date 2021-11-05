Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2D8C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Nov 2021 18:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A639A611C0
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Nov 2021 18:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhKESl5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 5 Nov 2021 14:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbhKESlx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 5 Nov 2021 14:41:53 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE7EC061205
        for <rust-for-linux@vger.kernel.org>; Fri,  5 Nov 2021 11:39:14 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id b203so8301559iof.10
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Nov 2021 11:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=a7uf+EqUg+EJlbYH4HOUsw7sbSlP4cfwmMrslTlM2GLAV31NjzW343t8hCi4JMetSK
         sGEq7TvL5JrkoqKiAYJbI1kKwjDHJgJcPlblz14OpipBvccfLG/hCycrSdo3tMQzwN8S
         4GLi9tFXFArsH+RoUE2SAAKe38Wf7h4hz/Xh+/DnaLePqNAj3LYApbkB+Q6OnjDl+h2T
         xtUMOZABVqR9BaEXz7+niDzkd66mBLCdULEXDob1bOjoKhziaJXNHHHLWG33RUq90rjx
         7oyrPLmK5ZP7wz8i3z7xdx7tJ73U0okMLLXNSfgL5fEw6InSKJW0Avs/Na+G9aaeVZL1
         HuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=yReGXnOcQKIgEykpoefBPN8eADoAVeH4PDpa85mFqYC7iFeHFa/Gjw+lVuPKFnnyrq
         py8nTtFvzH1HuuCMvlMRT3ox90D/Rv7su3EJf7CBNKiPw0oJWs9uqp9W+8n6sVIdR9L0
         vfglt5pInmv29sWW5DGaQjFnZEFvymaL6Ug1zZ21zi48ctjX+15DjV3UXcPam2zY3+JU
         lyYFk2OEmYDBwX+d4kHmiayU1A1NYQ70LvZc5LVuC6B74E2b1w4M8DdQ3QccuJ+3Rhc/
         VSfYf3/a+9QieIFCEFOy0jaY8fROo2NiJl2XxOnXfiWcCuI2aSfi74YTp4fI3CRaotyO
         0PTA==
X-Gm-Message-State: AOAM532pD8qE6K/tfl1BA7MGJlMI/FnKrltDNM5atxBksRCxS9R2WZvE
        eMEUbS1Uc6LoWpNAdB8QSombJch0BwTQIdmC2woBdODg57nt2Q==
X-Google-Smtp-Source: ABdhPJyXjWRQ63iHVLxlC3uKfN84bFonS3ni6FPAg4S7K8ia2i9Jy/vKoVivyMx9qvWttsARGWfK6Tta0AfrAv+1/rc=
X-Received: by 2002:a5d:8903:: with SMTP id b3mr769116ion.44.1636137553575;
 Fri, 05 Nov 2021 11:39:13 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 5 Nov 2021 19:39:02 +0100
Message-ID: <CANiq72=U1=LEsdn1NJ7hKh=T+y88-Jfb7E2f5o=tPHxYMhMX8Q@mail.gmail.com>
Subject: Reminder: informal call tomorrow 18:00 UTC
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call tomorrow 18:00 UTC (first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
