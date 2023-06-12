Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC21AC7EE23
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 13:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbjFLNfc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 09:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbjFLNfb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 09:35:31 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B12F10D8
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 06:35:25 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bc49318aa64so1211260276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686576925; x=1689168925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiQCp3PvcRAfyCvf3snjPT3YrGl61jUydXsb5rGIRQA=;
        b=nEVFNvS3NvHpYjSoELNJHQ61FfOjBPoz/TLqF/3zDCkiPOvoybN6cOF9Oj7TuVlgY2
         o0wzHbnkoKK9CaQ2bc7Owww9slIgXoFsQVYeZqYnkozEhDOl13viIxo5Pt7y8QvGjsaa
         aaVsCn2Qmy//u+kfquqwMsQqtfvGPs/GSgMzhj9s7d8voMN+71VSG9kjSnUyVJZGmy9V
         2s4n03E7Jarihh+iC5N9BcGPXAWEsLQutsyaZbCKwt3uFjb4ikD1rUfcHJs5grZYHC9g
         baB9S6MVoxrMs1zjz5l0T7vxC2CdquXczM7JIpqSK1/Hzmf+suVJaGG9lxpU3C7lrIab
         nh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686576925; x=1689168925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiQCp3PvcRAfyCvf3snjPT3YrGl61jUydXsb5rGIRQA=;
        b=XtKfzdGbkDDLGiSwrXZaWOGXZP2XyBjr7rrxJ7HuGQRZp0ntPcId193xYy3DaLOxOm
         oLwHyvrg0K1zeWs87Ar6VJEPKpYOsDD+wud5yBBa5+KCnngagu215gTanRl4pxsikxs9
         onPNCSEMhRybWNjpxOwNl+XlCOwtMF9Cjuy9ylcldsVC+gGSJgINEvHmuAew9zL2LBou
         9onlIQyxMxwNVjrXH/GJ39x62EJaIO+Z/kDAhZ/tYzeB8iZo65pFQATfD2Sdg1ZV3M8+
         lSCTPLx1Fb9gayJvjXqj/HbJc2R16mqKO3RvkfFq0nssAWM0rMiUGjnOAiR8ki8NRKrV
         qk/w==
X-Gm-Message-State: AC+VfDxmkKKqn3KNFHoAloiFh7uRjwKzuHFNiAfJJe/s6qaBzYWtgY00
        p7sveqyUGXcFUY1bDOcRjHjgKdwcFAskn7h6hT0=
X-Google-Smtp-Source: ACHHUZ5qFwpNwfyz+upL1qAE4wT2r9wQbfsxew6MVpVGV0dIwNl4XNVvd6yOgJkANXvh+a2J9r7IyPS66toK2VWeNfY=
X-Received: by 2002:a5b:605:0:b0:ba8:4260:1cd3 with SMTP id
 d5-20020a5b0605000000b00ba842601cd3mr6505661ybq.29.1686576925021; Mon, 12 Jun
 2023 06:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
 <CANiq72n6yQa9nff+zdWizvjB4Z=Z1qjw9a2ZMny1E1uSA2A=qA@mail.gmail.com> <01010188aecdbf82-4929a6f5-fd63-4da3-8a2e-c9e7cbbd2ee8-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188aecdbf82-4929a6f5-fd63-4da3-8a2e-c9e7cbbd2ee8-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 12 Jun 2023 15:35:14 +0200
Message-ID: <CANiq72=0tGooL5B2fKd83hXMEyk6t=VXd6HWAirMoz8PV+f_xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: add support for ethernet operations
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jun 12, 2023 at 10:51=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> =
wrote:
>
> We could do:
>
> T::get_ts_info(&mut dev, data, &mut info).map(|_| 0)

Ah, yeah, then the one you had originally is probably better.

Cheers,
Miguel
