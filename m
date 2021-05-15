Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27573C433ED
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 May 2021 19:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E4B61139
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 May 2021 19:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhEOTYo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 May 2021 15:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhEOTYo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 May 2021 15:24:44 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7336C061573
        for <rust-for-linux@vger.kernel.org>; Sat, 15 May 2021 12:23:29 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r8so3318270ybb.9
        for <rust-for-linux@vger.kernel.org>; Sat, 15 May 2021 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=cw9KMYuDLC8Q3duZGveSomlCgiJ7QUK03vn0e6Y6DHk=;
        b=HxduWVkwalPlQXniKxhO02/A++/pYzg6RoFLxLWvBU86Svw6Lxg9GQl2s01kFpC4hx
         Fh/RboNpTG67yjp8qj2kRGeWa18KilQ+wmXVqHhrBu911BOt0MN3FMIOh5Aful5TT/6C
         s2ULTl+IZC6MQDAO9po5gAom5ZXmXfLy2bXbm8wj6V8wsIcSbADhEex0q/Qd5NuVzVXB
         lnca3K1qKw5GIg3s9MptUAuIpJmmLSKHNDJ7aSF5V/qYtqsWL5MT5JrPiOxqPdcUT+Mf
         01dFHypenU/iQ+fb7t1zccGktxq2Dsju2rj9lv2vGs5plAV4VWIYBbh8pVbcj9up+A3Q
         dEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=cw9KMYuDLC8Q3duZGveSomlCgiJ7QUK03vn0e6Y6DHk=;
        b=m16bK3DEgalZFwlkW8Is3TJoHAsTiCrKyZAMAOKZMP6sBHasu240ThiebIoqc88ePA
         RS93o3RY2vzPXl61wYmqe5evp2t87JhAmxXyiRKJoYTB6pTZoqgCOMDjmFTJBFETkKJm
         7qf7le4RT1TFLuIzkxLBpfMOJb14B/y+VimNJbrCTiUDRFygYU8iwN+Jj5CxILD62hbg
         8COQb4reTdGww7hY66MGTY4E+U03ozsMDUY89LV7uibC+j0p5nz/9GMF2mkJQ97dXGXN
         XDjjphiqlTpxQlmdQNTkFPeOaJuy8wTLiKPFZrCsTwIHRjwNo606apHPqY6fSlebt3tf
         WSmg==
X-Gm-Message-State: AOAM533NBsvbLiWKeHa9qatjZ9D/Qz6laErzG4tJ8BSXsFN43jysWrvW
        HG1MTqDo0Zl8Np4lZUuxCXRvELdDvHfHw4a0/8pnLKwn23Q=
X-Google-Smtp-Source: ABdhPJzmcDQ8v/jkFx6/kjrPxM/LVYqz8Wy+5+sVpU7dtAAqYLSfLKupHwo7GraMpDjI1iplQKiEP0A96ggh1Vgyhz8=
X-Received: by 2002:a25:38ca:: with SMTP id f193mr72062492yba.422.1621106609315;
 Sat, 15 May 2021 12:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72=xVaMQkgCA9rspjV8bhWDGqAn4x78B0_4U1WBJYj1PiA@mail.gmail.com>
In-Reply-To: <CANiq72=xVaMQkgCA9rspjV8bhWDGqAn4x78B0_4U1WBJYj1PiA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 15 May 2021 21:23:18 +0200
Message-ID: <CANiq72kW07hWjuc+dyvYH9NxyXoHsQLCtgvtR+8LT-VaoN1J_w@mail.gmail.com>
Subject: Re: Zulip created
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, May 12, 2021 at 9:08 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Invitations will be approved manually.

From what a handful of you have told me, it seems invitations cannot
be requested -- so please just drop me an email if you need one!

Cheers,
Miguel
