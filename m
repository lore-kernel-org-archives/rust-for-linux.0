Return-Path: <SRS0=ZQ81=IE=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46519C433DB
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F406C65017
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhCFJPm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Mar 2021 04:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhCFJPm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Mar 2021 04:15:42 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F02C06175F
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Mar 2021 01:15:41 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id l8so4575029ybe.12
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Mar 2021 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUidCj839cUtO8SWBBlSQlhu6IorTPhl+MR+bmoe1hc=;
        b=OmfTM/f8YmK/MNi8w66LmBykmxlqhNHOuKVgVqeLwRDHTRJTxBmQu6DRGs2o4pYpBR
         Y5eWZHDl3O/TCnupaRq6B+6wc5didt/T2iLUwuBNAHDb8iCSJ/zsNuk+ccH56hBh/xlO
         MtEqYOl10KXya2GO8BAqFfMnRpjq2nIj+iJkUXEiafVkic46FJnvosl6uhqkv1l+PyJT
         G5auxmmh78GCk7Gj8yIZefostoLjEvKosiYwhD8NFenN2NPOe7zgFVwCqoA0JBh/Ds7I
         Ol8Eld2XgwqNMjcYHZ6mH9Sq5GGW8UlBXBMT6QDo85Lpt5D9ekI5Dq27pUfY50F4CB7+
         UvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUidCj839cUtO8SWBBlSQlhu6IorTPhl+MR+bmoe1hc=;
        b=fcwhtMe7ym7E5ONPFy9zB2ZaRe+xw5uNMQeBD9YQNdVTSwgs2Z3hbLixTaq+XxzZ8N
         trLN6SVZewr4qrh7mnapMSPedhNI5WypTFdn/8ueaCQDPWkA8M8Px7oUM84VApOwE0W0
         8CCsXhok4Nb2NdzXP1f0lWb25HfUJ3KzeJK6SyyjqAwRB+IXZJNoRJYdxDyzYOxEUZSD
         tx44SvZSiKdl+rvUUz0NGElILDyl+wjuxAdSCyelLEFwHaI5laDv8km2r33h0f/MXiEM
         DxBbB+oVRFAKPy4uLpPqIsRb7MEsCm6ySI8afvLQDC8UrC6j2wU4SwmhFdEz8hDQnb9x
         y55g==
X-Gm-Message-State: AOAM530iQshaNlnpQ+WZTfKvIURHkyZOQUKx2VqxZWpMkVBRuFrOHYfz
        ELr6FWWtAlGfjHGUyxjAWb68guh4KIgpBaiUxJCUALNp
X-Google-Smtp-Source: ABdhPJwKq+YCmgeKT/RW/Qb2TElguP9f095+quYaN+YmQqxwV/RhMT7RdEO/lLjwbjDuiieEgyAlk3zoOZuLH5jWH6M=
X-Received: by 2002:a25:e651:: with SMTP id d78mr19398517ybh.93.1615022141128;
 Sat, 06 Mar 2021 01:15:41 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <B1F9C55A-AA3D-418C-8C2C-BB1EE794D5D1@kloenk.dev>
In-Reply-To: <B1F9C55A-AA3D-418C-8C2C-BB1EE794D5D1@kloenk.dev>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 6 Mar 2021 10:15:30 +0100
Message-ID: <CANiq72kPTw_TE9Yy26xwdn0h94QV85C+rNBqsh6uS2tt6FgQhA@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Finn Behrens <finn@kloenk.dev>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

It looks like everyone that replied can do it both days, with Finn
having some time constraints.

Finn, how is your weekend shaping up? Would picking one of the two
days help you a bit with your schedule?

Cheers,
Miguel



On Thu, Mar 4, 2021 at 7:40 AM Finn Behrens <finn@kloenk.dev> wrote:
>
> Hi Miguel,
>
> I would prefer the following weekend (13th, 14th), as this weekend is rather full at my end. But if needed, I could probably also manage this weekend.
> 18:00 UTC sounds like a good time for me.
>
> CU,
> Finn
