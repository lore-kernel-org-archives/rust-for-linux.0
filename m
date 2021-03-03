Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64128C433DB
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 265C364E68
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383014AbhCDAYZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1582454AbhCCKWL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 Mar 2021 05:22:11 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97047C08ECA5
        for <rust-for-linux@vger.kernel.org>; Wed,  3 Mar 2021 01:50:23 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id x19so23890465ybe.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Mar 2021 01:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s/iRc80s8KaqZEC+Nv65mKZLtPOdwAL8252++Z5AqHY=;
        b=U0+avOO55vZ6eqtCqQ1GhoWFH9i78kJc12RPQ88GSYKEW47k0pA295Xn+xyyrwTXCb
         nAufjGIudyfRe5g98mkGuACd0+qSM+sUmL4s5ZYt/WdMWADeo33XuuSiF3ojWM1leE4h
         R2/sQlfbdFhUE6haOS8kCQin12+jt2uEQBaMOhAx5Y7Fi8d25epYDrvQPWWhA3ZBZpsq
         BzDlWZCpi1QG2yvhyecQ7p6sjvaJfVyERXv/NJvzPK7sZfegxWxHylkgTbMo0lmEdc66
         t/jGCqPMSoqVJeIrLyaCkTK6lc18YfehMkmbMhoayaxoxmZK856+gRjJ0sULlQytEwlw
         rSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s/iRc80s8KaqZEC+Nv65mKZLtPOdwAL8252++Z5AqHY=;
        b=YZ8qQ3wZfEWXBI/n7KXN//64Lp7IIAyNXfMQgTmpJrqY7hjOFu3SIE+4QyMcUkj0BX
         1grZB0x5h/Z/SNqtzUyioGYXlZb+ZcSe1oN8t0IOl2Go1mdkYdMK7MN9Vd12TPwiay0Z
         OOOYsWd+EmViy10MYVcuRInbkNEKTXSqO6c7I+aqnwfzhMqc5b6DQHPmyoWDbhso5IP9
         XSWnJCeSRD6LvFE2VKq2gIT1Nrrtwvvm5JkA8S6k3zA0cqPDmLcKmSztRkyWhxXBJrt+
         Zns7gvwtlU7S6zkSa7U+StrD1P9wj4VxzMKY/f1lZBECEoaIcLn8ewdy4U9zAcSi8c4J
         1ehg==
X-Gm-Message-State: AOAM531vZ3e0kxjkRds+3jyJtDtV5QXB7eK5V7bJbSrq15CBMgP+6oYp
        eap36QoxD4Jfd8K1Urr/cxB6Utj0PWyLQ96gbUCByBAT
X-Google-Smtp-Source: ABdhPJxEnupNT0qB8/IaAzUgFVIHKAk5FSSJLDXV8sByfPa+ZrO+hMJ4P63Iu6ggAfTro8GslnorQhr/B7ddiLNpEp4=
X-Received: by 2002:a25:e651:: with SMTP id d78mr33851215ybh.93.1614765022975;
 Wed, 03 Mar 2021 01:50:22 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
 <E47CEF26-62E4-4659-98F9-9DECE493E812@kloenk.dev>
In-Reply-To: <E47CEF26-62E4-4659-98F9-9DECE493E812@kloenk.dev>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 3 Mar 2021 10:50:12 +0100
Message-ID: <CANiq72njpL4RGK2C+p_OuXTNn9SOUBEfzaN6QCNj82zYWyr85Q@mail.gmail.com>
Subject: Re: Upstreaming plan
To:     Finn Behrens <finn@kloenk.dev>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 3, 2021 at 9:27 AM Finn Behrens <finn@kloenk.dev> wrote:
>
> Hi,
> Upstreaming sounds great.
> I could hopefully try building the rust part with nix again next weekend =
(currently exams in school :-) ), as I think there should be a buildable de=
rivation before upstreaming. It should be doable, and just some work becaus=
e of how the kernel is build with nix.
> Will write again when I have something that is building, great work so fa=
r.

Thanks Finn, that would be great!

Good luck on your exams!

Cheers,
Miguel
