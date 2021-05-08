Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BB4C43460
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 23:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2EB7613EE
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 23:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhEHXOu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 8 May 2021 19:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhEHXOu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 8 May 2021 19:14:50 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24B9C061573
        for <rust-for-linux@vger.kernel.org>; Sat,  8 May 2021 16:13:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id i128so7116007wma.5
        for <rust-for-linux@vger.kernel.org>; Sat, 08 May 2021 16:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zY7tyECHjeNpa7BKWKeH1Nc5D7tx4ublfuEgj0PK1/E=;
        b=aNNWbOglJkuulfivySEzXkQfRFEchyaaEX6+OZVafOwRGZrOHo4ws6kKRZPKxTuLKl
         Q3inH7BSNbZLIqm4KkzqBse+0IFqszGH6/MQG7MnOrn8wShAYtNNlCDK9z0lZWgFv+8r
         kk30ZuxTcE1l0/9iCuHaK8higKtTdRODxhGp8x6AMCRtg4nqeNbwVW8vdX4PkgGVqvQW
         RaOeiLkxq62PzfPCFcK0Uf0xKfT1l8fEQdT8T3GcPYcBPlXrEmN9KvARP3dT1hsdKggl
         Hcr8TOWrGlsB60WHnXfCV0xA7X5HGQCuFCUw20Yi7qJNjUvek91IeSQCjtCGFKlaAqVl
         xDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zY7tyECHjeNpa7BKWKeH1Nc5D7tx4ublfuEgj0PK1/E=;
        b=uNZ5JRppYzO5I9CkUosGBQFopR1vC+an+Cg77pYcUcWSpTtkhkdmnm6K6hqfubc8uN
         Ya2R2s0qBTGbFOeQOlXjiNCEJIyzONylhABFVNMuIG4E6mvZOALqJG5yk6Un+X5VlfJT
         gh0T2ghrEWTuh7cN7A1WxaKdkjKvZN0vaQQ9ROovJNeQXNcOqZb2NcQQbqkcfP8O0J2D
         Gxvu7ZtAfafYZFtlij4xNKeJZXuGIX3H3zYtYUrygPGAQOHc4haXk7ynT86ZHbLZ1+35
         DWixfJNOPzjyKIMpJGcx2Dssxv5LLPCwjsePVOtWrDLQ8Xqo6pinIAnkysoInJu/C8/A
         QRBg==
X-Gm-Message-State: AOAM533h9KnZvWDk0h8MKyAikkG95AhUb2NbYubtH0/dHKxTel1fEWI3
        MLQ7jViQgohgGja5qoD7ym9REeVVq/RFmk4PEcE=
X-Google-Smtp-Source: ABdhPJyuwTXlfqT95u5iKXZfVXG8z3Qi5TvgV4URX1fslHOf7pld56193EgSHh89xdEIpyWarYMOer3ykzJ26/Y0MuI=
X-Received: by 2002:a05:600c:4982:: with SMTP id h2mr17751407wmp.108.1620515624433;
 Sat, 08 May 2021 16:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
In-Reply-To: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
From:   Leandro Coutinho <lescoutinhovr@gmail.com>
Date:   Sat, 8 May 2021 20:13:33 -0300
Message-ID: <CAN6UTawc=nmv1=T91_Xe1k=AFkOTywzsFqoQYTeue3km6YZYNw@mail.gmail.com>
Subject: Re: Meeting minutes (Sat 8 May 2021)
To:     Robin Randhawa <robin.randhawa@arm.com>
Cc:     rust-for-linux@vger.kernel.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 8, 2021 at 5:24 PM Robin Randhawa <robin.randhawa@arm.com> wrote:
>
> Hi folks.
>
> Summarised meeting minutes (Saturday 8th May 2021)
> --------------------------------------------------
>
> News
> ----
>

Hi!

It would be nice if these meetings were recorded and then shared on YouTube.

The Rust Team does this, eg:
https://www.youtube.com/watch?v=s3DbJGVWeoQ
