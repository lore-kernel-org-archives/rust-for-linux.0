Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD33C433DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ABEA23436
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbhAMOjL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbhAMOjK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Jan 2021 09:39:10 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D8FC061786
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:38:30 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id z11so1729593qkj.7
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OeLwtJO8OODJ0avqIx0WXMBhj0BWK/irwaBuE69/Cl0=;
        b=Ckc2j7SuHvaMn4s2NOXotKgvy5gXNWWkg1aJmeDoWp9dHPaX5Ou/SScuUbjvuHZL/S
         e1hZH/C6sOoHqkKo3Ma9FUCivSUdW32WQIvGDoMncQ2Hdkfm+ScZB5oNJ00NLM1fodD/
         vy45MWHuOQQ48W5Iked7klphu7YwodmCkFX2iHNZ/buK3TWP7GFF4i7Lp8qacJoknPJI
         I2I4Z3KJ9+pKyUps7x89DHJp5zJ9emW98Euqyw+ZWP/UUwNVe5g8T0hPK2kwbO8UH6q/
         MIt6T1jlkqdkG1HnxnO9MyRfE8EXn3VDdaqoodSSjEuH6iPzH2Pw0wZUSEwZZoPS7mc+
         X1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OeLwtJO8OODJ0avqIx0WXMBhj0BWK/irwaBuE69/Cl0=;
        b=VG5rXJ2l093DeeeYgoQ6ufQ6TaZS7RiBoOFqxSAulDdp1BNDodCgC1r5iWPjXtrfdQ
         IVdreQhOay73cugE2bK8Ia2Y/FOgV0McXYHITKd55PQMBR1LmvoEKpbyTcGdmTYtPhcd
         fKByt/iy5k4G6Nhr4OEhgs2+j9t5rRI0k+BrxNnKEvwDeSFbXJIXyiG/AdTtpWDOXaJz
         +bi8nxd3tod9ix866yQKUejrtbRw3c8x+j75WFJSJDuJlWoZC68+6qjjYY3AAwYvXszS
         7uZKf1ynPIUKMV6sSImwcKGiSp52ygMbct2YUeyun7EQzYM6ZC2hGUCtEUs64INDTSSG
         up/g==
X-Gm-Message-State: AOAM531gPK3vqWC1mdeDIXpmccdiTVUkCEkxD1UwPuf0FQEJfuQV3z8g
        rhwI5o8MPE6E/UhVkaCDIfrJ23Nz+x3rgqVbYuQ=
X-Google-Smtp-Source: ABdhPJz2tO1aNOw1L2nSxDXSQ2elxORSgMXf9psrXWT179wHwzfjNDrtcs6OaI/EE1qaPyiBAPLPPTABFFGZbF0k2V8=
X-Received: by 2002:a25:50a:: with SMTP id 10mr3662070ybf.115.1610548709793;
 Wed, 13 Jan 2021 06:38:29 -0800 (PST)
MIME-Version: 1.0
References: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
 <CANiq72=Xh9vSf-pRFOZ73qqhZ9ushKfM1ei-0TqYxNfLyHJmow@mail.gmail.com> <CAFRnB2XcWKrPCBo04iVr9Z4xNvjMw8pFmqCkqB_xsaZJKc_CCw@mail.gmail.com>
In-Reply-To: <CAFRnB2XcWKrPCBo04iVr9Z4xNvjMw8pFmqCkqB_xsaZJKc_CCw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 13 Jan 2021 15:38:18 +0100
Message-ID: <CANiq72kdNJ5h0EMbPoXGepK_YAh=Wzb8RXvMz3jrxTDUhrmMRg@mail.gmail.com>
Subject: Re: Upstream Milestone
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 13, 2021 at 3:09 PM Alex Gaynor <alex.gaynor@gmail.com> wrote:
>
> I'm not quite sure how I missed the label... this milestone is clearly
> duplicative, I'll remove it. I'll see if I can do something with the
> labels to make them stick out more so I don't miss them!

No worries!

In case you wonder: the `-` and `=E2=80=A2` symbols were chosen as the
"category": Priority and Kind. I picked them as a single symbol to
have something short and elegant (and also make force GitHub sort all
labels by category :-P), similar to what rust-lang/rust does with the
letters (I-, P-, C-, etc.) Hopefully GitHub will implement label
categories...

Cheers,
Miguel
