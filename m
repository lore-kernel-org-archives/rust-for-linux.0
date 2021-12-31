Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4802AC433EF
	for <rust-for-linux@archiver.kernel.org>; Fri, 31 Dec 2021 12:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhLaMl1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 31 Dec 2021 07:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhLaMl1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 31 Dec 2021 07:41:27 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483D7C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Dec 2021 04:41:27 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id q5so32659369ioj.7
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Dec 2021 04:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Bq1sofqYlCDoiXns2Ev2zxQoN9PBRARincbSQ4v8WnM=;
        b=J/FJjy2ib4f2S04hkDv5cXvo8omOb1mvyUeHp/cA287W+5Kz5EmF3VjPRBhpBuYHXG
         RsPedz3r1TJufZyeBJCzG/93ejfZht2g1Rr+qsh/8xkLLGRRpNbnvlbY00uFlyAtdZAN
         ScjpteX6LYAoCosS/tMevyiri7qygVvtVyb+tOyDjgo7F8bcH9LYwV2KjfAIOQ5d4hkR
         6PW8vRX6tE7jJTm9ygIfqTM+NL7Q68n5plZpQPGolUQSahs/WxnBaQxHNY5XDSGW9iP7
         jg2WD4avm69/g2x0SX8tkKP2VQQ5lu4xUp8Z6t0PXRzq2nUsE+NlxIoOLxbFzfa21fQI
         qLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Bq1sofqYlCDoiXns2Ev2zxQoN9PBRARincbSQ4v8WnM=;
        b=p+S7xfMB4G0+hEZ31tIF47yJhzIc+bcQLmex31U3+butQjd1s6epfDG2Ed5S+AwZzi
         dPeidjwrBRroT/8cp1abXS6PGHC+c+lx6dKsGsD6rZ56U+ev7rDkL5/uoPNYTNKtVTBq
         S0eTi05PKCB4aOx72oEnUGjrivGs4XQEYsv/DgOP2lt8TtC2nuUycVx+2dtYfMxLIYkd
         au22cTKzK9SgmaRwUVTUeBN9CcNMeADECW9Ykc3TQYfzdVuqgtnz8BGym+GP3YpJK0fT
         Kz866Bjv/DaBIWnrwjZ4Ejh70Dw38xd1Qbb3A6jeYcgh79pgh8W8PIc0QiS9duk3XIuv
         iDgA==
X-Gm-Message-State: AOAM53028lftIOs+lB8Wc9PitBuyljVeX2PShNSSF8OV80WrPZ5LPQiw
        Vb5MC0wHhiCtPbuk68baBMthr6cs73+v/MZYaP+wakiH2kI=
X-Google-Smtp-Source: ABdhPJyBmUOU0VMie6Jnw5jDqADG12/fJJKrz+S3ahcbt43ePuv6l4CFAg/M0SR3s7ahCTIRQg1g8euEpjaSmncFNPs=
X-Received: by 2002:a05:6638:1442:: with SMTP id l2mr17252517jad.186.1640954486480;
 Fri, 31 Dec 2021 04:41:26 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 31 Dec 2021 13:41:15 +0100
Message-ID: <CANiq72=N-1tnsKnjX1Dwhr-VQ58bzjaR2nQ4f7E8K25dW6zh0w@mail.gmail.com>
Subject: Informal call moved
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Given our next call would be on the 1st of January, I am moving it to
two weeks later -- that way everybody can enjoy turr=C3=B3n (or any other
desserts) without any interruption!

And since it is getting moved anyway, I will take the chance to move
the time too, a third of a day, to accommodate those that have never
been able to join due to the ordinary time being too early or too late
for them.

So let's do it on the 15th of January, Saturday, 10:00 UTC.

Happy new year!

Cheers,
Miguel
